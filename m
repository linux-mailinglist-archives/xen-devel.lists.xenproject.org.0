Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BBDD336E3
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 17:17:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206806.1520095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgmVh-0005Zz-Jf; Fri, 16 Jan 2026 16:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206806.1520095; Fri, 16 Jan 2026 16:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgmVh-0005Wn-G5; Fri, 16 Jan 2026 16:17:17 +0000
Received: by outflank-mailman (input) for mailman id 1206806;
 Fri, 16 Jan 2026 16:17:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO3W=7V=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vgmVg-0005Pw-00
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 16:17:16 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1edd7a5-f2f6-11f0-b15e-2bf370ae4941;
 Fri, 16 Jan 2026 17:17:14 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b8714a52072so338587866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Jan 2026 08:17:14 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879ae74639sm228575566b.9.2026.01.16.08.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 08:17:13 -0800 (PST)
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
X-Inumbo-ID: d1edd7a5-f2f6-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768580234; x=1769185034; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AoBnW7tBy1EuHOi2Jlnywq3gozT2W8TQV+cw8fxFPbM=;
        b=JBOYeLGAiPrVqLwBka3lfhAu/xAuNGdv2LXlRXH9AeB7+Y7p2VxgtlBlUgWnhHj3cf
         9WErd4eAAX42lEcJM9j+AZCuc95kffF9z34FjvwFiiL+/p4gZytWId1wbR92vX59gkD/
         v9zTwrxHwlC2eQJlzFiIzv61sIkrgLdK4MUgTxpGJhA7g51+dwhbfn6d24MH5rUsxZRS
         jiyW8BpMVOKCmIWgItjvM7Zyq8qC5yK921Plou74mv5M5Mgul3iyYcvrzIjXfQZC2Ufa
         lcVna2VRlOUg7ND7ljZqWaAGTEPK4lKhSofofb7nhMrdbn8xgXV25PNMOSNyCIYEz5BM
         lMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768580234; x=1769185034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoBnW7tBy1EuHOi2Jlnywq3gozT2W8TQV+cw8fxFPbM=;
        b=id3nEdNnD/AkVvWVQVQIqwg9cYBKlEVY/uIPJ26tS33omG8uzm2DWnUteU4FYFbnF0
         c8nVKkLffOgkUY8Pr+GNVmOyXr1Vj7bD2pP/ktPkO0m60jf9lvVGlr1JBsUyCiK3hnWV
         uURogK9pQEaVIOCsIx1hSgYnoGAZhIfdIHmbSligzViKDm4AV91vYQcJ3150laW++Cuu
         7umtajo22XGQJtcC5Q/JqQqwfBIbNEpBplSpJ3vbyqGODP0HGNLBxi0WLva2p6ZKZHgB
         pbpTxo5g1DSHwnOBmrIIVXx4YX/yj+n+m/Nfy+Omj57kqCjvP2RE3ZYcKIeTo/trdPk9
         3+Yw==
X-Gm-Message-State: AOJu0YwBCkil0XUbUTszuf8BE6Ne8qBC7+vV2rgIeQcSvFrMK5JK9hNr
	dTYBcsBFwLIZgNXyd0xLCW9it4Otv/3BDvH9RNojXbezrnow601i/KxchkxBjg==
X-Gm-Gg: AY/fxX7seLe0vfrMLfAHpTG0PSCA4wnYhYtO6jRZ9nohRXq7aduIZsBvejUHvqzYhZQ
	5Ufvpvr1Q+pS+EjUvASkn6NlEMvzahHosP8ARVVstr/j4V/+30K+1XPOSnI33L8tEunqnEqbUd0
	1hLowaE6GF3U5yO5Ht8jWHEjKOqY592uIVeIA+7lajvTO8+/Qe1REuJCNmY3IYAxBxoD7Eqk1wc
	wM0hdYVc9lAStEwfjLaOi81h1bAbZIRQb+k3hYQHdIXQeMqFBFdp9LJgaMEDjGRgaXNxdhfYNLc
	62aV/Uf5ROf5+Ixp+k6u2ZdLYm2Foj6wp7V3IJ65spRtBhnPsqzsshoZemOwtfUP2w1NuHxy7sx
	V649Pb4CV7x++dGvvqrUdd7sFPfyDDamdU/OPmB7PHBkfJK15haJP8vO6k4O/roWMKRRcSEJRJg
	oqB/4+N1g1pjF7jsE3LOTzrclrTv++YfMgl78I42AuqqkDZK/tUyFfuA==
X-Received: by 2002:a17:907:7f91:b0:b87:12ad:d4d3 with SMTP id a640c23a62f3a-b8796bb1bc0mr245882666b.55.1768580233696;
        Fri, 16 Jan 2026 08:17:13 -0800 (PST)
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
Subject: [PATCH v2] xen/riscv: dump GPRS and CSRs on unexpected traps
Date: Fri, 16 Jan 2026 17:16:39 +0100
Message-ID: <f6f7ec863e92ade433f23ae0061391d2ef731f41.1768579139.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide more context on the exception state when an unexpected
exception occurs by dumping various Supervisor, Virtual Supervisor
and Hypervisor CSRs, and GPRs pertaining to the trap.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2
 - Address coments about print_csr() macros and dump_csrs().
 - Add dumping of GPRs pertaining to the trap.
---
 xen/arch/riscv/traps.c | 82 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index e9c967786312..4e0df698552f 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -17,6 +17,13 @@
 #include <asm/traps.h>
 #include <asm/vsbi.h>
 
+#define print_csr(csr) \
+    printk("\t" #csr ": %016lx\n", csr_read(csr));
+
+#define print_gprs(regs, reg1, reg2) \
+    printk("\t%-7s: %016lx %-7s: %016lx\n", \
+           #reg1, (regs)->reg1, #reg2, (regs)->reg2)
+
 /*
  * Initialize the trap handling.
  *
@@ -99,12 +106,87 @@ static const char *decode_cause(unsigned long cause)
     return decode_trap_cause(cause);
 }
 
+static void dump_general_regs(const struct cpu_user_regs *regs)
+{
+    printk("\nDumping GPRs...\n");
+
+    print_gprs(regs, ra, sp);
+    print_gprs(regs, gp, tp);
+    print_gprs(regs, t0, t1);
+    print_gprs(regs, t2, s0);
+    print_gprs(regs, s1, a0);
+    print_gprs(regs, a1, a2);
+    print_gprs(regs, a3, a4);
+    print_gprs(regs, a5, a6);
+    print_gprs(regs, a7, s2);
+    print_gprs(regs, s3, s4);
+    print_gprs(regs, s5, s6);
+    print_gprs(regs, s7, s8);
+    print_gprs(regs, s9, s10);
+    print_gprs(regs, s11, t3);
+    print_gprs(regs, t4, t5);
+    print_gprs(regs, t6, sepc);
+    print_gprs(regs, sstatus, hstatus);
+}
+
+static void dump_csrs(unsigned long cause)
+{
+    unsigned long hstatus;
+
+    printk("\nDumping CSRs...\n");
+
+    printk("Supervisor CSRs\n");
+    print_csr(CSR_STVEC);
+    print_csr(CSR_SATP);
+    print_csr(CSR_SEPC);
+
+    hstatus = csr_read(CSR_HSTATUS);
+
+    printk("\tCSR_STVAL: %016lx%s\n", csr_read(CSR_STVAL),
+           (hstatus & HSTATUS_GVA) ? ", (guest virtual address)" : "");
+
+    printk("\tCSR_SCAUSE: %016lx\n", cause);
+    printk("\t\tDescription: %s\n", decode_cause(cause));
+    print_csr(CSR_SSTATUS);
+
+    printk("\nVirtual Supervisor CSRs\n");
+    print_csr(CSR_VSTVEC);
+    print_csr(CSR_VSATP);
+    print_csr(CSR_VSEPC);
+    print_csr(CSR_VSTVAL);
+    cause = csr_read(CSR_VSCAUSE);
+    printk("\tCSR_VSCAUSE: %016lx\n", cause);
+    printk("\t\tDescription: %s\n", decode_cause(cause));
+    print_csr(CSR_VSSTATUS);
+
+    printk("\nHypervisor CSRs\n");
+
+    printk("\tCSR_HSTATUS: %016lx [%s%s%s%s%s%s ]\n",
+           hstatus,
+           (hstatus & HSTATUS_VTSR) ? " VTSR" : "",
+           (hstatus & HSTATUS_VTVM) ? " VTVM" : "",
+           (hstatus & HSTATUS_HU)   ? " HU"   : "",
+           (hstatus & HSTATUS_SPVP) ? " SPVP" : "",
+           (hstatus & HSTATUS_SPV)  ? " SPV"  : "",
+           (hstatus & HSTATUS_GVA)  ? " GVA"  : "");
+
+    print_csr(CSR_HGATP);
+    print_csr(CSR_HTVAL);
+    print_csr(CSR_HTINST);
+    print_csr(CSR_HEDELEG);
+    print_csr(CSR_HIDELEG);
+    print_csr(CSR_HSTATEEN0);
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


