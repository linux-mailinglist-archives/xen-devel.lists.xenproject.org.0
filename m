Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9334D3BD5E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 22:14:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQdf-0004PU-Ex; Mon, 10 Jun 2019 20:11:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haQdd-0004PA-IB
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 20:11:29 +0000
X-Inumbo-ID: ecc895d2-8bbb-11e9-97a2-cf513414a856
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ecc895d2-8bbb-11e9-97a2-cf513414a856;
 Mon, 10 Jun 2019 20:11:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C73CE344;
 Mon, 10 Jun 2019 13:11:25 -0700 (PDT)
Received: from [10.37.10.2] (unknown [10.37.10.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECD4A3F73C;
 Mon, 10 Jun 2019 13:11:24 -0700 (PDT)
To: Baodong Chen <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
References: <1560143748-11027-1-git-send-email-chenbaodong@mxnavi.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c7476978-3c46-05b3-db0e-c7ac28c344d9@arm.com>
Date: Mon, 10 Jun 2019 21:11:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1560143748-11027-1-git-send-email-chenbaodong@mxnavi.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: domain: remove redundant memset
 for arch's saved_context when creating vcpu
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

SGksCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4gVGhlIHRpdGxlIHNob3VsZCBiZSBhdCBtYXgg
ODAgY2hhcmFjdGVycy4gU28gCmhvdyBhYm91dCB0aGUgZm9sbG93aW5nIHRpdGxlPwoKInhlbi9h
cm06IGRvbWFpbjogUmVtb3ZlIHJlZHVuZGFudCBtZW1zZXQgZm9yIHYtPmFyY2guc2F2ZWRfY29u
dGV4dCIKCk9uIDYvMTAvMTkgNjoxNSBBTSwgQmFvZG9uZyBDaGVuIHdyb3RlOgo+IEFscmVhZHkg
ZG9uZSBieSBjbGVhcl9wYWdlKCkgaW4gYWxsb2NfdmNwdV9zdHJ1Y3QoKQoKUGxlYXNlIHRyeSB0
byBtYWtlIHNlbnRlbmNlIGluIHRoZSBjb21taXQgbWVzc2FnZS4gRm9yIGhlcmUgSSB3b3VsZCBz
dWdnZXN0OgoKInYtPmFyY2guc2F2ZWRfY29udGV4dCBpcyBhbHJlYWR5IHplcm9lZCBpbiBhbGxv
Y192Y3B1X3N0cnVjdCgpIGJ5IApjbGVhcl9wYWdlKCkuIFNvIHRoZXJlIGFyZSBubyBuZWVkIHRv
IG1lbXNldCBpdCBhZ2FpbiBpbiAKYXJjaF92Y3B1X2NyZWF0ZSgpLiIKCklmIHlvdSBhcmUgaGFw
cHkgd2l0aCB0aGUgdHdvIGNoYW5nZXMsIEkgY2FuIGRvIHRoZW0gb24gY29tbWl0LgoKQ2hlZXJz
LAoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBCYW9kb25nIENoZW4gPGNoZW5iYW9kb25nQG14bmF2aS5j
b20+Cj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0vZG9tYWluLmMgfCAxIC0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW4u
YyBiL3hlbi9hcmNoL2FybS9kb21haW4uYwo+IGluZGV4IGZmMzMwYjMuLmFkMWIxMDYgMTAwNjQ0
Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFp
bi5jCj4gQEAgLTU1Nyw3ICs1NTcsNiBAQCBpbnQgYXJjaF92Y3B1X2NyZWF0ZShzdHJ1Y3QgdmNw
dSAqdikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIHNp
emVvZihzdHJ1Y3QgY3B1X2luZm8pKTsKPiAgICAgICBtZW1zZXQodi0+YXJjaC5jcHVfaW5mbywg
MCwgc2l6ZW9mKCp2LT5hcmNoLmNwdV9pbmZvKSk7Cj4gICAKPiAtICAgIG1lbXNldCgmdi0+YXJj
aC5zYXZlZF9jb250ZXh0LCAwLCBzaXplb2Yodi0+YXJjaC5zYXZlZF9jb250ZXh0KSk7Cj4gICAg
ICAgdi0+YXJjaC5zYXZlZF9jb250ZXh0LnNwID0gKHJlZ2lzdGVyX3Qpdi0+YXJjaC5jcHVfaW5m
bzsKPiAgICAgICB2LT5hcmNoLnNhdmVkX2NvbnRleHQucGMgPSAocmVnaXN0ZXJfdCljb250aW51
ZV9uZXdfdmNwdTsKPiAgIAo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
