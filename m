Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id x125CSQod2lzcwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 09:39:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A78985896
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 09:38:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213374.1523857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkI7U-00014j-3S; Mon, 26 Jan 2026 08:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213374.1523857; Mon, 26 Jan 2026 08:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkI7U-00013H-08; Mon, 26 Jan 2026 08:38:48 +0000
Received: by outflank-mailman (input) for mailman id 1213374;
 Mon, 26 Jan 2026 08:38:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zrcg=77=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vkI7T-00012Q-Cx
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 08:38:47 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d24754c-fa92-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 09:38:45 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48039fdc8aeso21919495e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 00:38:45 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470bfe42sm333913985e9.9.2026.01.26.00.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 00:38:43 -0800 (PST)
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
X-Inumbo-ID: 6d24754c-fa92-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769416724; x=1770021524; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I9xBeL9XzcEfuWQDF1E1d36YREQglperVrzzXOMFOJI=;
        b=OEYYmAI0voxIRcscyCEgtAWKkEmxxsg9NvUBGa9NUvS4Y0xE2cIElyy8xS3zbtwpeJ
         XypOdNhRqnH87TeEThnp42SNP8OnL7oVMQLWVF5xeJJIW4rCwqt0t/6A90J8tvjZXN83
         WKV6oxO5iuALgcnbD7xN0cfUKDON1swAM/8pSWkPwMuB8OVjWqxA7w6BTsoQ9rVi4zY6
         yrD70EPbLeMoHY9SjX4R8ZDC8rEyJhLsotEbRTwenWYTt5I4W5RjjgKB4p2bkxyFKtto
         iVAxesRAHz8k7PHjbCECbL/7CXro7ceNPN+8qqgNmTZdO+iPrzKuSllpHyuJ8X5NcmqI
         RQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769416724; x=1770021524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9xBeL9XzcEfuWQDF1E1d36YREQglperVrzzXOMFOJI=;
        b=JuETOVq5CY6wUE9l9d+RvbCv7LBeJ+Kdxl3IjSdcfH1Kgc6s24cVakemI/CAxHybff
         dqH+7sYCL1fuuXKKZZEDNjx2D65vZ+Gw2YTxGCh77jIG/hgrD+LROCu2Z3PHYDmJaSf/
         Ic7t+uA9VgARqil8YSf4gNyFIkTppFXmjVacYRvIRS/5CrhpIIG8sdQRhVH0P7gbl+31
         d+hpGmVTFafIxeUM83ER9QdlOuFLs+M5BslsGpM7tHqBc2WTJ0Xwg3pSCT94t8qLS+JP
         X4BtikBwSiY0xP6sTTZCBxkWyGI8t34Wb1x3cTlDRiOYOlYOC9YTKiDeGlASmSZNxy4P
         0ImQ==
X-Gm-Message-State: AOJu0YwE9to9WDy9obur07LWbrhviOlbbqaOXhbG4hbNXwlMeyzkI0jA
	lpfzgXtARKxdTZ3Hs+Cl2X1CxKqSj0cbN+drgiMu5Xx7zSqKnQmN/LgKDhGqoA==
X-Gm-Gg: AZuq6aJBULO7keytTZwgkWkiiFmOeiSQFAwbK3eKR2/rq+jrFud8HR4VPeUstGcRr4S
	B1t5mAUHGWilddNQmWByaesWcLv/HyQmjECTrbJpoXbaCYddzTF4wCRq2OuL4KjK/lDbANInWDp
	ihVlvIqsY4YN+oszzliD8/4+zyJenNsnWoH06cF7Pa+gCo/hJ7/TxEWB5bVOvM8LivcMfMUXQNZ
	vQ0ntySEQrJeqlGQs3Tkwr9nHHTLOqivVWwNK9K6jI6vMPvTeVkGigG0CCEFV6KHZm/V2qtcqaH
	sRkolv1NLCR282rAbPrcgIAuSMM0pbRDnroTDKbzkC/LyESs8beObEQETvD7aBi66wCwh9dvOeE
	mLZxWw/Gxu2iss8OCzpm5kuGTp9z3nNwznycFlhkLgEY3uoKgwCMJmRaRtVKdN/6zCBu0vHIOWb
	zh18TbSs5ufnqoAfJnFE3iPvxWRN/ZwGm91Ct5sp1RRnZoWA404aEVkemu+Mg/wR1/
X-Received: by 2002:a05:600c:6285:b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-4805ce3fcbfmr64525175e9.7.1769416724216;
        Mon, 26 Jan 2026 00:38:44 -0800 (PST)
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
Subject: [PATCH v3] xen/riscv: dump GPRs and CSRs on unexpected traps
Date: Mon, 26 Jan 2026 09:38:36 +0100
Message-ID: <0b57db49d40b336429dd4fd63faf18f6bb17ac1a.1769179393.git.oleksii.kurochko@gmail.com>
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7A78985896
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
 xen/arch/riscv/traps.c | 69 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index e9c967786312..7b9bcb97035f 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -99,12 +99,81 @@ static const char *decode_cause(unsigned long cause)
     return decode_trap_cause(cause);
 }
 
+static void dump_general_regs(const struct cpu_user_regs *regs)
+{
+#define GPR_LIST \
+    X(regs, ra, " ") X(regs, sp, "\n") \
+    X(regs, gp, " ") X(regs, tp, "\n") \
+    X(regs, t0, " ") X(regs, t1, "\n") \
+    X(regs, t2, " ") X(regs, s0, "\n") \
+    X(regs, s1, " ") X(regs, a0, "\n") \
+    X(regs, a1, " ") X(regs, a2, "\n") \
+    X(regs, a3, " ") X(regs, a4, "\n") \
+    X(regs, a5, " ") X(regs, a6, "\n") \
+    X(regs, a7, " ") X(regs, s2, "\n") \
+    X(regs, s3, " ") X(regs, s4, "\n") \
+    X(regs, s5, " ") X(regs, s6, "\n") \
+    X(regs, s7, " ") X(regs, s8, "\n") \
+    X(regs, s9, " ") X(regs, s10, "\n") \
+    X(regs, s11, " ") X(regs, t3, "\n") \
+    X(regs, t4, " ") X(regs, t4, "\n")
+
+#define X(regs, name, delim) \
+    printk("\t %-4s: %016lx" delim, #name, (regs)->name);
+
+    GPR_LIST
+
+#undef X
+#undef GPR_LIST
+}
+
+static void dump_csrs(unsigned long cause)
+{
+#define CSR_LIST \
+    X(stvec, CSR_STVEC, " ") X(vstvec, CSR_VSTVEC, "\n") \
+    X(sepc, CSR_SEPC, " ") X(vsepc, CSR_VSEPC, "\n") \
+    X(stval, CSR_STVAL, " ") X(vstval, CSR_VSTVAL, "\n") \
+    X(status, CSR_SSTATUS, " ") X(vsstatus, CSR_VSSTATUS, "\n") \
+    X(satp, CSR_SATP, "\n") \
+    X(scause, CSR_SCAUSE, " [%s]\n", \
+      decode_cause(v)) \
+    X(vscause, CSR_VSCAUSE, " [%s]\n\n", \
+      decode_cause(v)) \
+    X(hstatus, CSR_HSTATUS, " [%s%s%s%s%s%s ]\n", \
+      (v & HSTATUS_VTSR) ? " VTSR" : "", \
+      (v & HSTATUS_VTVM) ? " VTVM" : "", \
+      (v & HSTATUS_HU)   ? " HU"   : "", \
+      (v & HSTATUS_SPVP) ? " SPVP" : "", \
+      (v & HSTATUS_SPV)  ? " SPV"  : "", \
+      (v & HSTATUS_GVA)  ? " GVA"  : "") \
+    X(hgatp, CSR_HGATP, "\n") \
+    X(htval, CSR_HTVAL, "\n") \
+    X(htinst, CSR_HTINST, "\n") \
+    X(hedeleg, CSR_HEDELEG, "\n") \
+    X(hideleg, CSR_HIDELEG, "\n") \
+    X(hstateen0, CSR_HSTATEEN0, "\n\n")
+
+#define X(name, csr, fmt, ...) \
+do { \
+    unsigned long v = csr_read(csr); \
+    printk("\t %-10s: %016lx" fmt, #name, v, ##__VA_ARGS__); \
+} while (0);
+
+    CSR_LIST
+
+#undef X
+#undef CSR_LIST
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


