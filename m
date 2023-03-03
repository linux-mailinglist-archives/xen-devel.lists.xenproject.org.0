Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 438CE6A951C
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 11:24:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505762.778703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2aY-0000SR-1K; Fri, 03 Mar 2023 10:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505762.778703; Fri, 03 Mar 2023 10:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2aX-0000Py-UA; Fri, 03 Mar 2023 10:24:33 +0000
Received: by outflank-mailman (input) for mailman id 505762;
 Fri, 03 Mar 2023 10:24:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y5Qx=63=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pY2aX-0000IE-8F
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 10:24:33 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95de3337-b9ad-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 11:24:31 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id b13so1815322ljf.6
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 02:24:31 -0800 (PST)
Received: from fedora.. (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 j22-20020a2e3c16000000b00295a36fedadsm239600lja.26.2023.03.03.02.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:24:30 -0800 (PST)
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
X-Inumbo-ID: 95de3337-b9ad-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677839071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUJgy0TiNB7fw4SRdJCyFwL3kkJhzok7rx37wlxII5E=;
        b=Z0EUPm7wBqkCsAtpRLL7Ekpyyg5vrju7Ivbas+9/sWfmVC013VgMlzo8nJjvMS/yqR
         iMSooWRajFkmvyFXKWe92/uFKKbmwxF/xg05MqX+yB2eMI8lNhP1IRBGtGFq+UJl/m4k
         QXSD07rFttuj12x1ATEEfHk5GWfthcDFzVhHUaWupqWybhiGMWb8+IX5yicYHgFUXCwg
         fVlRNSa0XpRpym+0wgrKHk2/kUIyVxqjcVv4hJTcHBhs5oEJ0Pl35Y1/6rYaj8iiKqNw
         3W6w8LQqvycR8AqXqjz1G5oUgQULtq1zUi40xKZjFT7XEBaeQzuyKckQsHxFvcKeb0pV
         1LPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677839071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUJgy0TiNB7fw4SRdJCyFwL3kkJhzok7rx37wlxII5E=;
        b=t3No4xwzCHxnY4tshCxfLEoY+Xp9eBXlg9s9r9xy5tyWFRiUzzuYUrT71Z7xP1JIXH
         UjT+i7tp8T+hZqjvWo8Va+xX2akkwrq5qg1zE26S+TKHjTqsvlPj5LYTpdzP9+gID3fu
         50Yaa29xJCNn74rjrOIdJ2NAsMLeuqIpWmasYV870LG5TiqFiqc1IOaAeXIMitxFCZ/o
         7l7kTlCBhh1cPQYcN+dc5FqKF2NwU+7j4l08KU0pcqMTF5A6vyw/VWw4+s4s0cx8Mhu9
         TIATmpQOBatobeWoy4OEQpioI3+BAmKFikVHPsBBMNQHqHl5t5MJ50AMxO3oGYCnOwZm
         pKVQ==
X-Gm-Message-State: AO0yUKWD0um18NJVcWv81Yb0L7OnU8QOgqTZazHyAxllODi9g+XCbmdW
	QZF28BQwE/VN5pWBd78l8GT0HwUuGIU=
X-Google-Smtp-Source: AK7set88QvL0fF8KY169jbRRQKhif+7BiovH1rOpcaAUUcyL3qvrh8FQ1y+VfhVr6ao3aZkAkQsdNw==
X-Received: by 2002:a2e:b051:0:b0:295:9d9c:24aa with SMTP id d17-20020a2eb051000000b002959d9c24aamr452589ljl.11.1677839070926;
        Fri, 03 Mar 2023 02:24:30 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 2/3] xen/riscv: read/save hart_id and dtb_base passed by bootloader
Date: Fri,  3 Mar 2023 12:24:23 +0200
Message-Id: <43aaa58fac47029b7d11f1d80d310786d7a078a6.1677838213.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677838213.git.oleksii.kurochko@gmail.com>
References: <cover.1677838213.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes since v2:
 * Add the comment for start() function with the explanation what and
   how OpenSBI pass to start() function.
 * Clean up start() code related to read&save hart_id & dtb_base.  
---
Changes since v1:
 * read/save/pass of hart_id and  dtb_base passed by a bootloader
   were moved to head.S. 
 * Update start_xen() to recieve hard_id & dtb_base
---
 xen/arch/riscv/riscv64/head.S | 5 +++++
 xen/arch/riscv/setup.c        | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 52fa41c778..adf5d6c74a 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -2,6 +2,11 @@
 
         .section .text.header, "ax", %progbits
 
+        /*
+         * OpenSBI pass to start():
+         *   a0 -> hart_id ( bootcpu_id )
+         *   a1 -> dtb_base 
+         */
 ENTRY(start)
         /* Mask all interrupts */
         csrw    CSR_SIE, zero
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 1c87899e8e..d9723fe1c0 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -7,7 +7,8 @@
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
-void __init noreturn start_xen(void)
+void __init noreturn start_xen(unsigned long bootcpu_id,
+                               unsigned long dtb_base)
 {
     early_printk("Hello from C env\n");
 
-- 
2.39.0


