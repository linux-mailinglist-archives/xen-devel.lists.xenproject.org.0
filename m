Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIzsKLNei2msUAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:37:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DC011D514
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:37:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226685.1533201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqjR-0001I0-7n; Tue, 10 Feb 2026 16:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226685.1533201; Tue, 10 Feb 2026 16:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqjR-0001GH-3Y; Tue, 10 Feb 2026 16:36:57 +0000
Received: by outflank-mailman (input) for mailman id 1226685;
 Tue, 10 Feb 2026 16:36:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUYk=AO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpqjP-00012i-HU
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 16:36:55 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b501d82f-069e-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 17:36:53 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso8989705e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 08:36:53 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5e11f5sm64803255e9.4.2026.02.10.08.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 08:36:52 -0800 (PST)
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
X-Inumbo-ID: b501d82f-069e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770741413; x=1771346213; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i83rk6CF00DSCAs1v5+Cc7fqBYd21dNjMT+muRCPfCk=;
        b=by6uynguHIjGrWENp+I/1R6DpXqVCTlnN/CV3KRFqo3if36VMHFJBb2hZ0e2mvIW4M
         q6ScIe3mWSW8HpLX9qSslzHUU4h9yIAMfSh6AjpKQhjGr4AgR/WP4VrEPtlLAObwIu1m
         yMRdBm1vVv3IceZvwj25ZcNVb3rBm8oF0b4lN6tBFRSbWc2PSRpo65msu5uDCq2tUsw6
         pR/ZDshu7gpQW1gPjvvGWYpSosjIOm3K9AnLKa8LXwoZndyOU/ta1Z25PTjgmuS0QICg
         nbz/FgYEFEsCSQsuoqEj5w7Tzk5hPUfyrZaOIIbuWBGpCYP5Q7LEvRoxTawlnCkCDx9e
         +xTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770741413; x=1771346213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i83rk6CF00DSCAs1v5+Cc7fqBYd21dNjMT+muRCPfCk=;
        b=AQtPYQLZFjraQU1ZfdLnNeDZB8G09/8rFuH4BPZtVXts4/YqJUyiM5TZur49CctuQs
         B6iEmNDrzpP3C1fb63U1QYhf03pL2XZ4TBOY6uwMNTCy/oXkaSKA+IYpzOwrMrFURUAz
         /o6Z1nGYPt8+xtXxQKWvOasmR8KHcU3hdh+5t2Pc7oXFZE8tl82xXaAQHUTHDe6BtGif
         y+2J4M9tIFhhyPpkd6GYlbXiuFFc1UcnyCiAgdmhjwhqqmNnHOg87sJ1D1jcw8mSZgPu
         vjoVD0EH4pxN0cEQQyt1Hpk4KLgMlwldQx21SvYOkxnmCUqlF0lRUjk/PhSZF+zIpnh6
         U9EQ==
X-Gm-Message-State: AOJu0YxHCLQJd4ydzmoXyJmVbJVH2ml8EVGextLhmU6TmFCRzJ3Ib0XK
	3JUGP+czKPC3gZvDeVtrlsDFlOWzyIjk1Ca4JLePpzwCjWd1EMqLM+TsoJXY6ifk
X-Gm-Gg: AZuq6aJhjsrKNTw2Vkwa7ymnp+Ua4MwmMCBz+hltag6iEslEEW2WGafnYSKDjIKn+u5
	u6SQXZyplKfARFVIZlAQ/W585NNEfM5DnJhMrTTVFX9XFpIgQOfGa1LjL4JLiItXPJdvjALHw7T
	7/w6hFc2cSinD4dZun/wbrhAzSCaCF/TZYkvS5mCk3ypmcAN8ZxoBymYOv5nEu6PoT5ywqUWK8l
	JuFU7DQJPcS9PHnjB4L8YBAQwf6McROJNR9hk7SXabvhmePZqRaVqLS8L2Z3JbkLyXofIxavCxt
	MoxXn4UXMrmgOFvC2WPQJQfQ1Tw4J68BECORLHv7tWlJ8Hb2wRXf0/S8A4QZ1EWtG8U5N9reA/Q
	+NNrxMzvxtSj7pfqQCYOGR7uS/gHGIrr5GouGkbKzq98qLOVlz2mHk/7yUHfAzhMLMzznwGgoaz
	4ZMBdsRa+hBxoTC2RThkB0bnBDdeL5KH+xprR+dHIMdhrMV/5H2Pi3tEiX5cTPSIXlHFHufofBJ
	V8b
X-Received: by 2002:a05:600c:154b:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-483201e3e8amr206281615e9.10.1770741412614;
        Tue, 10 Feb 2026 08:36:52 -0800 (PST)
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
Subject: [PATCH v2 1/2] xen/riscv: add support for local guest TLB flush using HFENCE.VVMA
Date: Tue, 10 Feb 2026 17:36:40 +0100
Message-ID: <af269cb7b5c03f0661982d41d3d7f1ddde761eeb.1770739000.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770739000.git.oleksii.kurochko@gmail.com>
References: <cover.1770739000.git.oleksii.kurochko@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 13DC011D514
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
Changes in v2:
 - Add missed blanks in asm().
 - Add operand modifier "z" and "J" constraint to be sure that zero register
   will be used when 0 is passed to HFENCE_VVMA().
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
index 000000000000..61aaa202fd13
--- /dev/null
+++ b/xen/arch/riscv/include/asm/insn-defs.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ASM_RISCV_INSN_DEFS_H
+#define ASM_RISCV_INSN_DEFS_H
+
+#define HFENCE_VVMA(vaddr, asid) \
+    asm volatile ( "hfence.vvma %z0, %z1" \
+                  :: "rJ" (vaddr), "rJ" (asid) : "memory" )
+
+#endif /* ASM_RISCV_INSN_DEFS_H */
-- 
2.52.0


