Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9087132E7
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 19:09:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMbdt-00017D-9g; Fri, 03 May 2019 17:06:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vigr=TD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hMbds-000178-7i
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 17:06:36 +0000
X-Inumbo-ID: ce81339a-6dc5-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ce81339a-6dc5-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 17:06:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07D8F15A2;
 Fri,  3 May 2019 10:06:35 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 104863F557;
 Fri,  3 May 2019 10:06:33 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-14-julien.grall@arm.com>
 <3d3d4a09-4935-4a83-0e3d-7b987dfc9fcf@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <291f238e-16e8-a5d7-c0a5-5532fde69585@arm.com>
Date: Fri, 3 May 2019 18:06:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3d3d4a09-4935-4a83-0e3d-7b987dfc9fcf@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 13/20] xen/arm32: mm: Avoid to zero and
 clean cache for CPU0 domheap
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMy8wNS8yMDE5IDE2OjU3LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKCkhpLAoKPiAKPiBPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBU
aGUgcGFnZS10YWJsZSB3YWxrZXIgaXMgY29uZmlndXJlZCB0byB1c2UgdGhlIHNhbWUgc2hhcmVh
YmlsaXR5IGFuZAo+PiBjYWNoZWFiaWxpdHkgYXMgdGhlIGFjY2VzcyBwZXJmb3JtZWQgd2hlbiB1
cGRhdGluZyB0aGUgcGFnZS10YWJsZXMuIFRoaXMKPj4gbWVhbnMgY2xlYW5pbmcgdGhlIGNhY2hl
IGZvciBDUFUwIGRvbWhlYXAgaXMgdW5uZWNlc3NhcnkuCj4+Cj4+IEZ1cnRoZXJtb3JlLCBDUFUw
IHBhZ2UtdGFibGVzIGFyZSBwYXJ0IG9mIFhlbiBiaW5hcnkgYW5kIHdpbGwgYWxyZWFkeSBiZQo+
PiB6ZXJvZWQgYmVmb3JlaGFuZC4KPiAKPiBJTU8gaXQgaXMgYSBiaXQgY29uZnVzaW5nLgo+IEFz
IEkgdW5kZXJzdGFuZCwgYGNwdTBfZG9tbWFwYCByZXNpZGVzIGluIEJTUyB3aGljaCBpcyBub3Qg
YSBwYXJ0IG9mIHRoZSBiaW5hcnkgCj4gdW5saWtlIGluaXRpYWxpemVkIGRhdGEuIFlldCBpdCBp
cyB1bmNvbmRpdGlvbmFsbHkgY2xlYXJlZCBkdXJpbmcgdGhlIGJvb3Qgb24gCj4gQVJNMzIuCgpJ
biBDLCB1bmluaXRpYWxpemVkIGdsb2JhbCB2YXJpYWJsZSB3aWxsIGJlIHplcm8gYnkgZGVmYXVs
dC4gSXQgaXMgYSBiaXQgb2YgCndhc3RlIHRvIGFsbG9jYXRlIHNwYWNlIGluIHRoZSBiaW5hcnkg
Zm9yIHRoZW0uIFNvIHRoZSBjb21waWxlciB3aWxsIGNvbW1vbmx5IApwdXQgdGhlbSBpbiBhIHNl
Y3Rpb24gQlNTIHRoYXQgYXJlIGdvaW5nIHRvIGJlIHplcm9lZCB3aGVuIGF0IGxhdW5jaC4KCk9u
IEFybTMyLCB0aGlzIGlzIGFsd2F5cyBkb25lIGluIENQVTAgYXQgZWFybHkgYm9vdC4gRm9yIEFy
bTY0LCBVRUZJIHdpbGwgZG8gaXQgCmZvciB1cywgc28gd2UgZG9uJ3Qgd2FudCB0byBkbyBpdCB3
aGVuIHVzaW5nIFVFRkkgYXMgd2UgbWF5IG92ZXJyaWRlIGdsb2JhbAoKVGhlIHJlYXNvbiBJIGNo
b3NlIHRvIHNheSAid2lsbCBhbHdheXMgYmUgemVyb2VkIGJlZm9yZWhhbmQiIHRoYW4gc3BlY2lm
aWNhbGx5IAptZW50aW9uICJCU1MiIGlzIEkgd2Fzbid0IGVudGlyZWx5IGNvbnZpbmNlZCB0aGUg
Y29tcGlsZXIgd2lsbCBhbHdheXMgcHV0IGluIEJTUy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
