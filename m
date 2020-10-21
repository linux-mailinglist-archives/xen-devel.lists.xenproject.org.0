Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA342294B66
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 12:46:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9998.26359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVBd7-0007j4-8M; Wed, 21 Oct 2020 10:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9998.26359; Wed, 21 Oct 2020 10:46:05 +0000
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
	id 1kVBd7-0007ii-5K; Wed, 21 Oct 2020 10:46:05 +0000
Received: by outflank-mailman (input) for mailman id 9998;
 Wed, 21 Oct 2020 10:46:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kVBd6-0007id-Af
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:46:04 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff526090-a319-40e3-b1a6-e6954c111253;
 Wed, 21 Oct 2020 10:46:03 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kVBd6-0007id-Af
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:46:04 +0000
X-Inumbo-ID: ff526090-a319-40e3-b1a6-e6954c111253
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ff526090-a319-40e3-b1a6-e6954c111253;
	Wed, 21 Oct 2020 10:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603277164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gIEQ33dXgjTvkAJ6j0Oyq0xbArK2F/V3iU4JiWwzL+U=;
  b=E+6uRVVBQm9FmHmszj/ChnMSpOAGQIkdO/uy5uOnHj0WxGTwJ7/pKDVC
   YCTPlvo1AMxOTlCnxxD7cy8HkQCbvy2ixICyszZqnvF2NtH/b8iKIl1aq
   I3492Z06HuqjuJ1E+MswPQd1CZMlU+EbIVZF3pnSlESWOwjU4WcLDstK9
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: axAjVyzTwrXwLLDYdBja0/JJm//svAONa2OIk52CGar0CNjnvRBdcQtyn2XD3PGBbMTcQqxVBl
 fA4JFPaK1nb9Wvpv8NQnTi2JQt0QSxnJ9cTV0OBwkNGYx0B4QZVslGaOOl2Ixoguv1kYaHk4gp
 bDC6XxoFcSyds2Szblb93b1ssLNcY+UyAea15/cyt7A+gaH4ERDpuo2jomkA9rySpmjg6r0Bze
 p0xZX5mciKE2EexMZilStEh/lKu/4lWMLcFwwjLIS76UkY0EYAnztn1nQT+2nmKdW2p405dKui
 XMg=
X-SBRS: 2.5
X-MesageID: 29799057
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,401,1596513600"; 
   d="scan'208";a="29799057"
Date: Wed, 21 Oct 2020 12:45:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v3 3/3] x86/shadow: sh_{make,destroy}_monitor_table() are
 "even more" HVM-only
Message-ID: <20201021104550.zhlxcqia3cqwmyju@Air-de-Roger>
References: <d09b0690-c5e0-a90b-b4c0-4396a5f62c59@suse.com>
 <cd39abe3-5a5c-6ebc-a11e-3d4ed1d74907@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd39abe3-5a5c-6ebc-a11e-3d4ed1d74907@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Mon, Oct 19, 2020 at 10:45:00AM +0200, Jan Beulich wrote:
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

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v3: New.
> ---
> TBD: In principle both functions could have their first parameter
>      constified. In fact, "destroy" doesn't depend on the vCPU at all
>      and hence could be passed a struct domain *. Not sure whether such
>      an asymmetry would be acceptable.
>      In principle "make" would also not need passing of the number of
>      shadow levels (can be derived from v), which would result in yet
>      another asymmetry.

I'm not specially fuzzed either way - having const v would be good
IMO.

Thanks, Roger.

