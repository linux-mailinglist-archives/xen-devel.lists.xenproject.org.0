Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1352860BA
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 15:57:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3531.10128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ9wV-0002G2-Ff; Wed, 07 Oct 2020 13:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3531.10128; Wed, 07 Oct 2020 13:57:19 +0000
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
	id 1kQ9wV-0002FK-9G; Wed, 07 Oct 2020 13:57:19 +0000
Received: by outflank-mailman (input) for mailman id 3531;
 Wed, 07 Oct 2020 13:57:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWE0=DO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kQ9wT-0002Eo-SV
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 13:57:17 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 02a3b305-dfda-4ec3-988d-e418a29ca9ed;
 Wed, 07 Oct 2020 13:57:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3796106F;
 Wed,  7 Oct 2020 06:57:16 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.198.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3005B3F66B;
 Wed,  7 Oct 2020 06:57:16 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MWE0=DO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kQ9wT-0002Eo-SV
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 13:57:17 +0000
X-Inumbo-ID: 02a3b305-dfda-4ec3-988d-e418a29ca9ed
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 02a3b305-dfda-4ec3-988d-e418a29ca9ed;
	Wed, 07 Oct 2020 13:57:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3796106F;
	Wed,  7 Oct 2020 06:57:16 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.198.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3005B3F66B;
	Wed,  7 Oct 2020 06:57:16 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/2] tool/libs/light: Fix libxenlight gcc warning
Date: Wed,  7 Oct 2020 14:57:02 +0100
Message-Id: <579cfa6e71a5a1392a5ae40cef358c4e8e3a0901.1602078276.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <4ecb03b40b0da6d480e95af1da8289501a3ede0a.1602078276.git.bertrand.marquis@arm.com>
References: <4ecb03b40b0da6d480e95af1da8289501a3ede0a.1602078276.git.bertrand.marquis@arm.com>
In-Reply-To: <4ecb03b40b0da6d480e95af1da8289501a3ede0a.1602078276.git.bertrand.marquis@arm.com>
References: <4ecb03b40b0da6d480e95af1da8289501a3ede0a.1602078276.git.bertrand.marquis@arm.com>

Fix gcc10 compilation warning about uninitialized variable by setting
it to 0.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v3: Rebase
---
 tools/libs/light/libxl_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_mem.c b/tools/libs/light/libxl_mem.c
index e52a9624ea..c739d00f39 100644
--- a/tools/libs/light/libxl_mem.c
+++ b/tools/libs/light/libxl_mem.c
@@ -562,7 +562,7 @@ out:
 
 int libxl_get_free_memory_0x040700(libxl_ctx *ctx, uint32_t *memkb)
 {
-    uint64_t my_memkb;
+    uint64_t my_memkb = 0;
     int rc;
 
     rc = libxl_get_free_memory(ctx, &my_memkb);
-- 
2.17.1


