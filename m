Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC334F1C0
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2019 01:58:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heTOA-0004Ws-Gm; Fri, 21 Jun 2019 23:56:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hG5x=UU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1heTO8-0004VH-FM
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 23:56:12 +0000
X-Inumbo-ID: 2569bcfa-9480-11e9-8576-6743c81f8809
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2569bcfa-9480-11e9-8576-6743c81f8809;
 Fri, 21 Jun 2019 23:56:11 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B2E221537;
 Fri, 21 Jun 2019 23:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561161371;
 bh=qHZHF64P4pb5q8gwpI51OTVazm0uZwlPIOGvXFN2SI0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jfr+Z8RLU60vnjR6yNcGru8bI1x3EfZzAI8J64jYjRQ4RqOnQJaGAQ9m8lAPJVBjU
 fO4XC02r8mIonKy5VxA/Bef8GKLvoUv9jUDxLE3DcbD4BgRrYjcyvb6tRu8eV15I/X
 EnaA0zviB8kGsFohf2KvqxX/XjokN4pujtb3oBuk=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 21 Jun 2019 16:56:07 -0700
Message-Id: <20190621235608.2153-5-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1906211648280.25730@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906211648280.25730@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v3 5/6] xen/arm: don't iomem_permit_access for
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
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG9uJ3QgYWxsb3cgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgdG8gYmUgcmVtYXBwZWQgaW50byBh
bnkgZ3Vlc3RzLAp1bnRpbCByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyBhcmUgcHJvcGVybHkgc3Vw
cG9ydGVkIGluIFhlbi4gRm9yIG5vdywKZG8gbm90IGNhbGwgaW9tZW1fcGVybWl0X2FjY2VzcyBm
b3IgdGhlbS4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGls
aW54LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjQ6Ci0gbmV3IHBhdGNoCi0tLQogeGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jIHwgMjMgKysrKysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwppbmRl
eCBkOTgzNjc3OWQxLi43NmRkNGJmNmY5IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMKKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCkBAIC0xMTU4LDE1ICsx
MTU4LDIyIEBAIHN0YXRpYyBpbnQgX19pbml0IG1hcF9yYW5nZV90b19kb21haW4oY29uc3Qgc3Ry
dWN0IGR0X2RldmljZV9ub2RlICpkZXYsCiAgICAgYm9vbCBuZWVkX21hcHBpbmcgPSAhZHRfZGV2
aWNlX2Zvcl9wYXNzdGhyb3VnaChkZXYpOwogICAgIGludCByZXM7CiAKLSAgICByZXMgPSBpb21l
bV9wZXJtaXRfYWNjZXNzKGQsIHBhZGRyX3RvX3BmbihhZGRyKSwKLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhZGRyX3RvX3BmbihQQUdFX0FMSUdOKGFkZHIgKyBsZW4gLSAxKSkpOwot
ICAgIGlmICggcmVzICkKKyAgICAvKgorICAgICAqIERvbid0IGdpdmUgaW9tZW0gcGVybWlzc2lv
bnMgZm9yIHJlc2VydmVkLW1lbW9yeSByYW5nZXMgdW50aWwKKyAgICAgKiByZXNlcnZlZC1tZW1v
cnkgc3VwcG9ydCBpcyBjb21wbGV0ZS4KKyAgICAgKi8KKyAgICBpZiAoIHN0cmNtcChkdF9ub2Rl
X25hbWUoZGV2KSwgInJlc2VydmVkLW1lbW9yeSIpICkKICAgICB7Ci0gICAgICAgIHByaW50ayhY
RU5MT0dfRVJSICJVbmFibGUgdG8gcGVybWl0IHRvIGRvbSVkIGFjY2VzcyB0byIKLSAgICAgICAg
ICAgICAgICIgMHglIlBSSXg2NCIgLSAweCUiUFJJeDY0IlxuIiwKLSAgICAgICAgICAgICAgIGQt
PmRvbWFpbl9pZCwKLSAgICAgICAgICAgICAgIGFkZHIgJiBQQUdFX01BU0ssIFBBR0VfQUxJR04o
YWRkciArIGxlbikgLSAxKTsKLSAgICAgICAgcmV0dXJuIHJlczsKKyAgICAgICAgcmVzID0gaW9t
ZW1fcGVybWl0X2FjY2VzcyhkLCBwYWRkcl90b19wZm4oYWRkciksCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGFkZHJfdG9fcGZuKFBBR0VfQUxJR04oYWRkciArIGxlbiAtIDEp
KSk7CisgICAgICAgIGlmICggcmVzICkKKyAgICAgICAgeworICAgICAgICAgICAgcHJpbnRrKFhF
TkxPR19FUlIgIlVuYWJsZSB0byBwZXJtaXQgdG8gZG9tJWQgYWNjZXNzIHRvIgorICAgICAgICAg
ICAgICAgICAgICIgMHglIlBSSXg2NCIgLSAweCUiUFJJeDY0IlxuIiwKKyAgICAgICAgICAgICAg
ICAgICBkLT5kb21haW5faWQsCisgICAgICAgICAgICAgICAgICAgYWRkciAmIFBBR0VfTUFTSywg
UEFHRV9BTElHTihhZGRyICsgbGVuKSAtIDEpOworICAgICAgICAgICAgcmV0dXJuIHJlczsKKyAg
ICAgICAgfQogICAgIH0KIAogICAgIGlmICggbmVlZF9tYXBwaW5nICkKLS0gCjIuMTcuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
