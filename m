Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A03849EA
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 12:44:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvJNk-0006Hw-V4; Wed, 07 Aug 2019 10:41:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvJNj-0006Hm-8P
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 10:41:23 +0000
X-Inumbo-ID: e4074cce-b8ff-11e9-b9ac-a3f34ed18b38
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4074cce-b8ff-11e9-b9ac-a3f34ed18b38;
 Wed, 07 Aug 2019 10:41:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DE3FDACB8;
 Wed,  7 Aug 2019 10:41:18 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-6-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <805cd751-819a-a7d6-0755-9e82bcde2a37@suse.com>
Date: Wed, 7 Aug 2019 12:41:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730134419.2739-6-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/6] iommu: tidy up iommu_us_hap_pt() and
 need_iommu_pt_sync() macros
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxNTo0NCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoZXMgbWFjcm9zIHJl
YWxseSBvdWdodCB0byBsaXZlIGluIHRoZSBjb21tb24geGVuL2lvbW11LmggaGVhZGVyIHJhdGhl
cgo+IHRoZW4gYmVpbmcgZGlzdHJpYnV0ZWQgYW1vbmdzdCBhcmNoaXRlY3R1cmUgc3BlY2lmaWMg
aW9tbXUgaGVhZGVycyBhbmQKPiB4ZW4vc2NoZWQuaC4gVGhpcyBwYXRjaCBtb3ZlcyB0aGVtIHRo
ZXJlLgo+IAo+IE5PVEU6IERpc2FibGluZyAnc2hhcmVwdCcgaW4gdGhlIGNvbW1hbmQgbGluZSBp
b21tdSBvcHRpb25zIHNob3VsZCByZWFsbHkKPiAgICAgICAgYmUgaGFyZCBlcnJvciBvbiBBUk0g
KGFzIG9wcG9zZWQgdG8ganVzdCBiZWluZyBpZ25vcmVkKSwgc28gYXZvaWQKPiAgICAgICAgcGFy
c2luZyB0aGF0IG9wdGlvbiBpZiBDT05GSUdfQVJNIGlzIHNldC4KCkFncmVlZC4gQXQgdGhhdCBw
b2ludCB0aGUgbGF0ZXN0IGl0IHdvdWxkIHBlcmhhcHMgYmUgZ29vZCB0byBoYXZlCkFybSBoYXZl
CiNkZWZpbmUgaW9tbXVfaGFwX3B0X3NoYXJlIHRydWUKCj4gLS0tIGEveGVuL2luY2x1ZGUveGVu
L2lvbW11LmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaAo+IEBAIC0yNjgsNiArMjY4
LDEzIEBAIHN0cnVjdCBkb21haW5faW9tbXUgewo+ICAgI2RlZmluZSBpb21tdV9zZXRfZmVhdHVy
ZShkLCBmKSAgIHNldF9iaXQoZiwgZG9tX2lvbW11KGQpLT5mZWF0dXJlcykKPiAgICNkZWZpbmUg
aW9tbXVfY2xlYXJfZmVhdHVyZShkLCBmKSBjbGVhcl9iaXQoZiwgZG9tX2lvbW11KGQpLT5mZWF0
dXJlcykKPiAgIAo+ICsvKiBBcmUgd2UgdXNpbmcgdGhlIGRvbWFpbiBQMk0gdGFibGUgYXMgaXRz
IElPTU1VIHBhZ2V0YWJsZT8gKi8KPiArI2RlZmluZSBpb21tdV91c2VfaGFwX3B0KGQpIFwKPiAr
ICAgIChoYXBfZW5hYmxlZChkKSAmJiBpc19pb21tdV9lbmFibGVkKGQpICYmIGlvbW11X2hhcF9w
dF9zaGFyZSkKCkRvZXMgdGhpcyBidWlsZCBmb3IgQXJtLCBzZWVpbmcgdGhhdCB0aGVyZSdzIG5v
IGhhcF9lbmFibGVkKCkKZGVmaW5pdGlvbiB0aGVyZT8gT3IgaGF2ZSBJIG1pc3NlZCBpdHMgYWRk
aXRpb24gZWFybGllciBpbiB0aGlzCnNlcmllcz8KCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3Nj
aGVkLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+IEBAIC05NjMsMTIgKzk2Myw2
IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19od2RvbV9waW5uZWRfdmNwdShjb25zdCBzdHJ1Y3Qg
dmNwdSAqdikKPiAgICAgICAgICAgICAgIGNwdW1hc2tfd2VpZ2h0KHYtPmNwdV9oYXJkX2FmZmlu
aXR5KSA9PSAxKTsKPiAgIH0KPiAgIAo+IC0jaWZkZWYgQ09ORklHX0hBU19QQVNTVEhST1VHSAo+
IC0jZGVmaW5lIG5lZWRfaW9tbXVfcHRfc3luYyhkKSAoZG9tX2lvbW11KGQpLT5uZWVkX3N5bmMp
Cj4gLSNlbHNlCj4gLSNkZWZpbmUgbmVlZF9pb21tdV9wdF9zeW5jKGQpIGZhbHNlCj4gLSNlbmRp
ZgoKVGhlICIjZWxzZSIgcGFydCBvZiB0aGlzIGdldHMgbG9zdCAtIGlzIHRoaXMgaW50ZW50aW9u
YWwsIGkuZS4KYXJlIHRoZXJlIG5vIHJlZmVyZW5jZXMgbGVmdCB0aGF0IGNvdWxkIGJlIGEgcHJv
YmxlbSB3aXRob3V0CkhBU19QQVNTVEhST1VHSD8KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
