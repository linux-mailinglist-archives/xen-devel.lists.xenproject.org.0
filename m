Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0B8871EAC
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 13:12:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688769.1073329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhTdo-0007T3-NT; Tue, 05 Mar 2024 12:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688769.1073329; Tue, 05 Mar 2024 12:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhTdo-0007NG-IR; Tue, 05 Mar 2024 12:11:28 +0000
Received: by outflank-mailman (input) for mailman id 688769;
 Tue, 05 Mar 2024 12:11:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mb5t=KL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rhTdn-0007LZ-Fl
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 12:11:27 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d2d291d-dae9-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 13:11:25 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a45a15f2bafso74917266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 04:11:25 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gg4-20020a170906e28400b00a45b1194dacsm11429ejb.126.2024.03.05.04.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 04:11:24 -0800 (PST)
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
X-Inumbo-ID: 7d2d291d-dae9-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709640685; x=1710245485; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYhS+zW0jQOXj6T42uFUoaBTcCdbr7cDELY4xsIeX+0=;
        b=Qms27CZ2ENS6dBrvfKSWqb4oPJieyU6ihDFHRlBRfUB/g6iftqwh2wgJg/9jxQON8o
         ZYDsyXNfFgKGTKdsKWo6A6s7Hy3haQUumZS2wie+ufp88rdYsH7DLokJcVhJ/w2thZIV
         nCF5VkHpb/VAcMMVh3ABTYHFRDoKyTE1wG0rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709640685; x=1710245485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYhS+zW0jQOXj6T42uFUoaBTcCdbr7cDELY4xsIeX+0=;
        b=u2VluPVt9osoClaR8HVxb2rTMyXA4c1troXWc24DA7gcv9dHxcN4OtNcurJR/x/uVb
         1yEobwgthHFfWIAemcG4HJ4h+GN4UMJR5LP3SPXdhnExIvYwCb+BGmGHkl3UJ5V0Wfiy
         9vE/g8cQ4FmJ49o9wLrAg2tMxecvuiqI4F+TrL+iDfuTFSnIsUbl4HEZWQ/DAsUMsG5q
         aDC0hOBGkfEOfBD7BkYX2UK+iDLpn2D39IQYg4n311OygzuiSHTQMPv7HyurQFSZtF9L
         5+MKdzHzIK/MJ9PPSIPQZpawM4ak/syiJIGF2aocD7cEq3vy6DFIcU6UxxmbWZ5sNhxi
         Jwug==
X-Gm-Message-State: AOJu0YzG7Hxe5Z6S+8lw61LnfjdhsaNtmDpcG8Y6hywD4w9otxfVrb6X
	Qk1xoOgAdmdpFQ8EqvTgZlkqm5zWOUFUxsC3/ndhxXG4LSCu7xz5GRM0svSw6OjF6l8xCBtiTei
	E
X-Google-Smtp-Source: AGHT+IFKUyzpwhCGvtaIMMqNDhJ0YRjW8uNvEgiydyOBwEO+msMV0to3klQOpaGxv6joRGhIOplAaQ==
X-Received: by 2002:a17:906:d209:b0:a44:5927:3e67 with SMTP id w9-20020a170906d20900b00a4459273e67mr9061563ejz.23.1709640685070;
        Tue, 05 Mar 2024 04:11:25 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] xen/virtual-region: Rename start/end fields
Date: Tue,  5 Mar 2024 12:11:19 +0000
Message-Id: <20240305121121.3527944-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
References: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... to text_{start,end}.  We're about to introduce another start/end pair.

As minor cleanup, replace ROUNDUP(x, PAGE_SIZE) with the more consice
PAGE_ALIGN() ahead of duplicating the example.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/livepatch.c           |  4 ++--
 xen/common/virtual_region.c      | 19 ++++++++++---------
 xen/include/xen/virtual_region.h |  5 +++--
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 5a7d5b7be0ad..888beb273244 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -785,8 +785,8 @@ static int prepare_payload(struct payload *payload,
     region = &payload->region;
 
     region->symbols_lookup = livepatch_symbols_lookup;
-    region->start = payload->text_addr;
-    region->end = payload->text_addr + payload->text_size;
+    region->text_start = payload->text_addr;
+    region->text_end = payload->text_addr + payload->text_size;
 
     /* Optional sections. */
     for ( i = 0; i < BUGFRAME_NR; i++ )
diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
index cefef3e47e73..b74030d70065 100644
--- a/xen/common/virtual_region.c
+++ b/xen/common/virtual_region.c
@@ -11,15 +11,15 @@
 
 static struct virtual_region core = {
     .list = LIST_HEAD_INIT(core.list),
-    .start = _stext,
-    .end = _etext,
+    .text_start = _stext,
+    .text_end = _etext,
 };
 
 /* Becomes irrelevant when __init sections are cleared. */
 static struct virtual_region core_init __initdata = {
     .list = LIST_HEAD_INIT(core_init.list),
-    .start = _sinittext,
-    .end = _einittext,
+    .text_start = _sinittext,
+    .text_end = _einittext,
 };
 
 /*
@@ -39,7 +39,8 @@ const struct virtual_region *find_text_region(unsigned long addr)
     rcu_read_lock(&rcu_virtual_region_lock);
     list_for_each_entry_rcu ( iter, &virtual_region_list, list )
     {
-        if ( (void *)addr >= iter->start && (void *)addr < iter->end )
+        if ( (void *)addr >= iter->text_start &&
+             (void *)addr <  iter->text_end )
         {
             region = iter;
             break;
@@ -88,8 +89,8 @@ void relax_virtual_region_perms(void)
 
     rcu_read_lock(&rcu_virtual_region_lock);
     list_for_each_entry_rcu( region, &virtual_region_list, list )
-        modify_xen_mappings_lite((unsigned long)region->start,
-                                 ROUNDUP((unsigned long)region->end, PAGE_SIZE),
+        modify_xen_mappings_lite((unsigned long)region->text_start,
+                                 PAGE_ALIGN((unsigned long)region->text_end),
                                  PAGE_HYPERVISOR_RWX);
     rcu_read_unlock(&rcu_virtual_region_lock);
 }
@@ -100,8 +101,8 @@ void tighten_virtual_region_perms(void)
 
     rcu_read_lock(&rcu_virtual_region_lock);
     list_for_each_entry_rcu( region, &virtual_region_list, list )
-        modify_xen_mappings_lite((unsigned long)region->start,
-                                 ROUNDUP((unsigned long)region->end, PAGE_SIZE),
+        modify_xen_mappings_lite((unsigned long)region->text_start,
+                                 PAGE_ALIGN((unsigned long)region->text_end),
                                  PAGE_HYPERVISOR_RX);
     rcu_read_unlock(&rcu_virtual_region_lock);
 }
diff --git a/xen/include/xen/virtual_region.h b/xen/include/xen/virtual_region.h
index d05362071135..c76e7d7932ff 100644
--- a/xen/include/xen/virtual_region.h
+++ b/xen/include/xen/virtual_region.h
@@ -12,8 +12,9 @@
 struct virtual_region
 {
     struct list_head list;
-    const void *start;                /* Virtual address start. */
-    const void *end;                  /* Virtual address end. */
+
+    const void *text_start;                /* .text virtual address start. */
+    const void *text_end;                  /* .text virtual address end. */
 
     /* If this is NULL the default lookup mechanism is used. */
     symbols_lookup_t *symbols_lookup;
-- 
2.30.2


