Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3876A70A0
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 17:14:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504141.776697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXP5r-0000UK-4V; Wed, 01 Mar 2023 16:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504141.776697; Wed, 01 Mar 2023 16:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXP5r-0000ST-1C; Wed, 01 Mar 2023 16:14:15 +0000
Received: by outflank-mailman (input) for mailman id 504141;
 Wed, 01 Mar 2023 16:14:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXP5p-0000SN-0D
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 16:14:13 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a8ec1ef-b84c-11ed-96a6-2f268f93b82a;
 Wed, 01 Mar 2023 17:14:12 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id i9so18338564lfc.6
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 08:14:11 -0800 (PST)
Received: from fedora.. (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 h20-20020ac25974000000b004dd0bbc89a1sm1776196lfp.244.2023.03.01.08.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 08:14:10 -0800 (PST)
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
X-Inumbo-ID: 1a8ec1ef-b84c-11ed-96a6-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677687251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VrJOB0YyYKCsLpRkXtn6hYbcpuVZfe6Ic8uPAhle/rY=;
        b=FSKCVBdebJjXp/pHfDdVE8CYIbNk2rvmBqjYLuEHriGZp0kf23k8NVk1CxuKdic9dl
         6wCl4FBXgDIniaNnJwkrKAQy+RGG1LTbrQ/g2SyNva5tBdC4yTbIk8IQ67N34xMtGSCv
         4/xdmSL4Rs1AWiy7dLRWl0KSxBNjj9u/OdnhlXmFzniVwx3eM2A0r2lD8f75O6OWaa7f
         7q1C+b6xtFDA63LV9sdWy6axqUb6uCjXo5O0XPQmo6x/IeoIKVkZmGiOxHLTLCLkjj1v
         JjAmHt5wQl1zJuwTd15BeyqTJYEZMrMclqtyU2fn01FDCAoBPsk22K0qCBs7Z+TrvRjH
         aiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677687251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrJOB0YyYKCsLpRkXtn6hYbcpuVZfe6Ic8uPAhle/rY=;
        b=5KM4rCrH0yic+BC/Wl5rI1/AyUXXKkOCC6zok7ntQxmBcR7O6X2KNNMBcMSbxX6Rxz
         kJoXJbODw2SGvQDznVyY6F1tMXXHv3+TWgvjE0wK1slZvRQG/5I3hrrs7yOaiT5Vs3JD
         bJeWfTqBoZLcPetDrIGRWNjFrfFlK8QoOSoVcj8gfCSCsHFrVCUThiX+KWIjS4lbE30K
         H7d4xhdUadK9jUQBVTJuxYccx4zi0gEvP35tMRHh6jIvUaykBWn0xEdxIUV/S26sgHrn
         MxJpMSeIqmyy5wdMMZDML5fSAUTm++uV0JNTlf7VfkcStjgmBbf7iZ35XrxrS20EGMwv
         CaHQ==
X-Gm-Message-State: AO0yUKUY5CwJEOAxN9hUA9vYFq9vKfgExfH6q8KAMT6LGTEEKXDVEE+C
	pdRNbuSUXHsplbvEWt45UZrs9J4mWPQ=
X-Google-Smtp-Source: AK7set85hNpo77A9Fp8vUSH8SIkyrJipDfszac+9cCwVx83AVAijN5cYv9uvmL2fPzSCvbY3WbAbzQ==
X-Received: by 2002:ac2:5927:0:b0:4dd:abb9:dae4 with SMTP id v7-20020ac25927000000b004ddabb9dae4mr1841952lfi.25.1677687251114;
        Wed, 01 Mar 2023 08:14:11 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1] xen/arm: align *(.proc.info) in the linker script
Date: Wed,  1 Mar 2023 18:14:07 +0200
Message-Id: <74973920d8722df3ce533979314564f331acf16e.1677687247.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During testing of bug.h's macros generic implementation yocto-qemuarm
job crashed with data abort:

(XEN) Data Abort Trap. Syndrome=0x1830021
(XEN) Walking Hypervisor VA 0x2a5ca6 on CPU0 via TTBR 0x000000004014a000
(XEN) 1ST[0x000] = 0x0000000040149f7f
(XEN) 2ND[0x001] = 0x0040000040148f7f
(XEN) 3RD[0x0a5] = 0x00400000400b5fff
(XEN) CPU0: Unexpected Trap: Data Abort
(XEN) ----[ Xen-4.18-unstable  arm32  debug=y  Not tainted ]----
(XEN) CPU:    0
(XEN) PC:     0020063c head.o#__lookup_processor_type+0x1c/0x44
(XEN) CPSR:   600001da MODE:Hypervisor
(XEN)      R0: 412fc0f1 R1: 002a5ca2 R2: 002a5cd2 R3: 600001da
(XEN)      R4: 002a7e9c R5: 00000011 R6: 00000000 R7: ffffffff
(XEN)      R8: 48008f20 R9: 00000000 R10:00000000 R11:002ffecc R12:00000000
(XEN) HYP: SP: 002ffeb8 LR: 00200618
(XEN)
(XEN)   VTCR_EL2: 00000000
(XEN)  VTTBR_EL2: 0000000000000000
(XEN)
(XEN)  SCTLR_EL2: 30cd187f
(XEN)    HCR_EL2: 00000038
(XEN)  TTBR0_EL2: 000000004014a000
(XEN)
(XEN)    ESR_EL2: 97830021
(XEN)  HPFAR_EL2: 00000000
(XEN)      HDFAR: 002a5ca6
(XEN)      HIFAR: 00000000
(XEN)
(XEN) Xen stack trace from sp=002ffeb8:
(XEN)    97830021 002a7e9c 00000000 00276a88 002fff54 002c8fc4 11112131 10011142
(XEN)    00000000 002a5500 00000000 00000000 00008f20 00002000 48000000 002e01f0
(XEN)    00000000 60000000 00000000 40000000 00000001 002e0208 002a7e8c 002a7e88
(XEN)    002b0ab4 002e31f0 00000000 60000000 00000003 ffffffff 00000000 002aa000
(XEN)    00200060 00000000 00000000 48000000 40010000 3fe10000 00000000 00200068
(XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
(XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
(XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
(XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
(XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
(XEN)    00000000 00000000
(XEN) Xen call trace:
(XEN)    [<0020063c>] head.o#__lookup_processor_type+0x1c/0x44 (PC)
(XEN)    [<00200618>] lookup_processor_type+0xc/0x14 (LR)
(XEN)    [<002c8fc4>] start_xen+0xb8c/0x1138
(XEN)    [<00200068>] head.o#primary_switched+0x8/0x1c
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) CPU0: Unexpected Trap: Data Abort
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...
(XEN) Xen: Platform reset did not work properly!
(XEN) Xen: Platform reset did not work properly!

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/xen.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 3f7ebd19f3..1b392345bc 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -67,6 +67,7 @@ SECTIONS
        *(.data.rel.ro)
        *(.data.rel.ro.*)
 
+       . = ALIGN(4);
        __proc_info_start = .;
        *(.proc.info)
        __proc_info_end = .;
-- 
2.39.0


