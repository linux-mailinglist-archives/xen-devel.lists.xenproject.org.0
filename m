Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 360089C25FC
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 20:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832775.1248083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7s-0000Un-CB; Fri, 08 Nov 2024 19:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832775.1248083; Fri, 08 Nov 2024 19:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7s-0000Ov-2z; Fri, 08 Nov 2024 19:58:36 +0000
Received: by outflank-mailman (input) for mailman id 832775;
 Fri, 08 Nov 2024 19:58:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9V7q-0008TY-Kh
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 19:58:34 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3fe9871-9e0b-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 20:58:31 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9a6acac4c3so398705466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 11:58:31 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc5db6sm271523466b.119.2024.11.08.11.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 11:58:29 -0800 (PST)
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
X-Inumbo-ID: d3fe9871-9e0b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzUiLCJoZWxvIjoibWFpbC1lajEteDYzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQzZmU5ODcxLTllMGItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDk1OTExLjIxNjg2OCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731095910; x=1731700710; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ANEYUxwjZbcuyDzK95iBxFnfD77BA80c4Ql6FKNyVY=;
        b=BzHdf4eau3mQ9MSmW+wGMIKnt/j/G8pRH8M0nzA4Ax0jiAuJH01aNrn38dElxJANyf
         x6d6pZKLauaBKloOatjT8Fsi7iiIrKrzYx0cpo848G8Fc6l6MWKjRlkTHjuO8PlPEBN2
         BGPYueM7q7QcdpZvHw1UiFCPU1niCAmw/KGWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731095910; x=1731700710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ANEYUxwjZbcuyDzK95iBxFnfD77BA80c4Ql6FKNyVY=;
        b=cNGrbLLHq/lAwSVylnpjP3qEMmpkhW3Cy7hgfoCA0DiCcqWna8xvb7K48oTJxSrbQG
         ogmjPk/NWebNwQmicKdC36/0TdiOyVfKkrXjMcamCj24cg6R4pIydoNswdaaR6qx0AHx
         /0NTf5o5iPrj5IakPSikMt+83q/0Me05IRTuEqX6ZsJ3aJzocPNBnCVlGKFEaPrkXRpq
         Hh6l2QIymDro6oS5kIMvlhwLa77dsMcwWDqdYAUHg3OBvVE/WFNkBgvDaJR3WIxZEIkE
         ZL1+7l2bFSdN2k6jDbsb6wg1k0buAm9R4S0t1HBiFXmWjkAKx5vbEjpStmOM/Wr0PzAf
         Yhng==
X-Gm-Message-State: AOJu0Yz1a7MaXmjRRmWpbQ6EBOKLhoTTlx845bnT+uWEq/Q38ykSE0es
	86CHYSsJYiiG4KLlk1zxEsFR/sumFWhtTjrc8WtelQBxjq7pye6Rvq2FAxRGWhUY5qxZ0do8Ov4
	/
X-Google-Smtp-Source: AGHT+IFvX9tGeHDVwmSP4Z5fuOX3wsaPvxwmr8qKx24X2101fA9FQ0Q9PeAvSGbtqqCLnc23lSzhVw==
X-Received: by 2002:a17:907:2da7:b0:a9e:edcf:b7c8 with SMTP id a640c23a62f3a-a9eeffd8f7cmr397363166b.44.1731095910024;
        Fri, 08 Nov 2024 11:58:30 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 03/10] x86/mach-apic: Move generic_*_probe() declarations into genapic.h
Date: Fri,  8 Nov 2024 19:58:13 +0000
Message-Id: <20241108195820.789716-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108195820.789716-1-andrew.cooper3@citrix.com>
References: <20241108195820.789716-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... as the implementations are in genapic/probe.c

This covers the only functions that both setup.c and boot.c were including
mach_apic.h for, although setup.c was depending on io_apic.h transitively too.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/boot.c                          | 2 +-
 xen/arch/x86/include/asm/genapic.h                | 3 +++
 xen/arch/x86/include/asm/mach-generic/mach_apic.h | 3 ---
 xen/arch/x86/setup.c                              | 3 ++-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
index 170f9783c55e..3901f9d9825b 100644
--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -38,7 +38,7 @@
 #include <asm/mpspec.h>
 #include <asm/processor.h>
 #include <asm/hpet.h> /* for hpet_address */
-#include <mach_apic.h>
+#include <asm/genapic.h>
 
 #define PREFIX			"ACPI: "
 
diff --git a/xen/arch/x86/include/asm/genapic.h b/xen/arch/x86/include/asm/genapic.h
index 4d39fb9a244b..6c8845d17d27 100644
--- a/xen/arch/x86/include/asm/genapic.h
+++ b/xen/arch/x86/include/asm/genapic.h
@@ -51,4 +51,7 @@ unsigned int cf_check cpu_mask_to_apicid_phys(const cpumask_t *cpumask);
 void cf_check send_IPI_mask_phys(const cpumask_t *mask, int vector);
 const cpumask_t *cf_check vector_allocation_cpumask_phys(int cpu);
 
+void generic_apic_probe(void);
+void generic_bigsmp_probe(void);
+
 #endif
diff --git a/xen/arch/x86/include/asm/mach-generic/mach_apic.h b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
index c0d8b232c9eb..50f39b72ccfb 100644
--- a/xen/arch/x86/include/asm/mach-generic/mach_apic.h
+++ b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
@@ -39,9 +39,6 @@ static inline int multi_timer_check(int apic, int irq)
 	return 0;
 }
 
-extern void generic_apic_probe(void);
-extern void generic_bigsmp_probe(void);
-
 /*
  * The following functions based around phys_cpu_present_map are disabled in
  * some i386 Linux subarchitectures, and in x86_64 'cluster' genapic mode. I'm
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index eac8488c4ca5..4feef9f2e05a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -46,7 +46,8 @@
 #include <xsm/xsm.h>
 #include <asm/tboot.h>
 #include <asm/bzimage.h> /* for bzimage_headroom */
-#include <asm/mach-generic/mach_apic.h> /* for generic_apic_probe */
+#include <asm/genapic.h>
+#include <asm/io_apic.h>
 #include <asm/setup.h>
 #include <xen/cpu.h>
 #include <xen/cpuidle.h>
-- 
2.39.5


