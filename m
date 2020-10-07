Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA218285DCC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 13:06:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3436.9885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ7Gt-0008L5-Mb; Wed, 07 Oct 2020 11:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3436.9885; Wed, 07 Oct 2020 11:06:11 +0000
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
	id 1kQ7Gt-0008Kg-J5; Wed, 07 Oct 2020 11:06:11 +0000
Received: by outflank-mailman (input) for mailman id 3436;
 Wed, 07 Oct 2020 11:06:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWE0=DO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kQ7Gs-0008Ka-MY
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 11:06:10 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 48d41b3b-4842-4fa6-9cb6-5ac6d109f186;
 Wed, 07 Oct 2020 11:06:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EE64147A;
 Wed,  7 Oct 2020 04:06:09 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.198.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE5453F71F;
 Wed,  7 Oct 2020 04:06:08 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MWE0=DO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kQ7Gs-0008Ka-MY
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 11:06:10 +0000
X-Inumbo-ID: 48d41b3b-4842-4fa6-9cb6-5ac6d109f186
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 48d41b3b-4842-4fa6-9cb6-5ac6d109f186;
	Wed, 07 Oct 2020 11:06:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EE64147A;
	Wed,  7 Oct 2020 04:06:09 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.198.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE5453F71F;
	Wed,  7 Oct 2020 04:06:08 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: print update firmware only once
Date: Wed,  7 Oct 2020 12:05:44 +0100
Message-Id: <09d04b34e6b3b77ac206a42657b1b4116e7e11f3.1602068661.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

Fix enable_smccc_arch_workaround_1 to only print the warning asking to
update the firmware once.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/cpuerrata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 6c09017515..0c63dfa779 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -187,7 +187,7 @@ warn:
         ASSERT(system_state < SYS_STATE_active);
         warning_add("No support for ARM_SMCCC_ARCH_WORKAROUND_1.\n"
                     "Please update your firmware.\n");
-        warned = false;
+        warned = true;
     }
 
     return 0;
-- 
2.17.1


