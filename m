Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA76757FC
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:00:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481860.747100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssK-0008QB-JJ; Fri, 20 Jan 2023 15:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481860.747100; Fri, 20 Jan 2023 15:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssK-0008Jr-57; Fri, 20 Jan 2023 15:00:16 +0000
Received: by outflank-mailman (input) for mailman id 481860;
 Fri, 20 Jan 2023 15:00:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVut=5R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIssH-0006Kg-6z
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:00:13 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23c0fd10-98d3-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 16:00:12 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id d14so1414141wrr.9
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 07:00:12 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002bdbead763csm25349811wrf.95.2023.01.20.07.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:00:11 -0800 (PST)
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
X-Inumbo-ID: 23c0fd10-98d3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjpYBpBo3Rvm4msdSTsMXPTvqTVEFs1X4iKpD2JoZQU=;
        b=lbAg5dv6suGwRBTCKXEyvvFajHOIaWRpUJEdSPJuBfhaq5FSurrZnxrfpX0gtdoSPI
         VS4Dkwg2tRGxZcE90N9W6vilda/AuaWcGR3JgMerMjXUrtt6uuW30q3KFryoQ4dj2haZ
         6Rf2JP0E3IKNt42KJbRGSH0/vZQikQPHca+kSAfGBm9wcH9maOSvGzIZvFEwTIuBJNi5
         7U+CdWG9BtInXKRKGS68hkZ/7JhtQ1TDCXY0rYE8mKICBzzPRDjxByt/xnSKZjdYD3ry
         WB9sWCPWegEhRiN1bhzioo2PcRWmXkfGzaevgljYO2SvFP0V0ar5+hr3DpAU5hcfgWjA
         3OfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjpYBpBo3Rvm4msdSTsMXPTvqTVEFs1X4iKpD2JoZQU=;
        b=q6KVNpPnMkt7pbLyoSwblskdOaMnPfKkNbKXdLYAGV0rJvA8Eqx/55CXOfLjd8srBc
         oGaqpm+M133+x69a7FwgOH6pWmvHXIma0yxMan0pWnEj+tjqv8JCIDbYYX9mZF0jgh8q
         NyEhqCWuLKgbvSZudPMnfCbF4k17i5jl3HqNbmn9KNflVGcDUHCpiMX4zvogwgu0yS2i
         AMDKDClNJKFft0AEDp4VhCfmFFR+WzdkhDCfSdk5p0bK/sZerSZ0HobgVAenXEBkKzvp
         2+hFXNk3pwgvpcV+WjvvC8VNfAyEJdAmROEeQTARPPuFMi4T20Cw8gygeZH7a9CJYb9j
         ztew==
X-Gm-Message-State: AFqh2kryi7WDcO2chgW3IOf55OGAATpNnXci9gpzdRwFLeeTCeTSPCBt
	ZvkY/N6eEQFd39lzKP3IdWYGVwO+HHmusw==
X-Google-Smtp-Source: AMrXdXteAT6I9N77L+ttW3wX8XDgO3yTGlXjVcwDsz4APn1u6Fh217pSeg8S9yJgMugS9zwgTeUbJw==
X-Received: by 2002:adf:f20d:0:b0:2bd:f549:e66 with SMTP id p13-20020adff20d000000b002bdf5490e66mr12883813wro.63.1674226811821;
        Fri, 20 Jan 2023 07:00:11 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 09/14] xen/riscv: introduce do_unexpected_trap()
Date: Fri, 20 Jan 2023 16:59:49 +0200
Message-Id: <74ca10d9be1dfc3aed4b3b21a79eae88c9df26a4.1674226563.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674226563.git.oleksii.kurochko@gmail.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces the function the purpose of which is to print
a cause of an exception and call "wfi" instruction.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/traps.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index dd64f053a5..fc25138a4b 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -95,7 +95,19 @@ const char *decode_cause(unsigned long cause)
     return decode_trap_cause(cause);
 }
 
-void __handle_exception(struct cpu_user_regs *cpu_regs)
+static void do_unexpected_trap(const struct cpu_user_regs *regs)
 {
+    unsigned long cause = csr_read(CSR_SCAUSE);
+
+    early_printk("Unhandled exception: ");
+    early_printk(decode_cause(cause));
+    early_printk("\n");
+
+    // kind of die...
     wait_for_interrupt();
 }
+
+void __handle_exception(struct cpu_user_regs *cpu_regs)
+{
+    do_unexpected_trap(cpu_regs);
+}
-- 
2.39.0


