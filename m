Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1120C905B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 20:03:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFivw-0005JZ-Ky; Wed, 02 Oct 2019 18:01:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFivv-0005JI-4i
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 18:01:03 +0000
X-Inumbo-ID: 949eefe6-e53e-11e9-971c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 949eefe6-e53e-11e9-971c-12813bfff9fa;
 Wed, 02 Oct 2019 18:00:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68F3E15A2;
 Wed,  2 Oct 2019 11:00:55 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F5693F706;
 Wed,  2 Oct 2019 11:00:54 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 19:00:44 +0100
Message-Id: <20191002180047.17144-4-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191002180047.17144-1-julien.grall@arm.com>
References: <20191002180047.17144-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 3/6] xen/arm: cpuerrata: Match register
 size with value size in check_workaround_*
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

Q2xhbmcgaXMgcGlja2llciB0aGFuIEdDQyBmb3IgdGhlIHJlZ2lzdGVyIHNpemUgaW4gYXNtIHN0
YXRlbWVudC4gSXQKZXhwZWN0cyB0aGUgcmVnaXN0ZXIgc2l6ZSB0byBtYXRjaCB0aGUgdmFsdWUg
c2l6ZS4KClRoZSBhc20gc3RhdGVtZW50IGV4cGVjdHMgYSAzMi1iaXQgKHJlc3AuIDY0LWJpdCkg
dmFsdWUgb24gQXJtMzIKKHJlc3AuIEFybTY0KSB3aGVyZWFzIHRoZSB2YWx1ZSBpcyBhIGJvb2xl
YW4gKENsYW5nIGNvbnNpZGVyIHRvIGJlCjMyLWJpdCkuCgpJdCB3b3VsZCBiZSBwb3NzaWJsZSB0
byBpbXBvc2UgMzItYml0IHJlZ2lzdGVyIGZvciBib3RoIGFyY2hpdGVjdHVyZQpidXQgdGhpcyBy
ZXF1aXJlIHRoZSBjb2RlIHRvIHVzZSBfX09QMzIuIEhvd2V2ZXIsIGl0IGRvZXMgbm90IHJlYWxs
eQppbXByb3ZlIHRoZSBhc3NlbWJseSBnZW5lcmF0ZWQuIEluc3RlYWQsIHJlcGxhY2Ugc3dpdGNo
IHRoZSB2YXJpYWJsZQp0byB1c2UgcmVnaXN0ZXJfdC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgotLS0KICAgIENoYW5nZXMgaW4gdjI6CiAgICAg
ICAgLSBVc2UgISEgcGVyIFN0ZWZhbm8ncyByZXF1ZXN0Ci0tLQogeGVuL2luY2x1ZGUvYXNtLWFy
bS9jcHVlcnJhdGEuaCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWVycmF0
YS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9jcHVlcnJhdGEuaAppbmRleCA1NWRkZmRhMjcyLi4w
ODk2ZmU2ZTI1IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWVycmF0YS5oCisr
KyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vY3B1ZXJyYXRhLmgKQEAgLTE0LDE0ICsxNCwxNCBAQCBz
dGF0aWMgaW5saW5lIGJvb2wgY2hlY2tfd29ya2Fyb3VuZF8jI2VycmF0dW0odm9pZCkgICAgICAg
ICAgICAgXAogICAgICAgICByZXR1cm4gZmFsc2U7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKICAgICBlbHNlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgeyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgICAgICBib29sIHJldDsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAgICAg
cmVnaXN0ZXJfdCByZXQ7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAogICAgICAgICBhc20gdm9sYXRpbGUgKEFMVEVSTkFUSVZFKCJtb3YgJTAsICMw
IiwgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
bW92ICUwLCAjMSIsICAgICAgICAgICAgICAgICBcCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZmVhdHVyZSkgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAg
ICAgICAgIDogIj1yIiAocmV0KSk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCi0gICAgICAgIHJldHVybiB1bmxpa2VseShyZXQpOyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAorICAgICAgICByZXR1cm4gdW5saWtlbHkoISFyZXQpOyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKICAgICB9ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiB9CiAKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
