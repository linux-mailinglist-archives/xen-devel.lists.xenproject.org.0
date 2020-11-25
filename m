Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FCB2C3815
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 05:28:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37143.69407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmPR-0001CF-2M; Wed, 25 Nov 2020 04:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37143.69407; Wed, 25 Nov 2020 04:28:01 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmPQ-0001BF-Rn; Wed, 25 Nov 2020 04:28:00 +0000
Received: by outflank-mailman (input) for mailman id 37143;
 Wed, 25 Nov 2020 04:27:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khmPO-0000sM-WE
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:27:59 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2274826e-1858-4630-8bfe-2a38e3994241;
 Wed, 25 Nov 2020 04:27:50 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F25882173E;
 Wed, 25 Nov 2020 04:27:48 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khmPO-0000sM-WE
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:27:59 +0000
X-Inumbo-ID: 2274826e-1858-4630-8bfe-2a38e3994241
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2274826e-1858-4630-8bfe-2a38e3994241;
	Wed, 25 Nov 2020 04:27:50 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id F25882173E;
	Wed, 25 Nov 2020 04:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606278469;
	bh=Q5fWCGGnyKXj094ENtB0LrY+WONobsflgJQPten0+30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ee+F27T5pD2L/x9ZrPJmxgxgXUcF+s+eYZ7j00H7vLHEnVNkRAHlTnCbVFbk11vCt
	 KWmyRgPl1OgVUlu4hO3I26dzZBe6mROx/DvC9q7z+UvwglH+gFHDXAds0K/+B/PFaH
	 qjtm+Z43Yrg8CGo2iI/ceLG5P17dW6GCu+qmer9E=
From: Stefano Stabellini <sstabellini@kernel.org>
To: andrew.cooper3@citrix.com,
	cardoe@cardoe.com,
	wl@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v3 05/12] automation: add alpine linux arm64 build test
Date: Tue, 24 Nov 2020 20:27:38 -0800
Message-Id: <20201125042745.31986-5-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Based on the arm64 3.12 build container

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 automation/gitlab-ci/build.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 4bd1cfc1c0..fa38c39d6a 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -434,3 +434,12 @@ debian-unstable-gcc-debug-arm64-randconfig:
     CONTAINER: debian:unstable-arm64v8
     RANDCONFIG: y
 
+alpine-3.12-gcc-arm64:
+  extends: .gcc-arm64-build
+  variables:
+    CONTAINER: alpine:3.12-arm64v8
+
+alpine-3.12-gcc-debug-arm64:
+  extends: .gcc-arm64-build-debug
+  variables:
+    CONTAINER: alpine:3.12-arm64v8
-- 
2.17.1


