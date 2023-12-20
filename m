Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D75581A0C1
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 15:09:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657920.1027074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFj-0006iv-BC; Wed, 20 Dec 2023 14:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657920.1027074; Wed, 20 Dec 2023 14:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFj-0006d5-4d; Wed, 20 Dec 2023 14:08:51 +0000
Received: by outflank-mailman (input) for mailman id 657920;
 Wed, 20 Dec 2023 14:08:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RD2L=H7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFxFh-0005qp-8c
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 14:08:49 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bb7eba4-9f41-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 15:08:48 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cc6121c113so50310991fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 06:08:48 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d19-20020a05651c089300b002cc83c337absm593892ljq.70.2023.12.20.06.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 06:08:46 -0800 (PST)
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
X-Inumbo-ID: 4bb7eba4-9f41-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703081327; x=1703686127; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbK8RQwLkr5f4USBRDmd1xzxpVRjYgivBsP0FHFB0fg=;
        b=nWbY9DkvwqpG5l7wXsuSQsrBotdH5Yar+qafXcFzCrxF26zPR39fN8Bqwxdcn8qXwa
         hyELEEXI6U7OU7vJ2UoZDgtwjmmsicMmdCYpXc/iJSD+AtF0h6GeaI1Lq2KjcNX2vTHR
         azfjYlWWgNhQpndW8CkNDNcWE9lf1SfPCra70rNhEociz5fZV/sp9pt/iBZWZMs+KGwW
         BDyIuKGJrFvWUaVks0nSIrhpx5PaTkEFeaY7jaBQCa2tLKZnsXdL39U24GqQko2FVK8L
         1ZCmYpBxxn6l8R8ePnSLFJhWIA9/n5jBGzJpymg76ZpFhjsu7Y1dHPCiv14NIqnU2TFI
         uHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703081327; x=1703686127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbK8RQwLkr5f4USBRDmd1xzxpVRjYgivBsP0FHFB0fg=;
        b=ck0CjXdt2gWnJInud+5tzLdhRrSdp5q/sjROpfC4LCIydM6OyiXMC1V2MNzNslqBeI
         ahBbsdriwkylaaXG0O2vliLyl/+FJ+7a8I4xvrSSykXWiolKE0aiTHC24aLpLJO8ds1R
         biiq7JpgyVeizv6OpuFixKEwSF594EksT8LI75hfNLd1ML6mGZr1cUCwNWNIk+zG4sdo
         H3B5RPSJ/7hQIgbmPUY1T4ahtFqxB6vPtMkl9YIflm1aOwMK5HlNuXoh1Np+T0j1EW/P
         ZE4c/tWKFtWGQkR0W8FQghPYvKzLBhQxcc7GbifqraeWUea4nNnNq+hi1U02xFDVswTQ
         pZEg==
X-Gm-Message-State: AOJu0YzmYTiV3j/3gr04mrmV6ZHBymU69/PKDgDuHTv+McOllt39wZvF
	jfYZ/2e5+aVqGgAVe+iP9uK0iYi0ylU1HQ==
X-Google-Smtp-Source: AGHT+IHn1sfQ+dcmY3UMrZ9dsWrwzOLfkaxkBYOm7UbBVwyle+g/qca4wQn1PTi/h6E6hrMBm0WmfA==
X-Received: by 2002:a2e:90cd:0:b0:2cc:8b70:9082 with SMTP id o13-20020a2e90cd000000b002cc8b709082mr396636ljg.136.1703081327521;
        Wed, 20 Dec 2023 06:08:47 -0800 (PST)
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
Subject: [PATCH v6 7/9] xen: ifdef inclusion of <asm/grant_table.h> in <xen/grant_table.h>
Date: Wed, 20 Dec 2023 16:08:29 +0200
Message-ID: <e49bae656ed6c0fe689703f78df4e815b955f5b2.1703072575.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703072575.git.oleksii.kurochko@gmail.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ifdef-ing inclusion of <asm/grant_table.h> allows to avoid
generation of empty <asm/grant_table.h> for cases when
CONFIG_GRANT_TABLE is not enabled.

The following changes were done for Arm:
<asm/grant_table.h> should be included directly because it contains
gnttab_dom0_frames() macros which is unique for Arm and is used in
arch/arm/domain_build.c.
<asm/grant_table.h> is #ifdef-ed with CONFIG_GRANT_TABLE in
<xen/grant_table.h> so in case of !CONFIG_GRANT_TABLE gnttab_dom0_frames
won't be available for use in arch/arm/domain_build.c.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - Remove the way how CONFIG_GRANT_TABLE is disabled for PPC and RISC-V.
---
Changes in V5:
 - Added dependencies for "Config GRANT_TABLE" to be sure that randconfig will not
   turn on the config.
---
Changes in V4:
 - Nothing changed. Only rebase.
---
Changes in V3:
 - Remove unnecessary comment.
---
 xen/arch/arm/domain_build.c            | 1 +
 xen/arch/ppc/include/asm/grant_table.h | 5 -----
 xen/include/xen/grant_table.h          | 3 +++
 3 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/grant_table.h

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6945b9755d..46161848dc 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -36,6 +36,7 @@
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
+#include <asm/grant_table.h>
 #include <xen/serial.h>
 
 static unsigned int __initdata opt_dom0_max_vcpus;
diff --git a/xen/arch/ppc/include/asm/grant_table.h b/xen/arch/ppc/include/asm/grant_table.h
deleted file mode 100644
index d0ff58dd3d..0000000000
--- a/xen/arch/ppc/include/asm/grant_table.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_GRANT_TABLE_H__
-#define __ASM_PPC_GRANT_TABLE_H__
-
-#endif /* __ASM_PPC_GRANT_TABLE_H__ */
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 85fe6b7b5e..50edfecfb6 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -26,7 +26,10 @@
 #include <xen/mm-frame.h>
 #include <xen/rwlock.h>
 #include <public/grant_table.h>
+
+#ifdef CONFIG_GRANT_TABLE
 #include <asm/grant_table.h>
+#endif
 
 struct grant_table;
 
-- 
2.43.0


