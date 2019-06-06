Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB2B37ABA
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 19:15:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYvuM-0004Lo-Pq; Thu, 06 Jun 2019 17:10:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2G1I=UF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYvuL-0004Lj-3A
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 17:10:33 +0000
X-Inumbo-ID: fcb10e87-887d-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id fcb10e87-887d-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 17:10:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22CB9374;
 Thu,  6 Jun 2019 10:10:30 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E313B3F690;
 Thu,  6 Jun 2019 10:10:28 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  6 Jun 2019 18:10:24 +0100
Message-Id: <20190606171024.11152-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH v3] xen/public: arch-arm: Restrict the
 visibility of struct vcpu_guest_core_regs
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
Cc: andrew.cooper3@citrix.com, Julien Grall <julien.grall@arm.com>,
 ian.jackson@eu.citrix.com, wl@xen.org, jbeulich@suse.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5LCB0aGUgc3RydWN0dXJlIHZjcHVfZ3Vlc3RfY29yZV9yZWdzIGlzIHBhcnQgb2Yg
dGhlIHB1YmxpYyBBUEkuClRoaXMgaW1wbGllcyB0aGF0IGFueSBjaGFuZ2UgaW4gdGhlIHN0cnVj
dHVyZSBzaG91bGQgYmUgYmFja3dhcmQKY29tcGF0aWJsZS4KCkhvd2V2ZXIsIHRoZSBzdHJ1Y3R1
cmUgaXMgb25seSBuZWVkZWQgYnkgdGhlIHRvb2xzIGFuZCBYZW4uIEl0IGlzIGFsc28Kbm90IGV4
cGVjdGVkIHRvIGJlIGV2ZXIgdXNlZCBvdXRzaWRlIG9mIHRoYXQgY29udGV4dC4gU28gd2UgY291
bGQgc2F2ZSB1cwpzb21lIGhlYWRhY2hlIGJ5IG9ubHkgZGVjbGFyaW5nIHRoZSBzdHJ1Y3R1cmUg
Zm9yIFhlbiBhbmQgdG9vbHMuCgpTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+CgotLS0KICAgIFRoaXMgaXMgYSBmb2xsb3ctdXAgb2YgdGhlIGRpc2N1c3Np
b24gWzFdLgoKICAgIFsxXSA8M2MyNDVjNWItNTFjNi0xZDBlLWFkNmMtNDI0MTQ1NzMxNjZmQGFy
bS5jb20+CgogICAgQ2hhbmdlcyBpbiB2MzoKICAgICAgICAtIEF2b2lkIGludHJvZHVjZSBhIG5l
dyAjaWZkZWYgaW4gdGhlIGhlYWRlciBieSBtb3ZpbmcgdGhlCiAgICAgICAgZGVmaW5pdGlvbnMg
bGF0ZXIgb24uCi0tLQogeGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmggfCAyNCArKysrKysr
KysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaCBi
L3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oCmluZGV4IGViNDI0ZTgyODYuLjE0ZTRjYmFk
MDYgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oCisrKyBiL3hlbi9p
bmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oCkBAIC0xOTcsNiArMTk3LDE4IEBACiAgICAgfSB3aGls
ZSAoIDAgKQogI2RlZmluZSBzZXRfeGVuX2d1ZXN0X2hhbmRsZShobmQsIHZhbCkgc2V0X3hlbl9n
dWVzdF9oYW5kbGVfcmF3KGhuZCwgdmFsKQogCit0eXBlZGVmIHVpbnQ2NF90IHhlbl9wZm5fdDsK
KyNkZWZpbmUgUFJJX3hlbl9wZm4gUFJJeDY0CisjZGVmaW5lIFBSSXVfeGVuX3BmbiBQUkl1NjQK
KworLyogTWF4aW11bSBudW1iZXIgb2YgdmlydHVhbCBDUFVzIGluIGxlZ2FjeSBtdWx0aS1wcm9j
ZXNzb3IgZ3Vlc3RzLiAqLworLyogT25seSBvbmUuIEFsbCBvdGhlciBWQ1BVUyBtdXN0IHVzZSBW
Q1BVT1BfcmVnaXN0ZXJfdmNwdV9pbmZvICovCisjZGVmaW5lIFhFTl9MRUdBQ1lfTUFYX1ZDUFVT
IDEKKwordHlwZWRlZiB1aW50NjRfdCB4ZW5fdWxvbmdfdDsKKyNkZWZpbmUgUFJJX3hlbl91bG9u
ZyBQUkl4NjQKKworI2lmIGRlZmluZWQoX19YRU5fXykgfHwgZGVmaW5lZChfX1hFTl9UT09MU19f
KQogI2lmIGRlZmluZWQoX19HTlVDX18pICYmICFkZWZpbmVkKF9fU1RSSUNUX0FOU0lfXykKIC8q
IEFub255bW91cyB1bmlvbiBpbmNsdWRlcyBib3RoIDMyLSBhbmQgNjQtYml0IG5hbWVzIChlLmcu
LCByMC94MCkuICovCiAjIGRlZmluZSBfX0RFQ0xfUkVHKG42NCwgbjMyKSB1bmlvbiB7ICAgICAg
ICAgIFwKQEAgLTI3MiwxOCArMjg0LDYgQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUodmNwdV9n
dWVzdF9jb3JlX3JlZ3NfdCk7CiAKICN1bmRlZiBfX0RFQ0xfUkVHCiAKLXR5cGVkZWYgdWludDY0
X3QgeGVuX3Bmbl90OwotI2RlZmluZSBQUklfeGVuX3BmbiBQUkl4NjQKLSNkZWZpbmUgUFJJdV94
ZW5fcGZuIFBSSXU2NAotCi0vKiBNYXhpbXVtIG51bWJlciBvZiB2aXJ0dWFsIENQVXMgaW4gbGVn
YWN5IG11bHRpLXByb2Nlc3NvciBndWVzdHMuICovCi0vKiBPbmx5IG9uZS4gQWxsIG90aGVyIFZD
UFVTIG11c3QgdXNlIFZDUFVPUF9yZWdpc3Rlcl92Y3B1X2luZm8gKi8KLSNkZWZpbmUgWEVOX0xF
R0FDWV9NQVhfVkNQVVMgMQotCi10eXBlZGVmIHVpbnQ2NF90IHhlbl91bG9uZ190OwotI2RlZmlu
ZSBQUklfeGVuX3Vsb25nIFBSSXg2NAotCi0jaWYgZGVmaW5lZChfX1hFTl9fKSB8fCBkZWZpbmVk
KF9fWEVOX1RPT0xTX18pCiBzdHJ1Y3QgdmNwdV9ndWVzdF9jb250ZXh0IHsKICNkZWZpbmUgX1ZH
Q0Zfb25saW5lICAgICAgICAgICAgICAgICAgIDAKICNkZWZpbmUgVkdDRl9vbmxpbmUgICAgICAg
ICAgICAgICAgICAgICgxPDxfVkdDRl9vbmxpbmUpCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
