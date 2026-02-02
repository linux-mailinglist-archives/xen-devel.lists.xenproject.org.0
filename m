Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AJBAo6fgGl2/wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 13:58:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A55CC8BF
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 13:58:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218573.1527401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmtVR-0005in-QE; Mon, 02 Feb 2026 12:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218573.1527401; Mon, 02 Feb 2026 12:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmtVR-0005cX-MF; Mon, 02 Feb 2026 12:58:17 +0000
Received: by outflank-mailman (input) for mailman id 1218573;
 Mon, 02 Feb 2026 12:58:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lssc=AG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vmtVQ-0005NS-2J
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 12:58:16 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5026416-0036-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 13:58:12 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4805ef35864so37478475e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 04:58:12 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482dbd0f043sm107954345e9.7.2026.02.02.04.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 04:58:11 -0800 (PST)
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
X-Inumbo-ID: d5026416-0036-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770037092; x=1770641892; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqUOsiASfyAaQ53ugdDDDMH77tCws+wp7hpoj2RKf+w=;
        b=i9GcaZt88NsQP0HC3cGNsIJFPhOFGfnRkySAAfndjEF83GoFW75P93CQWq9RuchUk+
         WXyK+b9SAkTz+ih7Y0t72t3ohT/Lzqo9ZW2cLlaG61uQ24kPDusq9PFENyfb0iv1Huvk
         FMKPZdzlNy2sKQ5+xLxAEPRr4zLyZlgaQ6QIOt6bRElYL4r2pnN0iYybvAH5JlOV9eBi
         eTm0RKxVWskFR0CYI7Fpv4j3kS05Sbl09rPwh1e/5+TmLTw/WVMeZdgQMLlIRu7cYSrf
         kFSliw8g5o9xm0zPC9qpC12Y0W9R6BmNOMUidfxIZTwQrW30hSPwW1rUgBWkgW7p5Mt4
         dt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770037092; x=1770641892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rqUOsiASfyAaQ53ugdDDDMH77tCws+wp7hpoj2RKf+w=;
        b=jBq+gwbwbfzjazRm4Ul4JY2G29Z5KadxV2rLkMimVlulWLBlrhHxw/7CL8ttvDdMx4
         E6Efs6QD3QQgQzKTVhu0VBVTAJCp93ANUGEIvJCRvplDiiqbwUa2XlrbLX3sT/8XSJk7
         txCPJg4zw6yH0EEtP169iwBSAw0cS2SpNpVbbiUlqULuQXbrB8usibuZ6uyiNKqQpfEj
         MzilOVC0xz5k+7xkzaaVwm3JPhrxWkzFDWxfccsyPQHCz+a9SXxLImKa+w9+nmUbxcXB
         e4nD/DSfMpUcqZapX/m4s33bqNCnIWPFe6eSBGbE3FyJr3Js6Pe2CrWag4suINzAuNP7
         zvmg==
X-Gm-Message-State: AOJu0YzIhPBtgsH7J2CHDtKYqfdLJPW3+4GN09OSw9ttuYI/QEEdXidB
	TExpsMVECdrbWfpu227QFqpr98kNRPQKDoYO2hKKOHMCNFGlhoBjgLNIsAlUPg==
X-Gm-Gg: AZuq6aJ88zJkadul7Dn2ybwSJkmW8ouAVPHaNO+lYb6LcXOj73TYJHsMw3NCbwG8+C7
	4Oa0DwJBv61mXpCmOYGg2hSF8KRGmuQJiSICzcMzfUOQatELljR3SU/E+HHP2K6PKWnXaNXnXst
	MHp8K1hdk1sW3hVBhtvHJYDSr7ujuHeErbIwIvFc8SQctXKR+BmAe61BmYhR8+jU5qOFABmAss+
	KX/7n4CSM5DO9OjSssiWHVgahzOZbLP6cmBtiWqN6eDe7yj+vd79LQhXzJDyHfRFlan05/jFgAz
	B7KLFFTVphluuv7GfOmtEwPr6T6fn6F6dLl2vqFz4CeF2X4BP4xRLz6Y5pRnzj+QV8dhBn9/UT/
	p7eV13ARFitD7K+Zo9qyJVkzHExGA1aeRYRV2rxTO9Ldxy2oksO2uXx+/iTlZA/uaupexkG9w1G
	SdBxXroPYid8BeKlOwbbIo0UH1xXbXfSqUpEHLa1TdTA8OTTSQ1r12ig==
X-Received: by 2002:a05:600c:8a17:20b0:480:25ae:9993 with SMTP id 5b1f17b1804b1-482db47ce2emr108464705e9.20.1770037092037;
        Mon, 02 Feb 2026 04:58:12 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 2/3] xen/riscv: add support for local guest TLB flush using HFENCE.VVMA
Date: Mon,  2 Feb 2026 13:57:58 +0100
Message-ID: <89f50ab2c1a1c79abea4db3a53393f974bb9a473.1770036584.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770036584.git.oleksii.kurochko@gmail.com>
References: <cover.1770036584.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F2A55CC8BF
X-Rspamd-Action: no action

Introduce flush_tlb_guest_local() to perform a local TLB flush of the guest's
address space for the current hart. This leverages the RISC-V HFENCE.VVMA
instruction, which is used to invalidate translations in the VS-stage of
address translation.

As for RISC-V binutils >= 2.39 is choosen, we can use hfence.vvma mnemonics
instead of defining hfence.vvma using .insn.

Although it would be possible to use sbi_remote_hfence_vvma() for this purpose,
it is unnecessary in this context since the flush is required only on the
local hart. Using the SBI call would introduce additional overhead without
benefit, resulting in unnecessary performance loss.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/flushtlb.h  |  7 +++++++
 xen/arch/riscv/include/asm/insn-defs.h | 10 ++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/insn-defs.h

diff --git a/xen/arch/riscv/include/asm/flushtlb.h b/xen/arch/riscv/include/asm/flushtlb.h
index 4f64f9757058..b0112d416dbe 100644
--- a/xen/arch/riscv/include/asm/flushtlb.h
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -5,6 +5,7 @@
 #include <xen/bug.h>
 #include <xen/cpumask.h>
 
+#include <asm/insn-defs.h>
 #include <asm/sbi.h>
 
 struct page_info;
@@ -14,6 +15,12 @@ static inline void local_hfence_gvma_all(void)
     asm volatile ( "hfence.gvma zero, zero" ::: "memory" );
 }
 
+/* Flush VS-stage TLB for current hart. */
+static inline void flush_tlb_guest_local(void)
+{
+    HFENCE_VVMA(0, 0);
+}
+
 /* Flush TLB of local processor for address va. */
 static inline void flush_tlb_one_local(vaddr_t va)
 {
diff --git a/xen/arch/riscv/include/asm/insn-defs.h b/xen/arch/riscv/include/asm/insn-defs.h
new file mode 100644
index 000000000000..4d50b5e23c11
--- /dev/null
+++ b/xen/arch/riscv/include/asm/insn-defs.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ASM_RISCV_INSN_DEFS_H
+#define ASM_RISCV_INSN_DEFS_H
+
+#define HFENCE_VVMA(vaddr, asid) \
+    asm volatile ("hfence.vvma %0, %1" \
+                  :: "r"(vaddr), "r"(asid) : "memory")
+
+#endif /* ASM_RISCV_INSN_DEFS_H */
-- 
2.52.0


