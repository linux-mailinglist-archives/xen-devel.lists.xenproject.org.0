Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D680EE3AE
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 16:24:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iReBf-0007Jc-Ra; Mon, 04 Nov 2019 15:22:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kevs=Y4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iReBe-0007JV-7X
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 15:22:34 +0000
X-Inumbo-ID: eba40c9e-ff16-11e9-a181-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eba40c9e-ff16-11e9-a181-12813bfff9fa;
 Mon, 04 Nov 2019 15:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572880952;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=B/D6BeJaxmnFiAOmJV8cU0hcxHodXp2qLpPkU8uHnjM=;
 b=RkvL/PLudH8hkovVJKhylmO1od0jNE/fx8DXkallj4picqlnolc06hO1
 Y+zU4qe0VvCULKEcqI1c9qoVwnMokrwzXbmJQaclthZ1LeJRthUoPC6nK
 rMzSBpLBBjF4p6SHlVjWq39hkVTPbu76jG7THHB7LvWJ4fJEwcDXajXNH c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3DhlOl5SpyEN7wBqjjnIvFBdQmlTjt7Na9tqaai4d0V1pxB1iCKF+/e5oMNgWHXAoUG+0EmAfN
 qNRQkG88lfe5CL8usl1PDJrmIezw9zGuY+WFRaRpGgarhHIOjGNnBCwCulXq2jyqUaF61ApHOY
 wUFIp+4GTzv4ANyfJ2jSrQWGrCbMAD6wwCn7fYktvw5mRZh6X5oUctkhnFQNA6tccQXwCzTsjq
 8/RXp3PK8BSUg5NXPwQuUheEnWaipAFYStJ3+rs4PUbeDxfHLZTPp6zllnMV4uiASsMDeTDLFQ
 XYw=
X-SBRS: 2.7
X-MesageID: 8300730
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,267,1569297600"; 
   d="scan'208";a="8300730"
To: Jan Beulich <jbeulich@suse.com>
References: <20191101202502.31750-1-andrew.cooper3@citrix.com>
 <20191101202502.31750-2-andrew.cooper3@citrix.com>
 <618aa239-278d-ab34-0f91-3cf7f257a612@suse.com>
 <447d5543-dcca-0126-b987-7b5de86e7c66@citrix.com>
 <77d8c562-2541-3d69-f03b-451dad94751e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <708290ba-9d5f-1ec7-889a-1e90488a6016@citrix.com>
Date: Mon, 4 Nov 2019 15:22:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <77d8c562-2541-3d69-f03b-451dad94751e@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/3] x86/boot: Remove cached CPUID data from
 the trampoline
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMTEvMjAxOSAxNTowMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDQuMTEuMjAxOSAx
NTo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDQvMTEvMjAxOSAxMzoyNSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwMS4xMS4yMDE5IDIxOjI1LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvaW50ZWwuYwo+Pj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9jcHUvaW50ZWwuYwo+Pj4+IEBAIC0yNzAsNiArMjcwLDcgQEAgc3RhdGljIHZvaWQgZWFy
bHlfaW5pdF9pbnRlbChzdHJ1Y3QgY3B1aW5mb194ODYgKmMpCj4+Pj4gIAlpZiAoZGlzYWJsZSkg
ewo+Pj4+ICAJCXdybXNybChNU1JfSUEzMl9NSVNDX0VOQUJMRSwgbWlzY19lbmFibGUgJiB+ZGlz
YWJsZSk7Cj4+Pj4gIAkJYm9vdHN5bSh0cmFtcG9saW5lX21pc2NfZW5hYmxlX29mZikgfD0gZGlz
YWJsZTsKPj4+PiArCQlib290c3ltKHRyYW1wb2xpbmVfZWZlcikgfD0gRUZFUl9OWDsKPj4+PiAg
CX0KPj4+IEknbSBmaW5lIHdpdGggYWxsIG90aGVyIGNoYW5nZXMgaGVyZSwganVzdCB0aGlzIG9u
ZSBjb25jZXJucyBtZToKPj4+IEJlZm9yZSB5b3VyIGNoYW5nZSB3ZSBsYXRjaCBhIHZhbHVlIGlu
dG8gdHJhbXBvbGluZV9taXNjX2VuYWJsZV9vZmYKPj4+IGp1c3QgdG8gYmUgdXNlZCBmb3Igc3Vi
c2VxdWVudCBJQTMyX01JU0NfRU5BQkxFIHdyaXRlcyB3ZSBkby4gVGhpcwo+Pj4gbWVhbnMgdGhh
dCwgb24gYSBoeXBlcnZpc29yIChsaWtlIFhlbiBpdHNlbGYpIHNpbXBseSBkaXNjYXJkaW5nCj4+
PiBndWVzdCB3cml0ZXMgdG8gdGhlIE1TUiAod2hpY2ggaXMgImZpbmUiIHdpdGggdGhlIGRlc2Ny
aWJlZCB1c2FnZQo+Pj4gb2Ygb3VycyB1cCB0byBub3cpLCB3aXRoIHlvdXIgY2hhbmdlIHdlJ2Qg
bm93IGVuZCB1cCB0cnlpbmcgdG8gc2V0Cj4+PiBFRkVSLk5YIHdoZW4gdGhlIGZlYXR1cmUgbWF5
IG5vdCBhY3R1YWxseSBiZSBlbmFibGVkIGluCj4+PiBJQTMyX01JU0NfRU5BQkxFLiBXb3VsZG4n
dCBzdWNoIGFuIEVGRVIgd3JpdGUgYmUgbGlhYmxlIHRvICNHUCgwKT8KPj4+IEkuZS4gZG9uJ3Qg
d2UgbmVlZCB0byByZWFkIGJhY2sgdGhlIE1TUiB2YWx1ZSBoZXJlLCBhbmQgdmVyaWZ5Cj4+PiB3
ZSBhY3R1YWxseSBtYW5hZ2VkIHRvIGNsZWFyIHRoZSBiaXQgYmVmb3JlIGFjdHVhbGx5IE9SLWlu
ZyBpbgo+Pj4gRUZFUl9OWD8KPj4gSWYgdGhpcyBpcyBhIHByb2JsZW0gaW4gcHJhY3RpY2UsIGV4
ZWN1dGlvbiB3b24ndCBjb250aW51ZSBiZXlvbmQgdGhlCj4+IG5leHQgaWYoKSBjb25kaXRpb24g
anVzdCBvdXQgb2YgY29udGV4dCwgd2hpY2ggc2V0IEVGRVIuTlggb24gdGhlIEJTUAo+PiB3aXRo
IGFuIHVuZ3VhcmRlZCBXUk1TUi4KPiBBbmQgaG93IGlzIHRoaXMgYW55IGdvb2Q/IFRoaXMga2lu
ZCBvZiBjcmFzaCBpcyBleGFjdGx5IHdoYXQgSSdtCj4gYXNraW5nIHRvIGF2b2lkLgoKV2hhdCBp
cyB0aGUgcG9pbnQgb2Ygd29ya2luZyBhcm91bmQgYSB0aGVvcmV0aWNhbCBlZGdlIGNhc2Ugb2Yg
YnJva2VuCm5lc3RpbmcgdW5kZXIgWGVuIHdoaWNoIGRlbW9uc3RyYWJseSBkb2Vzbid0IGV4aXN0
IGluIHByYWN0aWNlPwoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
