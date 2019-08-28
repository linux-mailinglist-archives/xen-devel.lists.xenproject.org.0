Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8B6A0118
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 13:54:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2wTy-0003GZ-Qv; Wed, 28 Aug 2019 11:51:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+/MF=WY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i2wTy-0003GU-6N
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 11:51:22 +0000
X-Inumbo-ID: 26e00a6e-c98a-11e9-ae45-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26e00a6e-c98a-11e9-ae45-12813bfff9fa;
 Wed, 28 Aug 2019 11:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566993081;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=aWRWhCl6KezS76z6ZLtsTJd6LbSiysmdpVVSqPAs+dk=;
 b=gMgbxDP8039ttCwNtGSoHcYstEXiX59FmbJEaRDh7YGNU/nnoyPOTkBN
 V4uT+emU6wacUH6WxE5YhQa9dGD0JIN3fsOL5rW+OkaB8GLyvcK9P1jD5
 V9vS1MobjF/iYmAoWgQxWPFoDo6JRJmIo87zPNFe5RE7ls+cLgIHDUTZ5 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6Hvu32RI4FwsroqhnSF9CCK518LVW+Q7Rnrsg5RfLgnFaZ/BYkbZv6w7GZmvfIa/GfT9XWGt29
 wz+c+M2Gdvzjvpl4CT1xALhvopoTWhnd8fVKXyDilwQTEgju9BBURWqjVgBlu6XLAFBG185JJt
 rtQLb/ghAw8gIYxX0eEnsgpbbVujZfWyFv+eCgrwkGe03OpmuoCF6d8iWHTuZwP4y0JuemV+CL
 8i/6TDXdWPKy2xO5S49piLy0GFfeUxpkbDR696JaaSMSfdFQaCcs8Lfe0Qw9rTqVtycoCk6amj
 OsE=
X-SBRS: 2.7
X-MesageID: 4813440
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,441,1559534400"; 
   d="scan'208";a="4813440"
To: Jan Beulich <jbeulich@suse.com>
References: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
 <667bafda-b811-9864-9ad3-95447a7fb62f@suse.com>
 <a7f91e8d-a550-73f8-9abc-33173a5be5e2@citrix.com>
 <545c2be3-9641-d9ff-291d-a0bf85fb3dd3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a792b2ec-4316-5e3a-fca1-9fadb64e23b9@citrix.com>
Date: Wed, 28 Aug 2019 12:51:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <545c2be3-9641-d9ff-291d-a0bf85fb3dd3@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 6/6] x86emul: support MOVDIR{I,64B} insns
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDgvMjAxOSAwNzoyNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjcuMDguMjAxOSAx
ODowNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDEvMDcvMjAxOSAxMjo1OCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBAQCAtOTg5Niw2ICs5OTAyLDMyIEBAIHg4Nl9lbXVsYXRlKAo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDogIjAiICgodWludDMyX3Qpc3JjLnZhbCksICJybSIKPj4+IChfcmVncy5lZHgpICk7Cj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+IMKgwqAgK8KgwqDCoCBjYXNlIFg4NkVN
VUxfT1BDXzY2KDB4MGYzOCwgMHhmOCk6IC8qIG1vdmRpcjY0YiByLG01MTIgKi8KPj4+ICvCoMKg
wqDCoMKgwqDCoCB2Y3B1X211c3RfaGF2ZShtb3ZkaXI2NGIpOwo+Pj4gK8KgwqDCoMKgwqDCoMKg
IGdlbmVyYXRlX2V4Y2VwdGlvbl9pZihlYS50eXBlICE9IE9QX01FTSwgRVhDX1VEKTsKPj4+ICvC
oMKgwqDCoMKgwqDCoCBzcmMudmFsID0gdHJ1bmNhdGVfZWEoKmRzdC5yZWcpOwo+Pj4gK8KgwqDC
oMKgwqDCoMKgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZighaXNfYWxpZ25lZCh4ODZfc2VnX2VzLCBz
cmMudmFsLCA2NCwKPj4+IGN0eHQsIG9wcyksCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBFWENfR1AsIDApOwo+Pj4gK8KgwqDC
oMKgwqDCoMKgIC8qIElnbm9yZSB0aGUgbm9uLXRlbXBvcmFsIGJlaGF2aW9yIGZvciBub3cuICov
Cj4+PiArwqDCoMKgwqDCoMKgwqAgZmFpbF9pZighb3BzLT53cml0ZSk7Cj4+PiArwqDCoMKgwqDC
oMKgwqAgQlVJTERfQlVHX09OKHNpemVvZigqbW12YWxwKSA8IDY0KTsKPj4+ICvCoMKgwqDCoMKg
wqDCoCBpZiAoIChyYyA9IG9wcy0+cmVhZChlYS5tZW0uc2VnLCBlYS5tZW0ub2ZmLCBtbXZhbHAs
IDY0LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGN0eHQpKSAhPSBYODZFTVVMX09LQVkgfHwKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKHJjID0gb3BzLT53cml0ZSh4ODZfc2VnX2VzLCBzcmMudmFsLCBtbXZhbHAsIDY0
LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY3R4dCkpICE9IFg4NkVNVUxfT0tBWSApCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBnb3RvIGRvbmU7Cj4+PiArwqDCoMKgwqDCoMKgwqAgc3RhdGUtPnNpbWRfc2l6ZSA9IHNp
bWRfbm9uZTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBzZmVuY2UgPSB0cnVlOwo+Pj4gK8KgwqDCoMKg
wqDCoMKgIGJyZWFrOwo+Pj4gKwo+Pj4gK8KgwqDCoCBjYXNlIFg4NkVNVUxfT1BDKDB4MGYzOCwg
MHhmOSk6IC8qIG1vdmRpcmkgbWVtLHIgKi8KPj4+ICvCoMKgwqDCoMKgwqDCoCB2Y3B1X211c3Rf
aGF2ZShtb3ZkaXJpKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBnZW5lcmF0ZV9leGNlcHRpb25faWYo
ZHN0LnR5cGUgIT0gT1BfTUVNLCBFWENfVUQpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIC8qIElnbm9y
ZSB0aGUgbm9uLXRlbXBvcmFsIGJlaGF2aW9yIGZvciBub3cuICovCj4+PiArwqDCoMKgwqDCoMKg
wqAgZHN0LnZhbCA9IHNyYy52YWw7Cj4+PiArwqDCoMKgwqDCoMKgwqAgc2ZlbmNlID0gdHJ1ZTsK
Pj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4KPj4gSSdtIG5vdCBjZXJ0YWluIHRoaXMgZ2l2
ZXMgdGhlIHJlcXVpcmVkIGF0b21pY2l0eS7CoCBBRkFJQ1QsIGl0IGRlZ3JhZGVzCj4+IGludG8g
b3BzLT53cml0ZSgpLCB3aGljaCBjYW4gZW5kIHVwIHdpdGggYnl0ZXdpc2Ugd3JpdGVzLgo+Pgo+
PiBJIHRoaW5rIHdlIG5lZWQgdG8gbWFwIHRoZSBkZXN0aW5hdGlvbiBhbmQgaXNzdWUgYW4gZXhw
bGljaXQgbW92Cj4+IGluc3RydWN0aW9uLgo+Cj4gSSBkb24ndCB0aGluayBzbywgbm8gLSBwbGFp
biBNT1YgaGFzIHRoZSBzYW1lIHByb3BlcnR5IChpbiBwYXJ0aWN1bGFyCj4gd2hlbiBub3QgZ29p
bmcgdGhyb3VnaCB0aGUgY2FjaGUpLCBhbmQgYWxzbyB1c2VzIHRoZSAtPndyaXRlKCkgaG9vay4K
PiBJdCdzIHRoZSBob29rIGZ1bmN0aW9uIHRoYXQgbmVlZHMgdG8gYmVoYXZlIHByb3Blcmx5IGZv
ciBhbGwgb2YgdGhpcwo+IHRvIGJlIGNvcnJlY3QuCgpJdCBvbmx5IG9jY3VycmVkIHRvIG1lIGFm
dGVyIHNlbmRpbmcgdGhpcyBlbWFpbCB0aGF0IHBsYWluIE1PViB3YXMKYnJva2VuIGFzIHdlbGwu
Cgo+Cj4+PiAtLS0gYS90b29scy90ZXN0cy94ODZfZW11bGF0b3IveDg2LWVtdWxhdGUuYwo+Pj4g
KysrIGIvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL3g4Ni1lbXVsYXRlLmMKPj4+IEBAIC03Niw2
ICs3Niw4IEBAIGJvb2wgZW11bF90ZXN0X2luaXQodm9pZCkKPj4+IMKgwqDCoMKgwqDCoCBjcC5m
ZWF0LmFkeCA9IHRydWU7Cj4+PiDCoMKgwqDCoMKgwqAgY3AuZmVhdC5hdng1MTJwZiA9IGNwLmZl
YXQuYXZ4NTEyZjsKPj4+IMKgwqDCoMKgwqDCoCBjcC5mZWF0LnJkcGlkID0gdHJ1ZTsKPj4+ICvC
oMKgwqAgY3AuZmVhdC5tb3ZkaXJpID0gdHJ1ZTsKPj4+ICvCoMKgwqAgY3AuZmVhdC5tb3ZkaXI2
NGIgPSB0cnVlOwo+Pj4gwqDCoMKgwqDCoMKgIGNwLmV4dGQuY2x6ZXJvID0gdHJ1ZTsKPj4+IMKg
wqAgwqDCoMKgwqDCoMKgIGlmICggY3B1X2hhc194c2F2ZSApCj4+PiBAQCAtMTM3LDE1ICsxMzks
MTUgQEAgaW50IGVtdWxfdGVzdF9jcHVpZCgKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlcy0+
YyB8PSAxVSA8PCAyMjsKPj4+IMKgwqAgwqDCoMKgwqDCoMKgIC8qCj4+PiAtwqDCoMKgwqAgKiBU
aGUgZW11bGF0b3IgZG9lc24ndCBpdHNlbGYgdXNlIEFEQ1gvQURPWC9SRFBJRCBub3IgdGhlIFMv
Rwo+Pj4gcHJlZmV0Y2gKPj4+IC3CoMKgwqDCoCAqIGluc25zLCBzbyB3ZSBjYW4gYWx3YXlzIHJ1
biB0aGUgcmVzcGVjdGl2ZSB0ZXN0cy4KPj4+ICvCoMKgwqDCoCAqIFRoZSBlbXVsYXRvciBkb2Vz
bid0IGl0c2VsZiB1c2UgQURDWC9BRE9YL1JEUElEL01PVkRJUiogbm9yCj4+PiB0aGUgUy9HCj4+
PiArwqDCoMKgwqAgKiBwcmVmZXRjaCBpbnNucywgc28gd2UgY2FuIGFsd2F5cyBydW4gdGhlIHJl
c3BlY3RpdmUgdGVzdHMuCj4+PiDCoMKgwqDCoMKgwqDCoCAqLwo+Pj4gwqDCoMKgwqDCoMKgIGlm
ICggbGVhZiA9PSA3ICYmIHN1YmxlYWYgPT0gMCApCj4+PiDCoMKgwqDCoMKgwqAgewo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmVzLT5iIHw9ICgxVSA8PCAxMCkgfCAoMVUgPDwgMTkpOwo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCByZXMtPmIgJiAoMVUgPDwgMTYpICkKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVzLT5iIHw9IDFVIDw8IDI2Owo+Pj4gLcKgwqDCoMKg
wqDCoMKgIHJlcy0+YyB8PSAxVSA8PCAyMjsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXMtPmMgfD0g
KDFVIDw8IDIyKSB8ICgxVSA8PCAyNykgfCAoMVUgPDwgMjgpOwo+Pgo+PiBJJ3ZlIGp1c3Qgbm90
aWNlZCwgYnV0IHdlIHNob3VsZG4ndCBiZSBoYXZpbmcgYm90aCB0aGUgbmFtZWQgdmFyaWFibGVz
Cj4+IGFuZCB0aGVzZSB1bm5hbWVkIG9uZXMuwqAgSXMgdGhlaXIgcHJlc2VuY2UgYSByZWJhc2lu
ZyBpc3N1ZSBhcm91bmQKPj4gcGF0Y2hlcyBpbnRvIHRoZSB0ZXN0IHN1aXRlPwo+Cj4gZW11bF90
ZXN0X2luaXQoKSBnYWluZWQgaXRzIGN1cnJlbnQgc2hhcGUgZnJvbSBmZDM1ZjMyYjRiLCB3aGls
ZQo+IGVtdWxfdGVzdF9jcHVpZCgpIGhhZCBiZWVuIGxlZnQgdW50b3VjaGVkIGF0IHRoYXQgcG9p
bnQuIFNvIEkgZ3Vlc3MKPiBpdCdzIG1vcmUgbGlrZSBhIGZvcmdvdHRlbiBwaWVjZSBvZiBjb252
ZXJzaW9uIHdvcmsuIEknbSB1bnN1cmUKPiB0aG91Z2ggd2hldGhlciBzdWNoIGEgY29udmVyc2lv
biBpcyBhY3R1YWxseSBhIGdvb2QgaWRlYSwgc2luY2UgYWl1aQo+IGl0IHdvdWxkIG1lYW4gY2xv
bmluZyBhdCBsZWFzdCBndWVzdF9jcHVpZCgpJ3MgZmlyc3Qgc3dpdGNoKCkgaW50bwo+IHRoaXMg
ZnVuY3Rpb24sIHdoaWNoIGlzIHF1aXRlIGEgYml0IG1vcmUgY29kZSB0aGFuIHRoZXJlIGlzIHJp
Z2h0Cj4gbm93LiBQZXJoYXBzICh0aGUgY29tbW9uIHBhcnQgb2YpIHRoYXQgc3dpdGNoKCkgY291
bGQgYmUgbW9ycGhlZAo+IGludG8gYSBsaWJyYXJ5IGZ1bmN0aW9uIC4uLgoKSSdsbCB0aHJvdyBp
dCBvbnRvIHRoZSBiaWcgcGlsZSBvZiBDUFVJRCB3b3JrLsKgIEl0IGlzIG5vdCB0cml2aWFsIHRv
CmxpYnJhcnktZnkgYmVjYXVzZSBvZiB0aGUgWGVuL1ZpcmlkaWFuIGxlYWYgaGFuZGxpbmcuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
