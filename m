Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE92869BAA
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 17:10:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686249.1068050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf01a-0007P8-1l; Tue, 27 Feb 2024 16:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686249.1068050; Tue, 27 Feb 2024 16:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf01Z-0007NG-VU; Tue, 27 Feb 2024 16:09:45 +0000
Received: by outflank-mailman (input) for mailman id 686249;
 Tue, 27 Feb 2024 16:09:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t50j=KE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rf01Y-0007N8-MX
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 16:09:44 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e6e5eaf-d58a-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 17:09:43 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a3f3d0d2787so459640766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 08:09:43 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 vb5-20020a170907d04500b00a3e9c4fa24esm898416ejc.96.2024.02.27.08.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 08:09:42 -0800 (PST)
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
X-Inumbo-ID: 9e6e5eaf-d58a-11ee-afd6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709050182; x=1709654982; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0qRD6B3/O73clnI5MGy+C8q94KAo6+M7vgkh5nipZSY=;
        b=d0Ovq7gVaaaXgr3/BFHP3amA8uXah1Wlpp42vqJeLaS19Nyh3jXtgZx4wnsDZOMyjf
         6WW9Xl8Lgu22yCEyY0nTea+KAUEZCSot2ksUo9y7Ddi1/0HzpX8KWwDNqZR1huxHbXcW
         hkfP2OJY7MW/jWuzeyv+lNJVfTA9Jo0Rj/obI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709050182; x=1709654982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qRD6B3/O73clnI5MGy+C8q94KAo6+M7vgkh5nipZSY=;
        b=Nlt9wAanNUjhhu6LIXYC3fAOMK/Xc6axPusRXerNLQ429FH40V3VwRMGvjUSwvSLLX
         SzhPGtZWG82gm5WtWhD3PzDTLsB5xNlVDuAMQAhn0gyqCuz4P20Rb5HW+dvj02fYmGRY
         1T+NkJrchFS/++s5OYR4+E7OwcXgioQD/5j2N7Dh+1xC+fPCthZQXv3vikiGDfLHO/A/
         5Rk8KSPXAzz6P5ezeDhNwAcvs9oe9ztKGlufsfCe9i1qHH44WIQ+8Vh3y+eiejwwT4HZ
         v7ya+iRpoOyOVpg6QCIBRUlVTozlSc9xZp9vpMEuv5hDG/uDIRiyWjp5pgdxN4fu8y2e
         4Pvw==
X-Gm-Message-State: AOJu0Yw2DNzkows7/HYGBnj7LJ97B25PRCtklIy79tnrMuPf2faMheD1
	g0ZaatLMNqueX18CVtAhLrh4CXR3xVbr080ckZU7NDpqE15dAgER4lDKJRg/eol1QvraFkbMzPb
	3
X-Google-Smtp-Source: AGHT+IE2CWDx4prxdmfBEaf9CCawCpjLujAhz/xRlfEWQGeDttTwTlQuwWSQ72NlxAEa2l0CdMzMOg==
X-Received: by 2002:a17:906:140f:b0:a3f:c932:9c67 with SMTP id p15-20020a170906140f00b00a3fc9329c67mr7054390ejc.68.1709050182478;
        Tue, 27 Feb 2024 08:09:42 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86: Resync intel-family.h from Linux
Date: Tue, 27 Feb 2024 16:09:40 +0000
Message-Id: <20240227160940.2054111-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From v6.8-rc8

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/intel-family.h | 38 ++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/intel-family.h b/xen/arch/x86/include/asm/intel-family.h
index ffc49151befe..b65e9c46b922 100644
--- a/xen/arch/x86/include/asm/intel-family.h
+++ b/xen/arch/x86/include/asm/intel-family.h
@@ -26,6 +26,9 @@
  *		_G	- parts with extra graphics on
  *		_X	- regular server parts
  *		_D	- micro server parts
+ *		_N,_P	- other mobile parts
+ *		_H	- premium mobile parts
+ *		_S	- other client parts
  *
  *		Historical OPTDIFFs:
  *
@@ -37,6 +40,9 @@
  * their own names :-(
  */
 
+/* Wildcard match for FAM6 so X86_MATCH_INTEL_FAM6_MODEL(ANY) works */
+#define INTEL_FAM6_ANY			X86_MODEL_ANY
+
 #define INTEL_FAM6_CORE_YONAH		0x0E
 
 #define INTEL_FAM6_CORE2_MEROM		0x0F
@@ -93,8 +99,6 @@
 #define INTEL_FAM6_ICELAKE_L		0x7E	/* Sunny Cove */
 #define INTEL_FAM6_ICELAKE_NNPI		0x9D	/* Sunny Cove */
 
-#define INTEL_FAM6_LAKEFIELD		0x8A	/* Sunny Cove / Tremont */
-
 #define INTEL_FAM6_ROCKETLAKE		0xA7	/* Cypress Cove */
 
 #define INTEL_FAM6_TIGERLAKE_L		0x8C	/* Willow Cove */
@@ -102,12 +106,31 @@
 
 #define INTEL_FAM6_SAPPHIRERAPIDS_X	0x8F	/* Golden Cove */
 
+#define INTEL_FAM6_EMERALDRAPIDS_X	0xCF
+
+#define INTEL_FAM6_GRANITERAPIDS_X	0xAD
+#define INTEL_FAM6_GRANITERAPIDS_D	0xAE
+
+/* "Hybrid" Processors (P-Core/E-Core) */
+
+#define INTEL_FAM6_LAKEFIELD		0x8A	/* Sunny Cove / Tremont */
+
 #define INTEL_FAM6_ALDERLAKE		0x97	/* Golden Cove / Gracemont */
 #define INTEL_FAM6_ALDERLAKE_L		0x9A	/* Golden Cove / Gracemont */
 
-#define INTEL_FAM6_RAPTORLAKE		0xB7
+#define INTEL_FAM6_RAPTORLAKE		0xB7	/* Raptor Cove / Enhanced Gracemont */
+#define INTEL_FAM6_RAPTORLAKE_P		0xBA
+#define INTEL_FAM6_RAPTORLAKE_S		0xBF
+
+#define INTEL_FAM6_METEORLAKE		0xAC
+#define INTEL_FAM6_METEORLAKE_L		0xAA
+
+#define INTEL_FAM6_ARROWLAKE_H		0xC5
+#define INTEL_FAM6_ARROWLAKE		0xC6
+
+#define INTEL_FAM6_LUNARLAKE_M		0xBD
 
-/* "Small Core" Processors (Atom) */
+/* "Small Core" Processors (Atom/E-Core) */
 
 #define INTEL_FAM6_ATOM_BONNELL		0x1C /* Diamondville, Pineview */
 #define INTEL_FAM6_ATOM_BONNELL_MID	0x26 /* Silverthorne, Lincroft */
@@ -134,6 +157,13 @@
 #define INTEL_FAM6_ATOM_TREMONT		0x96 /* Elkhart Lake */
 #define INTEL_FAM6_ATOM_TREMONT_L	0x9C /* Jasper Lake */
 
+#define INTEL_FAM6_ATOM_GRACEMONT	0xBE /* Alderlake N */
+
+#define INTEL_FAM6_ATOM_CRESTMONT_X	0xAF /* Sierra Forest */
+#define INTEL_FAM6_ATOM_CRESTMONT	0xB6 /* Grand Ridge */
+
+#define INTEL_FAM6_ATOM_DARKMONT_X	0xDD /* Clearwater Forest */
+
 /* Xeon Phi */
 
 #define INTEL_FAM6_XEON_PHI_KNL		0x57 /* Knights Landing */

base-commit: cfe3ad67127b86e1b1c06993b86422673a51b050
-- 
2.30.2


