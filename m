Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7101EB39A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 16:12:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQC5D-0006bI-Hm; Thu, 31 Oct 2019 15:09:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=msrb=YY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iQC5C-0006ai-Bp
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 15:09:54 +0000
X-Inumbo-ID: 795405f0-fbf0-11e9-bbab-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 795405f0-fbf0-11e9-bbab-bc764e2007e4;
 Thu, 31 Oct 2019 15:09:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CD3A7A7;
 Thu, 31 Oct 2019 08:09:45 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (unknown [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A11F73F71E;
 Thu, 31 Oct 2019 08:09:44 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 31 Oct 2019 15:09:13 +0000
Message-Id: <20191031150922.22938-11-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191031150922.22938-1-julien.grall@arm.com>
References: <20191031150922.22938-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 v4 10/19] xen/arm32: entry: Rename
 save_guest_regs()
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

VGhlIGZ1bmN0aW9uIHNhdmVfZ3Vlc3RfcmVncygpIGlzIGRvaW5nIG1vcmUgdGhhbiBzYXZpbmcg
Z3Vlc3QKcmVnaXN0ZXJzLiBJdCBhbHNvIHJlc3RvcmUgdGhlIHZlY3RvcnMgdGFibGUgYW5kIGNv
bnN1bWUgYW55IHBlbmRpbmcKU0Vycm9ycyBnZW5lcmF0ZWQgYnkgdGhlIGd1ZXN0LiBTbyByZW5h
bWUgdGhlIGZ1bmN0aW9uIHRvCmFyY2hfZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0X3ByZWly
cSgpLgoKVGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gdXNlIEVORFBST0MoKSBmb3IgdGhlIGJlbmVm
aXRzIG9mIHN0YXRpYwphbmFsaXplciBhbmQgdGhlIHJlYWRlci4KClNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgotLS0KClRoZSBuYW1lIG9mIHRoZSBs
YWJlbCBpcyBxdWl0ZSBsb25nIGJ1dCB0aGlzIHdhcyB0aGUgYmVzdCBJIGNhbWUgdXAuIE90aGVy
CnN1Z2dlc3Rpb25zIG1hZGUgd2VyZSBndWVzdF92ZWN0b3IoKSBhbmQgZ3Vlc3RfZW50cnkoKS4K
CkkgdGhpbmsgZ3Vlc3RfdmVjdG9yKCkgaXMgYSBuby1nbyBiZWNhdXNlIHdlIGFyZSBvbmx5IGlt
cGxlbWVudGluZyBwYXJ0IG9mIHRoZQp2ZWN0b3IuCgpSZWdhcmRpbmcgZ3Vlc3RfZW50cnkoKSwg
dGhpcyBpcyBkZWJhdGFibGUgYmVjYXVzZSBmcm9tIHRoZSBndWVzdCBQb1YsIHlvdQpleGl0IGl0
IHNvIGl0IGNhbiBiZSBtaXNsZWFkaW5nLiBJIGFjdHVhbGx5IGdvdCBjb25mdXNlZCBtb3JlIHRo
YW4gb25lIHRpbWUuCgpBbm90aGVyIHBvc3NpYmlsaXR5IHdvdWxkIGJlIGVudGVyX2Zyb21fZ3Vl
c3QoKSwgYnV0IHRoaXMgaXMgZmFpcmx5CmNsb3NlIHRvIGVudGVyX2h5cGVydmlzb3JfZnJvbV9n
dWVzdCgpLiBUaGUgY29kZSB3b3VsZCBsb29rIGxpa2U6CgpibCBlbnRlcl9mcm9tX2d1ZXN0CmNz
aWUgLi4uCmJsIGVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdAoKQW55IG90aGVyIHN1Z2dlc3Rp
b24gZm9yIHRoZSBuYW1lPwoKICAgIENoYW5nZXMgaW4gdjM6CiAgICAgICAgLSBQYXRjaCBhZGRl
ZAotLS0KIHhlbi9hcmNoL2FybS9hcm0zMi9lbnRyeS5TIHwgMTEgKysrKysrKystLS0KIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2FybTMyL2VudHJ5LlMgYi94ZW4vYXJjaC9hcm0vYXJtMzIvZW50cnkuUwpp
bmRleCA1YWJmZjI0ZTkxLi5jZWE0ZTBlMzAyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJt
MzIvZW50cnkuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvZW50cnkuUwpAQCAtMjQsNyArMjQs
MTEgQEAKICNkZWZpbmUgUkVTVE9SRV9CQU5LRUQobW9kZSkgXAogICAgICAgICBSRVNUT1JFX09O
RV9CQU5LRUQoU1BfIyNtb2RlKSA7IFJFU1RPUkVfT05FX0JBTktFRChMUl8jI21vZGUpIDsgUkVT
VE9SRV9PTkVfQkFOS0VEKFNQU1JfIyNtb2RlKQogCi1zYXZlX2d1ZXN0X3JlZ3M6CisvKgorICog
QWN0aW9ucyB0aGF0IG5lZWRzIHRvIGJlIGRvbmUgYWZ0ZXIgZW50ZXJpbmcgdGhlIGh5cGVydmlz
b3IgZnJvbSB0aGUKKyAqIGd1ZXN0IGFuZCBiZWZvcmUgdGhlIGludGVycnVwdHMgYXJlIHVubWFz
a2VkLgorICovCithcmNoX2VudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdF9wcmVpcnE6CiAjaWZk
ZWYgQ09ORklHX0FSTTMyX0hBUkRFTl9CUkFOQ0hfUFJFRElDVE9SCiAgICAgICAgIC8qCiAgICAg
ICAgICAqIFJlc3RvcmUgdmVjdG9ycyB0YWJsZSB0byB0aGUgZGVmYXVsdCBhcyBpdCBtYXkgaGF2
ZSBiZWVuCkBAIC0xMTUsNiArMTE5LDcgQEAgYWJvcnRfZ3Vlc3RfZXhpdF9lbmQ6CiAKIHNraXBf
Y2hlY2s6CiAgICAgICAgIG1vdiBwYywgbHIKK0VORFBST0MoYXJjaF9lbnRlcl9oeXBlcnZpc29y
X2Zyb21fZ3Vlc3RfcHJlaXJxKQogCiAgICAgICAgIC8qCiAgICAgICAgICAqIE1hY3JvIHRvIGRl
ZmluZSBhIHRyYXAgZW50cnkuCkBAIC0xNzMsNyArMTc4LDcgQEAgc2tpcF9jaGVjazoKIAogMToK
ICAgICAgICAgLyogVHJhcCBmcm9tIHRoZSBndWVzdCAqLwotICAgICAgICBibCAgICAgIHNhdmVf
Z3Vlc3RfcmVncworICAgICAgICBibCAgICAgIGFyY2hfZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1
ZXN0X3ByZWlycQogICAgICAgICAuaWYgICAgIFxndWVzdF9pZmxhZ3MgIT0gbgogICAgICAgICBj
cHNpZSAgIFxndWVzdF9pZmxhZ3MKICAgICAgICAgLmVuZGlmCkBAIC0zNjMsNyArMzY4LDcgQEAg
cmV0dXJuX3RvX2h5cGVydmlzb3I6CiAgICAgICAgICAqIEhWQkFSIHZlcnkgbGF0ZS4KICAgICAg
ICAgICoKICAgICAgICAgICogRGVmYXVsdCB2ZWN0b3JzIHRhYmxlIHdpbGwgYmUgcmVzdG9yZWQg
b24gZXhpdCAoc2VlCi0gICAgICAgICAqIHNhdmVfZ3Vlc3RfcmVncykuCisgICAgICAgICAqIGFy
Y2hfZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0X3ByZWlycSkuCiAgICAgICAgICAqLwogICAg
ICAgICBtb3YgcjksICMwICAgICAgICAgICAgICAgICAgICAgIC8qIHZlY3RvciB0YWJsZXMgPSBO
VUxMICovCiAgICAgICAgIC8qCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
