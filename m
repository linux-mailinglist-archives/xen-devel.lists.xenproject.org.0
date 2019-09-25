Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD5ABDBD5
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 12:05:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD48W-00080i-BW; Wed, 25 Sep 2019 10:03:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ACI=XU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iD48V-00080c-MP
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 10:03:03 +0000
X-Inumbo-ID: a93adb54-df7b-11e9-bf31-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id a93adb54-df7b-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 10:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569405783;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hksaEC4k8ljhPD7xCWajU6kN+LFRQHUOA4XKki4BvCI=;
 b=RgSsey1V6wgEEhbHdyC5qlWMzPYuvkUUVIo+n/Loldd9VLsCkPfsUsRD
 axEILdjzjmlWBWJTsy0ROEM1Zkno1HBEZW36PwoVmWNIAh/PQBzBbf5s9
 Laa8GFVrKtFpvyxtFzRlKc1Qea2V6X6G1gz49of5Fw811fKJbS7QlxexO I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wrmylKDXHPR2jyC2Bifbaw8EQ+JdPrlnz2fSNc3KIyGQo/DcMuXDJL0sVaCyi+WIX5C3bV8a7q
 WHNi2zWkfS5c8GUn7scLHlJzQF5uihx8JBUTv0jP7LIT5hHVVF8MYqaau2QJJhngd8Bg4kbt3U
 AsFr8vHbeKqx/N+ih9wQ985VU99mIIv9hu5R65vICB0yZd7Kxml4WRMDG9XsDiyNUWz0Powr6c
 dsL0P0GG5vXf6Hb0ZQ/GJjoKYUyPPKoAvlzLB9y5utmvQx+w6FLbMzZBfScuO/bO3X13eQVo7A
 YGA=
X-SBRS: 2.7
X-MesageID: 6042148
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,547,1559534400"; 
   d="scan'208";a="6042148"
Date: Wed, 25 Sep 2019 12:02:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20190925100255.xcmzasxvnsmuj5ne@Air-de-Roger>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190923100931.29670-3-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923100931.29670-3-liuwe@microsoft.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH for-next RFC 2/8] x86: include asm_defns.h
 directly in hypercall.h
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMTE6MDk6MjVBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBBU01fQ0FMTF9DT05TVFJBSU5UIGlzIGRlZmluZWQgdGhlcmUuCj4gCj4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNv
bT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
ClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
