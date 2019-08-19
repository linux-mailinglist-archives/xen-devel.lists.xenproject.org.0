Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A966694BEC
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 19:45:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzlh4-0007g5-61; Mon, 19 Aug 2019 17:43:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TEA=WP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hzlh1-0007dN-QN
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 17:43:43 +0000
X-Inumbo-ID: e2fbe7ce-c2a8-11e9-b90c-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2fbe7ce-c2a8-11e9-b90c-bc764e2007e4;
 Mon, 19 Aug 2019 17:43:43 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8622B22CF6;
 Mon, 19 Aug 2019 17:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566236622;
 bh=WJe3NZNzl8mWTGRxKT1hBPJIFxK3oQ4T6sjD8yfn4i4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1VyVhwG5mtANkR0J2DUZPylFwFS8MJK96pdqg8tRChsbKUWHajfTxhMFY7d7FY9V6
 eLJa2XGcx2yWjkivZDvoBr+h2sOMvhVh77D0OncteX2YGGMG6rQJK5eZ7FPuHEPd88
 kQdSsB+26hvkya9c0aDjTtYTkWNcNQzssQoUFneE=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 19 Aug 2019 10:43:37 -0700
Message-Id: <20190819174338.10466-7-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1908191011060.20094@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908191011060.20094@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v7 7/8] xen/arm: don't iomem_permit_access for
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
dGVmYW5vc0B4aWxpbnguY29tPgotLS0KCkNoYW5nZXMgaW4gdjc6Ci0gdXBkYXRlIGluLWNvZGUg
Y29tbWVudAoKQ2hhbmdlcyBpbiB2NjoKLSBjb21wYXJlIGFnYWluc3QgIi9yZXNlcnZlZC1tZW1v
cnkvIgoKQ2hhbmdlcyBpbiB2NToKLSBmaXggY2hlY2sgY29uZGl0aW9uCi0gdXNlIHN0cm5pY21w
Ci0gcmV0dXJuIGVycm9yCi0gaW1wcm92ZSBjb21taXQgbWVzc2FnZQoKQ2hhbmdlcyBpbiB2NDoK
LSBjb21wYXJlIHRoZSBwYXJlbnQgbmFtZSB3aXRoIHJlc2VydmVkLW1lbW9yeQotIHVzZSBkdF9u
b2RlX2NtcAoKQ2hhbmdlcyBpbiB2MzoKLSBuZXcgcGF0Y2gKLS0tCiB4ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMgfCAyNSArKysrKysrKysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTcgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKaW5kZXgg
NGM4NDA0MTU1YS4uYjQyNjBmMWZjMiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jCisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwpAQCAtMTE1NSwxNSArMTE1
NSwyNCBAQCBzdGF0aWMgaW50IF9faW5pdCBtYXBfcmFuZ2VfdG9fZG9tYWluKGNvbnN0IHN0cnVj
dCBkdF9kZXZpY2Vfbm9kZSAqZGV2LAogICAgIGJvb2wgbmVlZF9tYXBwaW5nID0gIWR0X2Rldmlj
ZV9mb3JfcGFzc3Rocm91Z2goZGV2KTsKICAgICBpbnQgcmVzOwogCi0gICAgcmVzID0gaW9tZW1f
cGVybWl0X2FjY2VzcyhkLCBwYWRkcl90b19wZm4oYWRkciksCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYWRkcl90b19wZm4oUEFHRV9BTElHTihhZGRyICsgbGVuIC0gMSkpKTsKLSAg
ICBpZiAoIHJlcyApCisgICAgLyoKKyAgICAgKiByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyBhcmUg
UkFNIGNhcnZlZCBvdXQgZm9yIGEgc3BlY2lhbCBwdXJwb3NlLgorICAgICAqIFRoZXkgYXJlIG5v
dCBNTUlPIGFuZCB0aGVyZWZvcmUgYSBkb21haW4gc2hvdWxkIG5vdCBiZSBhYmxlIHRvCisgICAg
ICogbWFuYWdlIHRoZW0gdmlhIHRoZSBJT01FTSBpbnRlcmZhY2UuCisgICAgICovCisgICAgaWYg
KCBzdHJuaWNtcChkdF9ub2RlX2Z1bGxfbmFtZShkZXYpLCAiL3Jlc2VydmVkLW1lbW9yeS8iLAor
ICAgICAgICAgc3RybGVuKCIvcmVzZXJ2ZWQtbWVtb3J5LyIpKSAhPSAwICkKICAgICB7Ci0gICAg
ICAgIHByaW50ayhYRU5MT0dfRVJSICJVbmFibGUgdG8gcGVybWl0IHRvIGRvbSVkIGFjY2VzcyB0
byIKLSAgICAgICAgICAgICAgICIgMHglIlBSSXg2NCIgLSAweCUiUFJJeDY0IlxuIiwKLSAgICAg
ICAgICAgICAgIGQtPmRvbWFpbl9pZCwKLSAgICAgICAgICAgICAgIGFkZHIgJiBQQUdFX01BU0ss
IFBBR0VfQUxJR04oYWRkciArIGxlbikgLSAxKTsKLSAgICAgICAgcmV0dXJuIHJlczsKKyAgICAg
ICAgcmVzID0gaW9tZW1fcGVybWl0X2FjY2VzcyhkLCBwYWRkcl90b19wZm4oYWRkciksCisgICAg
ICAgICAgICAgICAgcGFkZHJfdG9fcGZuKFBBR0VfQUxJR04oYWRkciArIGxlbiAtIDEpKSk7Cisg
ICAgICAgIGlmICggcmVzICkKKyAgICAgICAgeworICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19F
UlIgIlVuYWJsZSB0byBwZXJtaXQgdG8gZG9tJWQgYWNjZXNzIHRvIgorICAgICAgICAgICAgICAg
ICAgICAiIDB4JSJQUkl4NjQiIC0gMHglIlBSSXg2NCJcbiIsCisgICAgICAgICAgICAgICAgICAg
IGQtPmRvbWFpbl9pZCwKKyAgICAgICAgICAgICAgICAgICAgYWRkciAmIFBBR0VfTUFTSywgUEFH
RV9BTElHTihhZGRyICsgbGVuKSAtIDEpOworICAgICAgICAgICAgcmV0dXJuIHJlczsKKyAgICAg
ICAgfQogICAgIH0KIAogICAgIGlmICggbmVlZF9tYXBwaW5nICkKLS0gCjIuMTcuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
