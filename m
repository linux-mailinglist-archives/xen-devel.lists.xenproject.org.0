Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1B48F7B0
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 01:39:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyPIC-0004aS-1D; Thu, 15 Aug 2019 23:36:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HmHk=WL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hyPI9-0004YI-Vh
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 23:36:26 +0000
X-Inumbo-ID: 7efa37f8-bfb5-11e9-b90c-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7efa37f8-bfb5-11e9-b90c-bc764e2007e4;
 Thu, 15 Aug 2019 23:36:25 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9ECCB2173E;
 Thu, 15 Aug 2019 23:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565912184;
 bh=AThwz4wThr4JPginnrcX3zZoiJJtt2Vt6Zaw7pTFK9o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ClFHFJFAkBu9scenHqEGBm63w970w+Cpw1/Ui2T35T2NVxwNgqefVIoifBBvj0xF8
 vAqr6Nmy/Q+WrIq5nGJJMR/nKaq5ixqQo5n7yAeuaxawrvqRH+hcCRWd4dGlqXJ7G7
 oCiO8tin/HjzIsCl6HFkksKWi2qJEwrQJlee7iYo=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Thu, 15 Aug 2019 16:36:17 -0700
Message-Id: <20190815233618.31630-7-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1908151634170.8737@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908151634170.8737@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v6 7/8] xen/arm: don't iomem_permit_access for
 reserved-memory regions
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG9uJ3QgYWxsb3cgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgdG8gYmUgcmVtYXBwZWQgaW50byBh
bnkgdW5wcml2aWxlZ2VkCmd1ZXN0cywgdW50aWwgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgYXJl
IHByb3Blcmx5IHN1cHBvcnRlZCBpbiBYZW4uIEZvcgpub3csIGRvIG5vdCBjYWxsIGlvbWVtX3Bl
cm1pdF9hY2Nlc3Mgb24gdGhlbSwgYmVjYXVzZSBnaXZpbmcKaW9tZW1fcGVybWl0X2FjY2VzcyB0
byBkb20wIG1lYW5zIHRoYXQgdGhlIHRvb2xzdGFjayB3aWxsIGJlIGFibGUgdG8KYXNzaWduIHRo
ZSByZWdpb24gdG8gYSBkb21VLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
dGVmYW5vc0B4aWxpbnguY29tPgotLS0KCkNoYW5nZXMgaW4gdjY6Ci0gY29tcGFyZSBhZ2FpbnN0
ICIvcmVzZXJ2ZWQtbWVtb3J5LyIKCkNoYW5nZXMgaW4gdjU6Ci0gZml4IGNoZWNrIGNvbmRpdGlv
bgotIHVzZSBzdHJuaWNtcAotIHJldHVybiBlcnJvcgotIGltcHJvdmUgY29tbWl0IG1lc3NhZ2UK
CkNoYW5nZXMgaW4gdjQ6Ci0gY29tcGFyZSB0aGUgcGFyZW50IG5hbWUgd2l0aCByZXNlcnZlZC1t
ZW1vcnkKLSB1c2UgZHRfbm9kZV9jbXAKCkNoYW5nZXMgaW4gdjM6Ci0gbmV3IHBhdGNoCi0tLQog
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMjQgKysrKysrKysrKysrKysrKy0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMKaW5kZXggNGM4NDA0MTU1YS4uNjczZmZhNDUzZiAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jCisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwpA
QCAtMTE1NSwxNSArMTE1NSwyMyBAQCBzdGF0aWMgaW50IF9faW5pdCBtYXBfcmFuZ2VfdG9fZG9t
YWluKGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2LAogICAgIGJvb2wgbmVlZF9tYXBw
aW5nID0gIWR0X2RldmljZV9mb3JfcGFzc3Rocm91Z2goZGV2KTsKICAgICBpbnQgcmVzOwogCi0g
ICAgcmVzID0gaW9tZW1fcGVybWl0X2FjY2VzcyhkLCBwYWRkcl90b19wZm4oYWRkciksCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90b19wZm4oUEFHRV9BTElHTihhZGRyICsg
bGVuIC0gMSkpKTsKLSAgICBpZiAoIHJlcyApCisgICAgLyoKKyAgICAgKiBEb24ndCBnaXZlIGlv
bWVtIHBlcm1pc3Npb25zIGZvciByZXNlcnZlZC1tZW1vcnkgcmFuZ2VzIHRvIGRvbVVzCisgICAg
ICogdW50aWwgcmVzZXJ2ZWQtbWVtb3J5IHN1cHBvcnQgaXMgY29tcGxldGUuCisgICAgICovCisg
ICAgaWYgKCBzdHJuaWNtcChkdF9ub2RlX2Z1bGxfbmFtZShkZXYpLCAiL3Jlc2VydmVkLW1lbW9y
eS8iLAorICAgICAgICAgc3RybGVuKCIvcmVzZXJ2ZWQtbWVtb3J5LyIpKSAhPSAwICkKICAgICB7
Ci0gICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJVbmFibGUgdG8gcGVybWl0IHRvIGRvbSVkIGFj
Y2VzcyB0byIKLSAgICAgICAgICAgICAgICIgMHglIlBSSXg2NCIgLSAweCUiUFJJeDY0IlxuIiwK
LSAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwKLSAgICAgICAgICAgICAgIGFkZHIgJiBQQUdF
X01BU0ssIFBBR0VfQUxJR04oYWRkciArIGxlbikgLSAxKTsKLSAgICAgICAgcmV0dXJuIHJlczsK
KyAgICAgICAgcmVzID0gaW9tZW1fcGVybWl0X2FjY2VzcyhkLCBwYWRkcl90b19wZm4oYWRkciks
CisgICAgICAgICAgICAgICAgcGFkZHJfdG9fcGZuKFBBR0VfQUxJR04oYWRkciArIGxlbiAtIDEp
KSk7CisgICAgICAgIGlmICggcmVzICkKKyAgICAgICAgeworICAgICAgICAgICAgcHJpbnRrKFhF
TkxPR19FUlIgIlVuYWJsZSB0byBwZXJtaXQgdG8gZG9tJWQgYWNjZXNzIHRvIgorICAgICAgICAg
ICAgICAgICAgICAiIDB4JSJQUkl4NjQiIC0gMHglIlBSSXg2NCJcbiIsCisgICAgICAgICAgICAg
ICAgICAgIGQtPmRvbWFpbl9pZCwKKyAgICAgICAgICAgICAgICAgICAgYWRkciAmIFBBR0VfTUFT
SywgUEFHRV9BTElHTihhZGRyICsgbGVuKSAtIDEpOworICAgICAgICAgICAgcmV0dXJuIHJlczsK
KyAgICAgICAgfQogICAgIH0KIAogICAgIGlmICggbmVlZF9tYXBwaW5nICkKLS0gCjIuMTcuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
