Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DF69ECAD5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 12:05:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854572.1267747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLKXH-0001u9-GW; Wed, 11 Dec 2024 11:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854572.1267747; Wed, 11 Dec 2024 11:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLKXH-0001rY-Cp; Wed, 11 Dec 2024 11:05:43 +0000
Received: by outflank-mailman (input) for mailman id 854572;
 Wed, 11 Dec 2024 11:05:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbrR=TE=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1tLKXG-0001rS-Ai
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 11:05:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8c71119-b7af-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 12:05:35 +0100 (CET)
Received: from delta.homenet.telecomitalia.it
 (host-82-59-161-229.retail.telecomitalia.it [82.59.161.229])
 by support.bugseng.com (Postfix) with ESMTPSA id EC8894EE073C;
 Wed, 11 Dec 2024 12:05:37 +0100 (CET)
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
X-Inumbo-ID: d8c71119-b7af-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1733915140; bh=wC1Aqf8BmRMuPcItSpajMDm16p7p3y9cXkXxpzBiXb8=;
	h=From:To:Cc:Subject:Date:From;
	b=UPepWeu0m+YZOoIkElhcQJtmaZTv0b+ceOJm8GfXRT5aYk6qRcWkpGXlYwE7pMlB3
	 bMIca0SpMChJrsRBubNrujQb3DDGFff2AyszPoeXfCyiajWtUlzERvKqJiMTfdlqfU
	 kahtfVxQnoQXv1FuSSxeAdgsEbIrZKAJc0rirz1pcur4ptvRPvz0XFr4m0KbUdKcsH
	 d6EQRCBSFUex0HySXIFdo0SCNxb4YJt+X+nsuPODKOPDFduBp31Ot0z826fRogEEyK
	 1sCtxtamwLio71S/iqSkbv2R1LQXBx9Lvht9Hjlt4x75osfsfpV+1BMdAdIhLcuDDb
	 WFBLuBuQCu+AA==
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] misra: add deviation for MISRA C Rule R11.1.
Date: Wed, 11 Dec 2024 12:05:30 +0100
Message-ID: <8db58416ce215a3c5fdba8074dc21f32116e8a41.1733915076.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 11.1 states as following: "Conversions shall not be performed
between a pointer to a function and any other type".

In "xen/common/bug.c", in order to get additional debug information,
pointer "bug_fn_t *fn" in the data section is converted to a function
pointer, which is then used to get such information. This specific
conversion has been reviewed and found to have no undefined behaviour
associated to it, therefore it can be exempted from compliance.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
As this patch introduces a deviation for service MC3A2.R11.1, it
depends on the following patch and shall not be applied prior to its
application.
https://lore.kernel.org/xen-devel/cf13be4779f15620e94b99b3b91f9cb040319989.1733826952.git.alessandro.zucchelli@bugseng.com/T/#u
---
 docs/misra/safe.json | 8 ++++++++
 xen/common/bug.c     | 1 +
 2 files changed, 9 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 684346386e..d80fb3a48f 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -92,6 +92,14 @@
         },
         {
             "id": "SAF-11-safe",
+            "analyser": {
+                "eclair": "MC3A2.R11.1"
+            },
+            "name": "Rule 11.1: conversion for debugging purposes",
+            "text": "conversion of selected pointers to function pointers for debugging purposes are safe."
+        },
+        {
+            "id": "SAF-12-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/common/bug.c b/xen/common/bug.c
index 75cb35fcfa..2d08bb3d41 100644
--- a/xen/common/bug.c
+++ b/xen/common/bug.c
@@ -44,6 +44,7 @@ int do_bug_frame(const struct cpu_user_regs *regs, unsigned long pc)
 
     if ( id == BUGFRAME_run_fn )
     {
+        /* SAF-11-safe conversion for debugging purposes */
         bug_fn_t *fn = bug_ptr(bug);
 
         fn(regs);
-- 
2.43.0


