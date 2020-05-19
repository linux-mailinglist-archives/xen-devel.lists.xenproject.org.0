Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3879B1D92D8
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 11:02:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jay8s-00089y-Kg; Tue, 19 May 2020 09:02:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPOd=7B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jay8r-00089t-4h
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 09:02:29 +0000
X-Inumbo-ID: 76e13772-99af-11ea-b9cf-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76e13772-99af-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 09:02:28 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: IUQcCtOhP4PrdXx2PlZTuKCKevbwnBlfPV5ArJdEVGrZJd/vFqqiZkL2JhnSLazzG3KyPo0VTr
 hxud0AzWeWjxBLJe8LtTSVvFrZyKku2ARMPU+U4I0C7/M4wvFFrlgW+qWZlkaXES3s9ljOUzX2
 8bWtYFBSDoqmPotu6/rU91AtsEs6qy4IcfvUxuwfBr2ab+csVCCUaV1N9ZDZwJyoojRRaxAa/9
 D5aDYuVmteaKaiZXLZSyH5PU2/x7ik/Gb7eZRG79d4njnsBN+ABzsR9qdvcw9Nl/P9USUO+E1W
 Ua4=
X-SBRS: 2.7
X-MesageID: 18568271
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,409,1583211600"; d="scan'208";a="18568271"
Date: Tue, 19 May 2020 11:02:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 2/3] x86: relax LDT check in arch_set_info_guest()
Message-ID: <20200519090220.GA54375@Air-de-Roger>
References: <b7a1a7fe-0bc5-1654-ff1c-e5eb787c579e@suse.com>
 <c36cac91-49ae-6bb2-b057-195031979d21@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c36cac91-49ae-6bb2-b057-195031979d21@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Dec 20, 2019 at 02:50:06PM +0100, Jan Beulich wrote:
> It is wrong for us to check the base address when there's no LDT in the
> first place. Once we don't do this check anymore we can also set the
> base address to a non-canonical value when the LDT is empty.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I wonder if a ldt_ents check should also be added to
pv_map_ldt_shadow_page in order to avoid trying to get the mapping of
the LDT.

Thanks, Roger.

