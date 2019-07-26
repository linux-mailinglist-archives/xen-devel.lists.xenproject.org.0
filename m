Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F7F763E5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 12:52:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqxmZ-0008Bj-P6; Fri, 26 Jul 2019 10:49:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ymAH=VX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hqxmY-0008Be-E0
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 10:49:02 +0000
X-Inumbo-ID: f98f4f4a-af92-11e9-a156-07b5254ab753
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f98f4f4a-af92-11e9-a156-07b5254ab753;
 Fri, 26 Jul 2019 10:48:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 738F8344;
 Fri, 26 Jul 2019 03:48:59 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFC923F71A;
 Fri, 26 Jul 2019 03:48:58 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
Date: Fri, 26 Jul 2019 11:48:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNi8wNy8yMDE5IDExOjM3LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEZyb206IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gVGhpcyBtYWtlcyBmdW5jdGlv
biBlbnRlcl9oeXBlcnZpc29yX2hlYWQoKSBiZWluZyBleGVjdXRlZCB3aXRoCj4gaXJxcyBsb2Nr
ZWQuCgpUaGlzIGlzIHRoZSAzcmQgdGltZSB5b3Ugc2VuZCB0aGlzIHBhdGNoLi4uIGFuZCBzdGls
bCBubyBwcm9wZXIgZXhwbGFuYXRpb24gd2h5IAp0aGlzIGlzIGRvbmUgbm9yIHRoZSBpbXBhY3Qg
b24ga2VlcGluZyB0aGUgaW50ZXJydXB0cyBkaXNhYmxlZCBsb25nZXIgdGhhbiAKbmVjZXNzYXJ5
LgoKUmVzZW5kaW5nIHRoZSBwYXRjaCB3aXRob3V0IHRoaW5ncyBhZGRyZXNzZWQgaXMgb25seSBn
b2luZyB0byBtYWtlIGl0IHdvcnN0LiBJZiAKeW91IGhhdmUgYW55IGRvdWJ0IG9mIHdoYXQgSSBh
bSBhc2tpbmcgdGhlbiBhc2suCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
