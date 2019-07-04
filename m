Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1C55FD15
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 20:43:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj6f8-0004eG-On; Thu, 04 Jul 2019 18:40:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E3Ia=VB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hj6f7-0004eA-8d
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 18:40:53 +0000
X-Inumbo-ID: 3f890c1e-9e8b-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3f890c1e-9e8b-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 18:40:51 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9eUk/J1sIAtE3cxiocgAeXcpIoaYmVOtgMBy8lGnhLXn5IFHgK6U+qwalx1sw/yn7y+OgyWqgx
 CuNnajmywewJJy2BNq+R4TDZsLT/bdbjXzDWo6Ydkh6LV13JEaQS1eE2ozjcKS/ZUj3NdLKnu2
 4sTQlPxaAxUt8TiqnPARq/FN++z9Ef/LEgBspqrEsuAzB4xOW2jPrl+9Nwp5lfd/OaI64FpOab
 ZKkjlxOk6mkoil8zIRV4J7nXCUG2hFgXaaMDamgN8ksByVfqFrNG/rUBb1hilt48SeWsEOJGvq
 FcU=
X-SBRS: 2.7
X-MesageID: 2655482
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2655482"
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
 <95252da8-777b-9527-6f5b-1e1a5994f845@suse.com>
 <6f03fb10-6339-610f-0620-86675d76a4ee@citrix.com>
 <04b38838-ccc2-ca9e-32ec-3348019281b5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <51481136-cea3-21b3-4a33-664c5a745219@citrix.com>
Date: Thu, 4 Jul 2019 19:40:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <04b38838-ccc2-ca9e-32ec-3348019281b5@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v9 05/23] x86emul: support AVX512F gather
 insns
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
Cc: Wei Liu <wl@xen.org>, RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDcvMjAxOSAxNToyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDQuMDcuMjAxOSAx
NjoxMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDEvMDcvMjAxOSAxMjoxOCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxh
dGUuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKPj4+
IEBAIC05MTAwLDYgKzkxMDAsMTMzIEBAIHg4Nl9lbXVsYXRlKAo+Pj4gICAgICAgICAgICBwdXRf
c3R1YihzdHViKTsKPj4+ICAgIAo+Pj4gICAgICAgICAgICBpZiAoIHJjICE9IFg4NkVNVUxfT0tB
WSApCj4+PiArICAgICAgICAgICAgZ290byBkb25lOwo+Pj4gKwo+Pj4gKyAgICAgICAgc3RhdGUt
PnNpbWRfc2l6ZSA9IHNpbWRfbm9uZTsKPj4+ICsgICAgICAgIGJyZWFrOwo+Pj4gKyAgICB9Cj4+
PiArCj4+PiArICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmMzgsIDB4OTApOiAvKiB2
cGdhdGhlcmR7ZCxxfSBtZW0sW3h5el1tbXtrfSAqLwo+Pj4gKyAgICBjYXNlIFg4NkVNVUxfT1BD
X0VWRVhfNjYoMHgwZjM4LCAweDkxKTogLyogdnBnYXRoZXJxe2QscX0gbWVtLFt4eXpdbW17a30g
Ki8KPj4+ICsgICAgY2FzZSBYODZFTVVMX09QQ19FVkVYXzY2KDB4MGYzOCwgMHg5Mik6IC8qIHZn
YXRoZXJkcHtzLGR9IG1lbSxbeHl6XW1te2t9ICovCj4+PiArICAgIGNhc2UgWDg2RU1VTF9PUENf
RVZFWF82NigweDBmMzgsIDB4OTMpOiAvKiB2Z2F0aGVycXB7cyxkfSBtZW0sW3h5el1tbXtrfSAq
Lwo+Pj4gKyAgICB7Cj4+PiArICAgICAgICB0eXBlb2YoZXZleCkgKnBldmV4Owo+Pj4gKyAgICAg
ICAgdW5pb24gewo+Pj4gKyAgICAgICAgICAgIGludDMyX3QgZHdbMTZdOwo+Pj4gKyAgICAgICAg
ICAgIGludDY0X3QgcXdbOF07Cj4+PiArICAgICAgICB9IGluZGV4Owo+Pj4gKyAgICAgICAgYm9v
bCBkb25lID0gZmFsc2U7Cj4+PiArCj4+PiArICAgICAgICBBU1NFUlQoZWEudHlwZSA9PSBPUF9N
RU0pOwo+Pj4gKyAgICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKCghZXZleC5vcG1zayB8fCBl
dmV4LmJycyB8fCBldmV4LnogfHwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZXZleC5yZWcgIT0gMHhmIHx8Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1v
ZHJtX3JlZyA9PSBzdGF0ZS0+c2liX2luZGV4KSwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBFWENfVUQpOwo+Pj4gKyAgICAgICAgYXZ4NTEyX3ZsZW5fY2hlY2soZmFsc2UpOwo+
Pj4gKyAgICAgICAgaG9zdF9hbmRfdmNwdV9tdXN0X2hhdmUoYXZ4NTEyZik7Cj4+PiArICAgICAg
ICBnZXRfZnB1KFg4NkVNVUxfRlBVX3ptbSk7Cj4+PiArCj4+PiArICAgICAgICAvKiBSZWFkIGRl
c3RpbmF0aW9uIGFuZCBpbmRleCByZWdpc3RlcnMuICovCj4+PiArICAgICAgICBvcGMgPSBpbml0
X2V2ZXgoc3R1Yik7Cj4+PiArICAgICAgICBwZXZleCA9IGNvcHlfRVZFWChvcGMsIGV2ZXgpOwo+
Pj4gKyAgICAgICAgcGV2ZXgtPm9wY3ggPSB2ZXhfMGY7Cj4+PiArICAgICAgICBvcGNbMF0gPSAw
eDdmOyAvKiB2bW92ZHFhezMyLDY0fSAqLwo+Pj4gKyAgICAgICAgLyoKPj4+ICsgICAgICAgICAq
IFRoZSByZWdpc3RlciB3cml0ZWJhY2sgYmVsb3cgaGFzIHRvIHJldGFpbiBtYXNrZWQtb2ZmIGVs
ZW1lbnRzLCBidXQKPj4+ICsgICAgICAgICAqIG5lZWRzIHRvIGNsZWFyIHVwcGVyIHBvcnRpb25z
IGluIHRoZSBpbmRleC13aWRlci10aGFuLWRhdGEgY2FzZXMuCj4+PiArICAgICAgICAgKiBUaGVy
ZWZvcmUgcmVhZCAoYW5kIHdyaXRlIGJlbG93KSB0aGUgZnVsbCByZWdpc3Rlci4gVGhlIGFsdGVy
bmF0aXZlCj4+PiArICAgICAgICAgKiB3b3VsZCBoYXZlIGJlZW4gdG8gZmlkZGxlIHdpdGggdGhl
IG1hc2sgcmVnaXN0ZXIgdXNlZC4KPj4+ICsgICAgICAgICAqLwo+Pj4gKyAgICAgICAgcGV2ZXgt
Pm9wbXNrID0gMDsKPj4+ICsgICAgICAgIC8qIFVzZSAoJXJheCkgYXMgZGVzdGluYXRpb24gYW5k
IG1vZHJtX3JlZyBhcyBzb3VyY2UuICovCj4+PiArICAgICAgICBwZXZleC0+YiA9IDE7Cj4+PiAr
ICAgICAgICBvcGNbMV0gPSAobW9kcm1fcmVnICYgNykgPDwgMzsKPj4+ICsgICAgICAgIHBldmV4
LT5SWCA9IDE7Cj4+PiArICAgICAgICBvcGNbMl0gPSAweGMzOwo+Pj4gKwo+Pj4gKyAgICAgICAg
aW52b2tlX3N0dWIoIiIsICIiLCAiPW0iICgqbW12YWxwKSA6ICJhIiAobW12YWxwKSk7Cj4+PiAr
Cj4+PiArICAgICAgICBwZXZleC0+cGZ4ID0gdmV4X2YzOyAvKiB2bW92ZHF1ezMyLDY0fSAqLwo+
Pj4gKyAgICAgICAgcGV2ZXgtPncgPSBiICYgMTsKPj4+ICsgICAgICAgIC8qIFN3aXRjaCB0byBz
aWJfaW5kZXggYXMgc291cmNlLiAqLwo+Pj4gKyAgICAgICAgcGV2ZXgtPnIgPSAhbW9kZV82NGJp
dCgpIHx8ICEoc3RhdGUtPnNpYl9pbmRleCAmIDB4MDgpOwo+Pj4gKyAgICAgICAgcGV2ZXgtPlIg
PSAhbW9kZV82NGJpdCgpIHx8ICEoc3RhdGUtPnNpYl9pbmRleCAmIDB4MTApOwo+Pj4gKyAgICAg
ICAgb3BjWzFdID0gKHN0YXRlLT5zaWJfaW5kZXggJiA3KSA8PCAzOwo+Pj4gKwo+Pj4gKyAgICAg
ICAgaW52b2tlX3N0dWIoIiIsICIiLCAiPW0iIChpbmRleCkgOiAiYSIgKCZpbmRleCkpOwo+Pj4g
KyAgICAgICAgcHV0X3N0dWIoc3R1Yik7Cj4+PiArCj4+PiArICAgICAgICAvKiBDbGVhciB1bnRv
dWNoZWQgcGFydHMgb2YgdGhlIGRlc3RpbmF0aW9uIGFuZCBtYXNrIHZhbHVlcy4gKi8KPj4+ICsg
ICAgICAgIG4gPSAxIDw8ICgyICsgZXZleC5sciAtICgoYiAmIDEpIHwgZXZleC53KSk7Cj4+PiAr
ICAgICAgICBvcF9ieXRlcyA9IDQgPDwgZXZleC53Owo+Pj4gKyAgICAgICAgbWVtc2V0KCh2b2lk
ICopbW12YWxwICsgbiAqIG9wX2J5dGVzLCAwLCA2NCAtIG4gKiBvcF9ieXRlcyk7Cj4+PiArICAg
ICAgICBvcF9tYXNrICY9ICgxIDw8IG4pIC0gMTsKPj4+ICsKPj4+ICsgICAgICAgIGZvciAoIGkg
PSAwOyBvcF9tYXNrOyArK2kgKQo+Pj4gKyAgICAgICAgewo+Pj4gKyAgICAgICAgICAgIHNpZ25l
ZCBsb25nIGlkeCA9IGIgJiAxID8gaW5kZXgucXdbaV0gOiBpbmRleC5kd1tpXTsKPj4gTm8gc2ln
bmVkLgo+IEhtbSAtIHdvdWxkIHlvdSBtaW5kIHRoaXMgcmVtYWluaW5nIGNvbnNpc3RlbnQgd2l0
aCB0aGUgQVZYCj4gY291bnRlcnBhcnQgY29kZT8gKEFzIGFuIGFzaWRlIEkgY29udGludWUgdG8g
dGhpbmsgaXQgaXMgYSBiYWQKPiB0aGluZyB0byBub3QgaGF2ZSBleHBsaWNpdCAic2lnbmVkIiB3
aGVuIHdlIGFjdHVhbGx5IG1lYW4gc2lnbmVkCj4gcXVhbnRpdGllcywgc2VlaW5nIHRoZSBzdGls
bCBsYXJnZSBhbW91bnQgb2YgcGxhaW4gc2hvcnQvaW50L2xvbmcKPiB1c2VzIHRoYXQgYWN0dWFs
bHkgc2hvdWxkIGJlIHVuc2lnbmVkLikKClRoYXQgd2FzIGNvbmNsdXNpdmVseSBvYmplY3RlZCB0
byBieSBtdWx0aXBsZSBvdGhlciBjb21taXR0ZXJzLCBmb3IgYQpudW1iZXIgb2YgcmVhc29ucy4K
Ckl0IGlzIHVuZm9ydHVuYXRlIHRoYXQgc29tZSBleGFtcGxlcyBzbGlwcGVkIGluLCBidXQgYXMg
dGhlIGNvZGluZyBzdHlsZQppcyBub3QgY2hhbmdpbmcsIHRoZXkgc2hvdWxkIGJlIHRha2VuIG91
dC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
