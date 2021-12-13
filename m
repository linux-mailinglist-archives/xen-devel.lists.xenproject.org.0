Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8E5472BC7
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 12:49:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246000.424336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwjoy-0008Qf-HC; Mon, 13 Dec 2021 11:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246000.424336; Mon, 13 Dec 2021 11:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwjoy-0008OE-EB; Mon, 13 Dec 2021 11:48:44 +0000
Received: by outflank-mailman (input) for mailman id 246000;
 Mon, 13 Dec 2021 11:48:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKfH=Q6=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1mwjox-0008O8-A9
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 11:48:43 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 9dda2c1a-5c0a-11ec-b1ef-a74572bcbcad;
 Mon, 13 Dec 2021 12:48:41 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79E0B6D;
 Mon, 13 Dec 2021 03:48:40 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 932103F793;
 Mon, 13 Dec 2021 03:48:39 -0800 (PST)
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
X-Inumbo-ID: 9dda2c1a-5c0a-11ec-b1ef-a74572bcbcad
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: increase memory banks number define value
Date: Mon, 13 Dec 2021 11:48:23 +0000
Message-Id: <20211213114823.25570-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

Currently the maximum number of memory banks (NR_MEM_BANKS define)
is fixed to 128, but on some new platforms that have a large amount
of memory, this value is not enough and prevents Xen from booting.

Increase the value to 256.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/include/asm-arm/setup.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
index 95da0b7ab9cd..07daf160dc57 100644
--- a/xen/include/asm-arm/setup.h
+++ b/xen/include/asm-arm/setup.h
@@ -6,7 +6,7 @@
 #define MIN_FDT_ALIGN 8
 #define MAX_FDT_SIZE SZ_2M
 
-#define NR_MEM_BANKS 128
+#define NR_MEM_BANKS 256
 
 #define MAX_MODULES 32 /* Current maximum useful modules */
 
-- 
2.17.1


