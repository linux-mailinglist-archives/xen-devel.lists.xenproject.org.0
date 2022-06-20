Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0997C5510E5
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:03:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352429.579256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRX-0003we-M2; Mon, 20 Jun 2022 07:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352429.579256; Mon, 20 Jun 2022 07:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRX-0003o9-EZ; Mon, 20 Jun 2022 07:03:27 +0000
Received: by outflank-mailman (input) for mailman id 352429;
 Mon, 20 Jun 2022 07:03:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k7+S=W3=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o3BRV-0001Yx-NP
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:03:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 13acfbf2-f067-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 09:03:24 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 851021042;
 Mon, 20 Jun 2022 00:03:24 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.35.125])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EA493F5A1;
 Mon, 20 Jun 2022 00:03:23 -0700 (PDT)
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
X-Inumbo-ID: 13acfbf2-f067-11ec-b725-ed86ccbb4733
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 7/9] common/libfdt: Use explicitly specified types
Date: Mon, 20 Jun 2022 09:02:43 +0200
Message-Id: <20220620070245.77979-8-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620070245.77979-1-michal.orzel@arm.com>
References: <20220620070245.77979-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to MISRA C 2012 Rule 8.1, types shall be explicitly
specified. Fix all the findings reported by cppcheck with misra addon
by substituting implicit type 'unsigned' to explicit 'unsigned int'.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
This patch may not be applicable as these files come from libfdt.
---
 xen/common/libfdt/fdt_ro.c  | 4 ++--
 xen/common/libfdt/fdt_rw.c  | 2 +-
 xen/common/libfdt/fdt_sw.c  | 2 +-
 xen/common/libfdt/fdt_wip.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/common/libfdt/fdt_ro.c b/xen/common/libfdt/fdt_ro.c
index 17584da257..0fc4f793fe 100644
--- a/xen/common/libfdt/fdt_ro.c
+++ b/xen/common/libfdt/fdt_ro.c
@@ -53,7 +53,7 @@ const char *fdt_get_string(const void *fdt, int stroffset, int *lenp)
 
 	err = -FDT_ERR_BADOFFSET;
 	absoffset = stroffset + fdt_off_dt_strings(fdt);
-	if (absoffset >= (unsigned)totalsize)
+	if (absoffset >= (unsigned int)totalsize)
 		goto fail;
 	len = totalsize - absoffset;
 
@@ -61,7 +61,7 @@ const char *fdt_get_string(const void *fdt, int stroffset, int *lenp)
 		if (stroffset < 0)
 			goto fail;
 		if (can_assume(LATEST) || fdt_version(fdt) >= 17) {
-			if ((unsigned)stroffset >= fdt_size_dt_strings(fdt))
+			if ((unsigned int)stroffset >= fdt_size_dt_strings(fdt))
 				goto fail;
 			if ((fdt_size_dt_strings(fdt) - stroffset) < len)
 				len = fdt_size_dt_strings(fdt) - stroffset;
diff --git a/xen/common/libfdt/fdt_rw.c b/xen/common/libfdt/fdt_rw.c
index 3621d3651d..1707238ebc 100644
--- a/xen/common/libfdt/fdt_rw.c
+++ b/xen/common/libfdt/fdt_rw.c
@@ -59,7 +59,7 @@ static int fdt_splice_(void *fdt, void *splicepoint, int oldlen, int newlen)
 
 	if ((oldlen < 0) || (soff + oldlen < soff) || (soff + oldlen > dsize))
 		return -FDT_ERR_BADOFFSET;
-	if ((p < (char *)fdt) || (dsize + newlen < (unsigned)oldlen))
+	if ((p < (char *)fdt) || (dsize + newlen < (unsigned int)oldlen))
 		return -FDT_ERR_BADOFFSET;
 	if (dsize - oldlen + newlen > fdt_totalsize(fdt))
 		return -FDT_ERR_NOSPACE;
diff --git a/xen/common/libfdt/fdt_sw.c b/xen/common/libfdt/fdt_sw.c
index 4c569ee7eb..eb694b5dbb 100644
--- a/xen/common/libfdt/fdt_sw.c
+++ b/xen/common/libfdt/fdt_sw.c
@@ -162,7 +162,7 @@ int fdt_resize(void *fdt, void *buf, int bufsize)
 	    headsize + tailsize > fdt_totalsize(fdt))
 		return -FDT_ERR_INTERNAL;
 
-	if ((headsize + tailsize) > (unsigned)bufsize)
+	if ((headsize + tailsize) > (unsigned int)bufsize)
 		return -FDT_ERR_NOSPACE;
 
 	oldtail = (char *)fdt + fdt_totalsize(fdt) - tailsize;
diff --git a/xen/common/libfdt/fdt_wip.c b/xen/common/libfdt/fdt_wip.c
index c2d7566a67..82db674014 100644
--- a/xen/common/libfdt/fdt_wip.c
+++ b/xen/common/libfdt/fdt_wip.c
@@ -23,7 +23,7 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
 	if (!propval)
 		return proplen;
 
-	if ((unsigned)proplen < (len + idx))
+	if ((unsigned int)proplen < (len + idx))
 		return -FDT_ERR_NOSPACE;
 
 	memcpy((char *)propval + idx, val, len);
-- 
2.25.1


