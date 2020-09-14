Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3212691FB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 18:45:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHrav-0001F8-I0; Mon, 14 Sep 2020 16:44:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odsp=CX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kHrau-0001F3-AH
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 16:44:44 +0000
X-Inumbo-ID: 6b86292e-327c-4e0f-a8d6-8e82e4f4a9dc
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b86292e-327c-4e0f-a8d6-8e82e4f4a9dc;
 Mon, 14 Sep 2020 16:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600101882;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=p/aTq1oNs06wY+zSNjbe0LpTvGLDhzYM1OOJalPLncc=;
 b=E7kfjDuJfM7vc5LE2PUaTqKEDZzyQ3yIL/KSlNmQpPBOqkTK2XOPzT15
 ug0CeW7ROf5DwlRkZsnGm8xtAAotOEPcSpuM/1ITRTuCva9DHyu+Rh3/n
 a9of6sgPVQGyvguF91ayFo4F7BZHD1T5MNSsQUGBVUl+DyPuOx4wHGI8w c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: siuZc3VcDQedxlLIwP9NuD9Mr7ubMcKrTuNhbo7KB+aSfND9VY7ZqvU9TcvYMHOY1NhvN+EAmW
 pPDnSbX8idH/EQh8gAAIP3Sea4PMKAlQDkiGr56j0mItxKkxWmCdMNCBuCTHmfJCsPZTCig4Cv
 VaZZv/x3G5NsHc3KicajmP8d+w22/JZesEJxR/OvpplwLm1+ccO8jq4/GIRVHA0HSgWPdDJP87
 +kUHzB/uc8yQyTp5MWHW2ri9pbRujroCVNVxuE6Sv991qyYUPsA82yECkLTkI0TP5QtedbVUyV
 BUc=
X-SBRS: 2.7
X-MesageID: 26944771
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,426,1592884800"; d="scan'208";a="26944771"
Date: Mon, 14 Sep 2020 18:44:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 1/3] x86/shim: fix build with PV_SHIM_EXCLUSIVE and
 SHADOW_PAGING
Message-ID: <20200914164412.GI753@Air-de-Roger>
References: <5d86a23c-5dea-8697-9ba1-900d35b99695@suse.com>
 <3ddb9adf-22b5-9196-1f3c-7cb3cafd08dd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ddb9adf-22b5-9196-1f3c-7cb3cafd08dd@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Sep 14, 2020 at 02:38:49PM +0200, Jan Beulich wrote:
> While there's little point in enabling both, the combination ought to at
> least build correctly. Drop the direct PV_SHIM_EXCLUSIVE conditionals
> and instead zap PG_log_dirty to zero under the right conditions, and key
> other #ifdef-s off of that.
> 
> While there also expand on ded576ce07e9 ("x86/shadow: dirty VRAM
> tracking is needed for HVM only"): There was yet another is_hvm_domain()
> missing, and code touching the struct fields needs to be guarded by
> suitable #ifdef-s as well. While there also guard shadow-mode-only
> fields accordingly.
> 
> Fixes: 8b5b49ceb3d9 ("x86: don't include domctl and alike in shim-exclusive builds")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

We seem to be growing more and more ifdefs which is not ideal IMO, we
should rather aim to remove them by splitting code into separate
compilation units. There doesn't seem to be much option to split
stuff in this case, so be it.

Thanks, Roger.

