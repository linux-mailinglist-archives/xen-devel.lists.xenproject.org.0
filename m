Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8742D11BEF0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 22:16:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if9IO-0007Pu-63; Wed, 11 Dec 2019 21:13:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JtnU=2B=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1if9IM-0007Pp-JK
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 21:13:18 +0000
X-Inumbo-ID: 07f9db9c-1c5b-11ea-b6f1-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 07f9db9c-1c5b-11ea-b6f1-bc764e2007e4;
 Wed, 11 Dec 2019 21:13:09 +0000 (UTC)
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 11 Dec 2019 16:13:00 -0500
Message-ID: <20191211211302.117395-1-jeff.kubascik@dornerworks.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.27.13.171]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: [Xen-devel] [PATCH v3 0/2] xen/arm: physical timer improvements
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBzZXQgaW1wcm92ZXMgdGhlIGVtdWxhdGlvbiBvZiB0aGUgcGh5c2ljYWwgdGlt
ZXIgYnkgcmVtb3ZpbmcgdGhlCnBoeXNpY2FsIHRpbWVyIG9mZnNldCBhbmQgc2lnbiBleHRlbmQg
dGhlIFRpbWVyVmFsdWUgdG8gYmV0dGVyIG1hdGNoIHRoZQpiZWhhdmlvciBkZXNjcmliZWQgaW4g
dGhlIEFSTXY4IFJlZmVyZW5jZSBNYW51YWwgKEFSTSBEREkgMDQ4N0UuYSksIHNlY3Rpb24KRDEx
LjIuNC4KCkNoYW5nZXMgaW4gdjI6Ci0gVXBkYXRlIGNvbW1pdCBtZXNzYWdlIHRvIHNwZWNpZnkg
cmVmZXJlbmNlIG1hbnVhbCB2ZXJzaW9uIGFuZCBzZWN0aW9uCi0gQ2hhbmdlIHBoeXNpY2FsIHRp
bWVyIGN2YWwgdG8gaG9sZCBoYXJkd2FyZSB2YWx1ZQotIE1ha2Ugc3VyZSB0byBzaWduIGV4dGVu
ZCBUaW1lclZhbHVlIG9uIHdyaXRlcy4gVGhpcyB3YXMgZG9uZSBieSBmaXJzdAogIGNhc3Rpbmcg
dGhlIHIgcG9pbnRlciB0byAoaW50MzJfdCAqKSwgZGVyZWZlcmVuY2luZyBpdCwgdGhlbiBjYXN0
aW5nCiAgdG8gdWludDY0X3QuIFBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGVyZSBpcyBhIG1vcmUg
Y29ycmVjdCB3YXkgdG8gZG8KICB0aGlzCgpDaGFuZ2VzIGluIHYzOgotIFNwbGl0IFRpbWVyVmFs
dWUgc2lnbiBleHRlbnNpb24gZml4IGludG8gc2VwYXJhdGUgcGF0Y2gKLSBVcGRhdGUgY29tbWl0
IG1lc3NhZ2UgdG8gbWVudGlvbiBwaHlzaWNhbCB0aW1lciBjbGVhbnVwCi0gUmVtb3ZlZCBwaHlz
aWNhbCB0aW1lciBjdmFsIGluaXRpYWxpemF0aW9uIGxpbmUKLSBDaGFuZ2VkIFRpbWVyVmFsdWUg
c2lnbiBleHRlbnNpb24gdG8gKHVpbnQ2NF90KShpbnQzMl90KSpyCi0gQWNjb3VudCBmb3IgY29u
ZGl0aW9uIHdoZXJlIGN2YWwgPCBib290X2NvdW50CgpKZWZmIEt1YmFzY2lrICgyKToKICB4ZW4v
YXJtOiByZW1vdmUgcGh5c2ljYWwgdGltZXIgb2Zmc2V0CiAgeGVuL2FybTogc2lnbiBleHRlbmQg
d3JpdGVzIHRvIFRpbWVyVmFsdWUKCiB4ZW4vYXJjaC9hcm0vdnRpbWVyLmMgICAgICAgIHwgMzQg
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9k
b21haW4uaCB8ICAzIC0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxOSBk
ZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
