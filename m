Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 548F2126DE5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 20:23:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii1LD-00083X-6A; Thu, 19 Dec 2019 19:20:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tNyU=2J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ii1LC-000804-FH
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 19:20:06 +0000
X-Inumbo-ID: 8b0a86e6-2294-11ea-b6f1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b0a86e6-2294-11ea-b6f1-bc764e2007e4;
 Thu, 19 Dec 2019 19:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576783197;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=RqIr6/EdDehgdv0yM39DT787hWx9S27+0rtGhAqwARQ=;
 b=fW2uANfF5w1I0jCmTWu9TeDjWyLyAzTMBg8HuEmwxQLJWfALYDpWehWC
 YXG+extXk2jY5L3LizAktSP1TtUvSy8YbFT+wHQ7dfTYqMgQXxnBj0V82
 3sQbvw7fj+X2y57MErV3MsrnndIXAItqTQGRZlY4uNbAg3v+V6yjaCIdB E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2Xo2OZk9kxJDfr32uK/LM79r3bv1QPMG0Qy9YzIVvCTqyk7mt/QBQ4UhpcGadl8C4P2u+C2fDB
 BbrEUsRJCKdvacr/36UCAGc4cv1VbwQiLFh5f8KNTbYbUeZYrvQzI74hjaSjBBVGPvg3pi4BTX
 GxhX9YJTX2FjPqWkweRTAkjra/aiT73AOE0fEObFzU2KFbdBLmCNfJAeC8yDJJInfmbImMikjo
 mw+MYW2y+yOJGO9b2tOmFhs9il/9PGgfCD2Oq+N7GLaATyJJqVQlkzrOey1QQNXiYt0Tl7l61o
 MCI=
X-SBRS: 2.7
X-MesageID: 10372839
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,333,1571716800"; d="scan'208";a="10372839"
To: Tamas K Lengyel <tamas.lengyel@intel.com>, <xen-devel@lists.xenproject.org>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <ee8bbcff3b5e7cb1d614eb57df2449222193ad82.1576697796.git.tamas.lengyel@intel.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <25571b3b-db88-391f-713f-d37ebd4b08b7@citrix.com>
Date: Thu, 19 Dec 2019 19:19:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ee8bbcff3b5e7cb1d614eb57df2449222193ad82.1576697796.git.tamas.lengyel@intel.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 07/20] x86/mem_sharing: don't try to
 unshare twice during page fault
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMTIvMjAxOSAxOTo0MCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IEBAIC0xOTU5LDE5
ICsxOTY1LDIxIEBAIGludCBodm1faGFwX25lc3RlZF9wYWdlX2ZhdWx0KHBhZGRyX3QgZ3BhLCB1
bnNpZ25lZCBsb25nIGdsYSwKPiAgICAgICAqLwo+ICAgICAgaWYgKCBwYWdlZCApCj4gICAgICAg
ICAgcDJtX21lbV9wYWdpbmdfcG9wdWxhdGUoY3VycmQsIGdmbik7Cj4gKwo+ICsjaWZkZWYgQ09O
RklHX01FTV9TSEFSSU5HCj4gICAgICBpZiAoIHNoYXJpbmdfZW5vbWVtICkKPiAgICAgIHsKPiAt
ICAgICAgICBpbnQgcnY7Cj4gLQo+IC0gICAgICAgIGlmICggKHJ2ID0gbWVtX3NoYXJpbmdfbm90
aWZ5X2Vub21lbShjdXJyZCwgZ2ZuLCB0cnVlKSkgPCAwICkKPiArICAgICAgICBpZiAoICF2bV9l
dmVudF9jaGVja19yaW5nKGN1cnJkLT52bV9ldmVudF9zaGFyZSkgKQo+ICAgICAgICAgIHsKPiAg
ICAgICAgICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgIkRvbWFpbiAlaHUgYXR0ZW1wdCB0byB1
bnNoYXJlICIKPiAtICAgICAgICAgICAgICAgICAgICAgImdmbiAlbHgsIEVOT01FTSBhbmQgbm8g
aGVscGVyIChyYyAlZClcbiIsCj4gLSAgICAgICAgICAgICAgICAgICAgIGN1cnJkLT5kb21haW5f
aWQsIGdmbiwgcnYpOwo+ICsgICAgICAgICAgICAgICAgICAgICAiZ2ZuICVseCwgRU5PTUVNIGFu
ZCBubyBoZWxwZXJcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgIGN1cnJkLT5kb21haW5faWQs
IGdmbik7CgpBcyBvYnNlcnZhdGlvbnMgb24gdGhpcyBhbmQgbGF0ZXIgcGF0Y2hlcy7CoCBVc2Ug
JXBkIChnZXRzIGQldSBvciBkW05BTUVdCmFzIGFwcGxpY2FibGUpLCBlc3BlY2lhbGx5IHdlcmUg
ZFtDT1ddIGlzIGEgbGlhYmxlIGRvbWlkIHRvIGdldC4KCkFsc28sIGFueSBhY3Rpb24gd2hpY2gg
Y3Jhc2hlcyBhIGRvbWFpbiBtdXN0IG5vdCBiZSBhIGdkcHJpbnRrKCksCmJlY2F1c2Ugb3RoZXJ3
aXNlIHlvdSBlbmQgdXAgd2l0aCBhIGRvbWFpbl9jcmFzaCgpIGFuZCBubwpjb250ZXh0L3N5bXB0
b21zIGluIHJlbGVhc2UgYnVpbGRzIG9mIFhlbi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
