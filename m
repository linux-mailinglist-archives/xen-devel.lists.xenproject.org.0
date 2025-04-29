Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4D1AA0839
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 12:13:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971786.1360213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9hxb-0003hV-7s; Tue, 29 Apr 2025 10:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971786.1360213; Tue, 29 Apr 2025 10:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9hxb-0003b9-3y; Tue, 29 Apr 2025 10:13:07 +0000
Received: by outflank-mailman (input) for mailman id 971786;
 Tue, 29 Apr 2025 10:13:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b72w=XP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u9hxZ-0002lF-Gm
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 10:13:05 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a5280d6-24e2-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 12:13:05 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so51827965e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 03:13:05 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-440a5369cc1sm149831235e9.32.2025.04.29.03.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 03:13:03 -0700 (PDT)
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
X-Inumbo-ID: 8a5280d6-24e2-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745921584; x=1746526384; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4j1Fs93O6tjqerfgJEMn6A5AQPD2o+Vigwy9v3Ww7I8=;
        b=gJEmhmKeLLhGMa+0s45tCYde3oHenqR2jSFAOuxOem26R6EH8Wi0Ldl7qlJwh7WmqT
         zsc8QagnSXDhzMT5+f3NeuYGPQltnnleflLprWtoPxpCAo7mM0klfPakeMBfvcgqIW2g
         EEDnkUtfQdJ3w2pWqFfGs7OspQOCHjWzTiKq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745921584; x=1746526384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4j1Fs93O6tjqerfgJEMn6A5AQPD2o+Vigwy9v3Ww7I8=;
        b=wHfpUtw/pGcBJQF6UhJPKFDGVWyvN3OCcDg0YTpIJno+ZgM2sOeU2psJsla9HwtNSf
         4kjpne+Mz36BOiYa3kXrbXCigm8+7GUkR9IfaYOoJB0vrfrPUZF/BCTGSD3Fu+S3qU9Y
         Plq/4cx+Ut0V2+DERLALNUXdXW/UEG4q9ycUEwiYQEd0RkooVkCn0u9Kt85csQex5RYD
         uyb3M8WYW6+NNEhBU27M6Rab/BTUMH/952Dg8mzpqADq9cBGCvPnBC43ZPhKne5jDL2F
         AouYmiZHKffO7vLga2DlT4IVe38aRcp67TlARHlVa44UQSGvN+B219akUiWfchndSQ1J
         nCwg==
X-Gm-Message-State: AOJu0YwomaHhTPbPZxM2GjLyMO7EmUD6YT/PWlLsgKRIZc94HcK1bm/b
	L86m5w9BjY8fbYH4ArzJ3QmxDGYYmACeIv39WIPO0NVGyFhgIjWPFpYKZzllWc7Knjm39n+DYkJ
	E
X-Gm-Gg: ASbGncuKXoAEyFu5C5OFyRI2zGbQVV8qGUA9a2vasLtfApTcdhZgjpP6Du93b5lXTxe
	k+0sa7tV1DFwih6dsH4hTTbn6wbGBVJo6tQMuTdSbqhVm9nz6FgLu4D6IQnt4QVifPZAejywubY
	kPJVL2mkIESlREnkSqQvR/pjVqJrPj3HZmmwoaoPcgvDmuTUxYhoML5QuoVal5C748NjVMn8uDG
	uQV8yJVbyW6U/0SycOGAttVBoPINsPKGQWaRrFk1tkD8S1kORClowGg+rYjRdekSx9FFXK6kNIf
	3qSCqMJiM8ZPjutxly4FDeasonn6ZI3ip86WhY8rl8kOYnoBHkViXAaJ
X-Google-Smtp-Source: AGHT+IH9EpLHSMnxzvfs7gUApSUQ4BoJHuVuCGeqO6Q3MSGTP5KFGG3OIRWOMVxoCBH7u9boNgFPLg==
X-Received: by 2002:a05:600c:1d1d:b0:43b:ce3c:19d0 with SMTP id 5b1f17b1804b1-441ac892162mr23054155e9.29.1745921584208;
        Tue, 29 Apr 2025 03:13:04 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v4 4/4] x86/mm: move mmio_ro_emulated_write() to PV only file
Date: Tue, 29 Apr 2025 12:12:52 +0200
Message-ID: <20250429101252.50071-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429101252.50071-1-roger.pau@citrix.com>
References: <20250429101252.50071-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

mmio_ro_emulated_write() is only used in pv/ro-page-fault.c, move the
function to that file and make it static.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/include/asm/mm.h   | 12 ----------
 xen/arch/x86/mm.c               | 33 --------------------------
 xen/arch/x86/pv/ro-page-fault.c | 41 +++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 45 deletions(-)

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
index 6697984507bf..9ac855f998dc 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5144,39 +5144,6 @@ void subpage_mmio_write_emulate(
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
-         offset != mmio_ro_ctxt->cr2 )
-    {
-        gdprintk(XENLOG_WARNING, "bad access (cr2=%lx, addr=%lx, bytes=%u)\n",
-                mmio_ro_ctxt->cr2, offset, bytes);
-        return X86EMUL_UNHANDLEABLE;
-    }
-
-    if ( bytes <= sizeof(data) )
-    {
-        memcpy(&data, p_data, bytes);
-        subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
-                                   data, bytes);
-    }
-    else if ( subpage_mmio_find_page(mmio_ro_ctxt->mfn) )
-        gprintk(XENLOG_WARNING,
-                "unsupported %u-byte write to R/O MMIO 0x%"PRI_mfn"%03lx\n",
-                bytes, mfn_x(mmio_ro_ctxt->mfn), PAGE_OFFSET(offset));
-
-    return X86EMUL_OKAY;
-}
-
 /*
  * For these PTE APIs, the caller must follow the alloc-map-unmap-free
  * lifecycle, which means explicitly mapping the PTE pages before accessing
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index 11b01c479e43..5ae77080772d 100644
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
@@ -329,6 +337,39 @@ static int cf_check mmcfg_intercept_write(
     return X86EMUL_OKAY;
 }
 
+int cf_check mmio_ro_emulated_write(
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
+         offset != mmio_ro_ctxt->cr2 )
+    {
+        gdprintk(XENLOG_WARNING, "bad access (cr2=%lx, addr=%lx, bytes=%u)\n",
+                mmio_ro_ctxt->cr2, offset, bytes);
+        return X86EMUL_UNHANDLEABLE;
+    }
+
+    if ( bytes <= sizeof(data) )
+    {
+        memcpy(&data, p_data, bytes);
+        subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
+                                   data, bytes);
+    }
+    else if ( subpage_mmio_find_page(mmio_ro_ctxt->mfn) )
+        gprintk(XENLOG_WARNING,
+                "unsupported %u-byte write to R/O MMIO 0x%"PRI_mfn"%03lx\n",
+                bytes, mfn_x(mmio_ro_ctxt->mfn), PAGE_OFFSET(offset));
+
+    return X86EMUL_OKAY;
+}
+
 static const struct x86_emulate_ops mmio_ro_emulate_ops = {
     .read       = x86emul_unhandleable_rw,
     .insn_fetch = ptwr_emulated_insn_fetch,
-- 
2.48.1


