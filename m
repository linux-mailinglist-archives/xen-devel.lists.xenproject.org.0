Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE066E7E92
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 17:43:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523579.813787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp9xQ-0002P6-Tb; Wed, 19 Apr 2023 15:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523579.813787; Wed, 19 Apr 2023 15:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp9xQ-0002Eg-NW; Wed, 19 Apr 2023 15:42:56 +0000
Received: by outflank-mailman (input) for mailman id 523579;
 Wed, 19 Apr 2023 15:42:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RA+/=AK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pp9xO-0001fS-WB
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 15:42:54 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9091f47-dec8-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 17:42:53 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id y24so6980342ljm.6
 for <xen-devel@lists.xenproject.org>; Wed, 19 Apr 2023 08:42:53 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 f3-20020a2e6a03000000b00298dc945e9bsm2945367ljc.125.2023.04.19.08.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 08:42:52 -0700 (PDT)
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
X-Inumbo-ID: d9091f47-dec8-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681918973; x=1684510973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK6lOiJmrrx8EIkDgF6+ULo+pkwl5Br6n5iUV/9+gh0=;
        b=JY3+kb4x2B3fIW868V/DEQbhu+mTCUCi1tY01W+zSiNxgxm9xuR3y8tCW4kOQViPIK
         /RCkVPNQUc4KfL2ShZuG+bT0+PNuDRLZkhIw1xQaVaOqDGdiXJGeXQzLyxqhFM+YkbxK
         qXw/4BuAUE90ea2JDSeWo1ujNpatGO1FPLbx7I885L15uACE2DjzA20Vx/JgFwWFkpYr
         g7tUR/jB7BuCYhb2qv2dGuiu00lF+rT70xuwZNAn5zlX7yzWNVNtOfJfWKf2Q9ts9UIe
         hJM1vfO42IUk4/UFJYhcfHeAILiMpvr/Pye9uTf9k2kCtLPzVjZiAhNV+BDZS04nu383
         wqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681918973; x=1684510973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sK6lOiJmrrx8EIkDgF6+ULo+pkwl5Br6n5iUV/9+gh0=;
        b=SKQ3xIjjGIxoOQ79mLsmDqmEF338cowCVNKrO/N0GxJoRmkyrGWdegi9nGpBFKMLnG
         SNMaw/6FBogIvluuCB1U1zQ4U/DoQoHOEimIO2pgRBQXeR2tSrKsZHb2QbQCR2HbN98g
         cwQK9JxzUKQvPnQvQAnsBOuW8oaIG4ScE9j1rUvxDpxUf5lHZ4Ywr0N0K0fL4mYeIObK
         oJpQWsf8NGnhvj/iWimSzLk9xNckWSILM5PfsLF7GrK2npUif3js7tfL5bKS7uAHBdXG
         apnp5+4nFlHep7RiuSk1jdY1J4cRNSxcLVLFevl3mm6XrgSzXx8y+3mGEBLkCIaHhTLx
         6kEA==
X-Gm-Message-State: AAQBX9cS4HA7z9IjdGEHIPojyUFuk38tvLLVNbu8f8BWZyqX5mnJRyMf
	OxzEjAgFqwCJLOrUEMCelkc2Sv5bs+M=
X-Google-Smtp-Source: AKy350bGcPFjMvPqoJslalD3B9AiEdsxHV+y7m279vTxSFKXJbRv+mXVwElB34h0bTjwCmFPzOHvNw==
X-Received: by 2002:a2e:b041:0:b0:2a8:ea22:28b5 with SMTP id d1-20020a2eb041000000b002a8ea2228b5mr1253128ljl.4.1681918972863;
        Wed, 19 Apr 2023 08:42:52 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v5 3/4] xen/riscv: setup initial pagetables
Date: Wed, 19 Apr 2023 18:42:46 +0300
Message-Id: <cbd1417ddfc62de0d730511040d48c608cc09ea4.1681918194.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1681918194.git.oleksii.kurochko@gmail.com>
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch does two thing:
1. Setup initial pagetables.
2. Enable MMU which end up with code in
   cont_after_mmu_is_enabled()

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
 - Nothing changed. Only rebase
---
Changes in V4:
 - Nothing changed. Only rebase
---
Changes in V3:
 - update the commit message that MMU is also enabled here
 - remove early_printk("All set up\n") as it was moved to
   cont_after_mmu_is_enabled() function after MMU is enabled.
---
Changes in V2:
 * Update the commit message
---
 xen/arch/riscv/setup.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 315804aa87..cf5dc5824e 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -21,7 +21,10 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 {
     early_printk("Hello from C env\n");
 
-    early_printk("All set up\n");
+    setup_initial_pagetables();
+
+    enable_mmu();
+
     for ( ;; )
         asm volatile ("wfi");
 
-- 
2.39.2


