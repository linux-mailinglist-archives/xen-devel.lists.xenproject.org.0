Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BABC207B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 14:17:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEuaj-0006sp-PZ; Mon, 30 Sep 2019 12:15:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I/AJ=XZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iEuai-0006sj-W1
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 12:15:49 +0000
X-Inumbo-ID: 0820efd8-e37c-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 0820efd8-e37c-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 12:15:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 137C81000;
 Mon, 30 Sep 2019 05:15:46 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F70A3F706;
 Mon, 30 Sep 2019 05:15:45 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-5-julien.grall@arm.com> <87r23y3rsa.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a5f00805-54ae-2651-d232-a6f420b75e41@arm.com>
Date: Mon, 30 Sep 2019 13:15:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87r23y3rsa.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 04/10] xen/arm: Ensure the SSBD
 workaround is re-enabled right after exiting a guest
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAzMC8wOS8yMDE5IDEzOjE0LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiAKPiBIaSBK
dWxpZW4sCj4gCj4gSnVsaWVuIEdyYWxsIHdyaXRlczoKPiAKPj4gQXQgdGhlIG1vbWVudCwgU1NC
RCB3b3JrYXJvdW5kIGlzIHJlLWVuYWJsZWQgZm9yIFhlbiBhZnRlciBpbnRlcnJ1cHRzCj4+IGFy
ZSB1bm1hc2tlZC4gVGhpcyBtZWFucyB3ZSBtYXkgZW5kIHVwIHRvIGV4ZWN1dGUgc29tZSBwYXJ0
IG9mIHRoZQo+PiBoeXBlcnZpc29yIGlmIGFuIGludGVycnVwdCBpcyByZWNlaXZlZCBiZWZvcmUg
dGhlIHdvcmthcm91bmQgaXMKPj4gcmUtZW5hYmxlZC4KPj4KPj4gQXMgdGhlIHJlc3Qgb2YgZW50
ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0KCkgZG9lcyBub3QgcmVxdWlyZSB0byBoYXZlCj4+IGlu
dGVycnVwdHMgbWFza2VkLCB0aGUgZnVuY3Rpb24gaXMgbm93IHNwbGl0IGluIHR3byBwYXJ0czoK
Pj4gICAgICAxKSBlbnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3Rfbm9pcnEoKSBjYWxsZWQgd2l0
aCBpbnRlcnJ1cHRzCj4+ICAgICAgICAgbWFza2VkLgo+IAo+IFRvIHN1bW1hcml6ZSBvdXIgZGlz
Y3Vzc2lvbiBpbiB0aGlzIG1haWwgdGhyZWFkOiBwcm92aWRpbmcgdGhhdCB5b3UnbGwKPiByZW5h
bWUgZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0X25vaXJxIHRvCj4gZW50ZXJfaHlwZXJ2aXNv
cl9mcm9tX2d1ZXN0X3ByZWlycSgpOgo+IAo+IFJldmlld2VkLWJ5OiBWb2xvZHlteXIgQmFiY2h1
ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+CgpUaGFuayB5b3UuIEkgd2lsbCB0cnkgdG8g
c3VtbWFyaXplIHRoZSBkaXNjdXNzaW9uIHdlIGhhZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIApT
byB3ZSBrbm93IHRoZSByYXRpb25hbGUgb2YgdGhlIHNwbGl0IGhlcmUuCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
