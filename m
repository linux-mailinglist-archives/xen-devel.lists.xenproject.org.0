Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E45BE074
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 16:44:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD8TJ-0001DZ-CS; Wed, 25 Sep 2019 14:40:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD8TH-0001DU-Ln
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 14:40:47 +0000
X-Inumbo-ID: 75678fd0-dfa2-11e9-9636-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 75678fd0-dfa2-11e9-9636-12813bfff9fa;
 Wed, 25 Sep 2019 14:40:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 544F7B68F;
 Wed, 25 Sep 2019 14:40:45 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <e0a904bf-b6a0-6224-88f6-e89a95867718@suse.com>
 <220c3d44-6186-fa9c-4f99-2e8c34bbc0ce@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c3f1f985-2ba2-3022-5469-4a0e29891a58@suse.com>
Date: Wed, 25 Sep 2019 16:40:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <220c3d44-6186-fa9c-4f99-2e8c34bbc0ce@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 7/8] AMD/IOMMU: allocate one device table
 per PCI segment
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMjAxOSAxNjoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOS8wOS8yMDE5
IDE0OjI0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gSGF2aW5nIGEgc2luZ2xlIGRldmljZSB0YWJs
ZSBmb3IgYWxsIHNlZ21lbnRzIGNhbid0IHBvc3NpYmx5IGJlIHJpZ2h0Lgo+IAo+IFRoYXQgZGVw
ZW5kcyBvbiB5b3VyIHBvaW50IG9mIHZpZXcuwqAgR2l2ZW4gdGhhdCB0aGVyZSBhcmVuJ3QgQU1E
IHN5c3RlbXMKPiAob3IgcmVhbGx5LCB4ODYgc3lzdGVtcyBpbiBnZW5lcmFsKQoKWW91IGtlZXAg
c2F5aW5nIHRoaXMsIGFuZCBJIGNhbiBvbmx5IGtlZXAgcmVwZWF0aW5nIHRoYXQgYSBjb3VwbGUK
b2YgeWVhcnMgYWdvIEkgZGlkIGVuZCB1cCB0ZXN0aW5nIChhbmQgbWFraW5nIHdvcmspIFhlbiBv
biBhbiBTR0kKc3lzdGVtIHdpdGggKGlpcmMpIHRocmVlIHNlZ21lbnRzLgoKPiB3aXRoIHNlZ21l
bnRzIG90aGVyIHRoYW4gemVybywgYQo+IHNpbmdsZSBkZXZpY2UgdGFibGUgaXMgcmVhc29uYWJs
ZSwgZXZlbiBpZiBub3Qgb3Zlcmx5LWZvcndhcmQgY29tcGF0aWJsZS4KCldlbGwsIEkgc2VlIHdo
YXQgeW91IG1lYW4sIGJ1dCBteSB1c2Ugb2YgcGx1cmFsIGluICJzZWdtZW50cyIgaXMKaW50ZW5k
ZWQgdG8gbWVhbiBwb3RlbnRpYWxseSBtdWx0aXBsZSBvZiB0aGVtLgoKPj4gLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwo+PiArKysgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCj4+IEBAIC0xMDY4LDggKzEwNjcsMjkgQEAgc3Rh
dGljIHZvaWQgKiBfX2luaXQgYWxsb2NhdGVfcHByX2xvZyhzdAo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBJT01NVV9QUFJfTE9HX0RFRkFVTFRfRU5UUklFUywgIlBQUiBMb2ci
KTsKPj4gIH0KPj4gIAo+PiArLyoKPj4gKyAqIFdpdGhpbiBpdnJzX21hcHBpbmdzW10gd2UgYWxs
b2NhdGUgYW4gZXh0cmEgYXJyYXkgZWxlbWVudCB0byBzdG9yZQo+PiArICogLSBzZWdtZW50IG51
bWJlciwKPj4gKyAqIC0gZGV2aWNlIHRhYmxlLgo+PiArICovCj4+ICsjZGVmaW5lIElWUlNfTUFQ
UElOR1NfU0VHKG0pIChtKVtpdnJzX2JkZl9lbnRyaWVzXS5kdGVfcmVxdWVzdG9yX2lkCj4+ICsj
ZGVmaW5lIElWUlNfTUFQUElOR1NfREVWVEFCKG0pIChtKVtpdnJzX2JkZl9lbnRyaWVzXS5pbnRy
ZW1hcF90YWJsZQo+PiArCj4+ICtzdGF0aWMgdm9pZCBfX2luaXQgZnJlZV9pdnJzX21hcHBpbmco
dm9pZCAqcHRyKQo+IAo+IEEgcG9pbnRlciB0byB0aGlzIGZ1bmN0aW9uIGdldHMgc3Rhc2hlZCBp
biBhIG5vbi1pbml0IHJhZGl4IHRyZWUsIGFuZAo+IGdldHMgaW52b2tlZCBieSBhIG5vbi1pbml0
IGZ1bmN0aW9uIChyYWRpeF90cmVlX2Rlc3Ryb3kpLsKgIEl0IHNob3VsZG4ndAo+IGJlIF9faW5p
dC4KCkkgZG9uJ3Qgc2VlIHRoZSBzdGFzaGluZyBwYXJ0LCBhbmQgSSBkb24ndCBzZWUgYW4gaXNz
dWUgYXQgYWxsIHdpdGgKcGFzc2luZyB0aGUgZnVuY3Rpb24gcG9pbnRlciB0byByYWRpeF90cmVl
X2Rlc3Ryb3koKTogVGhpcyBmdW5jdGlvbgppbnZvY2F0aW9uIGlzIGl0c2VsZiBpbiBhbiBfX2lu
aXQgZnVuY3Rpb24gKHdoaWNoIGdldHMgY2FsbGVkIHVwb24KaW5pdGlhbGl6YXRpb24gZXJyb3Jz
KS4KCj4+IEBAIC0xMDgyLDEzICsxMTAyLDE1IEBAIHN0YXRpYyBpbnQgX19pbml0IGFtZF9pb21t
dV9pbml0X29uZShzdHIKPj4gICAgICBpZiAoIGludHIgJiYgIXNldF9pb21tdV9pbnRlcnJ1cHRf
aGFuZGxlcihpb21tdSkgKQo+PiAgICAgICAgICBnb3RvIGVycm9yX291dDsKPj4gIAo+PiAtICAg
IC8qIFRvIG1ha2Ugc3VyZSB0aGF0IGRldmljZV90YWJsZS5idWZmZXIgaGFzIGJlZW4gc3VjY2Vz
c2Z1bGx5IGFsbG9jYXRlZCAqLwo+PiAtICAgIGlmICggZGV2aWNlX3RhYmxlLmJ1ZmZlciA9PSBO
VUxMICkKPj4gKyAgICAvKiBNYWtlIHN1cmUgdGhhdCB0aGUgZGV2aWNlIHRhYmxlIGhhcyBiZWVu
IHN1Y2Nlc3NmdWxseSBhbGxvY2F0ZWQuICovCj4+ICsgICAgaXZyc19tYXBwaW5ncyA9IGdldF9p
dnJzX21hcHBpbmdzKGlvbW11LT5zZWcpOwo+PiArICAgIGlmICggIUlWUlNfTUFQUElOR1NfREVW
VEFCKGl2cnNfbWFwcGluZ3MpICkKPiAKPiBUaGlzIGlzbid0IHNhZmUuwqAgZ2V0X2l2cnNfbWFw
cGluZ3MoKSByZXR1cm5zIE5VTEwgb24gZmFpbHVyZSwgd2hpY2gKPiBJVlJTX01BUFBJTkdTX0RF
VlRBQigpIGRlcmVmZXJlbmNlcyB0byBmaW5kIHRoZSBkZXZpY2UgdGFibGUgcG9pbnRlci4KCmdl
dF9pdnJzX21hcHBpbmdzKCkgY2FuJ3QgcmV0dXJuIE5VTEwgaGVyZSAtIGlmIHRoZSBzZXR0aW5n
IHVwIG9mCnRoYXQgdGFibGUgaGFzIGZhaWxlZCAoaW4gYW1kX2lvbW11X3ByZXBhcmVfb25lKCkp
LCB3ZSB3b3VsZG4ndCBtYWtlCml0IGhlcmUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
