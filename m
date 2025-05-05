Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC2AAA9B36
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 20:11:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976207.1363425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC0H9-0006Ea-5U; Mon, 05 May 2025 18:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976207.1363425; Mon, 05 May 2025 18:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC0H8-0006CT-VW; Mon, 05 May 2025 18:10:46 +0000
Received: by outflank-mailman (input) for mailman id 976207;
 Mon, 05 May 2025 18:10:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdRb=XV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uC0H7-0005wU-7w
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 18:10:45 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 432ccb37-29dc-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 20:10:44 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so1241648766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 11:10:44 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad189146fcbsm530372366b.34.2025.05.05.11.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 11:10:43 -0700 (PDT)
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
X-Inumbo-ID: 432ccb37-29dc-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746468643; x=1747073443; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCXevhzoSlFnjdkbSHTRKfTx5Fl+QjfRaAJtPlYKQIc=;
        b=BiW9+FrgL5ejdZe/BexQjnMAn+bEJWAUjNPfnPqOUzoVxYH8JqMbofgP6pAvqQi2/e
         f2nX71IZ6HJbKnSoeeBzNALzlxnBKzz1zYttwS9kigM1PKkuAT0w/0bLoKTlQsw5pFsB
         Nn2L4aGZBOCSEf2AxSN4KPHG+f2YmYaL9NkTopaA8Rq8HfjES7Q1NEuPR6jgZgfq+XYE
         GMU1qBv8bYj0t1rIPESpTz2Y8v5cmm6BbjXAfGVuJ7NgS88ngqm1dDBVfNocPOv0E31h
         Z9UzyPSZ5XIAHY4L/EdW5SzpsEZzIfPGl02a06O6ruoQRIRx/FPWLkZ2KBz7y5Ya3FhX
         iqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746468643; x=1747073443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCXevhzoSlFnjdkbSHTRKfTx5Fl+QjfRaAJtPlYKQIc=;
        b=M8FL2KNf0Q9/ernpZ2j4GmsuI7aBSG2kYLYe5RkofCnXrBMD0CAdEkFC0scTAHefyZ
         12Z47/uk1Fb2g3yfoCvKNz+1idvOpGFq+v7vYC/p4bpqVbCNYWlHKEYmjkZ3iW2/Z2T8
         HyrfPbTAqEzGQzxJcJ5u6qZXJorO4cuYMi7blCq/P2mMbG9wlgnlvQac78M5jrC6DtTQ
         WBx1N8nv2D4ILDfxsZUsLOLASfPoRzTllYNDlt98EwIuXYz24BS6FLdoLoDjC6xYZDpd
         FCA64R8nTy9+CoXQgjPrZnEdZig39Vk0eLlyIOov4AP7loTh5T1QbGdX6rkzuWSZk+5u
         APbA==
X-Gm-Message-State: AOJu0YyD1ZK28nRXyZJCL+c7kzbbjXf1Z1AtI0hORTsvFHsJeI9Vm6Nx
	Oney/Eyl2A/0Z0YcQqYea1LptH1VbNPOBbVpQXviwiRPG0ysg5PcWythIg==
X-Gm-Gg: ASbGnctimwB7HEp2vNVwh7QxKbBB62f1pxEsCOdVA5r9YI11wM+kaQ6YGye4DaTQrX7
	oGCUoXkRfg4wKjqOUYDEdFPkkdnVOzVd7wH0KbfmVpTNhMg2vvQMvYwWbUDiKzpGDSqP0e/P7pJ
	irkx5fV39SudAIcMJGMpiylBQ6jGqYEZjdxVuJ/sOdIIdOdxTlSFHL7B6wUS9uDE4WUuMeImhPg
	UfVp50Wx8pvo1cO4eOWa9fiuRhlfnUMurNcxZawvAT0GtP6xu2jx6PSOTr4Gwc1gJ0+ioR3c8wS
	D262da7I4M7SexTlg0RvcwZLiW9a0XcBzOylk1N1ba7A2sBKV5KrmtNkbbO2ddaGlfe/ZD0Uv2g
	lC9K4XICErg==
X-Google-Smtp-Source: AGHT+IGYQHsuF93pm8ezQpHETFSM/heQ0yodhDd6lRDtiaumu5Y3ruCU0sgzkNcTCucg/KsFMIch9Q==
X-Received: by 2002:a17:907:d48f:b0:aca:c687:6ca2 with SMTP id a640c23a62f3a-ad1d459609fmr1472366b.26.1746468643304;
        Mon, 05 May 2025 11:10:43 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 4/8] arm/static-shmem.h: drop inclusion of asm/setup.h
Date: Mon,  5 May 2025 20:10:34 +0200
Message-ID: <2b126e4fde36d2a93c4a1ff6cb7266710738340a.1746468003.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746468003.git.oleksii.kurochko@gmail.com>
References: <cover.1746468003.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing is dependent from asm/setup.h in asm/static-shmem.h so inclusion of
asm/setup.h is droped.

After this drop the following compilation error related to impicit declaration
of the following functions device_tree_get_reg and map_device_irqs_to_domain,
device_tree_get_u32 occur during compilation of dom0less-build.c ( as they are
declared in asm/setup.h ).

Add inclusion of <asm/setup.h> in dt-overlay.c as it is using handle_device()
declared in <asm/setup.h>.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
------
Changes in V4:
 - Return back dropping of asm/setup.h inclusion in asm/static-shmem.h
   as it was lost during one of reabses.
---
Changes in V2-3:
 - Nothing changed. Only rebase.
---
 xen/arch/arm/dom0less-build.c           | 1 +
 xen/arch/arm/include/asm/static-shmem.h | 1 -
 xen/common/device-tree/dt-overlay.c     | 2 ++
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 18d55d90c6..7e9cedb0c8 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -20,6 +20,7 @@
 #include <asm/dom0less-build.h>
 #include <asm/domain_build.h>
 #include <asm/grant_table.h>
+#include <asm/setup.h>
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index a4f853805a..4034cec32f 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -5,7 +5,6 @@
 
 #include <xen/fdt-kernel.h>
 #include <xen/types.h>
-#include <asm/setup.h>
 
 #ifdef CONFIG_STATIC_SHM
 
diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
index 81107cb48d..d184186c01 100644
--- a/xen/common/device-tree/dt-overlay.c
+++ b/xen/common/device-tree/dt-overlay.c
@@ -13,6 +13,8 @@
 #include <xen/libfdt/libfdt.h>
 #include <xen/xmalloc.h>
 
+#include <asm/setup.h>
+
 #define DT_OVERLAY_MAX_SIZE KB(500)
 
 static LIST_HEAD(overlay_tracker);
-- 
2.49.0


