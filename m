Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B05C881A0BE
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 15:08:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657919.1027065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFh-0006Ql-T7; Wed, 20 Dec 2023 14:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657919.1027065; Wed, 20 Dec 2023 14:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFh-0006JC-OH; Wed, 20 Dec 2023 14:08:49 +0000
Received: by outflank-mailman (input) for mailman id 657919;
 Wed, 20 Dec 2023 14:08:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RD2L=H7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFxFg-0005qp-9i
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 14:08:48 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ae4d8ef-9f41-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 15:08:47 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cc2238f597so65396841fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 06:08:47 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d19-20020a05651c089300b002cc83c337absm593892ljq.70.2023.12.20.06.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 06:08:45 -0800 (PST)
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
X-Inumbo-ID: 4ae4d8ef-9f41-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703081326; x=1703686126; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMUlgSBxCWCXkSsj9cINsTG5a1nZhYKU/HqbJseXVoU=;
        b=HlY+wdF16q0/4KiSlhYRsZ9NGO+fwOej9B8huqLhTTZkTRGeGqQpSHxlt7bSHqy6Os
         zuYFHPLdSo7FXhhTZMtlo7AmmHyvZfemImuZ7nY/vavR+aSmoT5BILxEGT1n7nayYBeN
         21bMxQGKfmPgpHbGOG1yqbYOZRECpzIr34SgZiXPhu74xsm/vkw892tv7IScBWAcloBr
         Co72ugZ5rG7FZs2xdyGCpgRF19WHsyuaRkwPdFuBREb7iVDpjgS++fA3dq3ON/jknUFO
         +7JUpt4FG44IkA1zYemu4+ofNKpe85BQAUCLG9Ka8IuHL1eSya7ms+Uzg1IYwiYz7z8n
         oumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703081326; x=1703686126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CMUlgSBxCWCXkSsj9cINsTG5a1nZhYKU/HqbJseXVoU=;
        b=wUKSlN0Tul5QEuGR7mnuxJnZjOaH6uhnX4mlCe0iUREN34jYttffFYil2N1nbEcDN0
         ZgyzbB8fgxBk/QGWXPC+VjONpK1vCg/0yVWf09+sBYbR5UTRuV1IE085H9yyVtRKEqiT
         ZlU6R6dOptX9jmaLDnAjXT453eT5NOhZq9SCJeyY/YEbEX1Ko8hasatQyNKiFSDbpgBs
         bxLIUonIvCxVcSt7Eg5DeqTvS73fN1So6D0zb2YoD4VZCRcww5d2rDyVKEfb//Eh78x5
         ABaZN04yq4UHg18GqJyLiRVI017Jkbh/bBKKKIph/66Zf5DIrJ5ORoRMN49g1SmgmASo
         4nUA==
X-Gm-Message-State: AOJu0YxENJ1XgIuGatnIFz3INXiqpaBljd0aBgPrFYT725LVUVp0IPhG
	1xZUHm/TRpvN4ClPbJ+yyjAdjYbGjWHTPA==
X-Google-Smtp-Source: AGHT+IEfChI0P3tcjFVddHZMLISQh9YGv7E6OyCh9OqV7Oklb/elJObhGyvKyf4RQpnLGvKmjgRfYg==
X-Received: by 2002:a2e:781a:0:b0:2cc:7104:210c with SMTP id t26-20020a2e781a000000b002cc7104210cmr1396245ljc.146.1703081326044;
        Wed, 20 Dec 2023 06:08:46 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v6 6/9] xen/asm-generic: introduce stub header softirq.h
Date: Wed, 20 Dec 2023 16:08:28 +0200
Message-ID: <ab66dbcdc2eb919577d6cc90d9f5f27d00e423be.1703072575.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703072575.git.oleksii.kurochko@gmail.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/softirq.h> is common between Arm, PPC and RISC-V so it is
moved to asm-generic.

Drop Arm and PPC's softirq.h and use asm-generic version instead.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
Changes in V6:
 - Rebase only.
---
Changes in V5:
 - Strayed "Added" in commit message
 - Added Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
Changes in V4:
 - Added Reviewed-by: Michal Orzel <michal.orzel@amd.com>
 - Added Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - Drop Arm and PPC's softirq.h
 - Update the commit message.
---
Changes in V2:
    - update the commit message.
---
 xen/arch/arm/include/asm/Makefile                         | 1 +
 xen/arch/ppc/include/asm/Makefile                         | 1 +
 xen/arch/ppc/include/asm/softirq.h                        | 8 --------
 .../arm/include/asm => include/asm-generic}/softirq.h     | 7 ++++---
 4 files changed, 6 insertions(+), 11 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/softirq.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/softirq.h (56%)

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 0c855a798a..a28cc5d1b1 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -6,4 +6,5 @@ generic-y += numa.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
+generic-y += softirq.h
 generic-y += vm_event.h
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index f09c5ea8a1..efd72862c8 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -8,4 +8,5 @@ generic-y += numa.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
+generic-y += softirq.h
 generic-y += vm_event.h
diff --git a/xen/arch/ppc/include/asm/softirq.h b/xen/arch/ppc/include/asm/softirq.h
deleted file mode 100644
index a0b28a5e51..0000000000
--- a/xen/arch/ppc/include/asm/softirq.h
+++ /dev/null
@@ -1,8 +0,0 @@
-#ifndef __ASM_PPC_SOFTIRQ_H__
-#define __ASM_PPC_SOFTIRQ_H__
-
-#define NR_ARCH_SOFTIRQS 0
-
-#define arch_skip_send_event_check(cpu) 0
-
-#endif /* __ASM_PPC_SOFTIRQ_H__ */
diff --git a/xen/arch/arm/include/asm/softirq.h b/xen/include/asm-generic/softirq.h
similarity index 56%
rename from xen/arch/arm/include/asm/softirq.h
rename to xen/include/asm-generic/softirq.h
index 976e0ebd70..83be855e50 100644
--- a/xen/arch/arm/include/asm/softirq.h
+++ b/xen/include/asm-generic/softirq.h
@@ -1,11 +1,12 @@
-#ifndef __ASM_SOFTIRQ_H__
-#define __ASM_SOFTIRQ_H__
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_SOFTIRQ_H__
+#define __ASM_GENERIC_SOFTIRQ_H__
 
 #define NR_ARCH_SOFTIRQS       0
 
 #define arch_skip_send_event_check(cpu) 0
 
-#endif /* __ASM_SOFTIRQ_H__ */
+#endif /* __ASM_GENERIC_SOFTIRQ_H__ */
 /*
  * Local variables:
  * mode: C
-- 
2.43.0


