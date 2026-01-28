Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPx9J/0GemlE1gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 13:54:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1021A1A33
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 13:54:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215649.1525784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl53b-0001SU-4D; Wed, 28 Jan 2026 12:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215649.1525784; Wed, 28 Jan 2026 12:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl53b-0001Qs-1F; Wed, 28 Jan 2026 12:54:03 +0000
Received: by outflank-mailman (input) for mailman id 1215649;
 Wed, 28 Jan 2026 12:54:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3TT=AB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vl53Z-0001P1-5m
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 12:54:01 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a68ea07-fc48-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 13:54:00 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4359a16a400so6090543f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 04:54:00 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10ee057sm7647392f8f.15.2026.01.28.04.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 04:53:58 -0800 (PST)
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
X-Inumbo-ID: 6a68ea07-fc48-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769604839; x=1770209639; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pxnMsEq8qw7T+oqrKwi95udvWlS0pld5Lx9vUqLRgf0=;
        b=TRxqwU/DaoBTDJJsnTij4/Rz11v0vufOhnXNcATfmykTHtnnAqwazyDJq5w7ola2l/
         O6c5f78VBMYqQ9uJ+AruHhpSsbdSlUY2GghCr93Qd9W8itHX0F3yrgvPwVmmiI3f7i65
         naZvDcH2A4V0UDffNy93maOGWQfRo0pFLKS5QkW4ZTGKBU9n0XCY/M9tvhuioaFYcaQx
         x7m8LbzUUomxSUdfA3TmUcY8sRn6lA9YSXdOHqNkNWjnq8x0jwXzXXEDOt6/404uBmHy
         6FxxlteTUTBEau3VoMWyS2oat/3k2TUoRNcMKk3jdx5pPaxcDvXZIK0ko15wIVwqvEZZ
         U0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769604839; x=1770209639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxnMsEq8qw7T+oqrKwi95udvWlS0pld5Lx9vUqLRgf0=;
        b=QCEMdEyTKbs/6JQzyG4t5PvOwTCGn9aRe+dKDt4+1DR4Lc4dFA37ILRLKuo2g+UW0+
         hMmd+RJL+JJ+beTEePAiG0G7e+S4L9EHknEZT9fiAYlODA6vrN7UaF/AAPYOHqOIRNY8
         qreoRh0A7II/VNuAlcYfEpU0YTstz3HL+FQRsP+e2W+2yiLeSyKGXm2OUroOoG5xBmYO
         bqXvHIcvugOq2b2B2sweJXAbIU8FqwpO8OwnFW9u6I7IHJ2S6/yz20W9WZ38J5f8oo9u
         E8/NM7w3rYADoEkgEl/cqXURXYTVrCC02IBmt1oac1pxggG5s75gNzfVMECgSPj5BXUK
         cJFA==
X-Gm-Message-State: AOJu0YxJb9aRUikH/rBHKClVCpa3+VVfQeJSCkBMOelQGpYStjlha6yT
	aY3n9MaDT7LSqG7QPEHmUyooK8zSrfoKnFx39nS0/asHOZX3LRGPJ7zSYivGQA==
X-Gm-Gg: AZuq6aKbBpmweRUY6XKuTwWjav3oV0Tz18Vqvh3D/SH3TZT/d1kHbksUo8uh59b+FaV
	98XVExdWR28rfrk0nycxQKhgAyyLIxLhXXr9GDDeLs+JW9v12HBGmLPH/0e5XmmAcDnElU3AfUs
	dbdjshqsRtaGGCQYzKAyvIpP5knEOuwz3tJg7ONTSbBDLK32gw1k0rn06hYTjOyQy1bNft5PH3u
	0TMB9iG6Vbomb4nPaYZEYjeJGPS2KMKXQ9emZeT5/x9BNruh/bpoihVFTZ13rV66qJdANv1xOev
	lm2wl0s2BXmd9ib494hqhl0BsDhYIaphEsYBpxkP6bpUHF81ithdi+UiNQY8ucZBNlr1UdTMbnG
	+XQtU9UwclucT8pIADM24ukocHCWOa0NNH6nC4kBgTkm53lmx5RNA7p6G5GnEifUcDr3CnhczWF
	YmHfK9KfgRXf1Z+2+gH8Mzl4thzCV8gc8hNo9m5oDRBjOU3YOSediKyg==
X-Received: by 2002:a05:6000:1843:b0:432:c0e8:4a33 with SMTP id ffacd0b85a97d-435dd073639mr7289844f8f.22.1769604839270;
        Wed, 28 Jan 2026 04:53:59 -0800 (PST)
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
Subject: [PATCH v5] xen/riscv: dump GPRs and CSRs on unexpected traps
Date: Wed, 28 Jan 2026 13:53:48 +0100
Message-ID: <d0fddb38c11e1ab5659ef981e770a2a850ef8ac7.1769602563.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F1021A1A33
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
CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2291514286
---
Changes in v5:
 - Drop duplication in do_unexpected_trap() as dump_csrs()
   prints the similar message.
 - Drop twice loggong of SEPC.
 - Drop scause argument and add ctx string argument for
   dump_scrs() to print a context where dump_csrs() was called.
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
 xen/arch/riscv/traps.c | 60 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index e9c967786312..b72e6ef7eb35 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -99,11 +99,65 @@ static const char *decode_cause(unsigned long cause)
     return decode_trap_cause(cause);
 }
 
-static void do_unexpected_trap(const struct cpu_user_regs *regs)
+static void dump_general_regs(const struct cpu_user_regs *regs)
 {
-    unsigned long cause = csr_read(CSR_SCAUSE);
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
+    X(regs, t6, " ");
+
+#undef X
+}
+
+static void dump_csrs(const char *ctx)
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
+    X(scause, CSR_SCAUSE, " %s[%s]\n", ctx, decode_cause(v));
+    X(vscause, CSR_VSCAUSE, " [%s]\n", decode_cause(v));
+
+#undef X
+}
 
-    printk("Unhandled exception: %s\n", decode_cause(cause));
+static void do_unexpected_trap(const struct cpu_user_regs *regs)
+{
+    dump_csrs("Unhandled exception");
+    dump_general_regs(regs);
 
     die();
 }
-- 
2.52.0


