Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE6958610
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 17:39:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgWR8-0005eN-7X; Thu, 27 Jun 2019 15:35:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ga0E=U2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hgWR6-0005dd-4E
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 15:35:44 +0000
X-Inumbo-ID: 382f85de-98f1-11e9-9668-73b155f5190e
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 382f85de-98f1-11e9-9668-73b155f5190e;
 Thu, 27 Jun 2019 15:35:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 50103ABC4;
 Thu, 27 Jun 2019 15:35:40 +0000 (UTC)
To: xen-devel@lists.xenproject.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20190620160821.4210-1-jgross@suse.com>
 <79797c17-58d6-b09c-3aad-73e375a7f208@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <a9b02905-8b4f-48ac-8638-8ff99bd3b0e6@suse.com>
Date: Thu, 27 Jun 2019 17:35:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <79797c17-58d6-b09c-3aad-73e375a7f208@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] mm: fix regression with deferred struct
 page init
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
Cc: rppt@linux.ibm.com, Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 pasha.tatashin@soleen.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDYuMTkgMTA6MjUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gR2VudGxlIHBpbmcuCj4g
Cj4gSSdkIHJlYWxseSBsaWtlIHRvIGhhdmUgdGhhdCBpbiA1LjIgaW4gb3JkZXIgdG8gYXZvaWQg
dGhlIHJlZ3Jlc3Npb24KPiBpbnRyb2R1Y2VkIHdpdGggNS4yLXJjMS4KCkFkZGluZyBzb21lIG1h
aW50YWluZXJzIGRpcmVjdGx5Li4uCgoKSnVlcmdlbgoKPiAKPiAKPiBKdWVyZ2VuCj4gCj4gT24g
MjAuMDYuMTkgMTg6MDgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IENvbW1pdCAwZTU2YWNhZTRi
NGRkNGE5ICgibW06IGluaXRpYWxpemUgTUFYX09SREVSX05SX1BBR0VTIGF0IGEgdGltZQo+PiBp
bnN0ZWFkIG9mIGRvaW5nIGxhcmdlciBzZWN0aW9ucyIpIGlzIGNhdXNpbmcgYSByZWdyZXNzaW9u
IG9uIHNvbWUKPj4gc3lzdGVtcyB3aGVuIHRoZSBrZXJuZWwgaXMgYm9vdGVkIGFzIFhlbiBkb20w
Lgo+Pgo+PiBUaGUgc3lzdGVtIHdpbGwganVzdCBoYW5nIGluIGVhcmx5IGJvb3QuCj4+Cj4+IFJl
YXNvbiBpcyBhbiBlbmRsZXNzIGxvb3AgaW4gZ2V0X3BhZ2VfZnJvbV9mcmVlbGlzdCgpIGluIGNh
c2UgdGhlIGZpcnN0Cj4+IHpvbmUgbG9va2VkIGF0IGhhcyBubyBmcmVlIG1lbW9yeS4gZGVmZXJy
ZWRfZ3Jvd196b25lKCkgaXMgYWx3YXlzCj4+IHJldHVybmluZyB0cnVlIGR1ZSB0byB0aGUgZm9s
bG93aW5nIGNvZGUgc25pcHBsZXQ6Cj4+Cj4+IMKgwqAgLyogSWYgdGhlIHpvbmUgaXMgZW1wdHkg
c29tZWJvZHkgZWxzZSBtYXkgaGF2ZSBjbGVhcmVkIG91dCB0aGUgem9uZSAqLwo+PiDCoMKgIGlm
ICghZGVmZXJyZWRfaW5pdF9tZW1fcGZuX3JhbmdlX2luX3pvbmUoJmksIHpvbmUsICZzcGZuLCAm
ZXBmbiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmlyc3RfZGVmZXJyZWRfcGZu
KSkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwZ2RhdC0+Zmlyc3RfZGVmZXJyZWRfcGZuID0g
VUxPTkdfTUFYOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwZ2RhdF9yZXNpemVfdW5sb2NrKHBn
ZGF0LCAmZmxhZ3MpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4gwqDC
oCB9Cj4+Cj4+IFRoaXMgaW4gdHVybiByZXN1bHRzIGluIHRoZSBsb29wIGFzIGdldF9wYWdlX2Zy
b21fZnJlZWxpc3QoKSBpcwo+PiBhc3N1bWluZyBmb3J3YXJkIHByb2dyZXNzIGNhbiBiZSBtYWRl
IGJ5IGRvaW5nIHNvbWUgbW9yZSBzdHJ1Y3QgcGFnZQo+PiBpbml0aWFsaXphdGlvbi4KPj4KPj4g
Q2M6IEFsZXhhbmRlciBEdXljayA8YWxleGFuZGVyLmguZHV5Y2tAbGludXguaW50ZWwuY29tPgo+
PiBGaXhlczogMGU1NmFjYWU0YjRkZDRhOSAoIm1tOiBpbml0aWFsaXplIE1BWF9PUkRFUl9OUl9Q
QUdFUyBhdCBhIHRpbWUgCj4+IGluc3RlYWQgb2YgZG9pbmcgbGFyZ2VyIHNlY3Rpb25zIikKPj4g
U3VnZ2VzdGVkLWJ5OiBBbGV4YW5kZXIgRHV5Y2sgPGFsZXhhbmRlci5oLmR1eWNrQGxpbnV4Lmlu
dGVsLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pgo+PiAtLS0KPj4gwqAgbW0vcGFnZV9hbGxvYy5jIHwgMyArKy0KPj4gwqAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvbW0v
cGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxvYy5jCj4+IGluZGV4IGQ2NmJjOGFiZTBhZi4uOGUz
YmM5NDllYmNjIDEwMDY0NAo+PiAtLS0gYS9tbS9wYWdlX2FsbG9jLmMKPj4gKysrIGIvbW0vcGFn
ZV9hbGxvYy5jCj4+IEBAIC0xODI2LDcgKzE4MjYsOCBAQCBkZWZlcnJlZF9ncm93X3pvbmUoc3Ry
dWN0IHpvbmUgKnpvbmUsIHVuc2lnbmVkIAo+PiBpbnQgb3JkZXIpCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmlyc3RfZGVmZXJyZWRfcGZu
KSkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcGdkYXQtPmZpcnN0X2RlZmVycmVkX3BmbiA9IFVM
T05HX01BWDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHBnZGF0X3Jlc2l6ZV91bmxvY2socGdkYXQs
ICZmbGFncyk7Cj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4gK8KgwqDCoMKgwqDC
oMKgIC8qIFJldHJ5IG9ubHkgb25jZS4gKi8KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBmaXJz
dF9kZWZlcnJlZF9wZm4gIT0gVUxPTkdfTUFYOwo+PiDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDC
oCAvKgo+Pgo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
