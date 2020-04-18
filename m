Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C0A1AEB0B
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2020 10:57:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPjHS-0003Xi-6K; Sat, 18 Apr 2020 08:56:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kcTk=6C=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1jPjHQ-0003Xd-1o
 for xen-devel@lists.xenproject.org; Sat, 18 Apr 2020 08:56:52 +0000
X-Inumbo-ID: 8ad19d5a-8152-11ea-83d8-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ad19d5a-8152-11ea-83d8-bc764e2007e4;
 Sat, 18 Apr 2020 08:56:51 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1jPjHL-000O86-QX; Sat, 18 Apr 2020 08:56:47 +0000
Date: Sat, 18 Apr 2020 09:56:47 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 04/10] x86/shadow: sh_update_linear_entries() is a no-op
 for PV
Message-ID: <20200418085647.GC92478@deinos.phlegethon.org>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
 <e5457534-6491-b9be-e61d-d669a8e7656e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <e5457534-6491-b9be-e61d-d669a8e7656e@suse.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

At 16:26 +0200 on 17 Apr (1587140817), Jan Beulich wrote:
> Consolidate the shadow_mode_external() in here: Check this once at the
> start of the function.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -3707,34 +3707,30 @@ sh_update_linear_entries(struct vcpu *v)
>       */

This looks good.  Can you please also delete the out-of-date comment
just above that talks about about PAE linear pagetables in PV guests,
to make it clear that PV guests don't need any maintenance here?

Cheers,

Tim.

