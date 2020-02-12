Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A30D15AE7A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 18:12:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1vW2-00018J-Pq; Wed, 12 Feb 2020 17:09:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zgzp=4A=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j1vW1-00018E-MJ
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 17:09:33 +0000
X-Inumbo-ID: 6fb27c22-4dba-11ea-b7a2-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fb27c22-4dba-11ea-b7a2-12813bfff9fa;
 Wed, 12 Feb 2020 17:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581527372;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dHbWw4hmLdgizOaAnWdT/rDQ6dzN87B2/n+BkhZP+m8=;
 b=hk8SoyqXq0ZUC1i3SOtsnKzRsXl5SbLFIAMgX+2dB9ZOV/cjJUaGAlpY
 /5jSkFQG7dq9LuHzp/mAYNv8gNTH5aMiMmxOzQi84wTd0+7fsqjUoCXV3
 AR2rSsE8l78uhDwpjsXY3DeNllEbY1CrPOtQqZot450RvdMYR7mVBnmM0 U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4zVqjF/tnePuB6Flnw0aHmcGIEJa4YNLwNrZJBJuf/swFY+DGeb1CgV0CDuCY2KCgo1kR8KooM
 6iSjyhuxbgCzQR/fPps9LzlJlDNYRt11aSgSZJEdilYIXGqaCUSt+3hUQJdQb++sSC2798+6qy
 V7poHQ8mslULkksyNAzxnrOXLZYZHovJPC1LlfDHJq+KZh7JmlnV73j+REKDJZbK1FzbJFbS+i
 KmgzwgNiA/5ElPXFUAZ4Iml/6Au6bJaxcfhK84itERVf95NMjEg34hMqKzoxpigQe+9BGLVdSl
 eHU=
X-SBRS: 2.7
X-MesageID: 12718360
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,433,1574139600"; d="scan'208";a="12718360"
Date: Wed, 12 Feb 2020 18:09:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200212170924.GT4679@Air-de-Roger>
References: <20200212160918.18470-1-liuwe@microsoft.com>
 <20200212160918.18470-4-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212160918.18470-4-liuwe@microsoft.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 3/4] x86/hyperv: skeleton for L0 assisted
 TLB flush
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTIsIDIwMjAgYXQgMDQ6MDk6MTdQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBJbXBsZW1lbnQgYSBiYXNpYyBob29rIGZvciBMMCBhc3Npc3RlZCBUTEIgZmx1c2guIFRoZSBo
b29rIG5lZWRzIHRvCj4gY2hlY2sgaWYgcHJlcmVxdWlzaXRlcyBhcmUgbWV0LiBJZiB0aGV5IGFy
ZSBub3QgbWV0LCBpdCByZXR1cm5zIGFuIGVycm9yCj4gbnVtYmVyIHRvIGZhbGwgYmFjayB0byBu
YXRpdmUgZmx1c2hlcy4KPiAKPiBJbnRyb2R1Y2UgYSBuZXcgdmFyaWFibGUgdG8gaW5kaWNhdGUg
aWYgaHlwZXJjYWxsIHBhZ2UgaXMgcmVhZHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8
bGl1d2VAbWljcm9zb2Z0LmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9N
YWtlZmlsZSAgfCAgMSArCj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgIHwg
MTcgKysrKysrKysrKysrCj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oIHwg
IDQgKysrCj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvdGxiLmMgICAgIHwgNDEgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25z
KCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3RsYi5j
Cj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUgYi94
ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlCj4gaW5kZXggNjgxNzAxMDlhOS4uMTg5
MDJjMzNlOSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxl
Cj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+IEBAIC0xICsxLDIg
QEAKPiAgb2JqLXkgKz0gaHlwZXJ2Lm8KPiArb2JqLXkgKz0gdGxiLm8KPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnYvaHlwZXJ2LmMKPiBpbmRleCBiNzA0NGY3MTkzLi4xY2RjODhlMjdjIDEwMDY0NAo+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiArKysgYi94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gQEAgLTMzLDYgKzMzLDggQEAgREVGSU5FX1BFUl9D
UFVfUkVBRF9NT1NUTFkodm9pZCAqLCBodl9pbnB1dF9wYWdlKTsKPiAgREVGSU5FX1BFUl9DUFVf
UkVBRF9NT1NUTFkodm9pZCAqLCBodl92cF9hc3Npc3QpOwo+ICBERUZJTkVfUEVSX0NQVV9SRUFE
X01PU1RMWSh1aW50MzJfdCwgaHZfdnBfaW5kZXgpOwo+ICAKPiArc3RhdGljIGJvb2wgX19yZWFk
X21vc3RseSBodl9oY2FsbF9wYWdlX3JlYWR5Owo+ICsKPiAgc3RhdGljIHVpbnQ2NF90IGdlbmVy
YXRlX2d1ZXN0X2lkKHZvaWQpCj4gIHsKPiAgICAgIHVuaW9uIGh2X2d1ZXN0X29zX2lkIGlkID0g
e307Cj4gQEAgLTExOSw2ICsxMjEsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfaHlwZXJj
YWxsX3BhZ2Uodm9pZCkKPiAgICAgIEJVR19PTighaHlwZXJjYWxsX21zci5lbmFibGUpOwo+ICAK
PiAgICAgIHNldF9maXhtYXBfeChGSVhfWF9IWVBFUlZfSENBTEwsIG1mbiA8PCBQQUdFX1NISUZU
KTsKPiArCj4gKyAgICBodl9oY2FsbF9wYWdlX3JlYWR5ID0gdHJ1ZTsKCkkgZ3Vlc3MgZmlsbGlu
ZyB0aGUgaHlwZXJjYWxsIHBhZ2UgaW4gdGhlIHByb2JlIGZ1bmN0aW9uIGxpa2UgaXQncwpkb25l
IGZvciBYZW4gaXMgdG9vIGVhcmx5IGZvciBIeXBlclYsIGFuZCBoZW5jZSB5b3UgbmVlZCB0aGlz
CnNhZmVndWFyZD8KClRCSCwgbWF5YmUgaXQgd291bGQgYmUgYmVzdCAoYW5kIHNhZmVyKSB0byBw
cmV2ZW50IHVzaW5nIGFueSBob29rcwp1bnRpbCBzZXR1cCBoYXMgYmVlbiBjYWxsZWQsIGFuZCBo
ZW5jZSB0aGlzIGNoZWNrIGNvdWxkIGJlIHB1bGxlZCBpbnRvCnRoZSBnZW5lcmljIGhvb2s/CgpU
aGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
