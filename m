Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D45A8A2D4
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 17:34:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954143.1348501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4iJ1-0005vL-Rs; Tue, 15 Apr 2025 15:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954143.1348501; Tue, 15 Apr 2025 15:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4iJ1-0005sH-MN; Tue, 15 Apr 2025 15:34:35 +0000
Received: by outflank-mailman (input) for mailman id 954143;
 Tue, 15 Apr 2025 15:34:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGoX=XB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4iJ0-0005R7-Ko
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 15:34:34 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 208a35aa-1a0f-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 17:34:33 +0200 (CEST)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-73712952e1cso5494388b3a.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 08:34:33 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b02a3220ff0sm9406327a12.66.2025.04.15.08.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 08:34:30 -0700 (PDT)
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
X-Inumbo-ID: 208a35aa-1a0f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744731271; x=1745336071; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaYptZ2Kc/sZc/ME88OKldR8ZTag6D9LFdsKVD9LMbw=;
        b=K8vmXRPrQnBpOXg3AAFn7A8oWY5m6MIqS1ZkyrimbZnC+JXyWEyNfviUiZLKKdzG2F
         /59UzF28qQg4rsd6XTYBRBKA7QgGGDiPr8E4iWIj7AlBAEbMLmhdpsmrJNuevp+k4Pwo
         QJa09dbqQCVBzbrCIkH56o12Cv6mb0NbCArc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744731271; x=1745336071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaYptZ2Kc/sZc/ME88OKldR8ZTag6D9LFdsKVD9LMbw=;
        b=VYndluyW618X/46C/whl4BBhU3kz61TLVNG15OfMk+LZT+cAR6dsPAPhPUnKNVvSEq
         QM24GCBhUbtBw14kXC4TIXNhcYS/746ih5QGXstifp3Vzgb3CGYQizpHaJzh4UcP+i3Y
         B+n02Tn3M/APio4ro/Ah7ttKareIQT2RNNajlL4E3EXszKcYKYcPRuDnIYoBxMRTwCW1
         3UdMxHVwY1flYH7KxsPWSAzaqQM/etI4SCbhN9uZ3ZBCKojVbr9BbekQ8VEMGFohdUVa
         QBEbhL8N0MAzWwVdCPCXfrkKFO3Cab0Wrgk5t1IWb6ev113uAorz7+UdBsooYuNjg5Ua
         mPKQ==
X-Gm-Message-State: AOJu0YyUR2e5S17Li6CvPqnGyOjSPT30pgNbRMiqlEtKYXX+vIRXQ8Yb
	G5mCvgRExMA1RkfsWwnkvRbArqrFNFLhTtmNQ5hxlhut0QzzDMzvJr6vO3Mlq7/dRTPh5YbpI/h
	K
X-Gm-Gg: ASbGncvZuXqvVQATj4+5ffl91+5aVqIdYrBXhS50YLToAiMrZgiYD3ZnKA0WLJUhVxL
	jT4v/H1G+5I2TD3w2wNlop2pcqtRvNI0MOfJMXYXXmpPvuRlRyqCZNpc4Zcv2W8pqeo+yfqRby3
	htZ/IMm5r4gYhX7mk/UtKRaRGqD3QCp7tdcb3goN5tmwZZdIpE9aRhcPO6x7D+xKSnPUJ0ZqMBX
	Pg6DyXsCWbBKaUaEPsyCMLv1MGoZVqYXaxrMxdtbwyXHYdTGe3alW+EFKdIX8iJ8qcIB4sI7TK3
	LGlEQ0duh+EKJuXUyka6J2fO1XSfGkeODlR2mfdv7tb1l1hlLp5OPu/g
X-Google-Smtp-Source: AGHT+IH/5mIagVDnZfNMuVK08rw2f7TSqsa8PKR1Rx0IJ1QvLGTVwPgE10Cshq4erB3EqR5fliEC8g==
X-Received: by 2002:a05:6a20:9f07:b0:1f5:a577:dd1b with SMTP id adf61e73a8af0-2017978f12cmr24062978637.1.1744731271065;
        Tue, 15 Apr 2025 08:34:31 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 4/4] x86/mm: move mmio_ro_emulated_write() to PV only file
Date: Tue, 15 Apr 2025 17:32:46 +0200
Message-ID: <20250415153246.81688-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415153246.81688-1-roger.pau@citrix.com>
References: <20250415153246.81688-1-roger.pau@citrix.com>
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


