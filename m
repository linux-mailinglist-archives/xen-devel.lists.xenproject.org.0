Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1B481CC1A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:19:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659498.1029203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhJT-0002DH-4I; Fri, 22 Dec 2023 15:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659498.1029203; Fri, 22 Dec 2023 15:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhJT-0002AE-14; Fri, 22 Dec 2023 15:19:47 +0000
Received: by outflank-mailman (input) for mailman id 659498;
 Fri, 22 Dec 2023 15:19:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDn-0007Ie-MB
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:55 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8f8621c-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:55 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50e2d00f99cso2278210e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:55 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:53 -0800 (PST)
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
X-Inumbo-ID: b8f8621c-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258034; x=1703862834; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8FSka20emVR5MBynLJ4eD5Np71hFeYAHDuqjNk27Ic=;
        b=Xr8WVsyMz4B78e7x78SypHC/PCBVWSY9rmU98hjGJh8bSrpznojDSDrKNpjfhZPx73
         MX9rgmOIYvGI/Xa/N26lFPuQrRg8a5qyl/ik9D8HkjEH5cmCW95R2regd/cBRo4ZuPRs
         W6UyZNqN6YlnrpfumTnoGmZYfCLKlSxur4VJPnIjY76TG2/lnAaOwJe79CpKp1MsgyNN
         Y3mIG6D5EKpYvE19r4MW0aGT0UoksLFr5vgQDRpIp6jqR+lICW6pDh/PRwhKGPCF1YaE
         tQGwZ+eOTCkfXxgmQmCPvMTqjr/wZAEi5hKkIl2TPQ7t1pTgC8Z8BFrPgEA0bhLBX6UZ
         e2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258034; x=1703862834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8FSka20emVR5MBynLJ4eD5Np71hFeYAHDuqjNk27Ic=;
        b=URm9NbvIoNfZhy+h9xhysyv1FvlSbf+kOvu8cn50wRmz+XXMnPgv1Meayje78EGf74
         tWK2RXbvduY8neZDCN8FB6q1ESAl5D6/KRFohog/VA/ThyUaA/QOr2qmy0cABqLXFtoE
         0YsJjaWsZYv+bTQ/09DECqPq6FOA70ox1UwDyCcO+gG/0lRgWy8n7+SHXwWvkAe1sW96
         3v2Ae/zwMEeT7r1mCHzLaHc7nbENfROx6LycFKZpUBKiJi4daUX9to/2zRYizvYgh9nO
         klj8wk9OAKOuhavSa9W3CIWrWS5+bVEGa/MyjSNQQ43ZZ5PNXvyw5jz8hUSDf4KaDg6Q
         dsEw==
X-Gm-Message-State: AOJu0Yw89FkzLTtm4baKk6jW6ZulgiLAdeGJocCeXMhkxHHtY9/d0A/c
	gMuUJg98Y2qMhyPb7e+D+HRVk9GnTyU=
X-Google-Smtp-Source: AGHT+IHjJ2HZBHWS5du2wbhHvQ9CEtfMPB0lh9DE4LLCqS2POsqWxKIBTwWu1DIuXeOnrNvcQXeuoQ==
X-Received: by 2002:ac2:4352:0:b0:50e:3f2e:c726 with SMTP id o18-20020ac24352000000b0050e3f2ec726mr816019lfl.87.1703258033996;
        Fri, 22 Dec 2023 07:13:53 -0800 (PST)
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
Subject: [PATCH v3 30/34] xen/riscv: add minimal stuff to processor.h to build full Xen
Date: Fri, 22 Dec 2023 17:13:14 +0200
Message-ID: <5bd7c5db6638f09dabdc13a6e12f0b204eacb234.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Update the commit message
 - rename get_processor_id to smp_processor_id
 - code style fixes
 - update the cpu_relax instruction: use pause instruction instead of div %0, %0, zero
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/processor.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 6db681d805..a3bff6c9c3 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -12,6 +12,9 @@
 
 #ifndef __ASSEMBLY__
 
+/* TODO: need to be implemeted */
+#define smp_processor_id() 0
+
 /* On stack VCPU state */
 struct cpu_user_regs
 {
@@ -53,6 +56,18 @@ struct cpu_user_regs
     unsigned long pregs;
 };
 
+/* TODO: need to implement */
+#define cpu_to_core(cpu)   (0)
+#define cpu_to_socket(cpu) (0)
+
+static inline void cpu_relax(void)
+{
+    /* Encoding of the pause instruction */
+    __asm__ __volatile__ ( ".insn 0x100000F" );
+
+    barrier();
+}
+
 static inline void wfi(void)
 {
     __asm__ __volatile__ ("wfi");
-- 
2.43.0


