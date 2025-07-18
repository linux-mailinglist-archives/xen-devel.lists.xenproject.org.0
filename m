Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF4AB0A7FF
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 17:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048950.1419173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucnQV-0001NQ-M0; Fri, 18 Jul 2025 15:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048950.1419173; Fri, 18 Jul 2025 15:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucnQV-0001I7-FU; Fri, 18 Jul 2025 15:55:11 +0000
Received: by outflank-mailman (input) for mailman id 1048950;
 Fri, 18 Jul 2025 15:55:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ucnQT-0000nc-KT
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 15:55:09 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94a451d7-63ef-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 17:55:09 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-455b00283a5so13835185e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 08:55:09 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca48719sm2276468f8f.47.2025.07.18.08.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 08:55:07 -0700 (PDT)
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
X-Inumbo-ID: 94a451d7-63ef-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752854108; x=1753458908; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUHG8rHge1pLJZYmLKq3jyE9wTiUp6t+m2EPk7D4AkQ=;
        b=FkVwhAYVl6hZjLyvWPZ1Zm41SMRSx7+vuxwPTCU+TmyR5i9CCHdSsGin+ZghFadaYn
         9cOstTMqKpJ/plrREx0scnGGDQI43DyrAS1EwQbPslztS19wT0wjOtpcRJYRv6Gg3NxP
         8avqPIN/KaYoDJt5sY7qkgK7FDXe8AdWHfTs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752854108; x=1753458908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUHG8rHge1pLJZYmLKq3jyE9wTiUp6t+m2EPk7D4AkQ=;
        b=p9yP+F30NUe7QzVH7hDbu0eFszSdKHBzclDJLFn9RedzBCVX+ikgBieZNGjw3IBsXn
         CIhH1kZJY5bHB1/rlDT0+7aRNGt0svxwt2+oz/mjtfzVBptBOMnZn+n6k1ouNt0iFZBM
         m8intfsJix3A0JQkDXkNynusB4XDdW/QtSZBI9EDsE08g0KEKXSgeAAoocYm3fHYKKGc
         uf5o622WxVi7pMrITknfTIvWConcRfUaMLgsoFmMMWT3R/vsXLe6a4IE7ifmnVNt9+2w
         RjRLtS6gAg/znSQp1ihrSi5nD0PAQ7DsRXQyCXl/qldOpA27WCuZWbWWEOoaiCZZfd33
         Lvng==
X-Gm-Message-State: AOJu0Yxqb1ue+Nnq/HlBC4zxGE6NIe3puojVBz/hCbiFkfQyw9TSg/4Z
	Gel8hMpIObpMzZRcsivoX642hDg84zO+HGqj06zGX7xpWRJNxeptPsGBxsEUhEdETafTDoaMwFm
	2CJAsuVYN1w==
X-Gm-Gg: ASbGncv66f8oWjSMsnbe1hf/Yg4Gmx/IPozwPVkWaipERagF0xN7cZGGRLtU3jgc/Dx
	dLDC5ckAzWtBS41StmxY++A1nHJGg7WvmhlGV3crsw8vw7fmv4+0EFXchYguCDxNZZviLRe8IDJ
	tg1M7y4gP6YPUqcehVlXkPFv6vbY3F4clYtPKe7xckoWmbhzn8sbMw0PzpXRONzDkaRYxB8tBrr
	d9mBPgTS8JYCNGTy8POltFc49jKMsj2MlEqx0qwTvifaXo5nxiZ6FtTJeEiK7h03HA1OlCblgYx
	GnixyWrdLI2Sp6GZOnm/sMdnT6KNJ52EIyzKQM/pqJqTjUYlbKHtuQVOJzCuHu/ewj3bJZ5QbCp
	+T4aV2xu/jpqAdMPZeqDDxt5lJEG6ErMWHYcDp5oJpy5BsSucPuYyu8R5McG1ekOZAXf/Nhy+Pu
	aX
X-Google-Smtp-Source: AGHT+IERJHN/pK7JjLfjCpHMfBlOKPWXTM0vWJjoywbQPHxbTHcugti19QVoGwy+1NdntIMKkQ4bVg==
X-Received: by 2002:a05:600c:4510:b0:453:7713:546a with SMTP id 5b1f17b1804b1-4563d4adbe7mr29363455e9.14.1752854108349;
        Fri, 18 Jul 2025 08:55:08 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/4] x86/intel-family: Resync with Linux
Date: Fri, 18 Jul 2025 16:55:02 +0100
Message-Id: <20250718155502.2610047-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250718155502.2610047-1-andrew.cooper3@citrix.com>
References: <20250718155502.2610047-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This snapshot is Linux commit db4001f9cc32 ("x86/cpu/vfm: Delete all
the *_FAM6_ CPU #defines"), now that Xen has switched off the old constant
names.

Leave a comment identifying the exact revision Xen is using.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

INTEL_FAM5_QUARK_X1000 ought to have been deleted in this commit in Linux.  It
has been removed since.
---
 xen/arch/x86/include/asm/intel-family.h | 90 ++-----------------------
 1 file changed, 7 insertions(+), 83 deletions(-)

diff --git a/xen/arch/x86/include/asm/intel-family.h b/xen/arch/x86/include/asm/intel-family.h
index 5858e7398570..d8c0bcc406de 100644
--- a/xen/arch/x86/include/asm/intel-family.h
+++ b/xen/arch/x86/include/asm/intel-family.h
@@ -1,4 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Snapshot from Linux:
+ *   db4001f9cc32e3ef105a4e4f492d7d813b28292a
+ *   x86/cpu/vfm: Delete all the *_FAM6_ CPU #defines
+ */
 #ifndef _ASM_X86_INTEL_FAMILY_H
 #define _ASM_X86_INTEL_FAMILY_H
 
@@ -10,7 +15,7 @@
  * that group keep the CPUID for the variants sorted by model number.
  *
  * The defined symbol names have the following form:
- *	INTEL_FAM6{OPTFAMILY}_{MICROARCH}{OPTDIFF}
+ *	INTEL_{OPTFAMILY}_{MICROARCH}{OPTDIFF}
  * where:
  * OPTFAMILY	Describes the family of CPUs that this belongs to. Default
  *		is assumed to be "_CORE" (and should be omitted). Other values
@@ -42,217 +47,136 @@
 
 #define IFM(_fam, _model)	VFM_MAKE(X86_VENDOR_INTEL, _fam, _model)
 
-/* Wildcard match for FAM6 so X86_MATCH_INTEL_FAM6_MODEL(ANY) works */
-#define INTEL_FAM6_ANY			X86_MODEL_ANY
-/* Wildcard match for FAM6 so X86_MATCH_VFM(ANY) works */
+/* Wildcard match so X86_MATCH_VFM(ANY) works */
 #define INTEL_ANY			IFM(X86_FAMILY_ANY, X86_MODEL_ANY)
 
 #define INTEL_PENTIUM_PRO		IFM(6, 0x01)
 
-#define INTEL_FAM6_CORE_YONAH		0x0E
 #define INTEL_CORE_YONAH		IFM(6, 0x0E)
 
-#define INTEL_FAM6_CORE2_MEROM		0x0F
 #define INTEL_CORE2_MEROM		IFM(6, 0x0F)
-#define INTEL_FAM6_CORE2_MEROM_L	0x16
 #define INTEL_CORE2_MEROM_L		IFM(6, 0x16)
-#define INTEL_FAM6_CORE2_PENRYN		0x17
 #define INTEL_CORE2_PENRYN		IFM(6, 0x17)
-#define INTEL_FAM6_CORE2_DUNNINGTON	0x1D
 #define INTEL_CORE2_DUNNINGTON		IFM(6, 0x1D)
 
-#define INTEL_FAM6_NEHALEM		0x1E
 #define INTEL_NEHALEM			IFM(6, 0x1E)
-#define INTEL_FAM6_NEHALEM_G		0x1F /* Auburndale / Havendale */
 #define INTEL_NEHALEM_G			IFM(6, 0x1F) /* Auburndale / Havendale */
-#define INTEL_FAM6_NEHALEM_EP		0x1A
 #define INTEL_NEHALEM_EP		IFM(6, 0x1A)
-#define INTEL_FAM6_NEHALEM_EX		0x2E
 #define INTEL_NEHALEM_EX		IFM(6, 0x2E)
 
-#define INTEL_FAM6_WESTMERE		0x25
 #define INTEL_WESTMERE			IFM(6, 0x25)
-#define INTEL_FAM6_WESTMERE_EP		0x2C
 #define INTEL_WESTMERE_EP		IFM(6, 0x2C)
-#define INTEL_FAM6_WESTMERE_EX		0x2F
 #define INTEL_WESTMERE_EX		IFM(6, 0x2F)
 
-#define INTEL_FAM6_SANDYBRIDGE		0x2A
 #define INTEL_SANDYBRIDGE		IFM(6, 0x2A)
-#define INTEL_FAM6_SANDYBRIDGE_X	0x2D
 #define INTEL_SANDYBRIDGE_X		IFM(6, 0x2D)
-#define INTEL_FAM6_IVYBRIDGE		0x3A
 #define INTEL_IVYBRIDGE			IFM(6, 0x3A)
-#define INTEL_FAM6_IVYBRIDGE_X		0x3E
 #define INTEL_IVYBRIDGE_X		IFM(6, 0x3E)
 
-#define INTEL_FAM6_HASWELL		0x3C
 #define INTEL_HASWELL			IFM(6, 0x3C)
-#define INTEL_FAM6_HASWELL_X		0x3F
 #define INTEL_HASWELL_X			IFM(6, 0x3F)
-#define INTEL_FAM6_HASWELL_L		0x45
 #define INTEL_HASWELL_L			IFM(6, 0x45)
-#define INTEL_FAM6_HASWELL_G		0x46
 #define INTEL_HASWELL_G			IFM(6, 0x46)
 
-#define INTEL_FAM6_BROADWELL		0x3D
 #define INTEL_BROADWELL			IFM(6, 0x3D)
-#define INTEL_FAM6_BROADWELL_G		0x47
 #define INTEL_BROADWELL_G		IFM(6, 0x47)
-#define INTEL_FAM6_BROADWELL_X		0x4F
 #define INTEL_BROADWELL_X		IFM(6, 0x4F)
-#define INTEL_FAM6_BROADWELL_D		0x56
 #define INTEL_BROADWELL_D		IFM(6, 0x56)
 
-#define INTEL_FAM6_SKYLAKE_L		0x4E	/* Sky Lake             */
 #define INTEL_SKYLAKE_L			IFM(6, 0x4E) /* Sky Lake */
-#define INTEL_FAM6_SKYLAKE		0x5E	/* Sky Lake             */
 #define INTEL_SKYLAKE			IFM(6, 0x5E) /* Sky Lake */
-#define INTEL_FAM6_SKYLAKE_X		0x55	/* Sky Lake             */
 #define INTEL_SKYLAKE_X			IFM(6, 0x55) /* Sky Lake */
 /*                 CASCADELAKE_X	0x55	   Sky Lake -- s: 7     */
 /*                 COOPERLAKE_X		0x55	   Sky Lake -- s: 11    */
 
-#define INTEL_FAM6_KABYLAKE_L		0x8E	/* Sky Lake             */
 #define INTEL_KABYLAKE_L		IFM(6, 0x8E) /* Sky Lake */
 /*                 AMBERLAKE_L		0x8E	   Sky Lake -- s: 9     */
 /*                 COFFEELAKE_L		0x8E	   Sky Lake -- s: 10    */
 /*                 WHISKEYLAKE_L	0x8E       Sky Lake -- s: 11,12 */
 
-#define INTEL_FAM6_KABYLAKE		0x9E	/* Sky Lake             */
 #define INTEL_KABYLAKE			IFM(6, 0x9E) /* Sky Lake */
 /*                 COFFEELAKE		0x9E	   Sky Lake -- s: 10-13 */
 
-#define INTEL_FAM6_COMETLAKE		0xA5	/* Sky Lake             */
 #define INTEL_COMETLAKE			IFM(6, 0xA5) /* Sky Lake */
-#define INTEL_FAM6_COMETLAKE_L		0xA6	/* Sky Lake             */
 #define INTEL_COMETLAKE_L		IFM(6, 0xA6) /* Sky Lake */
 
-#define INTEL_FAM6_CANNONLAKE_L		0x66	/* Palm Cove */
 #define INTEL_CANNONLAKE_L		IFM(6, 0x66) /* Palm Cove */
 
-#define INTEL_FAM6_ICELAKE_X		0x6A	/* Sunny Cove */
 #define INTEL_ICELAKE_X			IFM(6, 0x6A) /* Sunny Cove */
-#define INTEL_FAM6_ICELAKE_D		0x6C	/* Sunny Cove */
 #define INTEL_ICELAKE_D			IFM(6, 0x6C) /* Sunny Cove */
-#define INTEL_FAM6_ICELAKE		0x7D	/* Sunny Cove */
 #define INTEL_ICELAKE			IFM(6, 0x7D) /* Sunny Cove */
-#define INTEL_FAM6_ICELAKE_L		0x7E	/* Sunny Cove */
 #define INTEL_ICELAKE_L			IFM(6, 0x7E) /* Sunny Cove */
-#define INTEL_FAM6_ICELAKE_NNPI		0x9D	/* Sunny Cove */
 #define INTEL_ICELAKE_NNPI		IFM(6, 0x9D) /* Sunny Cove */
 
-#define INTEL_FAM6_ROCKETLAKE		0xA7	/* Cypress Cove */
 #define INTEL_ROCKETLAKE		IFM(6, 0xA7) /* Cypress Cove */
 
-#define INTEL_FAM6_TIGERLAKE_L		0x8C	/* Willow Cove */
 #define INTEL_TIGERLAKE_L		IFM(6, 0x8C) /* Willow Cove */
-#define INTEL_FAM6_TIGERLAKE		0x8D	/* Willow Cove */
 #define INTEL_TIGERLAKE			IFM(6, 0x8D) /* Willow Cove */
 
-#define INTEL_FAM6_SAPPHIRERAPIDS_X	0x8F	/* Golden Cove */
 #define INTEL_SAPPHIRERAPIDS_X		IFM(6, 0x8F) /* Golden Cove */
 
-#define INTEL_FAM6_EMERALDRAPIDS_X	0xCF
 #define INTEL_EMERALDRAPIDS_X		IFM(6, 0xCF)
 
-#define INTEL_FAM6_GRANITERAPIDS_X	0xAD
 #define INTEL_GRANITERAPIDS_X		IFM(6, 0xAD)
-#define INTEL_FAM6_GRANITERAPIDS_D	0xAE
 #define INTEL_GRANITERAPIDS_D		IFM(6, 0xAE)
 
 /* "Hybrid" Processors (P-Core/E-Core) */
 
-#define INTEL_FAM6_LAKEFIELD		0x8A	/* Sunny Cove / Tremont */
 #define INTEL_LAKEFIELD			IFM(6, 0x8A) /* Sunny Cove / Tremont */
 
-#define INTEL_FAM6_ALDERLAKE		0x97	/* Golden Cove / Gracemont */
 #define INTEL_ALDERLAKE			IFM(6, 0x97) /* Golden Cove / Gracemont */
-#define INTEL_FAM6_ALDERLAKE_L		0x9A	/* Golden Cove / Gracemont */
 #define INTEL_ALDERLAKE_L		IFM(6, 0x9A) /* Golden Cove / Gracemont */
 
-#define INTEL_FAM6_RAPTORLAKE		0xB7	/* Raptor Cove / Enhanced Gracemont */
 #define INTEL_RAPTORLAKE		IFM(6, 0xB7) /* Raptor Cove / Enhanced Gracemont */
-#define INTEL_FAM6_RAPTORLAKE_P		0xBA
 #define INTEL_RAPTORLAKE_P		IFM(6, 0xBA)
-#define INTEL_FAM6_RAPTORLAKE_S		0xBF
 #define INTEL_RAPTORLAKE_S		IFM(6, 0xBF)
 
-#define INTEL_FAM6_METEORLAKE		0xAC
 #define INTEL_METEORLAKE		IFM(6, 0xAC)
-#define INTEL_FAM6_METEORLAKE_L		0xAA
 #define INTEL_METEORLAKE_L		IFM(6, 0xAA)
 
-#define INTEL_FAM6_ARROWLAKE_H		0xC5
 #define INTEL_ARROWLAKE_H		IFM(6, 0xC5)
-#define INTEL_FAM6_ARROWLAKE		0xC6
 #define INTEL_ARROWLAKE			IFM(6, 0xC6)
-#define INTEL_FAM6_ARROWLAKE_U		0xB5
 #define INTEL_ARROWLAKE_U		IFM(6, 0xB5)
 
-#define INTEL_FAM6_LUNARLAKE_M		0xBD
 #define INTEL_LUNARLAKE_M		IFM(6, 0xBD)
 
 /* "Small Core" Processors (Atom/E-Core) */
 
-#define INTEL_FAM6_ATOM_BONNELL		0x1C /* Diamondville, Pineview */
 #define INTEL_ATOM_BONNELL		IFM(6, 0x1C) /* Diamondville, Pineview */
-#define INTEL_FAM6_ATOM_BONNELL_MID	0x26 /* Silverthorne, Lincroft */
 #define INTEL_ATOM_BONNELL_MID		IFM(6, 0x26) /* Silverthorne, Lincroft */
 
-#define INTEL_FAM6_ATOM_SALTWELL	0x36 /* Cedarview */
 #define INTEL_ATOM_SALTWELL		IFM(6, 0x36) /* Cedarview */
-#define INTEL_FAM6_ATOM_SALTWELL_MID	0x27 /* Penwell */
 #define INTEL_ATOM_SALTWELL_MID		IFM(6, 0x27) /* Penwell */
-#define INTEL_FAM6_ATOM_SALTWELL_TABLET	0x35 /* Cloverview */
 #define INTEL_ATOM_SALTWELL_TABLET	IFM(6, 0x35) /* Cloverview */
 
-#define INTEL_FAM6_ATOM_SILVERMONT	0x37 /* Bay Trail, Valleyview */
 #define INTEL_ATOM_SILVERMONT		IFM(6, 0x37) /* Bay Trail, Valleyview */
-#define INTEL_FAM6_ATOM_SILVERMONT_D	0x4D /* Avaton, Rangely */
 #define INTEL_ATOM_SILVERMONT_D		IFM(6, 0x4D) /* Avaton, Rangely */
-#define INTEL_FAM6_ATOM_SILVERMONT_MID	0x4A /* Merriefield */
 #define INTEL_ATOM_SILVERMONT_MID	IFM(6, 0x4A) /* Merriefield */
 
-#define INTEL_FAM6_ATOM_AIRMONT		0x4C /* Cherry Trail, Braswell */
 #define INTEL_ATOM_AIRMONT		IFM(6, 0x4C) /* Cherry Trail, Braswell */
-#define INTEL_FAM6_ATOM_AIRMONT_MID	0x5A /* Moorefield */
 #define INTEL_ATOM_AIRMONT_MID		IFM(6, 0x5A) /* Moorefield */
-#define INTEL_FAM6_ATOM_AIRMONT_NP	0x75 /* Lightning Mountain */
 #define INTEL_ATOM_AIRMONT_NP		IFM(6, 0x75) /* Lightning Mountain */
 
-#define INTEL_FAM6_ATOM_GOLDMONT	0x5C /* Apollo Lake */
 #define INTEL_ATOM_GOLDMONT		IFM(6, 0x5C) /* Apollo Lake */
-#define INTEL_FAM6_ATOM_GOLDMONT_D	0x5F /* Denverton */
 #define INTEL_ATOM_GOLDMONT_D		IFM(6, 0x5F) /* Denverton */
 
 /* Note: the micro-architecture is "Goldmont Plus" */
-#define INTEL_FAM6_ATOM_GOLDMONT_PLUS	0x7A /* Gemini Lake */
 #define INTEL_ATOM_GOLDMONT_PLUS	IFM(6, 0x7A) /* Gemini Lake */
 
-#define INTEL_FAM6_ATOM_TREMONT_D	0x86 /* Jacobsville */
 #define INTEL_ATOM_TREMONT_D		IFM(6, 0x86) /* Jacobsville */
-#define INTEL_FAM6_ATOM_TREMONT		0x96 /* Elkhart Lake */
 #define INTEL_ATOM_TREMONT		IFM(6, 0x96) /* Elkhart Lake */
-#define INTEL_FAM6_ATOM_TREMONT_L	0x9C /* Jasper Lake */
 #define INTEL_ATOM_TREMONT_L		IFM(6, 0x9C) /* Jasper Lake */
 
-#define INTEL_FAM6_ATOM_GRACEMONT	0xBE /* Alderlake N */
 #define INTEL_ATOM_GRACEMONT		IFM(6, 0xBE) /* Alderlake N */
 
-#define INTEL_FAM6_ATOM_CRESTMONT_X	0xAF /* Sierra Forest */
 #define INTEL_ATOM_CRESTMONT_X		IFM(6, 0xAF) /* Sierra Forest */
-#define INTEL_FAM6_ATOM_CRESTMONT	0xB6 /* Grand Ridge */
 #define INTEL_ATOM_CRESTMONT		IFM(6, 0xB6) /* Grand Ridge */
 
-#define INTEL_FAM6_ATOM_DARKMONT_X	0xDD /* Clearwater Forest */
 #define INTEL_ATOM_DARKMONT_X		IFM(6, 0xDD) /* Clearwater Forest */
 
 /* Xeon Phi */
 
-#define INTEL_FAM6_XEON_PHI_KNL		0x57 /* Knights Landing */
 #define INTEL_XEON_PHI_KNL		IFM(6, 0x57) /* Knights Landing */
-#define INTEL_FAM6_XEON_PHI_KNM		0x85 /* Knights Mill */
 #define INTEL_XEON_PHI_KNM		IFM(6, 0x85) /* Knights Mill */
 
 /* Family 5 */
-- 
2.39.5


