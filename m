Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B61F7447A4
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 09:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557779.871470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFUsp-0008OB-Qu; Sat, 01 Jul 2023 07:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557779.871470; Sat, 01 Jul 2023 07:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFUsp-0008CO-Br; Sat, 01 Jul 2023 07:19:03 +0000
Received: by outflank-mailman (input) for mailman id 557779;
 Sat, 01 Jul 2023 07:19:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypVN=CT=gmail.com=christopher.w.clark.io@srs-se1.protection.inumbo.net>)
 id 1qFUsn-00074A-Me
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 07:19:01 +0000
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [2607:f8b0:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cedc5e3-17df-11ee-b237-6b7b168915f2;
 Sat, 01 Jul 2023 09:19:01 +0200 (CEST)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3a37909a64eso1780698b6e.1
 for <xen-devel@lists.xenproject.org>; Sat, 01 Jul 2023 00:19:01 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83]) by smtp.gmail.com with ESMTPSA id
 s19-20020aa78d53000000b00673e652985bsm4108866pfe.118.2023.07.01.00.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 00:18:58 -0700 (PDT)
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
X-Inumbo-ID: 8cedc5e3-17df-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688195939; x=1690787939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNpBclJ1QG7nOEKI0nkpyN963wBmUeNZP6vxgwU4hxE=;
        b=kkt/3rzfOezqwdUdfeP22+AXirxs+V7vl98qrWv4iiVvJsilE8IFJzXmBmEaX/PLUX
         lw/OLqRFNRDap66MC+0gdgpB/Ap2zXzSIBFEE0S+1g7Z5yE5mqysVH6CJTGwGKVvXCEv
         pcetQV5sppLEG8Tn/5o/JgQm7GVCRfWToQacCEtPstUhrfKSmOFvUkrebntKu44THLG8
         GKi4rtOS+2hjrykz+X62a0+lZXAHzKPErnP1WmR5Zqpb7YJXCLmeOTih25cPXCfWOUld
         15dFSnZ0YQrnqdx+nDhNAzqzmzceDG1UJXNK8uM7Q1G+2GSsRsRJ0BnjJL3igJL1Bmyt
         JXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688195939; x=1690787939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RNpBclJ1QG7nOEKI0nkpyN963wBmUeNZP6vxgwU4hxE=;
        b=Vcml0c+Zwcyn1Hi3mZSxVUMiBbYKgXnlUcBF9h/Xj4YKuu4icXyQ9ZYH1VkBgVfANS
         D/xWXb03YoHyxtjEOH5z/1ABssV/LoOjG2nv0OAu41FcNMJmaLpa7EpqkUMUEjb45M6l
         oRqAD0ykz0nLNTCsAA3myN0Xw3IaH048xolTpPEbM27loL/7MUHA8nSGh+aKhxpFm+PR
         2p1ag9q3J3ztQ3A2fpqzracsVipprANFhT7g3YufW7/UeTMWUXo/+kY9ua6ZVvmlw1Sg
         uCAuBJBRIkFl67d1XU+larkq7Zl4Nj2jnTyBWjh1I7Q1OAYMvgz4tmiY41AY4THypHpx
         LdKA==
X-Gm-Message-State: AC+VfDznT4f16VH4NUrHOLSDSuy1UOU+Isd5cxug6CT9p7hw7iqjKnW2
	S/el3BxJ77RRlSDhXmy06bXi+jBQpg0=
X-Google-Smtp-Source: ACHHUZ5bYgzOgosZ6acapmMuq/fA7HvOVTh6FdoBs81Xwt7bcxLG96FryDU7aohNQTBeWJXvKMyaTg==
X-Received: by 2002:a05:6808:140d:b0:3a1:aef1:bbf3 with SMTP id w13-20020a056808140d00b003a1aef1bbf3mr5761717oiv.23.1688195939678;
        Sat, 01 Jul 2023 00:18:59 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
	stefano.stabellini@amd.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rich Persaud <persaur@gmail.com>
Subject: [PATCH 09/10] arm setup: use common integer-typed bootmod definition
Date: Sat,  1 Jul 2023 00:18:34 -0700
Message-Id: <20230701071835.41599-10-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230701071835.41599-1-christopher.w.clark@gmail.com>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change enables inclusion of <xen/bootinfo.h> in Arm builds,
required for subsequent patches in this series.

It replaces the enum definition of bootmodule_kind with bootmod_type_t
as enums are not fixed size as needed for packed structs which are
needed for boot structures in subsequent changes.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

---
New for v2 series.

 xen/arch/arm/include/asm/setup.h | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 19dc637d55..7e0598217a 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -3,6 +3,7 @@
 
 #include <public/version.h>
 #include <asm/p2m.h>
+#include <xen/bootinfo.h>
 #include <xen/device_tree.h>
 
 #define MIN_FDT_ALIGN 8
@@ -12,15 +13,7 @@
 
 #define MAX_MODULES 32 /* Current maximum useful modules */
 
-typedef enum {
-    BOOTMOD_XEN,
-    BOOTMOD_FDT,
-    BOOTMOD_KERNEL,
-    BOOTMOD_RAMDISK,
-    BOOTMOD_XSM,
-    BOOTMOD_GUEST_DTB,
-    BOOTMOD_UNKNOWN
-}  bootmodule_kind;
+typedef bootmod_type_t bootmodule_kind;
 
 enum membank_type {
     /*
-- 
2.25.1


