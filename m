Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8659AB48EE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 10:13:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA8YX-0007wS-Iu; Tue, 17 Sep 2019 08:09:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VJ/=XM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iA8YW-0007w7-CC
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 08:09:48 +0000
X-Inumbo-ID: 835c37fc-d922-11e9-9604-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 835c37fc-d922-11e9-9604-12813bfff9fa;
 Tue, 17 Sep 2019 08:09:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F1581B628;
 Tue, 17 Sep 2019 08:09:45 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190916081024.20931-1-aisaila@bitdefender.com>
 <18854b5e-8e1a-298f-672f-ccc93b5b3a2a@suse.com>
 <3f252f60-6f72-6025-d4dc-d82077e43691@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f791ad24-a106-1cf6-2ff8-53adca03b1d5@suse.com>
Date: Tue, 17 Sep 2019 10:09:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3f252f60-6f72-6025-d4dc-d82077e43691@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10] x86/emulate: Send vm_event from emulate
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
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDkuMjAxOSAwOTo1MiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gT24g
MTYuMDkuMjAxOSAxODo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE2LjA5LjIwMTkgMTA6
MTAsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2
L2h2bS9odm0uYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+Pj4gQEAgLTMyMjQs
NiArMzIyNCwxNCBAQCBzdGF0aWMgZW51bSBodm1fdHJhbnNsYXRpb25fcmVzdWx0IF9faHZtX2Nv
cHkoCj4+PiAgICAgICAgICAgICAgIHJldHVybiBIVk1UUkFOU19iYWRfZ2ZuX3RvX21mbjsKPj4+
ICAgICAgICAgICB9Cj4+PiAgIAo+Pj4gKyAgICAgICAgaWYgKCB1bmxpa2VseSh2LT5hcmNoLnZt
X2V2ZW50KSAmJgo+Pj4gKyAgICAgICAgICAgICB2LT5hcmNoLnZtX2V2ZW50LT5zZW5kX2V2ZW50
ICYmCj4+PiArICAgICAgICAgICAgIGh2bV9tb25pdG9yX2NoZWNrX3AybShhZGRyLCBnZm4sIHBm
ZWMsIG5wZmVjX2tpbmRfd2l0aF9nbGEpICkKPj4+ICsgICAgICAgIHsKPj4+ICsgICAgICAgICAg
ICBwdXRfcGFnZShwYWdlKTsKPj4+ICsgICAgICAgICAgICByZXR1cm4gSFZNVFJBTlNfZ2ZuX3Bh
Z2VkX291dDsKPj4KPj4gSSdtIHNvcnJ5LCBidXQgdGhlcmUgaXMgX3N0aWxsXyBubyBjb21tZW50
IG5leHQgdG8gdGhpcyBhcHBhcmVudAo+PiBtaXMtdXNlIG9mIEhWTVRSQU5TX2dmbl9wYWdlZF9v
dXQuCj4gCj4gSSB3aWxsIGFkZCB0aGlzIGNvbW1lbnQgaGVyZToKPiAKPiAiLyoKPiAgICAqIElu
IGNhc2UgYSB2bSBldmVudCB3YXMgc2VudCByZXR1cm4gcGFnZWRfb3V0IHNvIHRoZSBlbXVsYXRp
b24gd2lsbAo+ICAgICogc3RvcCB3aXRoIG5vIHNpZGUgZWZmZWN0Cj4gICAgKi8iCgpGaXJzdCBv
ZiBhbGwgLSB3aHkgIndhcyBzZW50Ij8gVGhlIGV2ZW50IGlzIHlldCB0byBiZSBzZW50LCBpc24n
dCBpdD8KQW5kIHRoZW4gSSdtIGFmcmFpZCB0aGlzIHN0aWxsIGlzbid0IGVub3VnaC4gX19odm1f
Y29weSgpIGdldHMgdXNlZApmb3IgbWFueSBwdXJwb3Nlcy4gRm9yIGV4YW1wbGUsIHdoaWxlIGxv
b2tpbmcgaW50byB0aGlzIGFnYWluIHdoZW4KcHJlcGFyaW5nIHRoZSByZXBseSBoZXJlLCBJJ3Zl
IG5vdGljZWQgdGhhdCBhYm92ZSB5b3UgbWF5IHdyb25nbHkKY2FsbCBodm1fbW9uaXRvcl9jaGVj
a19wMm0oKSB3aXRoIG5wZmVjX2tpbmRfd2l0aF9nbGEgLSB0aGVyZSdzIG5vCmxpbmVhciBhZGRy
ZXNzIHdoZW4gSFZNQ09QWV9saW5lYXIgaXMgbm90IHNldC4gSWYsIHdoaWxlIHB1dHRpbmcKdG9n
ZXRoZXIgd2hhdCB0aGUgY29tbWVudCBuZWVkcyB0byBleHBsYWluIChpLmUuIGV2ZXJ5dGhpbmcg
dGhhdApjYW4ndCBiZSBpbXBsaWVkIGZyb20gdGhlIGNvZGUgeW91IGFkZCksIHlvdSBjb25zaWRl
cmVkIGFsbCBjYXNlcwp5b3Ugc2hvdWxkIGhhdmUgbm90aWNlZCB0aGlzIHlvdXJzZWxmLgoKPj4+
IEBAIC0yMTUsNiArMjE3LDc5IEBAIHZvaWQgaHZtX21vbml0b3JfaW50ZXJydXB0KHVuc2lnbmVk
IGludCB2ZWN0b3IsIHVuc2lnbmVkIGludCB0eXBlLAo+Pj4gICAgICAgbW9uaXRvcl90cmFwcyhj
dXJyZW50LCAxLCAmcmVxKTsKPj4+ICAgfQo+Pj4gICAKPj4+ICsvKgo+Pj4gKyAqIFNlbmQgbWVt
b3J5IGFjY2VzcyB2bV9ldmVudHMgYmFzZWQgb24gcGZlYy4gUmV0dXJucyB0cnVlIGlmIHRoZSBl
dmVudCB3YXMKPj4+ICsgKiBzZW50IGFuZCBmYWxzZSBmb3IgcDJtX2dldF9tZW1fYWNjZXNzKCkg
ZXJyb3IsIG5vIHZpb2xhdGlvbiBhbmQgZXZlbnQgc2VuZAo+Pj4gKyAqIGVycm9yLiBBc3N1bWVz
IHRoZSBjYWxsZXIgd2lsbCBjaGVjayBhcmNoLnZtX2V2ZW50LT5zZW5kX2V2ZW50Lgo+Pj4gKyAq
Cj4+PiArICogTk9URTogcDJtX2dldF9tZW1fYWNjZXNzKCkgY2FuIGZhaWwgaWYgdGhlIGVudHJ5
IHdhcyBub3QgZm91bmQgaW4gdGhlIEVQVAo+Pj4gKyAqIChpbiB3aGljaCBjYXNlIGFjY2VzcyB0
byBpdCBpcyB1bnJlc3RyaWN0ZWQsIHNvIG5vIHZpb2xhdGlvbnMgY2FuIG9jY3VyKS4KPj4+ICsg
KiBJbiB0aGlzIGNhc2VzIGl0IGlzIGZpbmUgdG8gY29udGludWUgdGhlIGVtdWxhdGlvbi4KPj4+
ICsgKi8KPj4KPj4gSSB0aGluayB0aGlzIHBhcnQgb2YgdGhlIGNvbW1lbnQgd291bGQgYmV0dGVy
IGdvIC4uLgo+Pgo+Pj4gK2Jvb2wgaHZtX21vbml0b3JfY2hlY2tfcDJtKHVuc2lnbmVkIGxvbmcg
Z2xhLCBnZm5fdCBnZm4sIHVpbnQzMl90IHBmZWMsCj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdWludDE2X3Qga2luZCkKPj4+ICt7Cj4+PiArICAgIHhlbm1lbV9hY2Nlc3NfdCBhY2Nl
c3M7Cj4+PiArICAgIHZtX2V2ZW50X3JlcXVlc3RfdCByZXEgPSB7fTsKPj4+ICsgICAgcGFkZHJf
dCBncGEgPSAoZ2ZuX3RvX2dhZGRyKGdmbikgfCAoZ2xhICYgflBBR0VfTUFTSykpOwo+Pj4gKwo+
Pj4gKyAgICBBU1NFUlQoY3VycmVudC0+YXJjaC52bV9ldmVudC0+c2VuZF9ldmVudCk7Cj4+PiAr
Cj4+PiArICAgIGN1cnJlbnQtPmFyY2gudm1fZXZlbnQtPnNlbmRfZXZlbnQgPSBmYWxzZTsKPj4+
ICsKPj4+ICsgICAgaWYgKCBwMm1fZ2V0X21lbV9hY2Nlc3MoY3VycmVudC0+ZG9tYWluLCBnZm4s
ICZhY2Nlc3MsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsdHAybV92Y3B1X2lk
eChjdXJyZW50KSkgIT0gMCApCj4+PiArICAgICAgICByZXR1cm4gZmFsc2U7Cj4+Cj4+IC4uLiBu
ZXh0IHRvIHRoZSBjYWxsIGhlcmUgKGJ1dCB0aGUgbWFpbnRhaW5lcnMgb2YgdGhlIGZpbGUgd291
bGQKPj4gaGF2ZSB0byBqdWRnZSBpbiB0aGUgZW5kKS4gVGhhdCBzYWlkLCBJIGNvbnRpbnVlIHRv
IG5vdCB1bmRlcnN0YW5kCj4+IHdoeSBhIG5vdCBmb3VuZCBlbnRyeSBtZWFucyB1bnJlc3RyaWN0
ZWQgYWNjZXNzLiBJc24ndCBpdAo+PiAtPmRlZmF1bHRfYWNjZXNzIHdoaWNoIGNvbnRyb2xzIHdo
YXQgc3VjaCBhICJ2aXJ0dWFsIiBlbnRyeSB3b3VsZAo+PiBwZXJtaXQ/Cj4gCj4gSSdtIHNvcnJ5
IGZvciB0aGlzIG1pc2xlYWRpbmcgY29tbWVudC4gVGhlIGNvZGUgc3RhdGVzIHRoYXQgaWYgZW50
cnkgd2FzIAo+IG5vdCBmb3VuZCB0aGUgYWNjZXNzIHdpbGwgYmUgZGVmYXVsdF9hY2Nlc3MgYW5k
IHJldHVybiAwLiBTbyBpbiB0aGlzIAo+IGNhc2UgdGhlIGRlZmF1bHRfYWNjZXNzIHdpbGwgYmUg
Y2hlY2tlZC4KPiAKPiAvKiBJZiByZXF1ZXN0IHRvIGdldCBkZWZhdWx0IGFjY2Vzcy4gKi8KPiBp
ZiAoIGdmbl9lcShnZm4sIElOVkFMSURfR0ZOKSApCj4gewo+ICAgICAgKmFjY2VzcyA9IG1lbWFj
Y2Vzc1twMm0tPmRlZmF1bHRfYWNjZXNzXTsKPiAgICAgIHJldHVybiAwOwo+IH0KPiAKPiBJZiB0
aGlzIGNsZWFycyB0aGluZyB1cCBJIGNhbiByZW1vdmUgdGhlICJOT1RFIiBwYXJ0IGlmIHRoZSBj
b21tZW50LgoKSSdtIGFmcmFpZCBpdCBkb2Vzbid0IGNsZWFyIHRoaW5ncyB1cDogSSdtIHN0aWxs
IGxvc3QgYXMgdG8gd2h5CiJlbnRyeSBub3QgZm91bmQiIGltcGxpZXMgImZ1bGwgYWNjZXNzIi4g
QW5kIEknbSBmdXJ0aGVyIGxvc3QgYXMKdG8gd2hhdCB0aGUgY29kZSBmcmFnbWVudCBhYm92ZSAo
ZGVhbGluZyB3aXRoIElOVkFMSURfR0ZOLCBidXQKbm90IHJlYWxseSB0aGUgImVudHJ5IG5vdCBm
b3VuZCIgY2FzZSwgd2hpY2ggd291bGQgYmUgSU5WQUxJRF9NRk4KY29taW5nIGJhY2sgZnJvbSBh
IHRyYW5zbGF0aW9uKSBpcyBzdXBwb3NlZCB0byB0ZWxsIG1lLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
