Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D49350CA
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 22:21:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYFsn-0000V6-Rl; Tue, 04 Jun 2019 20:18:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0KbE=UD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYFsm-0000V1-Dk
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 20:18:08 +0000
X-Inumbo-ID: dd5e8b02-8705-11e9-841c-43ce8679c838
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id dd5e8b02-8705-11e9-841c-43ce8679c838;
 Tue, 04 Jun 2019 20:18:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A52F5374;
 Tue,  4 Jun 2019 13:18:06 -0700 (PDT)
Received: from [10.37.8.2] (unknown [10.37.8.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8626A3F690;
 Tue,  4 Jun 2019 13:18:05 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-20-julien.grall@arm.com>
 <alpine.DEB.2.21.1906041055180.14041@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7ca0ad84-1f84-96f4-40e2-1b911eadd2bb@arm.com>
Date: Tue, 4 Jun 2019 21:18:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906041055180.14041@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 19/19] xen/arm: Pair call
 to set_fixmap with call to clear_fixmap in copy_from_paddr
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
Cc: xen-devel@lists.xenproject.org, Andrii Anisov <Andrii_Anisov@epam.com>,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA2LzQvMTkgNjo1OSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIFR1ZSwg
MTQgTWF5IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gQXQgdGhlIG1vbWVudCwgc2V0X2Zp
eG1hcCBtYXkgcmVwbGFjZSBhIHZhbGlkIGVudHJ5IHdpdGhvdXQgZm9sbG93aW5nCj4+IHRoZSBi
cmVhay1iZWZvcmUtbWFrZSBzZXF1ZW5jZS4gVGhpcyBtYXkgcmVzdWx0IHRvIFRMQiBjb25mbGlj
dCBhYm9ydC4KPj4KPj4gUmF0aGVyIHRoYW4gZGVhbGluZyB3aXRoIEJyZWFrLUJlZm9yZS1NYWtl
IGluIHNldF9maXhtYXAsIGV2ZXJ5IGNhbGwgdG8KPj4gc2V0X2ZpeG1hcCBpcyBwYWlyZWQgd2l0
aCBhIGNhbGwgdG8gY2xlYXJfZml4bWFwLgo+IAo+IEl0IGlzIG5vdCBldmVyeSBjYWxsIHRvIHNl
dF9maXhtYXA6IGl0IGlzIGV2ZXJ5IGNhbGwgdG8KPiBzZXRfZml4bWFwKEZJWE1BUF9NSVNDLCAu
Li4KCkkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzIHJlcXVlc3QuLi4gVGhlIHRpdGxlIGV4cGxpY2l0
IG1lbnRpb24gCiJjb3B5X2Zyb21fcGFkZHIiIGFuZCBmaXhtYXAgaXMgb25seSBjYWxsZWQgd2l0
aCBGSVhNQVBfTUlTQy4KClNvIHdoeSBzaG91bGQgSSBuZWVkIHRvIHNwZWNpZnkgdGhlIGFyZ3Vt
ZW50PwoKPiAKPiBQbGVhc2UgY2xhcmlmeSwgdGhlbiB5b3UgY2FuIGFkZAo+IAo+IFJldmlld2Vk
LWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
