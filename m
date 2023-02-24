Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 192C46A1DFF
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 16:06:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501139.772769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZen-0006x7-3g; Fri, 24 Feb 2023 15:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501139.772769; Fri, 24 Feb 2023 15:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZen-0006uP-0L; Fri, 24 Feb 2023 15:06:45 +0000
Received: by outflank-mailman (input) for mailman id 501139;
 Fri, 24 Feb 2023 15:06:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVZel-0006Ou-Ew
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 15:06:43 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d91818c7-b454-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 16:06:43 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id k14so17292528lfj.7
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 07:06:43 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 d23-20020ac25457000000b004d863fa8681sm1492443lfn.173.2023.02.24.07.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 07:06:42 -0800 (PST)
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
X-Inumbo-ID: d91818c7-b454-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/gSRFTkaEkbR97ZxT3k+xBfRgzno3qG9xfy82tbgR4=;
        b=KpaLs9XDqIEFJGBISyk8iVLbk6s7isw+z2/FCAbm6+7xC6SY7A0ewqbumbWNCnrMvQ
         JvoYHnJPaW24kXfuzDH1Bf5hTs7vltWdDTSNGyk4Zu95zdXgZABR4i35RRK6rtRrpo0Z
         YwN0jQ6/cuWW8gL1gifIpgFs7ARDBFaISO7ndeSJC46aYexrRwhlt0LHHikRMoDzCusi
         ElJwvIkyD2ub4iEtAzRa1ttQttyYojZm+oz1kwydk1kuM3CALwpPEkex4KlbdHVaSWuH
         56JDKXoJKHHwscrKrZwptmos84T2OMkUhyLxAUgm9shR12+SzJ8d41/yDxrlluoexxkm
         iaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/gSRFTkaEkbR97ZxT3k+xBfRgzno3qG9xfy82tbgR4=;
        b=x5IkIonnvJNKuVdWyr/Tge7mu0Re9OuPGo8cw91jut2n1tF+aCfvTW3mmYRdeUAzOM
         iRxKS+V5zPuShQwkvekuikQB5FIoaPOPwbwoq57vkr8f4Vvp/kGoar/wqIO+7eTLuiwB
         lg+oDi0XwW54h+CFcIDmiLnEbronSQAhy/Yb/R5iMiIzB1ro0WXrKlcPvZqbR1VzcSYi
         k4Lt21y6Pqb/Nrebn7dU+xIdbuFjXTsjuNAvWPpph38SnDBimJlVesPapT434a5ilPyZ
         pFhsFX9G2BuJ1wp4m2rkGQVqxHpLZPQM4VEwzQIjzJ3NbrABDNVVI7TEgGnH7NiPikbz
         hGHw==
X-Gm-Message-State: AO0yUKWo1nCl8eaxba9dXtLt6OizDV0xHkxenwPhF4xrUrK1ecnyjVpi
	tfQi1TXoGzllsBfEGxKAHVlT+XjLbFc=
X-Google-Smtp-Source: AK7set9qr9ZwCV993coDibwSZiYqqCn2yTQnL7BMb3eCLn+q32l0dNLfCPvrA7NMVssXL087GeITSg==
X-Received: by 2002:a19:700d:0:b0:4dc:554b:d27e with SMTP id h13-20020a19700d000000b004dc554bd27emr5013319lfc.65.1677251202580;
        Fri, 24 Feb 2023 07:06:42 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 2/3] xen/riscv: setup initial pagetables
Date: Fri, 24 Feb 2023 17:06:34 +0200
Message-Id: <83444f8f90cf2adf431762d919ba958a25ff8ce4.1677250203.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677250203.git.oleksii.kurochko@gmail.com>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calculate load and linker linker image addresses and
setup initial pagetables.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/setup.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index b7cd438a1d..f69bc278bb 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,9 +1,11 @@
 #include <xen/bug.h>
 #include <xen/compile.h>
 #include <xen/init.h>
+#include <xen/kernel.h>
 
 #include <asm/csr.h>
 #include <asm/early_printk.h>
+#include <asm/mm.h>
 #include <asm/traps.h>
 
 /* Xen stack for bringing up the first CPU. */
@@ -43,6 +45,11 @@ static void __init disable_fpu(void)
 
 void __init noreturn start_xen(void)
 {
+    unsigned long load_start    = (unsigned long)start;
+    unsigned long load_end      = load_start + (unsigned long)(_end - _start);
+    unsigned long linker_start  = (unsigned long)_start;
+    unsigned long linker_end    = (unsigned long)_end;
+
     /*
      * The following things are passed by bootloader:
      *   a0 -> hart_id
@@ -65,6 +72,10 @@ void __init noreturn start_xen(void)
 
     test_macros_from_bug_h();
 
+    setup_initial_pagetables(load_start, load_end, linker_start, linker_end);
+
+    early_printk("MMU has been enabled\n");
+
     for ( ;; )
         asm volatile ("wfi");
 
-- 
2.39.0


