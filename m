Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAD1987149
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805204.1216276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stld9-00023i-Td; Thu, 26 Sep 2024 10:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805204.1216276; Thu, 26 Sep 2024 10:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stld9-0001vw-O2; Thu, 26 Sep 2024 10:21:51 +0000
Received: by outflank-mailman (input) for mailman id 805204;
 Thu, 26 Sep 2024 10:21:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahor=QY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stld8-0001Nm-5k
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:21:50 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 237aee3b-7bf1-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 12:21:48 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c5cc65a8abso703067a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 03:21:48 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f342b2sm332765566b.35.2024.09.26.03.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 03:21:47 -0700 (PDT)
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
X-Inumbo-ID: 237aee3b-7bf1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727346108; x=1727950908; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APxF9Bl1InkMM9iMqBKqPkfFhMVAK4FzRCdwpSCpgSI=;
        b=LLfsei3ZSuvzxybLHuct7NkEBdsx8w9YQ0FP3k68a0BB70ySA1j3bxXHQmGxil8jnm
         eqhzndLXTzGA1+OT5h4WRPxyM7ECltej8vn7/XMrsk6DqIUkgA0Vy6LNZgvScYnP7fx4
         Uf82aCJ6KixBWsznTwvg6wH+L4i+V/6DvHe/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727346108; x=1727950908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APxF9Bl1InkMM9iMqBKqPkfFhMVAK4FzRCdwpSCpgSI=;
        b=EYmouOv9LuB2BMhiDcJD8SJwOf5l/FY9r8bC+FO4LIdzOYtS477wK2SxHB0YfkMXa3
         ltv9IMK9sT6j6uhWhYywEFVuLuOYrufG0K/Qm73StjJcjBsLkYZgfUEfcPKRA0KC0DY9
         +ofj60YMGIdvulOdYQXAl8dL0HPytYcB8EzIjFS04K3SJbtXYR9WL2vNJW0v6o6EVQL8
         qbsljQBHoATXDOAIJVgempzbRFuXXSodjRqI8EthAgmW+WmPX08gNvYgS3cAPjtn7JOh
         Y2o4Nbp2a6tPolTBZUtAXTJOrdAzkLbO4pCTY82xnlBh/0sNhlLQm+RtDcDPZ34wL69U
         GA2Q==
X-Gm-Message-State: AOJu0YyBmN+y5UHQ1cExtitQAFEp2GliKaE9n0+DLKj6Ih89xOaBrejS
	HxT2ybO2o4/BfQ3bijCmOP+QRiJeFqGPXqXo7a85ldLWCAEM5DSNjJ+BclLZN2nWi3MM2FJC1Z6
	Z
X-Google-Smtp-Source: AGHT+IEpnI5inZgEGWW/leVgs7iqBEFDMfSTnMsBkyRIvPpmzzNgAKGYoFC3AMcGgvdgENCgr1jRyA==
X-Received: by 2002:a17:907:940d:b0:a8d:3338:a492 with SMTP id a640c23a62f3a-a93a031e15fmr520438866b.7.1727346107669;
        Thu, 26 Sep 2024 03:21:47 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v3 4/5] x86/alternatives: do not BUG during apply
Date: Thu, 26 Sep 2024 12:14:30 +0200
Message-ID: <20240926101431.97444-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240926101431.97444-1-roger.pau@citrix.com>
References: <20240926101431.97444-1-roger.pau@citrix.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v2:
 - Improve log messages.

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
index 7824053c9d33..990b7c600932 100644
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
+                   "alt for %ps, replacement size %#x larger than origin %#x\n",
+                    ALT_ORIG_PTR(a), a->repl_len, total_len);
+            return -ENOSPC;
+        }
+
+        if ( total_len > sizeof(buf) )
+        {
+            printk(XENLOG_ERR
+                   "alt for %ps, origin size %#x bigger than buffer %#zx\n",
+                   ALT_ORIG_PTR(a), total_len, sizeof(buf));
+            return -ENOSPC;
+        }
+
+        if ( a->cpuid >= NCAPINTS * 32 )
+        {
+             printk(XENLOG_ERR
+                   "alt for %ps, feature %#x outside of featureset range %#x\n",
+                   ALT_ORIG_PTR(a), a->cpuid, NCAPINTS * 32);
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
index f7db4be96e66..6793cb60d1e2 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -888,7 +888,15 @@ static int prepare_payload(struct payload *payload,
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


