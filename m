Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D815C905E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 20:04:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFivn-0005HJ-IK; Wed, 02 Oct 2019 18:00:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFivm-0005H8-7h
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 18:00:54 +0000
X-Inumbo-ID: 934094e2-e53e-11e9-b588-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 934094e2-e53e-11e9-b588-bc764e2007e4;
 Wed, 02 Oct 2019 18:00:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BFC41597;
 Wed,  2 Oct 2019 11:00:53 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41EEF3F706;
 Wed,  2 Oct 2019 11:00:52 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 19:00:42 +0100
Message-Id: <20191002180047.17144-2-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191002180047.17144-1-julien.grall@arm.com>
References: <20191002180047.17144-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 1/6] xen/arm: fix get_cpu_info() when
 built with clang
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
Cc: Artem_Mygaiev@epam.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2xhbmcgdW5kZXJzdGFuZHMgdGhlIEdDQ2lzbSBpbiB1c2UgaGVyZSwgYnV0IHN0aWxsIGNvbXBs
YWlucyB0aGF0IHNwIGlzCnVuaXRpYWxpc2VkLiBJbiBzdWNoIGNhc2VzLCByZXNvcnQgdG8gdGhl
IG9sZGVyIHZlcnNpb25zIG9mIHRoaXMgY29kZSwKd2hpY2ggZGlyZWN0bHkgcmVhZCBzcCBpbnRv
IHRoZSB0ZW1wb3JhcnkgdmFyaWFibGUuCgpOb3RlIHRoYXQgR0NDaXNtIGlzIHN0aWxsIGtlcHQg
aW4gZGVmYXVsdCBiZWNhdXNlIG90aGVyIGNvbXBpbGVycyAoZS5nLgpjbGFuZykgbWF5IGFsc28g
ZGVmaW5lIF9fR05VQ19fLCBzbyBBRkFJSyB0aGVyZSBhcmUgbm8gcHJvcGVyIHdheSB0bwpkZXRl
Y3QgcHJvcGVybHkgR0NDLgoKVGhpcyBtZWFucyB0aGF0IGluIHRoZSBldmVudCBYZW4gaXMgcG9y
dGVkIHRvIGEgbmV3IGNvbXBpbGVyLCB0aGUgY29kZQp3aWxsIG5lZWQgdG8gYmUgdXBkYXRlZC4g
QnV0IHRoYXQgbGlrZWx5IG5vdCBnb2luZyB0byBiZSB0aGUgb25seSBwbGFjZQp3aGVyZSBYZW4g
d2lsbCBuZWVkIHRvIGJlIGFkYXB0ZWQuLi4KClRoaXMgaXMgYmFzZWQgb24gdGhlIHg4NiBjb3Vu
dGVycGFydC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+CkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
CgotLS0KICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBVcGRhdGUgdGhlIGNvbW1pdCBtZXNz
YWdlIHRvIGV4cGxhaW4gdGhlIG9yZGVyaW5nIGluIHRoZSBjb2RlLgogICAgICAgIC0gQWRkIFN0
ZWZhbm8ncyBhY2tlZC1ieQotLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vY3VycmVudC5oIHwgMTAg
KysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vY3VycmVudC5oIGIveGVuL2luY2x1
ZGUvYXNtLWFybS9jdXJyZW50LmgKaW5kZXggMTY1M2U4OWQzMC4uODA1MDM1NzhjZiAxMDA2NDQK
LS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9jdXJyZW50LmgKKysrIGIveGVuL2luY2x1ZGUvYXNt
LWFybS9jdXJyZW50LmgKQEAgLTI4LDggKzI4LDE2IEBAIHN0cnVjdCBjcHVfaW5mbyB7CiAKIHN0
YXRpYyBpbmxpbmUgc3RydWN0IGNwdV9pbmZvICpnZXRfY3B1X2luZm8odm9pZCkKIHsKKyNpZmRl
ZiBfX2NsYW5nX18KKyAgICB1bnNpZ25lZCBsb25nIHNwOworCisgICAgYXNtICgibW92ICUwLCBz
cCIgOiAiPXIiIChzcCkpOworI2Vsc2UKICAgICByZWdpc3RlciB1bnNpZ25lZCBsb25nIHNwIGFz
bSAoInNwIik7Ci0gICAgcmV0dXJuIChzdHJ1Y3QgY3B1X2luZm8gKikoKHNwICYgfihTVEFDS19T
SVpFIC0gMSkpICsgU1RBQ0tfU0laRSAtIHNpemVvZihzdHJ1Y3QgY3B1X2luZm8pKTsKKyNlbmRp
ZgorCisgICAgcmV0dXJuIChzdHJ1Y3QgY3B1X2luZm8gKikoKHNwICYgfihTVEFDS19TSVpFIC0g
MSkpICsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFDS19TSVpFIC0gc2l6ZW9m
KHN0cnVjdCBjcHVfaW5mbykpOwogfQogCiAjZGVmaW5lIGd1ZXN0X2NwdV91c2VyX3JlZ3MoKSAo
JmdldF9jcHVfaW5mbygpLT5ndWVzdF9jcHVfdXNlcl9yZWdzKQotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
