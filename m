Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDB417A69A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 14:45:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9qmF-0005xu-AB; Thu, 05 Mar 2020 13:43:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VwEW=4W=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j9qmD-0005xo-Uw
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 13:43:01 +0000
X-Inumbo-ID: 3adb806e-5ee7-11ea-90c4-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3adb806e-5ee7-11ea-90c4-bc764e2007e4;
 Thu, 05 Mar 2020 13:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583415781;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9F/QH4YnJlmeyBSsD7H2AXx0nqrfRfYmZr9Z+HS7Q4Y=;
 b=DhnvT2Id9mg1UEvXLG1ACSuHGC/aIMr2FUnur2uDkoQamsUcFEBAoQwK
 3/4VJPVpUGP73V5XuACd/vn/Kh9UaV3b7gHe8FBXJGS31nGijGJ+YihWO
 30Gks646rmOJa+SuRADUYaPc3qyVpSurzCiYEFCds4hjgtSSI4bEtbity E=;
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
IronPort-SDR: RYL8/pxnid9Jgeps8+d49hNBQ5ZJ7zcJyX986xWb+QxWPxdkQdeR0kOCmKpmbcPKCnyCeJpV+C
 rinp5RYKSJCX3XOnoIUr0eJuS90KcMZ+GUJP8hP/nqzuWFLJSlqSHb1rq+Bt72M+37JbYAxXki
 P+7wEu9VPh3KJWx88tB/qsY+FoNet4q6JkyVCBaLQsiCRqnWhafXBX0corMx/2CwWn1hJoBf36
 ZNYcC7bl8y3+lLLXizHxnhn/Zt/NLTgswwOxJL5w1B0Ml9w3VmWSvXfo+WIoq04demV85wxbue
 ZfE=
X-SBRS: 2.7
X-MesageID: 14087235
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,518,1574139600"; d="scan'208";a="14087235"
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-8-anthony.perard@citrix.com>
 <155c8c7d-df12-5177-45ab-1dd2a6bc9b45@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d27d1cc9-8089-af19-69d1-91afd87cb836@citrix.com>
Date: Thu, 5 Mar 2020 13:42:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <155c8c7d-df12-5177-45ab-1dd2a6bc9b45@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [XEN PATCH v3 07/23] xen/build: Use obj-y +=
 subdir/ instead of subdir-y
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDMvMjAyMCAwOToyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjYuMDIuMjAyMCAx
MjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+IFRoaXMgaXMgcGFydCBvZiB1cGdyYWRpbmcg
b3VyIGJ1aWxkIHN5c3RlbSBhbmQgaW1wb3J0IG1vcmUgb2YgTGludXgncwo+PiBvbmUuCj4+Cj4+
IEluIExpbnV4LCBzdWJkaXIteSBpbiBNYWtlZmlsZXMgaXMgb25seSB1c2VkIHRvIGRlc2NlbmQg
aW50bwo+PiBzdWJkaXJlY3Rvcnkgd2hlbiB0aGVyZSBhcmUgbm8gb2JqZWN0IHRvIGJ1aWxkLCBY
ZW4gZG9lc24ndCBoYXZlIHRoYXQKPj4gYW5kIGFsbCBzdWJkaXIgaGF2ZSBvYmplY3QgdG8gYmUg
aW5jbHVkZWQgaW4gdGhlIGZpbmFsIGJpbmFyeS4KPj4KPj4gVG8gYWxsb3cgdGhlIG5ldyBzeW50
YXgsIHRoZSAib2JqLXkiIGFuZCAic3ViZGlyLSoiIGNhbGN1bGF0aW9uIGluCj4+IFJ1bGVzLm1r
IGlzIGNoYW5nZWQgYW5kIHBhcnRpYWxseSBpbXBvcnRlZCBmcm9tIExpbnV4J3MgS2J1aWxkLgo+
Pgo+PiBUaGUgY29tbWFuZCB1c2VkIHRvIG1vZGlmeSB0aGUgTWFrZWZpbGUgd2FzOgo+PiAgICAg
c2VkIC1pIC1yICdzI15zdWJkaXItKC4qKSNvYmotXDEvIzsnICoqL01ha2VmaWxlCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+
PiAtLS0KPj4KPj4gTm90ZXM6Cj4+ICAgICB2MzoKPj4gICAgIC0gbm8gbW9yZSB0YWJzCj4+ICAg
ICAtIHJlc2h1ZmZsZSB2YXJpYWJsZSwgYW5kIHJlbW92ZSBfX3N1YmRpci15Cj4+Cj4+ICB4ZW4v
UnVsZXMubWsgICAgICAgICAgICAgICAgICAgICAgICAgfCAxOSArKysrKysrKy0tLS0tLS0tLS0t
Cj4+ICB4ZW4vYXJjaC9hcm0vTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAxNCArKysrKysrLS0t
LS0tLQo+PiAgeGVuL2FyY2gvYXJtL2FybTMyL01ha2VmaWxlICAgICAgICAgIHwgIDIgKy0KPj4g
IHhlbi9hcmNoL2FybS9hcm02NC9NYWtlZmlsZSAgICAgICAgICB8ICAyICstCj4gSnVsaWVuLCBT
dGVmYW5vIC0gYW55IGNoYW5jZSBvZiBnZXR0aW5nIGFuIGFjayBoZXJlPwo+Cj4+ICB4ZW4vYXJj
aC94ODYvTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAxOCArKysrKysrKystLS0tLS0tLS0KPj4g
IHhlbi9hcmNoL3g4Ni9hY3BpL01ha2VmaWxlICAgICAgICAgICB8ICAyICstCj4+ICB4ZW4vYXJj
aC94ODYvY3B1L01ha2VmaWxlICAgICAgICAgICAgfCAgNCArKy0tCj4+ICB4ZW4vYXJjaC94ODYv
Z3Vlc3QvTWFrZWZpbGUgICAgICAgICAgfCAgNCArKy0tCj4+ICB4ZW4vYXJjaC94ODYvaHZtL01h
a2VmaWxlICAgICAgICAgICAgfCAgNiArKystLS0KPj4gIHhlbi9hcmNoL3g4Ni9tbS9NYWtlZmls
ZSAgICAgICAgICAgICB8ICA0ICsrLS0KPj4gIHhlbi9hcmNoL3g4Ni94ODZfNjQvTWFrZWZpbGUg
ICAgICAgICB8ICAyICstCj4+ICB4ZW4vY29tbW9uL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
fCAxMCArKysrKy0tLS0tCj4+ICB4ZW4vZHJpdmVycy9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
fCAxNCArKysrKysrLS0tLS0tLQo+PiAgeGVuL2RyaXZlcnMvYWNwaS9NYWtlZmlsZSAgICAgICAg
ICAgIHwgIDYgKysrLS0tCj4+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9NYWtlZmlsZSAgICAg
fCAgOCArKysrLS0tLQo+PiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL01ha2VmaWxlIHwg
IDIgKy0KPiBLZXZpbiwgaG93IGFib3V0IHRoaXMgb25lPwo+Cj4+ICB4ZW4vbGliL01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+PiAgeGVuL3hzbS9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0KPj4gIHhlbi94c20vZmxhc2svTWFrZWZpbGUgICAgICAgICAg
ICAgICB8ICAyICstCj4gRGFuaWVsLCBob3cgYWJvdXQgdGhlc2U/Cj4KPiBJIGd1ZXNzIHRoZSBs
YXR0ZXIgdHdvIGFyZSBzbWFsbCBlbm91Z2ggdG8gc2tpcCBmdXJ0aGVyIHdhaXRpbmcgZm9yCj4g
YWNrcyBvbmNlIHRoZSBBcm0gb25lIHdvdWxkIGJlIGluIHBsYWNlLiBHZXR0aW5nIHRoaXMgcGF0
Y2ggaW4KPiB3b3VsZCB1bmJsb2NrIGEgZmFpciBwYXJ0IG9mIHRoZSByZW1haW5kZXIgb2YgdGhp
cyBzZXJpZXMuCgpUaGlzIGlzIGEgbWVjaGFuaWNhbCBjaGFuZ2UgdG8gdGhlIGVudGlyZSB0cmVl
LCB1bnJlbGF0ZWQgdG8gdGhlIGxvZ2ljCmluIHRoZSBtYWludGFpbmVycyBhcmVhcy4KCkl0IGlz
IGEgZ29vZCBleGFtcGxlIHdoZXJlICJUaGUgUmVzdCIgcXVhbGlmaWVzIGJldHRlciB0aGFuIHRo
ZSBzdW0gb2YKZXZlcnkgc3ViLW1haW50YWluZXIuwqAgR2l2ZW4gdGhhdCB0aGlzIGhhcyBhbHJl
YWR5IGJlZW4gcGVuZGluZyBmb3IgYQp3ZWVrLCBJJ2Qgc2F5IGl0IGlzIGZpbmUgdG8gZ28gaW4g
bm93LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
