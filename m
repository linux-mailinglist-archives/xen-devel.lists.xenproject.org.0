Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 573DA87C50B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 23:16:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693515.1081718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktMy-00015Y-D7; Thu, 14 Mar 2024 22:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693515.1081718; Thu, 14 Mar 2024 22:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktMy-0000wR-25; Thu, 14 Mar 2024 22:16:12 +0000
Received: by outflank-mailman (input) for mailman id 693515;
 Thu, 14 Mar 2024 22:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y43E=KU=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rktMw-0000X2-NE
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 22:16:10 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72db41df-e250-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 23:16:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A5F1C8286CAF;
 Thu, 14 Mar 2024 17:16:01 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id tDgj889x-TCk; Thu, 14 Mar 2024 17:16:01 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id F1AAE828673E;
 Thu, 14 Mar 2024 17:16:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Ekesbb3plJdX; Thu, 14 Mar 2024 17:16:00 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 214678286CAF;
 Thu, 14 Mar 2024 17:16:00 -0500 (CDT)
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
X-Inumbo-ID: 72db41df-e250-11ee-a1ee-f123f15fe8a2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com F1AAE828673E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1710454561; bh=MDQ4qX1cZClSO+Sy5SemqANFOXF/LtmGjUBuy5sUWoI=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ViEnf6+rfF6+CQ43NWAtk16nUwQnLpNd9AHxGAbH51+3DDm96kWYULgFqvzEiAuNW
	 xMrmDMWWLbs6I/zpmaaoQH5vh6EiZgfBUYgQGI6OUOVDa11VLvih0jM/RNUAlfJmFM
	 XHUnFR9879uXfHp92MjtFv4vlayklRSQ4L+ogEy4=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 6/9] xen/common: Move Arm's bootfdt.c to common
Date: Thu, 14 Mar 2024 17:15:44 -0500
Message-Id: <908ea2d9bccf0b3455119cfd9af0597aee005fe8.1710443965.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1710443965.git.sanastasio@raptorengineering.com>
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Move Arm's bootfdt.c to xen/common so that it can be used by other
device tree architectures like PPC and RISCV.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Acked-by: Julien Grall <julien@xen.org>
---
Changes in v2:
  - Drop #if defined(CONFIG_ARM_EFI) now that efi_enabled is stubbed

 MAINTAINERS                                    | 1 +
 xen/arch/arm/Makefile                          | 1 -
 xen/common/device-tree/Makefile                | 1 +
 xen/{arch/arm => common/device-tree}/bootfdt.c | 0
 4 files changed, 2 insertions(+), 1 deletion(-)
 rename xen/{arch/arm => common/device-tree}/bootfdt.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index e85fbe6737..20fdec9ffa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -251,6 +251,7 @@ S:	Supported
 L:	xen-devel@lists.xenproject.org
 F:	docs/misc/arm/
 F:	xen/arch/arm/
+F:	xen/common/device-tree/bootfdt.c
 F:	xen/drivers/char/arm-uart.c
 F:	xen/drivers/char/cadence-uart.c
 F:	xen/drivers/char/exynos4210-uart.c
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7b1350e2ef..9e1548378c 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -10,7 +10,6 @@ obj-$(CONFIG_TEE) += tee/
 obj-$(CONFIG_HAS_VPCI) += vpci.o

 obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
-obj-y += bootfdt.init.o
 obj-y += cpuerrata.o
 obj-y += cpufeature.o
 obj-y += decode.o
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index c97b2bd88c..fa5beafd65 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1 +1,2 @@
+obj-y += bootfdt.init.o
 obj-y += bootinfo.o
diff --git a/xen/arch/arm/bootfdt.c b/xen/common/device-tree/bootfdt.c
similarity index 100%
rename from xen/arch/arm/bootfdt.c
rename to xen/common/device-tree/bootfdt.c
--
2.30.2


