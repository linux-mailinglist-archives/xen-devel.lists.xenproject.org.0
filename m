Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C047B28B6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 01:20:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610077.949338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm0IP-0003Pu-GT; Thu, 28 Sep 2023 23:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610077.949338; Thu, 28 Sep 2023 23:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm0IP-0003NM-DG; Thu, 28 Sep 2023 23:19:49 +0000
Received: by outflank-mailman (input) for mailman id 610077;
 Thu, 28 Sep 2023 23:19:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pu57=FM=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qm0IN-0003MQ-Ri
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 23:19:47 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80a0531a-5e55-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 01:19:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9C44282853BD;
 Thu, 28 Sep 2023 18:19:41 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id W-RDBVAdorpd; Thu, 28 Sep 2023 18:19:38 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 677D382856BA;
 Thu, 28 Sep 2023 18:19:38 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7oh06pz4SJAY; Thu, 28 Sep 2023 18:19:38 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 116AD82856A3;
 Thu, 28 Sep 2023 18:19:38 -0500 (CDT)
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
X-Inumbo-ID: 80a0531a-5e55-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 677D382856BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695943178; bh=yq32tJnjVPi0z2MoxNzoP3nmP/w0YsbUxnmfU/xjCrc=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=OcDVyObeeEUYxXGFJnYIeEtpA8HetstdTgrgltg70dOZdVrQGVDD56vsKgK4LuErM
	 nM9/aN/NLpj5mdaML3wefZaqMbRmze1Y1U7TXAtvAmMmB/j4+VBB1n3TxWuXbCPWEm
	 9vnFMKWKajjKr9XJr6U8kO+VAN2QsALORwMoA+0U=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 1/3] xen/ppc: Fix stack initialization in head.S
Date: Thu, 28 Sep 2023 18:19:27 -0500
Message-Id: <4d733b1f17215616b7ab00f0e44d2f483436b1d6.1695942864.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1695942864.git.sanastasio@raptorengineering.com>
References: <cover.1695942864.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

The code to set up the stack in head.S erroneously loads the bottom of
the stack (the symbol cpu0_boot_stack) into r1 instead of the top of the
stack (cpu0_boot_stack + STACK_SIZE).

Fixes: 3a4e6f67bc68 ("xen/ppc: Set up a basic C environment")
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/ppc64/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
index e600ddb05f..6ce313aff8 100644
--- a/xen/arch/ppc/ppc64/head.S
+++ b/xen/arch/ppc/ppc64/head.S
@@ -46,7 +46,7 @@ ENTRY(start)
 .L_correct_address:
 
     /* set up the initial stack */
-    LOAD_REG_ADDR(%r1, cpu0_boot_stack)
+    LOAD_REG_ADDR(%r1, cpu0_boot_stack + STACK_SIZE)
     li      %r11, 0
     stdu    %r11, -STACK_FRAME_OVERHEAD(%r1)
 
-- 
2.30.2


