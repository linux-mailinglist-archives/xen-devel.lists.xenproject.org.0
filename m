Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52872300D3D
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 21:02:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73088.131767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l32dg-0007Mq-9x; Fri, 22 Jan 2021 20:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73088.131767; Fri, 22 Jan 2021 20:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l32dg-0007MR-6p; Fri, 22 Jan 2021 20:02:36 +0000
Received: by outflank-mailman (input) for mailman id 73088;
 Fri, 22 Jan 2021 20:02:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j0/X=GZ=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1l32dd-0007MM-PZ
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 20:02:33 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0462c1c-8301-4e65-8830-96a0072ae3de;
 Fri, 22 Jan 2021 20:02:32 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1l32dZ-000HwO-Vb; Fri, 22 Jan 2021 20:02:29 +0000
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
X-Inumbo-ID: f0462c1c-8301-4e65-8830-96a0072ae3de
Date: Fri, 22 Jan 2021 20:02:29 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 15/17] x86/shadow: drop SH_type_l2h_pae_shadow
Message-ID: <YAsvVUUqSQ9bUK32@deinos.phlegethon.org>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <c412bbe4-d555-7d36-997c-92274679d9ae@suse.com>
 <YArPAicNIR0H5Q0y@deinos.phlegethon.org>
 <c8de294c-ae72-aebf-a893-790c84efdc97@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <c8de294c-ae72-aebf-a893-790c84efdc97@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

Hi,

At 17:31 +0100 on 22 Jan (1611336662), Jan Beulich wrote:
> On 22.01.2021 14:11, Tim Deegan wrote:
> > At 16:10 +0100 on 14 Jan (1610640627), Jan Beulich wrote:
> >> hash_{domain,vcpu}_foreach() have a use each of literal 15. It's not
> >> clear to me what the proper replacement constant would be, as it
> >> doesn't look as if SH_type_monitor_table was meant.
> > 
> > Good spot.  I think the '<= 15' should be replaced with '< SH_type_unused'.
> > It originally matched the callback arrays all being coded as
> > "static hash_callback_t callbacks[16]".
> 
> So are you saying this was off by one then prior to this patch
> (when SH_type_unused was still 17), albeit in apparently a
> benign way?

Yes - this assertion is just to catch overruns of the callback table,
and so it was OK for its limit to be too low.  The new types that were
added since then are never put in the hash table, so don't trigger
this assertion.

> And the comments in sh_remove_write_access(),
> sh_remove_all_mappings(), sh_remove_shadows(), and
> sh_reset_l3_up_pointers() are then wrong as well, and would
> instead better be like in shadow_audit_tables()?

Yes, it looks like those comments are also out of date where they
mention 'unused'.

> Because of this having been benign (due to none of the callback
> tables specifying non-NULL entries there), wouldn't it make
> sense to dimension the tables by SH_type_max_shadow + 1 only?
> Or would you consider this too risky?

Yes, I think that would be fine, also changing '<= 15' to
'<= SH_type_max_shadow'.  Maybe add a matching
ASSERT(t <= SH_type_max_shadow) in shadow_hash_insert as well?

Cheers,

Tim.

