Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3819B1548A1
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 16:55:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izjTZ-0008Ha-Pe; Thu, 06 Feb 2020 15:53:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CJ3H=32=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1izjTX-0008HS-Mw
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 15:53:55 +0000
X-Inumbo-ID: e094ef04-48f8-11ea-afe7-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e094ef04-48f8-11ea-afe7-12813bfff9fa;
 Thu, 06 Feb 2020 15:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581004435;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mF78uS2cBaGEpwY9XB8kn9Wl/spmpGAsVQ/FwCGMvCI=;
 b=SaR/oSWmbGhDUXzx13Va2dIG9PEN0mTNOc3PRUwq9Y2gESdARi1f1jDJ
 v68adZVrukgTN+/nvBWRuWzN1YpbeyH2Ey4hCtnHIL3HTcTkDG3OET0WN
 3qlHhcK30qYjKAa+3rDXEq8lYT6tZTDeGPvV51trx3z4Mw0sqk/6nkkNg Q=;
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
IronPort-SDR: 5gmpzZLCmM0xQrwZy98aQOO+ZCN1OQWbtm8pp46whshFL+8riSEvXvyPqX7dGW6FsFavjjHhmW
 JiPFJTDwYleL2pr/VZa99VClb1ucLPweyxqmoES3354BOZgmCKc6EcgSU5ss+LqJ0VGii23a/J
 8xG0XZIvOhFxbGSB9jzLCHYNGaZoh48rH6EewLqjqPuKysDIimdZM4hcG+tOBZmBhqQP1Hpgsz
 OOgJOOuSxHKmeRLLkEF9iHfOoABq0OkfaoB0bFgYcQBtLrgeCP61oBnopbp6NATMcqIGOrfXPH
 pRQ=
X-SBRS: 2.7
X-MesageID: 12231315
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,410,1574139600"; d="scan'208";a="12231315"
Date: Thu, 6 Feb 2020 16:53:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200206155345.GZ4679@Air-de-Roger>
References: <ed08a701-01bd-4cae-0b7f-4872c805470e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed08a701-01bd-4cae-0b7f-4872c805470e@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/p2m: p2m_flags_to_type() deals only
 with "unsigned int"
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMDYsIDIwMjAgYXQgMDQ6MTk6MTRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gUFRFIGZsYWdzLCBmb3Igbm93IGF0IGxlYXN0LCBnZXQgc3RvcmVkIGluICJ1bnNpZ25l
ZCBpbnQiLiBIZW5jZSB0aGVyZSdzCj4gbm8gbmVlZCB0byB3aWRlbiB0aGUgdmFsdWVzIHRvICJ1
bnNpZ25lZCBsb25nIiBiZWZvcmUgcHJvY2Vzc2luZyB0aGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcy4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
