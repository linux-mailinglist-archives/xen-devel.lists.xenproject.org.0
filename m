Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BBC83CF4
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 23:52:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv7Kl-0000oN-FT; Tue, 06 Aug 2019 21:49:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hv7Kj-0000mp-Le
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 21:49:29 +0000
X-Inumbo-ID: 10e667e6-b894-11e9-a110-bf1bed7548b1
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10e667e6-b894-11e9-a110-bf1bed7548b1;
 Tue, 06 Aug 2019 21:49:29 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C292218A6;
 Tue,  6 Aug 2019 21:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565128168;
 bh=sZgajqit8qqVgB1Vr0FiUXVVgAwfUQFWMQOw4YHUJkw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fBOk+VirK5qYMkxIB1lK6i9Lqq37Fgw+nVRJAjCNDRWqlYWR+IwCrwHeMUWRdForR
 +GmP1oh/K1p9PttXqpaYNkpZ9oses9My9sqy9TJnSFk2ZUcJUxWK9Dykcn/EZBQ129
 OWDsmVnO/JZ54Q2EFqBd4UtmMVtHWAeWPVM3FQfM=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Tue,  6 Aug 2019 14:49:24 -0700
Message-Id: <20190806214925.7534-6-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v4 6/7] xen/arm: don't iomem_permit_access for
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
aW54LmNvbT4KLS0tCgpDaGFuZ2VzIGluIHY0OgotIGNvbXBhcmUgdGhlIHBhcmVudCBuYW1lIHdp
dGggcmVzZXJ2ZWQtbWVtb3J5Ci0gdXNlIGR0X25vZGVfY21wCgpDaGFuZ2VzIGluIHYzOgotIG5l
dyBwYXRjaAotLS0KIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDI0ICsrKysrKysrKysr
KysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jCmluZGV4IDRjODQwNDE1NWEuLjI2N2UwNTQ5ZTIgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYworKysgYi94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMKQEAgLTExNTMsMTcgKzExNTMsMjUgQEAgc3RhdGljIGludCBfX2luaXQgbWFw
X3JhbmdlX3RvX2RvbWFpbihjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldiwKICAgICBz
dHJ1Y3QgbWFwX3JhbmdlX2RhdGEgKm1yX2RhdGEgPSBkYXRhOwogICAgIHN0cnVjdCBkb21haW4g
KmQgPSBtcl9kYXRhLT5kOwogICAgIGJvb2wgbmVlZF9tYXBwaW5nID0gIWR0X2RldmljZV9mb3Jf
cGFzc3Rocm91Z2goZGV2KTsKKyAgICBjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKnBhcmVu
dCA9IGR0X2dldF9wYXJlbnQoZGV2KTsKICAgICBpbnQgcmVzOwogCi0gICAgcmVzID0gaW9tZW1f
cGVybWl0X2FjY2VzcyhkLCBwYWRkcl90b19wZm4oYWRkciksCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYWRkcl90b19wZm4oUEFHRV9BTElHTihhZGRyICsgbGVuIC0gMSkpKTsKLSAg
ICBpZiAoIHJlcyApCisgICAgLyoKKyAgICAgKiBEb24ndCBnaXZlIGlvbWVtIHBlcm1pc3Npb25z
IGZvciByZXNlcnZlZC1tZW1vcnkgcmFuZ2VzIHVudGlsCisgICAgICogcmVzZXJ2ZWQtbWVtb3J5
IHN1cHBvcnQgaXMgY29tcGxldGUuCisgICAgICovCisgICAgaWYgKCBkdF9ub2RlX2NtcChkdF9u
b2RlX25hbWUocGFyZW50KSwgInJlc2VydmVkLW1lbW9yeSIpID09IDAgKQogICAgIHsKLSAgICAg
ICAgcHJpbnRrKFhFTkxPR19FUlIgIlVuYWJsZSB0byBwZXJtaXQgdG8gZG9tJWQgYWNjZXNzIHRv
IgotICAgICAgICAgICAgICAgIiAweCUiUFJJeDY0IiAtIDB4JSJQUkl4NjQiXG4iLAotICAgICAg
ICAgICAgICAgZC0+ZG9tYWluX2lkLAotICAgICAgICAgICAgICAgYWRkciAmIFBBR0VfTUFTSywg
UEFHRV9BTElHTihhZGRyICsgbGVuKSAtIDEpOwotICAgICAgICByZXR1cm4gcmVzOworICAgICAg
ICByZXMgPSBpb21lbV9wZXJtaXRfYWNjZXNzKGQsIHBhZGRyX3RvX3BmbihhZGRyKSwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90b19wZm4oUEFHRV9BTElHTihhZGRy
ICsgbGVuIC0gMSkpKTsKKyAgICAgICAgaWYgKCByZXMgKQorICAgICAgICB7CisgICAgICAgICAg
ICBwcmludGsoWEVOTE9HX0VSUiAiVW5hYmxlIHRvIHBlcm1pdCB0byBkb20lZCBhY2Nlc3MgdG8i
CisgICAgICAgICAgICAgICAgICAgIiAweCUiUFJJeDY0IiAtIDB4JSJQUkl4NjQiXG4iLAorICAg
ICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwKKyAgICAgICAgICAgICAgICAgICBhZGRyICYg
UEFHRV9NQVNLLCBQQUdFX0FMSUdOKGFkZHIgKyBsZW4pIC0gMSk7CisgICAgICAgICAgICByZXR1
cm4gcmVzOworICAgICAgICB9CiAgICAgfQogCiAgICAgaWYgKCBuZWVkX21hcHBpbmcgKQotLSAK
Mi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
