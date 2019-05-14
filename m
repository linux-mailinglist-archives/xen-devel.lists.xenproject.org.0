Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B512A1C89A
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:26:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWUa-0002YE-I6; Tue, 14 May 2019 12:25:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWUZ-0002X0-3c
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:25:11 +0000
X-Inumbo-ID: 50f2a68a-7643-11e9-92c8-4b21c486e5ca
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 50f2a68a-7643-11e9-92c8-4b21c486e5ca;
 Tue, 14 May 2019 12:25:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 495AE15BE;
 Tue, 14 May 2019 05:25:10 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 383323F71E;
 Tue, 14 May 2019 05:25:09 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:24:42 +0100
Message-Id: <20190514122456.28559-6-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514122456.28559-1-julien.grall@arm.com>
References: <20190514122456.28559-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART2 RESEND v2 05/19] xen/arm: Remove
 parameter cpuid from start_xen
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

VGhlIHBhcmFtZXRlciBjcHVpZCBpcyBub3QgdXNlZCBieSBzdGFydF94ZW4uIFNvIHJlbW92ZSBp
dC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cgot
LS0KICAgIC0gUmUtb3JkZXIgdGhlIHBhdGNoIHdpdGggInhlbi9hcm06IFJld29yayBzZWNvbmRh
cnlfc3RhcnQKICAgIHByb3RvdHlwZSIKLS0tCiB4ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIHwg
MSAtCiB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgMSAtCiB4ZW4vYXJjaC9hcm0vc2V0dXAu
YyAgICAgIHwgMyArLS0KIDMgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNo
L2FybS9hcm0zMi9oZWFkLlMKaW5kZXggOGE5ODYwNzQ1OS4uY2I4YTNiZjgyOSAxMDA2NDQKLS0t
IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVh
ZC5TCkBAIC00NDcsNyArNDQ3LDYgQEAgbGF1bmNoOgogICAgICAgICBzdWIgICBzcCwgI0NQVUlO
Rk9fc2l6ZW9mICAgIC8qIE1ha2Ugcm9vbSBmb3IgQ1BVIHNhdmUgcmVjb3JkICovCiAgICAgICAg
IG1vdiAgIHIwLCByMTAgICAgICAgICAgICAgICAgLyogTWFyc2hhbCBhcmdzOiAtIHBoeXNfb2Zm
c2V0ICovCiAgICAgICAgIG1vdiAgIHIxLCByOCAgICAgICAgICAgICAgICAgLyogICAgICAgICAg
ICAgICAtIERUQiBhZGRyZXNzICovCi0gICAgICAgIG1vdiAgIHIyLCByNyAgICAgICAgICAgICAg
ICAgLyogICAgICAgICAgICAgICAtIENQVSBJRCAqLwogICAgICAgICB0ZXEgICByMTIsICMwCiAg
ICAgICAgIGJlcSAgIHN0YXJ0X3hlbiAgICAgICAgICAgICAgLyogYW5kIGRpc2FwcGVhciBpbnRv
IHRoZSBsYW5kIG9mIEMgKi8KICAgICAgICAgYiAgICAgc3RhcnRfc2Vjb25kYXJ5ICAgICAgICAv
KiAodG8gdGhlIGFwcHJvcHJpYXRlIGVudHJ5IHBvaW50KSAqLwpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKaW5kZXggNGZl
OTA0YzUxZC4uMDc1MDEzODc4ZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQu
UworKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCkBAIC01ODQsNyArNTg0LDYgQEAgbGF1
bmNoOgogCiAgICAgICAgIG1vdiAgIHgwLCB4MjAgICAgICAgICAgICAgICAgLyogTWFyc2hhbCBh
cmdzOiAtIHBoeXNfb2Zmc2V0ICovCiAgICAgICAgIG1vdiAgIHgxLCB4MjEgICAgICAgICAgICAg
ICAgLyogICAgICAgICAgICAgICAtIEZEVCAqLwotICAgICAgICBtb3YgICB4MiwgeDI0ICAgICAg
ICAgICAgICAgIC8qICAgICAgICAgICAgICAgLSBDUFUgSUQgKi8KICAgICAgICAgY2JueiAgeDIy
LCAxZgogICAgICAgICBiICAgICBzdGFydF94ZW4gICAgICAgICAgICAgIC8qIGFuZCBkaXNhcHBl
YXIgaW50byB0aGUgbGFuZCBvZiBDICovCiAxOgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Nl
dHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwppbmRleCBmYWFmMDI5Yjk5Li4yZjcxNGQ4YjM3
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYworKysgYi94ZW4vYXJjaC9hcm0vc2V0
dXAuYwpAQCAtNzMzLDggKzczMyw3IEBAIHNpemVfdCBfX3JlYWRfbW9zdGx5IGRjYWNoZV9saW5l
X2J5dGVzOwogCiAvKiBDIGVudHJ5IHBvaW50IGZvciBib290IENQVSAqLwogdm9pZCBfX2luaXQg
c3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgYm9vdF9waHlzX29mZnNldCwKLSAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIGZkdF9wYWRkciwKLSAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nIGNwdWlkKQorICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
ZmR0X3BhZGRyKQogewogICAgIHNpemVfdCBmZHRfc2l6ZTsKICAgICBpbnQgY3B1cywgaTsKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
