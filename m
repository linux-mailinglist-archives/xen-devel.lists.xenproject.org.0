Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3873614D892
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 11:04:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix6dm-0000V7-Ny; Thu, 30 Jan 2020 10:01:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=avZM=3T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ix6dl-0000V2-Ax
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 10:01:37 +0000
X-Inumbo-ID: 80521128-4347-11ea-8a26-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80521128-4347-11ea-8a26-12813bfff9fa;
 Thu, 30 Jan 2020 10:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580378496;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/D9Y7P+rOIhdswuQ9OewzhSbiY0ekbzZpzA/aQa35Mo=;
 b=U7/eMQtTFrftar+sCLKGGjZCgQ37iUfS4nzOuN0qVHphsKvF/2WaGSko
 FJc4utsziLg1nO2nnhcQyUlygW+wEnGdRv1XIKG27SXek+aw4hEiZSpE0
 L6Fu9e0mC7w4s3vQ/4WFvw8+7kHtNZexdVY1PuO0kdPqIvciyLS8E+3My w=;
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
IronPort-SDR: 8etdnTsZG0Iv1sbF5ZJfahfwpgX1dmxupuVibC5TWgJFXw0CrmJ3cu2O8Djcj0EmIE7rT+8BWH
 QpetRO9FO50rwMhTNu0GXQfzQfYfk6ZPHxIxmKJzYJ8xnLDuC1cwL9vbdbcdkxVnDfWTkFjGiV
 092l/cG3cg3DDWgWtUyHG/UDPjBPduCQengtIs9548qy2tdxQQGXeTLBpNpjrP+yF69zS2GdAK
 /3szfvaErnKfKwZbC+FiiYA7bongoFCzl4slNq7NAO6oMFqk05N8Z3m53uvmW6hWq53i+nXGiD
 3ic=
X-SBRS: 2.7
X-MesageID: 12038327
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,381,1574139600"; d="scan'208";a="12038327"
Date: Thu, 30 Jan 2020 11:01:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200130100129.GD4679@Air-de-Roger>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-3-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129202034.15052-3-liuwe@microsoft.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 02/12] x86/hypervisor: make
 hypervisor_ap_setup return an error code
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
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMDg6MjA6MjRQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBXZSB3YW50IHRvIGJlIGFibGUgdG8gaGFuZGxlIEFQIHNldHVwIGVycm9yIGluIHRoZSB1cHBl
ciBsYXllci4KClRoYW5rcywgc29tZSBjb21tZW50cyBiZWxvdy4KCj4gCj4gU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L2d1
ZXN0L2h5cGVydmlzb3IuYyAgICAgICAgfCAgNiArKysrLS0KPiAgeGVuL2FyY2gveDg2L2d1ZXN0
L3hlbi94ZW4uYyAgICAgICAgICAgfCAxMSArKysrKysrKystLQo+ICB4ZW4vaW5jbHVkZS9hc20t
eDg2L2d1ZXN0L2h5cGVydmlzb3IuaCB8ICA2ICsrKy0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE2
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5j
Cj4gaW5kZXggNGYyN2I5ODc0MC4uZTcyYzkyZmZkZiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlz
b3IuYwo+IEBAIC01MiwxMCArNTIsMTIgQEAgdm9pZCBfX2luaXQgaHlwZXJ2aXNvcl9zZXR1cCh2
b2lkKQo+ICAgICAgICAgIG9wcy0+c2V0dXAoKTsKPiAgfQo+ICAKPiAtdm9pZCBoeXBlcnZpc29y
X2FwX3NldHVwKHZvaWQpCj4gK2ludCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQpCj4gIHsKPiAg
ICAgIGlmICggb3BzICYmIG9wcy0+YXBfc2V0dXAgKQo+IC0gICAgICAgIG9wcy0+YXBfc2V0dXAo
KTsKPiArICAgICAgICByZXR1cm4gb3BzLT5hcF9zZXR1cCgpOwo+ICsKPiArICAgIHJldHVybiAw
Owo+ICB9Cj4gIAo+ICB2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpCj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hl
bi5jCj4gaW5kZXggNmRiYzVmOTUzZi4uZWVkOGE2ZWRhZSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJj
aC94ODYvZ3Vlc3QveGVuL3hlbi5jCj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4u
Ywo+IEBAIC0yNTcsMTEgKzI1NywxOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXAodm9pZCkK
PiAgICAgIGluaXRfZXZ0Y2huKCk7Cj4gIH0KPiAgCj4gLXN0YXRpYyB2b2lkIGFwX3NldHVwKHZv
aWQpCj4gK3N0YXRpYyBpbnQgYXBfc2V0dXAodm9pZCkKPiAgewo+ICsgICAgaW50IHJjOwo+ICsK
PiAgICAgIHNldF92Y3B1X2lkKCk7Cj4gLSAgICBtYXBfdmNwdWluZm8oKTsKPiArICAgIHJjID0g
bWFwX3ZjcHVpbmZvKCk7CgptYXBfdmNwdWluZm8gc2hvdWxkIGJlIGNoYW5nZWQgc28gdGhhdCB0
aGUgQlVHX09OIGlzIHJlbW92ZWQsIGFuZCBhbgplcnJvciBpcyBvbmx5IHJldHVybmVkIGlmIFZD
UFVPUF9yZWdpc3Rlcl92Y3B1X2luZm8gZmFpbHMgYW5kIHZjcHUgPj0KWEVOX0xFR0FDWV9NQVhf
VkNQVVMsIGVsc2Ugbm8gZXJyb3Igc2hvdWxkIGJlIHJldHVybmVkLgoKPiArICAgIGlmICggcmMg
KQo+ICsgICAgICAgIHJldHVybiByYzsKPiArCj4gICAgICBpbml0X2V2dGNobigpOwo+ICsKPiAr
ICAgIHJldHVybiAwOwoKSW4gb3JkZXIgdG8ga2VlcCB0aGlzIHNob3J0ZXIsIHlvdSBjb3VsZCBk
bzoKCmlmICggIXJjICkKICAgIGluaXRfZXZ0Y2huKCk7CgpyZXR1cm4gcmM7CgpUaGFua3MsIFJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
