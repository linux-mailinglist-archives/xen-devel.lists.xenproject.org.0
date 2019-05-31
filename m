Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1490E3116B
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 17:36:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWjW2-0003iX-Iq; Fri, 31 May 2019 15:32:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zAi+=T7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hWjW0-0003iS-7c
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 15:32:20 +0000
X-Inumbo-ID: 461b2e8c-83b9-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 461b2e8c-83b9-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 15:32:18 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: PuGdx88xKm3Uqu37vSJ5vk57ljIOJW8dxZ5r8nowbnt9lq4ZcHhbFZ8JCdyCJG7m7qnaYFp6o7
 s/V/Xqgo/DYZLTWayiYBbK6nY0VfGPKlDd8SfxZrJA1YL41D5p4CGnoLnmHx01Bsc/D3LvryX2
 IQRg6/NundZvwBBJV8WX0xyA3XWqSXePY4l/8pnD2px4A/vGXhb2/1qKp9aKAWqhrRWaknzdZW
 JFDXYx01clLEwWbShHzmouS/98fXkrPEIHNghYPiktssAEk4nd4N43QcbYkbdMv9du/9I0S6Z4
 xrA=
X-SBRS: 2.7
X-MesageID: 1161961
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,535,1549947600"; 
   d="scan'208";a="1161961"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5460200007800233DA8@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a30a6fc9-5c3c-081b-d268-231e89f135be@citrix.com>
Date: Fri, 31 May 2019 08:32:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5CF0F5460200007800233DA8@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/2] adjust special domain creation (and
 call it earlier on x86)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEvMDUvMjAxOSAwMjozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQEAgLTUxNiw2ICs1MjEs
MzYgQEAgc3RydWN0IGRvbWFpbiAqZG9tYWluX2NyZWF0ZShkb21pZF90IGRvbQo+ICAgICAgcmV0
dXJuIEVSUl9QVFIoZXJyKTsKPiAgfQo+ICAKPiArdm9pZCBfX2luaXQgc2V0dXBfc3BlY2lhbF9k
b21haW5zKHZvaWQpCj4gK3sKPiArICAgIC8qCj4gKyAgICAgKiBJbml0aWFsaXNlIG91ciBET01J
RF9YRU4gZG9tYWluLgo+ICsgICAgICogQW55IFhlbi1oZWFwIHBhZ2VzIHRoYXQgd2Ugd2lsbCBh
bGxvdyB0byBiZSBtYXBwZWQgd2lsbCBoYXZlCj4gKyAgICAgKiB0aGVpciBkb21haW4gZmllbGQg
c2V0IHRvIGRvbV94ZW4uCj4gKyAgICAgKiBIaWRkZW4gUENJIGRldmljZXMgd2lsbCBhbHNvIGJl
IGFzc29jaWF0ZWQgd2l0aCB0aGlzIGRvbWFpbgo+ICsgICAgICogKGJ1dCBiZSBbcGFydGx5XSBj
b250cm9sbGVkIGJ5IERvbTAgbmV2ZXJ0aGVsZXNzKS4KPiArICAgICAqLwo+ICsgICAgZG9tX3hl
biA9IGRvbWFpbl9jcmVhdGUoRE9NSURfWEVOLCBOVUxMLCBmYWxzZSk7Cj4gKyAgICBCVUdfT04o
SVNfRVJSKGRvbV94ZW4pKTsKCkkga25vdyB0aGlzIGlzIGNvcHlpbmcgY29kZSBsaWtlLWZvci1s
aWtlLCBidXQgdGhpcyBlcnJvciBoYW5kbGluZyBpcwp0ZXJyaWJsZSBpbiBwcmFjdGljZS4KCkV2
ZW4ganVzdDoKCmlmICggSVNfRVJSKGRvbV94ZW4pICkKwqDCoMKgIHBhbmljKCJGYWlsZWQgdG8g
Y3JlYXRlIGRvbV94ZW46ICVkXG4iLCBQVFJfRVJSKGRvbV94ZW4pKTsKCndvdWxkIGJlIGFuIGlt
cHJvdmVtZW50LgoKPiArI2lmZGVmIENPTkZJR19IQVNfUENJCj4gKyAgICBJTklUX0xJU1RfSEVB
RCgmZG9tX3hlbi0+YXJjaC5wZGV2X2xpc3QpOwo+ICsjZW5kaWYKClRoZSBwb3NpdGlvbiBvZiB0
aGlzIGlkZW50aWZpZXMgdGhhdCB3ZSd2ZSBnb3Qgb2J2aW91c2x5IGdvdCBidWdzCihwZXJoYXBz
IGxhdGVudCkgZWxzZXdoZXJlLCBzZWVpbmcgYXMgb3RoZXIgc3BlY2lhbCBkb21haW5zIGRvbid0
IGdldAp3b3JraW5nIGNvbnN0cnVjdHMgc3VjaCBhcyBsaXN0X2VtcHR5KCkuCgpJbiB0aGUgY29k
ZSB3aGljaCBjdXJyZW50bHkgZXhpc3RzLCBJIGNhbid0IHNwb3QgaXQgZXZlciBiZWluZyB0b3Vj
aGVkCmZvciBBUk0sIGJ1dCBpdCBpcyBjb25zdHJ1Y3RlZCBmb3IgYWxsIG5vbi1zcGVjaWFsIHg4
NiBndWVzdHMgYXQgdGhlIHRvcApvZiBhcmNoX2RvbWFpbl9jcmVhdGUoKS4KCkkgdGhpbmsgdGhl
IGJlc3Qgb3B0aW9uLCBnaXZlbiB0aGUgI2lmZGVmIGhlcmUsIGlzIHRvIHJlcG9zaXRpb24gdGhl
CnBkZXYgZmllbGRzIGludG8gc3RydWN0IGRvbWFpbiwgcmF0aGVyIHRoYW4gYXJjaF9kb21haW4s
IGFuZCBoYXZlIHRoaXMKY29kZSBmcmFnbWVudCBuZWFyIHRoZSB0b3Agb2YgZG9tYWluX2NyZWF0
ZSgpIHdoZXJlIHNwZWNpYWwgZG9tYWlucyB3aWxsCmFsbCBiZSBjb3ZlcmVkLgoKfkFuZHJldwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
