Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29447129FA9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 10:28:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijgRU-0003Zv-2K; Tue, 24 Dec 2019 09:25:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z3/8=2O=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ijgRS-0003Zq-AC
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 09:25:26 +0000
X-Inumbo-ID: 4bcb552a-262f-11ea-a1e1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bcb552a-262f-11ea-a1e1-bc764e2007e4;
 Tue, 24 Dec 2019 09:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577179517;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=oEDJSfe/3cwDHidl+BNdR0N4aovdwKhq2R0Q5yRulPA=;
 b=Emp2kbQNsEWgwlIygTje9OaMSk2DOgPJGui3oeARPudKBifQNFyer6Yf
 Al7lG/7/Ba5oGT5xZhs2naVVjH5W4aXq8OuCXxmQ8e4qaL/tI3c1+fFqq
 dLT7vFZ4tu3p3wDSfX1tm5Nlv3FRTrsgWESZhcuAr4aDpDvSrES7sWeID 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2RSwLuogeQROzPyfBR3v6Y82QSVLSjO3A5hfHHRMSz9/Im07b5HC9+n3y9ctcTAnFmG9adk1CQ
 7dQuQOoKeqs/C9N8K6R3tSihbASB/RfqGM4JPrVYPMbmlOx1JBQSJ/qr+gmoQ5tDMWau9XbrXO
 lrTD8dpL7n8ZzVU7kF16RUASAidOgLlBfhk5KalxCVrXdh2XsdjqTgYn2wq8Rdq/CCREu7uyNa
 GEZugVt1GseIXEld0zi9auOql30+N1jVdt52RC/1rFV9eyig205nEfZmWhKxCGreo8Qfp4rZHj
 zpo=
X-SBRS: 2.7
X-MesageID: 10118679
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,351,1571716800"; d="scan'208";a="10118679"
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <20191223140409.32449-2-aisaila@bitdefender.com>
 <f6cfead2-1c24-9ddf-e323-ceae43756940@citrix.com>
 <8c6b9f51-ca33-31cd-2991-9112bd48ff87@bitdefender.com>
 <7e997533-e143-a344-d58e-bc0cb7e53f70@citrix.com>
 <7b19e9a8-0c95-e98e-c31b-8ab79da380da@bitdefender.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <b465bd13-dfaf-1089-62fa-cf30731d0dd9@citrix.com>
Date: Tue, 24 Dec 2019 09:25:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7b19e9a8-0c95-e98e-c31b-8ab79da380da@bitdefender.com>
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMjQvMTkgOTowNCBBTSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4+Pj4+
ICsvKgo+Pj4+PiArICogU2V0L2NsZWFyIHRoZSAjVkUgc3VwcHJlc3MgYml0IGZvciBtdWx0aXBs
ZSBwYWdlcy4gIE9ubHkgYXZhaWxhYmxlIG9uIFZNWC4KPj4+Pj4gKyAqLwo+Pj4+PiAraW50IHAy
bV9zZXRfc3VwcHJlc3NfdmVfbXVsdGkoc3RydWN0IGRvbWFpbiAqZCwKPj4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zdXBwcmVzc192ZV9t
dWx0aSAqc3ZlKQo+Pj4+PiArewo+Pj4+PiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpob3N0X3Ay
bSA9IHAybV9nZXRfaG9zdHAybShkKTsKPj4+Pj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqYXAy
bSA9IE5VTEw7Cj4+Pj4+ICsgICAgc3RydWN0IHAybV9kb21haW4gKnAybSA9IGhvc3RfcDJtOwo+
Pj4+PiArICAgIHVpbnQ2NF90IHN0YXJ0ID0gc3ZlLT5maXJzdF9nZm47Cj4+Pj4+ICsgICAgaW50
IHJjID0gMDsKPj4+Pj4gKwo+Pj4+PiArICAgIGlmICggc3ZlLT52aWV3ID4gMCApCj4+Pj4+ICsg
ICAgewo+Pj4+PiArICAgICAgICBpZiAoIHN2ZS0+dmlldyA+PSBNQVhfQUxUUDJNIHx8Cj4+Pj4+
ICsgICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFthcnJheV9pbmRleF9ub3NwZWMoc3Zl
LT52aWV3LCBNQVhfQUxUUDJNKV0gPT0KPj4+Pj4gKyAgICAgICAgICAgICBtZm5feChJTlZBTElE
X01GTikgKQo+Pj4+PiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+ICsKPj4+Pj4g
KyAgICAgICAgcDJtID0gYXAybSA9IGQtPmFyY2guYWx0cDJtX3AybVthcnJheV9pbmRleF9ub3Nw
ZWMoc3ZlLT52aWV3LAo+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBNQVhfQUxUUDJNKV07Cj4+Pj4+ICsgICAgfQo+Pj4+PiAr
Cj4+Pj4+ICsgICAgcDJtX2xvY2soaG9zdF9wMm0pOwo+Pj4+PiArCj4+Pj4+ICsgICAgaWYgKCBh
cDJtICkKPj4+Pj4gKyAgICAgICAgcDJtX2xvY2soYXAybSk7Cj4+Pj4+ICsKPj4+Pj4gKyAgICB3
aGlsZSAoIHN2ZS0+bGFzdF9nZm4gPj0gc3RhcnQgKQo+Pj4+PiArICAgIHsKPj4+Pj4gKyAgICAg
ICAgcDJtX2FjY2Vzc190IGE7Cj4+Pj4+ICsgICAgICAgIHAybV90eXBlX3QgdDsKPj4+Pj4gKyAg
ICAgICAgbWZuX3QgbWZuOwo+Pj4+PiArICAgICAgICBpbnQgZXJyID0gMDsKPj4+Pj4gKwo+Pj4+
PiArICAgICAgICBpZiAoIGFsdHAybV9nZXRfZWZmZWN0aXZlX2VudHJ5KHAybSwgX2dmbihzdGFy
dCksICZtZm4sICZ0LCAmYSwgQVAyTUdFVF9xdWVyeSkgKQo+Pj4+PiArICAgICAgICAgICAgYSA9
IHAybS0+ZGVmYXVsdF9hY2Nlc3M7Cj4+Pj4KPj4+PiBTbyBpbiB0aGUgc2luZ2xlLWVudHJ5IHZl
cnNpb24sIGlmIGFsdHAybV9nZXRfZWZmZWN0aXZlX2VudHJ5KCkgcmV0dXJucwo+Pj4+IGFuIGVy
cm9yLCB5b3UgcGFzcyB0aGF0IGVycm9yIHVwIHRoZSBzdGFjazsgYnV0IGluIHRoZSBtdWx0aXBs
ZS1lbnRyeQo+Pj4+IHZlcnNpb24sIHlvdSBpZ25vcmUgdGhlIGVycm9yIGFuZCBzaW1wbHkgc2V0
IHRoZSBhY2Nlc3MgdG8KPj4+PiBkZWZhdWx0X2FjY2Vzcz8gIEkgZG9uJ3QgdGhpbmsgdGhhdCBj
YW4gYmUgcmlnaHQuICBJZiBpdCBpcyByaWdodCwgdGhlbgo+Pj4+IGl0IGRlZmluaXRlbHkgbmVl
ZHMgYSBjb21tZW50Lgo+Pj4+Cj4+Pgo+Pj4gVGhlIGlkZWEgYmVoaW5kIHRoaXMgd2FzIHRvIGhh
dmUgYSBiZXN0IGVmZm9ydCB0cnkgYW5kIHNpZ25hbCB0aGUgZmlyc3QKPj4+IGVycm9yLiBJZiB0
aGUgZ2V0X2VudHJ5IGZhaWxzIHRoZW4gdGhlIGJlc3Qgd2F5IHRvIGdvIGlzIHdpdGgKPj4+IGRl
ZmF1bHRfYWNjZXNzIGJ1dCB0aGlzIGlzIG9wZW4gZm9yIGRlYmF0ZS4KPj4KPj4gSSBkb24ndCBz
ZWUgaG93IGl0J3MgYSBnb29kIGlkZWEgYXQgYWxsLiBJZiBnZXRfZWZmZWN0aXZlX2VudHJ5IGZh
aWxzLAo+PiB0aGVuIG1mbiBhbmQgdCBtYXkgYm90aCBiZSB1bmluaXRpYWxpemVkLiAgSWYgYW4g
YXR0YWNrZXIgY2FuIGFycmFuZ2UKPj4gZm9yIHRob3NlIHRvIGhhdmUgdGhlIHZhbHVlcyBzaGUg
d2FudHMsIHNoZSBjb3VsZCB1c2UgdGhpcyB0byB0YWtlIG92ZXIKPj4gdGhlIHN5c3RlbS4KPj4K
Pj4+IEFub3RoZXIgd2F5IHRvIHNvbHZlIHRoaXMgaXMgdG8gdXBkYXRlIHRoZSBmaXJzdF9lcnJv
cl9nZm4vZmlyc3RfZXJyb3IKPj4+IGFuZCB0aGVuIGNvbnRpbnVlLiBJIHRoaW5rIHRoaXMgY2Eg
YmUgdXNlZCB0byBtYWtlIHAybV9zZXRfc3VwcHJlc3NfdmUoKQo+Pj4gY2FsbCBwMm1fc2V0X3N1
cHByZXNzX3ZlX211bHRpLgo+Pgo+PiBJc24ndCB0aGF0IGV4YWN0bHkgdGhlIHNlbWFudGljcyB5
b3Ugd2FudCAtLSB0cnkgZ2ZuIE4sIGlmIHRoYXQgZmFpbHMsCj4+IHJlY29yZCBpdCBhbmQgbW92
ZSBvbiB0byB0aGUgbmV4dCBvbmU/ICBXaHkgd291bGQgIndyaXRlIGFuIGVudHJ5IHdpdGgKPj4g
cmFuZG9tIHZhbHVlcyBmb3IgbWZuIGFuZCB0eXBlLCBidXQgd2l0aCB0aGUgZGVmYXVsdCBhY2Nl
c3MiIGJlIGEgYmV0dGVyCj4+IHJlc3BvbnNlPwo+Pgo+IAo+IFRoYXQgaXMgcmlnaHQsIEknbGwg
Z28gd2l0aCB0aGlzIGZvciB0aGUgbmV4dCB2ZXJzaW9uLiAKClNvLCBvbmUgcG90ZW50aWFsIGJl
aGF2aW9yIHlvdSBtaWdodCB3YW50LiAgQ29uc2lkZXIgdGhlIGZvbGxvd2luZyBjYXNlOgoKZ2Zu
ICdBJyBpc24ndCBtYXBwZWQgaW4gdGhlIGhvc3RwMm0geWV0LgoxLiBDcmVhdGUgYWx0cDJtIFgK
Mi4gVG9vbHMgc2V0IHRoZSBzdmUgZ2ZuIEEKMy4gSG9zdCBhZGRzIG1hcHBpbmcgZm9yIEEKNC4g
R3Vlc3QgYWNjZXNzZXMgQSwgZmF1bHRpbmcgdGhlIG1hcHBpbmcgb3ZlciB0byB0aGUgYWx0cDJt
CgpBdCB0aGUgbW9tZW50LCBmb3IgdGhlIHNpbmdsZS1lbnRyeSBjYWxsLCAjMiB3aWxsIGZhaWws
IGFuZCAjNCB3aWxsIGdldAp0aGUgZGVmYXVsdCBzdmUgdmFsdWUuICBJdCBtaWdodCBiZSBuaWNl
IGZvciAjMiB0byBzdWNjZWVkLCBhbmQgIzQgdG8KY29weSBvdmVyIHRoZSBtZm4sIHR5cGUsICZj
LCBidXQgdXNlIHRoZSBzdmUgdmFsdWUgc3BlY2lmaWVkIGluICMyLgoKQnV0IGF0IHRoZSBtb21l
bnQsIGFsdHAybV9nZXRfb3JfcHJvcGFnYXRlKCkgd29uJ3QgZW5kIHVwIGNvcHlpbmcgc3ZlCm92
ZXIgaWYgdGhlIGFsdHAybSBlbnRyeSBpcyBpbnZhbGlkIChBRkFJQ1QpLiAgU28gSSB0aGluayBm
b3Igbm93LApza2lwcGluZyB0aGF0IGVudHJ5IGFuZCBsZWF2aW5nIGl0IGFuIGVycm9yIGlzIHRo
ZSBiZXN0IHRoaW5nIHRvIGRvLgoKPiBTaG91bGQgSSBoYXZlIHRoZSAKPiBzaW5nbGUgdmVyc2lv
biBjYWxsIHRoZSBfbXVsdGkgdmVyc2lvbiBhZnRlciB0aGlzIGNoYW5nZT8KClRoYXQgc2VlbXMg
bGlrZSBhIGdvb2QgdGhpbmcgdG8gdHJ5LiAgVGhhbmtzLgoKIC1HZW9yZ2UKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
