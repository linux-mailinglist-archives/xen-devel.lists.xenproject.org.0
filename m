Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DA4B1AFEC
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 09:59:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070092.1433749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujCZw-0005U4-JY; Tue, 05 Aug 2025 07:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070092.1433749; Tue, 05 Aug 2025 07:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujCZw-0005Rl-Gc; Tue, 05 Aug 2025 07:59:24 +0000
Received: by outflank-mailman (input) for mailman id 1070092;
 Tue, 05 Aug 2025 07:59:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujCZu-0005FK-Qs
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 07:59:22 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1836bb6f-71d2-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 09:59:21 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-61553a028dfso5261368a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 00:59:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe7970sm7829833a12.31.2025.08.05.00.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 00:59:20 -0700 (PDT)
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
X-Inumbo-ID: 1836bb6f-71d2-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754380761; x=1754985561; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lDYhhVqtVHSkEY2KScDddpRPE5yfRSX0wYxMEMeyzd0=;
        b=WiXf0sIS/t6jokvq+lYDpSMOOaEp+GoKJV8Cb0AwtKvumEt3CacOaf+eajB5D4oL/Q
         QM2l3DYuavaWasOsd5DjlMVtHhW/69eHTevTrCLbVSE83/iIIFA4kF//xM+WRskt8fzR
         hYR8mgi/QYBx7oFfBbLlND/n2UYSovuh27u9MNbiSXlyJyUeb9c6MzhCD1NyUFQDlg5P
         0u/8QBFXZ8jp6U2yULKinpYS3Gd7qFpmc1oF4jX932cNGvNKo/lKnyZ3b5ykEzSM1eIe
         v3p6+9Fny7nJHeAILfLQ6/EDSJq+tWVHRrS9u2oDRCULVZPeQ8ZxqMAu7V9080iWEvRE
         4zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754380761; x=1754985561;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDYhhVqtVHSkEY2KScDddpRPE5yfRSX0wYxMEMeyzd0=;
        b=g2RYuTDkC7eXWpXco4g2bEIgxdQIyw0/AqVTJrF9ZZXqNFU612/pVjW5J2kVPBc4+6
         ladFiUWIfSlwkRbl3ZC10jOw5wMR0JYl85O2DrZKPUOGRQRn0zXMGQiCVFZvwGXFHRxm
         91G2P1RWdDlgGxRcxHwx40E2pNpI59IC14N2z84WbbKNweQ/Ya8V8XTvzKAeD0jKxfhp
         qDpya4ccnnizB8yTcc4JWgue//EUhsE7UMKzvNRjDDxGDaPguqy3+2Jw7/u1t9ZDNemT
         Y66KQ1KhTdeUDK4qGYB+kwvbjMquaBFHSrrc6dFHonxtSldTmMlObKOMIN7nFXnWnT6n
         9MlQ==
X-Gm-Message-State: AOJu0YyvvhzNRXRRNPi1d7muManujTwWc2EDKuhx5WJhpNhTj7N2bA15
	Ny+CyoVUW4DLvYgBaiHjnBuBePkV2Y2O+uUA/9H0JjVKlRDz0iaMBm7Bshgq41IdxcE1XBVj5ue
	Hsq0=
X-Gm-Gg: ASbGncsFFywQBp7vuDuG6OEKLEcE+DpPwrjN+rAYB2X09P3P6cwaPwTwXaX2vVGxOB4
	8OCzNG7A+OTx/GMS7V6hva7cx4QP0AXOiD9k9NbKQhAm8FVgm9X1BMBv8XNvxSzvQETjkBhrb+g
	bbhRpBaAdXLkEHVFP5Cz99uqLcLbLrOrur8H9jdE3gyqZCcvwUj6R7+d9ORLr4GTjbR4bjfniAa
	8Lifnax1sXpB7ixx1uovvaMUQaqGHZkFkkSps/Yzfp5hStjjAjWVRU6fnqq/xV1YPcH6nCyPwTD
	HKj+1NLOKpM0M7uq/nvGpLvnZoPedpMECcX/CkLDp/AZFwH7GnDGCaAPUQJqbazJPBSdF96vyMd
	cD+tRkSWuTZVpDYLwj/myMuZw6BUVn+8imofPx+NMBnjVan2w9R+P14v6wklRrA69vNqJb+QjMK
	ZsJTE0FOw=
X-Google-Smtp-Source: AGHT+IH3VSvg/T0CwmYObPNUvKXOBd6Eas/r6GDF+jg82t7MVSCFQYTH3sHkvamtqTu71XfW3BmJsQ==
X-Received: by 2002:a50:cc03:0:b0:615:b6b9:d873 with SMTP id 4fb4d7f45d1cf-615e715d669mr8536823a12.24.1754380760630;
        Tue, 05 Aug 2025 00:59:20 -0700 (PDT)
Message-ID: <65e27b35-9256-4ab0-966a-c50a18900ba5@suse.com>
Date: Tue, 5 Aug 2025 09:59:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] x86/mm: correct PG_log_dirty definition
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Penny Zheng <Penny.Zheng@amd.com>
References: <c506f225-0993-4ef3-9e7e-60b8f17c872e@suse.com>
Content-Language: en-US
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
In-Reply-To: <c506f225-0993-4ef3-9e7e-60b8f17c872e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While it is correct that in shim-exclusive mode log-dirty handling is
all unreachable code, the present conditional still isn't correct: In a
HVM=n and SHADOW_PAGING=n configuration log-dirty code also is all
unreachable (and hence violating Misra rule 2.1).

As we're aiming at moving away from special casing PV_SHIM_EXCLUSIVE=y,
don't retain that part of the conditional.

Because of hypercall-defs.c we need to carry out the dependency by
introducing a new auxiliary PAGING control.

Since compiling out mm/paging.c altogether would entail further changes,
merely conditionalize the one function in there (paging_enable()) which
would otherwise remain unreachable (Misra rule 2.1 again) when PAGING=n.

Fixes: 23d4e0d17b76 ("x86/shim: fix build with PV_SHIM_EXCLUSIVE and SHADOW_PAGING")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course PAGING is at risk of being confused with MEM_PAGING. It not
having a prompt, I hope that's tolerable, as I can't really think of a
better name.

Other PG_log_dirty pre-processor conditionals then likely also want
replacing. mm/paging.c and mm/p2m-basic.c could also be compiled out
altogether when PAGING=n, at the expense of introducing a few more
stubs.

FTAOD, the Fixes: tag being referenced does not mean this patch corrects
the far more recently introduced build issue with the combination of the
two features. That's still work that I expect Penny to carry out (with
there still being the option of reverting the final part of the earlier
series).

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -162,6 +162,9 @@ config SHADOW_PAGING
 
           If unsure, say Y.
 
+config PAGING
+	def_bool HVM || SHADOW_PAGING
+
 config BIGMEM
 	bool "big memory support"
 	default n
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -213,11 +213,15 @@ long arch_do_domctl(
     {
 
     case XEN_DOMCTL_shadow_op:
+#ifdef CONFIG_PAGING
         ret = paging_domctl(d, &domctl->u.shadow_op, u_domctl, 0);
         if ( ret == -ERESTART )
             return hypercall_create_continuation(
                        __HYPERVISOR_paging_domctl_cont, "h", u_domctl);
         copyback = true;
+#else
+        ret = -EOPNOTSUPP;
+#endif
         break;
 
     case XEN_DOMCTL_ioport_permission:
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -55,7 +55,7 @@
 #define PG_translate   0
 #define PG_external    0
 #endif
-#if defined(CONFIG_HVM) || !defined(CONFIG_PV_SHIM_EXCLUSIVE)
+#ifdef CONFIG_PAGING
 /* Enable log dirty mode */
 #define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
 #else
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -864,6 +864,7 @@ void paging_final_teardown(struct domain
     p2m_final_teardown(d);
 }
 
+#ifdef CONFIG_PAGING
 /* Enable an arbitrary paging-assistance mode.  Call once at domain
  * creation. */
 int paging_enable(struct domain *d, u32 mode)
@@ -889,6 +890,7 @@ int paging_enable(struct domain *d, u32
     else
         return shadow_enable(d, mode);
 }
+#endif
 
 #ifdef CONFIG_HVM
 /* Called from the guest to indicate that a process is being torn down
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -197,9 +197,11 @@ dm_op(domid_t domid, unsigned int nr_buf
 #ifdef CONFIG_SYSCTL
 sysctl(xen_sysctl_t *u_sysctl)
 #endif
+#if defined(CONFIG_X86) && defined(CONFIG_PAGING)
+paging_domctl_cont(xen_domctl_t *u_domctl)
+#endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl(xen_domctl_t *u_domctl)
-paging_domctl_cont(xen_domctl_t *u_domctl)
 platform_op(xen_platform_op_t *u_xenpf_op)
 #endif
 #ifdef CONFIG_HVM
@@ -296,7 +298,7 @@ dm_op                              compa
 hypfs_op                           do       do       do       do       do
 #endif
 mca                                do       do       -        -        -
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#if defined(CONFIG_X86) && defined(CONFIG_PAGING)
 paging_domctl_cont                 do       do       do       do       -
 #endif
 


