Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF9F1001D6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 10:54:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWdie-0004q2-8f; Mon, 18 Nov 2019 09:53:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iWdid-0004pw-4q
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 09:53:15 +0000
X-Inumbo-ID: 3c5a1606-09e9-11ea-adbe-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c5a1606-09e9-11ea-adbe-bc764e2007e4;
 Mon, 18 Nov 2019 09:53:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BC8DCB14E;
 Mon, 18 Nov 2019 09:53:12 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <20191106153442.12776-2-aisaila@bitdefender.com>
 <60fdf6d4-d43b-f1aa-99e7-9f1818513904@suse.com>
 <d2502775-1e48-50c7-3f43-13e1683d2272@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <912e2d21-4fcc-a290-c4d5-d75d542fb192@suse.com>
Date: Mon, 18 Nov 2019 10:53:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d2502775-1e48-50c7-3f43-13e1683d2272@bitdefender.com>
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

T24gMTguMTEuMjAxOSAwOTozOCwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gT24g
MTIuMTEuMjAxOSAxNDowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA2LjExLjIwMTkgMTY6
MzUsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gQEAgLTI1NzIsMTcgKzI1NzQs
MzYgQEAgaW50IHAybV9pbml0X2FsdHAybV9ieV9pZChzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25l
ZCBpbnQgaWR4KQo+Pj4gICAgICAgYWx0cDJtX2xpc3RfbG9jayhkKTsKPj4+ICAgCj4+PiAgICAg
ICBpZiAoIGQtPmFyY2guYWx0cDJtX2VwdHBbaWR4XSA9PSBtZm5feChJTlZBTElEX01GTikgKQo+
Pj4gLSAgICAgICAgcmMgPSBwMm1fYWN0aXZhdGVfYWx0cDJtKGQsIGlkeCk7Cj4+PiArICAgICAg
ICByYyA9IHAybV9hY3RpdmF0ZV9hbHRwMm0oZCwgaWR4LCBob3N0cDJtLT5kZWZhdWx0X2FjY2Vz
cyk7Cj4+PiAgIAo+Pj4gICAgICAgYWx0cDJtX2xpc3RfdW5sb2NrKGQpOwo+Pj4gICAgICAgcmV0
dXJuIHJjOwo+Pj4gICB9Cj4+PiAgIAo+Pj4gLWludCBwMm1faW5pdF9uZXh0X2FsdHAybShzdHJ1
Y3QgZG9tYWluICpkLCB1aW50MTZfdCAqaWR4KQo+Pj4gK2ludCBwMm1faW5pdF9uZXh0X2FsdHAy
bShzdHJ1Y3QgZG9tYWluICpkLCB1aW50MTZfdCAqaWR4LAo+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICB1aW50MTZfdCBodm1tZW1fZGVmYXVsdF9hY2Nlc3MpCj4+PiAgIHsKPj4+ICAgICAg
IGludCByYyA9IC1FSU5WQUw7Cj4+PiAgICAgICB1bnNpZ25lZCBpbnQgaTsKPj4+ICAgCj4+PiAr
ICAgIHN0YXRpYyBjb25zdCBwMm1fYWNjZXNzX3QgbWVtYWNjZXNzW10gPSB7Cj4+PiArI2RlZmlu
ZSBBQ0NFU1MoYWMpIFtYRU5NRU1fYWNjZXNzXyMjYWNdID0gcDJtX2FjY2Vzc18jI2FjCj4+PiAr
ICAgICAgICBBQ0NFU1MobiksCj4+PiArICAgICAgICBBQ0NFU1MociksCj4+PiArICAgICAgICBB
Q0NFU1ModyksCj4+PiArICAgICAgICBBQ0NFU1MocncpLAo+Pj4gKyAgICAgICAgQUNDRVNTKHgp
LAo+Pj4gKyAgICAgICAgQUNDRVNTKHJ4KSwKPj4+ICsgICAgICAgIEFDQ0VTUyh3eCksCj4+PiAr
ICAgICAgICBBQ0NFU1Mocnd4KSwKPj4+ICsgICAgICAgIEFDQ0VTUyhyeDJydyksCj4+PiArICAg
ICAgICBBQ0NFU1MobjJyd3gpLAo+Pj4gKyN1bmRlZiBBQ0NFU1MKPj4+ICsgICAgfTsKPj4+ICsK
Pj4+ICsgICAgaWYgKCBodm1tZW1fZGVmYXVsdF9hY2Nlc3MgPiBYRU5NRU1fYWNjZXNzX2RlZmF1
bHQgKQo+Pj4gKyAgICAgICAgcmV0dXJuIHJjOwo+Pj4gKwo+Pj4gICAgICAgYWx0cDJtX2xpc3Rf
bG9jayhkKTsKPj4+ICAgCj4+PiAgICAgICBmb3IgKCBpID0gMDsgaSA8IE1BWF9BTFRQMk07IGkr
KyApCj4+PiBAQCAtMjU5MCw3ICsyNjExLDcgQEAgaW50IHAybV9pbml0X25leHRfYWx0cDJtKHN0
cnVjdCBkb21haW4gKmQsIHVpbnQxNl90ICppZHgpCj4+PiAgICAgICAgICAgaWYgKCBkLT5hcmNo
LmFsdHAybV9lcHRwW2ldICE9IG1mbl94KElOVkFMSURfTUZOKSApCj4+PiAgICAgICAgICAgICAg
IGNvbnRpbnVlOwo+Pj4gICAKPj4+IC0gICAgICAgIHJjID0gcDJtX2FjdGl2YXRlX2FsdHAybShk
LCBpKTsKPj4+ICsgICAgICAgIHJjID0gcDJtX2FjdGl2YXRlX2FsdHAybShkLCBpLCBtZW1hY2Nl
c3NbaHZtbWVtX2RlZmF1bHRfYWNjZXNzXSk7Cj4+Cj4+IEFyZW4ndCB5b3Ugb3Blbi1jb2Rpbmcg
eGVubWVtX2FjY2Vzc190b19wMm1fYWNjZXNzKCkgaGVyZT8gSW4KPj4gbm8gZXZlbnQgc2hvdWxk
IHRoZXJlIGJlIHR3byBpbnN0YW5jZXMgb2YgdGhlIHNhbWUgc3RhdGljIGFycmF5Lgo+IAo+IEkg
ZGlkIHRoaXMgYmVjYXVzZSB4ZW5tZW1fYWNjZXNzX3RvX3AybV9hY2Nlc3MoKSBpcyBkZWZpbmVk
IHN0YXRpYyBpbiAKPiB4ODYvbW0vbWVtX2FjY2Vzcy5jLiBJZiBpdCdzIG9rIHRvIGhhdmUgaXQg
ZGVmaW5lZCBpbiBtZW1fYWNjZXNzLmggdGhlbiAKPiBJIGNhbiBnbyB3aXRoIHRoYXQgYW5kIGRy
b3AgdGhpcyBwYXJ0IG9mIHRoZSBjb2RlLgoKSSBzZWUgbm8gcmVhc29uIHdoeSB0aGlzIHdvdWxk
bid0IGJlIGEgcmVhc29uYWJsZSBzdGVwLCBhbGxvd2luZyB0bwphdm9pZCBjb2RlIGR1cGxpY2F0
aW9uLiBMb29rcyBsaWtlIHRoZSBmdW5jdGlvbiBpcyBldmVuIHN1aXRhYmx5Cm5hbWVkIGFscmVh
ZHkgZm9yIG1ha2luZyBub24tc3RhdGljLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
