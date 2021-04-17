Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 902D73631F7
	for <lists+xen-devel@lfdr.de>; Sat, 17 Apr 2021 21:26:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112247.214360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXqYt-0001fY-3k; Sat, 17 Apr 2021 19:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112247.214360; Sat, 17 Apr 2021 19:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXqYt-0001f9-0O; Sat, 17 Apr 2021 19:24:59 +0000
Received: by outflank-mailman (input) for mailman id 112247;
 Sat, 17 Apr 2021 19:24:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uePU=JO=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lXqYq-0001f4-ND
 for xen-devel@lists.xenproject.org; Sat, 17 Apr 2021 19:24:56 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a744a3c5-97c7-4303-8738-523ba71ecffa;
 Sat, 17 Apr 2021 19:24:55 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lXqYi-000LTl-T2; Sat, 17 Apr 2021 19:24:48 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a744a3c5-97c7-4303-8738-523ba71ecffa
Date: Sat, 17 Apr 2021 20:24:48 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v4] VMX: use a single, global APIC access page
Message-ID: <YHs2AJ6pqrAw7uew@deinos.phlegethon.org>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <1c489e77-6e65-6121-6c28-3c4bd377223c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1c489e77-6e65-6121-6c28-3c4bd377223c@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

Hi,

Apologies for not sending comments before, and thanks for the ping.

At 12:40 +0200 on 12 Apr (1618231248), Jan Beulich wrote:
> The address of this page is used by the CPU only to recognize when to
> access the virtual APIC page instead. No accesses would ever go to this
> page. It only needs to be present in the (CPU) page tables so that
> address translation will produce its address as result for respective
> accesses.
> 
> By making this page global, we also eliminate the need to refcount it,
> or to assign it to any domain in the first place.

What is the aim here?  To save 4k per domain?  It seems to come out
about even for adding and removing code. 

> --- a/xen/arch/x86/mm/shadow/set.c
> +++ b/xen/arch/x86/mm/shadow/set.c
> @@ -94,6 +94,22 @@ shadow_get_page_from_l1e(shadow_l1e_t sl
>      ASSERT(!sh_l1e_is_magic(sl1e));
>      ASSERT(shadow_mode_refcounts(d));
>  
> +    /*
> +     * VMX'es APIC access MFN is just a surrogate page.  It doesn't actually
> +     * get accessed, and hence there's no need to refcount it (and refcounting
> +     * would fail, due to the page having no owner).
> +     */
> +    if ( mfn_valid(mfn = shadow_l1e_get_mfn(sl1e)) )

Would it be better to check specifically for mfn == apic_access_mfn
(and apic_access_mfn != 0, I guess)?  If we want this behaviour for
for all un-owned PGC_extra MFNs it would be good to explain that in the
comments.

Cheers,

Tim.

