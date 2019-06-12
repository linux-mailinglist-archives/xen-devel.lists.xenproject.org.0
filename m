Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3C742586
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 14:23:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb2Fe-0004hA-B0; Wed, 12 Jun 2019 12:21:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uepN=UL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hb2Fc-0004gt-8y
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 12:21:12 +0000
X-Inumbo-ID: 8da7b77a-8d0c-11e9-b167-8f3409d1b52e
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8da7b77a-8d0c-11e9-b167-8f3409d1b52e;
 Wed, 12 Jun 2019 12:21:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 961F528;
 Wed, 12 Jun 2019 05:21:06 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3C9A3F246;
 Wed, 12 Jun 2019 05:22:48 -0700 (PDT)
To: chenbaodong <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
References: <a7c44d926cbe4a0e6447c4aaf8d9862e@sslemail.net>
 <af3fe48d-afaa-3184-e142-9a1e2b8574f4@arm.com>
 <2ed30cde-e2ab-745e-94f5-0cf6155c9122@mxnavi.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7c645dfb-72f5-5fc2-b559-0a4d09ba8801@arm.com>
Date: Wed, 12 Jun 2019 13:21:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2ed30cde-e2ab-745e-94f5-0cf6155c9122@mxnavi.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: io: add function
 swap_mmio_handler()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMi8wNi8yMDE5IDExOjA4LCBjaGVuYmFvZG9uZyB3cm90ZToKPiAKPiBPbiA2LzEy
LzE5IDE3OjA4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiA2LzEyLzE5IDY6
NDIgQU0sIEJhb2RvbmcgQ2hlbiB3cm90ZToKPj4+IFN3YXAgZnVuY3Rpb24gY2FuIGJlIHVzZWQg
d2hlbiBjYWxsaW5nIHNvcnQoKS4KPj4+IG9yIGVsc2UsIHRoZSBkZWZhdWx0IHN3YXAgZnVuY3Rp
b24gZ2VuZXJpY19zd2FwKCkgaXMgdXNlZCwKPj4+IHdoaWNoIGlzIGEgbGl0dGxlIGluZWZmaWNp
ZW50Lgo+Pgo+PiBJIGFtIG5vdCBlbnRpcmVseSBjb252aW5jZSB0aGlzIHdpbGwgYmUgbW9yZSBl
ZmZpY2llbnQuIG1taW9faGFuZGxlciBkb2VzIG5vdCAKPj4gZml0IGluIDY0IGJpdCwgc28gdGhl
IGNvbXBpbGVyIG1heSBkZWNpZGUgdG8gZG8gZWl0aGVyIG11bHRpcGxlIGxvYWQgb3IgCj4+IHJl
cGxhY2Ugd2l0aCBhIG1lbWNweS4KPiAKPiBIZWxsbyBKdWxpZW4sCj4gCj4gSSBoYXZlIGNoZWNr
ZWQgdGhlIGRpc2Fzc2VtYmxlIHJlc3VsdCwKPiAKPiBhbmQgSUlVQyBnZW5lcmljX3N3YXAgaGFz
IGEgbG9vcCBzbyBpdCBzaG91bGQgYmUgYSBsaXR0bGUgaW5lZmZpY2llbnQuIEknbSBub3QgCj4g
ZXhwZXJ0IGFib3V0IGhhcmR3YXJlLCBwbGVhc2UgY29ycmVjdCBtZSBpZiBpJ20gd3JvbmcuCgpJ
IGFtIG5vdCBhbiBoYXJkd2FyZSBleHBlcnQgdG9vLi4uIEJ1dCBhcyBJIHBvaW50ZWQgb3V0IGJl
bG93IHRoaXMgaXMgYSAKbWljcm8tb3B0aW1pemF0aW9uLiBJbiBvdGhlciB3b3JkcywgeW91IGFy
ZSB0YWlsb3JpbmcgYSBzcGVjaWZpYyBmdW5jdGlvbiB0aGF0IAptYXkgcnVuIGZhc3RlciBub3cs
IGJ1dCB0aGlzIGlzIGltcHJvdmVtZW50IGlzIGdvaW5nIHRvIGJlIGxvc3QgYXMgdGhpcyBpcyBq
dXN0IAphIHZlcnkgdGlueSBwYXJ0IG9mIHRoZSBkb21haW4gY3JlYXRpb24uCgpbLi4uXQoKPj4K
Pj4gU28gYXQgYmVzdCB0aGlzIGZlZWxzIHNvbWUgbWljcm8tb3B0aW1pemF0aW9uLiBCdXQgdGhl
biwgdGhpcyBpcyBvbmx5IGNhbGwgYSAKPj4gbGltaXRlZCBudW1iZXIgb2YgdGltZSBhdCBlYWNo
IGRvbWFpbiBidWlsZC4gSXMgaXQgcmVhbGx5IHdvcnRoIGl0Pwo+IAo+IEl0J3Mgbm90IGhvdCBw
YXRoIGhlcmUuCj4gCj4gTm90IHN1cmUgYWJvdXQgd29ydGguCj4gCj4gUGVyc29uYWxsecKgIGkg
d2lsbCB0cnkgbXkgYmVzdCB0byBkbyB0aGluZ3Mgd2VsbCBhY2NvcmRpbmcgdG8gbXkgdW5kZXJz
dGFuZGluZy4KCk1pY3JvLW9wdGltaXphdGlvbiBhcmUgYWx3YXlzIGdvb2QsIGJ1dCB5b3UgYWxz
byBoYXZlIHRvIGZhY3RvciB0aGUgY29zdCBvZiAKbWFpbnRhaW5pbmcgYW5kIHdoZXRoZXIgdGhp
cyB3aWxsIGltcHJvdmUgc2lnbmlmaWNhbnRseSBYZW4uCgo+IAo+Pgo+PiBPbiBhIHNpZGUgbm90
ZSwgSSBoYXZlIG5vdGljZWQgeW91IGFyZSBzZW5kaW5nIGEgbG90IG9mIG9wdGltaXphdGlvbi9j
bGVhbi11cCAKPj4gcGF0Y2guIFdoYXQgaXMgeW91ciBlbmQgZ29hbCBoZXJlPwo+IAo+IE15IGdv
YWwgaXMgdG8gdW5kZXJzdGFuZCBob3cgeGVuIHdvcmtzIHdlbGwuCj4gCj4+Cj4+IElmIGl0IGlz
IHRvIGltcHJvdmUgdGhlIHBlcmZvcm1hbmNlLCB0aGVuIHRoZXJlIGFyZSBtdWNoIGJpZ2dlciBm
aXNoIHRvIGZyeSAKPj4gd2l0aGluIFhlbiBjb2RlIGJhc2UuIEkgYW0gaGFwcHkgdG8gcG9pbnQg
c29tZSBvZiB0aGVtIGJhc2VkIG9uIHdoZXJlIHlvdSBhcmUgCj4+IGxvb2tpbmcgdG8gaW1wcm92
ZS4KPiAKPiBTdXJseSBpIHdhbnQgdG8gaW1wcm92ZSBwZXJmb3JtYW5jZS4KPiAKPiBGZWF0dXJl
cyBsaWtlIEZhc3QgU3RhcnR1cCAoIEkgbGVhcm5lZCBmcm9tIHhlbiBzdW1taXQgMjAxOCwgc2Ft
c3VuZyBhdXRvbW90aXZlIAo+IHByZXNlbnRhdGlvbikuCj4gCj4gQnV0IGN1cnJlbnRseSBpIGRv
bid0IHVuZGVyc3RhbmQgeGVuIHdlbGwsIG9ubHkgYSBmZXcgd2Vla3MgZXhwZXJpZW5jZS4KCldl
IGRvIGhhdmUgc21hbGwgdGFzayBmb3IgbmV3Y29tZXJzIHRoYXQgd291bGQgaW1wcm92ZSBYZW4g
Y29kZSBiYXNlIGFuZCBhbHNvIAphbGxvdyB5b3VyIHRvIHVuZGVyc3RhbmQgbW9yZSBzb21lIHBh
cnQgb2YgdGhlIGNvZGUuCgpJZiB5b3UgaGF2ZSBhIHNwZWNpZmljIGFyZWEgb2YgaW50ZXJlc3Qs
IEkgY2FuIHNlZSBpZiBJIGhhdmUgc29tZSBzbWFsbCB0YXNrcyB0aGVyZS4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
