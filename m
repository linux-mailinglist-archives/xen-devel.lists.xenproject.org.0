Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E389855BA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 10:43:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803577.1214281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNc8-0006fq-6b; Wed, 25 Sep 2024 08:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803577.1214281; Wed, 25 Sep 2024 08:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNc8-0006dF-24; Wed, 25 Sep 2024 08:43:12 +0000
Received: by outflank-mailman (input) for mailman id 803577;
 Wed, 25 Sep 2024 08:43:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stNc6-0005cc-NC
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 08:43:10 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 316db50a-7b1a-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 10:43:10 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53659867cbdso9526179e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 01:43:10 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f342b2sm186015666b.35.2024.09.25.01.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 01:43:08 -0700 (PDT)
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
X-Inumbo-ID: 316db50a-7b1a-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727253789; x=1727858589; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIoU0qLfgLq7otbwa+2RabVnL5gbGYSnBya+EH+CZUc=;
        b=ERtN6oMhiFptWQSrK1zE+UjA9479uOME3KUOJxFAfwO/B++VYqEHOLDKcK7vAr4RS6
         ES8aIMWrIF1XzhmqDfH73HZeWjx1xgAgTURet51w4oAq+Ub+4kEi9J6p13nynYYYDU+d
         ZbhqxQ9oE5PZGB7xICwuh3sBRhmLBTl1XVXzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727253789; x=1727858589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIoU0qLfgLq7otbwa+2RabVnL5gbGYSnBya+EH+CZUc=;
        b=BqBPR6tvGF7RPM3hbGN1NMv9DztuIFizFzyQb5Ris6RJRlm+pAiVBIS8Uj4fHgwIQx
         H0xOg/9JQUXvGDa/PpUmCGymehPHqEUaJpjeAdVal7Ev9325CkZa6FmP1LxxVb74kFbT
         8AC17Ke5qAiJPr6aHFtjQDgOIV18/bWBrfChjMvCPbs5hpDIjDdzIDT4zB88tRTH4cU9
         NRG8GniCKcZJRHKLOueasrLvNeGyi5X73r+51DcxddGP25jiZJYgP+G5at/zRqXGRY9V
         5Yd8DKuzQu4VVLKAGgg9EKXlzIpMBU31mfDnzdzOB9g/GmrshFHJZaFhqojQW5Fa78E9
         t12g==
X-Gm-Message-State: AOJu0YwBdSd7zuMnhekvpMv9bXsyc3bV2YZo0Jiun/9PKkCVQUBqCIXG
	X5C6kRBzYxlTdPvoENKF9dqcs1LditlqDeWcfN7ES6HmHH/iwYZ/MyDXgOKZbybNC5/eGaNjiM8
	4
X-Google-Smtp-Source: AGHT+IGAJxXrOJKWWYE++Az9EmNjRFtYtY10OTMbUrs4O6zomSSaPkMP+kehHNh2F/62zfuytT44Ig==
X-Received: by 2002:a05:6512:a8d:b0:536:53e3:feae with SMTP id 2adb3069b0e04-5387048a6cbmr1383668e87.11.1727253789227;
        Wed, 25 Sep 2024 01:43:09 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 5/6] x86/alternatives: do not BUG during apply
Date: Wed, 25 Sep 2024 10:42:38 +0200
Message-ID: <20240925084239.85649-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925084239.85649-1-roger.pau@citrix.com>
References: <20240925084239.85649-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

alternatives is used both at boot time, and when loading livepatch payloads.
While for the former it makes sense to panic, it's not useful for the later, as
for livepatches it's possible to fail to load the livepatch if alternatives
cannot be resolved and continue operating normally.

Relax the BUGs in _apply_alternatives() to instead return an error code.  The
caller will figure out whether the failures are fatal and panic.

Print an error message to provide some user-readable information about what
went wrong.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Unconditionally return from _apply_alternative() and let the caller panic
   if required.
 - Remove test, as next patch imposes restrictions that break the test.
---
 xen/arch/x86/alternative.c             | 46 ++++++++++++++++++++------
 xen/arch/x86/include/asm/alternative.h |  2 +-
 xen/common/livepatch.c                 | 10 +++++-
 3 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 7824053c9d33..c8848ba6006e 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -175,9 +175,9 @@ extern void *const __initdata_cf_clobber_end[];
  * invocation, such that no CALLs/JMPs to NULL pointers will be left
  * around. See also the further comment below.
  */
-static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
-                                                  struct alt_instr *end,
-                                                  bool force)
+static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
+                                                 struct alt_instr *end,
+                                                 bool force)
 {
     struct alt_instr *a, *base;
 
@@ -198,9 +198,29 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
         uint8_t buf[MAX_PATCH_LEN];
         unsigned int total_len = a->orig_len + a->pad_len;
 
-        BUG_ON(a->repl_len > total_len);
-        BUG_ON(total_len > sizeof(buf));
-        BUG_ON(a->cpuid >= NCAPINTS * 32);
+        if ( a->repl_len > total_len )
+        {
+            printk(XENLOG_ERR
+                   "alt replacement size (%#x) bigger than destination (%#x)\n",
+                   a->repl_len, total_len);
+            return -ENOSPC;
+        }
+
+        if ( total_len > sizeof(buf) )
+        {
+            printk(XENLOG_ERR
+                   "alt destination size (%#x) bigger than buffer (%#zx)\n",
+                   total_len, sizeof(buf));
+            return -ENOSPC;
+        }
+
+        if ( a->cpuid >= NCAPINTS * 32 )
+        {
+             printk(XENLOG_ERR
+                   "alt CPU feature (%#x) outside of featureset range (%#x)\n",
+                   a->cpuid, NCAPINTS * 32);
+            return -ERANGE;
+        }
 
         /*
          * Detect sequences of alt_instr's patching the same origin site, and
@@ -356,12 +376,14 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
 
         printk("altcall: Optimised away %u endbr64 instructions\n", clobbered);
     }
+
+    return 0;
 }
 
 #ifdef CONFIG_LIVEPATCH
-void apply_alternatives(struct alt_instr *start, struct alt_instr *end)
+int apply_alternatives(struct alt_instr *start, struct alt_instr *end)
 {
-    _apply_alternatives(start, end, true);
+    return _apply_alternatives(start, end, true);
 }
 #endif
 
@@ -383,6 +405,8 @@ static int __init cf_check nmi_apply_alternatives(
      */
     if ( !(alt_done & alt_todo) )
     {
+        int rc;
+
         /*
          * Relax perms on .text to be RWX, so we can modify them.
          *
@@ -394,8 +418,10 @@ static int __init cf_check nmi_apply_alternatives(
                                  PAGE_HYPERVISOR_RWX);
         flush_local(FLUSH_TLB_GLOBAL);
 
-        _apply_alternatives(__alt_instructions, __alt_instructions_end,
-                            alt_done);
+        rc = _apply_alternatives(__alt_instructions, __alt_instructions_end,
+                                 alt_done);
+        if ( rc )
+            panic("Unable to apply alternatives: %d\n", rc);
 
         /*
          * Reinstate perms on .text to be RX.  This also cleans out the dirty
diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index a86eadfaecbd..69555d781ef9 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -24,7 +24,7 @@ struct __packed alt_instr {
 
 extern void add_nops(void *insns, unsigned int len);
 /* Similar to alternative_instructions except it can be run with IRQs enabled. */
-extern void apply_alternatives(struct alt_instr *start, struct alt_instr *end);
+extern int apply_alternatives(struct alt_instr *start, struct alt_instr *end);
 extern void alternative_instructions(void);
 extern void alternative_branches(void);
 
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 895c425cd5ea..c777f64d88d4 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -896,7 +896,15 @@ static int prepare_payload(struct payload *payload,
                 return -EINVAL;
             }
         }
-        apply_alternatives(start, end);
+
+        rc = apply_alternatives(start, end);
+        if ( rc )
+        {
+            printk(XENLOG_ERR LIVEPATCH "%s applying alternatives failed: %d\n",
+                   elf->name, rc);
+            return rc;
+        }
+
     alt_done:;
 #else
         printk(XENLOG_ERR LIVEPATCH "%s: We don't support alternative patching\n",
-- 
2.46.0


