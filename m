Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A462FA7F998
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 11:32:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941664.1341112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u25Jw-0005df-CP; Tue, 08 Apr 2025 09:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941664.1341112; Tue, 08 Apr 2025 09:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u25Jw-0005ak-8Z; Tue, 08 Apr 2025 09:32:40 +0000
Received: by outflank-mailman (input) for mailman id 941664;
 Tue, 08 Apr 2025 09:32:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7fLb=W2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u25Jv-0005Zm-7Q
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 09:32:39 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66478ff6-145c-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 11:32:33 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e8be1c6ff8so9906599a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 02:32:33 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac7c018aeadsm881991066b.153.2025.04.08.02.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 02:32:32 -0700 (PDT)
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
X-Inumbo-ID: 66478ff6-145c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744104753; x=1744709553; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyw9Nf0g4BpASb+X5soz8kWjRwQ5IxJQjggUog1T6tA=;
        b=GVURoQ0HCozcTx+gYEW8uzZs+3YPBe7atrRz67XQoc7ryIJDclPve/BjxnSG2tzQjR
         B0CZcFjLzqnRvyEwq0PqdmNKmJdbIVZEXs7dUuAnsqEpSjr6wSyb92gDhi7U2GjbZmxC
         mtOlGtfvrViMh0Ex355S5BqD3ofNcdN9FJYls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104753; x=1744709553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyw9Nf0g4BpASb+X5soz8kWjRwQ5IxJQjggUog1T6tA=;
        b=rm1QuJSdXxV29GbaD0Fbi46pQNCP9K15UaPoRlfBO3kpa8NLp8k4FLt8TfsaMnnvKv
         A+Di+Xv89Hn0NL/ODr8T4R+n+0m0OvzPjU2ZogkkfyufOZHkDEu4JLBLwIqy+DM0/too
         tRqpF80R2aqmHUfVHgGulYdrTg7svB+KNoCcLZSMnf6VvHX61CQBedF2peFjfR5i06cz
         Slcxp70YYlCN0Ss8NgJJOkh/H2rHZemNPqGiix0sy0JN3AzozTYs3WWB+GNUQA1XeETW
         aZvovwgfVvXWwkBkIy30w0ZmGDnj399HGnm11g+8VqZK0CYzuw2oSLEm3WPF905mokCf
         wKpw==
X-Gm-Message-State: AOJu0Yzu5yBFI/9VhdsF8yNSLq/7iiPOa9Ctik6fDUjynRxqF6eQ0DGT
	Q1zNXasl14GIbad7XUYN7jR4xcRfRbNHv3jWYXDIvtubqwuANmE9GhYouex6a15zqgDSAgKjNgv
	8
X-Gm-Gg: ASbGncscnpL/jHQ0x5CZ6P3vTREd/4H3gKzu8bMVwzYsb6ZaivrRQHUyUBrpGsN11AM
	u+7ZVxdzhdWHkRKUQxfR9rfF0suxmXMWrfS2+ZwNCOsvO7Simo28t4ArF4n/qsXIQKFAHpMzx2U
	28Zf4slaG1mI0HjelJYEfWfopbCxpyVZPZPzRRLLq0IKJ18dr/xcC1G0UH7cHk4Hu0Yna/5xQJ4
	n/xjJlXc7aH0fsk0ThMBNUcDDcitVBnVC0NSn/KW42WrB9xEmgBfe8MwSsl03jbDojoZDoDOg0R
	d91dXtoWAS2JHpdT3JdcO9sXiONL01Y0e8Pw7kTttwc+fwWuFg==
X-Google-Smtp-Source: AGHT+IGFmrHCO5oD+w5yQFH9Vxn6LSV0X3XCIJCeR3wHJjkDrs3HWnGkiFYxTFzX5WwGV0xaPaMwPw==
X-Received: by 2002:a17:907:d91:b0:ac1:e2be:bab8 with SMTP id a640c23a62f3a-ac7d6d52781mr1072651866b.26.1744104752634;
        Tue, 08 Apr 2025 02:32:32 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/2] x86/hvm: remove unreachable MMCFG write emulation
Date: Tue,  8 Apr 2025 11:31:55 +0200
Message-ID: <20250408093156.83277-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408093156.83277-1-roger.pau@citrix.com>
References: <20250408093156.83277-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current implementation of PVH dom0 relies on vPCI to trap and handle
accesses to the MMCFG area.  Previous implementation of PVH dom0 (v1)
didn't have vPCI, and as a classic PV dom0, relied on the MMCFG range being
RO.  As such hvm_emulate_one_mmio() had to special case write accesses to
the MMCFG area.

With PVH dom0 using vPCI, and the MMCFG accesses being fully handled there,
hvm_emulate_one_mmio() should never handle accesses to MMCFG, making the
code effectively unreachable.

Remove it and leave an ASSERT to make sure MMCFG accesses never get into
hvm_emulate_one_mmio().  As a result of the removal of one of the users of
mmcfg_intercept_write(), the function can now be moved into the same
translation unit where it's solely used, allowing it to be made static and
effectively built only when PV support is enabled.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/emulate.c      | 22 ++++++++--------------
 xen/arch/x86/include/asm/mm.h   |  3 ---
 xen/arch/x86/mm.c               | 31 -------------------------------
 xen/arch/x86/pv/ro-page-fault.c | 31 +++++++++++++++++++++++++++++++
 4 files changed, 39 insertions(+), 48 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 04d07ccaf6a4..2c9fbacce7fb 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2858,12 +2858,6 @@ int hvm_emulate_one(
 
 int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
 {
-    static const struct x86_emulate_ops hvm_intercept_ops_mmcfg = {
-        .read       = x86emul_unhandleable_rw,
-        .insn_fetch = hvmemul_insn_fetch,
-        .write      = mmcfg_intercept_write,
-        .validate   = hvmemul_validate,
-    };
     static const struct x86_emulate_ops hvm_ro_emulate_ops_mmio = {
         .read       = x86emul_unhandleable_rw,
         .insn_fetch = hvmemul_insn_fetch,
@@ -2872,28 +2866,28 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
     };
     struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = gla, .mfn = _mfn(mfn) };
     struct hvm_emulate_ctxt ctxt;
-    const struct x86_emulate_ops *ops;
     unsigned int seg, bdf;
     int rc;
 
     if ( pci_ro_mmcfg_decode(mfn, &seg, &bdf) )
     {
-        mmio_ro_ctxt.seg = seg;
-        mmio_ro_ctxt.bdf = bdf;
-        ops = &hvm_intercept_ops_mmcfg;
+        /* Should be always handled by vPCI for PVH dom0. */
+        gdprintk(XENLOG_ERR, "unhandled MMCFG access for %pp\n",
+                 &PCI_SBDF(seg, bdf));
+        ASSERT_UNREACHABLE();
+        return X86EMUL_UNHANDLEABLE;
     }
-    else
-        ops = &hvm_ro_emulate_ops_mmio;
 
     hvm_emulate_init_once(&ctxt, x86_insn_is_mem_write,
                           guest_cpu_user_regs());
     ctxt.ctxt.data = &mmio_ro_ctxt;
 
-    switch ( rc = _hvm_emulate_one(&ctxt, ops, VIO_no_completion) )
+    switch ( rc = _hvm_emulate_one(&ctxt, &hvm_ro_emulate_ops_mmio,
+                                   VIO_no_completion) )
     {
     case X86EMUL_UNHANDLEABLE:
     case X86EMUL_UNIMPLEMENTED:
-        hvm_dump_emulation_state(XENLOG_G_WARNING, "MMCFG", &ctxt, rc);
+        hvm_dump_emulation_state(XENLOG_G_WARNING, "RO MMIO", &ctxt, rc);
         break;
     case X86EMUL_EXCEPTION:
         hvm_inject_event(&ctxt.ctxt.event);
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 6c7e66ee21ab..a1bc8cc27451 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -553,9 +553,6 @@ struct mmio_ro_emulate_ctxt {
 int cf_check mmio_ro_emulated_write(
     enum x86_segment seg, unsigned long offset, void *p_data,
     unsigned int bytes, struct x86_emulate_ctxt *ctxt);
-int cf_check mmcfg_intercept_write(
-    enum x86_segment seg, unsigned long offset, void *p_data,
-    unsigned int bytes, struct x86_emulate_ctxt *ctxt);
 
 int audit_adjust_pgtables(struct domain *d, int dir, int noisy);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b294497a140d..4fecd37aeca0 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5200,37 +5200,6 @@ int cf_check mmio_ro_emulated_write(
     return X86EMUL_OKAY;
 }
 
-int cf_check mmcfg_intercept_write(
-    enum x86_segment seg,
-    unsigned long offset,
-    void *p_data,
-    unsigned int bytes,
-    struct x86_emulate_ctxt *ctxt)
-{
-    struct mmio_ro_emulate_ctxt *mmio_ctxt = ctxt->data;
-
-    /*
-     * Only allow naturally-aligned stores no wider than 4 bytes to the
-     * original %cr2 address.
-     */
-    if ( ((bytes | offset) & (bytes - 1)) || bytes > 4 || !bytes ||
-         offset != mmio_ctxt->cr2 )
-    {
-        gdprintk(XENLOG_WARNING, "bad write (cr2=%lx, addr=%lx, bytes=%u)\n",
-                mmio_ctxt->cr2, offset, bytes);
-        return X86EMUL_UNHANDLEABLE;
-    }
-
-    offset &= 0xfff;
-    if ( pci_conf_write_intercept(mmio_ctxt->seg, mmio_ctxt->bdf,
-                                  offset, bytes, p_data) >= 0 )
-        pci_mmcfg_write(mmio_ctxt->seg, PCI_BUS(mmio_ctxt->bdf),
-                        PCI_DEVFN(mmio_ctxt->bdf), offset, bytes,
-                        *(uint32_t *)p_data);
-
-    return X86EMUL_OKAY;
-}
-
 /*
  * For these PTE APIs, the caller must follow the alloc-map-unmap-free
  * lifecycle, which means explicitly mapping the PTE pages before accessing
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index 372187e9a096..11b01c479e43 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -298,6 +298,37 @@ static int ptwr_do_page_fault(struct x86_emulate_ctxt *ctxt,
  * fault handling for read-only MMIO pages
  */
 
+static int cf_check mmcfg_intercept_write(
+    enum x86_segment seg,
+    unsigned long offset,
+    void *p_data,
+    unsigned int bytes,
+    struct x86_emulate_ctxt *ctxt)
+{
+    struct mmio_ro_emulate_ctxt *mmio_ctxt = ctxt->data;
+
+    /*
+     * Only allow naturally-aligned stores no wider than 4 bytes to the
+     * original %cr2 address.
+     */
+    if ( ((bytes | offset) & (bytes - 1)) || bytes > 4 || !bytes ||
+         offset != mmio_ctxt->cr2 )
+    {
+        gdprintk(XENLOG_WARNING, "bad write (cr2=%lx, addr=%lx, bytes=%u)\n",
+                mmio_ctxt->cr2, offset, bytes);
+        return X86EMUL_UNHANDLEABLE;
+    }
+
+    offset &= 0xfff;
+    if ( pci_conf_write_intercept(mmio_ctxt->seg, mmio_ctxt->bdf,
+                                  offset, bytes, p_data) >= 0 )
+        pci_mmcfg_write(mmio_ctxt->seg, PCI_BUS(mmio_ctxt->bdf),
+                        PCI_DEVFN(mmio_ctxt->bdf), offset, bytes,
+                        *(uint32_t *)p_data);
+
+    return X86EMUL_OKAY;
+}
+
 static const struct x86_emulate_ops mmio_ro_emulate_ops = {
     .read       = x86emul_unhandleable_rw,
     .insn_fetch = ptwr_emulated_insn_fetch,
-- 
2.48.1


