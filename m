Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B27BDFEF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 16:23:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD88f-0006px-3r; Wed, 25 Sep 2019 14:19:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZcR2=XU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iD88d-0006pQ-G3
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 14:19:27 +0000
X-Inumbo-ID: 7a90cfba-df9f-11e9-bf31-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 7a90cfba-df9f-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 14:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569421167;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Y6h6phR0C4EyoJnHTzLiEKZtcF3lVW0ydTiZaukCPeA=;
 b=WBlYcG0vyXLf5OQshIjCIf1y+JxNU8qhiUmeaAvxIx1Zykk3MJ5AACYX
 DvJnKgXipeWA1m1F+e5iHxtDK5fwo7c0w6pS4Gq+sLZEiEv8VKVouFhCu
 r9st8wB4sgVW6Du5x5hSKuZi9kYzqjgVH85paPgnFM2VQ5VNrOGJvGPYo M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: il8dw7Pw9KnKzJrd5vjXMM/oxVkQ2DTlBBbNQEtGCs2MSaib2UJgjXc6eb/5HpBHuG0NolnoGU
 DmSiHJqeP/wOF0BoiphQr7wHthX72jre4iYMwy8lCrx4Wsf0BA5HPlgb1qnvTTetmMDPt6tFJ/
 veQaJZEf3dQ3AN83v95fqIAOyeT4SjWxUs8/27Wv/iulAOLT2axTe/I1ABzutllcYNBOwlUsHn
 Clv16AHtfNJZQqemKI932/9YUotPsh6sPkiis9IUgRO2K5Pj24u1Y5HE91+ZfJZpPZxx2vmKjD
 9X4=
X-SBRS: 2.7
X-MesageID: 6117116
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,548,1559534400"; 
   d="scan'208";a="6117116"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <e0a904bf-b6a0-6224-88f6-e89a95867718@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <220c3d44-6186-fa9c-4f99-2e8c34bbc0ce@citrix.com>
Date: Wed, 25 Sep 2019 15:19:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e0a904bf-b6a0-6224-88f6-e89a95867718@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v6 7/8] AMD/IOMMU: allocate one device table
 per PCI segment
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
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDkvMjAxOSAxNDoyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSGF2aW5nIGEgc2luZ2xl
IGRldmljZSB0YWJsZSBmb3IgYWxsIHNlZ21lbnRzIGNhbid0IHBvc3NpYmx5IGJlIHJpZ2h0LgoK
VGhhdCBkZXBlbmRzIG9uIHlvdXIgcG9pbnQgb2Ygdmlldy7CoCBHaXZlbiB0aGF0IHRoZXJlIGFy
ZW4ndCBBTUQgc3lzdGVtcwoob3IgcmVhbGx5LCB4ODYgc3lzdGVtcyBpbiBnZW5lcmFsKSB3aXRo
IHNlZ21lbnRzIG90aGVyIHRoYW4gemVybywgYQpzaW5nbGUgZGV2aWNlIHRhYmxlIGlzIHJlYXNv
bmFibGUsIGV2ZW4gaWYgbm90IG92ZXJseS1mb3J3YXJkIGNvbXBhdGlibGUuCgo+IC0tLSBhL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKPiArKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCj4gQEAgLTEwNjgsOCArMTA2NywyOSBAQCBz
dGF0aWMgdm9pZCAqIF9faW5pdCBhbGxvY2F0ZV9wcHJfbG9nKHN0Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgSU9NTVVfUFBSX0xPR19ERUZBVUxUX0VOVFJJRVMsICJQUFIgTG9n
Iik7Cj4gIH0KPiAgCj4gKy8qCj4gKyAqIFdpdGhpbiBpdnJzX21hcHBpbmdzW10gd2UgYWxsb2Nh
dGUgYW4gZXh0cmEgYXJyYXkgZWxlbWVudCB0byBzdG9yZQo+ICsgKiAtIHNlZ21lbnQgbnVtYmVy
LAo+ICsgKiAtIGRldmljZSB0YWJsZS4KPiArICovCj4gKyNkZWZpbmUgSVZSU19NQVBQSU5HU19T
RUcobSkgKG0pW2l2cnNfYmRmX2VudHJpZXNdLmR0ZV9yZXF1ZXN0b3JfaWQKPiArI2RlZmluZSBJ
VlJTX01BUFBJTkdTX0RFVlRBQihtKSAobSlbaXZyc19iZGZfZW50cmllc10uaW50cmVtYXBfdGFi
bGUKPiArCj4gK3N0YXRpYyB2b2lkIF9faW5pdCBmcmVlX2l2cnNfbWFwcGluZyh2b2lkICpwdHIp
CgpBIHBvaW50ZXIgdG8gdGhpcyBmdW5jdGlvbiBnZXRzIHN0YXNoZWQgaW4gYSBub24taW5pdCBy
YWRpeCB0cmVlLCBhbmQKZ2V0cyBpbnZva2VkIGJ5IGEgbm9uLWluaXQgZnVuY3Rpb24gKHJhZGl4
X3RyZWVfZGVzdHJveSkuwqAgSXQgc2hvdWxkbid0CmJlIF9faW5pdC4KCj4gK3sKPiArICAgIGNv
bnN0IHN0cnVjdCBpdnJzX21hcHBpbmdzICppdnJzX21hcHBpbmdzID0gcHRyOwo+ICsKPiArICAg
IGlmICggSVZSU19NQVBQSU5HU19ERVZUQUIoaXZyc19tYXBwaW5ncykgKQo+ICsgICAgICAgIGRl
YWxsb2NhdGVfYnVmZmVyKElWUlNfTUFQUElOR1NfREVWVEFCKGl2cnNfbWFwcGluZ3MpLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgIGR0X2FsbG9jX3NpemUoKSk7Cj4gKwo+ICsgICAgeGZy
ZWUocHRyKQo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IF9faW5pdCBhbWRfaW9tbXVfaW5pdF9vbmUo
c3RydWN0IGFtZF9pb21tdSAqaW9tbXUsIGJvb2wgaW50cikKPiAgewo+ICsgICAgY29uc3Qgc3Ry
dWN0IGl2cnNfbWFwcGluZ3MgKml2cnNfbWFwcGluZ3M7Cj4gKwo+ICAgICAgaWYgKCBhbGxvY2F0
ZV9jbWRfYnVmZmVyKGlvbW11KSA9PSBOVUxMICkKPiAgICAgICAgICBnb3RvIGVycm9yX291dDsK
PiAgCj4gQEAgLTEwODIsMTMgKzExMDIsMTUgQEAgc3RhdGljIGludCBfX2luaXQgYW1kX2lvbW11
X2luaXRfb25lKHN0cgo+ICAgICAgaWYgKCBpbnRyICYmICFzZXRfaW9tbXVfaW50ZXJydXB0X2hh
bmRsZXIoaW9tbXUpICkKPiAgICAgICAgICBnb3RvIGVycm9yX291dDsKPiAgCj4gLSAgICAvKiBU
byBtYWtlIHN1cmUgdGhhdCBkZXZpY2VfdGFibGUuYnVmZmVyIGhhcyBiZWVuIHN1Y2Nlc3NmdWxs
eSBhbGxvY2F0ZWQgKi8KPiAtICAgIGlmICggZGV2aWNlX3RhYmxlLmJ1ZmZlciA9PSBOVUxMICkK
PiArICAgIC8qIE1ha2Ugc3VyZSB0aGF0IHRoZSBkZXZpY2UgdGFibGUgaGFzIGJlZW4gc3VjY2Vz
c2Z1bGx5IGFsbG9jYXRlZC4gKi8KPiArICAgIGl2cnNfbWFwcGluZ3MgPSBnZXRfaXZyc19tYXBw
aW5ncyhpb21tdS0+c2VnKTsKPiArICAgIGlmICggIUlWUlNfTUFQUElOR1NfREVWVEFCKGl2cnNf
bWFwcGluZ3MpICkKClRoaXMgaXNuJ3Qgc2FmZS7CoCBnZXRfaXZyc19tYXBwaW5ncygpIHJldHVy
bnMgTlVMTCBvbiBmYWlsdXJlLCB3aGljaApJVlJTX01BUFBJTkdTX0RFVlRBQigpIGRlcmVmZXJl
bmNlcyB0byBmaW5kIHRoZSBkZXZpY2UgdGFibGUgcG9pbnRlci4KCn5BbmRyZXcKCj4gICAgICAg
ICAgZ290byBlcnJvcl9vdXQ7Cj4gIAo+IC0gICAgaW9tbXUtPmRldl90YWJsZS5hbGxvY19zaXpl
ID0gZGV2aWNlX3RhYmxlLmFsbG9jX3NpemU7Cj4gLSAgICBpb21tdS0+ZGV2X3RhYmxlLmVudHJp
ZXMgPSBkZXZpY2VfdGFibGUuZW50cmllczsKPiAtICAgIGlvbW11LT5kZXZfdGFibGUuYnVmZmVy
ID0gZGV2aWNlX3RhYmxlLmJ1ZmZlcjsKPiArICAgIGlvbW11LT5kZXZfdGFibGUuYWxsb2Nfc2l6
ZSA9IGR0X2FsbG9jX3NpemUoKTsKPiArICAgIGlvbW11LT5kZXZfdGFibGUuZW50cmllcyA9IGlv
bW11LT5kZXZfdGFibGUuYWxsb2Nfc2l6ZSAvCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBJT01NVV9ERVZfVEFCTEVfRU5UUllfU0laRTsKPiArICAgIGlvbW11LT5kZXZfdGFibGUu
YnVmZmVyID0gSVZSU19NQVBQSU5HU19ERVZUQUIoaXZyc19tYXBwaW5ncyk7Cj4gIAo+ICAgICAg
ZW5hYmxlX2lvbW11KGlvbW11KTsKPiAgICAgIHByaW50aygiQU1ELVZpOiBJT01NVSAlZCBFbmFi
bGVkLlxuIiwgbnJfYW1kX2lvbW11cyApOwo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
