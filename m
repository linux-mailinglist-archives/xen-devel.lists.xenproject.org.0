Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3D27904C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:05:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs86n-0006Ue-QF; Mon, 29 Jul 2019 16:02:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hB3/=V2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hs86m-0006UV-52
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 16:02:44 +0000
X-Inumbo-ID: 4c234f37-b21a-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4c234f37-b21a-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 16:02:43 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0bq0bKECq101joiMRf4RY2orjo2SjCPD3BV0Y8b7U0q3gleNxuS6YXF1iPb3sm7Et1MO5byuBr
 Ghxt0fbRTOeHqZdsq7HP+xtM40/CPRg/8n/++0bf1pDoMd7a9yw/LyOvP9CnT/wuTiQUvd68fs
 UyJZawrQx+tzc0D6Whe1x+POvQazuntIEt76O9rTHzUallJz1Z3rGA/eeRqq8sp8WzRtYPgjya
 1PkMxNkUsSznU6ce18ScSbdZWD7JtVVCW6WHMhZ8U4zhYPk9+0fkfxSaZ/bxa5u8A/YuKnr6OV
 CtE=
X-SBRS: 2.7
X-MesageID: 3579972
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3579972"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
References: <20190726203222.4833-1-andrew.cooper3@citrix.com>
 <20190726203222.4833-3-andrew.cooper3@citrix.com>
 <c72b3b9a-4e4a-2a6f-3d94-fedf56018b00@suse.com>
 <d13d7b00-e040-6aad-cfbf-f51c4ab5e709@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <e07bd3da-eec6-ff4c-7771-9899d2ccba5b@citrix.com>
Date: Mon, 29 Jul 2019 17:02:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d13d7b00-e040-6aad-cfbf-f51c4ab5e709@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/xpti: Don't leak TSS-adjacent
 percpu data via Meltdown
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMDcvMjAxOSAxNjo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvcHJvY2Vzc29yLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
cHJvY2Vzc29yLmgKPj4+IEBAIC00MTEsNyArNDExLDcgQEAgc3RhdGljIGFsd2F5c19pbmxpbmUg
dm9pZCBfX213YWl0KHVuc2lnbmVkIGxvbmcgZWF4LCB1bnNpZ25lZCBsb25nIGVjeCkKPj4+ICAg
I2RlZmluZSBJT0JNUF9CWVRFUyAgICAgICAgICAgICA4MTkyCj4+PiAgICNkZWZpbmUgSU9CTVBf
SU5WQUxJRF9PRkZTRVQgICAgMHg4MDAwCj4+PiAgIAo+Pj4gLXN0cnVjdCBfX3BhY2tlZCBfX2Nh
Y2hlbGluZV9hbGlnbmVkIHRzc19zdHJ1Y3Qgewo+Pj4gK3N0cnVjdCBfX3BhY2tlZCB0c3Nfc3Ry
dWN0IHsKPj4+ICAgICAgIHVpbnQzMl90IDozMjsKPj4+ICAgICAgIHVpbnQ2NF90IHJzcDAsIHJz
cDEsIHJzcDI7Cj4+PiAgICAgICB1aW50NjRfdCA6NjQ7Cj4+PiBAQCAtNDI1LDYgKzQyNSw3IEBA
IHN0cnVjdCBfX3BhY2tlZCBfX2NhY2hlbGluZV9hbGlnbmVkIHRzc19zdHJ1Y3Qgewo+Pj4gICAg
ICAgLyogUGFkcyB0aGUgVFNTIHRvIGJlIGNhY2hlbGluZS1hbGlnbmVkICh0b3RhbCBzaXplIGlz
IDB4ODApLiAqLwo+Pj4gICAgICAgdWludDhfdCBfX2NhY2hlbGluZV9maWxsZXJbMjRdOwo+Pj4g
ICB9Owo+Pj4gK0RFQ0xBUkVfUEVSX0NQVShzdHJ1Y3QgdHNzX3N0cnVjdCwgaW5pdF90c3MpOwo+
PiBUYWtpbmcgcGF0Y2ggMSB0aGlzIGV4cGFuZHMgdG8KPj4KPj4gICAgICBfX0RFRklORV9QRVJf
Q1BVKF9fc2VjdGlvbigiLmJzcy5wZXJjcHUucGFnZV9hbGlnbmVkIikgXAo+PiAgICAgICAgICAg
ICAgICAgICAgICAgX19hbGlnbmVkKFBBR0VfU0laRSksIHN0cnVjdCB0c3Nfc3RydWN0LCBfaW5p
dF90c3MpOwo+Pgo+PiBhbmQgdGhlbgo+Pgo+PiAgICAgIF9fc2VjdGlvbigiLmJzcy5wZXJjcHUu
cGFnZV9hbGlnbmVkIikgX19hbGlnbmVkKFBBR0VfU0laRSkKPj4gICAgICBfX3R5cGVvZl9fKHN0
cnVjdCB0c3Nfc3RydWN0KSBwZXJfY3B1X19pbml0X3RzczsKPj4KPj4gd2hpY2ggaXMgbm90IHdo
YXQgeW91IHdhbnQ6IFlvdSBoYXZlIGFuIG9iamVjdCBvZiBzaXplCj4+IHNpemVvZihzdHJ1Y3Qg
dHNzX3N0cnVjdCkgd2hpY2ggaXMgUEFHRV9TSVpFIGFsaWduZWQuIEFmYWljdCB5b3UKPj4gdGhl
cmVmb3JlIHN0aWxsIGxlYWsgZXZlcnl0aGluZyB0aGF0IGZvbGxvd3MgaW4gdGhlIHNhbWUgcGFn
ZS4KPiBXaGF0IGRhdGEgbWlnaHQgdGhpcyBiZT8KPgo+IEV2ZXJ5IG9iamVjdCBwdXQgaW50byB0
aGlzIHNlY3Rpb24gaXMgc3VpdGFibHkgYWxpZ25lZCwgc28gbm90aGluZyB3aWxsCj4gc2l0IGlu
IHRoZSBzbGFjayBiZXR3ZWVuIHRoZSBUU1MgYW5kIHRoZSBlbmQgb2YgdGhlIHBhZ2UuCgpBbmQg
b2YgY291cnNlLCBJIHNob3VsZCBoYXZlIGFjdHVhbGx5IGNoZWNrZWQuLi4KCmZmZmY4MmQwODA5
MmUwMDAgQiBwZXJfY3B1X19pbml0X3RzcwpmZmZmODJkMDgwOTJlMDAwIEIgX19wZXJfY3B1X3N0
YXJ0CmZmZmY4MmQwODA5MmUwODAgQiBwZXJfY3B1X19jcHVwb29sCmZmZmY4MmQwODA5MmUwODgg
YiBwZXJfY3B1X19jb250aW51ZV9pbmZvCgpUaGlzIG5lZWRzIGZpeGluZyB3aXRoIHN1aXRhYmxl
IGFsaWdubWVudCBpbiB0aGUgbGlua2VyIHNjcmlwdC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
