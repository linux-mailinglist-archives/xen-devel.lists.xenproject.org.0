Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F4F89FFF5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 20:42:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703548.1099242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ructw-0003Gh-E9; Wed, 10 Apr 2024 18:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703548.1099242; Wed, 10 Apr 2024 18:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ructw-0003Bl-80; Wed, 10 Apr 2024 18:42:28 +0000
Received: by outflank-mailman (input) for mailman id 703548;
 Wed, 10 Apr 2024 18:42:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wftW=LP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ructu-0002iK-TE
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 18:42:26 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12f3b1ce-f76a-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 20:42:25 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-516db2214e6so6155088e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 11:42:25 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gv18-20020a170906f11200b00a4e1a9e1ab4sm7228404ejb.157.2024.04.10.11.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 11:42:23 -0700 (PDT)
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
X-Inumbo-ID: 12f3b1ce-f76a-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712774544; x=1713379344; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=825D0q9VW5ChJA7t5t0rSUJnwEdMxB4Mm0IclQ3mWnY=;
        b=ZlpJCR3kA3JJ4C8tb279F5A39f7VMLGwBaFxRYI6X+MBzTb1Z8gNOOF0B22HPMHnyo
         X5Vwc2OLaQGvtern9v4yEKN8p6j2Quhs03uCg0ew9DgT8FA9zTX/KwJonSFSheRZJdBQ
         QIufEnXzAropYUlBgi0fYbVmO+IimsgW++QWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712774544; x=1713379344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=825D0q9VW5ChJA7t5t0rSUJnwEdMxB4Mm0IclQ3mWnY=;
        b=WJ+S892U3shatG+qnB1lSUEsafvoDSsqYnaljy1wBhH2PTkgWLSLVzTxt6nhWOqnKK
         ufuq4EqWoVU7c+Egb8VIq9+/0E70Z/lfp1sCdUpPRYSBC4zQ1atAMqrzCZV7jm6NXfs7
         akz0ShUvJKoVGvm0YbWQ4OGjZvKEOBvXdFP8TE6pIJ8PigkMkA8P2cxynZTr5OiJCzLB
         p+xRpvZtFyHA0NmgYQzr/scVkLYYWr1gPGCiX2hzqPSW4xs/f2EtQ3JM8gmakSojevNj
         1Meikv5xAmVcZwMPMjolREDYKpp4opc3IdzjhUguvAs/WEHgI3J+BHPlknxKjKU8GilA
         YEIg==
X-Gm-Message-State: AOJu0YzMXZV9z4kkZrH/hXgfFlxulyzByaOxmblKUSK4cWIyqqoAJ4Op
	dCtXxQGDwzL5vb/l1W4GUWAgbknzI8Jlc89cio88GiH8QjK0nAytn5TuRuk2wDdex5rBy82IMoU
	/LxQ=
X-Google-Smtp-Source: AGHT+IGqZhwABSKKcqmSHOPFUjTJJI3TOiGeH+PGNXLx6+NV8wjKCSy22eFNHisUlWOHJFhe20f19w==
X-Received: by 2002:a19:914c:0:b0:516:d09b:cbd6 with SMTP id y12-20020a19914c000000b00516d09bcbd6mr1878645lfj.15.1712774544347;
        Wed, 10 Apr 2024 11:42:24 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 3/4] xen/virtual-region: Link the list build time
Date: Wed, 10 Apr 2024 19:42:16 +0100
Message-Id: <20240410184217.1482366-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240410184217.1482366-1-andrew.cooper3@citrix.com>
References: <20240410184217.1482366-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Given 3 statically initialised objects, its easy to link the list at build
time.  There's no need to do it during runtime at boot (and with IRQs-off,
even).

As a consequence, register_virtual_region() can now move inside ifdef
CONFIG_LIVEPATCH like unregister_virtual_region().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>

v2:
 * Collect the initialisers togoether too.
---
 xen/common/virtual_region.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
index 7d8bdeb61282..db3e0dc9fe74 100644
--- a/xen/common/virtual_region.c
+++ b/xen/common/virtual_region.c
@@ -15,8 +15,18 @@ extern const struct bug_frame
     __start_bug_frames_2[], __stop_bug_frames_2[],
     __start_bug_frames_3[], __stop_bug_frames_3[];
 
+/*
+ * For the built-in regions, the double linked list can be constructed at
+ * build time.  Forward-declare the elements and their initialisers.
+ */
+static struct list_head virtual_region_list;
+static struct virtual_region core, core_init;
+#define LIST_ENTRY_HEAD() { .next = &core.list,           .prev = &core_init.list }
+#define LIST_ENTRY_CORE() { .next = &core_init.list,      .prev = &virtual_region_list }
+#define LIST_ENTRY_INIT() { .next = &virtual_region_list, .prev = &core.list }
+
 static struct virtual_region core = {
-    .list = LIST_HEAD_INIT(core.list),
+    .list = LIST_ENTRY_CORE(),
     .text_start = _stext,
     .text_end = _etext,
     .rodata_start = _srodata,
@@ -32,7 +42,7 @@ static struct virtual_region core = {
 
 /* Becomes irrelevant when __init sections are cleared. */
 static struct virtual_region core_init __initdata = {
-    .list = LIST_HEAD_INIT(core_init.list),
+    .list = LIST_ENTRY_INIT(),
     .text_start = _sinittext,
     .text_end = _einittext,
 
@@ -50,7 +60,7 @@ static struct virtual_region core_init __initdata = {
  *
  * All readers of virtual_region_list MUST use list_for_each_entry_rcu.
  */
-static LIST_HEAD(virtual_region_list);
+static struct list_head virtual_region_list = LIST_ENTRY_HEAD();
 static DEFINE_SPINLOCK(virtual_region_lock);
 static DEFINE_RCU_READ_LOCK(rcu_virtual_region_lock);
 
@@ -73,15 +83,6 @@ const struct virtual_region *find_text_region(unsigned long addr)
     return region;
 }
 
-void register_virtual_region(struct virtual_region *r)
-{
-    unsigned long flags;
-
-    spin_lock_irqsave(&virtual_region_lock, flags);
-    list_add_tail_rcu(&r->list, &virtual_region_list);
-    spin_unlock_irqrestore(&virtual_region_lock, flags);
-}
-
 /*
  * Suggest inline so when !CONFIG_LIVEPATCH the function is not left
  * unreachable after init code is removed.
@@ -96,6 +97,15 @@ static void inline remove_virtual_region(struct virtual_region *r)
 }
 
 #ifdef CONFIG_LIVEPATCH
+void register_virtual_region(struct virtual_region *r)
+{
+    unsigned long flags;
+
+    spin_lock_irqsave(&virtual_region_lock, flags);
+    list_add_tail_rcu(&r->list, &virtual_region_list);
+    spin_unlock_irqrestore(&virtual_region_lock, flags);
+}
+
 void unregister_virtual_region(struct virtual_region *r)
 {
     remove_virtual_region(r);
@@ -155,9 +165,6 @@ void __init setup_virtual_regions(const struct exception_table_entry *start,
 {
     core_init.ex = core.ex = start;
     core_init.ex_end = core.ex_end = end;
-
-    register_virtual_region(&core_init);
-    register_virtual_region(&core);
 }
 
 /*
-- 
2.30.2


