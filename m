Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A629FFF64
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 20:25:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864430.1275651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQom-00036Y-33; Thu, 02 Jan 2025 19:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864430.1275651; Thu, 02 Jan 2025 19:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQom-00034E-0H; Thu, 02 Jan 2025 19:25:16 +0000
Received: by outflank-mailman (input) for mailman id 864430;
 Thu, 02 Jan 2025 19:25:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xoa/=T2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tTQol-0002q0-0B
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 19:25:15 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a01602b-c93f-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 20:25:13 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so9172202f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2025 11:25:13 -0800 (PST)
Received: from andrewcoop.lan ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c6ad3e3sm40212825f8f.0.2025.01.02.11.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 11:25:10 -0800 (PST)
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
X-Inumbo-ID: 4a01602b-c93f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735845912; x=1736450712; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sf4IwgriP6BBrdUD4Z6hthsNRYM6SLFzNyUPek/Qf+o=;
        b=TB2ewHkUfsUh1a0Q720toiTxnoRyPtAU6p1DZjNSs416GDH264j6y3umA/+v+tBHr5
         XoKL5eL76bJBSYMMPbvhc6pXrmETNnZJCjQgwGc3G4yfzOEt1ZxIV3lgKfoGX1LsAw02
         tSoRIHSexUTVPMJt7OZWqA5KG38b/wiuIZljQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735845912; x=1736450712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sf4IwgriP6BBrdUD4Z6hthsNRYM6SLFzNyUPek/Qf+o=;
        b=AFu9ckD8w/trugSflzzjcftf5GLKplhJmek2vX9l+1YFA8k3BRzo8GQM78es2tH40J
         5Dbr/oN8LrSALWHDCwugK/lfCwT5cSq9NkNoudgxCF0oM/sfXE2Ud24iWfGYlf62encA
         A4LIh5N9LCEUXstj8rUo5bKeS2S9rWUWAXH3GaiHTWJHiaerlPccckrQBo+szrdZTQdU
         +jpki8HsxrqIXsoWduIuHrmxT/omHiU7zVK6twe6t74kEI/XY2xRRDhXllRfiyrkyUyi
         ozvsuuzse0vekzFtCEZGLS79dMbskrkvrrxX4szEPR/+KBb7wHnDsKk/DrUwilVybHxV
         8Lkw==
X-Gm-Message-State: AOJu0YzH6L18CwLBc194qA/aabafoeMkiEb5jcbBuSJnjqkyxGeP/YOH
	jeTKkcesLOPChwKtoW7hQcdOerKLhVm/CJ83sP6pAuZwyZS3IhaZi9Gy/GGvnTjnyDYghWdbyjZ
	csRulGQ==
X-Gm-Gg: ASbGncuqFAa6p4mfYc4LsiAg4d6QA+1ydZ7BxTvfd555Tn9PcSakfswUU6kc4EVfmPg
	N1H+E4eIrQlF5WSBrGFFGR8ManxfRa4WSlzQI/5IXPlyjuvrsQs2f7hiIw5lJ12RzVsZ/dpkmyA
	EI93pK+6FEQFXitcJ60HkA2xde0yOVkmLnUcRnHWl6YrwMFgIqizjWJXh3nWGL8otygsdy6j4O3
	pRgOZfW5DEZiv5eIjvyMGQrTf/5qzT/R4HOLOEMlXd/W4pqZTUxCZMRCKhAmotihw==
X-Google-Smtp-Source: AGHT+IHZhaE5JRGQspuEbLzfCClbF7B1+c9HuqyKBXGcb8aEPjkff/W0gZNFUTorLh2/u8rhtbfKhw==
X-Received: by 2002:a5d:598f:0:b0:385:ed20:3be6 with SMTP id ffacd0b85a97d-38a221fa7f9mr40602449f8f.22.1735845912190;
        Thu, 02 Jan 2025 11:25:12 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 1/5] xen/perfc: Drop arch_perfc_{gather,reset}()
Date: Thu,  2 Jan 2025 19:25:04 +0000
Message-Id: <20250102192508.2405687-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
References: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These were only ever used by the IA64 port, which was droped in commit
570c311ca2c7 ("remove ia64").

Remove them, and clean up the arm/x86 stub headers.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/arm/include/asm/perfc.h | 21 ---------------------
 xen/arch/x86/include/asm/perfc.h | 12 ------------
 xen/common/perfc.c               |  6 ------
 3 files changed, 39 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/perfc.h
 delete mode 100644 xen/arch/x86/include/asm/perfc.h

diff --git a/xen/arch/arm/include/asm/perfc.h b/xen/arch/arm/include/asm/perfc.h
deleted file mode 100644
index 95c4b2b6b7bf..000000000000
--- a/xen/arch/arm/include/asm/perfc.h
+++ /dev/null
@@ -1,21 +0,0 @@
-#ifndef __ASM_PERFC_H__
-#define __ASM_PERFC_H__
-
-static inline void arch_perfc_reset(void)
-{
-}
-
-static inline void arch_perfc_gather(void)
-{
-}
-
-#endif
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/x86/include/asm/perfc.h b/xen/arch/x86/include/asm/perfc.h
deleted file mode 100644
index a1a591e803a6..000000000000
--- a/xen/arch/x86/include/asm/perfc.h
+++ /dev/null
@@ -1,12 +0,0 @@
-#ifndef __ASM_PERFC_H__
-#define __ASM_PERFC_H__
-
-static inline void arch_perfc_reset(void)
-{
-}
-
-static inline void arch_perfc_gather(void)
-{
-}
-
-#endif
diff --git a/xen/common/perfc.c b/xen/common/perfc.c
index 80480aa7766d..ed4dba36f1bc 100644
--- a/xen/common/perfc.c
+++ b/xen/common/perfc.c
@@ -8,7 +8,6 @@
 #include <xen/mm.h>
 #include <xen/guest_access.h>
 #include <public/sysctl.h>
-#include <asm/perfc.h>
 
 #define PERFCOUNTER( var, name )              { name, TYPE_SINGLE, 0 },
 #define PERFCOUNTER_ARRAY( var, name, size )  { name, TYPE_ARRAY,  size },
@@ -148,8 +147,6 @@ void cf_check perfc_reset(unsigned char key)
             break;
         }
     }
-
-    arch_perfc_reset();
 }
 
 static struct xen_sysctl_perfc_desc perfc_d[NR_PERFCTRS];
@@ -199,9 +196,6 @@ static int perfc_copy_info(XEN_GUEST_HANDLE_64(xen_sysctl_perfc_desc_t) desc,
     if ( perfc_vals == NULL )
         return -ENOMEM;
 
-    /* Architecture may fill counters from hardware.  */
-    arch_perfc_gather();
-
     /* We gather the counts together every time. */
     for ( i = j = v = 0; i < NR_PERFCTRS; i++ )
     {
-- 
2.39.5


