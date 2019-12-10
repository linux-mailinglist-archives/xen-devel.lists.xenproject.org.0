Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E401197E6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 22:38:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ien9e-0001lV-NG; Tue, 10 Dec 2019 21:34:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7H6H=2A=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1ien9d-0001lQ-0y
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 21:34:49 +0000
X-Inumbo-ID: e3fe20b6-1b94-11ea-8a44-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3fe20b6-1b94-11ea-8a44-12813bfff9fa;
 Tue, 10 Dec 2019 21:34:48 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13F412465C;
 Tue, 10 Dec 2019 21:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576013688;
 bh=nFxcgDnb6O25p6af5qRs7FXhfkUAYgJz96qP3fowiQA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MazmakwaiuCvyWxmx2PlB4w7Jak4st3DrrDIrv9vKm+54QoF/5PekZyxipIM02Rpq
 JmpZskURjES1nrzfBUgXZikqFySGUiX67IGZerN63G3XnUHzBg4GFeiZYQfX7WDBr+
 d6yOLDPDYvxnjCR/Wijsiwse5R7u9zPRpACujVnE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 10 Dec 2019 16:31:24 -0500
Message-Id: <20191210213221.11921-120-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210213221.11921-1-sashal@kernel.org>
References: <20191210213221.11921-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Xen-devel] [PATCH AUTOSEL 4.19 120/177] xen/gntdev: Use select for
 DMA_SHARED_BUFFER
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
Cc: Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Jason Gunthorpe <jgg@mellanox.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKWyBVcHN0cmVhbSBjb21t
aXQgZmE2NjE0ZDhlZjEzYzYzYWFjNTJhZDdjMDdjNWU2OWNlNGFiYTNkZCBdCgpETUFfU0hBUkVE
X0JVRkZFUiBjYW4gbm90IGJlIGVuYWJsZWQgYnkgdGhlIHVzZXIgKGl0IHJlcHJlc2VudHMgYSBs
aWJyYXJ5CnNldCBpbiB0aGUga2VybmVsKS4gVGhlIGtjb25maWcgY29udmVudGlvbiBpcyB0byB1
c2Ugc2VsZWN0IGZvciBzdWNoCnN5bWJvbHMgc28gdGhleSBhcmUgdHVybmVkIG9uIGltcGxpY2l0
bHkgd2hlbiB0aGUgdXNlciBlbmFibGVzIGEga2NvbmZpZwp0aGF0IG5lZWRzIHRoZW0uCgpPdGhl
cndpc2UgdGhlIFhFTl9HTlRERVZfRE1BQlVGIGtjb25maWcgaXMgb3Zlcmx5IGRpZmZpY3VsdCB0
byBlbmFibGUuCgpGaXhlczogOTMyZDY1NjIxNzllICgieGVuL2dudGRldjogQWRkIGluaXRpYWwg
c3VwcG9ydCBmb3IgZG1hLWJ1ZiBVQVBJIikKQ2M6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxv
bGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9y
aXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxv
bGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFzb24gR3Vu
dGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVs
Lm9yZz4KLS0tCiBkcml2ZXJzL3hlbi9LY29uZmlnIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9L
Y29uZmlnIGIvZHJpdmVycy94ZW4vS2NvbmZpZwppbmRleCA5MGQzODdiNTBhYjc0Li4wNTA1ZWVi
NTkzYjVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9LY29uZmlnCisrKyBiL2RyaXZlcnMveGVu
L0tjb25maWcKQEAgLTE1OCw3ICsxNTgsOCBAQCBjb25maWcgWEVOX0dOVERFVgogCiBjb25maWcg
WEVOX0dOVERFVl9ETUFCVUYKIAlib29sICJBZGQgc3VwcG9ydCBmb3IgZG1hLWJ1ZiBncmFudCBh
Y2Nlc3MgZGV2aWNlIGRyaXZlciBleHRlbnNpb24iCi0JZGVwZW5kcyBvbiBYRU5fR05UREVWICYm
IFhFTl9HUkFOVF9ETUFfQUxMT0MgJiYgRE1BX1NIQVJFRF9CVUZGRVIKKwlkZXBlbmRzIG9uIFhF
Tl9HTlRERVYgJiYgWEVOX0dSQU5UX0RNQV9BTExPQworCXNlbGVjdCBETUFfU0hBUkVEX0JVRkZF
UgogCWhlbHAKIAkgIEFsbG93cyB1c2Vyc3BhY2UgcHJvY2Vzc2VzIGFuZCBrZXJuZWwgbW9kdWxl
cyB0byB1c2UgWGVuIGJhY2tlZAogCSAgZG1hLWJ1ZiBpbXBsZW1lbnRhdGlvbi4gV2l0aCB0aGlz
IGV4dGVuc2lvbiBncmFudCByZWZlcmVuY2VzIHRvCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
