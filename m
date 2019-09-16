Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 769EAB3ABC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 14:52:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9qRP-0004au-6b; Mon, 16 Sep 2019 12:49:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AgEa=XL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i9qRN-0004al-Dp
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 12:49:13 +0000
X-Inumbo-ID: 619bfe07-d880-11e9-95e3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 619bfe07-d880-11e9-95e3-12813bfff9fa;
 Mon, 16 Sep 2019 12:49:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F0F59AF30;
 Mon, 16 Sep 2019 12:49:10 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914064217.4877-1-jgross@suse.com>
 <616613a5-e617-4ada-1339-7a6458e8351c@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <bbf43f0d-3803-4091-e7f4-44c83b2b14a8@suse.com>
Date: Mon, 16 Sep 2019 14:49:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <616613a5-e617-4ada-1339-7a6458e8351c@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: rework and rename
 vcpu_force_reschedule()
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDkuMTkgMTE6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMDg6
NDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IHZjcHVfZm9yY2VfcmVzY2hlZHVsZSgpIGlzIG9u
bHkgdXNlZCBmb3IgbW9kaWZ5aW5nIHRoZSBwZXJpb2RpYyB0aW1lcgo+PiBvZiBhIHZjcHUuIEZv
cmNpbmcgYSB2Y3B1IHRvIGdpdmUgdXAgdGhlIHBoeXNpY2FsIGNwdSBmb3IgdGhhdCBwdXJwb3Nl
Cj4+IGlzIGtpbmQgb2YgYnJ1dGFsLgo+Pgo+PiBTbyBpbnN0ZWFkIG9mIGRvaW5nIHRoZSByZXNj
aGVkdWxlIGRhbmNlIGp1c3Qgb3BlcmF0ZSBvbiB0aGUgdGltZXIKPj4gZGlyZWN0bHkuIEJ5IHBy
b3RlY3RpbmcgcGVyaW9kaWMgdGltZXIgbW9kaWZpY2F0aW9ucyBhZ2FpbnN0IGNvbmN1cnJlbnQK
Pj4gdGltZXIgYWN0aXZhdGlvbiB2aWEgYSBwZXItdmNwdSBsb2NrIGl0IGlzIGV2ZW4gbm8gbG9u
Z2VyIHJlcXVpcmVkIHRvCj4+IGJvdGhlciB0aGUgdGFyZ2V0IHZjcHUgYXQgYWxsIGZvciB1cGRh
dGluZyBpdHMgdGltZXIuCj4+Cj4+IFJlbmFtZSB0aGUgZnVuY3Rpb24gdG8gdmNwdV9zZXRfcGVy
aW9kaWNfdGltZXIoKSBhcyB0aGlzIG5vdyByZWZsZWN0cwo+PiB0aGUgZnVuY3Rpb25hbGl0eS4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IAo+
IEkgY29udGludWUgdG8gYmUgdW5oYXBweSBhYm91dCB0aGVyZSBiZWluZyBubyB3b3JkIGF0IGFs
bCBhYm91dCAuLi4KPiAKPj4gQEAgLTcyNCwyNCArNzI1LDYgQEAgc3RhdGljIHZvaWQgdmNwdV9t
aWdyYXRlX2ZpbmlzaChzdHJ1Y3QgdmNwdSAqdikKPj4gICAgICAgdmNwdV93YWtlKHYpOwo+PiAg
IH0KPj4gICAKPj4gLS8qCj4+IC0gKiBGb3JjZSBhIFZDUFUgdGhyb3VnaCBhIGRlc2NoZWR1bGUv
cmVzY2hlZHVsZSBwYXRoLgo+PiAtICogRm9yIGV4YW1wbGUsIHVzaW5nIHRoaXMgd2hlbiBzZXR0
aW5nIHRoZSBwZXJpb2RpYyB0aW1lciBwZXJpb2QgbWVhbnMgdGhhdAo+PiAtICogbW9zdCBwZXJp
b2RpYy10aW1lciBzdGF0ZSBuZWVkIG9ubHkgYmUgdG91Y2hlZCBmcm9tIHdpdGhpbiB0aGUgc2No
ZWR1bGVyCj4+IC0gKiB3aGljaCBjYW4gdGh1cyBiZSBkb25lIHdpdGhvdXQgbmVlZCBmb3Igc3lu
Y2hyb25pc2F0aW9uLgo+PiAtICovCj4+IC12b2lkIHZjcHVfZm9yY2VfcmVzY2hlZHVsZShzdHJ1
Y3QgdmNwdSAqdikKPiAKPiAuLi4gdGhlIG9yaWdpbmFsbHkgaW50ZW5kZWQgc3luY2hyb25pemF0
aW9uLWZyZWUgaGFuZGxpbmcuIEZvcmNpbmcKPiB0aGUgdkNQVSB0aHJvdWdoIHRoZSBzY2hlZHVs
ZXIgbWF5IHNlZW0gaGFyc2ggKGFuZCBxdWl0ZSBzb21lCj4gb3ZlcmhlYWQpLCB5ZXMsIGJ1dCBJ
IGRvbid0IHRoaW5rIHRoZSBhYm92ZSB3YXMgd3JpdHRlbiAoYW5kCj4gZGVjaWRlZCkgd2l0aG91
dCBjb25zaWRlcmF0aW9uLiBPbmUgZWZmZWN0IG9mIHRoaXMgY2FuIGJlIHNlZW4gYnkKPiB5b3Ug
Li4uCj4gCj4+ICt2b2lkIHZjcHVfc2V0X3BlcmlvZGljX3RpbWVyKHN0cnVjdCB2Y3B1ICp2LCBz
X3RpbWVfdCB2YWx1ZSkKPj4gK3sKPj4gKyAgICBzcGluX2xvY2soJnYtPnBlcmlvZGljX3RpbWVy
X2xvY2spOwo+PiArCj4+ICsgICAgc3RvcF90aW1lcigmdi0+cGVyaW9kaWNfdGltZXIpOwo+IAo+
IC4uLiBpbnRyb2R1Y2luZyBhIG5ldyBzdG9wX3RpbWVyKCkgaGVyZSwgaS5lLiB3aGljaCBkb2Vz
bid0IHJlcGxhY2UKPiBhbnkgZXhpc3Rpbmcgb25lLiBUaGUgaW1wbGljYXRpb24gaXMgdGhhdCBv
dGhlciB0aGFuIGJlZm9yZSB0aGUKPiBwZXJpb2RpYyB0aW1lciBtYXkgbm93IG5vdCBydW4gKGZv
ciBhIGJyaWVmIG1vbWVudCkgZGVzcGl0ZSBpdAo+IGJlaW5nIHN1cHBvc2VkIHRvIHJ1biAtIGFm
dGVyIGFsbCBpdCBoYXMgYmVlbiBhY3RpdmUgc28gZmFyCj4gd2hlbmV2ZXIgYSB2Q1BVIHdhcyBy
dW5uaW5nLgo+IAo+IFRoZW4gYWdhaW4sIGxvb2tpbmcgYXQgdGhlIGludm9sdmVkIGNvZGUgcGF0
aHMgeWV0IGFnYWluLCBJIHdvbmRlcgo+IHdoZXRoZXIgdGhpcyBoYXMgYmVlbiB3b3JraW5nIHJp
Z2h0IGF0IGFsbDogVGhlcmUncyBhbiBlYXJseSBleGl0Cj4gZnJvbSBzY2hlZHVsZSgpIHdoZW4g
cHJldiA9PSBuZXh0LCB3aGljaCBieXBhc3Nlcwo+IHZjcHVfcGVyaW9kaWNfdGltZXJfd29yaygp
LiBBbmQgSSBjYW4ndCBzZWVtIHRvIGJlIGFibGUgdG8gc3BvdAo+IGFueXRoaW5nIG9uIHRoZSB2
Y3B1X2ZvcmNlX3Jlc2NoZWR1bGUoKSBwYXRoIHdoaWNoIHdvdWxkIGd1YXJhbnRlZQo+IHRoaXMg
c2hvcnRjdXQgdG8gbm90IGJlIHRha2VuLgoKRmlyc3QsIHRoZSBjdXJyZW50ICJzeW5jaHJvbml6
YXRpb24tZnJlZSIgaGFuZGxpbmcgaXMgbm90IGV4aXN0aW5nLiBUaGUKc3luY2hyb25pemF0aW9u
IGlzIGp1c3QgaGlkZGVuIGluIHRoZSBjYWxscyBvZiB2Y3B1X21pZ3JhdGVfKigpIGFuZCBpdApp
cyBkb25lIHZpYSB0aGUgc2NoZWR1bGVyIGxvY2suCgpZZXMsIEknbSBhZGRpbmcgYSBzdG9wX3Rp
bWVyKCksIGJ1dCB0aGUgcmVsYXRlZCBzdG9wX3RpbWVyKCkgY2FsbCBpbgp0aGUgb2xkIGNvZGUg
d2FzIGluIHNjaGVkdWxlKCkuIFNvIHN0YXRpY2FsbHkgeW91IGFyZSByaWdodCwgYnV0CmR5bmFt
aWNhbGx5IHRoZXJlIGlzIG5vIG5ldyBzdG9wX3RpbWVyKCkgY2FsbCBpbnZvbHZlZC4KCkFuZCBs
YXN0OiB0aGUgY2FzZSBwcmV2ID09IG5leHQgd291bGQgbm90IG9jY3VyIHRvZGF5LCBhcyB0aGUg
bWlncmF0ZQpmbGFnIGJlaW5nIHNldCBpbiB2Y3B1LT5wYXVzZV9mbGFncyB3b3VsZCBjYXVzZSB0
aGUgdmNwdSB0byBiZSB0YWtlbgphd2F5IGZyb20gdGhlIGNwdS4gU28gaXQgaXMgd29ya2luZyB0
b2RheSwgYnV0IHNldHRpbmcgdGhlIHBlcmlvZGljCnRpbWVyIHJlcXVpcmVzIHR3byBzY2hlZHVs
aW5nIGV2ZW50cyBpbiBjYXNlIHRoZSB0YXJnZXQgdmNwdSBpcwpjdXJyZW50bHkgcnVubmluZy4K
CgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
