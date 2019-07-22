Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B7B70BD0
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:43:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2U-0002Qg-WC; Mon, 22 Jul 2019 21:40:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2T-0002Ps-7e
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:09 +0000
X-Inumbo-ID: 46acabbc-acc9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 46acabbc-acc9-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 21:40:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68F93153B;
 Mon, 22 Jul 2019 14:40:08 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6F463F71F;
 Mon, 22 Jul 2019 14:40:07 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:26 +0100
Message-Id: <20190722213958.5761-4-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 03/35] xen/arm64: head: Don't clobber x30/lr
 in the macro PRINT
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

VGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgdGhlIG1hY3JvIFBSSU5UIHdpbGwgY2xvYmJl
ciB4MzAvbHIuIFRoaXMKbWVhbnMgdGhlIHVzZXIgc2hvdWxkIHNhdmUgbHIgaWYgaXQgY2FyZXMg
YWJvdXQgaXQuCgpGb2xsb3ctdXAgcGF0Y2hlcyB3aWxsIGludHJvZHVjZSBtb3JlIHVzZSBvZiBQ
UklOVCBpbiBwbGFjZSB3aGVyZSBscgpzaG91bGQgYmUgcHJlc2VydmVkLiBSYXRoZXIgdGhhbiBy
ZXF1aXJpbmcgYWxsIHRoZSB1c2VycyB0byBwcmVzZXJ2ZQpsciwgdGhlIG1hY3JvIFBSSU5UIGlz
IG1vZGlmaWVkIHRvIHNhdmUgYW5kIHJlc3RvcmUgaXQuCgpXaGlsZSB0aGUgY29tbWVudCBzdGF0
ZSB4MyB3aWxsIGJlIGNsb2JiZXJlZCwgdGhpcyBpcyBub3QgdGhlIGNhc2UuIFNvClBSSU5UIHdp
bGwgdXNlIHgzIHRvIHByZXNlcnZlIGxyLgoKTGFzdGx5LCB0YWtlIHRoZSBvcHBvcnR1bml0eSB0
byBtb3ZlIHRoZSBjb21tZW50IG9uIHRvcCBvZiBQUklOVCBhbmQgdXNlClBSSU5UIGluIGluaXRf
dWFydC4gQm90aCBjaGFuZ2VzIHdpbGwgYmUgaGVscGZ1bCBpbiBhIGZvbGxvdy11cCBwYXRjaC4K
ClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmll
d2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgotLS0K
ICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBBZGQgU3RlZmFubydzIHJldmlld2VkLWJ5Ci0t
LQogeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDIwICsrKysrKysrKysrKy0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQu
UwppbmRleCBmMmQ3NDQ1ZjZhLi42YWZlODNjMzQ3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0v
YXJtNjQvaGVhZC5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKQEAgLTc4LDEyICs3
OCwxNyBAQAogICogIHgzMCAtIGxyCiAgKi8KIAotLyogTWFjcm8gdG8gcHJpbnQgYSBzdHJpbmcg
dG8gdGhlIFVBUlQsIGlmIHRoZXJlIGlzIG9uZS4KLSAqIENsb2JiZXJzIHgwLXgzLiAqLwogI2lm
ZGVmIENPTkZJR19FQVJMWV9QUklOVEsKLSNkZWZpbmUgUFJJTlQoX3MpICAgICAgICAgICBcCi0g
ICAgICAgIGFkciAgIHgwLCA5OGYgOyAgICAgXAotICAgICAgICBibCAgICBwdXRzICAgIDsgICAg
IFwKKy8qCisgKiBNYWNybyB0byBwcmludCBhIHN0cmluZyB0byB0aGUgVUFSVCwgaWYgdGhlcmUg
aXMgb25lLgorICoKKyAqIENsb2JiZXJzIHgwIC0geDMKKyAqLworI2RlZmluZSBQUklOVChfcykg
ICAgICAgICAgXAorICAgICAgICBtb3YgICB4MywgbHIgOyAgICAgXAorICAgICAgICBhZHIgICB4
MCwgOThmIDsgICAgXAorICAgICAgICBibCAgICBwdXRzICAgIDsgICAgXAorICAgICAgICBtb3Yg
ICBsciwgeDMgOyAgICAgXAogICAgICAgICBST0RBVEFfU1RSKDk4LCBfcykKICNlbHNlIC8qIENP
TkZJR19FQVJMWV9QUklOVEsgKi8KICNkZWZpbmUgUFJJTlQocykKQEAgLTYyMiw5ICs2MjcsOCBA
QCBpbml0X3VhcnQ6CiAjaWZkZWYgRUFSTFlfUFJJTlRLX0lOSVRfVUFSVAogICAgICAgICBlYXJs
eV91YXJ0X2luaXQgeDIzLCAwCiAjZW5kaWYKLSAgICAgICAgYWRyICAgeDAsIDFmCi0gICAgICAg
IGIgICAgIHB1dHMKLVJPREFUQV9TVFIoMSwgIi0gVUFSVCBlbmFibGVkIC1cclxuIikKKyAgICAg
ICAgUFJJTlQoIi0gVUFSVCBlbmFibGVkIC1cclxuIikKKyAgICAgICAgcmV0CiAKIC8qIFByaW50
IGVhcmx5IGRlYnVnIG1lc3NhZ2VzLgogICogeDA6IE51bC10ZXJtaW5hdGVkIHN0cmluZyB0byBw
cmludC4KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
