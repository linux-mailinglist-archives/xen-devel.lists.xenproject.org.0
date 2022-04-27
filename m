Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD6C51146C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:50:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314680.532865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeJ3-0008BH-4a; Wed, 27 Apr 2022 09:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314680.532865; Wed, 27 Apr 2022 09:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeJ3-00088U-0I; Wed, 27 Apr 2022 09:49:57 +0000
Received: by outflank-mailman (input) for mailman id 314680;
 Wed, 27 Apr 2022 09:49:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTRx=VF=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1njeJ1-00085x-Vs
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:49:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 64240b9e-c60f-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 11:49:55 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F56414BF;
 Wed, 27 Apr 2022 02:49:54 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.13.174])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 084053F774;
 Wed, 27 Apr 2022 02:49:52 -0700 (PDT)
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
X-Inumbo-ID: 64240b9e-c60f-11ec-a405-831a346695d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/8] xen/arm: bootfdt.c: Remove unused-but-set variable
Date: Wed, 27 Apr 2022 11:49:34 +0200
Message-Id: <20220427094941.291554-2-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427094941.291554-1-michal.orzel@arm.com>
References: <20220427094941.291554-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function device_tree_node_compatible defines and sets a variable
mlen but does not make use of it. Remove this variable.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/bootfdt.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index e318ef9603..29671c8df0 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -36,11 +36,8 @@ static bool __init device_tree_node_compatible(const void *fdt, int node,
                                                const char *match)
 {
     int len, l;
-    int mlen;
     const void *prop;
 
-    mlen = strlen(match);
-
     prop = fdt_getprop(fdt, node, "compatible", &len);
     if ( prop == NULL )
         return false;
-- 
2.25.1


