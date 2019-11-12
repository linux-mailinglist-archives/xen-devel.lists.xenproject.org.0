Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E803F8F35
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 13:04:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUUsw-0003Gf-2i; Tue, 12 Nov 2019 12:03:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CoZ6=ZE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUUsu-0003Ga-64
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 12:03:00 +0000
X-Inumbo-ID: 5d7bf38b-0544-11ea-a21a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d7bf38b-0544-11ea-a21a-12813bfff9fa;
 Tue, 12 Nov 2019 12:02:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 908A8AFDB;
 Tue, 12 Nov 2019 12:02:56 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <20191106153442.12776-2-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <60fdf6d4-d43b-f1aa-99e7-9f1818513904@suse.com>
Date: Tue, 12 Nov 2019 13:02:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191106153442.12776-2-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 2/2] x86/mm: Make use of the default
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
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTEuMjAxOSAxNjozNSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gLS0t
IGEveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0t
ZXB0LmMKPiBAQCAtMTM0NSwxMyArMTM0NSwxNCBAQCB2b2lkIHNldHVwX2VwdF9kdW1wKHZvaWQp
Cj4gICAgICByZWdpc3Rlcl9rZXloYW5kbGVyKCdEJywgZXB0X2R1bXBfcDJtX3RhYmxlLCAiZHVt
cCBWVC14IEVQVCB0YWJsZXMiLCAwKTsKPiAgfQo+ICAKPiAtdm9pZCBwMm1faW5pdF9hbHRwMm1f
ZXB0KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBpKQo+ICt2b2lkIHAybV9pbml0X2Fs
dHAybV9lcHQoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGksCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICBwMm1fYWNjZXNzX3QgZGVmYXVsdF9hY2Nlc3MpCj4gIHsKPiAgICAgIHN0
cnVjdCBwMm1fZG9tYWluICpwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1baV07Cj4gICAgICBzdHJ1
Y3QgcDJtX2RvbWFpbiAqaG9zdHAybSA9IHAybV9nZXRfaG9zdHAybShkKTsKPiAgICAgIHN0cnVj
dCBlcHRfZGF0YSAqZXB0Owo+ICAKPiAtICAgIHAybS0+ZGVmYXVsdF9hY2Nlc3MgPSBob3N0cDJt
LT5kZWZhdWx0X2FjY2VzczsKPiArICAgIHAybS0+ZGVmYXVsdF9hY2Nlc3MgPSBkZWZhdWx0X2Fj
Y2VzczsKPiAgICAgIHAybS0+ZG9tYWluID0gaG9zdHAybS0+ZG9tYWluOwo+ICAKPiAgICAgIHAy
bS0+Z2xvYmFsX2xvZ2RpcnR5ID0gaG9zdHAybS0+Z2xvYmFsX2xvZ2RpcnR5OwoKQWxsIG9mIHRo
aXMgaXMgbm90IEVQVC1zcGVjaWZpYy4gQmVmb3JlIGFkZGluZyBtb3JlIGluZnJhc3RydWN0dXJl
IHRvCmNvdmVyIGZvciB0aGlzIChoZXJlOiBhbm90aGVyIGZ1bmN0aW9uIHBhcmFtZXRlciksIGhv
dyBhYm91dCBtb3ZpbmcKdGhlc2UgcGFydHMgaW50byB2ZW5kb3ItaW5kZXBlbmRlbnQgY29kZT8K
Cj4gQEAgLTI1NzIsMTcgKzI1NzQsMzYgQEAgaW50IHAybV9pbml0X2FsdHAybV9ieV9pZChzdHJ1
Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgaWR4KQo+ICAgICAgYWx0cDJtX2xpc3RfbG9jayhk
KTsKPiAgCj4gICAgICBpZiAoIGQtPmFyY2guYWx0cDJtX2VwdHBbaWR4XSA9PSBtZm5feChJTlZB
TElEX01GTikgKQo+IC0gICAgICAgIHJjID0gcDJtX2FjdGl2YXRlX2FsdHAybShkLCBpZHgpOwo+
ICsgICAgICAgIHJjID0gcDJtX2FjdGl2YXRlX2FsdHAybShkLCBpZHgsIGhvc3RwMm0tPmRlZmF1
bHRfYWNjZXNzKTsKPiAgCj4gICAgICBhbHRwMm1fbGlzdF91bmxvY2soZCk7Cj4gICAgICByZXR1
cm4gcmM7Cj4gIH0KPiAgCj4gLWludCBwMm1faW5pdF9uZXh0X2FsdHAybShzdHJ1Y3QgZG9tYWlu
ICpkLCB1aW50MTZfdCAqaWR4KQo+ICtpbnQgcDJtX2luaXRfbmV4dF9hbHRwMm0oc3RydWN0IGRv
bWFpbiAqZCwgdWludDE2X3QgKmlkeCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQx
Nl90IGh2bW1lbV9kZWZhdWx0X2FjY2VzcykKPiAgewo+ICAgICAgaW50IHJjID0gLUVJTlZBTDsK
PiAgICAgIHVuc2lnbmVkIGludCBpOwo+ICAKPiArICAgIHN0YXRpYyBjb25zdCBwMm1fYWNjZXNz
X3QgbWVtYWNjZXNzW10gPSB7Cj4gKyNkZWZpbmUgQUNDRVNTKGFjKSBbWEVOTUVNX2FjY2Vzc18j
I2FjXSA9IHAybV9hY2Nlc3NfIyNhYwo+ICsgICAgICAgIEFDQ0VTUyhuKSwKPiArICAgICAgICBB
Q0NFU1MociksCj4gKyAgICAgICAgQUNDRVNTKHcpLAo+ICsgICAgICAgIEFDQ0VTUyhydyksCj4g
KyAgICAgICAgQUNDRVNTKHgpLAo+ICsgICAgICAgIEFDQ0VTUyhyeCksCj4gKyAgICAgICAgQUND
RVNTKHd4KSwKPiArICAgICAgICBBQ0NFU1Mocnd4KSwKPiArICAgICAgICBBQ0NFU1Mocngycncp
LAo+ICsgICAgICAgIEFDQ0VTUyhuMnJ3eCksCj4gKyN1bmRlZiBBQ0NFU1MKPiArICAgIH07Cj4g
Kwo+ICsgICAgaWYgKCBodm1tZW1fZGVmYXVsdF9hY2Nlc3MgPiBYRU5NRU1fYWNjZXNzX2RlZmF1
bHQgKQo+ICsgICAgICAgIHJldHVybiByYzsKPiArCj4gICAgICBhbHRwMm1fbGlzdF9sb2NrKGQp
Owo+ICAKPiAgICAgIGZvciAoIGkgPSAwOyBpIDwgTUFYX0FMVFAyTTsgaSsrICkKPiBAQCAtMjU5
MCw3ICsyNjExLDcgQEAgaW50IHAybV9pbml0X25leHRfYWx0cDJtKHN0cnVjdCBkb21haW4gKmQs
IHVpbnQxNl90ICppZHgpCj4gICAgICAgICAgaWYgKCBkLT5hcmNoLmFsdHAybV9lcHRwW2ldICE9
IG1mbl94KElOVkFMSURfTUZOKSApCj4gICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICAKPiAtICAg
ICAgICByYyA9IHAybV9hY3RpdmF0ZV9hbHRwMm0oZCwgaSk7Cj4gKyAgICAgICAgcmMgPSBwMm1f
YWN0aXZhdGVfYWx0cDJtKGQsIGksIG1lbWFjY2Vzc1todm1tZW1fZGVmYXVsdF9hY2Nlc3NdKTsK
CkFyZW4ndCB5b3Ugb3Blbi1jb2RpbmcgeGVubWVtX2FjY2Vzc190b19wMm1fYWNjZXNzKCkgaGVy
ZT8gSW4Kbm8gZXZlbnQgc2hvdWxkIHRoZXJlIGJlIHR3byBpbnN0YW5jZXMgb2YgdGhlIHNhbWUg
c3RhdGljIGFycmF5LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
