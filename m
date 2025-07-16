Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A47F9B076EC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 15:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045185.1415284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc2Bo-0008Bb-F8; Wed, 16 Jul 2025 13:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045185.1415284; Wed, 16 Jul 2025 13:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc2Bo-0008AA-CR; Wed, 16 Jul 2025 13:28:52 +0000
Received: by outflank-mailman (input) for mailman id 1045185;
 Wed, 16 Jul 2025 13:28:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFaK=Z5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uc2Bm-00089t-Iz
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 13:28:50 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ceb2a967-6248-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 15:28:49 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4538bc52a8dso49844105e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 06:28:49 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e8075d6sm21076205e9.16.2025.07.16.06.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 06:28:47 -0700 (PDT)
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
X-Inumbo-ID: ceb2a967-6248-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752672528; x=1753277328; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gUgBweehX/0pfxOts3TjnGjSRZKxlukLHVTqXHsfPg=;
        b=nugCs3MGr69cpcdpGLvBc0dJb7r1U7gI+ePIXKv+kGJnGQn45Sc295Sbq2BMnI16BR
         9yF9vnhS754QImUXF41Eqv+AXcDspsIVq0G6K7tRyWcSH6ms6Nk1hNLoF6umtFsEbiNm
         sug26DtedEr/d6oLALy0OZz2R5Uyhl4Ty2i7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752672528; x=1753277328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gUgBweehX/0pfxOts3TjnGjSRZKxlukLHVTqXHsfPg=;
        b=CTq72FWD/6HM6kH/4JQ8Rf6+W6eBMIrzs5HvwWBO3DkZC2fx/wCUzXDa80zgOOCyf2
         NN9S6j1pu+9OwTC0dvSDWcemQTWxTQejMQtYAIId6bHRn4ElXqpWCzid7oMlEgB5OrpR
         bl2EdOF4iv+aoj0oiZyAfzcfauGPoDNBCiNqxnBHxp8KX1c42ie/eeR7L91ik0+Tynw+
         qkWwwcZaTT3pQgCwtefFXeFJ/WMUECbmmXJcRnpQOc1Ht4s4l1+S1ra3r+cw37JXkvpi
         gYEpQCjwwl3hKoH+fPmQzvqP0ZL6guS2OO03LcSQUDgVTBIHKFZFvJjU4qvOO3Tqd0Lv
         Ge6Q==
X-Gm-Message-State: AOJu0YySUepWFj2lWWFCIYK5O5Peg2QHoBKlhl6H1PkAr70tyRoGCIKl
	OD8oUg4PPyNoKt/NyWwPi3nmmTbFBWrJ5sSL2a8o0X25/dpsxQbAKoS96KGf+6epJAGWzYZH08M
	rsaI/2YxPjg==
X-Gm-Gg: ASbGnct7t9F3e5ti9ZLBXAqC4PMlgF79XovjoCr7IpwUXczFQISQ5Xz5BNO7PVuAYcD
	NzRkjNhqiPMBbBiM38Ws6T/UiK9mzaF0lLHVTDOfR054EktUjeWd2TYyRN6HTsDDvOO6YbFBxoy
	PmtxJyTuKEQdSlFur5k5q34yI8BV2IQmpflvW74niDLnv2ghs9hYbc/VIOsmHZpjl34pnFMctKZ
	3fOFyhb1+qOo3d2LbSsXjW/5ow3j/URyBCQAMmaIW4hMxKSRbYMO3XYlYOMfydZCV9jQtuu+5C6
	QSkvrX4PfQlKnh8tJWiyzZouCQgvRyYqbXcWp6aW/vlK5es812ir9A1SlfcaTiRCQ4nGwVzD343
	1edXCcMAelBPyk0ZJRJTRNEUX3rtoJJhnwYkIQ8A7ha+McXTlIhbNr1yL0G74EoufAzdtLMwNwS
	Bn
X-Google-Smtp-Source: AGHT+IEB/iOgZbaZhDysiNV7DUlUS+QcR2wtBNsxqcXvZfg10mtW9qDZ/OrevyAOvPMXYtsXF5BCzQ==
X-Received: by 2002:a05:600c:6295:b0:456:191b:9e8d with SMTP id 5b1f17b1804b1-4562e047133mr31827625e9.11.1752672528428;
        Wed, 16 Jul 2025 06:28:48 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/3] x86/intel-family: Resync with Linux
Date: Wed, 16 Jul 2025 14:28:42 +0100
Message-Id: <20250716132843.2086965-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716132843.2086965-1-andrew.cooper3@citrix.com>
References: <20250716132843.2086965-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This snapshot is prior to Linux commit db4001f9cc32 ("x86/cpu/vfm: Delete all
the *_FAM6_ CPU #defines") at the end of their conversion phase.

In addition to non-FAM6 infixed names, defines are added for the Pentium Pro,
ArrowLake U, and reintroduced the PHI defines which were incorrectly deleted
in the past.

In cpufeature.h, provide VFM_* macros to transform constants to/from the
cpuinfo_x86 representation.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

I meant to object to deleting PHI at the time, but was too late.  Just because
Xen has stopped supporting the PHI doesn't mean the model numbers have ceased
existing.
---
 xen/arch/x86/include/asm/cpufeature.h   | 17 +++++
 xen/arch/x86/include/asm/intel-family.h | 96 ++++++++++++++++++++++++-
 2 files changed, 111 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 707b134c09c7..ba2c1c1c7416 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -8,6 +8,8 @@
 
 #include <xen/cache.h>
 #include <xen/const.h>
+#include <xen/macros.h>
+
 #include <asm/cpuid.h>
 
 #define cpufeat_word(idx)	((idx) / 32)
@@ -17,6 +19,21 @@
 /* An alias of a feature we know is always going to be present. */
 #define X86_FEATURE_ALWAYS      X86_FEATURE_LM
 
+/*
+ * Layout tied to cpuinfo_x86.vfm
+ */
+#define VFM_MODEL_MASK  0x000000ff
+#define VFM_FAMILY_MASK 0x0000ff00
+#define VFM_VENDOR_MASK 0x00ff0000
+
+#define VFM_MAKE(v, f, m) (MASK_INSR(v, VFM_VENDOR_MASK) | \
+                           MASK_INSR(f, VFM_FAMILY_MASK) | \
+                           MASK_INSR(f, VFM_MODEL_MASK))
+
+#define VFM_MODEL(vfm)  MASK_EXTR(vfm, VFM_MODEL_MASK)
+#define VFM_FAMILY(vfm) MASK_EXTR(vfm, VFM_FAMILY_MASK)
+#define VFM_VENDOR(vfm) MASK_EXTR(vfm, VFM_VENDOR_MASK)
+
 #ifndef __ASSEMBLY__
 
 struct cpuinfo_x86 {
diff --git a/xen/arch/x86/include/asm/intel-family.h b/xen/arch/x86/include/asm/intel-family.h
index ab20cce12492..5858e7398570 100644
--- a/xen/arch/x86/include/asm/intel-family.h
+++ b/xen/arch/x86/include/asm/intel-family.h
@@ -13,8 +13,8 @@
  *	INTEL_FAM6{OPTFAMILY}_{MICROARCH}{OPTDIFF}
  * where:
  * OPTFAMILY	Describes the family of CPUs that this belongs to. Default
- *		is assumed to be "_CORE" (and should be omitted). The other
- *		value currently in use is _ATOM.
+ *		is assumed to be "_CORE" (and should be omitted). Other values
+ *		currently in use are _ATOM and _XEON_PHI
  * MICROARCH	Is the code name for the micro-architecture for this core.
  *		N.B. Not the platform name.
  * OPTDIFF	If needed, a short string to differentiate by market segment.
@@ -40,131 +40,223 @@
  * their own names :-(
  */
 
+#define IFM(_fam, _model)	VFM_MAKE(X86_VENDOR_INTEL, _fam, _model)
+
 /* Wildcard match for FAM6 so X86_MATCH_INTEL_FAM6_MODEL(ANY) works */
 #define INTEL_FAM6_ANY			X86_MODEL_ANY
+/* Wildcard match for FAM6 so X86_MATCH_VFM(ANY) works */
+#define INTEL_ANY			IFM(X86_FAMILY_ANY, X86_MODEL_ANY)
+
+#define INTEL_PENTIUM_PRO		IFM(6, 0x01)
 
 #define INTEL_FAM6_CORE_YONAH		0x0E
+#define INTEL_CORE_YONAH		IFM(6, 0x0E)
 
 #define INTEL_FAM6_CORE2_MEROM		0x0F
+#define INTEL_CORE2_MEROM		IFM(6, 0x0F)
 #define INTEL_FAM6_CORE2_MEROM_L	0x16
+#define INTEL_CORE2_MEROM_L		IFM(6, 0x16)
 #define INTEL_FAM6_CORE2_PENRYN		0x17
+#define INTEL_CORE2_PENRYN		IFM(6, 0x17)
 #define INTEL_FAM6_CORE2_DUNNINGTON	0x1D
+#define INTEL_CORE2_DUNNINGTON		IFM(6, 0x1D)
 
 #define INTEL_FAM6_NEHALEM		0x1E
+#define INTEL_NEHALEM			IFM(6, 0x1E)
 #define INTEL_FAM6_NEHALEM_G		0x1F /* Auburndale / Havendale */
+#define INTEL_NEHALEM_G			IFM(6, 0x1F) /* Auburndale / Havendale */
 #define INTEL_FAM6_NEHALEM_EP		0x1A
+#define INTEL_NEHALEM_EP		IFM(6, 0x1A)
 #define INTEL_FAM6_NEHALEM_EX		0x2E
+#define INTEL_NEHALEM_EX		IFM(6, 0x2E)
 
 #define INTEL_FAM6_WESTMERE		0x25
+#define INTEL_WESTMERE			IFM(6, 0x25)
 #define INTEL_FAM6_WESTMERE_EP		0x2C
+#define INTEL_WESTMERE_EP		IFM(6, 0x2C)
 #define INTEL_FAM6_WESTMERE_EX		0x2F
+#define INTEL_WESTMERE_EX		IFM(6, 0x2F)
 
 #define INTEL_FAM6_SANDYBRIDGE		0x2A
+#define INTEL_SANDYBRIDGE		IFM(6, 0x2A)
 #define INTEL_FAM6_SANDYBRIDGE_X	0x2D
+#define INTEL_SANDYBRIDGE_X		IFM(6, 0x2D)
 #define INTEL_FAM6_IVYBRIDGE		0x3A
+#define INTEL_IVYBRIDGE			IFM(6, 0x3A)
 #define INTEL_FAM6_IVYBRIDGE_X		0x3E
+#define INTEL_IVYBRIDGE_X		IFM(6, 0x3E)
 
 #define INTEL_FAM6_HASWELL		0x3C
+#define INTEL_HASWELL			IFM(6, 0x3C)
 #define INTEL_FAM6_HASWELL_X		0x3F
+#define INTEL_HASWELL_X			IFM(6, 0x3F)
 #define INTEL_FAM6_HASWELL_L		0x45
+#define INTEL_HASWELL_L			IFM(6, 0x45)
 #define INTEL_FAM6_HASWELL_G		0x46
+#define INTEL_HASWELL_G			IFM(6, 0x46)
 
 #define INTEL_FAM6_BROADWELL		0x3D
+#define INTEL_BROADWELL			IFM(6, 0x3D)
 #define INTEL_FAM6_BROADWELL_G		0x47
+#define INTEL_BROADWELL_G		IFM(6, 0x47)
 #define INTEL_FAM6_BROADWELL_X		0x4F
+#define INTEL_BROADWELL_X		IFM(6, 0x4F)
 #define INTEL_FAM6_BROADWELL_D		0x56
+#define INTEL_BROADWELL_D		IFM(6, 0x56)
 
 #define INTEL_FAM6_SKYLAKE_L		0x4E	/* Sky Lake             */
+#define INTEL_SKYLAKE_L			IFM(6, 0x4E) /* Sky Lake */
 #define INTEL_FAM6_SKYLAKE		0x5E	/* Sky Lake             */
+#define INTEL_SKYLAKE			IFM(6, 0x5E) /* Sky Lake */
 #define INTEL_FAM6_SKYLAKE_X		0x55	/* Sky Lake             */
+#define INTEL_SKYLAKE_X			IFM(6, 0x55) /* Sky Lake */
 /*                 CASCADELAKE_X	0x55	   Sky Lake -- s: 7     */
 /*                 COOPERLAKE_X		0x55	   Sky Lake -- s: 11    */
 
 #define INTEL_FAM6_KABYLAKE_L		0x8E	/* Sky Lake             */
+#define INTEL_KABYLAKE_L		IFM(6, 0x8E) /* Sky Lake */
 /*                 AMBERLAKE_L		0x8E	   Sky Lake -- s: 9     */
 /*                 COFFEELAKE_L		0x8E	   Sky Lake -- s: 10    */
 /*                 WHISKEYLAKE_L	0x8E       Sky Lake -- s: 11,12 */
 
 #define INTEL_FAM6_KABYLAKE		0x9E	/* Sky Lake             */
+#define INTEL_KABYLAKE			IFM(6, 0x9E) /* Sky Lake */
 /*                 COFFEELAKE		0x9E	   Sky Lake -- s: 10-13 */
 
 #define INTEL_FAM6_COMETLAKE		0xA5	/* Sky Lake             */
+#define INTEL_COMETLAKE			IFM(6, 0xA5) /* Sky Lake */
 #define INTEL_FAM6_COMETLAKE_L		0xA6	/* Sky Lake             */
+#define INTEL_COMETLAKE_L		IFM(6, 0xA6) /* Sky Lake */
 
 #define INTEL_FAM6_CANNONLAKE_L		0x66	/* Palm Cove */
+#define INTEL_CANNONLAKE_L		IFM(6, 0x66) /* Palm Cove */
 
 #define INTEL_FAM6_ICELAKE_X		0x6A	/* Sunny Cove */
+#define INTEL_ICELAKE_X			IFM(6, 0x6A) /* Sunny Cove */
 #define INTEL_FAM6_ICELAKE_D		0x6C	/* Sunny Cove */
+#define INTEL_ICELAKE_D			IFM(6, 0x6C) /* Sunny Cove */
 #define INTEL_FAM6_ICELAKE		0x7D	/* Sunny Cove */
+#define INTEL_ICELAKE			IFM(6, 0x7D) /* Sunny Cove */
 #define INTEL_FAM6_ICELAKE_L		0x7E	/* Sunny Cove */
+#define INTEL_ICELAKE_L			IFM(6, 0x7E) /* Sunny Cove */
 #define INTEL_FAM6_ICELAKE_NNPI		0x9D	/* Sunny Cove */
+#define INTEL_ICELAKE_NNPI		IFM(6, 0x9D) /* Sunny Cove */
 
 #define INTEL_FAM6_ROCKETLAKE		0xA7	/* Cypress Cove */
+#define INTEL_ROCKETLAKE		IFM(6, 0xA7) /* Cypress Cove */
 
 #define INTEL_FAM6_TIGERLAKE_L		0x8C	/* Willow Cove */
+#define INTEL_TIGERLAKE_L		IFM(6, 0x8C) /* Willow Cove */
 #define INTEL_FAM6_TIGERLAKE		0x8D	/* Willow Cove */
+#define INTEL_TIGERLAKE			IFM(6, 0x8D) /* Willow Cove */
 
 #define INTEL_FAM6_SAPPHIRERAPIDS_X	0x8F	/* Golden Cove */
+#define INTEL_SAPPHIRERAPIDS_X		IFM(6, 0x8F) /* Golden Cove */
 
 #define INTEL_FAM6_EMERALDRAPIDS_X	0xCF
+#define INTEL_EMERALDRAPIDS_X		IFM(6, 0xCF)
 
 #define INTEL_FAM6_GRANITERAPIDS_X	0xAD
+#define INTEL_GRANITERAPIDS_X		IFM(6, 0xAD)
 #define INTEL_FAM6_GRANITERAPIDS_D	0xAE
+#define INTEL_GRANITERAPIDS_D		IFM(6, 0xAE)
 
 /* "Hybrid" Processors (P-Core/E-Core) */
 
 #define INTEL_FAM6_LAKEFIELD		0x8A	/* Sunny Cove / Tremont */
+#define INTEL_LAKEFIELD			IFM(6, 0x8A) /* Sunny Cove / Tremont */
 
 #define INTEL_FAM6_ALDERLAKE		0x97	/* Golden Cove / Gracemont */
+#define INTEL_ALDERLAKE			IFM(6, 0x97) /* Golden Cove / Gracemont */
 #define INTEL_FAM6_ALDERLAKE_L		0x9A	/* Golden Cove / Gracemont */
+#define INTEL_ALDERLAKE_L		IFM(6, 0x9A) /* Golden Cove / Gracemont */
 
 #define INTEL_FAM6_RAPTORLAKE		0xB7	/* Raptor Cove / Enhanced Gracemont */
+#define INTEL_RAPTORLAKE		IFM(6, 0xB7) /* Raptor Cove / Enhanced Gracemont */
 #define INTEL_FAM6_RAPTORLAKE_P		0xBA
+#define INTEL_RAPTORLAKE_P		IFM(6, 0xBA)
 #define INTEL_FAM6_RAPTORLAKE_S		0xBF
+#define INTEL_RAPTORLAKE_S		IFM(6, 0xBF)
 
 #define INTEL_FAM6_METEORLAKE		0xAC
+#define INTEL_METEORLAKE		IFM(6, 0xAC)
 #define INTEL_FAM6_METEORLAKE_L		0xAA
+#define INTEL_METEORLAKE_L		IFM(6, 0xAA)
 
 #define INTEL_FAM6_ARROWLAKE_H		0xC5
+#define INTEL_ARROWLAKE_H		IFM(6, 0xC5)
 #define INTEL_FAM6_ARROWLAKE		0xC6
+#define INTEL_ARROWLAKE			IFM(6, 0xC6)
+#define INTEL_FAM6_ARROWLAKE_U		0xB5
+#define INTEL_ARROWLAKE_U		IFM(6, 0xB5)
 
 #define INTEL_FAM6_LUNARLAKE_M		0xBD
+#define INTEL_LUNARLAKE_M		IFM(6, 0xBD)
 
 /* "Small Core" Processors (Atom/E-Core) */
 
 #define INTEL_FAM6_ATOM_BONNELL		0x1C /* Diamondville, Pineview */
+#define INTEL_ATOM_BONNELL		IFM(6, 0x1C) /* Diamondville, Pineview */
 #define INTEL_FAM6_ATOM_BONNELL_MID	0x26 /* Silverthorne, Lincroft */
+#define INTEL_ATOM_BONNELL_MID		IFM(6, 0x26) /* Silverthorne, Lincroft */
 
 #define INTEL_FAM6_ATOM_SALTWELL	0x36 /* Cedarview */
+#define INTEL_ATOM_SALTWELL		IFM(6, 0x36) /* Cedarview */
 #define INTEL_FAM6_ATOM_SALTWELL_MID	0x27 /* Penwell */
+#define INTEL_ATOM_SALTWELL_MID		IFM(6, 0x27) /* Penwell */
 #define INTEL_FAM6_ATOM_SALTWELL_TABLET	0x35 /* Cloverview */
+#define INTEL_ATOM_SALTWELL_TABLET	IFM(6, 0x35) /* Cloverview */
 
 #define INTEL_FAM6_ATOM_SILVERMONT	0x37 /* Bay Trail, Valleyview */
+#define INTEL_ATOM_SILVERMONT		IFM(6, 0x37) /* Bay Trail, Valleyview */
 #define INTEL_FAM6_ATOM_SILVERMONT_D	0x4D /* Avaton, Rangely */
+#define INTEL_ATOM_SILVERMONT_D		IFM(6, 0x4D) /* Avaton, Rangely */
 #define INTEL_FAM6_ATOM_SILVERMONT_MID	0x4A /* Merriefield */
+#define INTEL_ATOM_SILVERMONT_MID	IFM(6, 0x4A) /* Merriefield */
 
 #define INTEL_FAM6_ATOM_AIRMONT		0x4C /* Cherry Trail, Braswell */
+#define INTEL_ATOM_AIRMONT		IFM(6, 0x4C) /* Cherry Trail, Braswell */
 #define INTEL_FAM6_ATOM_AIRMONT_MID	0x5A /* Moorefield */
+#define INTEL_ATOM_AIRMONT_MID		IFM(6, 0x5A) /* Moorefield */
 #define INTEL_FAM6_ATOM_AIRMONT_NP	0x75 /* Lightning Mountain */
+#define INTEL_ATOM_AIRMONT_NP		IFM(6, 0x75) /* Lightning Mountain */
 
 #define INTEL_FAM6_ATOM_GOLDMONT	0x5C /* Apollo Lake */
+#define INTEL_ATOM_GOLDMONT		IFM(6, 0x5C) /* Apollo Lake */
 #define INTEL_FAM6_ATOM_GOLDMONT_D	0x5F /* Denverton */
+#define INTEL_ATOM_GOLDMONT_D		IFM(6, 0x5F) /* Denverton */
 
 /* Note: the micro-architecture is "Goldmont Plus" */
 #define INTEL_FAM6_ATOM_GOLDMONT_PLUS	0x7A /* Gemini Lake */
+#define INTEL_ATOM_GOLDMONT_PLUS	IFM(6, 0x7A) /* Gemini Lake */
 
 #define INTEL_FAM6_ATOM_TREMONT_D	0x86 /* Jacobsville */
+#define INTEL_ATOM_TREMONT_D		IFM(6, 0x86) /* Jacobsville */
 #define INTEL_FAM6_ATOM_TREMONT		0x96 /* Elkhart Lake */
+#define INTEL_ATOM_TREMONT		IFM(6, 0x96) /* Elkhart Lake */
 #define INTEL_FAM6_ATOM_TREMONT_L	0x9C /* Jasper Lake */
+#define INTEL_ATOM_TREMONT_L		IFM(6, 0x9C) /* Jasper Lake */
 
 #define INTEL_FAM6_ATOM_GRACEMONT	0xBE /* Alderlake N */
+#define INTEL_ATOM_GRACEMONT		IFM(6, 0xBE) /* Alderlake N */
 
 #define INTEL_FAM6_ATOM_CRESTMONT_X	0xAF /* Sierra Forest */
+#define INTEL_ATOM_CRESTMONT_X		IFM(6, 0xAF) /* Sierra Forest */
 #define INTEL_FAM6_ATOM_CRESTMONT	0xB6 /* Grand Ridge */
+#define INTEL_ATOM_CRESTMONT		IFM(6, 0xB6) /* Grand Ridge */
 
 #define INTEL_FAM6_ATOM_DARKMONT_X	0xDD /* Clearwater Forest */
+#define INTEL_ATOM_DARKMONT_X		IFM(6, 0xDD) /* Clearwater Forest */
+
+/* Xeon Phi */
+
+#define INTEL_FAM6_XEON_PHI_KNL		0x57 /* Knights Landing */
+#define INTEL_XEON_PHI_KNL		IFM(6, 0x57) /* Knights Landing */
+#define INTEL_FAM6_XEON_PHI_KNM		0x85 /* Knights Mill */
+#define INTEL_XEON_PHI_KNM		IFM(6, 0x85) /* Knights Mill */
 
 /* Family 5 */
 #define INTEL_FAM5_QUARK_X1000		0x09 /* Quark X1000 SoC */
+#define INTEL_QUARK_X1000		IFM(5, 0x09) /* Quark X1000 SoC */
 
 #endif /* _ASM_X86_INTEL_FAMILY_H */
-- 
2.39.5


