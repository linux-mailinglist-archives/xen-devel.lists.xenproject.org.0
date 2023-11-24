Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7187F71F2
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:46:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640496.998806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6ThJ-00010Y-3I; Fri, 24 Nov 2023 10:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640496.998806; Fri, 24 Nov 2023 10:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6ThJ-0000ye-0D; Fri, 24 Nov 2023 10:46:09 +0000
Received: by outflank-mailman (input) for mailman id 640496;
 Fri, 24 Nov 2023 10:46:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTX-0006hx-D2
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:55 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9e978e5-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:44 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5431614d90eso2509960a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:44 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:43 -0800 (PST)
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
X-Inumbo-ID: a9e978e5-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821904; x=1701426704; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQmzcNiiecosotaPJOdRPOzfDS9PoO7Z6SaMHAHkahM=;
        b=QWhNT5itjIG8XYHI+ap8QQB0/dr+8UYx0d/2JCDQyfov8FkeI/fk2hC8ZJHYvBFaMH
         XdqiDGPOqwzqNfLFCUOreomFXxuemml+BvmHc+hcWca5ncEmW/r0tcchUu1EupTiqrOY
         3J5C1PZMk5daiRBC4k24Z4ZWsXQV+JIoxDXZQINCKJGG0XHlwZTGfqR5HThIMXu4rKeJ
         CuCujFRK/zMnErxHcvlBJ3h9JMLvsh7ZwUTT3tSaqiN1uP/WbQaC5sB8KCO5T5KEEv/H
         mxtEwlICrtaC/uSBYCd5w4xF5aYCIJ7LyX40c/xUAJjQb2VBp0xnN2T3x4m71M3/dZe+
         +R3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821904; x=1701426704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQmzcNiiecosotaPJOdRPOzfDS9PoO7Z6SaMHAHkahM=;
        b=I7SHFAZO8ZWONyiozQtUjvZVXiSbeLT8SB0KJsZZv5Zn61xtwUsijepKg8Hvch52Zo
         7m4KU5yZQTfySCu5OQQjKtYeUqW2t/qx2anbzk6UCFtcn2xP39/ulUJVNjN3ukaGWj2F
         5cVjbtkzEMzmIdbj/HVNptNYI/qthnao3BhBniTzeB1hKJU2D5vRiGszfrsW+CZOMIXr
         F7z8YaJD+c/ZeavCSmac/PSXRNjGHQPHpQ0+HuIjg9FuH56GVnDHIHSCMbw1n2jHuY4R
         BiRFl2dK49RFCSomOYLqWw86mKLwIxWKsUNaAUGrFIXgXG/I8NXxqxYkWNyGM5y8ze0/
         qKQA==
X-Gm-Message-State: AOJu0YyqRKIsHADHGRAblmHkFBfOT51AOxOhbEzyPY8cXhpd12xku16f
	KJdloMtb5KolVUQ+CC7GQ23/3C7Wh1reXA==
X-Google-Smtp-Source: AGHT+IEdpyOKOH8SGDaH8oOfbMTxNOrbOmYlKrSzOrQ5D2QKwj8rNSiRjo+5Uk9JZuwJomGoLlzEnw==
X-Received: by 2002:a17:907:3a91:b0:9be:2991:81fb with SMTP id fh17-20020a1709073a9100b009be299181fbmr1396968ejc.36.1700821903737;
        Fri, 24 Nov 2023 02:31:43 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 33/39] xen/riscv: add minimal stuff to asm/processor.h to build full Xen
Date: Fri, 24 Nov 2023 12:30:53 +0200
Message-ID: <11f177882b74c60233626075a69bdd00d3da2311.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/processor.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 6db681d805..b6218a00a7 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -12,6 +12,9 @@
 
 #ifndef __ASSEMBLY__
 
+/* TODO: need to be implemeted */
+#define get_processor_id() 0
+
 /* On stack VCPU state */
 struct cpu_user_regs
 {
@@ -53,6 +56,18 @@ struct cpu_user_regs
     unsigned long pregs;
 };
 
+/* TODO: need to implement */
+#define cpu_to_core(_cpu)   (0)
+#define cpu_to_socket(_cpu) (0)
+
+static inline void cpu_relax(void)
+{
+	int dummy;
+	/* In lieu of a halt instruction, induce a long-latency stall. */
+	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
+	barrier();
+}
+
 static inline void wfi(void)
 {
     __asm__ __volatile__ ("wfi");
-- 
2.42.0


