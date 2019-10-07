Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA8ACE070
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 13:29:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHR9G-00043V-Ja; Mon, 07 Oct 2019 11:25:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=d412=YA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iHR9F-00043M-6S
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 11:25:53 +0000
X-Inumbo-ID: 37ab83d4-e8f5-11e9-8c93-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37ab83d4-e8f5-11e9-8c93-bc764e2007e4;
 Mon, 07 Oct 2019 11:25:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 92FFCAFDF;
 Mon,  7 Oct 2019 11:25:50 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <ba0fd598-9102-e765-e7f5-61e91d47b124@suse.com>
 <dc7d25e5-11f8-b6c3-7137-ceb0814e836a@suse.com>
 <c694e8f7-fd64-f2be-fadb-edc1478d07ae@citrix.com>
 <44d87efa-36af-7c06-6530-a1691ab55a83@suse.com>
 <f7f47cb5-a08b-ca08-93df-73427d94b847@citrix.com>
 <ee24c8e1-c925-f78e-1d51-d0d1f03f7326@suse.com>
 <f0c08d79-fad2-4760-6e18-99bfe84509e2@suse.com>
 <19607600-ebcd-2700-abce-19f53c503633@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <885c81a6-8215-b18c-73aa-35b1a780f060@suse.com>
Date: Mon, 7 Oct 2019 13:25:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <19607600-ebcd-2700-abce-19f53c503633@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 1/3] AMD/IOMMU: allocate one device table
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMTAuMTkgMTI6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA3LjEwLjIwMTkgMTI6
MTksIErDvHJnZW4gR3Jvw58gIHdyb3RlOgo+PiBPbiAwNy4xMC4xOSAxMjowMywgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4+PiBJIGFwcHJlY2lhdGUgdGhlIGFjaywgYnV0IEkgdGhpbmsgSSdkIHByZWZl
ciB0byBub3QgbWFrZSB1c2Ugb2YgaXQKPj4+IGlmIGF0IGFsbCBwb3NzaWJsZSB1bmRlciB0aGVz
ZSBjb25kaXRpb25zLiBJbnN0ZWFkIEknZCBsaWtlIHVzIHRvCj4+PiByZWFjaCBzb21lIGNvbW1v
biBncm91bmQgaGVyZS4gU2VlaW5nIHRoYXQgd2UncmUgcGFzdCB0aGUgZGVhZGxpbmUKPj4+IGFs
cmVhZHksIErDvHJnZW4ncyByZWxlYXNlIGFjayB3aWxsIG5vdyBiZSBuZWVkZWQgYW55d2F5LiBK
w7xyZ2VuIC0KPj4+IHdvdWxkIHlvdSBiZSBmaW5lIHdpdGggc2V0dGxpbmcgb24gdGhpcyB0YWtp
bmcgYSBmZXcgbW9yZSBkYXlzLAo+Pj4gYW5kIHRoZW4gc3RpbGwgYWxsb3cgaW4gdGhpcyBzZXJp
ZXM/IE9yIGlzIHRyeWluZyB0byBzb29uIGZpbmQgYQo+Pj4gcmVzb2x1dGlvbiBoZXJlIHBvaW50
bGVzcyBhcyB5b3UnZCByYXRoZXIgbm90IHNlZSB0aGlzIGdvIGluCj4+PiBhbnltb3JlPwo+Pgo+
PiBBcyBpdCBpc24ndCBhIGNvbXBsZXRlbHkgdHJpdmlhbCBwYXRjaCBzZXJpZXMgSSdkIGxpa2Ug
dG8ga25vdyB3aGF0Cj4+IHRoZSBnYWluIHdvdWxkIGJlOiBpcyBpdCBqdXN0IGEgIm5pY2UgdG8g
aGF2ZSIsIGRvZXMgaXQgc29sdmUgYQo+PiB0aGVvcmV0aWNhbCAobm90IHRvIGJlIGV4cGVjdGVk
KSBwcm9ibGVtLCBvciBkbyB5b3UgdGhpbmsgaXQgd2lsbAo+PiBiZSBuZWVkZWQgdG8gYmUgYmFj
a3BvcnRlZCBpZiBJIHNheSAibm8iPwo+IAo+IFRoZSAzcmQgcGF0Y2ggaW4gdGhpcyBzZXJpZXMg
aXMgd2hhdCBpcyByZWFsbHkgd2FudGVkLCB0byBjbG9zZQo+IGEgcHJldmlvdXNseSBqdXN0IHRo
ZW9yZXRpY2FsIGJ1dCAoSSB0aGluaykgbm93IGluIHByaW5jaXBsZQo+IHBvc3NpYmxlIGdhcCB3
aXRoIGRldmljZSB0YWJsZSBpbml0aWFsaXphdGlvbiwgcG90ZW50aWFsbHkKPiBhbGxvd2luZyB1
bnRyYW5zbGF0ZWQgRE1BIG9yIGludGVycnVwdCByZXF1ZXN0cyB0byBtYWtlIGl0Cj4gdGhyb3Vn
aCB3aGVuIG5vdCBzbyBpbnRlbmRlZC4gSWYgdGhpcyB3YXMgdG8gYmUgYmFja3BvcnRlZCwgSQo+
IHRoaW5rIEknZCB0cnkgcmUtYmFzaW5nIHBhdGNoZXMgMiBhbmQgMyBvbnRvIGEgdHJlZSB3aXRo
b3V0Cj4gcGF0Y2ggMSwgYnV0IGRvaW5nIHNvIGZvciBtYXN0ZXIgZG9lc24ndCBsb29rICh0byBt
ZSkgdG8gYmUgYQo+IHZlcnkgcmVhc29uYWJsZSBzdGVwLCBzZWVpbmcgdGhhdCBwYXRjaCAxIGhh
ZCBiZWVuIHRoZXJlIGZpcnN0LgoKT2theSwgdGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24uCgpO
ZWVkaW5nIHNvbWUgbW9yZSBkYXlzIGlzIGZpbmUgZm9yIG1lLCBzbyB0cnlpbmcgdG8gZmluZCBh
IHNvbHV0aW9uIHNvb24KYWJzb2x1dGVseSBtYWtlcyBzZW5zZS4gOi0pCgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
