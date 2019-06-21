Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634914F1C1
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2019 01:58:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heTOB-0004Xu-A5; Fri, 21 Jun 2019 23:56:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hG5x=UU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1heTO8-0004Vh-Lx
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 23:56:12 +0000
X-Inumbo-ID: 25a31d42-9480-11e9-85fb-0f3bc153b142
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25a31d42-9480-11e9-85fb-0f3bc153b142;
 Fri, 21 Jun 2019 23:56:12 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 889D1215EA;
 Fri, 21 Jun 2019 23:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561161371;
 bh=OsGLz72IL7w4kLE/mYGoRyRf+rKLUXKwExD8YZIlHy4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wsczEblBUtdSGub7SY+SlIIxXX3HSx+EUJI4j7onjhTqkBp20j7xdu2yhmxyyFOWp
 mkRUzUKrPgkDC8eVP/gzqwissaFe128uuHzwELB+QobsDaxHlWoCii1xyY7jw3+3Yp
 YspDlTwmo1/zlP3OlFexshTdWSB6pbxdQpL8H0dA=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 21 Jun 2019 16:56:08 -0700
Message-Id: <20190621235608.2153-6-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1906211648280.25730@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906211648280.25730@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v3 6/6] xen/arm: add reserved-memory regions to
 the dom0 memory node
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
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMgYXJlIGF1dG9tYXRpY2FsbHkgcmVtYXBwZWQgdG8gZG9t
MC4gVGhlaXIgZGV2aWNlCnRyZWUgbm9kZXMgYXJlIGFsc28gYWRkZWQgdG8gZG9tMCBkZXZpY2Ug
dHJlZS4gSG93ZXZlciwgdGhlIGRvbTAgbWVtb3J5Cm5vZGUgaXMgbm90IGN1cnJlbnRseSBleHRl
bmRlZCB0byBjb3ZlciB0aGUgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMKcmFuZ2VzIGFzIHJlcXVp
cmVkIGJ5IHRoZSBzcGVjLiAgVGhpcyBjb21taXQgZml4ZXMgaXQuCgpTaWduZWQtb2ZmLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Ci0tLQogeGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jIHwgMTcgKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
NiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCmluZGV4IDc2ZGQ0
YmY2ZjkuLjUwNDdlYjRjMjggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
YworKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKQEAgLTY0Myw3ICs2NDMsOCBAQCBz
dGF0aWMgaW50IF9faW5pdCBtYWtlX21lbW9yeV9ub2RlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQs
CiB7CiAgICAgaW50IHJlcywgaTsKICAgICBpbnQgcmVnX3NpemUgPSBhZGRyY2VsbHMgKyBzaXpl
Y2VsbHM7Ci0gICAgaW50IG5yX2NlbGxzID0gcmVnX3NpemUqa2luZm8tPm1lbS5ucl9iYW5rczsK
KyAgICBpbnQgbnJfY2VsbHMgPSByZWdfc2l6ZSAqIChraW5mby0+bWVtLm5yX2JhbmtzICsgKGlz
X2hhcmR3YXJlX2RvbWFpbihkKSA/CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9v
dGluZm8ucmVzZXJ2ZWRfbWVtLm5yX2JhbmtzIDogMCkpOwogICAgIF9fYmUzMiByZWdbTlJfTUVN
X0JBTktTICogNCAvKiBXb3JzdCBjYXNlIGFkZHJjZWxscyArIHNpemVjZWxscyAqL107CiAgICAg
X19iZTMyICpjZWxsczsKIApAQCAtNjczLDYgKzY3NCwyMCBAQCBzdGF0aWMgaW50IF9faW5pdCBt
YWtlX21lbW9yeV9ub2RlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsCiAgICAgICAgIGR0X2NoaWxk
X3NldF9yYW5nZSgmY2VsbHMsIGFkZHJjZWxscywgc2l6ZWNlbGxzLCBzdGFydCwgc2l6ZSk7CiAg
ICAgfQogCisgICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4oZCkgKQorICAgIHsKKyAgICAgICAg
Zm9yICggaSA9IDA7IGkgPCBib290aW5mby5yZXNlcnZlZF9tZW0ubnJfYmFua3M7IGkrKyApCisg
ICAgICAgIHsKKyAgICAgICAgICAgIHU2NCBzdGFydCA9IGJvb3RpbmZvLnJlc2VydmVkX21lbS5i
YW5rW2ldLnN0YXJ0OworICAgICAgICAgICAgdTY0IHNpemUgPSBib290aW5mby5yZXNlcnZlZF9t
ZW0uYmFua1tpXS5zaXplOworCisgICAgICAgICAgICBkdF9kcHJpbnRrKCIgIEJhbmsgJWQ6ICUj
IlBSSXg2NCItPiUjIlBSSXg2NCJcbiIsCisgICAgICAgICAgICAgICAgICAgIGksIHN0YXJ0LCBz
dGFydCArIHNpemUpOworCisgICAgICAgICAgICBkdF9jaGlsZF9zZXRfcmFuZ2UoJmNlbGxzLCBh
ZGRyY2VsbHMsIHNpemVjZWxscywgc3RhcnQsIHNpemUpOworICAgICAgICB9CisgICAgfQorCiAg
ICAgcmVzID0gZmR0X3Byb3BlcnR5KGZkdCwgInJlZyIsIHJlZywgbnJfY2VsbHMgKiBzaXplb2Yo
KnJlZykpOwogICAgIGlmICggcmVzICkKICAgICAgICAgcmV0dXJuIHJlczsKLS0gCjIuMTcuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
