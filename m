Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FFFB2FF0A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 17:48:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088954.1446660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Wi-0007vE-C3; Thu, 21 Aug 2025 15:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088954.1446660; Thu, 21 Aug 2025 15:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Wi-0007sT-6e; Thu, 21 Aug 2025 15:48:32 +0000
Received: by outflank-mailman (input) for mailman id 1088954;
 Thu, 21 Aug 2025 15:48:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+vP=3B=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1up7Wh-0007q3-AF
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 15:48:31 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48896a80-7ea6-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 17:48:29 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45a1b05fe23so6365415e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 08:48:29 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b4e88bbe0sm14951355e9.4.2025.08.21.08.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 08:48:28 -0700 (PDT)
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
X-Inumbo-ID: 48896a80-7ea6-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755791309; x=1756396109; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4cDNyT9In61YnUP3YDniJuU8T6PiiXEb0RoVY87zhs=;
        b=ELRU4df8DRkCTbEE32pmR3YqoWHoupZeYjY8UW+q7FGidfjbdp+iKvNgFJI6/GL/dr
         nExmSFwFlM9yKFY43+Oh8pwfmJ5JD89kQWgP7DFrzbCXV1i1lCtDAwIezEmHlwcm+k3U
         +rx2r5cnvv4Krur/q5mQ/WC71VfLYWSPvavgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755791309; x=1756396109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4cDNyT9In61YnUP3YDniJuU8T6PiiXEb0RoVY87zhs=;
        b=QTy0KKDiUQhMjyVtuYXmAz0gxjkywBjqoP85FLFZ+OJPwfu5goBuglXIK3HFjUTIOm
         qu1lWraxUECLmC7CUH9rxgQRhEDVf4XaDwyITghkP0YRcpgYRW1no8OWc+oket80+kY4
         M2/bjckNlIwgKl/n9VuPo18xoqwnYGwnhaVN3xVzU3WOw01OpiOvlZ2YWhGxatjMimbN
         dKHjG+7MCGjtjqQAG8Lv3CFxUyjSYzkf/DZ9VbbiPRYA9iez6EVxVooAYjAqG7XJ86w+
         wBP4HuuooWmTEbySilf4GwwJ3s8V/zORoVD+ZEGFDXn335ZpsfE5PlX3WoRLFhdfGB4D
         4XEw==
X-Gm-Message-State: AOJu0YxLPCufmNcxN0eEfvjIeNwb8M2lERrHAyNsW297rQna0iHjpTdh
	w5+k/mxgCOZkvywe4x5nL4ImyFQ394t8B38pOPJwR33WyI2/KN8daQF8QHO7ccMTRVERVv2nT7k
	wnCj2
X-Gm-Gg: ASbGnctapmemX7FtaFUAoRwAPnz2rvl55fuSTtgVCaQO6Sn562WVcenY6VCt0Z8ru9o
	aqEr1N1aXhg5SaZvWOILAIo6G1EP1mOOQ7+SEbR536cHLK2faIYu1503cEeFY+in4BVeOQwCJyE
	RrQpB9CFYNuZWthM6hLdoGDFNU6rEfqB/W3EqOe/VE8HzdANtOgKPK5JP5b8VlcBuaDVDABmxTs
	Xe0Ybti7zWnijrHArsIImUTpKNuxW3f5oPvlfz8VyMppng3Att9x5UWuCfgc3BlRA9XO/PruXX/
	DUlr+xZo+gFtOF74iOY0DxkL+R+XUP7fdSrQvisDtGuxxMWal9msKgI+u2bN1trJ72/ZE6E2gmg
	ED0CtEhzVlg3jRECaIc4iOORKncYrN7Rbp29nk8voYC3HQoe55pvw4efKzYfveY8SqlTJCrs8TN
	hq
X-Google-Smtp-Source: AGHT+IHpO4vviB/CRL+N0SLZZspE1jmJ5jXkAGG+ftG79ZIYFr0VlcXIuTE9kQbU0D0uHb8SMmaXcQ==
X-Received: by 2002:a05:600c:4fd3:b0:456:28f4:a576 with SMTP id 5b1f17b1804b1-45b4d8555c5mr23437185e9.27.1755791308804;
        Thu, 21 Aug 2025 08:48:28 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/2] x86/mce: Adjustments to intel_init_ppin()
Date: Thu, 21 Aug 2025 16:48:25 +0100
Message-Id: <20250821154825.3968600-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250821154825.3968600-1-andrew.cooper3@citrix.com>
References: <20250821154825.3968600-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There's no family check gating intel_init_ppin(), making it incorrect to use
on non Fam6 CPUs.  Switch to using VFM.

Emerald Rapids is the final CPU to have PPIN but lack the the architectural
enumeration, so include it too.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/mcheck/mce_intel.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index d1d61bc95069..16f286566ce7 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -9,6 +9,7 @@
 #include <xen/smp.h>
 
 #include <asm/apic.h>
+#include <asm/intel-family.h>
 #include <asm/mce.h>
 #include <asm/msr.h>
 #include <asm/p2m.h>
@@ -859,7 +860,7 @@ static void intel_init_ppin(const struct cpuinfo_x86 *c)
      * other purposes.  Despite the late addition of a CPUID bit (rendering
      * the MSR architectural), keep using the same detection logic there.
      */
-    switch ( c->x86_model )
+    switch ( c->vfm )
     {
         uint64_t val;
 
@@ -870,14 +871,15 @@ static void intel_init_ppin(const struct cpuinfo_x86 *c)
             return;
         }
         fallthrough;
-    case 0x3e: /* IvyBridge X */
-    case 0x3f: /* Haswell X */
-    case 0x4f: /* Broadwell X */
-    case 0x55: /* Skylake X */
-    case 0x56: /* Broadwell Xeon D */
-    case 0x6a: /* Icelake X */
-    case 0x6c: /* Icelake D */
-    case 0x8f: /* Sapphire Rapids X */
+    case INTEL_IVYBRIDGE_X:
+    case INTEL_HASWELL_X:
+    case INTEL_BROADWELL_X:
+    case INTEL_BROADWELL_D:
+    case INTEL_SKYLAKE_X:
+    case INTEL_ICELAKE_X:
+    case INTEL_ICELAKE_D:
+    case INTEL_SAPPHIRERAPIDS_X:
+    case INTEL_EMERALDRAPIDS_X:
 
         if ( (c != &boot_cpu_data && !ppin_msr) ||
              rdmsr_safe(MSR_PPIN_CTL, val) )
-- 
2.39.5


