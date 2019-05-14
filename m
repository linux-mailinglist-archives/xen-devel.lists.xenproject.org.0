Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 392C41C8A7
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:27:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWUb-0002Zf-Tw; Tue, 14 May 2019 12:25:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWUa-0002YK-ED
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:25:12 +0000
X-Inumbo-ID: 51bd4778-7643-11e9-bc63-e3472027ce0e
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 51bd4778-7643-11e9-bc63-e3472027ce0e;
 Tue, 14 May 2019 12:25:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96F6E15AD;
 Tue, 14 May 2019 05:25:11 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 871733F71E;
 Tue, 14 May 2019 05:25:10 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:24:43 +0100
Message-Id: <20190514122456.28559-7-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514122456.28559-1-julien.grall@arm.com>
References: <20190514122456.28559-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART2 RESEND v2 06/19] xen/arm: Rework
 secondary_start prototype
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
 Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm9uZSBvZiB0aGUgcGFyYW1ldGVycyBvZiBzZWNvbmRhcnlfc3RhcnQgYXJlIGFjdHVhbGx5IHVz
ZWQuIFNvIHR1cm4Kc2Vjb25kYXJ5X3N0YXJ0IHRvIGEgZnVuY3Rpb24gd2l0aCBubyBwYXJhbWV0
ZXJzLgoKQWxzbyBtb2RpZnkgdGhlIGFzc2VtYmx5IGNvZGUgdG8gYXZvaWQgc2V0dGluZy11cCB0
aGUgcmVnaXN0ZXJzIGJlZm9yZQpjYWxsaW5nIHNlY29uZGFyeV9zdGFydC4KClNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgogICAgLSBSZS1vcmRlciB0
aGUgcGF0Y2ggd2l0aCAieGVuL2FybTogUmVtb3ZlIHBhcmFtZXRlciBjcHVpZCBmcm9tCiAgICBz
dGFydF94ZW4iLgotLS0KIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgfCA0ICsrLS0KIHhlbi9h
cmNoL2FybS9hcm02NC9oZWFkLlMgfCAzICsrLQogeGVuL2FyY2gvYXJtL3NtcGJvb3QuYyAgICB8
IDQgKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9h
cm0zMi9oZWFkLlMKaW5kZXggY2I4YTNiZjgyOS4uOWY0MGZhY2U5OCAxMDA2NDQKLS0tIGEveGVu
L2FyY2gvYXJtL2FybTMyL2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCkBA
IC00NDUsOSArNDQ1LDkgQEAgbGF1bmNoOgogICAgICAgICBsZHIgICBzcCwgW3IwXQogICAgICAg
ICBhZGQgICBzcCwgI1NUQUNLX1NJWkUgICAgICAgIC8qICh3aGljaCBncm93cyBkb3duIGZyb20g
dGhlIHRvcCkuICovCiAgICAgICAgIHN1YiAgIHNwLCAjQ1BVSU5GT19zaXplb2YgICAgLyogTWFr
ZSByb29tIGZvciBDUFUgc2F2ZSByZWNvcmQgKi8KLSAgICAgICAgbW92ICAgcjAsIHIxMCAgICAg
ICAgICAgICAgICAvKiBNYXJzaGFsIGFyZ3M6IC0gcGh5c19vZmZzZXQgKi8KLSAgICAgICAgbW92
ICAgcjEsIHI4ICAgICAgICAgICAgICAgICAvKiAgICAgICAgICAgICAgIC0gRFRCIGFkZHJlc3Mg
Ki8KICAgICAgICAgdGVxICAgcjEyLCAjMAorICAgICAgICBtb3ZlcSByMCwgcjEwICAgICAgICAg
ICAgICAgIC8qIE1hcnNoYWwgYXJnczogLSBwaHlzX29mZnNldCAqLworICAgICAgICBtb3ZlcSBy
MSwgcjggICAgICAgICAgICAgICAgIC8qICAgICAgICAgICAgICAgLSBEVEIgYWRkcmVzcyAqLwog
ICAgICAgICBiZXEgICBzdGFydF94ZW4gICAgICAgICAgICAgIC8qIGFuZCBkaXNhcHBlYXIgaW50
byB0aGUgbGFuZCBvZiBDICovCiAgICAgICAgIGIgICAgIHN0YXJ0X3NlY29uZGFyeSAgICAgICAg
LyogKHRvIHRoZSBhcHByb3ByaWF0ZSBlbnRyeSBwb2ludCkgKi8KIApkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKaW5kZXgg
MDc1MDEzODc4ZS4uY2IzMGQ2ZjIyZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hl
YWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCkBAIC01ODIsOSArNTgyLDEwIEBA
IGxhdW5jaDoKICAgICAgICAgc3ViICAgeDAsIHgwLCAjQ1BVSU5GT19zaXplb2YgLyogTWFrZSBy
b29tIGZvciBDUFUgc2F2ZSByZWNvcmQgKi8KICAgICAgICAgbW92ICAgc3AsIHgwCiAKKyAgICAg
ICAgY2JueiAgeDIyLCAxZgorCiAgICAgICAgIG1vdiAgIHgwLCB4MjAgICAgICAgICAgICAgICAg
LyogTWFyc2hhbCBhcmdzOiAtIHBoeXNfb2Zmc2V0ICovCiAgICAgICAgIG1vdiAgIHgxLCB4MjEg
ICAgICAgICAgICAgICAgLyogICAgICAgICAgICAgICAtIEZEVCAqLwotICAgICAgICBjYm56ICB4
MjIsIDFmCiAgICAgICAgIGIgICAgIHN0YXJ0X3hlbiAgICAgICAgICAgICAgLyogYW5kIGRpc2Fw
cGVhciBpbnRvIHRoZSBsYW5kIG9mIEMgKi8KIDE6CiAgICAgICAgIGIgICAgIHN0YXJ0X3NlY29u
ZGFyeSAgICAgICAgLyogKHRvIHRoZSBhcHByb3ByaWF0ZSBlbnRyeSBwb2ludCkgKi8KZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9zbXBib290LmMgYi94ZW4vYXJjaC9hcm0vc21wYm9vdC5jCmlu
ZGV4IGY3NTY0NDQzNjIuLjAwYjY0YzMzMjIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9zbXBi
b290LmMKKysrIGIveGVuL2FyY2gvYXJtL3NtcGJvb3QuYwpAQCAtMjk3LDkgKzI5Nyw3IEBAIHNt
cF9wcmVwYXJlX2NwdXModm9pZCkKIH0KIAogLyogQm9vdCB0aGUgY3VycmVudCBDUFUgKi8KLXZv
aWQgc3RhcnRfc2Vjb25kYXJ5KHVuc2lnbmVkIGxvbmcgYm9vdF9waHlzX29mZnNldCwKLSAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmR0X3BhZGRyLAotICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyBod2lkKQordm9pZCBzdGFydF9zZWNvbmRhcnkodm9pZCkKIHsK
ICAgICB1bnNpZ25lZCBpbnQgY3B1aWQgPSBpbml0X2RhdGEuY3B1aWQ7CiAKLS0gCjIuMTEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
