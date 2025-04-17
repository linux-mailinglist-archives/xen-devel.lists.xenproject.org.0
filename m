Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9513DA9216F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 17:27:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958061.1351064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5R8W-0000Kd-EC; Thu, 17 Apr 2025 15:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958061.1351064; Thu, 17 Apr 2025 15:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5R8W-0000FQ-AB; Thu, 17 Apr 2025 15:26:44 +0000
Received: by outflank-mailman (input) for mailman id 958061;
 Thu, 17 Apr 2025 15:26:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dr0F=XD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u5R8U-0008DN-Mv
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 15:26:42 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c6ca37c-1ba0-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 17:26:40 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5e677f59438so1332279a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 08:26:40 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-acb6ec046c0sm8618466b.32.2025.04.17.08.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 08:26:39 -0700 (PDT)
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
X-Inumbo-ID: 5c6ca37c-1ba0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744903600; x=1745508400; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbVg709ccWDZ6LNYkLzgs4K1sN1hcawU+4pGGR/lOrY=;
        b=DYtvnQB36EhoAFShWWXWqFf9rhdTQHwou26yY6DjHPDD1A3SKPF0LLS3pF6/q6v/i0
         C8C9WJ0+Z6BTzJEho3dnbsGsfDSfXVlNZApgOUY1+YGwD1QK/L0cP1ndPiRiLz2F61qL
         S7x+4+q9XGcMVgHBF3isiyKkw2s+dJgFeUDpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744903600; x=1745508400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbVg709ccWDZ6LNYkLzgs4K1sN1hcawU+4pGGR/lOrY=;
        b=Ylo78t3EP+fvkY72rNdGj65AlqS0CSbUSUgBPIIB8bTtAL8GZb01eKfu8ZbgLCfQ00
         1dQOCDixIUt7wXjFsCfSB/n7PyDaSJv8Vt14m6MCiSIPWtm5d50uiQEtB7RcUHq1WBKh
         tRshviuu9bx0lh/5eU2K/EjhxXc6Hxb3fiCJnMzwxSAFUxMNaG9hcYuOhjjTvfJTTb+M
         8Rcy/yn0I1lNNMrY4fcIWm9KBbUqIVZM1q8a/FdD96e9PEqWQRP8WPLLobcw9E6GSwcI
         MZiSJLa9dBnwsoCf1jMsHUbqjiXXpMh/Jw5nm7K9zCFlgnxjKUXbEFfR9qv5VMP6nb+p
         8BZQ==
X-Gm-Message-State: AOJu0YzV49Or20BJOogYnTlbXYIsXPvc5NCnuGjXzRyR+6mr7BRBwk6M
	KnbsmbVjoY7cYZ/FqddMfv9LWhWxTjZd4AtST0rfpjNoDotjgtPlMTtwIc7qMg83dIj//FQdO95
	l
X-Gm-Gg: ASbGncv6OVIHjTPYNCQiyjNggYqUHF9FatyJFZC8o7fkjYSHK4l6RSg0XYN+CUxpT/T
	mFyuRwjt1IevHreN+tgJesNl2TETurKMNWPITQEIouHwKlObP/0GIKV1WQzHGk3p1PDsSajkAGb
	Sa8W8Zt0rMAa0XZYz/O0LL2PuAAAlNbWw9H/YjUNQdw4n6o//JCqYAmSQv5BwLn7xiYtVq85UWS
	wEO5j9CqhMxfAEUXc4nLKPGvb8nihgcZIRpIOdGrr3FNKC+Sag2jqmd8AWvkOjDqA4wvyIu3MTO
	ZbnXvwtDzG2QgiYGmqi4qjZcwBMDLP+q+H0WpyTruQ+kmA==
X-Google-Smtp-Source: AGHT+IHzOJRIt25fRgmm3QpyMY/ZAku9BqBUeBglkH0FCpSzrhjAYXYwNSH/8eHTWn/UDlH18PrYVA==
X-Received: by 2002:a17:907:3f0a:b0:aca:d6f0:af0c with SMTP id a640c23a62f3a-acb42c5fa5bmr441959566b.59.1744903599924;
        Thu, 17 Apr 2025 08:26:39 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 4/4] x86/mm: move mmio_ro_emulated_write() to PV only file
Date: Thu, 17 Apr 2025 17:25:14 +0200
Message-ID: <20250417152514.13702-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250417152514.13702-1-roger.pau@citrix.com>
References: <20250417152514.13702-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

mmio_ro_emulated_write() is only used in pv/ro-page-fault.c, move the
function to that file and make it static.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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
index 0e29bab03a95..9ac855f998dc 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5144,32 +5144,6 @@ void subpage_mmio_write_emulate(
         goto write_ignored;
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
index 11b01c479e43..3dd795288379 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -298,6 +298,14 @@ static int ptwr_do_page_fault(struct x86_emulate_ctxt *ctxt,
  * fault handling for read-only MMIO pages
  */
 
+struct mmio_ro_emulate_ctxt {
+    unsigned long cr2;
+    /* Used only for mmcfg case */
+    unsigned int seg, bdf;
+    /* Used only for non-mmcfg case */
+    mfn_t mfn;
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


