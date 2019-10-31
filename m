Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E0FEB39D
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 16:12:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQC5S-0007NR-Sb; Thu, 31 Oct 2019 15:10:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=msrb=YY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iQC5R-0007J5-Cf
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 15:10:09 +0000
X-Inumbo-ID: 7e826990-fbf0-11e9-beca-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7e826990-fbf0-11e9-beca-bc764e2007e4;
 Thu, 31 Oct 2019 15:09:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CA497FA;
 Thu, 31 Oct 2019 08:09:54 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (unknown [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E66A3F71E;
 Thu, 31 Oct 2019 08:09:53 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 31 Oct 2019 15:09:20 +0000
Message-Id: <20191031150922.22938-18-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191031150922.22938-1-julien.grall@arm.com>
References: <20191031150922.22938-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 v4 17/19] xen/arm: asm: Replace use of
 ALTERNATIVE with alternative_if
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

VXNpbmcgYWx0ZXJuYXRpdmVfaWYgbWFrZXMgdGhlIGNvZGUgYSBiaXQgbW9yZSBzdHJlYW1saW5l
ZC4KClRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIHVzZSB0aGUgbmV3IGF1dG8tbm9wIGluZnJhc3Ry
dWN0dXJlIHRvIGF2b2lkCmNvdW50aW5nIHRoZSBudW1iZXIgb2Ygbm9wIGluIHRoZSBlbHNlIHBh
cnQgZm9yIGFyY2gvYXJtL2FybTY0L2VudHJ5LlMKClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgotLS0KICAgIFRoaXMgaXMgcHJldHR5IG11Y2ggYSBt
YXR0ZXIgb2YgdGFzdGUsIGJ1dCBhdCBsZWFzdCBmb3IgYXJtNjQgdGhpcwogICAgYWxsb3dzIHVz
IHRvIHVzZSB0aGUgYXV0by1ub3AgaW5mcmFzdHJ1Y3R1cmUuIFNvIHRoZSBhcm0zMiBpcyBtb3Jl
CiAgICB0byBrZWVwIGlubGluZSB3aXRoIGFybTY0LgoKICAgIENoYW5nZXMgaW4gdjQ6CiAgICAg
ICAgLSBBZGQgU3RlZmFubydzIHJldmlld2VkLWJ5CgogICAgQ2hhbmdlcyBpbiB2MzoKICAgICAg
ICAtIEZpeCBidWlsZCBvbiBBcm0zMgoKICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBDb3Jy
ZWN0bHkgdXNlIGFsdGVybmF0aXZlX2lmeywgX25vdH0KLS0tCiB4ZW4vYXJjaC9hcm0vYXJtMzIv
ZW50cnkuUyB8IDcgKysrKy0tLQogeGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMgfCA4ICsrKysr
LS0tCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvZW50cnkuUyBiL3hlbi9hcmNoL2FybS9hcm0z
Mi9lbnRyeS5TCmluZGV4IDBhOWMyNDhlZTIuLjM0MTU2YzQ0MDQgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL2FybS9hcm0zMi9lbnRyeS5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9lbnRyeS5TCkBA
IC01OSw5ICs1OSwxMCBAQCBhcmNoX2VudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdF9wcmVpcnE6
CiAgICAgICAgICAqIElmIHRoZSBTS0lQX1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUIGhh
cyBiZWVuIHNldCBpbiB0aGUgY3B1CiAgICAgICAgICAqIGZlYXR1cmUsIHRoZSBjaGVja2luZyBv
ZiBwZW5kaW5nIFNFcnJvcnMgd2lsbCBiZSBza2lwcGVkLgogICAgICAgICAgKi8KLSAgICAgICAg
QUxURVJOQVRJVkUoIm5vcCIsCi0gICAgICAgICAgICAgICAgICAgICJiIHNraXBfY2hlY2siLAot
ICAgICAgICAgICAgICAgICAgICBTS0lQX1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUKQor
ICAgICAgICBhbHRlcm5hdGl2ZV9pZiBTS0lQX1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElU
CisgICAgICAgIGIgICBza2lwX2NoZWNrCisgICAgICAgIGFsdGVybmF0aXZlX2Vsc2Vfbm9wX2Vu
ZGlmCisKICAgICAgICAgLyoKICAgICAgICAgICogU3RhcnQgdG8gY2hlY2sgcGVuZGluZyB2aXJ0
dWFsIGFib3J0IGluIHRoZSBnYXAgb2YgR3Vlc3QgLT4gSFlQCiAgICAgICAgICAqIHdvcmxkIHN3
aXRjaC4KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TIGIveGVuL2FyY2gv
YXJtL2FybTY0L2VudHJ5LlMKaW5kZXggZDRmYjVmZGMxYy4uYThiYTdhYjk2MSAxMDA2NDQKLS0t
IGEveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMKKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2Vu
dHJ5LlMKQEAgLTE4OCw5ICsxODgsMTEgQEAKICAgICAgICAgICogaXMgbm90IHNldC4gSWYgYSB2
U0Vycm9yIHRvb2sgcGxhY2UsIHRoZSBpbml0aWFsIGV4Y2VwdGlvbiB3aWxsIGJlCiAgICAgICAg
ICAqIHNraXBwZWQuIEV4aXQgQVNBUAogICAgICAgICAgKi8KLSAgICAgICAgQUxURVJOQVRJVkUo
ImJsIGNoZWNrX3BlbmRpbmdfdnNlcnJvcjsgY2JueiB4MCwgMWYiLAotICAgICAgICAgICAgICAg
ICAgICAibm9wOyBub3AiLAotICAgICAgICAgICAgICAgICAgICBTS0lQX1NZTkNIUk9OSVpFX1NF
UlJPUl9FTlRSWV9FWElUKQorICAgICAgICBhbHRlcm5hdGl2ZV9pZl9ub3QgU0tJUF9TWU5DSFJP
TklaRV9TRVJST1JfRU5UUllfRVhJVAorICAgICAgICBibCAgICAgIGNoZWNrX3BlbmRpbmdfdnNl
cnJvcgorICAgICAgICBjYm56ICAgIHgwLCAxZgorICAgICAgICBhbHRlcm5hdGl2ZV9lbHNlX25v
cF9lbmRpZgorCiAgICAgICAgIGJsICAgICAgZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0X3By
ZWlycQogICAgICAgICBtc3IgICAgIGRhaWZjbHIsIFxpZmxhZ3MKICAgICAgICAgYmwgICAgICBl
bnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3QKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
