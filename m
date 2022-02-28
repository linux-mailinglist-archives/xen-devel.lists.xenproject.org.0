Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 761294C66DE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 11:08:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280303.478203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOcwr-0003LP-Kq; Mon, 28 Feb 2022 10:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280303.478203; Mon, 28 Feb 2022 10:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOcwr-0003Jb-Hb; Mon, 28 Feb 2022 10:08:09 +0000
Received: by outflank-mailman (input) for mailman id 280303;
 Mon, 28 Feb 2022 10:08:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nOcwq-0003Hy-1p
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 10:08:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOcwp-0002Nm-OP; Mon, 28 Feb 2022 10:08:07 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOcwp-0004bS-Gg; Mon, 28 Feb 2022 10:08:07 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=P1oGTBOw5wZOVO0AiBiFv8kLi7uHeyJ9lMmo2PgMCeM=; b=Xooswf
	XaWMdK16sLCJRRR9stu30FxAnIzYUFWHV+SGKhuuM8yWEzYmHbX7EY1YFDHzm9afT1/KzbnEcuoF+
	l0eNhW5CP5P33I/s8g1sVpUVsyNaMgKHMYbpwVpPWgDKCiUS29guJwbeDONAmkSHtqwtceBuP7jmk
	fd0YErUdet0=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm64: head: Mark the end of subroutines with ENDPROC (take two)
Date: Mon, 28 Feb 2022 10:08:05 +0000
Message-Id: <20220228100805.60918-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Commit 13c03002c5df ("xen/arm64: head: Mark the end of subroutines
with ENDPROC") intended to mark all the subroutines with ENDPROC.

Unfortunately, I missed fail(), switch_ttbr() and init_uart(). Add
ENDPROC for the benefits of static analysis tools and the reader.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm64/head.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 314b800b3f8e..66d862fc8137 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -800,6 +800,7 @@ ENDPROC(launch)
 fail:   PRINT("- Boot failed -\r\n")
 1:      wfe
         b     1b
+ENDPROC(fail)
 
 GLOBAL(_end_boot)
 
@@ -830,6 +831,7 @@ ENTRY(switch_ttbr)
         isb
 
         ret
+ENDPROC(switch_ttbr)
 
 #ifdef CONFIG_EARLY_PRINTK
 /*
@@ -847,6 +849,7 @@ init_uart:
 #endif
         PRINT("- UART enabled -\r\n")
         ret
+ENDPROC(init_uart)
 
 /* Print early debug messages.
  * x0: Nul-terminated string to print.
-- 
2.32.0


