Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF92AA1A6
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 13:39:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5q3q-0000jr-UP; Thu, 05 Sep 2019 11:36:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QhBR=XA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i5q3p-0000jm-Ho
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 11:36:21 +0000
X-Inumbo-ID: 618b9622-cfd1-11e9-b76c-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 618b9622-cfd1-11e9-b76c-bc764e2007e4;
 Thu, 05 Sep 2019 11:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567683380;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=NGtG5mUDydioLrmXOZmHb7Y4JP3lRL5+MzOy0EtCnMQ=;
 b=fdXivrwP9XKO5Z/5FpBaDVp//ZEb7ktrTvdl1v7896XUBH3vWXANuwcy
 5H/9d9wrplZn4EYkGoR6XCrFvxdDEvTJq54ZoXxSXDsfdaylkfzhKjGKc
 JFChLsfPXoghwkEe+daxOysS0YDXtwaFZ0Nkp5P30YQ3Bz7RsglNHvVos w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4jQkLZiTZb7k3Apv+dXGbdW78XpURxnANcTJIcKAg6YpG8fITKDqgMqYu0I3y0IzdOeS8Oc72M
 qcq5AeOY0JIO9odeXIpXfJAE2nTawfgDjeHi+dxLWhQ8G/ntmQ8pL/NydJKW0Zom93PT3R8SDw
 bdPjndZlVq6101Xs5gHfdngureOkBj+q+jjESixTB5qMHnXzBucS0YphwB9TktbHQreoANyN8U
 OxU/iGH3EpSCHjQmmjR+32yjMPJ6YeVSR6zdIzfZHD1WvVQZ1Vw10XXLKiqCw4jabg1uRDepo7
 WMs=
X-SBRS: 2.7
X-MesageID: 5357732
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5357732"
To: Jan Beulich <jbeulich@suse.com>
References: <20190819182612.16706-1-andrew.cooper3@citrix.com>
 <20190904175708.18853-1-andrew.cooper3@citrix.com>
 <026889e4-363b-ed1a-0385-e98f8bd9efa8@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ea9e6203-270f-0dec-85a7-daf2b83cc757@citrix.com>
Date: Thu, 5 Sep 2019 12:36:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <026889e4-363b-ed1a-0385-e98f8bd9efa8@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 2/2] x86/AMD: Fix handling of x87
 exception pointers on Fam17h hardware
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

T24gMDUvMDkvMjAxOSAxMDowMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDQuMDkuMjAxOSAx
OTo1NywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gQU1EIFByZS1GYW0xN2ggQ1BVcyAib3B0aW1p
c2UiIHtGLH1Ye1NBVkUsUlNUT1J9IGJ5IG5vdCBzYXZpbmcvcmVzdG9yaW5nCj4+IEZPUC9GSVAv
RkRQIGlmIGFuIHg4NyBleGNlcHRpb24gaXNuJ3QgcGVuZGluZy4gIFRoaXMgY2F1c2VzIGFuIGlu
Zm9ybWF0aW9uCj4+IGxlYWssIENWRS0yMDA2LTEwNTYsIGFuZCB3b3JrZWQgYXJvdW5kIGJ5IHNl
dmVyYWwgT1NlcywgaW5jbHVkaW5nIFhlbi4gIEFNRAo+PiBGYW0xN2ggQ1BVcyBubyBsb25nZXIg
aGF2ZSB0aGlzIGxlYWssIGFuZCBhZHZlcnRpc2Ugc28gaW4gYSBDUFVJRCBiaXQuCj4+Cj4+IElu
dHJvZHVjZSB0aGUgUlNUUl9GUF9FUlJfUFRSUyBmZWF0dXJlLCBhcyBzcGVjaWZpZWQgYnkgQU1E
LCBhbmQgZXhwb3NlIHRvIGFsbAo+PiBndWVzdHMgYnkgZGVmYXVsdC4gIFdoaWxlIGFkanVzdGlu
ZyBsaWJ4bCdzIGNwdWlkIHRhYmxlLCBhZGQgQ0xaRVJPIHdoaWNoCj4+IGxvb2tzIHRvIGhhdmUg
YmVlbiBvbWl0dGVkIHByZXZpb3VzbHkuCj4+Cj4+IEFsc28gaW50cm9kdWNlIGFuIFg4Nl9CVUcg
Yml0IHRvIHRyaWdnZXIgdGhlIChGKVhSU1RPUiB3b3JrYXJvdW5kLCBhbmQgc2V0IGl0Cj4+IG9u
IEFNRCBoYXJkd2FyZSB3aGVyZSBSU1RSX0ZQX0VSUl9QVFJTIGlzIG5vdCBhZHZlcnRpc2VkLiAg
T3B0aW1pc2UgdGhlCj4+IGNvbmRpdGlvbnMgZm9yIHRoZSB3b3JrYXJvdW5kIHBhdGhzLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gaXJyZXNw
ZWN0aXZlIG9mIGEgZmV3IHJlbWFya3M6Cj4KPj4gdjM6Cj4+ICAqIFJlbmFtZSB0byBYODZfQlVH
X0ZQVV9QVFJTCj4gV2hpbGUgSSBkaWQgYWdyZWUgdG8gdXNlIHRoaXMgbmFtZSwgSSdkIHN0aWxs
IGxpa2UgdG8gcG9pbnQgb3V0IHRoYXQKPiB3aGV0aGVyIG9yIG5vdCB0aGlzIGlzIHZpZXdlZCBh
cyBhIGJ1ZyBpcyBhIG1hdHRlciBvZiB0aGUgcG9zaXRpb24KPiBvbmUgdGFrZXMuIEknbSBwcmV0
dHkgc3VyZSB0aGUgQU1EIGVuZ2luZWVycyBvcmlnaW5hbGx5IGhhdmluZyBkZWNpZGVkCj4gdG8g
YXZvaWQgc2F2aW5nL3Jlc3RvcmluZyB0aGVzZSB2YWx1ZSB3b3VsZG4ndCBoYXZlIGNhbGxlZCB0
aGlzIGEgYnVnLAo+IGJ1dCBhIGZlYXR1cmUuCgpJIGFjY2VwdCB0aGF0IGRpZmZlcmVudCBwZW9w
bGUgbWlnaHQgaGF2ZSBkaWZmZXJlbnQgb3BpbmlvbnMgb24gdGhlCm1hdHRlciwgYnV0IGF0IHRo
ZSBwb2ludCB0aGF0IHdlIGFuZCBldmVyeSBvdGhlciBsYXJnZSBzb2Z0d2FyZSB2ZW5kb3IKaGFz
IGlzc3VlZCBhIHNlY3VyaXR5IGZpeCBiZWNhdXNlIG9mIGl0LCBpdCBjYW4ndCBjcmVkaWJseSBi
ZSBjYWxsZWQgYQpmZWF0dXJlLCBpcnJlc3BlY3RpdmUgb2YgdGhlIG9yaWdpbmFsIGludGVudGlv
bi4KClRoZSBjaGFuZ2Ugb2YgYmVoYXZpb3VyIG9uIEZhbTE3aCBpcyBlaXRoZXIgdGFjaXQgYWdy
ZWVtZW50IHdpdGggdGhpcwpwb2ludCwgb3IgYXQgbGVhc3QgYSBiZWdydWRnaW5nIGFjY2VwdGFu
Y2UgdGhhdCB0aGUgb25seSB3YXkgdGhlCndvcmthcm91bmQgaXMgZ29pbmcgdG8gZ28gYXdheSBp
cyBieSBjaGFuZ2luZyB0aGUgYmVoYXZpb3VyIG9mIHRoZSBDUFUuCgo+PiAtLS0gYS94ZW4vYXJj
aC94ODYvY3B1L2FtZC5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMKPj4gQEAgLTU4
MCw2ICs1ODAsMTMgQEAgc3RhdGljIHZvaWQgaW5pdF9hbWQoc3RydWN0IGNwdWluZm9feDg2ICpj
KQo+PiAgCX0KPj4gIAo+PiAgCS8qCj4+ICsJICogT2xkZXIgQU1EIENQVXMgZG9uJ3Qgc2F2ZS9s
b2FkIEZPUC9GSVAvRkRQIHVubGVzcyBhbiBGUFUgZXhjZXB0aW9uCj4+ICsJICogaXMgcGVuZGlu
Zy4gIFhlbiB3b3JrcyBhcm91bmQgdGhpcyBhdCAoRilYUlNUT1IgdGltZS4KPj4gKwkgKi8KPj4g
KwlpZiAoICFjcHVfaGFzKGMsIFg4Nl9GRUFUVVJFX1JTVFJfRlBfRVJSX1BUUlMpICkKPj4gKwkJ
c2V0dXBfZm9yY2VfY3B1X2NhcChYODZfQlVHX0ZQVV9QVFJTKTsKPiBJIHRoaW5rIGluIHRoaXMg
ZmlsZSB5b3Ugd2FudCB0byBvbWl0IHRoZSBibGFua3MgaW1tZWRpYXRlbHkgaW5zaWRlCj4gdGhl
IGlmKCkgcGFyZW50aGVzZXMuCgpPb3BzIHllcy4KCj4KPj4gQEAgLTE2OSwxMSArMTY3LDExIEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBmcHVfZnhzYXZlKHN0cnVjdCB2Y3B1ICp2KQo+PiAgICAgICAg
ICAgICAgICAgICAgICAgICA6ICI9bSIgKCpmcHVfY3R4dCkgOiAiUiIgKGZwdV9jdHh0KSApOwo+
PiAgCj4+ICAgICAgICAgIC8qCj4+IC0gICAgICAgICAqIEFNRCBDUFVzIGRvbid0IHNhdmUvcmVz
dG9yZSBGRFAvRklQL0ZPUCB1bmxlc3MgYW4gZXhjZXB0aW9uCj4+IC0gICAgICAgICAqIGlzIHBl
bmRpbmcuCj4+ICsgICAgICAgICAqIFNvbWUgQ1BVcyBkb24ndCBzYXZlL3Jlc3RvcmUgRkRQL0ZJ
UC9GT1AgdW5sZXNzIGFuIGV4Y2VwdGlvbiBpcwo+PiArICAgICAgICAgKiBwZW5kaW5nLiAgSW4g
dGhpcyBjYXNlLCB0aGUgcmVzdG9yZSBzaWRlIHdpbGwgYXJyYW5nZSBzYWZlIHZhbHVlcywKPj4g
KyAgICAgICAgICogYW5kIHRoZXJlIGlzIG5vIHBvaW50IHRyeWluZyB0byByZXN0b3JlIEZDUy9G
RFMgaW4gYWRkaXRpb24uCj4+ICAgICAgICAgICAqLwo+PiAtICAgICAgICBpZiAoICEoZnB1X2N0
eHQtPmZzdyAmIDB4MDA4MCkgJiYKPj4gLSAgICAgICAgICAgICBib290X2NwdV9kYXRhLng4Nl92
ZW5kb3IgPT0gWDg2X1ZFTkRPUl9BTUQgKQo+PiArICAgICAgICBpZiAoIGNwdV9idWdfZnB1X3B0
cnMgJiYgIShmcHVfY3R4dC0+ZnN3ICYgMHgwMDgwKSApCj4+ICAgICAgICAgICAgICByZXR1cm47
Cj4gQ291bGQgSSB0YWxrIHlvdSBpbnRvIHMvdHJ5aW5nIHRvIHJlc3RvcmUvdHJ5aW5nIHRvIGNv
bGxlY3QvIGZvciB0aGUKPiBjb21tZW50PyBUaGUgY29uc3VtZXIgb2YgdGhlIGNvbGxlY3RlZCBk
YXRhIGNvdWxkIGluIHByaW5jaXBsZSBiZQo+IG90aGVyIHRoYW4gdGhlIGNvcnJlc3BvbmRpbmcg
cmVzdG9yZSBjb2RlLCBlLmcuIHRoZSBpbnNuIGVtdWxhdG9yLgo+IChodm1lbXVsX3B1dF9mcHUo
KSBoYXMgYW4gZXhhbXBsZSBvZiB0aGUgb3Bwb3NpdGUgZGlyZWN0aW9uLCBpLmUuCj4gcHJvZHVj
aW5nIGRhdGEgZm9yIHRoZSByZXN0b3JlIGxvZ2ljIHRvIGNvbnN1bWUuKQoKT2suCgp+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
