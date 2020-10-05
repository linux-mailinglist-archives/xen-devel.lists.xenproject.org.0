Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADCE283C06
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 18:06:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3054.8850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPSzj-0004co-2K; Mon, 05 Oct 2020 16:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3054.8850; Mon, 05 Oct 2020 16:05:47 +0000
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
	id 1kPSzi-0004c7-Ty; Mon, 05 Oct 2020 16:05:46 +0000
Received: by outflank-mailman (input) for mailman id 3054;
 Mon, 05 Oct 2020 16:05:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fzGi=DM=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kPSzh-0004ZS-SW
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 16:05:45 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 73854755-f9e2-4046-ac3c-4ee76d2eb441;
 Mon, 05 Oct 2020 16:05:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6A3C143D;
 Mon,  5 Oct 2020 09:05:40 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.198.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBEF83F66B;
 Mon,  5 Oct 2020 09:05:39 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=fzGi=DM=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kPSzh-0004ZS-SW
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 16:05:45 +0000
X-Inumbo-ID: 73854755-f9e2-4046-ac3c-4ee76d2eb441
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 73854755-f9e2-4046-ac3c-4ee76d2eb441;
	Mon, 05 Oct 2020 16:05:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6A3C143D;
	Mon,  5 Oct 2020 09:05:40 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.198.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBEF83F66B;
	Mon,  5 Oct 2020 09:05:39 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/2] tool/libx: Fix libxenlight gcc warning
Date: Mon,  5 Oct 2020 17:02:49 +0100
Message-Id: <1c0b3a351e20e31093b5f59edd7fafeac1ceb75c.1601913536.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601913536.git.bertrand.marquis@arm.com>
References: <cover.1601913536.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1601913536.git.bertrand.marquis@arm.com>
References: <cover.1601913536.git.bertrand.marquis@arm.com>

Fix gcc10 compilation warning about uninitialized variable by setting
it to 0.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 tools/libxl/libxl_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libxl/libxl_mem.c b/tools/libxl/libxl_mem.c
index e52a9624ea..c739d00f39 100644
--- a/tools/libxl/libxl_mem.c
+++ b/tools/libxl/libxl_mem.c
@@ -562,7 +562,7 @@ out:
 
 int libxl_get_free_memory_0x040700(libxl_ctx *ctx, uint32_t *memkb)
 {
-    uint64_t my_memkb;
+    uint64_t my_memkb = 0;
     int rc;
 
     rc = libxl_get_free_memory(ctx, &my_memkb);
-- 
2.17.1


