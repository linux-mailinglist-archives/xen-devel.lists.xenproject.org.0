Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD4274459C
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 02:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557676.871310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFOWr-0002Fl-P4; Sat, 01 Jul 2023 00:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557676.871310; Sat, 01 Jul 2023 00:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFOWr-000285-Iz; Sat, 01 Jul 2023 00:31:57 +0000
Received: by outflank-mailman (input) for mailman id 557676;
 Sat, 01 Jul 2023 00:31:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypVN=CT=gmail.com=christopher.w.clark.io@srs-se1.protection.inumbo.net>)
 id 1qFOWp-0007yM-98
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 00:31:55 +0000
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [2607:f8b0:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acfe17ca-17a6-11ee-8611-37d641c3527e;
 Sat, 01 Jul 2023 02:31:53 +0200 (CEST)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6b886456f66so1790531a34.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jun 2023 17:31:53 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83]) by smtp.gmail.com with ESMTPSA id
 s68-20020a632c47000000b0055b61cd99a1sm1824296pgs.81.2023.06.30.17.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 17:31:51 -0700 (PDT)
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
X-Inumbo-ID: acfe17ca-17a6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688171512; x=1690763512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eobWsLudL6LP1s0XBewioDQ6KL/Td7X9osJXVUd2EmM=;
        b=pf3RZgrNX5scU+U3lhARSed2bh0CIo65idYmRx10QaH4gLLS1AJULsKiycGFXhiGfl
         NR2ogZiVsBDBGt3Al4XEWq65oaE/xBuon/T1vnxmR1vInlsO18XF1426wwxJRTyvC6vt
         wdE3IMbxClp05AKOlX+gLsnb7A713aLkJC9XmSVGbvXPTKXgerTwQunxPbT1rPpQ4uCI
         gf5iY0TjNrztpZ2Z0uATKtn9OOm+nvGbf4bF3r6a5aBLAt/a5plRrriYkQFO/Lyde2aE
         gEdgnFYryrGJuCLoDhzliHOQOeL0lt21t2AgiOHS1B7cc3hcZwsTWCzhTtZCG2RfXYba
         P8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688171512; x=1690763512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eobWsLudL6LP1s0XBewioDQ6KL/Td7X9osJXVUd2EmM=;
        b=cnwYgqDUuvFUBdbso+NhkQZ516fNARucsuZOJ0WsjMgo7Vqk7iRpS0cmbM4Uf3pA0i
         mvb9RN/zhVRFk42VRtvaF7MbjigCPBW4gTh1wx2Zx5z2n/AdTLfHfsx/yCPwymWsVTUa
         VfKmHj80saEV7tpnap13Y5XkXHc8Q8sf+fZAdGilCExZdhZ0m3cdBcJHuxn/axxTxecP
         JUQr5ziFy7EazWIdB3t4XSm8jltBv6qWGMBu4QyOnrL9KoRoGkQSYl6pys9WB6GVt0bQ
         Q6/zA7lRCrm6qbOcA4odpWyTDa3DKmNFw1f4Y+lL2vjEXDX5ujSfxNFDMZD3lTy6oa4E
         9Cjg==
X-Gm-Message-State: AC+VfDzYMHzhSPSSU1lM/6yIC8UtTGVGKRhpSwJ5QuJRwgv27aACBusr
	AhG7AgGHresco+B6e/kXXhFchdZA9/c=
X-Google-Smtp-Source: ACHHUZ4Aj8NvkVJllvxkQKfVm9FJZ4c/6HPUItf+wawkjEKnebTGZb1aBVz7wrUVpJI/QgyMqF2BdQ==
X-Received: by 2002:a05:6830:1104:b0:6b8:7db6:9ab5 with SMTP id w4-20020a056830110400b006b87db69ab5mr4305120otq.12.1688171512057;
        Fri, 30 Jun 2023 17:31:52 -0700 (PDT)
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
Subject: [PATCH 10/11] arm setup: include <xen/bootinfo> for bootmod defns, replacing enum
Date: Fri, 30 Jun 2023 17:31:31 -0700
Message-Id: <20230701003132.2210306-11-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230701003132.2210306-1-christopher.w.clark@gmail.com>
References: <20230701003132.2210306-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change enables and begins introducion of <xen/bootinfo.h> into
Arm builds: it replace the enum definition of bootmodule_kind with
bootmod_type_t which is a fixed size type as needed for packed structs,
to be used in the boot structures in subsequent changes.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

New for v2 series.
---
 xen/arch/arm/include/asm/setup.h | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 38e2ce255f..ce3882ca67 100644
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


