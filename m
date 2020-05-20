Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492181DABAB
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 09:11:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbIru-0000O9-4A; Wed, 20 May 2020 07:10:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RvRK=7C=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1jbIrs-0000O4-Vv
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 07:10:21 +0000
X-Inumbo-ID: f6dc6910-9a68-11ea-9887-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6dc6910-9a68-11ea-9887-bc764e2007e4;
 Wed, 20 May 2020 07:10:20 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1jbIrm-000Dvy-0I; Wed, 20 May 2020 07:10:14 +0000
Date: Wed, 20 May 2020 08:10:13 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/traps: Rework #PF[Rsvd] bit handling
Message-ID: <20200520071013.GA53525@deinos.phlegethon.org>
References: <20200518153820.18170-1-andrew.cooper3@citrix.com>
 <2783ddc5-9919-3c97-ba52-2f734e7d72d5@suse.com>
 <62d4999b-7db3-bac6-28ed-bb636347df38@citrix.com>
 <3088e420-a72a-1b2d-144f-115610488418@suse.com>
 <1750cbe5-ef48-6dc7-e372-cbc0a8cbc9cc@citrix.com>
 <4a5c33c0-9245-126b-123e-3980a9135190@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <4a5c33c0-9245-126b-123e-3980a9135190@suse.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

At 18:09 +0200 on 19 May (1589911795), Jan Beulich wrote:
> static inline int sh_type_has_up_pointer(struct domain *d, unsigned int t)
> {
>     /* Multi-page shadows don't have up-pointers */
>     if ( t == SH_type_l1_32_shadow
>          || t == SH_type_fl1_32_shadow
>          || t == SH_type_l2_32_shadow )
>         return 0;
>     /* Pinnable shadows don't have up-pointers either */
>     return !sh_type_is_pinnable(d, t);
> }
> 
> It's unclear to me in which way SH_type_l1_32_shadow and
> SH_type_l2_32_shadow are "multi-page" shadows; I'd rather have
> expected all three SH_type_fl1_*_shadow to be. Tim?

They are multi-page in the sense that the shadow itself is more than a
page long (because it needs to have 1024 8-byte entries).

The FL1 shadows are the same size as their equivalent L1s.

Tim.

