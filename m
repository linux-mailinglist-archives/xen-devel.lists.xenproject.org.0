Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC228A49D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 19:33:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxE9P-0006gC-0g; Mon, 12 Aug 2019 17:30:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dIXR=WI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxE9N-0006g2-00
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 17:30:29 +0000
X-Inumbo-ID: e065d761-bd26-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e065d761-bd26-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 17:30:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D2FC1715;
 Mon, 12 Aug 2019 10:30:28 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B5BE3F706;
 Mon, 12 Aug 2019 10:30:27 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 18:29:52 +0100
Message-Id: <20190812173019.11956-2-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812173019.11956-1-julien.grall@arm.com>
References: <20190812173019.11956-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 01/28] xen/arm: lpae: Allow more LPAE helpers
 to be used in assembly
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSBmb2xsb3ctdXAgcGF0Y2ggd2lsbCByZXF1aXJlIHRvIHVzZSAqX3RhYmxlX29mZnNldCgpIGFu
ZCAqX01BU0sgaGVscGVycwpmcm9tIGFzc2VtYmx5LiBUaGlzIGNhbiBiZSBhY2hpZXZlZCBieSB1
c2luZyBfQVQoKSBtYWNybyB0byByZW1vdmUgdGhlIHR5cGUKd2hlbiBjYWxsZWQgZnJvbSBhc3Nl
bWJseS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
CgotLS0KICAgIENoYW5nZXMgaW4gdjM6CiAgICAgICAgLSBQYXRjaCBhZGRlZAotLS0KIHhlbi9p
bmNsdWRlL2FzbS1hcm0vbHBhZS5oIHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9h
c20tYXJtL2xwYWUuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbHBhZS5oCmluZGV4IGMyMjc4MGY4
ZjMuLjQ3OTdmOWNlZTQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbHBhZS5oCisr
KyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbHBhZS5oCkBAIC0yNDUsMTkgKzI0NSwxOSBAQCBUQUJM
RV9PRkZTRVRfSEVMUEVSUyg2NCk7CiAKICNkZWZpbmUgVEhJUkRfU0hJRlQgICAgKFBBR0VfU0hJ
RlQpCiAjZGVmaW5lIFRISVJEX09SREVSICAgIChUSElSRF9TSElGVCAtIFBBR0VfU0hJRlQpCi0j
ZGVmaW5lIFRISVJEX1NJWkUgICAgICgocGFkZHJfdCkxIDw8IFRISVJEX1NISUZUKQorI2RlZmlu
ZSBUSElSRF9TSVpFICAgICAoX0FUKHBhZGRyX3QsIDEpIDw8IFRISVJEX1NISUZUKQogI2RlZmlu
ZSBUSElSRF9NQVNLICAgICAofihUSElSRF9TSVpFIC0gMSkpCiAjZGVmaW5lIFNFQ09ORF9TSElG
VCAgIChUSElSRF9TSElGVCArIExQQUVfU0hJRlQpCiAjZGVmaW5lIFNFQ09ORF9PUkRFUiAgIChT
RUNPTkRfU0hJRlQgLSBQQUdFX1NISUZUKQotI2RlZmluZSBTRUNPTkRfU0laRSAgICAoKHBhZGRy
X3QpMSA8PCBTRUNPTkRfU0hJRlQpCisjZGVmaW5lIFNFQ09ORF9TSVpFICAgIChfQVQocGFkZHJf
dCwgMSkgPDwgU0VDT05EX1NISUZUKQogI2RlZmluZSBTRUNPTkRfTUFTSyAgICAofihTRUNPTkRf
U0laRSAtIDEpKQogI2RlZmluZSBGSVJTVF9TSElGVCAgICAoU0VDT05EX1NISUZUICsgTFBBRV9T
SElGVCkKICNkZWZpbmUgRklSU1RfT1JERVIgICAgKEZJUlNUX1NISUZUIC0gUEFHRV9TSElGVCkK
LSNkZWZpbmUgRklSU1RfU0laRSAgICAgKChwYWRkcl90KTEgPDwgRklSU1RfU0hJRlQpCisjZGVm
aW5lIEZJUlNUX1NJWkUgICAgIChfQVQocGFkZHJfdCwgMSkgPDwgRklSU1RfU0hJRlQpCiAjZGVm
aW5lIEZJUlNUX01BU0sgICAgICh+KEZJUlNUX1NJWkUgLSAxKSkKICNkZWZpbmUgWkVST0VUSF9T
SElGVCAgKEZJUlNUX1NISUZUICsgTFBBRV9TSElGVCkKICNkZWZpbmUgWkVST0VUSF9PUkRFUiAg
KFpFUk9FVEhfU0hJRlQgLSBQQUdFX1NISUZUKQotI2RlZmluZSBaRVJPRVRIX1NJWkUgICAoKHBh
ZGRyX3QpMSA8PCBaRVJPRVRIX1NISUZUKQorI2RlZmluZSBaRVJPRVRIX1NJWkUgICAoX0FUKHBh
ZGRyX3QsIDEpIDw8IFpFUk9FVEhfU0hJRlQpCiAjZGVmaW5lIFpFUk9FVEhfTUFTSyAgICh+KFpF
Uk9FVEhfU0laRSAtIDEpKQogCiAvKiBDYWxjdWxhdGUgdGhlIG9mZnNldHMgaW50byB0aGUgcGFn
ZXRhYmxlcyBmb3IgYSBnaXZlbiBWQSAqLwpAQCAtMjY2LDcgKzI2Niw3IEBAIFRBQkxFX09GRlNF
VF9IRUxQRVJTKDY0KTsKICNkZWZpbmUgc2Vjb25kX2xpbmVhcl9vZmZzZXQodmEpICgodmEpID4+
IFNFQ09ORF9TSElGVCkKICNkZWZpbmUgdGhpcmRfbGluZWFyX29mZnNldCh2YSkgKCh2YSkgPj4g
VEhJUkRfU0hJRlQpCiAKLSNkZWZpbmUgVEFCTEVfT0ZGU0VUKG9mZnMpICgodW5zaWduZWQgaW50
KShvZmZzKSAmIExQQUVfRU5UUllfTUFTSykKKyNkZWZpbmUgVEFCTEVfT0ZGU0VUKG9mZnMpIChf
QVQodW5zaWduZWQgaW50LCBvZmZzKSAmIExQQUVfRU5UUllfTUFTSykKICNkZWZpbmUgZmlyc3Rf
dGFibGVfb2Zmc2V0KHZhKSAgVEFCTEVfT0ZGU0VUKGZpcnN0X2xpbmVhcl9vZmZzZXQodmEpKQog
I2RlZmluZSBzZWNvbmRfdGFibGVfb2Zmc2V0KHZhKSBUQUJMRV9PRkZTRVQoc2Vjb25kX2xpbmVh
cl9vZmZzZXQodmEpKQogI2RlZmluZSB0aGlyZF90YWJsZV9vZmZzZXQodmEpICBUQUJMRV9PRkZT
RVQodGhpcmRfbGluZWFyX29mZnNldCh2YSkpCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
