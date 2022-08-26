Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0561A5A2800
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 14:52:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393763.632985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYoN-0004Cx-2s; Fri, 26 Aug 2022 12:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393763.632985; Fri, 26 Aug 2022 12:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYoM-00048l-Hl; Fri, 26 Aug 2022 12:51:46 +0000
Received: by outflank-mailman (input) for mailman id 393763;
 Fri, 26 Aug 2022 12:51:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z28m=Y6=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oRYoK-00013M-Th
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 12:51:44 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5e4340f-253d-11ed-9250-1f966e50362f;
 Fri, 26 Aug 2022 14:51:43 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id w19so2977774ejc.7
 for <xen-devel@lists.xenproject.org>; Fri, 26 Aug 2022 05:51:42 -0700 (PDT)
Received: from carlo-ubuntu.. (hipert-gw1.mat.unimo.it. [155.185.5.1])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b006ff0b457cdasm888812ejh.53.2022.08.26.05.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:51:42 -0700 (PDT)
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
X-Inumbo-ID: d5e4340f-253d-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=R2LVk/C6PM+sPeAhFE7BODzOKtHorLP8l5p0UCGQm08=;
        b=emY69uwkApgKgI11ZNEMUZfM+vPFPj8VxmWLvHqsCDAzj7eG5APZ7dBucJ/tr1t/j1
         lXsQgOOwIb7jfg/+lT68jTUaX9AS+t3pD6CgvC0osp6Ij7XsOydAto4TNnZAKblA/nSL
         ZmEDzGQz08dbpLSgSMd/DdpupS2amd+8elAVUE2Iv+qEUxiCYquAAYLoxb7v066zkMIU
         jl+C0ngg1198wx/o8i2Rs1B4TXYZQ2C+N29zA+U9R5Et/z6aqzeFcH4kIfKR3j4/iV8n
         8fQWFMkHpidqp0UoBwPfURfC8C/o3/SGA8d090aVtD/pbpISHGWqKGvgylnlc5ma0SfB
         9KFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=R2LVk/C6PM+sPeAhFE7BODzOKtHorLP8l5p0UCGQm08=;
        b=sZN3EE8VedAqkJh6lF+Yvc7geT2eIIAXcb9yU/DFAbfCbCCL0AwdPGhJUXhX04OSbb
         hL922qxz6HN8R11kzatm+/DYqny3ZOwPtVptbbYrRreIOeanMzuPgWgEmVkQRElCNl2X
         kRn0djCYGCe0bTSWW5DUTfQOtCljgP/ESlXBkndpVNQvqU9xyEI6w0C8IilYI5fHEtok
         huWHsr2Pva8JYfVdl7Jz6AXf8uq8J0IKsUcgU4CWaBaGbbuACmvi5aCG+fRgtiJ/B/iU
         GxA/gpUV9qJkLLc5q5oQggPU6WWqPOW8INi1KYM+iRzSSYFczu9ZnD1Wsju57DLCKX1O
         BhBg==
X-Gm-Message-State: ACgBeo0de5z8yD3LyelUcUW75Ni2eKtt/z6f2DLx7dhN0LQDsdg6msW9
	FKLvPtQPh8tNJAnip5BOwHvHZo5D6lo8aw==
X-Google-Smtp-Source: AA6agR7eTkdARncmnhdOdZxvLR4fOboOR7KBRJv/rWA3iHYAfq7JqmX+pifCMOVdeXbxFzx6X68nIw==
X-Received: by 2002:a17:906:fd8d:b0:73a:7424:6c0d with SMTP id xa13-20020a170906fd8d00b0073a74246c0dmr5478138ejb.425.1661518302466;
        Fri, 26 Aug 2022 05:51:42 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	stefano.stabellini@amd.com,
	wl@xen.org,
	marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Carlo Nonato <carlo.nonato@minervasys.tech>
Subject: [PATCH 10/12] Revert "xen/arm: Remove unused BOOT_RELOC_VIRT_START"
Date: Fri, 26 Aug 2022 14:51:09 +0200
Message-Id: <20220826125111.152261-11-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 0c18fb76323bfb13615b6f13c98767face2d8097.

Cache coloring support for Xen needs to relocate Xen code and data in a new
colored physical space. The BOOT_RELOC_VIRT_START will be used as the virtual
base address for a temporary mapping to this new space.
---
 xen/arch/arm/include/asm/config.h | 4 +++-
 xen/arch/arm/mm.c                 | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 2fafb9f228..c8c1095d70 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -77,7 +77,8 @@
  *   2M -   4M   Xen text, data, bss
  *   4M -   6M   Fixmap: special-purpose 4K mapping slots
  *   6M -  10M   Early boot mapping of FDT
- *   10M - 12M   Livepatch vmap (if compiled in)
+ *   10M - 12M   Early relocation address (used when relocating Xen)
+ *               and later for livepatch vmap (if compiled in)
  *
  * ARM32 layout:
  *   0  -  12M   <COMMON>
@@ -113,6 +114,7 @@
 #define BOOT_FDT_VIRT_START    _AT(vaddr_t,0x00600000)
 #define BOOT_FDT_VIRT_SIZE     _AT(vaddr_t, MB(4))
 
+#define BOOT_RELOC_VIRT_START  _AT(vaddr_t,0x00a00000)
 #ifdef CONFIG_LIVEPATCH
 #define LIVEPATCH_VMAP_START   _AT(vaddr_t,0x00a00000)
 #define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 1afa02b4af..efc0dd75d1 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -154,6 +154,7 @@ static void __init __maybe_unused build_assertions(void)
     /* 2MB aligned regions */
     BUILD_BUG_ON(XEN_VIRT_START & ~SECOND_MASK);
     BUILD_BUG_ON(FIXMAP_ADDR(0) & ~SECOND_MASK);
+    BUILD_BUG_ON(BOOT_RELOC_VIRT_START & ~SECOND_MASK);
     /* 1GB aligned regions */
 #ifdef CONFIG_ARM_32
     BUILD_BUG_ON(XENHEAP_VIRT_START & ~FIRST_MASK);
-- 
2.34.1


