Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF94C278D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 23:00:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF2im-0004ej-Fn; Mon, 30 Sep 2019 20:56:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/D4s=XZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iF2ik-0004ee-Uu
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 20:56:38 +0000
X-Inumbo-ID: cb5453f8-e3c4-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id cb5453f8-e3c4-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 20:56:38 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D1EB224FE;
 Mon, 30 Sep 2019 20:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569876997;
 bh=l4J92BlFI+IbnssZg7FIBDzaige2BuGLjWU+LNK5mWc=;
 h=From:To:Cc:Subject:Date:From;
 b=x+JDGCzIMdsNm3c7IoXpRT17eYYlVKUw3eKmLHuFEfkIPzIRU+anFGPIRVwdwxwyH
 NYY2wHEma50Ae3gZSSOPNL2yDMRbZzoEdwrmnwSy8yinnzvHM4Uyi5NdtPLoTgr/3r
 pETJ04ilDibOD1Sp2glkLTbHPSf7WAwO2IlMO3Ng=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien.grall@arm.com
Date: Mon, 30 Sep 2019 13:56:18 -0700
Message-Id: <20190930205618.29942-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH for-4.13] xen/arm: boot with device trees with
 "mmu-masters" and "iommus"
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
Cc: olekstysh@gmail.com, xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29tZSBEZXZpY2UgVHJlZXMgbWF5IGV4cG9zZSBib3RoIGxlZ2FjeSBTTU1VIGFuZCBnZW5lcmlj
IElPTU1VIGJpbmRpbmdzCnRvZ2V0aGVyLiBIb3dldmVyLCB0aGUgU01NVSBkcml2ZXIgaW4gWGVu
IGlzIG9ubHkgc3VwcG9ydGluZyB0aGUgbGVnYWN5ClNNTVUgYmluZGluZ3MsIGxlYWRpbmcgdG8g
ZmF0YWwgaW5pdGlhbGl6YXRpb24gZXJyb3JzIGF0IGJvb3QgdGltZS4KClRoaXMgcGF0Y2ggZml4
ZXMgdGhlIGJvb3RpbmcgcHJvYmxlbSBieSBhZGRpbmcgYSBjaGVjayB0bwppb21tdV9hZGRfZHRf
ZGV2aWNlOiBpZiB0aGUgWGVuIGRyaXZlciBkb2Vzbid0IHN1cHBvcnQgdGhlIG5ldyBnZW5lcmlj
CmJpbmRpbmdzLCBhbmQgdGhlIGRldmljZSBpcyBiZWhpbmQgYW4gSU9NTVUsIGRvIG5vdCByZXR1
cm4gZXJyb3IuIFRoZQpmb2xsb3dpbmcgaW9tbXVfYXNzaWduX2R0X2RldmljZSBzaG91bGQgc3Vj
Y2VlZC4KClRoaXMgY2hlY2sgd2lsbCBiZWNvbWUgc3VwZXJmbHVvdXMsIGhlbmNlIHJlbW92YWJs
ZSwgb25jZSB0aGUgWGVuIFNNTVUKZHJpdmVyIGdldHMgc3VwcG9ydCBmb3IgdGhlIGdlbmVyaWMg
SU9NTVUgYmluZGluZ3MuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZh
bm8uc3RhYmVsbGluaUB4aWxpbnguY29tPgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Rl
dmljZV90cmVlLmMgfCAxNyArKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE2IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9kZXZpY2VfdHJlZS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZGV2aWNlX3Ry
ZWUuYwppbmRleCBjYzkwMGJhYzcwLi4yN2UyNjViOTM2IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2RldmljZV90cmVlLmMKQEAgLTE1NSw3ICsxNTUsMjIgQEAgaW50IGlvbW11X2FkZF9kdF9kZXZp
Y2Uoc3RydWN0IGR0X2RldmljZV9ub2RlICpucCkKICAgICAgICAgICogdGhlc2UgY2FsbGJhY2sg
aW1wbGVtZW50ZWQuCiAgICAgICAgICAqLwogICAgICAgICBpZiAoICFvcHMtPmFkZF9kZXZpY2Ug
fHwgIW9wcy0+ZHRfeGxhdGUgKQotICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CisgICAgICAg
IHsKKyAgICAgICAgICAgIC8qCisgICAgICAgICAgICAgKiBTb21lIERldmljZSBUcmVlcyBtYXkg
ZXhwb3NlIGJvdGggbGVnYWN5IFNNTVUgYW5kIGdlbmVyaWMKKyAgICAgICAgICAgICAqIElPTU1V
IGJpbmRpbmdzIHRvZ2V0aGVyLiBIb3dldmVyLCB0aGUgU01NVSBkcml2ZXIgaXMgb25seQorICAg
ICAgICAgICAgICogc3VwcG9ydGluZyB0aGUgZm9ybWVyIGFuZCB3aWxsIHByb3RlY3QgdGhlbSBk
dXJpbmcgdGhlCisgICAgICAgICAgICAgKiBpbml0aWFsaXphdGlvbi4gU28gd2UgbmVlZCB0byBz
a2lwIHRoZW0gYW5kIG5vdCByZXR1cm4KKyAgICAgICAgICAgICAqIGVycm9yIGhlcmUuCisgICAg
ICAgICAgICAgKgorICAgICAgICAgICAgICogWFhYOiBUaGlzIGNhbiBiZSBkcm9wcGVkIHdoZW4g
dGhlIFNNTVUgaXMgYWJsZSB0byBkZWFsCisgICAgICAgICAgICAgKiB3aXRoIGdlbmVyaWMgYmlu
ZGluZ3MuCisgICAgICAgICAgICAgKi8KKyAgICAgICAgICAgIGlmICggZHRfZGV2aWNlX2lzX3By
b3RlY3RlZChucCkgKQorICAgICAgICAgICAgICAgIHJldHVybiAwOworICAgICAgICAgICAgZWxz
ZQorICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOworICAgICAgICB9CiAKICAgICAgICAg
aWYgKCAhZHRfZGV2aWNlX2lzX2F2YWlsYWJsZShpb21tdV9zcGVjLm5wKSApCiAgICAgICAgICAg
ICBicmVhazsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
