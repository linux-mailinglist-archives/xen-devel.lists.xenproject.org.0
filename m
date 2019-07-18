Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 210FC6CF9E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 16:23:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho7HE-0006AO-Oc; Thu, 18 Jul 2019 14:20:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b8c6=VP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ho7HD-0006AI-6l
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 14:20:55 +0000
X-Inumbo-ID: 402161b4-a967-11e9-ba9c-377328a2024f
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 402161b4-a967-11e9-ba9c-377328a2024f;
 Thu, 18 Jul 2019 14:20:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24983344;
 Thu, 18 Jul 2019 07:20:53 -0700 (PDT)
Received: from [10.37.10.69] (unknown [10.37.10.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDB043F71F;
 Thu, 18 Jul 2019 07:20:51 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <1563456140-12180-1-git-send-email-andrii.anisov@gmail.com>
 <c6f154b8-34a5-9b23-6761-1a10680dc486@citrix.com>
 <401358d0-38d3-a881-e020-01934f18b193@citrix.com>
 <e61ddba2-f6b9-b452-c22e-361bc3b8afed@arm.com>
 <40da96a0-1da9-0705-b1ea-58737f05be8f@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b3c46ea8-2201-fe21-f1a3-23334dbf3da8@arm.com>
Date: Thu, 18 Jul 2019 15:20:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <40da96a0-1da9-0705-b1ea-58737f05be8f@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] arm:cpuerrata: Align a virtual address
 before unmap
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8xOC8xOSAzOjA4IFBNLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGllbiwK
CkhpLAoKPiBPbiAxOC4wNy4xOSAxNjo0NCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gTXkgc3Vn
Z2VzdGlvbiBhYm91dCB2dW5tYXAoKSBzdGlsbCBzdGFuZHMgdGhvdWdoLgo+Pgo+PiArMSBmb3Ig
dGhlIHZ1bm1hcCBzb2x1dGlvbi4KPiAKPiBJdCB3YXMgbXkgaW5pdGlhbCBpZGVhLgo+IAo+IEJ1
dCwgdGhlIGlzc3VlIGlzIGludHJvZHVjZWQgYnkgY2hhbmdlIDljYzA2MTguIEluIHBhcnRpY3Vs
YXIsIGJ5IHRoZSAKPiBjaGVjayBpbiBgeGVuX3B0X3VwZGF0ZSgpYAo+IAo+ICDCoMKgwqAgaWYg
KCAhSVNfQUxJR05FRCh2aXJ0LCBQQUdFX1NJWkUpICkKPiAgwqDCoMKgIHsKPiAgwqDCoMKgwqDC
oMKgwqAgbW1fcHJpbnRrKCJUaGUgdmlydHVhbCBhZGRyZXNzIGlzIG5vdCBhbGlnbmVkIHRvIHRo
ZSAKPiBwYWdlLXNpemUuXG4iKTsKPiAgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4g
IMKgwqDCoCB9Cj4gCj4gU28gSSBhc3N1bWVkIHlvdSBoYWQgc29tZSBzcGVjaWZpYyBpZGVhIGFi
b3V0IHRoYXQgY2hlY2suCgpJIGFtIGV4cGVjdGluZyBhbGwgdGhlIGNhbGxlcnMgdG8gcHJvcGVy
bHkgYWxpZ24gdGhlIGFkZHJlc3MuCgo+IAo+IEknZCBmaXggYHhlbl9wdF91cGRhdGUoKWAgaWYg
eW91IGFyZSBvayB3aXRoIGl0LgoKUGxlYXNlIG5vLiBUaGUgaW50ZXJmYWNlcyBhcmUgYWxyZWFk
eSBwcmV0dHkgaG9ycmlibGUgYXMgaXQgbWl4aW5nIAphZGRyZXNzIGFuZCBmcmFtZS4gU28gdGhp
cyBjaGVjayBoZXJlIGlzIHBhcnRpYWxseSBjbG9zaW5nIHRoZSBnYXAgb2YgCnBhc3NpbmcgbWlz
YWxpZ25lZCB2aXJ0dWFsIGFkZHJlc3MuCgpJZiB5b3UgbG9vayBhdCB0aGUgeDg2IGNvdW50ZXIt
cGFydCwgdGhleSBhbHNvIGFzc3VtZSB0aGUgYWRkcmVzcyBpcyAKYWxpZ25lZCAoc2VlIEFTU0VS
VCBpbiBzb21lIG9mIHRoZSBoZWxwZXJzKS4gU28gSSB0aGluayB0aGUgcHJvcGVyIHdheSAKdG8g
Z28gaXMgYWxpZ25pbmcgdGhlIGFkZHJlc3MgaW4gdnVtYXAuCgpBcyBBbmRyZXcgcG9pbnRlZCBv
dXQsIHRoaXMgYWxzbyBtYWtlcyB0aGUgaW50ZXJmYWNlIG1vcmUgY29uc2lzdGVudCAKd2l0aCBo
b3cgeyx1bn1tYXBfZG9tYWluX3BhZ2UoKSBjdXJyZW50bHkgd29ya3MuCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
