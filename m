Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D788F83DCA
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 01:20:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv8hz-0007Z1-6x; Tue, 06 Aug 2019 23:17:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hv8hx-0007Yw-Ls
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 23:17:33 +0000
X-Inumbo-ID: 5df95c4e-b8a0-11e9-adef-37954d770ddd
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5df95c4e-b8a0-11e9-adef-37954d770ddd;
 Tue, 06 Aug 2019 23:17:32 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C3B2C20B1F;
 Tue,  6 Aug 2019 23:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565133452;
 bh=wPL4+fgYUIoOznHLnoMS47ZED+0yiQXqLkDrzSLkc44=;
 h=Date:From:To:cc:Subject:From;
 b=MT3ryWSGtrd1X7rWLoTcos35n3Qm7hjljJxQbsJdLNZCzDifXfeZvSuraST8q7sZ6
 WdE2kKbqGMt6O818ODBBfnKz16fldlT+sW30GsCU4hH6BOYl1S37GWiIcQyKF1eVH3
 pMsSV9P7ohZ79/Xs3ngnyceT2fbx73Pn51qp+FT0=
Date: Tue, 6 Aug 2019 16:17:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
Message-ID: <alpine.DEB.2.21.1908061615000.2451@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/arm: unbreak arm64 build
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
Cc: julien.grall@arm.com, sstabellini@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDQ5NDFiZmJmMTFlYWUwNWM5MmFhMzI0MmUzNTNkMTczOTc0Y2U3YmYgInhlbi9hcm02
NDogbWFjcm9zOgpJbnRyb2R1Y2UgYW4gYXNzZW1ibHkgbWFjcm8gdG8gYWxpYXMgeDMwIiBtb3Zl
ZAoKICBsciAgICAgIC5yZXEgICAgeDMwCgp0byBtYWNyb3MuaCwgYW5kIHN0YXJ0ZWQgdG8gdXNl
ICJsciIgaW4gaGVhZC5TLiBIb3dldmVyLCBpdCBkaWRuJ3QgYWRkCmFuICNpbmNsdWRlIG1hY3Jv
cy5oIHRvIGhlYWQuUy4gVGhpcyBjb21taXQgZml4ZXMgaXQuCgpTaWduZWQtb2ZmLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+CgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKaW5kZXggMjhl
ZmU5MjMwYy4uNTBjZmYwODc1NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQu
UworKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCkBAIC0yNSw2ICsyNSw3IEBACiAjaW5j
bHVkZSA8YXNtL2Vhcmx5X3ByaW50ay5oPgogI2luY2x1ZGUgPGVmaS9lZmllcnIuaD4KICNpbmNs
dWRlIDxhc20vYXJtNjQvZWZpYmluZC5oPgorI2luY2x1ZGUgPGFzbS9hcm02NC9tYWNyb3MuaD4K
IAogI2RlZmluZSBQVF9QVCAgICAgMHhmN2YgLyogbkc9MSBBRj0xIFNIPTExIEFQPTAxIE5TPTEg
QVRUUj0xMTEgVD0xIFA9MSAqLwogI2RlZmluZSBQVF9NRU0gICAgMHhmN2QgLyogbkc9MSBBRj0x
IFNIPTExIEFQPTAxIE5TPTEgQVRUUj0xMTEgVD0wIFA9MSAqLwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
