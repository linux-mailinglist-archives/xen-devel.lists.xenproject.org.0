Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0603ADBFE
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 17:19:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7LPM-0006GM-Ec; Mon, 09 Sep 2019 15:16:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RLmJ=XE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i7LPL-0006GF-25
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 15:16:47 +0000
X-Inumbo-ID: d59b4dbe-d314-11e9-ac0d-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d59b4dbe-d314-11e9-ac0d-12813bfff9fa;
 Mon, 09 Sep 2019 15:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568042206;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=aakAxGAx8wFLhpYxxc+Chs/lT7sPTOLoIJKKNAszjDA=;
 b=OuxAwg6KTrHPoSEM6rTK7sg33ykp3BAA5LzpDvQyDOyZc1yO6bXhl36I
 2e9zEe9kx3DL1rT9HOeek7cHZ66wSQloO9v925F9AdsyBLRrdN0srk7AK
 okRgguZ3vJwhvZ8OEWRna6wM8ZIdAnAnEPgVLiIAykxmqjscAafdRsT3t 8=;
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
IronPort-SDR: udRe4ptaZpDCYlIx1jTbeDHqbFCa+Z6Zytdh6+dO3X6F0IBUNGLPMv+M7OA14ctbpReYUdAGXh
 jnSIgADPPEqBH9b8OUJhZdxQca+RWy3o6xUDVf8nYkniDDThDV8heIjHiYUxAz7RIpYGGy7bJG
 HWcIm2kHD1J2PN+4VbkOGFAKOcf19t61eT+Zk+BvmQqJIS/k4/WFCKedUQcMtu1KGjUm5Cj2Pp
 YwVmvw/+wV14gXA4RGaQ3YIgntO2bblcQyE/a13jdjdOoB7V5MQHZZMBz7UJhwWzJJI7/iLOtW
 mLI=
X-SBRS: 2.7
X-MesageID: 5321644
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,486,1559534400"; 
   d="scan'208";a="5321644"
To: Ian Jackson <ian.jackson@citrix.com>
References: <20190909134333.10927-1-andrew.cooper3@citrix.com>
 <23926.24791.68467.930732@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <3d5a5fc2-4a9f-b0a5-52cc-c9ef8e1eebaa@citrix.com>
Date: Mon, 9 Sep 2019 16:16:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23926.24791.68467.930732@mariner.uk.xensource.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] tools/ocaml: Fix xenctrl ABI and
 introduce build-time checks
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
Cc: Wei Liu <wl@xen.org>, Rob Hoes <Rob.Hoes@citrix.com>,
 Edvin Torok <edvin.torok@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Roger
 Pau Monne <roger.pau@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDkvMjAxOSAxNToyNSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gQW5kcmV3IENvb3BlciB3
cml0ZXMgKCJbUEFUQ0ggdjJdIHRvb2xzL29jYW1sOiBGaXggeGVuY3RybCBBQkkgYW5kIGludHJv
ZHVjZSBidWlsZC10aW1lIGNoZWNrcyIpOgo+PiBjL3MgZjA4OWZkZGQ5NDEgYnJva2UgdGhlIE9j
YW1sIEFCSSBieSByZW51bWVyaW5nIFhFTl9TWVNDVExfUEhZU0NBUF9kaXJlY3Rpbwo+PiB3aXRo
b3V0IGFkanVzdGluZyB0aGUgT2NhbWwgcGh5c2luZm9fY2FwX2ZsYWcgZW51bWVyYXRpb24uICBG
aXggdGhpcyBieQo+PiBpbnNlcnRpbmcgQ0FQX1BWIGJldHdlZW4gQ0FQX0hWTSBhbmQgQ0FQX0Rp
cmVjdElPLgo+IC4uLgo+PiAgdHlwZSBwaHlzaW5mb19jYXBfZmxhZyA9Cj4+ICAJfCBDQVBfSFZN
Cj4+ICsJfCBDQVBfUFYKPj4gIAl8IENBUF9EaXJlY3RJTwo+IEl0IGlzIHN1cmVseSBzY2FuZGFs
b3VzIHRoYXQgd2UgaGFkIHRoaXMgb3Blbi1jb2RpbmcgaGVyZSBvZiBhCj4gZHVwbGljYXRpb24g
b2YgYSBYZW4gQUJJIGxpc3QuICBUaGFua3MgZm9yIHRyeWluZyB0byBmaXggaXQuCgpXZWxsIC0g
d29yc2UgaXMgaGF2aW5nIHR3byBvZiB0aGVtICh4ZW5jdHJsLm1sIGFuZCAubWxpKQoKSSB0aGlu
ayBpdCBpcyBhIHNpZGUgZWZmZWN0IG9mIHRyeWluZyB0byBleHByZXNzIGl0IGluIG1vcmUgaWRp
b21hdGljIE9jYW1sLgoKPgo+PiArLyoKPj4gKyAqIFZhcmlvdXMgZmllbGRzIHdoaWNoIGFyZSBh
IGJpdG1hcCBpbiB0aGUgQyBBQkkgYXJlIGNvbnZlcnRlZCB0byBsaXN0cyBvZgo+PiArICogaW50
ZWdlcnMgaW4gdGhlIE9jYW1sIEFCSSBmb3IgbW9yZSBpZGlvbWF0aWMgaGFuZGxpbmcuCj4gRXJy
LCBJIGRvbid0IHRoaW5rIHlvdSBtZWFuIGxpc3RzIG9mIGludGVnZXJzLiAgSSB0aGluayB5b3Ug
bWVhbgo+IGxpc3RzIGVudW1zLCB3aGljaCBoYXBwZW4gdG8gYmUgZW51bXMuCgpUaGUgZGlzdGlu
Y3Rpb24gYmV0d2VlbiBlbnVtcyBhbmQgaW50ZWdlcnMgaW4gT2NhbWwgaXMgZnV6enksIGJlY2F1
c2UKZW51bXMgYXJlIGRlZmluZWQgaW4gdGVybXMgb2YgdW5ib3hlZCBpbnRlZ2VycywgaGVuY2Ug
dGhlaXIgY29uc3RydWN0aW9uCndpdGggIlZhbF9pbnQoaSk7Ii4KClRoZSByZXR1cm4gdmFsdWUg
ZnJvbSB0aGlzIGZ1bmN0aW9uICppcyogYSBsaXN0IG9mIGludGVnZXJzLCB3aGljaCB3aWxsCmVp
dGhlciBiZSBpbnRlcnByZXRlZCBieSBPY2FtbCBhcyAieDg2X2FyY2hfZW11bGF0aW9uX2ZsYWdz
IGxpc3QiIG9yCiJwaHlzaW5mb19jYXBfZmxhZyBsaXN0IiBhcyBhcHByb3ByaWF0ZS4KCj4KPj4g
KwkgKiBlbXVsYXRpb25fZmxhZ3M6IHg4Nl9hcmNoX2VtdWxhdGlvbl9mbGFncyBsaXN0Owo+PiAr
CSAqCj4+ICsJICogVGhlc2UgQlVJTERfQlVHX09OKCkncyBtYXAgdGhlIEMgQUJJIHRvIHRoZSBP
Y2FtbCBBQkkuICBJZiB0aGV5Cj4+ICsJICogdHJpcCwgeGVuY3RybC5tbHssaX0gbmVlZCB1cGRh
dGluZyB0byBtYXRjaC4KPj4gKwkgKi8KPj4gKwlCVUlMRF9CVUdfT04oWEVOX1g4Nl9FTVVfTEFQ
SUMgICAgIT0gKDF1IDw8ICAwKSk7Cj4+ICsJQlVJTERfQlVHX09OKFhFTl9YODZfRU1VX0hQRVQg
ICAgICE9ICgxdSA8PCAgMSkpOwo+PiArCUJVSUxEX0JVR19PTihYRU5fWDg2X0VNVV9QTSAgICAg
ICAhPSAoMXUgPDwgIDIpKTsKPj4gKwlCVUlMRF9CVUdfT04oWEVOX1g4Nl9FTVVfUlRDICAgICAg
IT0gKDF1IDw8ICAzKSk7Cj4+ICsJQlVJTERfQlVHX09OKFhFTl9YODZfRU1VX0lPQVBJQyAgICE9
ICgxdSA8PCAgNCkpOwo+PiArCUJVSUxEX0JVR19PTihYRU5fWDg2X0VNVV9QSUMgICAgICAhPSAo
MXUgPDwgIDUpKTsKPj4gKwlCVUlMRF9CVUdfT04oWEVOX1g4Nl9FTVVfVkdBICAgICAgIT0gKDF1
IDw8ICA2KSk7Cj4+ICsJQlVJTERfQlVHX09OKFhFTl9YODZfRU1VX0lPTU1VICAgICE9ICgxdSA8
PCAgNykpOwo+PiArCUJVSUxEX0JVR19PTihYRU5fWDg2X0VNVV9QSVQgICAgICAhPSAoMXUgPDwg
IDgpKTsKPj4gKwlCVUlMRF9CVUdfT04oWEVOX1g4Nl9FTVVfVVNFX1BJUlEgIT0gKDF1IDw8ICA5
KSk7Cj4+ICsJQlVJTERfQlVHX09OKFhFTl9YODZfRU1VX1ZQQ0kgICAgICE9ICgxdSA8PCAxMCkp
Owo+IEkgcmVhbGx5IGRvbid0IGxpa2UgdGhpcyBhcHByb2FjaC4KCk5vciBtZSwgYnV0IGl0IHdh
cyB0aGUgb25seSB0aGluZyB3aGljaCBjYW1lIHRvIG1pbmQgd2hpY2ggZGlkbid0Cmludm9sdmUg
cmV3cml0aW5nIHBhcnQgb2YgdGhlIGJ1aWxkLgoKPiBJbnN0ZWFkIG9mIGF1dG9tYXRpY2FsbHkg
ZGVyaXZpbmcKPiB0aGUgb2NhbWwgZW51bSBmcm9tIHRoZSBYZW4gQUJJLCBvciBhdXRvbWF0aWNh
bGx5IGNoZWNraW5nIHRoYXQgdGhlCj4gb2NhbWwgQUJJIGFncmVlcyB3aXRoIHRoZSBYZW4gb25l
LCB5b3UgYXJlIGluc3RlYWQgYWRkaW5nIGEgbmV3IGxpc3QKPiB3aGljaCBkdXBsaWNhdGVzIHRo
ZSBvY2FtbCBBQkkuCj4KPiBJIHN1Z2dlc3Qgd2UgZG8gc29tZXRoaW5nIGluIHRoZSBidWlsZCBz
eXN0ZW0gLSBhIG5ldyBzY3JpcHQgb3Igc2hlbGwKPiBydW5lLCB3aGljaCBpcyBnaXZlbiB0aGUg
c3RyaW5ncyBgeDg2X2FyY2hfZW11bGF0aW9uX2ZsYWdzJyBhbmQKPiBgWDg2X0VNVScgKGFuZCBj
b3JyZXNwb25kaW5nbHkgZm9yIHRoZSBvdGhlciBlbnVtcykuCj4KPiBUaGUgbmV3IHRoaW5nIHdv
dWxkIHNlYXJjaCB4ZW5jdHJsLm1sW2ldIGZvciB0aGUgdHlwZSBhbmQgcmVhZCB0aGUKPiBlbnVt
IGxpc3QgdGhlcmUgd2l0aCBhbiBhZC1ob2Mgc2hvZGR5IG9jYW1sIHBhcnNlciBhbmQgdGhlbiBk
byBvbmUgb3IKPiBtb3JlIG9mOgo+Cj4gKGEpIHN5bnRoZXNpc2UgdGhlIGVudW0gY29udmVyc2lv
biBmdW5jdGlvbiB0byBtYXAgdGhlIGZsYWcKPiAgICAgbnVtYmVycyBiYWNrIGFuZCBmb3J0aCAo
aWUgdGhlIG51bWJlcnMgaW4gb2NhbWwgd291bGQgbm8KPiAgICAgbG9uZ2VyIG5lZWQgdG8gbWF0
Y2gpCgpUaGUgY3VycmVudCBjb2RlIGRlcGVuZHMgb24gdGhlIE9jYW1sIGNvbnN0YW50cyBiZWlu
ZyB0aGUgbG9nYXJpdGhtIG9mCnRoZSBDIGNvbnN0YW50cyBzbyB0aGF0IHRoZSBjb252ZXJzaW9u
IGlzIGVhc3kuCgpXaGlsZSB0aGlzIGlzbid0IGEgaGFyZCByZXF1aXJlbWVudCwgYW55dGhpbmcg
bW9yZSBjb21wbGljYXRlZCBzaG91bGQKaGF2ZSBhIGNvbXBlbGxpbmcgcmVhc29uIHRvIHVzZS4K
Cj4gKGIpIHN5bnRoZXNpc2UgdGhlIEJVSUxEX0JVR19PTiBsaXN0IHlvdSBoYXZlIGFib3ZlCj4K
PiAoYykgc2VhcmNoIHRoZSBYZW4gaGVhZGVycyBpdHNlbGYgYW5kIGNoZWNrIHRoZSB2YWx1ZSBj
b3JyZXNwb25kZW5jZXMKClRoaXMgd291bGQgdGhlbiByZXN1bHQgaW4gdHdvIGFkLWhvYyBzaG9k
ZHkgcGFyc2Vycywgd2hpY2ggSSBkb24ndCB0aGluawppcyBhIGRpcmVjdGlvbiB3ZSB3YW50IHRv
IGdvLgoKT3B0aW9uIChiKSBzZWVtcyB0byBiZSB0aGUgbGVhc3QgYmFkIGFsdGVybmF0aXZlLgoK
VGhlIGNvbW1vbiBjYXNlIG5lZWRpbmcgY2F0Y2hpbmcgaXMgc29tZW9uZSBhZGRpbmcgYSBjb25z
dGFudCB0byB0aGUgQwpBQkkuwqAgVGhpcyBpcyB3aHkgdGhlIEJVSUxEX0JVR19PTigpJ3MgYWdh
aW5zdCBYRU5fWDg2X0VNVV9BTEwgYW5kClhFTl9TWVNDVExfUEhZU0NBUF9NQVggZXhpc3QuwqAg
VGhlIGxpc3Qgb2YgaW5kaXZpZHVhbCBjb25zdGFudHMgd2FzIHRvCmNhdGNoIHRoZSByZW51bWJl
cmluZywgd2hpY2ggb3VnaHQgdG8gYmUgYSBtdWNoIHJhcmVyIGlzc3VlLgoKPgo+IElkZWFsbHkg
aXQgd291bGQgaGF2ZSBiZWVuIGJldHRlciB0byBhdXRvbWF0aWNhbGx5IGdlbmVyYXRlCj4geGVu
Y3RybC5tbFtpXSBmcm9tIHRoZSBYZW4gaGVhZGVycyBidXQgSSByZWplY3RlZCB0aGF0IGFzIGJl
aW5nIHRvbwo+IG11Y2ggYW5ub3lpbmcgaW50ZXJhY3Rpb24gd2l0aCB0aGUgb2NhbWwgYnVpbGQu
CgpUaGUgaW50ZXJmYWNlIGhlcmUgaXMgYSBzdWJzZXQgb2Ygc29tZSBoZWFkZXJzLCBhbmQgc3Vw
ZXJzZXQgb2Ygb3RoZXJzLsKgCkF1dG9tYXRpY2FsbHkgZ2VuZXJhdGluZyBpdCBpc24ndCBmZWFz
aWJsZSBJTU8sIGVzcGVjaWFsbHkgYXMgd2UgaGF2ZQppbmNvbnNpc3RlbnQgd2F5cyBvZiBkb2lu
ZyBzaW1pbGFyIHRoaW5ncy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
