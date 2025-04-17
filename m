Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E72EFA9168C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 10:37:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957113.1350304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Kk0-00062B-Jo; Thu, 17 Apr 2025 08:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957113.1350304; Thu, 17 Apr 2025 08:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Kk0-00060F-Gh; Thu, 17 Apr 2025 08:37:00 +0000
Received: by outflank-mailman (input) for mailman id 957113;
 Thu, 17 Apr 2025 08:36:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5Kjy-000609-MK
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 08:36:58 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ef2ad2c-1b67-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 10:36:56 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so347314f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 01:36:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c33fe6aa0sm28031365ad.222.2025.04.17.01.36.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 01:36:55 -0700 (PDT)
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
X-Inumbo-ID: 1ef2ad2c-1b67-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744879016; x=1745483816; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFI041BCT4BROa4Xxyse0/Kg08DQeTDLY4XZOqmdsEg=;
        b=c+ERWKSQg04FsSuelGwcFVuHfXeSWnnd/4G608MXbhPCcSMn6gmuJqftubN2nw9ar0
         WNi76t2XQFF8nO9QUMoOD/lpi52Dkbo3p5xj2Jo1vuWSY9HY+wFyx6BC0O2fUv3l05p9
         MB8cDtQpB4i0C2xXD4e1CVKlPs3ei+Ofsmue/2VZJwXK0DzTCKGOkNAkrvLm7nzqgFYJ
         YsiGMj8+Dsr1wKi+SmjVOcT6A746W1z4DpX1mt+5zrnT3ngI5F90F3iJfTwjTNJlhkPG
         bKpkPfRyukkpxOCQOLdy8ihPS/7HPrXCfLGLDL/bqA0iIPph1WdxCdIcbXiDHX36xt6X
         beQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744879016; x=1745483816;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gFI041BCT4BROa4Xxyse0/Kg08DQeTDLY4XZOqmdsEg=;
        b=ENmJs+KBRKphe8hVVQikf8PK8sRxljQY506bRbGqoYHz3JNay4bEhbBQusq7o5sbH8
         TYGZj9ZAIXAzu98vnQ46CxCfoTbrb2bQreHPekpvsadPl4FZeirg+e1oFQP5xgv8Futy
         xfUKWc7iAlw9B9KxggusGlq98O+YW49rjKxqhfWSGMWIHD7udaYNbm9qjjCned7Rm5is
         ZgzkXbgpbJt6Dr49vccjA63Ue00W6rijdCNHgW/O0kkDCroICutnAGM4Q86iJcLtxtRF
         RiAh3iAZmEFzV33oSfyd04RbIgJ14E68nfU5I4zE7UM1dEKbFX/ONT0PZj8ORhZsp/tA
         oq1g==
X-Gm-Message-State: AOJu0Yw924DiUE6V0IY7Y64bQpPqjSNCSB1lQsLCf0xo/oF+f4Dsum33
	b0rcqRmhs1LfBEmaGl5pLDXyEX1+peXvwRCmuWfveqqq7PC5h38CZU3PZjZVUNFu82WiH1eCvtA
	=
X-Gm-Gg: ASbGncsRUMQ0MTWzU4T1Pw6N0Wlwux8qTBe8YjqJ1mFfDnY+sb/XDphZtnaFcMH9Cz7
	AdhXolJf38Lb1v39Q1Sy92H3qiYJdH+HGVV7DSpIGV4MYda5v/EfuR0O5rgfxv40vP6XJQd3Tf7
	C/moG03dpNPIEIJAmRVfEZpRCcG/rYMIDH0O9zC0PFksMwc6RZx/7hQBQeTtOKQ+ZGK5TDXJ5+I
	NIRQkKPSgf2jTOwTN+iDN09AIJpc6BWykc/kBgueNNfT/1xpsvr+4neBwQYGOd4EWZNaZdL2YH+
	KRK+cIRvAF8sasV3g3v72ptBmydVTdot48AXktn3Q2RBN3gBA4BbDKRmEPTmaKtsYNjtxaPRS3D
	b5awgLJWDkqGe7F2mLOCoJNTXtQ==
X-Google-Smtp-Source: AGHT+IEKiERCngdua+T03UIiQ7YjO4wUDyXcQrXsUGesOhSXTuPE0f2kIeeFIlgdQQv1mhCBlJOw2Q==
X-Received: by 2002:a5d:6d8b:0:b0:391:ba6:c069 with SMTP id ffacd0b85a97d-39ee5b8a107mr4553702f8f.44.1744879015784;
        Thu, 17 Apr 2025 01:36:55 -0700 (PDT)
Message-ID: <b792df9c-9912-468b-87a8-bb5d81c14df6@suse.com>
Date: Thu, 17 Apr 2025 10:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm: rename smp_clear_cpu_maps()
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

The function has lost all clearing operations. Use the commonly
available name (declared in xen/smp.h), that x86 also uses.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I would have expected this to also address a Misra violation
(declaration without definition), but I can't spot any rule (having
looked through 8.x in particular) to this effect.

--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -29,7 +29,6 @@ int cpu_up_send_sgi(int cpu);
 extern void init_secondary(void);
 
 extern void smp_init_cpus(void);
-extern void smp_clear_cpu_maps (void);
 extern unsigned int smp_get_max_cpus(void);
 
 #define cpu_physical_id(cpu) cpu_logical_map(cpu)
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -317,7 +317,7 @@ void asmlinkage __init start_xen(unsigne
     /* Initialize traps early allow us to get backtrace when an error occurred */
     init_traps();
 
-    smp_clear_cpu_maps();
+    smp_prepare_boot_cpu();
 
     device_tree_flattened = early_fdt_map(fdt_paddr);
     if ( !device_tree_flattened )
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -107,8 +107,7 @@ static void remove_cpu_sibling_map(int c
     free_cpumask_var(per_cpu(cpu_core_mask, cpu));
 }
 
-void __init
-smp_clear_cpu_maps (void)
+void __init smp_prepare_boot_cpu(void)
 {
     cpumask_set_cpu(0, &cpu_online_map);
     cpumask_set_cpu(0, &cpu_possible_map);

