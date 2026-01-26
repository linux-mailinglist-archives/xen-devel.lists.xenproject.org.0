Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J9zJ3lTd2mdeAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 12:43:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1593687BBE
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 12:43:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213631.1524087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkL0O-000306-Lk; Mon, 26 Jan 2026 11:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213631.1524087; Mon, 26 Jan 2026 11:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkL0O-0002yY-IK; Mon, 26 Jan 2026 11:43:40 +0000
Received: by outflank-mailman (input) for mailman id 1213631;
 Mon, 26 Jan 2026 11:43:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zrcg=77=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vkL0M-0002yN-Kn
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 11:43:38 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4062a77e-faac-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 12:43:37 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b884ad1026cso688484166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 03:43:37 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b886048e808sm605636566b.9.2026.01.26.03.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 03:43:35 -0800 (PST)
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
X-Inumbo-ID: 4062a77e-faac-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769427816; x=1770032616; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dg+tlIS5x3Bb6EkLB8EnYXAV8JB5eiuq9+HSsZDnooQ=;
        b=fJ5kTAjp+GTKwlGMuuH7OCXxBmI/4FtMmzdTZWX3CbYXrieglbCJQCLRElkfsvoZ0B
         bW1fgLd5RXIp1XP73wvAbZ09257LrDyfAtqilKn14ovlwwDEaKy7riqHfTrVEP/sMUrK
         j/Ti3vnPxwi/0SpkDMl/wUoe/AQkXAQHJKf+MzAVZ5JranOe5AwbMNXRsu7VQzPB40RW
         i2PUSIhI12URF7kcyLNuxGxwcMTY+JdgnK0dqVyo0hkajotOkryYECS7s08RJTIygMgt
         /907Q0hx5WEljG426Y73Ma5dQSYehAW5197IrSXwvopwDR0B0H3w15RNpyAVIBQtHYrN
         tLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769427816; x=1770032616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dg+tlIS5x3Bb6EkLB8EnYXAV8JB5eiuq9+HSsZDnooQ=;
        b=prf7HSyai1wZA9gdWAv085LY5ZONz6EsZInL6i/rePXdG9ihT3ys42+MHVwtAjCFUU
         BOuIi5VZYxzqMxAEu6HnjsfnQfa3VbWOwdu3rq+xKXeBahFJU3DzzAEfWGUTfeuK2iEc
         ZP39CCT0gS9XTxNW1yaM2lusWbJhl8KSEo/2JfYopIKIYRiMALsqCte42R9yEF0ET9ZS
         q30i67w0Bcgcc2y79eikBkn6rIyuDQW1aQM/8ozkKp8aDwnB6ejNlNTAXpJm/2SPS5JN
         xAaUO/9e7PhZkOPMERkYjqgcPuk9H66SuJvjEudGCyzYm2BnJ4ZHEXPdFbCYFq7axdLh
         feXw==
X-Gm-Message-State: AOJu0YzwsUH9nI7Bhz+b9jWn91KqAZ/t1Ab/K0vEcY0W/YZE+gbhBnsy
	mUy6hrvVkbCbiurr6w3tUVOpQQ9AIxXdJ/7T49HxRyQTU9HQmmS6B64oy5yatw==
X-Gm-Gg: AZuq6aKskZTHofmYiymlv5a2F2wTPZ91do7Eza8TWsGDhvb4dINT5555+k9NE2GyikA
	5fDrdqtyea1/aZlcV2qcFVo3X9GDTiGpTTEM9d7WYuwn7i9T6P1whZ+eTC0SKx5kbHfDnTyczYi
	kXOFNTUYqwjXUorbVmbm97oByTag2TX1gX+PNj3LMh9pV9fpC44CFWrMwVvczYN+DrwxpKo2snQ
	qhsSDdEymBTJ9P4Y+bZ6E4DHftqyw9xloqHLgED7oaAibmsVPPFDvyYTOLrEjyyXSCi6D5YeHt4
	8U8SdP9f5ELFWAwgLgpvhTyRThidEId/28QpLF/f3iJaQTLjecup1riKb5VJdVhtWkQz295aNIq
	CEuBrNiOccUsGGYPndLMS3Uyu0AXLUXaWR76sjIt+XiWHMrkjipadzBcoYz4WUxm/h+EdJplZ7g
	+WRhAYwRSwWF7OZkxWXpRZBGgT/PLsrrvRJtpldkKNDt57l9U5jqwhcw==
X-Received: by 2002:a17:906:c151:b0:b87:1d79:bef4 with SMTP id a640c23a62f3a-b8cfedfcaf5mr276192766b.9.1769427816036;
        Mon, 26 Jan 2026 03:43:36 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Romain Caritey <Romain.Caritey@microchip.com>
Subject: [PATCH v4] xen/riscv: dump GPRs and CSRs on unexpected traps
Date: Mon, 26 Jan 2026 12:43:25 +0100
Message-ID: <27ab0f8eb6fd6ecef1eeefa4a05e4fe1f43acbbe.1769427484.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,microchip.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1593687BBE
X-Rspamd-Action: no action

Provide additional context when an unexpected exception occurs by dumping
the relevant Supervisor, Virtual Supervisor (VS), and Hypervisor CSRs,
along with the general-purpose registers associated with the trap.

Dumping VS-mode CSRs in addition to host CSRs is beneficial when analysing
VS-mode traps. VSCAUSE, VSEPC, VSTVAL, and related VS state are required to
properly diagnose unexpected guest traps and potential hypervisor
misconfiguration.
For example, on an illegal-instruction exception the hardware may record
the faulting instruction in VSTVAL. If VSTVAL is zero, VSEPC should always
be inspected, and can be used together with objdump to identify the
faulting instruction. Dumping VSCAUSE is also useful when the guest does
not report it, or when the hypervisor redirects a trap to the guest using
VSCAUSE, VSTATUS, and VSTVEC, allowing verification that a subsequent trap
is not caused by incorrect VS state.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Drop macros GPR_LIST and CSR_LIST.
 - Drop leading tab identation in printk() inside X macros.
 - Drop semicolon after printk in X macros.
 - Group print of htval and htinst, and HEDELEG and HIDELEG.
 - Put printing of hypervisor register first.
 - Add printing of missing GPRs: t5, t6, sepc.
---
Changes in v3:
 - Refactor the code dumping of CSRs and GPRs:
   - Introduce new macros
   - Re-group some registers when values are displayed.
 - Print all registers name in lower case.
 - Drop unnessary "Dumping CSRs", "Dumping GSRs" as it
   is clear based on names.
 - Update the commit message: add justification of dumping of
   some VS* registers.
 - Drop printing of VSSATP as I don't know usecase for now
   where it could be needed.
---
Changes in v2:
 - Address coments about print_csr() macros and dump_csrs().
 - Add dumping of GPRs pertaining to the trap.
---
 xen/arch/riscv/traps.c | 58 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index e9c967786312..da74f77ecc90 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -99,12 +99,70 @@ static const char *decode_cause(unsigned long cause)
     return decode_trap_cause(cause);
 }
 
+static void dump_general_regs(const struct cpu_user_regs *regs)
+{
+#define X(regs, name, delim) \
+    printk("%-4s: %016lx" delim, #name, (regs)->name)
+
+    X(regs, ra, " "); X(regs, sp, "\n");
+    X(regs, gp, " "); X(regs, tp, "\n");
+    X(regs, t0, " "); X(regs, t1, "\n");
+    X(regs, t2, " "); X(regs, s0, "\n");
+    X(regs, s1, " "); X(regs, a0, "\n");
+    X(regs, a1, " "); X(regs, a2, "\n");
+    X(regs, a3, " "); X(regs, a4, "\n");
+    X(regs, a5, " "); X(regs, a6, "\n");
+    X(regs, a7, " "); X(regs, s2, "\n");
+    X(regs, s3, " "); X(regs, s4, "\n");
+    X(regs, s5, " "); X(regs, s6, "\n");
+    X(regs, s7, " "); X(regs, s8, "\n");
+    X(regs, s9, " "); X(regs, s10, "\n");
+    X(regs, s11, " "); X(regs, t3, "\n");
+    X(regs, t4, " "); X(regs, t5, "\n");
+    X(regs, t6, " "); X(regs, sepc, "\n");
+
+#undef X
+}
+
+static void dump_csrs(unsigned long cause)
+{
+#define X(name, csr, fmt, ...) \
+    v = csr_read(csr); \
+    printk("%-10s: %016lx" fmt, #name, v, ##__VA_ARGS__)
+
+    unsigned long v;
+
+    X(htval, CSR_HTVAL, " ");  X(htinst, CSR_HTINST, "\n");
+    X(hedeleg, CSR_HEDELEG, " "); X(hideleg, CSR_HIDELEG, "\n");
+    X(hstatus, CSR_HSTATUS, " [%s%s%s%s%s%s ]\n",
+      (v & HSTATUS_VTSR) ? " VTSR" : "",
+      (v & HSTATUS_VTVM) ? " VTVM" : "",
+      (v & HSTATUS_HU)   ? " HU"   : "",
+      (v & HSTATUS_SPVP) ? " SPVP" : "",
+      (v & HSTATUS_SPV)  ? " SPV"  : "",
+      (v & HSTATUS_GVA)  ? " GVA"  : "");
+    X(hgatp, CSR_HGATP, "\n");
+    X(hstateen0, CSR_HSTATEEN0, "\n");
+    X(stvec, CSR_STVEC, " "); X(vstvec, CSR_VSTVEC, "\n");
+    X(sepc, CSR_SEPC, " "); X(vsepc, CSR_VSEPC, "\n");
+    X(stval, CSR_STVAL, " "); X(vstval, CSR_VSTVAL, "\n");
+    X(status, CSR_SSTATUS, " "); X(vsstatus, CSR_VSSTATUS, "\n");
+    X(satp, CSR_SATP, "\n");
+    X(scause, CSR_SCAUSE, " [%s]\n", decode_cause(v));
+    X(vscause, CSR_VSCAUSE, " [%s]\n", decode_cause(v));
+
+#undef X
+}
+
 static void do_unexpected_trap(const struct cpu_user_regs *regs)
 {
     unsigned long cause = csr_read(CSR_SCAUSE);
 
     printk("Unhandled exception: %s\n", decode_cause(cause));
 
+    dump_csrs(cause);
+    dump_general_regs(regs);
+
     die();
 }
 
-- 
2.52.0


