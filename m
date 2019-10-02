Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC88C8BCB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 16:49:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFfuW-00028q-Ru; Wed, 02 Oct 2019 14:47:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFfuV-00028l-4k
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 14:47:23 +0000
X-Inumbo-ID: 89ae838c-e523-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 89ae838c-e523-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 14:47:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 803B2AC1C;
 Wed,  2 Oct 2019 14:47:20 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190930133238.49868-1-roger.pau@citrix.com>
 <20190930133238.49868-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2edf7d4a-5d30-75dd-db6e-beab84fc6585@suse.com>
Date: Wed, 2 Oct 2019 16:47:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930133238.49868-5-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 04/10] ioreq: add internal ioreq
 initialization support
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAxNTozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEBAIC04NTUsNiAr
ODg0LDggQEAgaW50IGh2bV9kZXN0cm95X2lvcmVxX3NlcnZlcihzdHJ1Y3QgZG9tYWluICpkLCBp
b3NlcnZpZF90IGlkKQo+ICAgICAgc3RydWN0IGh2bV9pb3JlcV9zZXJ2ZXIgKnM7Cj4gICAgICBp
bnQgcmM7Cj4gIAo+ICsgICAgQVNTRVJUKCFodm1faW9yZXFfaXNfaW50ZXJuYWwoaWQpKTsKCldp
dGggdGhpcywgLi4uCgo+IEBAIC04NzEsMTMgKzkwMywxMyBAQCBpbnQgaHZtX2Rlc3Ryb3lfaW9y
ZXFfc2VydmVyKHN0cnVjdCBkb21haW4gKmQsIGlvc2VydmlkX3QgaWQpCj4gIAo+ICAgICAgcDJt
X3NldF9pb3JlcV9zZXJ2ZXIoZCwgMCwgaWQpOwo+ICAKPiAtICAgIGh2bV9pb3JlcV9zZXJ2ZXJf
ZGlzYWJsZShzKTsKPiArICAgIGh2bV9pb3JlcV9zZXJ2ZXJfZGlzYWJsZShzLCBodm1faW9yZXFf
aXNfaW50ZXJuYWwoaWQpKTsKCi4uLiB3aHkgbm90IHNpbXBseSAiZmFsc2UiIGhlcmU/Cgo+ICAg
ICAgLyoKPiAgICAgICAqIEl0IGlzIHNhZmUgdG8gY2FsbCBodm1faW9yZXFfc2VydmVyX2RlaW5p
dCgpIHByaW9yIHRvCj4gICAgICAgKiBzZXRfaW9yZXFfc2VydmVyKCkgc2luY2UgdGhlIHRhcmdl
dCBkb21haW4gaXMgcGF1c2VkLgo+ICAgICAgICovCj4gLSAgICBodm1faW9yZXFfc2VydmVyX2Rl
aW5pdChzKTsKPiArICAgIGh2bV9pb3JlcV9zZXJ2ZXJfZGVpbml0KHMsIGZhbHNlKTsKClRoZSBt
b3JlIHRoYXQgaGVyZSB5b3UgZG8gc28uCgo+IEBAIC05MDAsNiArOTMyLDggQEAgaW50IGh2bV9n
ZXRfaW9yZXFfc2VydmVyX2luZm8oc3RydWN0IGRvbWFpbiAqZCwgaW9zZXJ2aWRfdCBpZCwKPiAg
ICAgIHN0cnVjdCBodm1faW9yZXFfc2VydmVyICpzOwo+ICAgICAgaW50IHJjOwo+ICAKPiArICAg
IEFTU0VSVCghaHZtX2lvcmVxX2lzX2ludGVybmFsKGlkKSk7Cj4gKwo+ICAgICAgc3Bpbl9sb2Nr
X3JlY3Vyc2l2ZSgmZC0+YXJjaC5odm0uaW9yZXFfc2VydmVyLmxvY2spOwo+ICAKPiAgICAgIHMg
PSBnZXRfaW9yZXFfc2VydmVyKGQsIGlkKTsKPiBAQCAtOTA5LDYgKzk0Myw3IEBAIGludCBodm1f
Z2V0X2lvcmVxX3NlcnZlcl9pbmZvKHN0cnVjdCBkb21haW4gKmQsIGlvc2VydmlkX3QgaWQsCj4g
ICAgICAgICAgZ290byBvdXQ7Cj4gIAo+ICAgICAgcmMgPSAtRVBFUk07Cj4gKyAgICAvKiBOQjog
ZG9uJ3QgYWxsb3cgZmV0Y2hpbmcgaW5mb3JtYXRpb24gZnJvbSBpbnRlcm5hbCBpb3JlcSBzZXJ2
ZXJzLiAqLwo+ICAgICAgaWYgKCBzLT5lbXVsYXRvciAhPSBjdXJyZW50LT5kb21haW4gKQo+ICAg
ICAgICAgIGdvdG8gb3V0OwoKVGhlIGNvbW1lbnQgZG9lc24ndCByZWFsbHkgc2VlbSB0byBiZSBh
cHBsaWNhYmxlIHRvIHRoZSBjb2RlIGhlcmU6Ci0+ZW11bGF0b3IgbGl2ZXMgaW4gdGhlICJleHRl
cm5hbCIgcGFydCBvZiB0aGUgdW5pb24sIGFuZCBoZW5jZSBpZgphbnl3aGVyZSBJIHRoaW5rIHRo
ZSBjb21tZW50IHNob3VsZCBnbyBuZXh0IHRvIHRoZSBBU1NFUlQoKSBhYm92ZS4KCj4gQEAgLTEw
MTAsNyArMTA0NSw3IEBAIGludCBodm1fbWFwX2lvX3JhbmdlX3RvX2lvcmVxX3NlcnZlcihzdHJ1
Y3QgZG9tYWluICpkLCBpb3NlcnZpZF90IGlkLAo+ICAgICAgICAgIGdvdG8gb3V0Owo+ICAKPiAg
ICAgIHJjID0gLUVQRVJNOwo+IC0gICAgaWYgKCBzLT5lbXVsYXRvciAhPSBjdXJyZW50LT5kb21h
aW4gKQo+ICsgICAgaWYgKCAhaHZtX2lvcmVxX2lzX2ludGVybmFsKGlkKSAmJiBzLT5lbXVsYXRv
ciAhPSBjdXJyZW50LT5kb21haW4gKQo+ICAgICAgICAgIGdvdG8gb3V0Owo+ICAKPiAgICAgIHN3
aXRjaCAoIHR5cGUgKQo+IEBAIC0xMDYyLDcgKzEwOTcsNyBAQCBpbnQgaHZtX3VubWFwX2lvX3Jh
bmdlX2Zyb21faW9yZXFfc2VydmVyKHN0cnVjdCBkb21haW4gKmQsIGlvc2VydmlkX3QgaWQsCj4g
ICAgICAgICAgZ290byBvdXQ7Cj4gIAo+ICAgICAgcmMgPSAtRVBFUk07Cj4gLSAgICBpZiAoIHMt
PmVtdWxhdG9yICE9IGN1cnJlbnQtPmRvbWFpbiApCj4gKyAgICBpZiAoICFodm1faW9yZXFfaXNf
aW50ZXJuYWwoaWQpICYmIHMtPmVtdWxhdG9yICE9IGN1cnJlbnQtPmRvbWFpbiApCj4gICAgICAg
ICAgZ290byBvdXQ7Cj4gIAo+ICAgICAgc3dpdGNoICggdHlwZSApCj4gQEAgLTExMDgsNiArMTE0
Myw4IEBAIGludCBodm1fbWFwX21lbV90eXBlX3RvX2lvcmVxX3NlcnZlcihzdHJ1Y3QgZG9tYWlu
ICpkLCBpb3NlcnZpZF90IGlkLAo+ICAgICAgc3RydWN0IGh2bV9pb3JlcV9zZXJ2ZXIgKnM7Cj4g
ICAgICBpbnQgcmM7Cj4gIAo+ICsgICAgQVNTRVJUKCFodm1faW9yZXFfaXNfaW50ZXJuYWwoaWQp
KTsKPiArCj4gICAgICBpZiAoIHR5cGUgIT0gSFZNTUVNX2lvcmVxX3NlcnZlciApCj4gICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7CgpUYWtpbmcganVzdCB0aGVzZSB0aHJlZSwgdGhpbmdzIHNlZW0g
cHJldHR5IGluY29uc2lzdGVudDogV2h5IEFTU0VSVCgpCmhlcmUgYnV0IGlmKCkgYWJvdmU/IEkg
dGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIGlmIGRtLmMgd2FzIGxlZnQKdW5jaGFuZ2VkIChub3Qg
c3VyZSBpZiBJJ20gaW4gb3Bwb3NpdGlvbiB3aXRoIHRoaXMgdG8gcHJpb3IgcmV2aWV3CmNvbW1l
bnRzIGJ5IHNvbWVvbmUgZWxzZSksIGluIHBhcnRpY3VsYXIgbWFraW5nIGl0IHVubmVjZXNzYXJ5
IChhcyBpdApzZWVtcykgdG8gZXhwb3NlIGh2bV9pb3JlcV9pc19pbnRlcm5hbCgpIG91dHNpZGUg
b2YgdGhpcyBDVS4KCj4gQEAgLTExODQsNyArMTIyMSw3IEBAIGludCBodm1fYWxsX2lvcmVxX3Nl
cnZlcnNfYWRkX3ZjcHUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHZjcHUgKnYpCj4gIAo+ICAg
ICAgc3Bpbl9sb2NrX3JlY3Vyc2l2ZSgmZC0+YXJjaC5odm0uaW9yZXFfc2VydmVyLmxvY2spOwo+
ICAKPiAtICAgIEZPUl9FQUNIX0lPUkVRX1NFUlZFUihkLCBpZCwgcykKPiArICAgIEZPUl9FQUNI
X0VYVEVSTkFMX0lPUkVRX1NFUlZFUihkLCBpZCwgcykKClN0aWxsIHJlbWVtYmVyaW5nIHRoZSBl
cnJvciBwYXRoIGZpeCB5b3UgbGlrZWx5IHNwb3R0ZWQgYXMgbmVjZXNzYXJ5CndoaWxlIGRvaW5n
IHRoaXMgd29yayAoY29tbWl0IDIxNWYyNTc2YjApOiBEb24ndCB5b3UgbmVlZCB0byBhZ2Fpbgph
ZGp1c3QgdGhpcyBzYW1lIGVycm9yIHBhdGggaGVyZSAoTUFYX05SX0lPUkVRX1NFUlZFUlMgLT4K
TUFYX05SX0VYVEVSTkFMX0lPUkVRX1NFUlZFUlMpPwoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
