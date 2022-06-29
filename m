Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC2A560065
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 14:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357853.586692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6X8h-00069b-P1; Wed, 29 Jun 2022 12:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357853.586692; Wed, 29 Jun 2022 12:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6X8h-00066x-Le; Wed, 29 Jun 2022 12:49:51 +0000
Received: by outflank-mailman (input) for mailman id 357853;
 Wed, 29 Jun 2022 12:49:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cYaO=XE=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1o6X8g-00066r-Iy
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 12:49:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f4847bba-f7a9-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 14:49:49 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76CC5152B;
 Wed, 29 Jun 2022 05:49:46 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CECE3F66F;
 Wed, 29 Jun 2022 05:49:45 -0700 (PDT)
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
X-Inumbo-ID: f4847bba-f7a9-11ec-b725-ed86ccbb4733
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/helpers: fix snprintf argument in init-dom0less.c
Date: Wed, 29 Jun 2022 13:49:38 +0100
Message-Id: <20220629124938.26498-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

Fix snprintf argument in init-dom0less.c because two instances of
the function are using libxl_dominfo struct members that are uint64_t
types, so change "%lu" to "%"PRIu64 to handle it properly when
building on arm32 and arm64.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 tools/helpers/init-dom0less.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index 4c90dd6a0c8f..fee93459c4b9 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -5,6 +5,7 @@
 #include <stdlib.h>
 #include <sys/mman.h>
 #include <sys/time.h>
+#include <inttypes.h>
 #include <xenstore.h>
 #include <xenctrl.h>
 #include <xenguest.h>
@@ -138,10 +139,10 @@ static int create_xenstore(struct xs_handle *xsh,
                   "vm/" LIBXL_UUID_FMT, LIBXL_UUID_BYTES(uuid));
     if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
-    rc = snprintf(max_memkb_str, STR_MAX_LENGTH, "%lu", info->max_memkb);
+    rc = snprintf(max_memkb_str, STR_MAX_LENGTH, "%"PRIu64, info->max_memkb);
     if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
-    rc = snprintf(target_memkb_str, STR_MAX_LENGTH, "%lu", info->current_memkb);
+    rc = snprintf(target_memkb_str, STR_MAX_LENGTH, "%"PRIu64, info->current_memkb);
     if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
     rc = snprintf(ring_ref_str, STR_MAX_LENGTH, "%lld",
-- 
2.17.1


