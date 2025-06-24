Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F79AE6C9C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 18:40:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023956.1400061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU6gn-0001aI-CN; Tue, 24 Jun 2025 16:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023956.1400061; Tue, 24 Jun 2025 16:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU6gn-0001WN-8Q; Tue, 24 Jun 2025 16:40:05 +0000
Received: by outflank-mailman (input) for mailman id 1023956;
 Tue, 24 Jun 2025 16:40:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X7et=ZH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uU6gk-00006A-S2
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 16:40:02 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df8f0790-5119-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 18:40:01 +0200 (CEST)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-442fda876a6so50634125e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 09:40:01 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e810caefsm2295472f8f.87.2025.06.24.09.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 09:40:00 -0700 (PDT)
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
X-Inumbo-ID: df8f0790-5119-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750783201; x=1751388001; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8zvOhZvXOvF3gCKvTIhnAyw9lxFL7/6V29vjtTjdtI=;
        b=N/OXEHiZUzm8mnLPePAe2fItD/JrEMudJipQWS+SQsdXbgHLEstIrc9oKw513EtgHk
         lZ09fYqPncpgaDRQDFoFTvg8qbbRrlvmB4a4+88uTLFlXMxl8zM8LJRCEUXcSYK6Eatv
         nJHnuGJU9bFADOkZskNBVKiI4xC6PiGP3TdpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750783201; x=1751388001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8zvOhZvXOvF3gCKvTIhnAyw9lxFL7/6V29vjtTjdtI=;
        b=ad2TqltpNfZPXF+lA9hFBoi5AEbFTeMr7oK7jeVyikXnkSrNRFhqgMkxSL45wUAtDq
         JCHsoCQjXYAfmk4YIB47xBsfAhZFwLTyUM74rCO6KB3mmAKvw5IVyJmF/sKy7TNfEJij
         bVQzBTON166gSOljyoFCbNYpVYXyVoGWg/RrEakJnbgwhcMbAJbIRo3i0WEp5/eRxdYB
         VxYLA6ymqyfCNItWRZcAs91Q5C7CF/dnsKoxwjEjcTnEC0U7S+RyNlYQ8HKl5EHkb/a9
         OkKcMwfvZGtsaenhXXX0pMikKaX7KwcCGjbofv4ZYFTP3Ut29nLhU3oe5fqPhYQvGa+C
         eKNw==
X-Gm-Message-State: AOJu0YxP2zSXULe+BfdPEujTzhTlAuSnfHjTc42ujUnB9T5JxiIb3UGn
	k3q83w47yjDj1v/pgqm5D7cDpEzuncjcLfHN5l3qm6YHCurLGX9+jgH2baPYZTofAS8lSZPobwZ
	Q5QJnWYpFIKwo
X-Gm-Gg: ASbGnctdf53n/O+5vHFyNznEuZ15x77444QHYwK1IcR3tBx9L6FLPE0cgXHfixlIAQd
	dH3zp2NpWOVuqckguQ8clil2pb1Wxf832bOeQr6QXdS/tyRfSQbWlghFYInqqjcugUDWeMlbCR+
	crmfgqgQmQGOEmeI9RG45/SoYOxn1GCTNhgxWJtbN5ujlAUJSu463WmTLLRh4dLQJXMuI7B89nk
	Rt7+ApMMqo76DGUFKYeVc/ZyEo5tyfCepdt1e8brdF0sUUawEcub2BbKP+G3hXHEpDsDEu7Ek7A
	fXIz0bqSYZitqi0LV1OnJ/CZ6sfAv0dzk7+mV2P7Gr127c+8BeLORhyCMiSHFw1lhRcp1j0llZC
	ej4Ku/vjj5F3/p7ZPpDyBsJlCa2DViS4aw04=
X-Google-Smtp-Source: AGHT+IGEh75w0SXxePGB41NK4Hasuo5PBPHwu9ZhzWnvdRAaOu+/JFoOUgUI+oNuE7C60ofh3ArccA==
X-Received: by 2002:a05:600c:3b84:b0:442:ccfa:1461 with SMTP id 5b1f17b1804b1-453657bf26bmr155776385e9.13.1750783200779;
        Tue, 24 Jun 2025 09:40:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/4] x86/idle: Misc cleanup
Date: Tue, 24 Jun 2025 17:39:51 +0100
Message-Id: <20250624163951.301743-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624163951.301743-1-andrew.cooper3@citrix.com>
References: <20250624163951.301743-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sort includes, and drop trailing whitespace.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/cpu_idle.c | 51 ++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index e9493f7f577f..6c3a10e6fb4e 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -1,6 +1,6 @@
 /*
- * cpu_idle - xen idle state module derived from Linux 
- *            drivers/acpi/processor_idle.c & 
+ * cpu_idle - xen idle state module derived from Linux
+ *            drivers/acpi/processor_idle.c &
  *            arch/x86/kernel/acpi/cstate.c
  *
  *  Copyright (C) 2001, 2002 Andy Grover <andrew.grover@intel.com>
@@ -30,34 +30,34 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 
-#include <xen/errno.h>
-#include <xen/lib.h>
-#include <xen/types.h>
 #include <xen/acpi.h>
-#include <xen/smp.h>
+#include <xen/cpu.h>
+#include <xen/errno.h>
 #include <xen/guest_access.h>
+#include <xen/irq.h>
 #include <xen/keyhandler.h>
+#include <xen/lib.h>
+#include <xen/notifier.h>
 #include <xen/param.h>
-#include <xen/trace.h>
-#include <xen/irq.h>
-#include <xen/sections.h>
-
-#include <asm/io.h>
-#include <asm/iocap.h>
-#include <asm/hpet.h>
-#include <asm/processor.h>
 #include <xen/pmstat.h>
+#include <xen/sections.h>
+#include <xen/smp.h>
 #include <xen/softirq.h>
-#include <public/platform.h>
-#include <public/sysctl.h>
+#include <xen/trace.h>
+
 #include <acpi/cpufreq/cpufreq.h>
 #include <asm/apic.h>
 #include <asm/cpuidle.h>
+#include <asm/hpet.h>
+#include <asm/io.h>
+#include <asm/iocap.h>
 #include <asm/mwait.h>
-#include <xen/notifier.h>
-#include <xen/cpu.h>
+#include <asm/processor.h>
 #include <asm/spec_ctrl.h>
 
+#include <public/platform.h>
+#include <public/sysctl.h>
+
 /*#define DEBUG_PM_CX*/
 
 static always_inline void monitor(
@@ -791,7 +791,7 @@ static void cf_check acpi_processor_idle(void)
 
     case ACPI_STATE_C3:
         /*
-         * Before invoking C3, be aware that TSC/APIC timer may be 
+         * Before invoking C3, be aware that TSC/APIC timer may be
          * stopped by H/W. Without carefully handling of TSC/APIC stop issues,
          * deep C state can't work correctly.
          */
@@ -1082,7 +1082,7 @@ static int check_cx(struct acpi_processor_power *power, xen_processor_cx_t *cx)
         break;
 
     case ACPI_ADR_SPACE_FIXED_HARDWARE:
-        if ( cx->reg.bit_width != VENDOR_INTEL || 
+        if ( cx->reg.bit_width != VENDOR_INTEL ||
              cx->reg.bit_offset != NATIVE_CSTATE_BEYOND_HALT )
             return -EINVAL;
 
@@ -1269,14 +1269,14 @@ static void print_cx_pminfo(uint32_t cpu, struct xen_processor_power *power)
            "\t       pwr_setup_done[%d], bm_rld_set[%d]\n",
            power->flags.bm_control, power->flags.bm_check, power->flags.has_cst,
            power->flags.power_setup_done, power->flags.bm_rld_set);
-    
+
     states = power->states;
-    
+
     for ( i = 0; i < power->count; i++ )
     {
         if ( unlikely(copy_from_guest_offset(&state, states, i, 1)) )
             return;
-        
+
         printk("\tstates[%d]:\n", i);
         printk("\t\treg.space_id = %#x\n", state.reg.space_id);
         printk("\t\treg.bit_width = %#x\n", state.reg.bit_width);
@@ -1289,7 +1289,7 @@ static void print_cx_pminfo(uint32_t cpu, struct xen_processor_power *power)
 
         csd = state.dp;
         printk("\t\tdp(@0x%p)\n", csd.p);
-        
+
         if ( csd.p != NULL )
         {
             if ( unlikely(copy_from_guest(&dp, csd, 1)) )
@@ -1388,7 +1388,7 @@ long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power)
 
         dead_idle = acpi_dead_idle;
     }
- 
+
     return 0;
 }
 
@@ -1676,4 +1676,3 @@ static int __init cf_check cpuidle_presmp_init(void)
     return 0;
 }
 presmp_initcall(cpuidle_presmp_init);
-
-- 
2.39.5


