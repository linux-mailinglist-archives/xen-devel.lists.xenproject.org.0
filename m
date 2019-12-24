Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15526129F88
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 10:03:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijg1u-00015Q-DI; Tue, 24 Dec 2019 08:59:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z3/8=2O=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ijg1t-00015L-0c
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 08:59:01 +0000
X-Inumbo-ID: 9b22d2c8-262b-11ea-88e7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b22d2c8-262b-11ea-88e7-bc764e2007e4;
 Tue, 24 Dec 2019 08:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577177931;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=HAaw6+D1xptdIQVciBibNQ6H2EJCczY/ihlkQf4hJ2E=;
 b=dK7lrMezDMvKgYXW5T8CKHC0fy5gKU67jgeBJZ2Es25/6TpLnDKjW/W4
 ea7wcaDlNHMQcYr/a4Cy038VyGAWYiW8R5ssKs7A8vhUznxeeDmYFBAzM
 hzIMQ+EOjaf35FDHU5JIa/sOtLu3msQzigA/nh9QUuOjvtIFWUDd/AyN6 c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QK0Ff3r7zI9WG7RmLcZTqDaEsvZfOFB0YAZGHRfXPyqA/HQoie5H6iXEwWo4bYxLB3aoICtNzR
 IHi5Ghnfm9hhnMgua/vSbKFduM/cKlYM/YiaCntJ9MG6VJouTR5+ZzQfKsEVkm2COn/4iVACvL
 USTs1LFekQUOb2wsZ/1ijl3xPOy7WSQnweg9R184s9LeFG4QF3Bj/Ynf8dTNFETfnWa/DdT4UQ
 Kqi3SgFuATsdd12kFENCQgVg1OgmJiIMV7AHSEZb79cR7hkBQUoXf5cGMa57qUbpceye2QT8P7
 Fn4=
X-SBRS: 2.7
X-MesageID: 10692480
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,351,1571716800"; d="scan'208";a="10692480"
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <20191223140409.32449-2-aisaila@bitdefender.com>
 <f6cfead2-1c24-9ddf-e323-ceae43756940@citrix.com>
 <8c6b9f51-ca33-31cd-2991-9112bd48ff87@bitdefender.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <7e997533-e143-a344-d58e-bc0cb7e53f70@citrix.com>
Date: Tue, 24 Dec 2019 08:58:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8c6b9f51-ca33-31cd-2991-9112bd48ff87@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V6 2/4] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMjQvMTkgODo0OCBBTSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gCj4g
Cj4gT24gMjQuMTIuMjAxOSAxMDozMCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gMTIvMjMv
MTkgMjowNCBQTSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4+PiBCeSBkZWZhdWx0
IHRoZSBzdmUgYml0cyBhcmUgbm90IHNldC4KPj4+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBoeXBl
cmNhbGwsIHhjX2FsdHAybV9zZXRfc3VwcmVzc192ZV9tdWx0aSgpLAo+Pj4gdG8gc2V0IGEgcmFu
Z2Ugb2Ygc3ZlIGJpdHMuCj4+PiBUaGUgY29yZSBmdW5jdGlvbiwgcDJtX3NldF9zdXBwcmVzc192
ZV9tdWx0aSgpLCBkb2VzIG5vdCBicmFrZSBpbiBjYXNlCj4+Cj4+ICpicmVhawo+IAo+IFNvcnJ5
IGZvciB0aGUgdHlwby4KPiAKPj4KPj4+IG9mIGEgZXJyb3IgYW5kIGl0IGlzIGRvaW5nIGEgYmVz
dCBlZmZvcnQgZm9yIHNldHRpbmcgdGhlIGJpdHMgaW4gdGhlCj4+PiBnaXZlbiByYW5nZS4gQSBj
aGVjayBmb3IgY29udGludWF0aW9uIGlzIG1hZGUgaW4gb3JkZXIgdG8gaGF2ZQo+Pj4gcHJlZW1w
dGlvbiBvbiBiaWcgcmFuZ2VzLgo+Pgo+PiBXZWlyZCBFbmdsaXNoIHF1aXJrOiB0aGlzIHNob3Vs
ZCBiZSAibGFyZ2UiLiAgKCJCaWciIGFuZCAibGFyZ2UiIGFyZQo+PiBib3RoIGFkamVjdGl2ZXMs
IGFuZCAicmFuZ2VzIiBpcyBhIG5vdW4sIHNvIHRoZW9yZXRpY2FsbHkgaXQgc2hvdWxkIGJlCj4+
IE9LOyBidXQgaWYgeW91IGFzayBhbG1vc3QgYW55IG5hdGl2ZSBFbmdsaXNoIHNwZWFrZXIgdGhl
eSdsbCBzYXkgdGhhdAo+PiAiYmlnIiBzb3VuZHMgd3JvbmcgaW4gdGhpcyBjYXNlLiAgTm8gcmVh
bCBpZGVhIHdoeS4pCj4+Cj4+IEJvdGggb2YgdGhlc2UgY291bGQgYmUgZml4ZWQgb24gY2hlY2st
aW4uCj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3AybS5jIGIveGVuL2FyY2gv
eDg2L21tL3AybS5jCj4+PiBpbmRleCA0ZmM5MTlhOWM1Li5kZTgzMmRjYzZkIDEwMDY0NAo+Pj4g
LS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJt
LmMKPj4+IEBAIC0zMDcwLDYgKzMwNzAsNzAgQEAgb3V0Ogo+Pj4gICAgICAgcmV0dXJuIHJjOwo+
Pj4gICB9Cj4+PiAgIAo+Pj4gKy8qCj4+PiArICogU2V0L2NsZWFyIHRoZSAjVkUgc3VwcHJlc3Mg
Yml0IGZvciBtdWx0aXBsZSBwYWdlcy4gIE9ubHkgYXZhaWxhYmxlIG9uIFZNWC4KPj4+ICsgKi8K
Pj4+ICtpbnQgcDJtX3NldF9zdXBwcmVzc192ZV9tdWx0aShzdHJ1Y3QgZG9tYWluICpkLAo+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zdXBw
cmVzc192ZV9tdWx0aSAqc3ZlKQo+Pj4gK3sKPj4+ICsgICAgc3RydWN0IHAybV9kb21haW4gKmhv
c3RfcDJtID0gcDJtX2dldF9ob3N0cDJtKGQpOwo+Pj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAq
YXAybSA9IE5VTEw7Cj4+PiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm0gPSBob3N0X3AybTsK
Pj4+ICsgICAgdWludDY0X3Qgc3RhcnQgPSBzdmUtPmZpcnN0X2dmbjsKPj4+ICsgICAgaW50IHJj
ID0gMDsKPj4+ICsKPj4+ICsgICAgaWYgKCBzdmUtPnZpZXcgPiAwICkKPj4+ICsgICAgewo+Pj4g
KyAgICAgICAgaWYgKCBzdmUtPnZpZXcgPj0gTUFYX0FMVFAyTSB8fAo+Pj4gKyAgICAgICAgICAg
ICBkLT5hcmNoLmFsdHAybV9lcHRwW2FycmF5X2luZGV4X25vc3BlYyhzdmUtPnZpZXcsIE1BWF9B
TFRQMk0pXSA9PQo+Pj4gKyAgICAgICAgICAgICBtZm5feChJTlZBTElEX01GTikgKQo+Pj4gKyAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4gKwo+Pj4gKyAgICAgICAgcDJtID0gYXAybSA9
IGQtPmFyY2guYWx0cDJtX3AybVthcnJheV9pbmRleF9ub3NwZWMoc3ZlLT52aWV3LAo+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
TUFYX0FMVFAyTSldOwo+Pj4gKyAgICB9Cj4+PiArCj4+PiArICAgIHAybV9sb2NrKGhvc3RfcDJt
KTsKPj4+ICsKPj4+ICsgICAgaWYgKCBhcDJtICkKPj4+ICsgICAgICAgIHAybV9sb2NrKGFwMm0p
Owo+Pj4gKwo+Pj4gKyAgICB3aGlsZSAoIHN2ZS0+bGFzdF9nZm4gPj0gc3RhcnQgKQo+Pj4gKyAg
ICB7Cj4+PiArICAgICAgICBwMm1fYWNjZXNzX3QgYTsKPj4+ICsgICAgICAgIHAybV90eXBlX3Qg
dDsKPj4+ICsgICAgICAgIG1mbl90IG1mbjsKPj4+ICsgICAgICAgIGludCBlcnIgPSAwOwo+Pj4g
Kwo+Pj4gKyAgICAgICAgaWYgKCBhbHRwMm1fZ2V0X2VmZmVjdGl2ZV9lbnRyeShwMm0sIF9nZm4o
c3RhcnQpLCAmbWZuLCAmdCwgJmEsIEFQMk1HRVRfcXVlcnkpICkKPj4+ICsgICAgICAgICAgICBh
ID0gcDJtLT5kZWZhdWx0X2FjY2VzczsKPj4KPj4gU28gaW4gdGhlIHNpbmdsZS1lbnRyeSB2ZXJz
aW9uLCBpZiBhbHRwMm1fZ2V0X2VmZmVjdGl2ZV9lbnRyeSgpIHJldHVybnMKPj4gYW4gZXJyb3Is
IHlvdSBwYXNzIHRoYXQgZXJyb3IgdXAgdGhlIHN0YWNrOyBidXQgaW4gdGhlIG11bHRpcGxlLWVu
dHJ5Cj4+IHZlcnNpb24sIHlvdSBpZ25vcmUgdGhlIGVycm9yIGFuZCBzaW1wbHkgc2V0IHRoZSBh
Y2Nlc3MgdG8KPj4gZGVmYXVsdF9hY2Nlc3M/ICBJIGRvbid0IHRoaW5rIHRoYXQgY2FuIGJlIHJp
Z2h0LiAgSWYgaXQgaXMgcmlnaHQsIHRoZW4KPj4gaXQgZGVmaW5pdGVseSBuZWVkcyBhIGNvbW1l
bnQuCj4+Cj4gCj4gVGhlIGlkZWEgYmVoaW5kIHRoaXMgd2FzIHRvIGhhdmUgYSBiZXN0IGVmZm9y
dCB0cnkgYW5kIHNpZ25hbCB0aGUgZmlyc3QgCj4gZXJyb3IuIElmIHRoZSBnZXRfZW50cnkgZmFp
bHMgdGhlbiB0aGUgYmVzdCB3YXkgdG8gZ28gaXMgd2l0aCAKPiBkZWZhdWx0X2FjY2VzcyBidXQg
dGhpcyBpcyBvcGVuIGZvciBkZWJhdGUuCgpJIGRvbid0IHNlZSBob3cgaXQncyBhIGdvb2QgaWRl
YSBhdCBhbGwuIElmIGdldF9lZmZlY3RpdmVfZW50cnkgZmFpbHMsCnRoZW4gbWZuIGFuZCB0IG1h
eSBib3RoIGJlIHVuaW5pdGlhbGl6ZWQuICBJZiBhbiBhdHRhY2tlciBjYW4gYXJyYW5nZQpmb3Ig
dGhvc2UgdG8gaGF2ZSB0aGUgdmFsdWVzIHNoZSB3YW50cywgc2hlIGNvdWxkIHVzZSB0aGlzIHRv
IHRha2Ugb3Zlcgp0aGUgc3lzdGVtLgoKPiBBbm90aGVyIHdheSB0byBzb2x2ZSB0aGlzIGlzIHRv
IHVwZGF0ZSB0aGUgZmlyc3RfZXJyb3JfZ2ZuL2ZpcnN0X2Vycm9yIAo+IGFuZCB0aGVuIGNvbnRp
bnVlLiBJIHRoaW5rIHRoaXMgY2EgYmUgdXNlZCB0byBtYWtlIHAybV9zZXRfc3VwcHJlc3NfdmUo
KSAKPiBjYWxsIHAybV9zZXRfc3VwcHJlc3NfdmVfbXVsdGkuCgpJc24ndCB0aGF0IGV4YWN0bHkg
dGhlIHNlbWFudGljcyB5b3Ugd2FudCAtLSB0cnkgZ2ZuIE4sIGlmIHRoYXQgZmFpbHMsCnJlY29y
ZCBpdCBhbmQgbW92ZSBvbiB0byB0aGUgbmV4dCBvbmU/ICBXaHkgd291bGQgIndyaXRlIGFuIGVu
dHJ5IHdpdGgKcmFuZG9tIHZhbHVlcyBmb3IgbWZuIGFuZCB0eXBlLCBidXQgd2l0aCB0aGUgZGVm
YXVsdCBhY2Nlc3MiIGJlIGEgYmV0dGVyCnJlc3BvbnNlPwoKIC1HZW9yZ2UKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
