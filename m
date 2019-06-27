Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FABC58126
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 13:07:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgSCa-000819-Dh; Thu, 27 Jun 2019 11:04:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ndTn=U2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hgSCZ-000814-0D
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 11:04:27 +0000
X-Inumbo-ID: 51c7a4b6-98cb-11e9-8a03-7772e15c4d21
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 51c7a4b6-98cb-11e9-8a03-7772e15c4d21;
 Thu, 27 Jun 2019 11:04:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF0612B;
 Thu, 27 Jun 2019 04:04:22 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 188B33F718;
 Thu, 27 Jun 2019 04:04:21 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-18-julien.grall@arm.com>
 <alpine.DEB.2.21.1906261224240.5851@sstabellini-ThinkPad-T480s>
 <7c8f54c5-29e1-8296-4dd5-401ef1406e2a@arm.com>
 <alpine.DEB.2.21.1906261407150.5851@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <97e51782-85f8-8381-4244-cd8e2e0165e2@arm.com>
Date: Thu, 27 Jun 2019 12:04:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906261407150.5851@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 17/17] xen/arm64: Zero BSS after the MMU and
 D-cache is turned on
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 andrii_anisov@epam.com, andre.przywara@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDI2LzA2LzIwMTkgMjI6MDgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBXZWQsIDI2IEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIFN0ZWZh
bm8sCj4+Cj4+IE9uIDYvMjYvMTkgODoyOSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+
Pj4gT24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IEF0IHRoZSBt
b21lbnQgQlNTIGlzIHplcm9lZCBiZWZvcmUgdGhlIE1NVSBhbmQgRC1DYWNoZSBpcyB0dXJuZWQg
b24uCj4+Pj4gSW4gb3RoZXIgd29yZHMsIHRoZSBjYWNoZSB3aWxsIGJlIGJ5cGFzc2VkIHdoZW4g
emVyb2luZyB0aGUgQlNTIHNlY3Rpb24uCj4+Pj4KPj4+PiBQZXIgdGhlIEltYWdlIHByb3RvY29s
IFsxXSwgdGhlIHN0YXRlIG9mIHRoZSBjYWNoZSBmb3IgQlNTIHJlZ2lvbiBpcyBub3QKPj4+PiBr
bm93biBiZWNhdXNlIGl0IGlzIG5vdCBwYXJ0IG9mIHRoZSAibG9hZGVkIGtlcm5lbCBpbWFnZSIu
Cj4+Pj4KPj4+PiBUaGlzIG1lYW5zIHRoYXQgdGhlIGNhY2hlIHdpbGwgbmVlZCB0byBiZSBpbnZh
bGlkYXRlZCB0d2ljZSBmb3IgdGhlIEJTUwo+Pj4+IHJlZ2lvbjoKPj4+PiAgICAgICAxKSBCZWZv
cmUgemVyb2luZyB0byByZW1vdmUgYW55IGRpcnR5IGNhY2hlIGxpbmUuIE90aGVyd2lzZSB0aGV5
IG1heQo+Pj4+ICAgICAgIGdldCBldmljdGVkIHdoaWxlIHplcm9pbmcgYW5kIHRoZXJlZm9yZSBv
dmVycmlkaW5nIHRoZSB2YWx1ZS4KPj4+PiAgICAgICAyKSBBZnRlciB6ZXJvaW5nIHRvIHJlbW92
ZSBhbnkgY2FjaGUgbGluZSB0aGF0IG1heSBoYXZlIGJlZW4KPj4+PiAgICAgICBzcGVjdWxhdGVk
LiBPdGhlcndpc2Ugd2hlbiB0dXJuaW5nIG9uIE1NVSBhbmQgRC1DYWNoZSwgdGhlIENQVSBtYXkK
Pj4+PiAgICAgICBzZWUgb2xkIHZhbHVlcy4KPj4+Pgo+Pj4+IEhvd2V2ZXIsIHRoZSBvbmx5IHJl
YXNvbiB0byBoYXZlIHRoZSBCU1MgemVyb2VkIGVhcmx5IGlzIGJlY2F1c2UgdGhlCj4+Pj4gYm9v
dCBwYWdlIHRhYmxlcyBhcmUgcGFydCBvZiBCU1MuIFRvIGF2b2lkIHRoZSB0d28gY2FjaGUgaW52
YWxpZGF0aW9ucywKPj4+PiBpdCBpcyBwb3NzaWJsZSB0byBtb3ZlIHRoZSBwYWdlIHRhYmxlcyBp
biB0aGUgc2VjdGlvbiAuZGF0YS5wYWdlX2FsaWduZWQuCj4+Pgo+Pj4gSSBhbSBub3QgZm9sbG93
aW5nIHRoZSBsYXN0IHBhcnQuIEhvdyBpcyBtb3ZpbmcgdGhlIGJvb3QgcGFnZSB0YWJsZXMgdG8K
Pj4+IC5kYXRhLnBhZ2VfYWxpZ25lZCBzb2x2aW5nIHRoZSBwcm9ibGVtPyBEbyB3ZSBuZWVkIHRv
IHplcm8KPj4+IC5kYXRhLnBhZ2VfYWxpZ25lZCBlYXJseSBvciBjYW4gd2Ugc2tpcCBpdCBiZWNh
dXNlIGl0IGlzIGd1YXJhbnRlZWQgdG8KPj4+IGFscmVhZHkgYmUgemVybz8KPj4KPj4gR2xvYmFs
IHZhcmlhYmxlcyBhcmUgaW5pdGlhbGl6ZWQgdG8gemVybyBieSBkZWZhdWx0IHJlZ2FyZGxlc3Mg
dGhlIHNlY3Rpb24KPj4gdGhleSByZXNpZGUuIFVzdWFsbHkgdGhleSBhcmUgc3RvcmVkIGluIEJT
UyBiZWNhdXNlIGl0IHNhdmVzIHNwYWNlIGluIHRoZQo+PiBiaW5hcnkuCj4+Cj4+IFdpdGggdGhl
IEltYWdlIHByb3RvY29sLCBCU1MgaXMgbm90IGluaXRpYWxpemVkIGJ5IHRoZSBib290bG9hZGVy
IHNvIHdlIGhhdmUKPj4gdG8gZG8gb3Vyc2VsZi4KPj4KPj4gVGhlIHNlY3Rpb24gLmRhdGEucGFn
ZV9hbGlnbmVkIGlzIGFsd2F5cyBwYXJ0IG9mIHRoZSBiaW5hcnkuIFNvIHRoZSBjb21waWxlcgo+
PiB3aWxsIHdyaXRlIHplcm8gaW4gdGhlIGJpbmFyeSBmb3IgYW55IGdsb2JhbCB2YXJpYWJsZXMg
cGFydCBvZiB0aGF0IHNlY3Rpb24KPj4gYW5kIHRoZXJlZm9yZSB0aGUgY29ycmVzcG9uZGluZyBt
ZW1vcnkgd2lsbCBiZSB6ZXJvZWQgd2hlbiBsb2FkaW5nIHRoZSBiaW5hcnkuCj4+Cj4+IElmIGl0
IG1ha2VzIHNlbnNlLCBJIGNhbiB0cnkgdG8gaW5jb3Jwb3JhdGUgdGhhdCBpbiB0aGUgY29tbWl0
IG1lc3NhZ2UuCj4gCj4gU28gYmFzaWNhbGx5IGl0IGlzIHJlYWxseSBvbmx5IEJTUyB0aGUgcHJv
YmxlbS4gQWxsIHJpZ2h0LCBsb29rcyBnb29kIHRvCj4gbWUuCgpZZXMgdGhhdCdzIGNvcnJlY3Qu
Cgo+IAo+IEFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+CgpUaGFuayB5b3UhCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
