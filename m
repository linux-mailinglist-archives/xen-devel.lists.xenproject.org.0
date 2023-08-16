Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1CD77DEB6
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:31:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584445.915203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnv-0004R3-04; Wed, 16 Aug 2023 10:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584445.915203; Wed, 16 Aug 2023 10:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnu-0004Na-QJ; Wed, 16 Aug 2023 10:31:06 +0000
Received: by outflank-mailman (input) for mailman id 584445;
 Wed, 16 Aug 2023 10:31:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDeH-0003RA-3d
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:21:09 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96013628-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:56 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3197f632449so2046386f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:56 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:54 -0700 (PDT)
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
X-Inumbo-ID: 96013628-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181255; x=1692786055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyGs7CnsViwgB5MgcxTTzAGPB+T2Y8tFCTpCN8v2198=;
        b=V6Uc5dIpcKOHvGRRdn03XFm2/DIWrt0Ocxwq/2Pli5zGu5WgX0hl3knnAUUzxtdUc3
         lKPWGC45zDXJsJrmCIdgA1cw14Jbc1PcgnYAGxnab16D2UhOS12fdE2BALxl4p2bhLac
         dqtRuMZDuIsjtPpu6X1zjmilArdZGL1nuQeYJHEWhCNGyjTJ75FkD7eDGT/C4T2URkWl
         RmGC4hHRRg0qVCQNc5Hd63ha+EgvRwLEj2aIp8N3PL/9YOk+Imy/J02MKp3kr1kCp5f8
         d1VdEWrVSABdcZqH46/DNnigsUHkpSQvvFFmMk2FOqG1NPNMa4LaFe1gbaN1wum3OHHl
         lqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181255; x=1692786055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xyGs7CnsViwgB5MgcxTTzAGPB+T2Y8tFCTpCN8v2198=;
        b=Nug94O/Tznb/vMSUqN5+2v3edeH6GsFOLMZ1znAXn5VRA7s7hGqfKGnRmrixO76/Aq
         UyABtsvQhf9NgcwMzWiqJSDZJPsIAeRViUxOvXvR6Sw5xrKcfDOYaSg+MS+74zX5etPr
         PCjGnGMIRDxhvIeEPATt7YDdarbJFBBuWBRUg/BcwWTWsoLUoeW9oayDDI9FSv9WiReR
         aWBIteNIpRWAQPBIVFLnpqjwQF6fbFUisWHQp/6KClztwNjimOxUvBBE2/RwZOFZO0Hx
         KnaNDuoP4j9dea91PmDYVhUTTJkL1KXM9CFX7X1nqAt0LjpSuyENG0cPIJIh2099Ubry
         iTBg==
X-Gm-Message-State: AOJu0Yw2Gy9SVeDs+/qD+vf2PoUxjZB2FXgOyhcNVeuXNK/fpF5b316Y
	D1EBVixvTSzydAkLEvx726inuSq3tlKHZYSh
X-Google-Smtp-Source: AGHT+IF4I3zhVFFCcSCP5RHe/vVkgg0jJN/B9mkw4/3wZ2J4n42ccn5NtIwS8/C983cGRiIQN1i8Hw==
X-Received: by 2002:a5d:440f:0:b0:319:6e58:7095 with SMTP id z15-20020a5d440f000000b003196e587095mr1050171wrq.66.1692181255210;
        Wed, 16 Aug 2023 03:20:55 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 49/57] xen/riscv: add minimal stuff to asm/processor.h to build full Xen
Date: Wed, 16 Aug 2023 13:20:02 +0300
Message-ID: <49fc04992808963a17321e4f34b8310a4b3077fb.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
2.41.0


