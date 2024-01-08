Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34970826CD2
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 12:30:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663410.1033308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnqB-0008IA-Ai; Mon, 08 Jan 2024 11:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663410.1033308; Mon, 08 Jan 2024 11:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnqB-0008Ez-7e; Mon, 08 Jan 2024 11:30:47 +0000
Received: by outflank-mailman (input) for mailman id 663410;
 Mon, 08 Jan 2024 11:30:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KH4C=IS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rMnq9-0008DT-Uy
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 11:30:45 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bf4bfa4-ae19-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 12:30:43 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2cc7d2c1ff0so18176691fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 03:30:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ca15-20020a0566381c0f00b0046e25a7bb9esm530141jab.176.2024.01.08.03.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 03:30:42 -0800 (PST)
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
X-Inumbo-ID: 5bf4bfa4-ae19-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704713443; x=1705318243; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBuT1Z7IzxWg0hFe5G18yUFRYnbo7M9mhnXeePX7SE4=;
        b=GQ8I8ZcotSJHelPaz0PPJieVeP4GmuyMDGaPvpfj8qRBT42eQsOT95laMGa2oRxq2Q
         P1lACNxkf6LynrRfa4ED+Z54MH8GJctqgWbUPQBUg6vMQxrA4MS7Pp3oDEBl+n71542L
         BsbI44miov8SwodevlpB5ALJ/JeiP39KEBRZgqHK/wft05HCeKpkX+OmWizih5/K3+AA
         QeeqADkevUqEcUPmDaXb4z2TkAkywcMhdRysSwzStvxOpgO/FeCPS7j3wMdFR+xc1/Wj
         dUuu1W/sjfHZE75nfQeNxm79OC/icELAY1gATUNh+kk/2D+B8lsvpnI3g7o3vTD9s37W
         WtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704713443; x=1705318243;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gBuT1Z7IzxWg0hFe5G18yUFRYnbo7M9mhnXeePX7SE4=;
        b=XelhsIzzsrpoFZyl1b0lrnvhpWDU44OnhYzt0YTYHo3NXrXI9Y2JraOCqvNFKryp9I
         PObZjvOqTcAG5yJb6YgxCP3tZ2JRbwaDKdz/w4yANQRATqI0CTyXJOaH3HEnhSgIKXCB
         VXCmwy+qmIjxPRrPXdNyCiI8m8R5VFgTCwF2ugBq0wokJpf5IDeFshb//f2rOBMoBazn
         58HmpiJ6EVc83TPKDXpbOt9ZABSCcpb4bdi3qNtKNFLslfN17FWAMegjXwIo4RS4krkw
         TQoNTW5ElaV9g0O/rIedl87fqunMRVP+XD5xPv6eSEhEhSQkFeksmvqygpDZJHd2xGP8
         zYMA==
X-Gm-Message-State: AOJu0Yzux1XnEyjN8/u/mguOryn7ZGwC0dXLi9+UXj/zOPex8jpPOMrI
	lQ88CHZpJWGwuzd65gFp5xnJv9Mq/xypdd9YBQFWmcmphg==
X-Google-Smtp-Source: AGHT+IEmQAE9p5HmABWZ/c50r+to2PbkqgGELkTO5Xjw0FW2I+jGXiw1EQyJMumfTDaaO4STnvcuKQ==
X-Received: by 2002:a2e:a724:0:b0:2cd:3418:7524 with SMTP id s36-20020a2ea724000000b002cd34187524mr1503904lje.49.1704713443071;
        Mon, 08 Jan 2024 03:30:43 -0800 (PST)
Message-ID: <94cffa48-5e31-4557-827d-c6dec6031d05@suse.com>
Date: Mon, 8 Jan 2024 12:30:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] NUMA: no need for asm/numa.h when !NUMA
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There's no point in every architecture carrying the same stubs for the
case when NUMA isn't enabled (or even supported). Move all of that to
xen/numa.h; replace explicit uses of asm/numa.h in common code. Make
inclusion of asm/numa.h dependent upon NUMA=y.

Drop the no longer applicable "implement NUMA support" comments - in a
!NUMA section this simply makes no sense.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Split off first_valid_mfn specific change. Re-base.

--- a/xen/arch/arm/include/asm/numa.h
+++ /dev/null
@@ -1,31 +0,0 @@
-#ifndef __ARCH_ARM_NUMA_H
-#define __ARCH_ARM_NUMA_H
-
-#include <xen/mm.h>
-
-typedef u8 nodeid_t;
-
-#ifndef CONFIG_NUMA
-
-/* Fake one node for now. See also node_online_map. */
-#define cpu_to_node(cpu) 0
-#define node_to_cpumask(node)   (cpu_online_map)
-
-/* XXX: implement NUMA support */
-#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
-#define node_start_pfn(nid) (mfn_x(first_valid_mfn))
-#define __node_distance(a, b) (20)
-
-#endif
-
-#define arch_want_default_dmazone() (false)
-
-#endif /* __ARCH_ARM_NUMA_H */
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -42,7 +42,7 @@ integer_param("maxcpus", max_cpus);
 /* CPU logical map: map xen cpuid to an MPIDR */
 register_t __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = MPIDR_INVALID };
 
-/* Fake one node for now. See also asm/numa.h */
+/* Fake one node for now. See also xen/numa.h */
 nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 
 /* Xen stack for bringing up the first CPU. */
--- a/xen/arch/ppc/include/asm/numa.h
+++ /dev/null
@@ -1,20 +0,0 @@
-#ifndef __ASM_PPC_NUMA_H__
-#define __ASM_PPC_NUMA_H__
-
-#include <xen/types.h>
-#include <xen/mm.h>
-
-typedef uint8_t nodeid_t;
-
-/* Fake one node for now. See also node_online_map. */
-#define cpu_to_node(cpu) 0
-#define node_to_cpumask(node)   (cpu_online_map)
-
-/* XXX: implement NUMA support */
-#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
-#define node_start_pfn(nid) (mfn_x(first_valid_mfn))
-#define __node_distance(a, b) (20)
-
-#define arch_want_default_dmazone() (false)
-
-#endif /* __ASM_PPC_NUMA_H__ */
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -138,7 +138,6 @@
 #include <xen/spinlock.h>
 
 #include <asm/flushtlb.h>
-#include <asm/numa.h>
 #include <asm/page.h>
 
 #include <public/sysctl.h>
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -22,8 +22,8 @@
 #include <asm/current.h>
 #include <xen/hypercall.h>
 #include <public/sysctl.h>
-#include <asm/numa.h>
 #include <xen/nodemask.h>
+#include <xen/numa.h>
 #include <xsm/xsm.h>
 #include <xen/pmstat.h>
 #include <xen/livepatch.h>
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -2,6 +2,7 @@
 #ifndef __XEN_DOMAIN_H__
 #define __XEN_DOMAIN_H__
 
+#include <xen/numa.h>
 #include <xen/types.h>
 
 #include <public/xen.h>
@@ -12,7 +13,6 @@ struct guest_area {
 };
 
 #include <asm/domain.h>
-#include <asm/numa.h>
 
 typedef union {
     struct vcpu_guest_context *nat;
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -2,7 +2,13 @@
 #define _XEN_NUMA_H
 
 #include <xen/mm-frame.h>
+
+#ifdef CONFIG_NUMA
+#include <xen/pdx.h>
 #include <asm/numa.h>
+#else
+typedef uint8_t nodeid_t;
+#endif
 
 #define NUMA_NO_NODE     0xFF
 #define NUMA_NO_DISTANCE 0xFF
@@ -108,8 +114,18 @@ extern void numa_set_processor_nodes_par
 
 #else
 
+/* Fake one node for now. See also node_online_map. */
+#define cpu_to_node(cpu) 0
+#define node_to_cpumask(node)   cpu_online_map
+
+#define arch_want_default_dmazone() false
+
 extern mfn_t first_valid_mfn;
 
+#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
+#define node_start_pfn(nid) mfn_x(first_valid_mfn)
+#define __node_distance(a, b) 20
+
 static inline nodeid_t mfn_to_nid(mfn_t mfn)
 {
     return 0;
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -11,10 +11,10 @@
 #include <xen/list.h>
 #include <xen/spinlock.h>
 #include <xen/irq.h>
+#include <xen/numa.h>
 #include <xen/pci_regs.h>
 #include <xen/pfn.h>
 #include <asm/device.h>
-#include <asm/numa.h>
 
 /*
  * The PCI interface treats multi-function devices as independent

