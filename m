Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110D211AA5D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 12:59:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if0bI-00041k-8F; Wed, 11 Dec 2019 11:56:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=irg7=2B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1if0bG-00041f-PZ
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 11:56:14 +0000
X-Inumbo-ID: 3ad363e2-1c0d-11ea-8b18-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ad363e2-1c0d-11ea-8b18-12813bfff9fa;
 Wed, 11 Dec 2019 11:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576065374;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=x+mOS5NASMRzp3pD2IpuENxWuCCrbFLiS87vKIsLe/U=;
 b=Pfo6yEpN/j8IKEogAgu4tisJqSgjIApoM2r0wjzDRarFefbaNG1ifI5f
 hm8onOzzSVGNv7mnfLwVzlj2OjYZi1wiwYNudvB/pMbinP2VvWG/PWKKm
 j5Rp/58M1XhMvfiAA6ZBApODkYZ42W9VEcAmpb/d1yM3JEkL7IpUoFUTJ I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YA8PlSwaIQJsapTXNoWtgaI8GoZmb2RIdgt2QMy2CcTvDuGW4n1JrXzz6WMJUo6uwpHVUeZVek
 17D58EKrVRRybk1Qg9oW9Z+mDb8Feenq91lvB9ROCrgGdEPsdAMM9xEql1q0kRR2hdaunVvbPO
 pBvTCI2R4AlibRPiRdl7mC2rOrKW5T1Rw+PuTomAFES+jWAz1xr327+SBothLRVlAsl8WBxq9c
 8IX+y6ZePZF+6tAayYDrmqntYpAlZz2Zb/hh8JoBuWIp7RxdXwSd45mdTMOCOoIRi2JYYnRszX
 P2c=
X-SBRS: 2.7
X-MesageID: 9646652
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,301,1571716800"; 
   d="scan'208";a="9646652"
Date: Wed, 11 Dec 2019 12:56:06 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: SeongJae Park <sj38.park@gmail.com>
Message-ID: <20191211115606.GO980@Air-de-Roger>
References: <20191211042428.5961-1-sjpark@amazon.de>
 <20191211042733.6143-1-sjpark@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211042733.6143-1-sjpark@amazon.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v6 3/3] xen/blkback: Remove unnecessary
 static variable name prefixes
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
Cc: jgross@suse.com, axboe@kernel.dk, sjpark@amazon.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae
 Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMTEsIDIwMTkgYXQgMDQ6Mjc6MzNBTSArMDAwMCwgU2VvbmdKYWUgUGFyayB3
cm90ZToKPiBBIGZldyBvZiBzdGF0aWMgdmFyaWFibGVzIGluIGJsa2JhY2sgaGF2ZSAneGVuX2Js
a2lmXycgcHJlZml4LCB0aG91Z2ggaXQKPiBpcyB1bm5lY2Vzc2FyeSBmb3Igc3RhdGljIHZhcmlh
Ymxlcy4gIFRoaXMgY29tbWl0IHJlbW92ZXMgc3VjaCBwcmVmaXhlcy4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBTZW9uZ0phZSBQYXJrIDxzanBhcmtAYW1hem9uLmRlPgoKVGhhbmtzLgoKUmV2aWV3ZWQt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
