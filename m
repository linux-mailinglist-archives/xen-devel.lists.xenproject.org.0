Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C8412C4F5
	for <lists+xen-devel@lfdr.de>; Sun, 29 Dec 2019 18:38:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilcSa-0003Ud-4w; Sun, 29 Dec 2019 17:34:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yvQu=2T=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1ilcSY-0003UY-OU
 for xen-devel@lists.xenproject.org; Sun, 29 Dec 2019 17:34:34 +0000
X-Inumbo-ID: 7a49ed36-2a61-11ea-b6f1-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a49ed36-2a61-11ea-b6f1-bc764e2007e4;
 Sun, 29 Dec 2019 17:34:34 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 41263207FF;
 Sun, 29 Dec 2019 17:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577640873;
 bh=TIF/9YV50EYEwGz2BonF9AsnNyGlH2YFHzvddhM6kbY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qpfx8eQvvtXnYnK0vdg+ybvCd+QMvEZAb2U/DdkPYdgz6sG0ssOM+tEauqQFNx+8J
 mdUUPg7/7eitTDcW3uNa+YiE7FRQpF9C8BOrdcw6lB9x46PpV7/fXkYFbckYfRpQJ+
 cWPfneCQwo9bqFuEurviaQiyC6pGkHux9V6FhCI4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Sun, 29 Dec 2019 18:18:57 +0100
Message-Id: <20191229162529.059565954@linuxfoundation.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229162508.458551679@linuxfoundation.org>
References: <20191229162508.458551679@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4.19 135/219] xen/gntdev: Use select for
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
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
Y29uZmlnIGIvZHJpdmVycy94ZW4vS2NvbmZpZwppbmRleCA5MGQzODdiNTBhYjcuLjA1MDVlZWI1
OTNiNSAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vS2NvbmZpZworKysgYi9kcml2ZXJzL3hlbi9L
Y29uZmlnCkBAIC0xNTgsNyArMTU4LDggQEAgY29uZmlnIFhFTl9HTlRERVYKIAogY29uZmlnIFhF
Tl9HTlRERVZfRE1BQlVGCiAJYm9vbCAiQWRkIHN1cHBvcnQgZm9yIGRtYS1idWYgZ3JhbnQgYWNj
ZXNzIGRldmljZSBkcml2ZXIgZXh0ZW5zaW9uIgotCWRlcGVuZHMgb24gWEVOX0dOVERFViAmJiBY
RU5fR1JBTlRfRE1BX0FMTE9DICYmIERNQV9TSEFSRURfQlVGRkVSCisJZGVwZW5kcyBvbiBYRU5f
R05UREVWICYmIFhFTl9HUkFOVF9ETUFfQUxMT0MKKwlzZWxlY3QgRE1BX1NIQVJFRF9CVUZGRVIK
IAloZWxwCiAJICBBbGxvd3MgdXNlcnNwYWNlIHByb2Nlc3NlcyBhbmQga2VybmVsIG1vZHVsZXMg
dG8gdXNlIFhlbiBiYWNrZWQKIAkgIGRtYS1idWYgaW1wbGVtZW50YXRpb24uIFdpdGggdGhpcyBl
eHRlbnNpb24gZ3JhbnQgcmVmZXJlbmNlcyB0bwotLSAKMi4yMC4xCgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
