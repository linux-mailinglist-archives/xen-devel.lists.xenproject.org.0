Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64818FE622
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 21:03:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhmp-0005bk-JB; Fri, 15 Nov 2019 20:01:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NJS8=ZH=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iVhmo-0005bM-CW
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 20:01:42 +0000
X-Inumbo-ID: b4c74a40-07e2-11ea-adbe-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b4c74a40-07e2-11ea-adbe-bc764e2007e4;
 Fri, 15 Nov 2019 20:01:28 +0000 (UTC)
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 15 Nov 2019 15:01:08 -0500
Message-ID: <20191115200115.44890-5-stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
MIME-Version: 1.0
X-Originating-IP: [172.27.14.58]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: [Xen-devel] [XEN PATCH v3 04/11] xen: arm: remove is_assignable_irq
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgb25seSBoYWQgMSBjYWxsZXIuCgpSZXZlcnNlIHRoZSBjb25kaXRpb24gZm9yIHJlYWRhYmls
aXR5LgoKU2lnbmVkLW9mZi1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJh
bmRAZG9ybmVyd29ya3MuY29tPgoKLS0tCnYzOiBuZXcgcGF0Y2gKLS0tCiB4ZW4vYXJjaC9hcm0v
aXJxLmMgICAgICAgIHwgOSArKy0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vaXJxLmggfCAy
IC0tCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaXJxLmMgYi94ZW4vYXJjaC9hcm0vaXJxLmMKaW5kZXgg
OWNjMGE1NDg2Ny4uYzgwNzgyMDI2ZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2lycS5jCisr
KyBiL3hlbi9hcmNoL2FybS9pcnEuYwpAQCAtMzkwLDEyICszOTAsNiBAQCBlcnI6CiAgICAgcmV0
dXJuIHJjOwogfQogCi1ib29sIGlzX2Fzc2lnbmFibGVfaXJxKHVuc2lnbmVkIGludCBpcnEpCi17
Ci0gICAgLyogRm9yIG5vdywgd2UgY2FuIG9ubHkgcm91dGUgU1BJcyB0byB0aGUgZ3Vlc3QgKi8K
LSAgICByZXR1cm4gKGlycSA+PSBOUl9MT0NBTF9JUlFTKSAmJiAoaXJxIDwgZ2ljX251bWJlcl9s
aW5lcygpKTsKLX0KLQogLyoKICAqIE9ubHkgdGhlIGhhcmR3YXJlIGRvbWFpbiBpcyBhbGxvd2Vk
IHRvIHNldCB0aGUgY29uZmlndXJlIHRoZQogICogaW50ZXJydXB0IHR5cGUgZm9yIG5vdy4KQEAg
LTUwOSw3ICs1MDMsOCBAQCBpbnQgcm91dGVfaXJxX3RvX2d1ZXN0KHN0cnVjdCBkb21haW4gKmQs
IHVuc2lnbmVkIGludCB2aXJxLAogICAgICAgICByZXR1cm4gLUVJTlZBTDsKICAgICB9CiAKLSAg
ICBpZiAoICFpc19hc3NpZ25hYmxlX2lycShpcnEpICkKKyAgICAvKiBGb3Igbm93LCB3ZSBjYW4g
b25seSByb3V0ZSBTUElzIHRvIHRoZSBndWVzdCAqLworICAgIGlmICggKGlycSA8IE5SX0xPQ0FM
X0lSUVMpIHx8IChpcnEgPj0gZ2ljX251bWJlcl9saW5lcygpKSApCiAgICAgewogICAgICAgICBw
cmludGsoWEVOTE9HX0dfRVJSICJ0aGUgSVJRJXUgaXMgbm90IHJvdXRhYmxlXG4iLCBpcnEpOwog
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0v
aXJxLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2lycS5oCmluZGV4IGU0NWQ1NzQ1OTguLmUxNDAw
MWI1YzYgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vaXJxLmgKKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLWFybS9pcnEuaApAQCAtNzAsOCArNzAsNiBAQCBzdGF0aWMgaW5saW5lIGJvb2wg
aXNfbHBpKHVuc2lnbmVkIGludCBpcnEpCiAKICNkZWZpbmUgZG9tYWluX3BpcnFfdG9faXJxKGQs
IHBpcnEpIChwaXJxKQogCi1ib29sIGlzX2Fzc2lnbmFibGVfaXJxKHVuc2lnbmVkIGludCBpcnEp
OwotCiB2b2lkIGluaXRfSVJRKHZvaWQpOwogdm9pZCBpbml0X3NlY29uZGFyeV9JUlEodm9pZCk7
CiAKLS0gCjIuMjQuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
