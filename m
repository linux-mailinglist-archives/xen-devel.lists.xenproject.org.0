Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D34421C8D7
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:34:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWb0-0005Vt-En; Tue, 14 May 2019 12:31:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWay-0005U8-LN
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:31:48 +0000
X-Inumbo-ID: 3dba290c-7644-11e9-8b9c-93296919fc85
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3dba290c-7644-11e9-8b9c-93296919fc85;
 Tue, 14 May 2019 12:31:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E11C341;
 Tue, 14 May 2019 05:31:47 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2ACDC3F71E;
 Tue, 14 May 2019 05:31:46 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:31:24 +0100
Message-Id: <20190514123125.29086-12-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514123125.29086-1-julien.grall@arm.com>
References: <20190514123125.29086-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART3 v2 11/12] xen/arm: mm: Don't open-code
 Xen PT update in {set, clear}_fixmap()
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

e3NldCwgY2xlYXJ9X2ZpeG1hcCgpIGFyZSBjdXJyZW50bHkgb3Blbi1jb2RpbmcgdXBkYXRlIHRv
IHRoZSBYZW4KcGFnZS10YWJsZXMuIFRoaXMgY2FuIGJlIGF2b2lkZWQgYnkgdXNpbmcgdGhlIGdl
bmVyaWMgaGVscGVycwptYXBfcGFnZXNfdG9feGVuKCkgYW5kIGRlc3Ryb3lfeGVuX21hcHBpbmdz
KCkuCgpCb3RoIGZ1bmN0aW9uIGFyZSBub3QgbWVhbnQgdG8gZmFpbCBmb3IgZml4bWFwLCBoZW5j
ZSB0aGUgQlVHX09OKCkKY2hlY2tpbmcgdGhlIHJldHVybi4KClNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292
IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAg
IC0gQWRkIEFuZHJpaSdzIHJldmlld2VkLWJ5Ci0tLQogeGVuL2FyY2gvYXJtL21tLmMgfCAxNiAr
KysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21t
LmMKaW5kZXggOWE0MDc1NGY0NC4uMjNjYTYxZThmMCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJt
L21tLmMKKysrIGIveGVuL2FyY2gvYXJtL21tLmMKQEAgLTM0OCwxOSArMzQ4LDE5IEBAIHN0YXRp
YyBpbmxpbmUgbHBhZV90IG1mbl90b194ZW5fZW50cnkobWZuX3QgbWZuLCB1bnNpZ25lZCBhdHRy
KQogLyogTWFwIGEgNGsgcGFnZSBpbiBhIGZpeG1hcCBlbnRyeSAqLwogdm9pZCBzZXRfZml4bWFw
KHVuc2lnbmVkIG1hcCwgbWZuX3QgbWZuLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCiB7Ci0gICAgbHBh
ZV90IHB0ZSA9IG1mbl90b194ZW5fZW50cnkobWZuLCBQQUdFX0FJX01BU0soZmxhZ3MpKTsKLSAg
ICBwdGUucHQudGFibGUgPSAxOyAvKiA0ayBtYXBwaW5ncyBhbHdheXMgaGF2ZSB0aGlzIGJpdCBz
ZXQgKi8KLSAgICBwdGUucHQueG4gPSAxOwotICAgIHdyaXRlX3B0ZSh4ZW5fZml4bWFwICsgdGhp
cmRfdGFibGVfb2Zmc2V0KEZJWE1BUF9BRERSKG1hcCkpLCBwdGUpOwotICAgIGZsdXNoX3hlbl90
bGJfcmFuZ2VfdmEoRklYTUFQX0FERFIobWFwKSwgUEFHRV9TSVpFKTsKKyAgICBpbnQgcmVzOwor
CisgICAgcmVzID0gbWFwX3BhZ2VzX3RvX3hlbihGSVhNQVBfQUREUihtYXApLCBtZm4sIDEsIGZs
YWdzKTsKKyAgICBCVUdfT04ocmVzICE9IDApOwogfQogCiAvKiBSZW1vdmUgYSBtYXBwaW5nIGZy
b20gYSBmaXhtYXAgZW50cnkgKi8KIHZvaWQgY2xlYXJfZml4bWFwKHVuc2lnbmVkIG1hcCkKIHsK
LSAgICBscGFlX3QgcHRlID0gezB9OwotICAgIHdyaXRlX3B0ZSh4ZW5fZml4bWFwICsgdGhpcmRf
dGFibGVfb2Zmc2V0KEZJWE1BUF9BRERSKG1hcCkpLCBwdGUpOwotICAgIGZsdXNoX3hlbl90bGJf
cmFuZ2VfdmEoRklYTUFQX0FERFIobWFwKSwgUEFHRV9TSVpFKTsKKyAgICBpbnQgcmVzOworCisg
ICAgcmVzID0gZGVzdHJveV94ZW5fbWFwcGluZ3MoRklYTUFQX0FERFIobWFwKSwgRklYTUFQX0FE
RFIobWFwKSArIFBBR0VfU0laRSk7CisgICAgQlVHX09OKHJlcyAhPSAwKTsKIH0KIAogLyogQ3Jl
YXRlIFhlbidzIG1hcHBpbmdzIG9mIG1lbW9yeS4KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
