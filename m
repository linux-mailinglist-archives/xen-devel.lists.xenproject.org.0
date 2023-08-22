Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1687784D24
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 01:04:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588744.920344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYaPz-0008Gs-6M; Tue, 22 Aug 2023 23:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588744.920344; Tue, 22 Aug 2023 23:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYaPz-0008Dr-3R; Tue, 22 Aug 2023 23:04:11 +0000
Received: by outflank-mailman (input) for mailman id 588744;
 Tue, 22 Aug 2023 23:04:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SWhE=EH=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qYaPx-0007yq-BI
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 23:04:09 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31de8818-4140-11ee-8782-cb3800f73035;
 Wed, 23 Aug 2023 01:04:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4DA5F8285C17;
 Tue, 22 Aug 2023 18:04:06 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id axUd1Ts1Lpmb; Tue, 22 Aug 2023 18:04:05 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DEECD82857CB;
 Tue, 22 Aug 2023 18:04:04 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 45BfNRKhIR-9; Tue, 22 Aug 2023 18:04:04 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 87B9E8285C16;
 Tue, 22 Aug 2023 18:04:04 -0500 (CDT)
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
X-Inumbo-ID: 31de8818-4140-11ee-8782-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com DEECD82857CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1692745444; bh=c/ScpJBAoqO7Ayezju79eP3M6kUnX6Q+8cbzALAb4So=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=tAWWtxIppkKKLJg92gB2sJj+nBnXFxgiljSlk/irCOIA0LFzfEk/3AunLalvHWiCl
	 REwokrq0lGKATibPs6m9FQUP7Jtck9GnMRqvGAA30ql3RTQgE6gRLYVSWcANJFG8yd
	 q+piAmgv19bFG6VjHMy+TVgkV+mF0qJGetaZAiDc=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v4 1/3] xen/ppc: Bump minimum target ISA to 3.0 (POWER9)
Date: Tue, 22 Aug 2023 18:03:50 -0500
Message-Id: <a419cece7fc01870fc75ce9b374d7ca1a38f0e67.1692744718.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1692744718.git.sanastasio@raptorengineering.com>
References: <cover.1692744718.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In preparation for implementing ISA3+ Radix MMU support, drop ISA 2.07B
from the supported ISA list to avoid having a non-working
configuration in tree. It can be re-added at a later point when Hash
MMU support is added.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
v4: no changes.
v3: no changes.
v2: no changes.

 xen/arch/ppc/Kconfig | 7 +------
 xen/arch/ppc/arch.mk | 1 -
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/xen/arch/ppc/Kconfig b/xen/arch/ppc/Kconfig
index b32dce39b8..ab116ffb2a 100644
--- a/xen/arch/ppc/Kconfig
+++ b/xen/arch/ppc/Kconfig
@@ -20,15 +20,10 @@ menu "ISA Selection"

 choice
 	prompt "Base ISA"
-	default POWER_ISA_2_07B
+	default POWER_ISA_3_00
 	help
 	  This selects the base ISA version that Xen will target.

-config POWER_ISA_2_07B
-	bool "Power ISA 2.07B (POWER8)"
-	help
-	  Target version 2.07B of the Power ISA (POWER8) or later
-
 config POWER_ISA_3_00
 	bool "Power ISA 3.00 (POWER9)"
 	help
diff --git a/xen/arch/ppc/arch.mk b/xen/arch/ppc/arch.mk
index 3bf79bac37..d05cbf1df5 100644
--- a/xen/arch/ppc/arch.mk
+++ b/xen/arch/ppc/arch.mk
@@ -1,7 +1,6 @@
 ########################################
 # Power-specific definitions

-ppc-march-$(CONFIG_POWER_ISA_2_07B) :=3D power8
 ppc-march-$(CONFIG_POWER_ISA_3_00) :=3D power9

 CFLAGS +=3D -m64 -mlittle-endian -mcpu=3D$(ppc-march-y)
--
2.30.2


