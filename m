Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C03A529F62B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 21:27:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14686.36305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYEWB-00087i-PL; Thu, 29 Oct 2020 20:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14686.36305; Thu, 29 Oct 2020 20:27:31 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYEWB-00087M-MF; Thu, 29 Oct 2020 20:27:31 +0000
Received: by outflank-mailman (input) for mailman id 14686;
 Thu, 29 Oct 2020 20:27:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1VJZ=EE=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1kYEWA-00087E-6e
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:27:30 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e08d0d0-cfec-40bb-b073-815e71a49c29;
 Thu, 29 Oct 2020 20:27:29 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1kYEW7-000LLR-AI; Thu, 29 Oct 2020 20:27:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1VJZ=EE=xen.org=tim@srs-us1.protection.inumbo.net>)
	id 1kYEWA-00087E-6e
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:27:30 +0000
X-Inumbo-ID: 4e08d0d0-cfec-40bb-b073-815e71a49c29
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4e08d0d0-cfec-40bb-b073-815e71a49c29;
	Thu, 29 Oct 2020 20:27:29 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
	(envelope-from <tim@xen.org>)
	id 1kYEW7-000LLR-AI; Thu, 29 Oct 2020 20:27:27 +0000
Date: Thu, 29 Oct 2020 20:27:27 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH v3 3/3] x86/shadow: sh_{make,destroy}_monitor_table() are
 "even more" HVM-only
Message-ID: <20201029202727.GB81685@deinos.phlegethon.org>
References: <d09b0690-c5e0-a90b-b4c0-4396a5f62c59@suse.com>
 <cd39abe3-5a5c-6ebc-a11e-3d4ed1d74907@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <cd39abe3-5a5c-6ebc-a11e-3d4ed1d74907@suse.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 10:45 +0200 on 19 Oct (1603104300), Jan Beulich wrote:
> With them depending on just the number of shadow levels, there's no need
> for more than one instance of them, and hence no need for any hook (IOW
> 452219e24648 ["x86/shadow: monitor table is HVM-only"] didn't go quite
> far enough). Move the functions to hvm.c while dropping the dead
> is_pv_32bit_domain() code paths.
>
> While moving the code, replace a stale comment reference to
> sh_install_xen_entries_in_l4(). Doing so made me notice the function
> also didn't have its prototype dropped in 8d7b633adab7 ("x86/mm:
> Consolidate all Xen L4 slot writing into init_xen_l4_slots()"), which
> gets done here as well.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tim Deegan <tim@xen.org>

> TBD: In principle both functions could have their first parameter
>      constified. In fact, "destroy" doesn't depend on the vCPU at all
>      and hence could be passed a struct domain *. Not sure whether such
>      an asymmetry would be acceptable.
>      In principle "make" would also not need passing of the number of
>      shadow levels (can be derived from v), which would result in yet
>      another asymmetry.
>      If these asymmetries were acceptable, "make" could then also update
>      v->arch.hvm.monitor_table, instead of doing so at both call sites.

Feel free to add consts, but please don't change the function
parameters any more than that.  I would rather keep them as a matched
pair, and leave the hvm.monitor_table updates in the caller, where
it's easier to see why they're not symmetrical.

Cheers

Tim.

