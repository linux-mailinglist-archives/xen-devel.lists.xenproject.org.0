Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 928D17F71AA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:40:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640437.998682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TbF-0006io-TI; Fri, 24 Nov 2023 10:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640437.998682; Fri, 24 Nov 2023 10:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TbF-0006cX-Lu; Fri, 24 Nov 2023 10:39:53 +0000
Received: by outflank-mailman (input) for mailman id 640437;
 Fri, 24 Nov 2023 10:39:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTL-0006hy-91
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:43 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8e02581-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:42 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9ffb5a4f622so246791366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:42 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:41 -0800 (PST)
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
X-Inumbo-ID: a8e02581-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821902; x=1701426702; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzc425nFXp+S3527hP5ZVJ6OTAIAaaKhm6tESKxxSc0=;
        b=nervIoMRbEpZc5is4vmyqY3Y3oyEu9p/WKG7CmsicTcgLMbndjdycTXeTbL1T58WRT
         Enx4P2IoIv/c+flvF+MPiHVB0u/Cv55uM6naEICMso+FEQ23Dm2kApxRHoxeGl4AOcOz
         ips9UALqJd+efwK+qCoUczgQ5EcSkG2Pl+XWRJ8WMM5e6+Yjm1wFLNhHMygVgAQNh2M4
         I0lJhoYkjSSbsq7RJOeC+rmwHVm5M8PzKm8d9Wglk3fXB6dyyEy3nEQZWvxKdt7JCBFx
         AxRVhWCEMoGpkMKLukda5re3U7vRBeg5u+ov98L3P7sDBxV85Mpu9xG1h4sNanScFUmO
         k/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821902; x=1701426702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzc425nFXp+S3527hP5ZVJ6OTAIAaaKhm6tESKxxSc0=;
        b=eR+ysLb7vSeEVPK+ksxuu5EwJdxnJEhDzT2oTKY1luzFfkghYGS2hJPZz4fxWOz289
         P3BGaovp1NIHH3em0r+xfrYTA5JclJybPX10S2qTo7pLhkoZQhaac9gocEykt4z5zMS5
         RMEXkDCdxHep36fNs289NmqfqI8j8rw6yowB16fv/6leT5GDFpM3ztnXIATzwfq6e1tE
         j7mT5jMKwQfczePkqiXRVIve5yCMfo4rIQNZRyMhSJdMu9q9yp5Kc1eTW2pwYgCqXHPP
         1j5gh8xOiQwuW/gbdi13DAtaDCT+tBn0vyGfVRSBqjZP26zwhWX0H1c64iMyUHAX9PmU
         mvow==
X-Gm-Message-State: AOJu0Yw1mvnnHorXSX+bmVvFBcnOGAit6jDl4hDMp/ULG0+r87lSuOeo
	PBKJFjVR8xL13oOlarRAbDN+TblrE+Iiaw==
X-Google-Smtp-Source: AGHT+IHFSnMZTc4mmW+Nx6XlGmcfMrgK8fu/A3K6Mw+E0AaDeHPkA/qLtMDu1Db/jW8AHe2do5uydg==
X-Received: by 2002:a17:906:375b:b0:9c7:5667:5649 with SMTP id e27-20020a170906375b00b009c756675649mr1624362ejc.73.1700821902025;
        Fri, 24 Nov 2023 02:31:42 -0800 (PST)
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
Subject: [PATCH v2 31/39] xen/riscv: add required things to asm/current.h
Date: Fri, 24 Nov 2023 12:30:51 +0200
Message-ID: <b6328d9b5bbb9269066dc17d7c0fcb32fa935b2b.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add minimal requied things to be able to build full Xen.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/current.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
index d84f15dc50..e105329bf3 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -3,6 +3,22 @@
 #ifndef __ASM_CURRENT_H
 #define __ASM_CURRENT_H
 
+#include <xen/percpu.h>
+#include <asm/processor.h>
+
+#ifndef __ASSEMBLY__
+
+struct vcpu;
+
+/* Which VCPU is "current" on this PCPU. */
+DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
+
+#define current            (this_cpu(curr_vcpu))
+#define set_current(vcpu)  do { current = (vcpu); } while (0)
+#define get_cpu_current(cpu)  (per_cpu(curr_vcpu, cpu))
+
+#define guest_cpu_user_regs() (0)
+
 #define switch_stack_and_jump(stack, fn) do {               \
     asm volatile (                                          \
             "mv sp, %0\n"                                   \
@@ -10,4 +26,8 @@
     unreachable();                                          \
 } while ( false )
 
+#define get_per_cpu_offset() __per_cpu_offset[get_processor_id()]
+
+#endif /* __ASSEMBLY__ */
+
 #endif /* __ASM_CURRENT_H */
-- 
2.42.0


