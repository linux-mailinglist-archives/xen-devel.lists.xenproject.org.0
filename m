Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFDBCBBE0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 15:36:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGNi3-0008Q1-DR; Fri, 04 Oct 2019 13:33:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iGNi1-0008Pw-JT
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 13:33:25 +0000
X-Inumbo-ID: 89ab017e-e6ab-11e9-96dc-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89ab017e-e6ab-11e9-96dc-bc764e2007e4;
 Fri, 04 Oct 2019 13:33:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 31B8EB1AD;
 Fri,  4 Oct 2019 13:33:23 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ba0fd598-9102-e765-e7f5-61e91d47b124@suse.com>
 <b143bc0c-3d13-2127-be5d-b459d7b53c1e@suse.com>
 <135ac304-2f46-c84a-95ce-e18516f2b36d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <11bbbd61-deec-956d-de78-c42cd2571f8f@suse.com>
Date: Fri, 4 Oct 2019 15:33:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <135ac304-2f46-c84a-95ce-e18516f2b36d@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 2/3] AMD/IOMMU: allow callers to request
 allocate_buffer() to skip its memset()
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
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTAuMjAxOSAxNToyNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNi8wOS8yMDE5
IDE1OjI5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVGhlIGNvbW1hbmQgcmluZyBidWZmZXIgZG9l
c24ndCBuZWVkIGNsZWFyaW5nIHVwIGZyb250IGluIGFueSBldmVudC4KPj4gU3Vic2VxdWVudGx5
IHdlJ2xsIGFsc28gd2FudCB0byBhdm9pZCBjbGVhcmluZyB0aGUgZGV2aWNlIHRhYmxlcy4KPj4K
Pj4gV2hpbGUgcGxheWluZyB3aXRoIGZ1bmN0aW9ucyBzaWduYXR1cmVzIHJlcGxhY2UgdW5kdWUg
dXNlIG9mIGZpeGVkIHdpZHRoCj4+IHR5cGVzIGF0IHRoZSBzYW1lIHRpbWUsIGFuZCBleHRlbmQg
dGhpcyB0byBkZWFsbG9jYXRlX2J1ZmZlcigpIGFzIHdlbGwuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gLS0tCj4+IHY3OiBOZXcuCj4+Cj4+
IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKPj4gKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwo+PiBAQCAtOTk0LDEyICs5
OTQsMTIgQEAgc3RhdGljIHVuc2lnbmVkIGludCBfX2luaXQgZHRfYWxsb2Nfc2l6ZQo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU9NTVVfREVWX1RBQkxF
X0VOVFJZX1NJWkUpOwo+PiAgfQo+PiAgCj4+IC1zdGF0aWMgdm9pZCBfX2luaXQgZGVhbGxvY2F0
ZV9idWZmZXIodm9pZCAqYnVmLCB1aW50MzJfdCBzeikKPj4gK3N0YXRpYyB2b2lkIF9faW5pdCBk
ZWFsbG9jYXRlX2J1ZmZlcih2b2lkICpidWYsIHVuc2lnbmVkIGxvbmcgc3opCj4gCj4gUHJvYmFi
bHkgYmVzdCB0byB1c2Ugc2l6ZV90IGhlcmUsIGJlaW5nIGJvdGggc2hvcnRlciwgYW5kIGd1YXJh
bnRlZWQgbm90Cj4gdG8gcmVxdWlyZSBtb2RpZmljYXRpb24gaW4gdGhlIGZ1dHVyZS4KCkknZCBw
cmVmZXIgbm90IHRvIHdpdGhvdXQgb3RoZXIgcmVsYXRlZCBjb2RlIGFsc28gZ2V0dGluZyBzd2l0
Y2hlZApmcm9tIHVuc2lnbmVkIGxvbmcgdG8gc2l6ZV90LgoKPj4gIHsKPj4gLSAgICBpbnQgb3Jk
ZXIgPSAwOwo+PiAgICAgIGlmICggYnVmICkKPj4gICAgICB7Cj4+IC0gICAgICAgIG9yZGVyID0g
Z2V0X29yZGVyX2Zyb21fYnl0ZXMoc3opOwo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgb3JkZXIg
PSBnZXRfb3JkZXJfZnJvbV9ieXRlcyhzeik7Cj4+ICsKPj4gICAgICAgICAgX19mcmVlX2FtZF9p
b21tdV90YWJsZXMoYnVmLCBvcmRlcik7Cj4+ICAgICAgfQo+PiAgfQo+IAo+IEhvdyBhYm91dCBz
aW1wbHkKPiAKPiBpZiAoIGJ1ZiApCj4gwqDCoMKgIF9fZnJlZV9hbWRfaW9tbXVfdGFibGVzKGJ1
ZiwgZ2V0X29yZGVyX2Zyb21fYnl0ZXMoc3opKTsKPiAKPiB3aGljaCBkcm9wcyB0aGUgb3JkZXIg
dmFyaWFibGUgZW50aXJlbHk/CgpGaW5lIHdpdGggbWU7IEkgZGlkIGFjdHVhbGx5IGNvbnNpZGVy
IGRvaW5nIHNvLCBidXQgdGhlbiBkZWNpZGVkCmFnYWluc3QgdG8gc3RheSBjbG9zZXIgdG8gd2hh
dCB0aGUgY29kZSBsb29rZWQgbGlrZSBiZWZvcmUuCgo+IElkZWFsbHkgd2l0aCBib3RoIG9mIHRo
ZXNlIG1vZGlmaWNhdGlvbnMsIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyCj4gPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+CgpUaGFua3MuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
