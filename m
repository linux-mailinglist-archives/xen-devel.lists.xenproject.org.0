Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB2E7CF49
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 23:04:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsvis-00064n-7h; Wed, 31 Jul 2019 21:01:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Zog=V4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsvir-00064i-3z
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 21:01:21 +0000
X-Inumbo-ID: 5643e8a8-b3d6-11e9-b2a5-f3d771bdccd5
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5643e8a8-b3d6-11e9-b2a5-f3d771bdccd5;
 Wed, 31 Jul 2019 21:01:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 178B9344;
 Wed, 31 Jul 2019 14:01:16 -0700 (PDT)
Received: from [10.37.9.90] (unknown [10.37.9.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 774763F694;
 Wed, 31 Jul 2019 14:01:15 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-35-julien.grall@arm.com>
 <alpine.DEB.2.21.1907301422150.28600@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b1b9004e-d3f6-90ac-a12b-d98c5f0c4f9f@arm.com>
Date: Wed, 31 Jul 2019 22:01:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907301422150.28600@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 34/35] xen/arm32: head: Setup HTTBR in
 enable_mmu() and add missing isb
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
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDcvMzAvMTkgMTA6MjYgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBNb24sIDIyIEp1bCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEF0IHRoZSBt
b21lbnQsIEhUVEJSIGlzIHNldHVwIGluIGNyZWF0ZV9wYWdlX3RhYmxlcygpLiBUaGlzIGlzIGZp
bmUgYXMKPj4gaXQgaXMgY2FsbGVkIGJ5IGV2ZXJ5IENQVXMuCj4+Cj4+IEhvd2V2ZXIsIHN1Y2gg
YXNzdW1wdGlvbiBtYXkgbm90IGhvbGQgaW4gdGhlIGZ1dHVyZS4gVG8gbWFrZSBjaGFuZ2UKPj4g
ZWFzaWVyLCB0aGUgSFRUQlIgaXMgbm90IHNldHVwIGluIGVuYWJsZV9tbXUoKS4KPj4KPj4gVGFr
ZSB0aGUgb3Bwb3J0dW5pdHkgdG8gYWRkIHRoZSBtaXNzaW5nIGlzYigpIHRvIGVuc3VyZSB0aGUg
SFRUQlIgaXMKPj4gc2VlbiBiZWZvcmUgdGhlIE1NVSBpcyB0dXJuZWQgb24uCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+Cj4+IC0tLQo+
PiAgICAgIENoYW5nZXMgaW4gdjI6Cj4+ICAgICAgICAgIC0gUGF0Y2ggYWRkZWQKPj4gLS0tCj4+
ICAgeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8IDggKysrKysrLS0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPj4g
aW5kZXggNmQ1NWEyMTE5YS4uOGExZTI3MmFhYiAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJt
L2FybTMyL2hlYWQuUwo+PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4+IEBAIC0z
NzMsOCArMzczLDYgQEAgY3JlYXRlX3BhZ2VfdGFibGVzOgo+PiAgICAgICAgICAgLyogV3JpdGUg
WGVuJ3MgUFQncyBwYWRkciBpbnRvIHRoZSBIVFRCUiAqLwo+IAo+IFRoaXMgY29tbWVudCBuZWVk
cyB0byBiZSBtb3ZlZAoKR29vZCBzcG90IQoKPiAKPiAKPj4gICAgICAgICAgIGxkciAgIHI0LCA9
Ym9vdF9wZ3RhYmxlCj4+ICAgICAgICAgICBhZGQgICByNCwgcjQsIHIxMCAgICAgICAgICAgIC8q
IHI0IDo9IHBhZGRyIChib290X3BhZ2V0YWJsZSkgKi8KPj4gLSAgICAgICAgbW92ICAgcjUsICMw
ICAgICAgICAgICAgICAgICAvKiByNDpyNSBpcyBwYWRkciAoYm9vdF9wYWdldGFibGUpICovCj4+
IC0gICAgICAgIG1jcnIgIENQNjQocjQsIHI1LCBIVFRCUikKPiAKPiBJbnRlcmVzdGluZ2x5IHI1
IGlzIG5vdCBjbG9iYmVyZWQgYnkgY3JlYXRlX3BhZ2VfdGFibGVzIGFueW1vcmUsIHdlIG5lZWQK
PiB0byB1cGRhdGUgdGhlIGNvbW1lbnQgb24gdG9wLgoKSSBrbmV3IGRvY3VtZW50aW5nIHRoZSBj
bG9iYmVyZWQgcmVnaXN0ZXJzIGFyZSBnb2luZyB0byBjYXVzZSBzb21lIAp0cm91YmxlIHdoZW4g
dXBkYXRpbmcgdGhlIGNvZGUgOikuIEkgd2lsbCBmaXggaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
