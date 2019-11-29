Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAFA10D516
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 12:44:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaeeT-0000ca-AA; Fri, 29 Nov 2019 11:41:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaeeS-0000cV-BX
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 11:41:32 +0000
X-Inumbo-ID: 302d2c8a-129d-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 302d2c8a-129d-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 11:41:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EDD66B1A7;
 Fri, 29 Nov 2019 11:41:30 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191121150124.15865-1-aisaila@bitdefender.com>
 <20191121150124.15865-2-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4079604a-8f82-687c-19ff-d0ecfd068dd3@suse.com>
Date: Fri, 29 Nov 2019 12:41:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191121150124.15865-2-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 2/2] x86/mm: Make use of the default
 access param from xc_altp2m_create_view
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
 Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAxNjowMiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gQ2hh
bmdlcyBzaW5jZSBWMjoKPiAJLSBEcm9wIHN0YXRpYyBmcm9tIHhlbm1lbV9hY2Nlc3NfdG9fcDJt
X2FjY2VzcygpIGFuZCBkZWNsYXJlIGl0Cj4gaW4gbWVtX2FjY2Vzcy5oCj4gCS0gVXNlIHhlbm1l
bV9hY2Nlc3NfdG9fcDJtX2FjY2VzcygpIGluIHAybV9pbml0X25leHRfYWx0cDJtKCkKPiAJLSBQ
dWxsIG91dCB0aGUgcDJtIHNwZWNpZmljcyBmcm9tIHAybV9pbml0X2FsdHAybV9lcHQoKS4KCkkg
Z3Vlc3MgdGhpcyBsYXN0IHBvaW50IHdvdWxkIGJldHRlciBoYXZlIGJlZW4gYSBwcmVyZXEgcGF0
Y2gsCmJ1dCBhbnl3YXkuCgo+IEBAIC0yNTc3LDE2ICsyNTg2LDIzIEBAIGludCBwMm1faW5pdF9h
bHRwMm1fYnlfaWQoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGlkeCkKPiAgICAgIGFs
dHAybV9saXN0X2xvY2soZCk7Cj4gIAo+ICAgICAgaWYgKCBkLT5hcmNoLmFsdHAybV9lcHRwW2lk
eF0gPT0gbWZuX3goSU5WQUxJRF9NRk4pICkKPiAtICAgICAgICByYyA9IHAybV9hY3RpdmF0ZV9h
bHRwMm0oZCwgaWR4KTsKPiArICAgICAgICByYyA9IHAybV9hY3RpdmF0ZV9hbHRwMm0oZCwgaWR4
LCBob3N0cDJtLT5kZWZhdWx0X2FjY2Vzcyk7Cj4gIAo+ICAgICAgYWx0cDJtX2xpc3RfdW5sb2Nr
KGQpOwo+ICAgICAgcmV0dXJuIHJjOwo+ICB9Cj4gIAo+IC1pbnQgcDJtX2luaXRfbmV4dF9hbHRw
Mm0oc3RydWN0IGRvbWFpbiAqZCwgdWludDE2X3QgKmlkeCkKPiAraW50IHAybV9pbml0X25leHRf
YWx0cDJtKHN0cnVjdCBkb21haW4gKmQsIHVpbnQxNl90ICppZHgsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICB1aW50MTZfdCBodm1tZW1fZGVmYXVsdF9hY2Nlc3MpCgpEb2VzIHRoaXMgbmV3
IHBhcmFtZXRlciByZWFsbHkgbmVlZCB0byBiZSBhIGZpeGVkIHdpZHRoIHR5cGUsCnJhdGhlciB0
aGFuIHNpbXBseSB1bnNpZ25lZCBpbnQgKG9yIGV2ZW4gYSBzdWl0YWJsZSBlbnVtCnR5cGUgaWYg
dGhlcmUgW2hvcGVmdWxseV0gaXMgb25lKT8KCj4gIHsKPiAgICAgIGludCByYyA9IC1FSU5WQUw7
Cj4gICAgICB1bnNpZ25lZCBpbnQgaTsKPiArICAgIHAybV9hY2Nlc3NfdCBhOwo+ICsgICAgc3Ry
dWN0IHAybV9kb21haW4gKnAybTsKPiArCj4gKwoKVHdvIHN1Y2Nlc3NpdmUgYmxhbmsgbGluZXMg
YWdhaW4uCgo+IEBAIC0yNTk1LDcgKzI2MTEsMTIgQEAgaW50IHAybV9pbml0X25leHRfYWx0cDJt
KHN0cnVjdCBkb21haW4gKmQsIHVpbnQxNl90ICppZHgpCj4gICAgICAgICAgaWYgKCBkLT5hcmNo
LmFsdHAybV9lcHRwW2ldICE9IG1mbl94KElOVkFMSURfTUZOKSApCj4gICAgICAgICAgICAgIGNv
bnRpbnVlOwo+ICAKPiAtICAgICAgICByYyA9IHAybV9hY3RpdmF0ZV9hbHRwMm0oZCwgaSk7Cj4g
KyAgICAgICAgcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2ldOwo+ICsKPiArICAgICAgICBpZiAo
ICF4ZW5tZW1fYWNjZXNzX3RvX3AybV9hY2Nlc3MocDJtLCBodm1tZW1fZGVmYXVsdF9hY2Nlc3Ms
ICZhKSApCj4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwoKUmV0dXJuaW5nIHdpdGggYSBs
b2NrIHN0aWxsIGhlbGQ/Cgo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9tZW1fYWNjZXNzLmgKPiAr
KysgYi94ZW4vaW5jbHVkZS94ZW4vbWVtX2FjY2Vzcy5oCj4gQEAgLTU4LDYgKzU4LDEwIEBAIHR5
cGVkZWYgZW51bSB7Cj4gICAgICAvKiBOT1RFOiBBc3N1bWVkIHRvIGJlIG9ubHkgNCBiaXRzIHJp
Z2h0IG5vdyBvbiB4ODYuICovCj4gIH0gcDJtX2FjY2Vzc190Owo+ICAKPiArYm9vbCB4ZW5tZW1f
YWNjZXNzX3RvX3AybV9hY2Nlc3Moc3RydWN0IHAybV9kb21haW4gKnAybSwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhlbm1lbV9hY2Nlc3NfdCB4YWNjZXNzLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX2FjY2Vzc190ICpw
YWNjZXNzKTsKCkluZGVudGF0aW9uLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
