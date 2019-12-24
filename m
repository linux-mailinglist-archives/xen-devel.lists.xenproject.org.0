Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299D9129F05
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 09:33:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijfal-0007XF-BT; Tue, 24 Dec 2019 08:30:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z3/8=2O=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ijfak-0007X9-IU
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 08:30:58 +0000
X-Inumbo-ID: b49a473a-2627-11ea-977a-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b49a473a-2627-11ea-977a-12813bfff9fa;
 Tue, 24 Dec 2019 08:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577176257;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=u1Jz6R8j/4d90zr/l6EWR0EvuK42I3aGviq7Opv5THU=;
 b=QAaHTW67xOezLhV66irY5Xum2Hoj86lpHF+4FDuNRT8XhXe+nyZRqiYY
 XlCgOW8JxI3fq95qcHb24vanZ9S+znnkTr/doM1j5h4ewIehm2SgkJKj2
 hDgDiz3ylKS2kpKoqVZ5b9+DqOpxPM0RqSB7RtxhYQfGVbO0P/3EUxr7h A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: c/TcxHMnwwB47qCRqGvsmg5WRikvzU36Aw1qE4C/o1x/CQPvNZO1bYt1Q0VyXM1nf8a1TGNC+N
 2gVNUORY5UjLQMwh0ofHb/5HRc567J2ui8GhLLKLBFoDn9WZ8VIehWmCOEEZs9eZczn/6Er1EP
 jp5nwwxYXQPknavP6ksPeQnBr8ukB0eeTzE+fbRDiIsC5p4sSW1eptHsSvxI706sf3NXxJPKLC
 rNbRUoy7F7Djwvxh5HCakkyc2PxEkVLlGUMyf+hFjmEHt3fY/VZboIZzoTaf1x47jU6zR+1/sr
 q90=
X-SBRS: 2.7
X-MesageID: 10255572
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,350,1571716800"; d="scan'208";a="10255572"
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <20191223140409.32449-2-aisaila@bitdefender.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <f6cfead2-1c24-9ddf-e323-ceae43756940@citrix.com>
Date: Tue, 24 Dec 2019 08:30:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191223140409.32449-2-aisaila@bitdefender.com>
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

T24gMTIvMjMvMTkgMjowNCBQTSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gQnkg
ZGVmYXVsdCB0aGUgc3ZlIGJpdHMgYXJlIG5vdCBzZXQuCj4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3
IGh5cGVyY2FsbCwgeGNfYWx0cDJtX3NldF9zdXByZXNzX3ZlX211bHRpKCksCj4gdG8gc2V0IGEg
cmFuZ2Ugb2Ygc3ZlIGJpdHMuCj4gVGhlIGNvcmUgZnVuY3Rpb24sIHAybV9zZXRfc3VwcHJlc3Nf
dmVfbXVsdGkoKSwgZG9lcyBub3QgYnJha2UgaW4gY2FzZQoKKmJyZWFrCgo+IG9mIGEgZXJyb3Ig
YW5kIGl0IGlzIGRvaW5nIGEgYmVzdCBlZmZvcnQgZm9yIHNldHRpbmcgdGhlIGJpdHMgaW4gdGhl
Cj4gZ2l2ZW4gcmFuZ2UuIEEgY2hlY2sgZm9yIGNvbnRpbnVhdGlvbiBpcyBtYWRlIGluIG9yZGVy
IHRvIGhhdmUKPiBwcmVlbXB0aW9uIG9uIGJpZyByYW5nZXMuCgpXZWlyZCBFbmdsaXNoIHF1aXJr
OiB0aGlzIHNob3VsZCBiZSAibGFyZ2UiLiAgKCJCaWciIGFuZCAibGFyZ2UiIGFyZQpib3RoIGFk
amVjdGl2ZXMsIGFuZCAicmFuZ2VzIiBpcyBhIG5vdW4sIHNvIHRoZW9yZXRpY2FsbHkgaXQgc2hv
dWxkIGJlCk9LOyBidXQgaWYgeW91IGFzayBhbG1vc3QgYW55IG5hdGl2ZSBFbmdsaXNoIHNwZWFr
ZXIgdGhleSdsbCBzYXkgdGhhdAoiYmlnIiBzb3VuZHMgd3JvbmcgaW4gdGhpcyBjYXNlLiAgTm8g
cmVhbCBpZGVhIHdoeS4pCgpCb3RoIG9mIHRoZXNlIGNvdWxkIGJlIGZpeGVkIG9uIGNoZWNrLWlu
LgoKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3AybS5jIGIveGVuL2FyY2gveDg2L21t
L3AybS5jCj4gaW5kZXggNGZjOTE5YTljNS4uZGU4MzJkY2M2ZCAxMDA2NDQKPiAtLS0gYS94ZW4v
YXJjaC94ODYvbW0vcDJtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiBAQCAtMzA3
MCw2ICszMDcwLDcwIEBAIG91dDoKPiAgICAgIHJldHVybiByYzsKPiAgfQo+ICAKPiArLyoKPiAr
ICogU2V0L2NsZWFyIHRoZSAjVkUgc3VwcHJlc3MgYml0IGZvciBtdWx0aXBsZSBwYWdlcy4gIE9u
bHkgYXZhaWxhYmxlIG9uIFZNWC4KPiArICovCj4gK2ludCBwMm1fc2V0X3N1cHByZXNzX3ZlX211
bHRpKHN0cnVjdCBkb21haW4gKmQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCB4ZW5faHZtX2FsdHAybV9zdXBwcmVzc192ZV9tdWx0aSAqc3ZlKQo+ICt7Cj4gKyAgICBz
dHJ1Y3QgcDJtX2RvbWFpbiAqaG9zdF9wMm0gPSBwMm1fZ2V0X2hvc3RwMm0oZCk7Cj4gKyAgICBz
dHJ1Y3QgcDJtX2RvbWFpbiAqYXAybSA9IE5VTEw7Cj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAq
cDJtID0gaG9zdF9wMm07Cj4gKyAgICB1aW50NjRfdCBzdGFydCA9IHN2ZS0+Zmlyc3RfZ2ZuOwo+
ICsgICAgaW50IHJjID0gMDsKPiArCj4gKyAgICBpZiAoIHN2ZS0+dmlldyA+IDAgKQo+ICsgICAg
ewo+ICsgICAgICAgIGlmICggc3ZlLT52aWV3ID49IE1BWF9BTFRQMk0gfHwKPiArICAgICAgICAg
ICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVjKHN2ZS0+dmlldywgTUFY
X0FMVFAyTSldID09Cj4gKyAgICAgICAgICAgICBtZm5feChJTlZBTElEX01GTikgKQo+ICsgICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArCj4gKyAgICAgICAgcDJtID0gYXAybSA9IGQtPmFy
Y2guYWx0cDJtX3AybVthcnJheV9pbmRleF9ub3NwZWMoc3ZlLT52aWV3LAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1BWF9BTFRQ
Mk0pXTsKPiArICAgIH0KPiArCj4gKyAgICBwMm1fbG9jayhob3N0X3AybSk7Cj4gKwo+ICsgICAg
aWYgKCBhcDJtICkKPiArICAgICAgICBwMm1fbG9jayhhcDJtKTsKPiArCj4gKyAgICB3aGlsZSAo
IHN2ZS0+bGFzdF9nZm4gPj0gc3RhcnQgKQo+ICsgICAgewo+ICsgICAgICAgIHAybV9hY2Nlc3Nf
dCBhOwo+ICsgICAgICAgIHAybV90eXBlX3QgdDsKPiArICAgICAgICBtZm5fdCBtZm47Cj4gKyAg
ICAgICAgaW50IGVyciA9IDA7Cj4gKwo+ICsgICAgICAgIGlmICggYWx0cDJtX2dldF9lZmZlY3Rp
dmVfZW50cnkocDJtLCBfZ2ZuKHN0YXJ0KSwgJm1mbiwgJnQsICZhLCBBUDJNR0VUX3F1ZXJ5KSAp
Cj4gKyAgICAgICAgICAgIGEgPSBwMm0tPmRlZmF1bHRfYWNjZXNzOwoKU28gaW4gdGhlIHNpbmds
ZS1lbnRyeSB2ZXJzaW9uLCBpZiBhbHRwMm1fZ2V0X2VmZmVjdGl2ZV9lbnRyeSgpIHJldHVybnMK
YW4gZXJyb3IsIHlvdSBwYXNzIHRoYXQgZXJyb3IgdXAgdGhlIHN0YWNrOyBidXQgaW4gdGhlIG11
bHRpcGxlLWVudHJ5CnZlcnNpb24sIHlvdSBpZ25vcmUgdGhlIGVycm9yIGFuZCBzaW1wbHkgc2V0
IHRoZSBhY2Nlc3MgdG8KZGVmYXVsdF9hY2Nlc3M/ICBJIGRvbid0IHRoaW5rIHRoYXQgY2FuIGJl
IHJpZ2h0LiAgSWYgaXQgaXMgcmlnaHQsIHRoZW4KaXQgZGVmaW5pdGVseSBuZWVkcyBhIGNvbW1l
bnQuCgpUaGlzIHBvaW50cyBvdXQgYW5vdGhlciBpc3N1ZTogaW1wbGVtZW50aW5nIHRoaXMgZnVu
Y3Rpb25hbGl0eSB0d2ljZQpyaXNrcyBoYXZpbmcgdGhpcyBzb3J0IG9mIGRyaWZ0IGJldHdlZW4g
dGhlIHNpbmdsZS1lbnRyeSB2ZXJzaW9uIGFuZCB0aGUKbXVsdGlwbGUtZW50cnkgdmVyc2lvbi4g
IFdvdWxkIGl0IG1ha2Ugc2Vuc2UgaW5zdGVhZCB0byBpbXBsZW1lbnQgdGhlCnNpbmdsZS1lbnRy
eSB2ZXJzaW9uIGh5cGVyY2FsbCB1c2luZyBwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpPwoKIC1H
ZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
