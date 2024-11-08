Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051089C25F6
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 20:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832774.1248074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7r-0000OT-UL; Fri, 08 Nov 2024 19:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832774.1248074; Fri, 08 Nov 2024 19:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7r-0000Id-PH; Fri, 08 Nov 2024 19:58:35 +0000
Received: by outflank-mailman (input) for mailman id 832774;
 Fri, 08 Nov 2024 19:58:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9V7p-0008TS-LG
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 19:58:33 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3b31170-9e0b-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 20:58:30 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9ef275b980so182263366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 11:58:30 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc5db6sm271523466b.119.2024.11.08.11.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 11:58:27 -0800 (PST)
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
X-Inumbo-ID: d3b31170-9e0b-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzYiLCJoZWxvIjoibWFpbC1lajEteDYzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQzYjMxMTcwLTllMGItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDk1OTEwLjY5MTQ5Nywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731095909; x=1731700709; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+dFm0a0Fhh1qywKmm6kV9dHHbNP/gyGU4Edu50c+o8=;
        b=NDQv/yfhjL/mPnYvZESzX5bwfnOylZXbtS2WXzEHoXlElei9P85ky5cqIf+H06TxQ0
         lu38xFp4dZusDq3lz4bw+MDGpIg0/G345oDbMG+Bjl6E6Gb1lTUcLEnHJuZEIQZL5fZ6
         8+FDVkn39nqlnRH79qPbpDeFQqBPOYBUATUYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731095909; x=1731700709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+dFm0a0Fhh1qywKmm6kV9dHHbNP/gyGU4Edu50c+o8=;
        b=MqNZmvSE1/Fg/gu3pWpQ7WjVxRU9XkNyQckRr0rM1YlLqfYeGPmC5ClhcLmivaro4D
         WKRBqRFwBaTZXCheHe6hYXaiPMm/yEt6SIW2F1a/sLIr7Nu5KtiazS+7pMUpg22N0VcK
         o8+aHEZ88y8Pok67W70RnhCOAozHs/R/gYM/pyQDVRVV5KYYeEyb1Tn/ss7n301xOXQX
         JTioPOXTRdqYLNbQKLUfmgXpMEdTln1G/Ccbz5Pfnc9dC7bKkF6qGWZs2yGgwUmyOrsb
         I2Rd2ukacpzNxRmU57sNfEPajNbUnb40vlQp8CJtubkKbrXFSZatoY6bAci+82c6AnCs
         WKtg==
X-Gm-Message-State: AOJu0YwDlOv2oAzd0Z5k/n+k4GOJ8C7l3AKUhaZLIs1v2hr6MqxrNCg1
	AxnSC6IUh+VDlGtAE8sAlSGJMYd7G709eQ3EpO8ckJr2nLi10WzN8ZqFECtZ+tJ5OXxOgOqgvRG
	W
X-Google-Smtp-Source: AGHT+IEOhqfnb4iyEIZTlMK8aPLGxI8ZmGPT7RBh1fXdTFrp3d4nBhxCGtT3Ce/bAkTP4y3ZJ54+5g==
X-Received: by 2002:a17:907:3e1d:b0:a99:f861:ebd with SMTP id a640c23a62f3a-a9eefeebe5amr408994766b.14.1731095909312;
        Fri, 08 Nov 2024 11:58:29 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 02/10] x86: Drop includes of mach_apic.h
Date: Fri,  8 Nov 2024 19:58:12 +0000
Message-Id: <20241108195820.789716-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108195820.789716-1-andrew.cooper3@citrix.com>
References: <20241108195820.789716-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A number of files don't need mach_apic.h at all, or only need transitive
dependenices.  Drop the includes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/common.c        | 1 -
 xen/arch/x86/cpu/intel.c         | 2 --
 xen/arch/x86/genapic/delivery.c  | 3 ++-
 xen/arch/x86/hpet.c              | 3 ++-
 xen/arch/x86/smp.c               | 4 +++-
 xen/arch/x86/x86_64/acpi_mmcfg.c | 1 -
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index ff4cd2289797..067d855badf0 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -18,7 +18,6 @@
 #include <asm/random.h>
 #include <asm/setup.h>
 #include <asm/shstk.h>
-#include <mach_apic.h>
 #include <public/sysctl.h> /* for XEN_INVALID_{SOCKET,CORE}_ID */
 
 #include "cpu.h"
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 807b708217e9..6a7347968ba2 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -14,8 +14,6 @@
 #include <asm/i387.h>
 #include <asm/trampoline.h>
 
-#include <mach_apic.h>
-
 #include "cpu.h"
 
 /*
diff --git a/xen/arch/x86/genapic/delivery.c b/xen/arch/x86/genapic/delivery.c
index 3def78f380d3..7bb7bd658650 100644
--- a/xen/arch/x86/genapic/delivery.c
+++ b/xen/arch/x86/genapic/delivery.c
@@ -1,9 +1,10 @@
 #include <xen/irq.h>
 #include <xen/sched.h>
+
+#include <asm/apic.h>
 #include <asm/current.h>
 #include <asm/smp.h>
 #include <asm/hardirq.h>
-#include <mach_apic.h>
 
 /*
  * LOGICAL FLAT DELIVERY MODE (multicast via bitmask to <= 8 logical APIC IDs).
diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 2f54d3188966..51ff7f12f5c0 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -13,11 +13,12 @@
 #include <xen/numa.h>
 #include <xen/param.h>
 #include <xen/sched.h>
+
+#include <asm/apic.h>
 #include <asm/fixmap.h>
 #include <asm/div64.h>
 #include <asm/hpet.h>
 #include <asm/msi.h>
-#include <mach_apic.h>
 #include <xen/cpuidle.h>
 
 #define MAX_DELTA_NS MILLISECS(10*1000)
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 04c6a0572319..bd337e548c5a 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -14,7 +14,10 @@
 #include <xen/delay.h>
 #include <xen/perfc.h>
 #include <xen/spinlock.h>
+
+#include <asm/apic.h>
 #include <asm/current.h>
+#include <asm/genapic.h>
 #include <asm/guest.h>
 #include <asm/smp.h>
 #include <asm/mc146818rtc.h>
@@ -23,7 +26,6 @@
 #include <asm/hpet.h>
 #include <asm/setup.h>
 #include <irq_vectors.h>
-#include <mach_apic.h>
 
 /* Helper functions to prepare APIC register values. */
 static unsigned int prepare_ICR(unsigned int shortcut, int vector)
diff --git a/xen/arch/x86/x86_64/acpi_mmcfg.c b/xen/arch/x86/x86_64/acpi_mmcfg.c
index 7b0904622931..7fe5663c5984 100644
--- a/xen/arch/x86/x86_64/acpi_mmcfg.c
+++ b/xen/arch/x86/x86_64/acpi_mmcfg.c
@@ -37,7 +37,6 @@
 #include <asm/io.h>
 #include <asm/mpspec.h>
 #include <asm/processor.h>
-#include <mach_apic.h>
 
 #include "mmconfig.h"
 
-- 
2.39.5


