Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D576A541C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 09:08:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503077.775226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWv2A-0000cN-Cd; Tue, 28 Feb 2023 08:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503077.775226; Tue, 28 Feb 2023 08:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWv2A-0000a5-9g; Tue, 28 Feb 2023 08:08:26 +0000
Received: by outflank-mailman (input) for mailman id 503077;
 Tue, 28 Feb 2023 08:08:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nVN0=6Y=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1pWv29-0000Zt-BQ
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 08:08:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 12aec3b9-b73f-11ed-9692-2f268f93b82a;
 Tue, 28 Feb 2023 09:08:24 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A512FC14;
 Tue, 28 Feb 2023 00:09:06 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C84E23F67D;
 Tue, 28 Feb 2023 00:08:22 -0800 (PST)
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
X-Inumbo-ID: 12aec3b9-b73f-11ed-9692-2f268f93b82a
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: check max_init_domid validity
Date: Tue, 28 Feb 2023 08:08:10 +0000
Message-Id: <0cf2013e5e6018cae300c39fb65ed526eac5c35c.1677511937.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before trying to create a dom0less guest, check that max_init_domid
increment will generate a valid domain ID, lower than
DOMID_FIRST_RESERVED.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/domain_build.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index edca23b986d2..9707eb7b1bb1 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3879,6 +3879,9 @@ void __init create_domUs(void)
         if ( !dt_device_is_compatible(node, "xen,domain") )
             continue;
 
+        if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
+            panic("No more domain IDs available\n");
+
         if ( dt_find_property(node, "xen,static-mem", NULL) )
             flags |= CDF_staticmem;
 
-- 
2.25.1


