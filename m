Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 377FEA85A8F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 12:54:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947035.1344811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3C1j-0001MX-Av; Fri, 11 Apr 2025 10:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947035.1344811; Fri, 11 Apr 2025 10:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3C1j-0001Ib-4D; Fri, 11 Apr 2025 10:54:27 +0000
Received: by outflank-mailman (input) for mailman id 947035;
 Fri, 11 Apr 2025 10:54:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U3ez=W5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u3C1h-00006G-8N
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 10:54:25 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 542a5a8e-16c3-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 12:54:23 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39c14016868so1566442f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 03:54:23 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39eae96c70csm1677896f8f.38.2025.04.11.03.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 03:54:22 -0700 (PDT)
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
X-Inumbo-ID: 542a5a8e-16c3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744368863; x=1744973663; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdHHb20HOi9ewMxj1HKA2pF0/OWllbuDky2HQy9a5pQ=;
        b=Gu5QblXb/oaZsHKXi7QC7PTHWqeMUsME+deQF0yS0amWDy6h5I8Mlu8pcQy/EgI2yE
         35ze9voBpMHI8PbqhzBynd6BNin6kJbSOoGLxyTAaqFnWVSJNU+pMoeZC9T5TjFqPfCm
         7nq36iNrb9AvTqOg0tk+suVZ4WpFvb+8gT7DE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744368863; x=1744973663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdHHb20HOi9ewMxj1HKA2pF0/OWllbuDky2HQy9a5pQ=;
        b=M9Y2bCWnbn75dhLPvAbo+cOHiLyDCzXrhqdPpBzL5Q0uT0NUqypXg+mmatWNVXn9Mo
         H70TB7qHmfmonuYf7P8I+1vx/4kyLTX2gCnK0MxMP+gYNzzj7y4hxa6WIs9oCybdTbMm
         ITtucgM+D+p+/h1mr/PUXgGCt9J9SnbJoY8cSRqRBMEv/sLoamf1lfDBcSybYtU9gn3J
         Cba/HJpbh3+ODxO6Oda2UXaULa8AXxEbqG1f6O47pOmngCJ9lAdpouI5XLRvtsdrOKCm
         +jOa45TibH8DTB3W7KkspqJWqMukrwonNJoB1kvwfmZuC+4I5TQHuai9qVRzNDhEQdic
         fgXQ==
X-Gm-Message-State: AOJu0YwxVcPzwewLWK37YtQxrqHU7YWA79KSi3joOlpSSIY+uVQRChrR
	v1BTcd0/IkhwBT1P1F27NKGewCOnRVsebSS7VrdqU7kP6tO1jb15wCP3K5uKU8XRyyqoiwfFa7r
	Y
X-Gm-Gg: ASbGnctrGFO8zNKFtUi7YAokpb79UJGGCXrBd9fG+jTZi8Hb5qdl41x/qGbHQltHZzk
	mYJEGhlYYlqPeEEpcicSMEKi+GMYYw0xtlnt+OQeAMkrfeitNpmA71dXEpxRisry81jYlzhWU2D
	xHJ0c4yBAXBO8MPdql1nzVPI6y9EYeiSRUSd3KiGupTMFrwKjHhlLXPBihqMmmBXnT9L1Jo3P4V
	k7wit5WpapTG4iiqDJ1mJAHThL28PTwKWj5kMU9aZS7v98SdHphb2HTs7xoWYkXZMobfwmsKjDk
	taC2TJaPjbUj+rCjqdBP+GtNq7GkkJTvDoQNudFyWbfPrg==
X-Google-Smtp-Source: AGHT+IGgYhUzdc9FW83ZPtcCp31uhkyhKc744vxfZo8AV0cfCbfSjJYJXDsMf7Wu6O70OV3GcQ9VBg==
X-Received: by 2002:a05:6000:400f:b0:39c:dfa:d33e with SMTP id ffacd0b85a97d-39ea52154a0mr1849055f8f.23.1744368862766;
        Fri, 11 Apr 2025 03:54:22 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 5/5] x86/mm: move mmio_ro_emulated_write() to PV only file
Date: Fri, 11 Apr 2025 12:54:11 +0200
Message-ID: <20250411105411.22334-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250411105411.22334-1-roger.pau@citrix.com>
References: <20250411105411.22334-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

mmio_ro_emulated_write() is only used in pv/ro-page-fault.c, move the
function to that file and make it static.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/mm.h   | 12 ------------
 xen/arch/x86/mm.c               | 26 -------------------------
 xen/arch/x86/pv/ro-page-fault.c | 34 +++++++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 38 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index aeb8ebcf2d56..2665daa6f74f 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -542,18 +542,6 @@ void memguard_unguard_stack(void *p);
 int subpage_mmio_ro_add(paddr_t start, size_t size);
 bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla);
 
-struct mmio_ro_emulate_ctxt {
-        unsigned long cr2;
-        /* Used only for mmcfg case */
-        unsigned int seg, bdf;
-        /* Used only for non-mmcfg case */
-        mfn_t mfn;
-};
-
-int cf_check mmio_ro_emulated_write(
-    enum x86_segment seg, unsigned long offset, void *p_data,
-    unsigned int bytes, struct x86_emulate_ctxt *ctxt);
-
 /* r/o MMIO subpage access handlers. */
 struct subpage_ro_range {
     struct list_head list;
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 3bc6304d831c..7c6a5fde5ebd 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5142,32 +5142,6 @@ void subpage_mmio_write_emulate(
     write_mmio(addr + offset, data, len);
 }
 
-int cf_check mmio_ro_emulated_write(
-    enum x86_segment seg,
-    unsigned long offset,
-    void *p_data,
-    unsigned int bytes,
-    struct x86_emulate_ctxt *ctxt)
-{
-    struct mmio_ro_emulate_ctxt *mmio_ro_ctxt = ctxt->data;
-    unsigned long data = 0;
-
-    /* Only allow naturally-aligned stores at the original %cr2 address. */
-    if ( ((bytes | offset) & (bytes - 1)) || !bytes ||
-         offset != mmio_ro_ctxt->cr2 || bytes > sizeof(data) )
-    {
-        gdprintk(XENLOG_WARNING, "bad access (cr2=%lx, addr=%lx, bytes=%u)\n",
-                mmio_ro_ctxt->cr2, offset, bytes);
-        return X86EMUL_UNHANDLEABLE;
-    }
-
-    memcpy(&data, p_data, bytes);
-    subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
-                               data, bytes);
-
-    return X86EMUL_OKAY;
-}
-
 /*
  * For these PTE APIs, the caller must follow the alloc-map-unmap-free
  * lifecycle, which means explicitly mapping the PTE pages before accessing
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index 11b01c479e43..8b1c25e60c17 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -298,6 +298,14 @@ static int ptwr_do_page_fault(struct x86_emulate_ctxt *ctxt,
  * fault handling for read-only MMIO pages
  */
 
+struct mmio_ro_emulate_ctxt {
+        unsigned long cr2;
+        /* Used only for mmcfg case */
+        unsigned int seg, bdf;
+        /* Used only for non-mmcfg case */
+        mfn_t mfn;
+};
+
 static int cf_check mmcfg_intercept_write(
     enum x86_segment seg,
     unsigned long offset,
@@ -329,6 +337,32 @@ static int cf_check mmcfg_intercept_write(
     return X86EMUL_OKAY;
 }
 
+static int cf_check mmio_ro_emulated_write(
+    enum x86_segment seg,
+    unsigned long offset,
+    void *p_data,
+    unsigned int bytes,
+    struct x86_emulate_ctxt *ctxt)
+{
+    struct mmio_ro_emulate_ctxt *mmio_ro_ctxt = ctxt->data;
+    unsigned long data = 0;
+
+    /* Only allow naturally-aligned stores at the original %cr2 address. */
+    if ( ((bytes | offset) & (bytes - 1)) || !bytes ||
+         offset != mmio_ro_ctxt->cr2 || bytes > sizeof(data) )
+    {
+        gdprintk(XENLOG_WARNING, "bad access (cr2=%lx, addr=%lx, bytes=%u)\n",
+                mmio_ro_ctxt->cr2, offset, bytes);
+        return X86EMUL_UNHANDLEABLE;
+    }
+
+    memcpy(&data, p_data, bytes);
+    subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
+                               data, bytes);
+
+    return X86EMUL_OKAY;
+}
+
 static const struct x86_emulate_ops mmio_ro_emulate_ops = {
     .read       = x86emul_unhandleable_rw,
     .insn_fetch = ptwr_emulated_insn_fetch,
-- 
2.48.1


