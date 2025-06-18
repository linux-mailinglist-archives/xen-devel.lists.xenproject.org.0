Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 425C5ADE65F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 11:14:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018980.1395865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRorH-0003xC-NJ; Wed, 18 Jun 2025 09:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018980.1395865; Wed, 18 Jun 2025 09:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRorH-0003uf-Js; Wed, 18 Jun 2025 09:13:27 +0000
Received: by outflank-mailman (input) for mailman id 1018980;
 Wed, 18 Jun 2025 09:13:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ttdJ=ZB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uRorF-0003uZ-He
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 09:13:25 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c03e442-4c24-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 11:13:23 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-adb2bb25105so1133818466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 02:13:23 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec8982f4esm1037154766b.176.2025.06.18.02.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 02:13:21 -0700 (PDT)
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
X-Inumbo-ID: 7c03e442-4c24-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750238002; x=1750842802; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SimK3Vzm4oopunXcaB2KG1naXZ0rung4wUt4Ht0KGxk=;
        b=L3o50coiDgKqya0gaoswyG3te/PQHDCOfdu0x7txPRQXOkjVkLUkjVDC/V6tkQJn9q
         SS8wiPfE1Jl0R/xeaPyI8HckOYhXqhBtcfTsGShGpxPXhKlJ3T4S3eT2d6CsP+9wKRsR
         fGXz7/eWM6cprCzJ6OXb1iCPJ2ug3031c1jFoON+t5cNKBI6ef6TAZ/1wwODlKC9Tl91
         yVDtgZzv/ylnfEv/ud909uwTgzGB92fXMnH7uEvVeGWX/hCLKoBsyntA6/e9O1YfxTqV
         dNka/TEPbQSc++yD0Au/xiumz+eTh7cJQrbVTo0kRV6E40ftWQBomVknwDijDatlpAjC
         +XtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238002; x=1750842802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SimK3Vzm4oopunXcaB2KG1naXZ0rung4wUt4Ht0KGxk=;
        b=KgYUN3hsiG0HRu1+4W0/wyj0VLcXYWvEy/HB9MILjbE7AxMPf94NZRdPtg/RL4tkN6
         rRRBRax6qtUkMEhKsLnW4v8bi2MEzztHJaf3/UOv82n51UcKc85dC9sCmvhC7NmqoT30
         iKO5XndZ9NYGKmTxmfaIvBxHyp9CZE0p2FJsF62097aA3FQaco3a7ld+2mmoo6dL7OS8
         Iow8lAYCVWLfaAy1XQuB9uvTjzCDLHfarRM995zaTGiHHheM1vRMmYuB/KtqS/vmw1qa
         4oiZNrheutkWuMgqoTipqLkA5w8H1r8aRM5n0nGcW2PIHP3fMupAz8K3X2tSSNd/an1L
         m11A==
X-Gm-Message-State: AOJu0YxZhM4Q5ZTJBogP4vOwtYZSDuUstg6c74bSOU+aQ5D4LIBkF6j4
	lgJpa6Ey5F68mjJs8HpAxjDXvtltrTOHE+QHozLRqQ8OhuM9rQwNOs8I+R8Ngw==
X-Gm-Gg: ASbGncuL7IPhTsQNi1Bf9zXZz738PAIqTdvP0O41DYm/cMSxnEstBq2CdOy2xIOUMok
	83NNjdlq8+4KrpayZU/XQMW5P2nEHE2SruSPTaIGaCl5nzn66g2GjryzWuRqWiy+MUEVbROs6Dw
	BK6eHLi142ouy+bB9CFDfTgUFaNJyYaZXSsDc+SO0pbpu+4J5Allr+JHBO9WADAcPmSqTR0mVIY
	Qq/n37khfgWbdoIFU+TCNEAXmBZRELrOy2FVrxPjYG2BP9gtfIlA4x1bajrnlUh++eqprZ4FFyo
	iK6IKr0DctzlPAruBsmamCEypNXlOfbQ4XTAhLtDGWFL97WvtZ0sPjVl3Rfbgiuj8IbXlFb1lX8
	MdKn23XZ704UgMPTcZso16aAqsP/c
X-Google-Smtp-Source: AGHT+IFdMBkSD1M9vseqf9WvEBR79tIc3p05InTdbTzOF7W1VRUmTy/CA32y9BgsSVUHZtr50zKO2w==
X-Received: by 2002:a17:906:4fd5:b0:ad8:8efe:3205 with SMTP id a640c23a62f3a-adfad4f585fmr1196891066b.55.1750238002216;
        Wed, 18 Jun 2025 02:13:22 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1] xen: move __ro_after_init section symbols to xen/sections.h
Date: Wed, 18 Jun 2025 11:13:16 +0200
Message-ID: <1254ad9fd9f9fefc71ff8a5f5d23f5037d854943.1750237599.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of declaring __ro_after_init_{start,end} in each architecture's
asm/setup.h, move these declarations to the common header xen/sections.h.

This centralizes the declarations and reduces duplication across
architectures.

No functional change intended.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
CI tests:
  https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1875993985  
---
 xen/arch/arm/include/asm/setup.h | 2 --
 xen/arch/x86/include/asm/setup.h | 1 -
 xen/include/xen/sections.h       | 3 +++
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 2b58549c1a..b199d92a42 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -65,8 +65,6 @@ int map_irq_to_domain(struct domain *d, unsigned int irq,
 int map_range_to_domain(const struct dt_device_node *dev,
                         uint64_t addr, uint64_t len, void *data);
 
-extern const char __ro_after_init_start[], __ro_after_init_end[];
-
 struct init_info
 {
     /* Pointer to the stack, used by head.S when entering in C */
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index ac34c69855..b01e83a8ed 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -5,7 +5,6 @@
 #include <asm/numa.h>
 
 extern const char __2M_text_start[], __2M_text_end[];
-extern const char __ro_after_init_start[], __ro_after_init_end[];
 extern const char __2M_rodata_start[], __2M_rodata_end[];
 extern char __2M_init_start[], __2M_init_end[];
 extern char __2M_rwdata_start[], __2M_rwdata_end[];
diff --git a/xen/include/xen/sections.h b/xen/include/xen/sections.h
index fe49d7d0e6..cd542bfe10 100644
--- a/xen/include/xen/sections.h
+++ b/xen/include/xen/sections.h
@@ -5,6 +5,9 @@
 
 #include <xen/compiler.h>
 
+/* SAF-0-safe */
+extern const char __ro_after_init_start[], __ro_after_init_end[];
+
 /* SAF-0-safe */
 extern char __init_begin[], __init_end[];
 #define is_init_section(p) ({                           \
-- 
2.49.0


