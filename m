Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB278D249F9
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 13:56:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205061.1519517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgMta-0005SN-Ub; Thu, 15 Jan 2026 12:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205061.1519517; Thu, 15 Jan 2026 12:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgMta-0005Qx-S1; Thu, 15 Jan 2026 12:56:14 +0000
Received: by outflank-mailman (input) for mailman id 1205061;
 Thu, 15 Jan 2026 12:56:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ba0k=7U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vgMtZ-0005QC-Ml
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 12:56:13 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9173e225-f211-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 13:56:11 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-65089cebdb4so1365090a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 04:56:11 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b871f50cdc4sm1073599266b.20.2026.01.15.04.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 04:56:10 -0800 (PST)
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
X-Inumbo-ID: 9173e225-f211-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768481771; x=1769086571; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pfh8ymSKNRwssTu9w7Ic4LfSMxpFQTrPMsHWSNICpiM=;
        b=iv3dF3ioqCSEDBOG7/1RWTQ1iCYEqdwuuloSz+bHKWY4smVuf5YR3heBY+fuHMErE+
         5t5aZqN9F0Z15kcqiLJuTC03JGjMAkrEOr7TROolBFOk+JyHT1G+4+N10WG7sHpBa0rw
         7/xmOXDXAGWDngYWqCA3FBVry7bBbPJ1vdOWvfBht/eLiwVZDAzROmexg8xAhrOH86Ze
         JKIl9t9fH9ij3M5GBzMeCnjmOtRzdN77asJCku4/ozJgEyyxRJHe1ysSuVixTOUrjG7M
         k53jwg6rvOy+BhAqB0M1m35Tc03v2UHf+JzA2V+5xXlEPfl+06yRMlzdQwoA7phrkemZ
         m66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768481771; x=1769086571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pfh8ymSKNRwssTu9w7Ic4LfSMxpFQTrPMsHWSNICpiM=;
        b=AS+5zBPw7/d4JiBQaizTAO4jyC1wRFb+wesk/pShVMdUYoC1i10vDsrcj95EARPbcU
         KQpSlbHgEIlEkuDvSophlh5G/0nBbSkqkSgBrdGNXERgv/6bNiHAz/t5hHxA3mgTFnx3
         K8NjSaGW3FmdsD5r/0/A+Di9je9Rx8U0nH/igSBJ3hGlrN/C9AMCNcbRRUWP1A5uTpL8
         n+WGzDfDKzjX0VEJ3vbTkb2QLZSv9GOQxWhTnCV8jyjRXouxigfvQz3dn630tc6TeEdg
         jrevEpoSFSMtxZWKzm28dUbtlucSB/A28tSr/uaXHeEqH8gJWKceDPAVB2CCF7izV0oE
         L0hw==
X-Gm-Message-State: AOJu0Yyc0MZJ3joMhmIKi6nnHRORlBZRVizK2kSb9QCBsbx9sWGXB1sk
	SYI0Q6UuP5v52YODiVgxKvtrutkbc0bFG9bMHyspvdXROIqqyghYb8NhiKRLGw==
X-Gm-Gg: AY/fxX4GeOLxlACw1FkGyJT8wFJxlAoD4CYUscHfUupzA/IalopqFbyeGDtbiq73JX6
	z7D4NkGE+/bdJLXCzBHhYRx0xxmBNGDht+2dGcI0Z429z4vjlBJFOK5ceVnTiypsQEm8lUoC+pE
	O7eah4zl3HiSm5spdIcGutDNiMGH/oo7v0sEYehwETTuTvN/AVsYB16YJ4CiDPZWPDsUfsJs0Ld
	e//9RubLnvsmiiB1bxPTiB6mnuZlEkmiAIWcQnfUNoH0nlWUO9hOroFPccH3+wZGEA0xAHKTatY
	OAXP4t3qHBB1/6Eyk+5giSxo/hxLR0D+7n/M4G9bcDjfsqFZbHMKmzunVDtFEWbXaBlhooJVmN+
	afiuZVrZXtjU6nUWkQFwBK+PGnfFWpTYiw3U0jzlQImJjPTS5xdCgtcfBMcIIp7FD9janqDb7v5
	TXdfi5SO76mdvPPekZIil2zNfJgAwIeWvGoKBpXivYZUY85c3VOoy/YA==
X-Received: by 2002:a17:907:9629:b0:b74:9833:306c with SMTP id a640c23a62f3a-b876127f271mr494457366b.47.1768481770863;
        Thu, 15 Jan 2026 04:56:10 -0800 (PST)
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
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/riscv: dump CSRs on unexpected traps
Date: Thu, 15 Jan 2026 13:56:01 +0100
Message-ID: <20260115125601.70834-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide more context on the exception state when an unexpected
exception occurs by dumping various Supervisor, Virtual Supervisor
and Hypervisor CSRs.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/traps.c | 55 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index e9c967786312..d6c92588ea47 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -17,6 +17,10 @@
 #include <asm/traps.h>
 #include <asm/vsbi.h>
 
+#define print_csr(csr) do { \
+    printk("\t" #csr ": %#02lx\n", csr_read(csr)); \
+} while ( 0 )
+
 /*
  * Initialize the trap handling.
  *
@@ -99,12 +103,63 @@ static const char *decode_cause(unsigned long cause)
     return decode_trap_cause(cause);
 }
 
+static void dump_csrs(unsigned long cause)
+{
+    unsigned long hstatus;
+    bool gva;
+
+    printk("\nDumping CSRs...\n");
+
+    printk("Supervisor CSRs\n");
+    print_csr(CSR_STVEC);
+    print_csr(CSR_SATP);
+    print_csr(CSR_SEPC);
+
+    hstatus = csr_read(CSR_HSTATUS);
+    gva = !!(hstatus & HSTATUS_GVA);
+
+    printk("\tCSR_STVAL: %#02lx%s\n", csr_read(CSR_STVAL),
+           gva ? ", (guest virtual address)" : "");
+
+    printk("\tCSR_SCAUSE: %#02lx\n", cause);
+    printk("\t\tDescription: %s\n", decode_cause(cause));
+    print_csr(CSR_SSTATUS);
+
+    printk("\nVirtual Supervisor CSRs\n");
+    print_csr(CSR_VSTVEC);
+    print_csr(CSR_VSATP);
+    print_csr(CSR_VSEPC);
+    print_csr(CSR_VSTVAL);
+    cause = csr_read(CSR_VSCAUSE);
+    printk("\tCSR_VSCAUSE: %#02lx\n", cause);
+    printk("\t\tDescription: %s\n", decode_cause(cause));
+    print_csr(CSR_VSSTATUS);
+
+    printk("\nHypervisor CSRs\n");
+
+    print_csr(CSR_HSTATUS);
+    printk("\t\thstatus.VTSR=%d\n", !!(hstatus & HSTATUS_VTSR));
+    printk("\t\thstatus.VTVM=%d\n", !!(hstatus & HSTATUS_VTVM));
+    printk("\t\thstatus.HU=%d\n", !!(hstatus & HSTATUS_HU));
+    printk("\t\thstatus.SPVP=%d\n", !!(hstatus & HSTATUS_SPVP));
+    printk("\t\thstatus.SPV=%d\n", !!(hstatus & HSTATUS_SPV));
+    printk("\t\thstatus.GVA=%d\n", !!(hstatus & HSTATUS_GVA));
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
+
     die();
 }
 
-- 
2.52.0


