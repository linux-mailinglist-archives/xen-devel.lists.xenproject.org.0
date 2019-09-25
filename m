Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 177DABE242
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 18:18:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9xB-0006Nq-8o; Wed, 25 Sep 2019 16:15:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD9x9-0006Nh-Mr
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 16:15:43 +0000
X-Inumbo-ID: b8771a04-dfaf-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id b8771a04-dfaf-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 16:15:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5E072AB9B;
 Wed, 25 Sep 2019 16:15:39 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1569425745.git.tamas.lengyel@intel.com>
 <e1fec257377046cf442842e27dff9bafc1f2bb27.1569425745.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2e648f3c-e5d3-c3eb-93d7-cde0a0058cb6@suse.com>
Date: Wed, 25 Sep 2019 18:15:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e1fec257377046cf442842e27dff9bafc1f2bb27.1569425745.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH for-next 04/18] x86/mem_sharing: cleanup
 code in various locations
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMjAxOSAxNzo0OCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vaHZtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gQEAgLTE4
NzksMTIgKzE4NzksMTEgQEAgaW50IGh2bV9oYXBfbmVzdGVkX3BhZ2VfZmF1bHQocGFkZHJfdCBn
cGEsIHVuc2lnbmVkIGxvbmcgZ2xhLAo+ICAgICAgaWYgKCBucGZlYy53cml0ZV9hY2Nlc3MgJiYg
KHAybXQgPT0gcDJtX3JhbV9zaGFyZWQpICkKPiAgICAgIHsKPiAgICAgICAgICBBU1NFUlQocDJt
X2lzX2hvc3RwMm0ocDJtKSk7Cj4gLSAgICAgICAgc2hhcmluZ19lbm9tZW0gPSAKPiAtICAgICAg
ICAgICAgKG1lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShjdXJyZCwgZ2ZuLCAwKSA8IDApOwo+ICsg
ICAgICAgIHNoYXJpbmdfZW5vbWVtID0gbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKGN1cnJkLCBn
Zm4sIDApOwoKSSBndWVzcyB0aGUgaW1wbGljYXRpb24gaGVyZSBpcyB0aGF0IHRoZSBmdW5jdGlv
biBjYW4gb25seSByZXR1cm4KLUVOT01FTT8gTm90IHZlcnkgZm9yd2FyZCBjb21wYXRpYmxlLCBi
dXQgd2VsbC4gSG93ZXZlciwgaWYgeW91CnRvdWNoIHRoaXMgYWxyZWFkeSwgc2hvdWxkbid0IHlv
dSBhdCBsZWFzdCBtYWtlICJzaGFyaW5nX2Vub21lbSIKYm9vbD8KCj4gQEAgLTEyNDAsMTEgKzEy
NzcsMTEgQEAgaW50IF9fbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKHN0cnVjdCBkb21haW4gKmQs
Cj4gICAgICBtZW1fc2hhcmluZ19wYWdlX3VubG9jayhvbGRfcGFnZSk7Cj4gICAgICBwdXRfcGFn
ZV9hbmRfdHlwZShvbGRfcGFnZSk7Cj4gIAo+IC1wcml2YXRlX3BhZ2VfZm91bmQ6ICAgIAo+ICtw
cml2YXRlX3BhZ2VfZm91bmQ6CgpQbGVhc2UgYWxzbyBpbmRlbnQgdGhpcyBsYWJlbCBieSAoYXQg
bGVhc3QpIG9uZSBibGFuay4KCj4gQEAgLTU3LDM0ICs1OSwzNCBAQCBzdHJ1Y3QgcGFnZV9zaGFy
aW5nX2luZm8KPiAgICAgIH07Cj4gIH07Cj4gIAo+IC0jZGVmaW5lIHNoYXJpbmdfc3VwcG9ydGVk
KF9kKSBcCj4gLSAgICAoaXNfaHZtX2RvbWFpbihfZCkgJiYgcGFnaW5nX21vZGVfaGFwKF9kKSkg
Cj4gLQo+ICB1bnNpZ25lZCBpbnQgbWVtX3NoYXJpbmdfZ2V0X25yX3NhdmVkX21mbnModm9pZCk7
Cj4gIHVuc2lnbmVkIGludCBtZW1fc2hhcmluZ19nZXRfbnJfc2hhcmVkX21mbnModm9pZCk7Cj4g
IAo+ICAjZGVmaW5lIE1FTV9TSEFSSU5HX0RFU1RST1lfR0ZOICAgICAgICgxPDwxKQo+ICAvKiBP
bmx5IGZhaWxzIHdpdGggLUVOT01FTS4gRW5mb3JjZSBpdCB3aXRoIGEgQlVHX09OIHdyYXBwZXIu
ICovCj4gIGludCBfX21lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShzdHJ1Y3QgZG9tYWluICpkLAo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZ2ZuLCAKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCBmbGFncyk7Cj4gLXN0YXRpYyBpbmxp
bmUgaW50IG1lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShzdHJ1Y3QgZG9tYWluICpkLAo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBnZm4s
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCBm
bGFncykKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZ2Zu
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3QgZmxhZ3MpOwo+ICsK
PiArc3RhdGljIGlubGluZQo+ICtpbnQgbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKHN0cnVjdCBk
b21haW4gKmQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBn
Zm4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3QgZmxhZ3MpCj4gIHsK
PiAgICAgIGludCByYyA9IF9fbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKGQsIGdmbiwgZmxhZ3Mp
Owo+ICAgICAgQlVHX09OKCByYyAmJiAocmMgIT0gLUVOT01FTSkgKTsKCldvdWxkIHlvdSBtaW5k
IGFsc28gZHJvcHBpbmcgdGhlIHN0cmF5IGJsYW5rcyBoZXJlPwoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
