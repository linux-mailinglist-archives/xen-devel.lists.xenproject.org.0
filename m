Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60418B9D4C
	for <lists+xen-devel@lfdr.de>; Sat, 21 Sep 2019 12:11:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBcJw-0003rl-9C; Sat, 21 Sep 2019 10:08:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VugD=XQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iBcJu-0003re-5G
 for xen-devel@lists.xenproject.org; Sat, 21 Sep 2019 10:08:50 +0000
X-Inumbo-ID: cd9802e6-dc57-11e9-95b8-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id cd9802e6-dc57-11e9-95b8-12813bfff9fa;
 Sat, 21 Sep 2019 10:08:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFDDE1000;
 Sat, 21 Sep 2019 03:08:47 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39FC13F59C;
 Sat, 21 Sep 2019 03:08:47 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 21 Sep 2019 11:08:36 +0100
Message-Id: <20190921100836.21396-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [RESEND][PATCH for-4.13] xen/arm: mm: Clear boot
 pagetables before bringing-up each secondary CPU
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

QXQgdGhlIG1vbWVudCwgYm9vdCBwYWdldGFibGVzIGFyZSBvbmx5IGNsZWFyZWQgb25jZSBhdCBi
b290LiBUaGlzIG1lYW5zCndoZW4gYm9vdGluZyBDUFUyIChhbmQgb253YXJkcykgdGhlbiBib290
IHBhZ2V0YWJsZXMgd2lsbCBub3QgYmUKY2xlYXJlZC4KClRvIGtlZXAgdGhlIGludGVyZmFjZSBl
eGFjdGx5IHRoZSBzYW1lIGZvciBhbGwgc2Vjb25kYXJ5IENQVSwgdGhlIGJvb3QKcGFnZXRhYmxl
cyBhcmUgbm93IGNsZWFyZWQgYmVmb3JlIGJyaW5naW5nLXVwIGVhY2ggc2Vjb25kYXJ5IENQVS4K
ClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQog
eGVuL2FyY2gvYXJtL21tLmMgfCAyNyArKysrKysrKysrKysrKysrKystLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMKaW5kZXggMTEyOWRjMjhjOC4u
ZTE0ZWU3NmZmOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL21tLmMKKysrIGIveGVuL2FyY2gv
YXJtL21tLmMKQEAgLTcwNCw4ICs3MDQsMjAgQEAgdm9pZCBfX2luaXQgc2V0dXBfcGFnZXRhYmxl
cyh1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQpCiAKICAgICBzd2l0Y2hfdHRicih0dGJy
KTsKIAotICAgIC8qIENsZWFyIHRoZSBjb3B5IG9mIHRoZSBib290IHBhZ2V0YWJsZXMuIEVhY2gg
c2Vjb25kYXJ5IENQVQotICAgICAqIHJlYnVpbGRzIHRoZXNlIGl0c2VsZiAoc2VlIGhlYWQuUykg
Ki8KKyAgICB4ZW5fcHRfZW5mb3JjZV93bngoKTsKKworI2lmZGVmIENPTkZJR19BUk1fMzIKKyAg
ICBwZXJfY3B1KHhlbl9wZ3RhYmxlLCAwKSA9IGNwdTBfcGd0YWJsZTsKKyAgICBwZXJfY3B1KHhl
bl9kb21tYXAsIDApID0gY3B1MF9kb21tYXA7CisjZW5kaWYKK30KKworc3RhdGljIHZvaWQgY2xl
YXJfYm9vdF9wYWdldGFibGVzKHZvaWQpCit7CisgICAgLyoKKyAgICAgKiBDbGVhciB0aGUgY29w
eSBvZiB0aGUgYm9vdCBwYWdldGFibGVzLiBFYWNoIHNlY29uZGFyeSBDUFUKKyAgICAgKiByZWJ1
aWxkcyB0aGVzZSBpdHNlbGYgKHNlZSBoZWFkLlMpCisgICAgICovCiAgICAgY2xlYXJfdGFibGUo
Ym9vdF9wZ3RhYmxlKTsKICNpZmRlZiBDT05GSUdfQVJNXzY0CiAgICAgY2xlYXJfdGFibGUoYm9v
dF9maXJzdCk7CkBAIC03MTMsMTggKzcyNSwxMyBAQCB2b2lkIF9faW5pdCBzZXR1cF9wYWdldGFi
bGVzKHVuc2lnbmVkIGxvbmcgYm9vdF9waHlzX29mZnNldCkKICNlbmRpZgogICAgIGNsZWFyX3Rh
YmxlKGJvb3Rfc2Vjb25kKTsKICAgICBjbGVhcl90YWJsZShib290X3RoaXJkKTsKLQotICAgIHhl
bl9wdF9lbmZvcmNlX3dueCgpOwotCi0jaWZkZWYgQ09ORklHX0FSTV8zMgotICAgIHBlcl9jcHUo
eGVuX3BndGFibGUsIDApID0gY3B1MF9wZ3RhYmxlOwotICAgIHBlcl9jcHUoeGVuX2RvbW1hcCwg
MCkgPSBjcHUwX2RvbW1hcDsKLSNlbmRpZgogfQogCiAjaWZkZWYgQ09ORklHX0FSTV82NAogaW50
IGluaXRfc2Vjb25kYXJ5X3BhZ2V0YWJsZXMoaW50IGNwdSkKIHsKKyAgICBjbGVhcl9ib290X3Bh
Z2V0YWJsZXMoKTsKKwogICAgIC8qIFNldCBpbml0X3R0YnIgZm9yIHRoaXMgQ1BVIGNvbWluZyB1
cC4gQWxsIENQdXMgc2hhcmUgYSBzaW5nbGUgc2V0b2YKICAgICAgKiBwYWdldGFibGVzLCBidXQg
cmV3cml0ZSBpdCBlYWNoIHRpbWUgZm9yIGNvbnNpc3RlbmN5IHdpdGggMzIgYml0LiAqLwogICAg
IGluaXRfdHRiciA9ICh1aW50cHRyX3QpIHhlbl9wZ3RhYmxlICsgcGh5c19vZmZzZXQ7CkBAIC03
NjcsNiArNzc0LDggQEAgaW50IGluaXRfc2Vjb25kYXJ5X3BhZ2V0YWJsZXMoaW50IGNwdSkKICAg
ICBwZXJfY3B1KHhlbl9wZ3RhYmxlLCBjcHUpID0gZmlyc3Q7CiAgICAgcGVyX2NwdSh4ZW5fZG9t
bWFwLCBjcHUpID0gZG9taGVhcDsKIAorICAgIGNsZWFyX2Jvb3RfcGFnZXRhYmxlcygpOworCiAg
ICAgLyogU2V0IGluaXRfdHRiciBmb3IgdGhpcyBDUFUgY29taW5nIHVwICovCiAgICAgaW5pdF90
dGJyID0gX19wYShmaXJzdCk7CiAgICAgY2xlYW5fZGNhY2hlKGluaXRfdHRicik7Ci0tIAoyLjEx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
