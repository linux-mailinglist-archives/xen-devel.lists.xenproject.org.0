Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E46BE8805BD
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 20:59:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695596.1085442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmfc0-0005yN-1h; Tue, 19 Mar 2024 19:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695596.1085442; Tue, 19 Mar 2024 19:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmfbz-0005wH-VC; Tue, 19 Mar 2024 19:59:03 +0000
Received: by outflank-mailman (input) for mailman id 695596;
 Tue, 19 Mar 2024 19:59:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQvM=KZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmfby-0005wB-Tp
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 19:59:02 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2017d3ba-e62b-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 20:58:59 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-513d717269fso6451611e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 12:58:59 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 kh18-20020a170906f81200b00a46e56c8764sm842510ejb.114.2024.03.19.12.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 12:58:57 -0700 (PDT)
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
X-Inumbo-ID: 2017d3ba-e62b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710878338; x=1711483138; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dnd2ncmF40q2ujF48d5KIjxHE2C/jzeKs+Sg+1pVP2A=;
        b=MYz77H4dl1+qh6JWn20dX6nh0ZPfbSAAF3sMGk/IEnbyZePAZrPXr0kEEvIMj11Fhy
         dFMwuEOJ323Vs2LnKNSmoDnpcfxvYECyMrSt1ijWrgXOfa76VORS1o9S8OfUqeyyfKg9
         1nGfiIdJsinpu68CBcWZon/rME5MWi7FMfBBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710878338; x=1711483138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dnd2ncmF40q2ujF48d5KIjxHE2C/jzeKs+Sg+1pVP2A=;
        b=BJmB1Wdgk6LecKanAsOWDUSgSmc8upNpsGMPcDlGYr2mmB3BNSKLBv/q0xtBqCRHOf
         paIRQ/xM9JZ3kkaCgLPGTcC706HIU6xbYlCjutWwZo4dRZcSdikdf05lTumPC0/ZdIUa
         2ASTMIYlwt52j/M8hKKvXroEBPQrWjfYSpHuy6ulDGnaDSDMpVWTsF0T7wejOMHauc3u
         uzgfqxoaFwaeBk6JVaJN7aAGKxjoqXQS4tu6I5wRZmrhSP/hw3chY4xOs/K/xREMUmj3
         l2LxIWHMcjs1RG+JRwW73QDRWSDMloEgWjKVTjp4xynHIoebOKuLITLrjEJ+ZwkfwOZR
         LIow==
X-Gm-Message-State: AOJu0YztVlWV4ui6ZfHtoAcF1n9O/H7AZ5JUolLVjWKspnaDRgIBXmWm
	4QlvAzi1tLlqybf1w3jPW/tzhc88Ou10FBsv9KnR2xWZJUqbOeDAmxgzkUPPh0PwjmZi4eJXjK+
	P
X-Google-Smtp-Source: AGHT+IHDX4URLJwlzFgDvpJkATEYmvJ+F7reMXfQ2WfDt1QXhQsJ3s7lWm/pr/IG9SM/PYMRHqRxVw==
X-Received: by 2002:a19:6417:0:b0:513:e945:e9a7 with SMTP id y23-20020a196417000000b00513e945e9a7mr119993lfb.4.1710878337841;
        Tue, 19 Mar 2024 12:58:57 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/mm: Refine address alignment checks in modify_xen_mappings_lite()
Date: Tue, 19 Mar 2024 19:58:56 +0000
Message-Id: <20240319195856.4172284-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Require 's' to be superpage aligned if given over a superpage mapping.  This
is expected to be the case in practice, and prevents the v getting misaligned
over superpages during the processing loop.

Rmove the requirement for 'e' to be page aligned.  All this is doing is
forcing work for the caller just to satisfy an assertion.

Reported-by: Jan Beulich <JBeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm.c           | 10 ++++++----
 xen/common/virtual_region.c |  8 ++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 62f5b811bbe8..018d21f8bd92 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5900,9 +5900,9 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
  *
  * Must be limited to XEN_VIRT_{START,END}, i.e. over l2_xenmap[].
  * Must be called with present flags, and over present mappings.
- * It is the callers responsibility to not pass s or e in the middle of
- * superpages if changing the permission on the whole superpage is going to be
- * a problem.
+ * It is the callers repsonsibility to pass 's' on a PAGE/SUPERPAGE boundary,
+ * and for there to not be anything interesting in the PAGE/SUPERPAGE
+ * following 'e'.
  */
 void init_or_livepatch modify_xen_mappings_lite(
     unsigned long s, unsigned long e, unsigned int nf)
@@ -5917,7 +5917,7 @@ void init_or_livepatch modify_xen_mappings_lite(
 
     ASSERT(flags & _PAGE_PRESENT);
     ASSERT(IS_ALIGNED(s, PAGE_SIZE) && s >= XEN_VIRT_START);
-    ASSERT(IS_ALIGNED(e, PAGE_SIZE) && e <= XEN_VIRT_END);
+    ASSERT(e <= XEN_VIRT_END);
 
     while ( v < e )
     {
@@ -5929,6 +5929,8 @@ void init_or_livepatch modify_xen_mappings_lite(
 
         if ( l2e_get_flags(l2e) & _PAGE_PSE )
         {
+            ASSERT(IS_ALIGNED(v, 1 << L2_PAGETABLE_SHIFT));
+
             l2e_write_atomic(pl2e, l2e_from_intpte((l2e.l2 & ~fm) | flags));
 
             v += 1UL << L2_PAGETABLE_SHIFT;
diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
index b4325bcda71e..142f21e18153 100644
--- a/xen/common/virtual_region.c
+++ b/xen/common/virtual_region.c
@@ -93,11 +93,11 @@ void relax_virtual_region_perms(void)
     list_for_each_entry_rcu( region, &virtual_region_list, list )
     {
         modify_xen_mappings_lite((unsigned long)region->text_start,
-                                 PAGE_ALIGN((unsigned long)region->text_end),
+                                 (unsigned long)region->text_end,
                                  PAGE_HYPERVISOR_RWX);
         if ( region->rodata_start )
             modify_xen_mappings_lite((unsigned long)region->rodata_start,
-                                     PAGE_ALIGN((unsigned long)region->rodata_end),
+                                     (unsigned long)region->rodata_end,
                                      PAGE_HYPERVISOR_RW);
     }
     rcu_read_unlock(&rcu_virtual_region_lock);
@@ -111,11 +111,11 @@ void tighten_virtual_region_perms(void)
     list_for_each_entry_rcu( region, &virtual_region_list, list )
     {
         modify_xen_mappings_lite((unsigned long)region->text_start,
-                                 PAGE_ALIGN((unsigned long)region->text_end),
+                                 (unsigned long)region->text_end,
                                  PAGE_HYPERVISOR_RX);
         if ( region->rodata_start )
             modify_xen_mappings_lite((unsigned long)region->rodata_start,
-                                     PAGE_ALIGN((unsigned long)region->rodata_end),
+                                     (unsigned long)region->rodata_end,
                                      PAGE_HYPERVISOR_RO);
     }
     rcu_read_unlock(&rcu_virtual_region_lock);

base-commit: 188fa82305e72b725473db9146e20cc9abf7bff3
-- 
2.30.2


