Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7111687E7F2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 12:05:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694591.1083465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmAnY-00086T-LC; Mon, 18 Mar 2024 11:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694591.1083465; Mon, 18 Mar 2024 11:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmAnY-0007xu-Gt; Mon, 18 Mar 2024 11:04:56 +0000
Received: by outflank-mailman (input) for mailman id 694591;
 Mon, 18 Mar 2024 11:04:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=we9v=KY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmAnW-0007RW-Kd
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 11:04:54 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5944d93b-e517-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 12:04:54 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso5161527a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 04:04:54 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f22-20020aa7d856000000b0056b818544a9sm324882eds.90.2024.03.18.04.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 04:04:52 -0700 (PDT)
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
X-Inumbo-ID: 5944d93b-e517-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710759893; x=1711364693; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWCsjWzVUd6sUyetSs9CWtqz4kTMclSOuQ/QVUP2fXQ=;
        b=W+TgMkZ8NmZt3fusV1/9lhb2JQoM9sEJIqY7GPGX5uYZ2zIPu7xetXvzH4c6oiGzWn
         ifx+sDZIjbyygSS5LsTPO9soshIE+N0O70HhWFLPZf+grseh62BoNh3vqoe/eiwDwplg
         qnWLY1eH6QwYZXizVSEW/0ap8h3WDhPFKhaiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710759893; x=1711364693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWCsjWzVUd6sUyetSs9CWtqz4kTMclSOuQ/QVUP2fXQ=;
        b=KPPNR6C5j6gm7Echvnuj4cdjFLMfQx2M4XE8D/9Hz6xo9Wk6exmRTgKy3nM55A4aDj
         2AOWLH6eUzujhxK1y7r+9fqdUI7KO43uUvXRPy+zDUjKGOsQTmsOWeAyDSg59mvcgZm+
         TLEMBtcrF4NfKigrO9DtHHUId4EclakDVPAgYyy1NEHLl+8Cd0y6isMWeV0dQnLszUlB
         ZUFtvP17hCRH4kdtzIb5BS+JqwZ6uvTnibaLegCXrWB1Rsfrn3pfk47p/fEpwBjKEQxS
         iPBTY4JglHpLLZdwu9BlH1eb99IVCk6O7GhiTL1g3mt2HUPQcyePfj8cj91GDo5NoV9X
         j/GQ==
X-Gm-Message-State: AOJu0Yw/YHP9B+U19ijMGXcu2naaISeJmHx3VqCTa6F/MT8AIu4R7vgp
	QXOJUUEao4AjLHJfmT+9hxwbtNRXAb24pGxKI+mr22gRQ7nDbqi/dQoWvFtqLhE3x6D1Sl0Y7mR
	0
X-Google-Smtp-Source: AGHT+IHYOf7G6CCC/WpXt7wf04NgE600a46ujZCW14kFOdpdY1FfSSehIjbad2g+Xr0NJDLNscsEVQ==
X-Received: by 2002:a05:6402:3784:b0:566:9fef:1ee9 with SMTP id et4-20020a056402378400b005669fef1ee9mr7994038edb.22.1710759893206;
        Mon, 18 Mar 2024 04:04:53 -0700 (PDT)
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
Subject: [PATCH 3/4] xen/virtual-region: Link the list build time
Date: Mon, 18 Mar 2024 11:04:41 +0000
Message-Id: <20240318110442.3653997-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240318110442.3653997-1-andrew.cooper3@citrix.com>
References: <20240318110442.3653997-1-andrew.cooper3@citrix.com>
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
---
 xen/common/virtual_region.c | 45 ++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
index eb9645daa99d..ad39bb74e15c 100644
--- a/xen/common/virtual_region.c
+++ b/xen/common/virtual_region.c
@@ -15,8 +15,19 @@ extern const struct bug_frame
     __start_bug_frames_2[], __stop_bug_frames_2[],
     __start_bug_frames_3[], __stop_bug_frames_3[];
 
+/*
+ * For the built-in regions, the double linked list can be constructed at
+ * build time.  Forward-declare the elements.
+ */
+static struct list_head virtual_region_list;
+static struct virtual_region core, core_init;
+
 static struct virtual_region core = {
-    .list = LIST_HEAD_INIT(core.list),
+    .list = {
+        .next = &core_init.list,
+        .prev = &virtual_region_list,
+    },
+
     .text_start = _stext,
     .text_end = _etext,
     .rodata_start = _srodata,
@@ -32,7 +43,11 @@ static struct virtual_region core = {
 
 /* Becomes irrelevant when __init sections are cleared. */
 static struct virtual_region core_init __initdata = {
-    .list = LIST_HEAD_INIT(core_init.list),
+    .list = {
+        .next = &virtual_region_list,
+        .prev = &core.list,
+    },
+
     .text_start = _sinittext,
     .text_end = _einittext,
 
@@ -50,7 +65,10 @@ static struct virtual_region core_init __initdata = {
  *
  * All readers of virtual_region_list MUST use list_for_each_entry_rcu.
  */
-static LIST_HEAD(virtual_region_list);
+static struct list_head virtual_region_list = {
+    .next = &core.list,
+    .prev = &core_init.list,
+};
 static DEFINE_SPINLOCK(virtual_region_lock);
 static DEFINE_RCU_READ_LOCK(rcu_virtual_region_lock);
 
@@ -73,15 +91,6 @@ const struct virtual_region *find_text_region(unsigned long addr)
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
@@ -96,6 +105,15 @@ static void inline remove_virtual_region(struct virtual_region *r)
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
@@ -155,9 +173,6 @@ void __init setup_virtual_regions(const struct exception_table_entry *start,
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


