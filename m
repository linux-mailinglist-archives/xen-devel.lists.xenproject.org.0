Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E40B3F65
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 19:03:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9uNi-0003hG-JP; Mon, 16 Sep 2019 17:01:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hs3e=XL=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1i9uNg-0003h6-Pz
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 17:01:40 +0000
X-Inumbo-ID: a60530ee-d8a3-11e9-978d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a60530ee-d8a3-11e9-978d-bc764e2007e4;
 Mon, 16 Sep 2019 17:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568653300;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=W228p195deWKspLwGhqWt90YEHzHteQWwLxLnIRqjTw=;
 b=LxqyyprwPqHFosRTV06hKWt8eLsE2NncrXgyDFma33u6eW9E2BFsSO/n
 +nuVAeYXOiGPnYyLufbr0Yze6beIhzkOsDRV308ka+rGhX9Rp7ZdI3XFo
 M7n37rNux2nvI6aw+/Rz+9Equ9A9tEGfsJOf98nCrqn4TASgQxJ8K2+wu g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ceSgkquiHdjgVe2Umak8N2HMH6rLYoLDdH4yi+HOckWBLuPjiZz32/+f01SPsZbS4z+oibaKgW
 M374DvQ/t8GJv2nLL3nV6K8/25q+M5gTHE+G+sdH6nWPSud2h+MImtJHU+Mmg3CY6xHiuOuDkN
 Bz77q9fB3Fl3gGj6nNnOG6OUeuc8rzfeP2WV9t9L4eTpfUXQbFFqMfACk8qEXdm/wEu5cIi6Su
 DV8q5122WlL0aAb6wPsEIC0pvL7GekJfRs3nNJvTWiQB92euEJl7ngOMHRKCWykrgZW9+DiEd2
 IcM=
X-SBRS: 2.7
X-MesageID: 5683247
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,513,1559534400"; 
   d="scan'208";a="5683247"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>,
 <xen-devel@lists.xenproject.org>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-3-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <559ee54f-c962-1f3f-8291-9b5a1a6f9591@citrix.com>
Date: Mon, 16 Sep 2019 18:01:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916105945.93632-3-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 02/12] livepatch: Allow to override
 inter-modules buildid dependency
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xNi8xOSAxMTo1OSBBTSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6CnNuaXAKPiAr
LyoKPiArICogUGFyc2UgdXNlciBwcm92aWRlZCBhY3Rpb24gZmxhZ3MuCj4gKyAqIFRoaXMgZnVu
Y3Rpb24gZXhwZWN0cyB0byBvbmx5IHJlY2VpdmUgYW4gYXJyYXkgb2YgaW5wdXQgcGFyYW1ldGVy
cyBiZWluZyBmbGFncy4KPiArICogRXhwZWN0ZWQgYWN0aW9uIGlzIHNwZWNpZmllZCB2aWEgaWR4
IHBhcmFtYXRlciAoaW5kZXggb2YgZmxhZ19vcHRpb25zW10pLgo+ICsgKi8KPiArc3RhdGljIGlu
dCBnZXRfZmxhZ3MoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSwgdW5zaWduZWQgaW50IGlkeCwgdWlu
dDY0X3QgKmZsYWdzKQo+ICt7Cj4gKyAgICBpbnQgaSwgajsKPiArCj4gKyAgICBpZiAoICFmbGFn
cyB8fCBpZHggPj0gQVJSQVlfU0laRShmbGFnX29wdGlvbnMpICkKPiArICAgICAgICByZXR1cm4g
LTE7Cj4gKwo+ICsgICAgKmZsYWdzID0gMDsKPiArICAgIGZvciAoIGkgPSAwOyBpIDwgYXJnYzsg
aSsrICkKPiArICAgIHsKPiArICAgICAgICBmb3IgKCBqID0gMDsgaiA8IEFSUkFZX1NJWkUoZmxh
Z19vcHRpb25zW2lkeF0pOyBqKysgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgaWYgKCAh
ZmxhZ19vcHRpb25zW2lkeF1bal0ubmFtZSApCj4gKyAgICAgICAgICAgICAgICBnb3RvIGVycm9y
Owo+ICsKPiArICAgICAgICAgICAgaWYgKCAhc3RyY21wKGZsYWdfb3B0aW9uc1tpZHhdW2pdLm5h
bWUsIGFyZ3ZbaV0pICkKPiArICAgICAgICAgICAgewo+ICsgICAgICAgICAgICAgICAgKmZsYWdz
IHw9IGZsYWdfb3B0aW9uc1tpZHhdW2pdLmZsYWc7Cj4gKyAgICAgICAgICAgICAgICBicmVhazsK
PiArICAgICAgICAgICAgfQo+ICsgICAgICAgIH0KPiArCj4gKyAgICAgICAgaWYgKCBqID09IEFS
UkFZX1NJWkUoZmxhZ19vcHRpb25zW2lkeF0pICkKPiArICAgICAgICAgICAgZ290byBlcnJvcjsK
PiArICAgIH0KPiArCj4gKyAgICByZXR1cm4gMDsKPiArZXJyb3I6Cj4gKyAgICBmcHJpbnRmKHN0
ZGVyciwgIlVuc3VwcG9ydGVkIGZsYWc6ICVzLlxuIiwgYXJndltpXSk7Cj4gKyAgICBlcnJubyA9
IEVJTlZBTDsKPiArICAgIHJldHVybiBlcnJubzsKPiArfQoKWW91IHJldHVybiAtMSBhYm92ZSBi
dXQgK3ZlIGVycm5vIGhlcmUuIFBsZWFzZSBtYWtlIGl0IGNvbnNpc3RlbnQuCkFsc28sIHlvdSBk
b24ndCBuZWVkIHRvIHNldCBlcnJubyBpZiByZXR1cm5pbmcgdGhlIGFjdHVhbCBlcnJvci4KCihU
aGUgZXJyb3IgaGFuZGxpbmcgaW4gdGhpcyBmaWxlIGxvb2tzIGZhaXJseSBpbmNvbnNpc3RlbnQg
YW55d2F5IGJ1dCAKbGV0J3Mgbm90IG1ha2UgaXQgd29yc2UuKQoKPiArCj4gICAvKiBUaGUgaHlw
ZXJ2aXNvciB0aW1lb3V0IGZvciB0aGUgbGl2ZSBwYXRjaGluZyBvcGVyYXRpb24gaXMgMzAgbXNl
YywKPiAgICAqIGJ1dCBpdCBjb3VsZCB0YWtlIHNvbWUgdGltZSBmb3IgdGhlIG9wZXJhdGlvbiB0
byBzdGFydCwgc28gd2FpdCB0d2ljZQo+ICAgICogdGhhdCBwZXJpb2QuICovCj4gQEAgLTI5MSw4
ICszNTcsOSBAQCBpbnQgYWN0aW9uX2Z1bmMoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSwgdW5zaWdu
ZWQgaW50IGlkeCkKPiAgICAgICBjaGFyIG5hbWVbWEVOX0xJVkVQQVRDSF9OQU1FX1NJWkVdOwo+
ICAgICAgIGludCByYzsKPiAgICAgICB4ZW5fbGl2ZXBhdGNoX3N0YXR1c190IHN0YXR1czsKPiAr
ICAgIHVpbnQ2NF90IGZsYWdzOwo+ICAgCj4gLSAgICBpZiAoIGFyZ2MgIT0gMSApCj4gKyAgICBp
ZiAoIGFyZ2MgPCAxICkKPiAgICAgICB7Cj4gICAgICAgICAgIHNob3dfaGVscCgpOwo+ICAgICAg
ICAgICByZXR1cm4gLTE7Cj4gQEAgLTMwMSw3ICszNjgsMTAgQEAgaW50IGFjdGlvbl9mdW5jKGlu
dCBhcmdjLCBjaGFyICphcmd2W10sIHVuc2lnbmVkIGludCBpZHgpCj4gICAgICAgaWYgKCBpZHgg
Pj0gQVJSQVlfU0laRShhY3Rpb25fb3B0aW9ucykgKQo+ICAgICAgICAgICByZXR1cm4gLTE7Cj4g
ICAKPiAtICAgIGlmICggZ2V0X25hbWUoYXJnYywgYXJndiwgbmFtZSkgKQo+ICsgICAgaWYgKCBn
ZXRfbmFtZShhcmdjLS0sIGFyZ3YrKywgbmFtZSkgKQo+ICsgICAgICAgIHJldHVybiBFSU5WQUw7
Cj4gKwo+ICsgICAgaWYgKCBnZXRfZmxhZ3MoYXJnYywgYXJndiwgaWR4LCAmZmxhZ3MpICkKPiAg
ICAgICAgICAgcmV0dXJuIEVJTlZBTDsKPiAgIAo+ICAgICAgIC8qIENoZWNrIGluaXRpYWwgc3Rh
dHVzLiAqLwo+IEBAIC0zMzIsNyArNDAyLDcgQEAgaW50IGFjdGlvbl9mdW5jKGludCBhcmdjLCBj
aGFyICphcmd2W10sIHVuc2lnbmVkIGludCBpZHgpCj4gICAgICAgaWYgKCBhY3Rpb25fb3B0aW9u
c1tpZHhdLmFsbG93ICYgc3RhdHVzLnN0YXRlICkKPiAgICAgICB7Cj4gICAgICAgICAgIHByaW50
ZigiJXMgJXMuLi4gIiwgYWN0aW9uX29wdGlvbnNbaWR4XS52ZXJiLCBuYW1lKTsKPiAtICAgICAg
ICByYyA9IGFjdGlvbl9vcHRpb25zW2lkeF0uZnVuY3Rpb24oeGNoLCBuYW1lLCBIWVBFUlZJU09S
X1RJTUVPVVRfTlMpOwo+ICsgICAgICAgIHJjID0gYWN0aW9uX29wdGlvbnNbaWR4XS5mdW5jdGlv
bih4Y2gsIG5hbWUsIEhZUEVSVklTT1JfVElNRU9VVF9OUywgZmxhZ3MpOwo+ICAgICAgICAgICBp
ZiAoIHJjICkKPiAgICAgICAgICAgewo+ICAgICAgICAgICAgICAgaW50IHNhdmVkX2Vycm5vID0g
ZXJybm87Cj4gQEAgLTM5NCwxNyArNDY0LDIzIEBAIGludCBhY3Rpb25fZnVuYyhpbnQgYXJnYywg
Y2hhciAqYXJndltdLCB1bnNpZ25lZCBpbnQgaWR4KQo+ICAgCj4gICBzdGF0aWMgaW50IGxvYWRf
ZnVuYyhpbnQgYXJnYywgY2hhciAqYXJndltdKQo+ICAgewo+IC0gICAgaW50IHJjOwo+IC0gICAg
Y2hhciAqbmV3X2FyZ3ZbMl07Cj4gLSAgICBjaGFyICpwYXRoLCAqbmFtZSwgKmxhc3Rkb3Q7Cj4g
KyAgICBpbnQgaSwgcmMgPSBFTk9NRU07Cj4gKyAgICBjaGFyICp1cGxvYWRfYXJndlsyXTsKPiAr
ICAgIGNoYXIgKiphcHBseV9hcmd2LCAqcGF0aCwgKm5hbWUsICpsYXN0ZG90Owo+ICAgCj4gLSAg
ICBpZiAoIGFyZ2MgIT0gMSApCj4gKyAgICBpZiAoIGFyZ2MgPCAxICkKPiAgICAgICB7Cj4gICAg
ICAgICAgIHNob3dfaGVscCgpOwo+ICAgICAgICAgICByZXR1cm4gLTE7Cj4gICAgICAgfQo+ICsK
PiArICAgIC8qIGFwcGx5IGFjdGlvbiBoYXMgPGlkPiBbZmxhZ3NdIGlucHV0IHJlcXVpcmVtZW50
LCB3aGljaCBtdXN0IGJlIGNvbnN0cnVjdGVkICovCj4gKyAgICBhcHBseV9hcmd2ID0gKGNoYXIg
KiopIG1hbGxvYyhhcmdjICogc2l6ZW9mKCphcHBseV9hcmd2KSk7Cj4gKyAgICBpZiAoICFhcHBs
eV9hcmd2ICkKPiArICAgICAgICByZXR1cm4gcmM7Cj4gKwo+ICAgICAgIC8qIDxmaWxlPiAqLwo+
IC0gICAgbmV3X2FyZ3ZbMV0gPSBhcmd2WzBdOwo+ICsgICAgdXBsb2FkX2FyZ3ZbMV0gPSBhcmd2
WzBdOwo+ICAgCj4gICAgICAgLyogU3ludGhlc2l6ZSB0aGUgPGlkPiAqLwo+ICAgICAgIHBhdGgg
PSBzdHJkdXAoYXJndlswXSk7Cj4gQEAgLTQxMywxNiArNDg5LDIzIEBAIHN0YXRpYyBpbnQgbG9h
ZF9mdW5jKGludCBhcmdjLCBjaGFyICphcmd2W10pCj4gICAgICAgbGFzdGRvdCA9IHN0cnJjaHIo
bmFtZSwgJy4nKTsKPiAgICAgICBpZiAoIGxhc3Rkb3QgIT0gTlVMTCApCj4gICAgICAgICAgICps
YXN0ZG90ID0gJ1wwJzsKPiAtICAgIG5ld19hcmd2WzBdID0gbmFtZTsKPiArICAgIHVwbG9hZF9h
cmd2WzBdID0gbmFtZTsKPiArICAgIGFwcGx5X2FyZ3ZbMF0gPSBuYW1lOwo+ICAgCj4gLSAgICBy
YyA9IHVwbG9hZF9mdW5jKDIgLyogPGlkPiA8ZmlsZT4gKi8sIG5ld19hcmd2KTsKPiArICAgIC8q
IEZpbGwgaW4gYWxsIHVzZXIgcHJvdmlkZWQgZmxhZ3MgKi8KPiArICAgIGZvciAoIGkgPSAwOyBp
IDwgYXJnYyAtIDE7IGkrKyApCj4gKyAgICAgICAgYXBwbHlfYXJndltpICsgMV0gPSBhcmd2W2kg
KyAxXTsKCldvdWxkbid0IHRoaXMgbWFrZSB0aGUgbG9vcCBib2R5IHNpbXBsZXI/ICBpID0gMTsg
aSA8IGFyZ2M7CgpPciBhbHRlcm5hdGl2ZWx5LCBqdXN0IGEgc3RyYWlnaHQgbWVtY3B5KCkuCgot
LSAKUm9zcyBMYWdlcndhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
