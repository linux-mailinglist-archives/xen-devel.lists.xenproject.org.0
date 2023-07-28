Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCC776786C
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jul 2023 00:22:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571598.895853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPVqL-0000Ce-P2; Fri, 28 Jul 2023 22:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571598.895853; Fri, 28 Jul 2023 22:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPVqL-00009m-LN; Fri, 28 Jul 2023 22:21:53 +0000
Received: by outflank-mailman (input) for mailman id 571598;
 Fri, 28 Jul 2023 22:21:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/sdN=DO=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qPVqK-00009S-J3
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 22:21:52 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24e42c48-2d95-11ee-8613-37d641c3527e;
 Sat, 29 Jul 2023 00:21:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 67B198284F92;
 Fri, 28 Jul 2023 17:21:48 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Vj5rpm8VOVmy; Fri, 28 Jul 2023 17:21:47 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4B64382855B2;
 Fri, 28 Jul 2023 17:21:47 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id wXQNupUkuCKH; Fri, 28 Jul 2023 17:21:47 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id BD0EE828570D;
 Fri, 28 Jul 2023 17:21:46 -0500 (CDT)
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
X-Inumbo-ID: 24e42c48-2d95-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4B64382855B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690582907; bh=Tj98bYaTHUhk/36wxSvMA59uktHE3bprxIVbR60jf48=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=mFJ/9UU6nAYsCElsXMi/2mEIMgYg7izCQYrPb/2bfigKtP6hqtapZmDTmYXGW0KUg
	 Z2tpu9dWDipHyTwx30NaX+yrUHr+AeImV7pLF/xDKt6y2KrDbc3Ajx62fwjZBy93+h
	 IdF+u4ocnBuH/fP542S/bwaKlkDxkpS+zEFyca5U=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 1/3] xen/ppc: Bump minimum target ISA to 3.0 (POWER9)
Date: Fri, 28 Jul 2023 17:21:28 -0500
Message-Id: <5504577c842e99ed16b0d3b88cac62bf61667e9c.1690582001.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1690582001.git.sanastasio@raptorengineering.com>
References: <cover.1690582001.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In preparation for implementing ISA3+ Radix MMU support, drop ISA 2.07B
from the supported ISA list to avoid having a non-working
configuration in tree. It can be re-added at a later point when Hash
MMU support is added.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/Kconfig | 7 +------
 xen/arch/ppc/arch.mk | 1 -
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/xen/arch/ppc/Kconfig b/xen/arch/ppc/Kconfig
index b32dce39b8..ab116ffb2a 100644
--- a/xen/arch/ppc/Kconfig
+++ b/xen/arch/ppc/Kconfig
@@ -20,15 +20,10 @@ menu "ISA Selection"
=20
 choice
 	prompt "Base ISA"
-	default POWER_ISA_2_07B
+	default POWER_ISA_3_00
 	help
 	  This selects the base ISA version that Xen will target.
=20
-config POWER_ISA_2_07B
-	bool "Power ISA 2.07B (POWER8)"
-	help
-	  Target version 2.07B of the Power ISA (POWER8) or later
-
 config POWER_ISA_3_00
 	bool "Power ISA 3.00 (POWER9)"
 	help
diff --git a/xen/arch/ppc/arch.mk b/xen/arch/ppc/arch.mk
index 9f66f7a57b..f48ead6580 100644
--- a/xen/arch/ppc/arch.mk
+++ b/xen/arch/ppc/arch.mk
@@ -1,7 +1,6 @@
 ########################################
 # Power-specific definitions
=20
-ppc-march-$(CONFIG_POWER_ISA_2_07B) :=3D power8
 ppc-march-$(CONFIG_POWER_ISA_3_00) :=3D power9
=20
 CFLAGS +=3D -m64 -mlittle-endian -mcpu=3D$(ppc-march-y)
--=20
2.30.2


