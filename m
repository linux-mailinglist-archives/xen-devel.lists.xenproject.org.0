Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA69EB39E
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 16:13:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQC5s-0007rg-LD; Thu, 31 Oct 2019 15:10:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=msrb=YY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iQC5r-0007qc-BV
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 15:10:35 +0000
X-Inumbo-ID: 7e9ba055-fbf0-11e9-954c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7e9ba055-fbf0-11e9-954c-12813bfff9fa;
 Thu, 31 Oct 2019 15:09:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BE5F8E6;
 Thu, 31 Oct 2019 08:09:55 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (unknown [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 922DB3F71E;
 Thu, 31 Oct 2019 08:09:54 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 31 Oct 2019 15:09:21 +0000
Message-Id: <20191031150922.22938-19-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191031150922.22938-1-julien.grall@arm.com>
References: <20191031150922.22938-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 v4 18/19] xen/arm: Update the ASSERT()
 in SYNCHRONIZE_SERROR()
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
Cc: jgross@suse.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG1hY3JvIFNZTkNIUk9OSVpFX1NFUlJPUigpIGhhcyBhbiBhc3NlcnQgdG8gY2hlY2sgd2hl
dGhlciBpdCB3aWxsCmJlIGNhbGxlZCB3aXRoIEFib3J0IGludGVycnVwdCB1bm1hc2tlZC4gSG93
ZXZlciwgdGhpcyBpcyBvbmx5IGRvbmUgaWYKYSBnaXZlbiBjYXAgaXMgbm90IGVuYWJsZWQuCgpO
b25lIG9mIHRoZSBjYWxsZXJzIHdpbGwgdHJlYXQgdGhlIGFib3J0IGludGVycnVwdCBkaWZmZXJl
bnRseQpkZXBlbmRpbmcgb24gYSBmZWF0dXJlLiBGdXJ0aGVybW9yZSwgaXQgbWFrZXMgbW9yZSBk
aWZmaWN1bHQgdG8gY2hlY2sKd2hldGhlciBTWU5DSFJPTklaRV9TRVJST1IoKSBpcyBnb2luZyB0
byBiZSBjYWxsZWQgd2l0aCBhYm9ydCBpbnRlcnJ1cHQKdW5tYXNrZWQuCgpUaGVyZWZvcmUsIHdl
IG5vdyByZXF1aXJlIHRoZSBhYm9ydCBpbnRlcnJ1cHQgdG8gYmUgdW5tYXNrZWQgcmVnYXJkbGVz
cwp0aGUgc3RhdGUgb2YgdGhlIGNhcC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+CkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CgotLS0KICAgIENoYW5nZXMgaW4gdjM6CiAgICAgICAgLSBBZGQgU3Rl
ZmFubydzIGFja2VkLWJ5CgogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIFBhdGNoIGFkZGVk
Ci0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaCB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL2FzbS1hcm0vcHJvY2Vzc29yLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3Byb2Nlc3Nvci5o
CmluZGV4IGU5ZDJhZTI3MTUuLmFhNjQyZTNhYjIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vcHJvY2Vzc29yLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaApA
QCAtNTQyLDcgKzU0Miw3IEBAIHJlZ2lzdGVyX3QgZ2V0X2RlZmF1bHRfaGNyX2ZsYWdzKHZvaWQp
OwogICovCiAjZGVmaW5lIFNZTkNIUk9OSVpFX1NFUlJPUihmZWF0KSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCiAgICAgZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0gICAgICAgIEFTU0VSVCghY3B1c19oYXZl
X2NhcChmZWF0KSB8fCBsb2NhbF9hYm9ydF9pc19lbmFibGVkKCkpOyBcCisgICAgICAgIEFTU0VS
VChsb2NhbF9hYm9ydF9pc19lbmFibGVkKCkpOyAgICAgICAgICAgICAgICAgICAgICAgICBcCiAg
ICAgICAgIGFzbSB2b2xhdGlsZShBTFRFUk5BVElWRSgiZHNiIHN5OyBpc2IiLCAgICAgICAgICAg
ICAgICAgICBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAibm9wOyBub3AiLCBm
ZWF0KSAgICAgICAgICAgICAgICBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6
IDogOiAibWVtb3J5Iik7ICAgICAgICAgICAgICAgICBcCi0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
