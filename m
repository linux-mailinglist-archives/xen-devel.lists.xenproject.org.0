Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8BC830304
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 11:00:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668340.1040457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2i9-0005rD-4S; Wed, 17 Jan 2024 09:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668340.1040457; Wed, 17 Jan 2024 09:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2i9-0005oW-0I; Wed, 17 Jan 2024 09:59:53 +0000
Received: by outflank-mailman (input) for mailman id 668340;
 Wed, 17 Jan 2024 09:59:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQ2i7-0005k0-N4
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 09:59:51 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26d30a52-b51f-11ee-9b0f-b553b5be7939;
 Wed, 17 Jan 2024 10:59:49 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-337c4c9cde2so163421f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 01:59:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s8-20020a05600c45c800b0040e527602c8sm26023093wmo.9.2024.01.17.01.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 01:59:48 -0800 (PST)
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
X-Inumbo-ID: 26d30a52-b51f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705485589; x=1706090389; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qiGNHtn4gk5sauQXgXkDrfgn2lDRSN7qCMUleR6M6Co=;
        b=Kz9hA0v84pzPDQN80AmujbdB6JBAciuFoN9tnVRpwLrpdytZ+oXRIrtnyQ3HZ+zURA
         WbHslY8uXa6jCdKZ19zJxSotJHfSXrnpq9wZrTweKhMC/1N4AWxqQXh6/NkBl1SjN17C
         VPRBnv4tSH9a5SbU2HHCZ7QNNNZG59agXEnxOISFHJEOrStADu99BlYohqdf+K9am3Nq
         6m/sGLsadOBLG2MM7ZahSksW/JUeUGJnbUAdB3BqtN7SRRqUA1/IQT5m3oREEybxhcZr
         2Bx2cVehfNhTy/CfETWuFjdbEhn5CTC578e/GFCC6Lz4e7GpovjtydcGiI1dGOHBbSVO
         jZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705485589; x=1706090389;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qiGNHtn4gk5sauQXgXkDrfgn2lDRSN7qCMUleR6M6Co=;
        b=iYqrap0KJFFPxTnKP9oTAAOCYrrqNlmT/oRCklyWKUgK+AA/3sv/UYIiYdFLuEtoDe
         YOe+wE8d9pPHLaedt7S472o7Ep6PW1DRMM3xP16+W+VrXPMjum0H5Y70kYLU+ufLL840
         pEbUFNEaH3FZ6J1YI86FggoyZstgB5kofGKSEzzWcj+RTlSW0IHr+lq30y2Sz8ZsHkMQ
         V6sCMlKo9BBm1tP/h6pZscCf7Ok2vQEsUIs3x2H6AguDe8lLv7K8o2bPTAL3pjOwLsji
         TTk8C+BS67P2JXZ3C8KVeAJRF42NpyGU0X2fMXetM6/JPWuRDQfOd7UTLYZREnqVOqNE
         mkWg==
X-Gm-Message-State: AOJu0YwY/2QR0/j+I5FWf4UDdY2rkqwq8dZiDQn7g9rc2o8PZ+dT49Pd
	GNaxA4dOr9mh0ZDqcahe1bPP0V/0J/80VnKWvBzXhk2h0g==
X-Google-Smtp-Source: AGHT+IHIM89XmiqD2KMRhG+kLnxqWNP3iPiiW2qbOY6f9q/P7uM4+EtVBHesFx4vIq4F30owEOOrxQ==
X-Received: by 2002:a05:600c:4fcb:b0:40e:88bb:5b0a with SMTP id o11-20020a05600c4fcb00b0040e88bb5b0amr338286wmq.111.1705485589117;
        Wed, 17 Jan 2024 01:59:49 -0800 (PST)
Message-ID: <40579c64-91be-4df2-9d65-f89d656ec4af@suse.com>
Date: Wed, 17 Jan 2024 10:59:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] x86/MCE: separate BSP-only initialization
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0fb20fcf-1580-41c9-946b-7daf865f4b49@suse.com>
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
In-Reply-To: <0fb20fcf-1580-41c9-946b-7daf865f4b49@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Several function pointers are registered over and over again, when
setting them once on the BSP suffices. Arrange for this in the vendor
init functions and mark involved registration functions __init.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mcheck/mcaction.c
+++ b/xen/arch/x86/cpu/mcheck/mcaction.c
@@ -29,7 +29,7 @@ mci_action_add_pageoffline(int bank, str
 
 mce_check_addr_t mc_check_addr = NULL;
 
-void mce_register_addrcheck(mce_check_addr_t cbfunc)
+void __init mce_register_addrcheck(mce_check_addr_t cbfunc)
 {
     mc_check_addr = cbfunc;
 }
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -84,7 +84,7 @@ static void cf_check unexpected_machine_
 
 static x86_mce_vector_t _machine_check_vector = unexpected_machine_check;
 
-void x86_mce_vector_register(x86_mce_vector_t hdlr)
+void __init x86_mce_vector_register(x86_mce_vector_t hdlr)
 {
     _machine_check_vector = hdlr;
 }
@@ -107,7 +107,7 @@ void do_machine_check(const struct cpu_u
  */
 static x86_mce_callback_t mc_callback_bank_extended = NULL;
 
-void x86_mce_callback_register(x86_mce_callback_t cbfunc)
+void __init x86_mce_callback_register(x86_mce_callback_t cbfunc)
 {
     mc_callback_bank_extended = cbfunc;
 }
@@ -118,7 +118,7 @@ void x86_mce_callback_register(x86_mce_c
  */
 static mce_recoverable_t mc_recoverable_scan = NULL;
 
-void mce_recoverable_register(mce_recoverable_t cbfunc)
+void __init mce_recoverable_register(mce_recoverable_t cbfunc)
 {
     mc_recoverable_scan = cbfunc;
 }
@@ -181,7 +181,7 @@ static void mcabank_clear(int banknum)
  */
 static mce_need_clearbank_t mc_need_clearbank_scan = NULL;
 
-void mce_need_clearbank_register(mce_need_clearbank_t cbfunc)
+void __init mce_need_clearbank_register(mce_need_clearbank_t cbfunc)
 {
     mc_need_clearbank_scan = cbfunc;
 }
@@ -798,7 +798,7 @@ void mcheck_init(struct cpuinfo_x86 *c,
     {
     case X86_VENDOR_AMD:
     case X86_VENDOR_HYGON:
-        inited = amd_mcheck_init(c);
+        inited = amd_mcheck_init(c, bsp);
         break;
 
     case X86_VENDOR_INTEL:
@@ -1913,11 +1913,8 @@ static void cf_check mce_softirq(void)
  * will help to collect and log those MCE errors.
  * Round2: Do all MCE processing logic as normal.
  */
-void mce_handler_init(void)
+void __init mce_handler_init(void)
 {
-    if ( smp_processor_id() != 0 )
-        return;
-
     /* callback register, do we really need so many callback? */
     /* mce handler data initialization */
     spin_lock_init(&mce_logout_lock);
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -43,7 +43,7 @@ extern uint8_t cmci_apic_vector;
 extern bool lmce_support;
 
 /* Init functions */
-enum mcheck_type amd_mcheck_init(const struct cpuinfo_x86 *c);
+enum mcheck_type amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp);
 enum mcheck_type intel_mcheck_init(struct cpuinfo_x86 *c, bool bsp);
 
 void amd_nonfatal_mcheck_init(struct cpuinfo_x86 *c);
--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -272,7 +272,7 @@ int vmce_amd_rdmsr(const struct vcpu *v,
 }
 
 enum mcheck_type
-amd_mcheck_init(const struct cpuinfo_x86 *c)
+amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp)
 {
     uint32_t i;
     enum mcequirk_amd_flags quirkflag = 0;
@@ -282,9 +282,12 @@ amd_mcheck_init(const struct cpuinfo_x86
 
     /* Assume that machine check support is available.
      * The minimum provided support is at least the K8. */
-    mce_handler_init();
-    x86_mce_vector_register(mcheck_cmn_handler);
-    mce_need_clearbank_register(amd_need_clearbank_scan);
+    if ( bsp )
+    {
+        mce_handler_init();
+        x86_mce_vector_register(mcheck_cmn_handler);
+        mce_need_clearbank_register(amd_need_clearbank_scan);
+    }
 
     for ( i = 0; i < this_cpu(nr_mce_banks); i++ )
     {
@@ -324,9 +327,12 @@ amd_mcheck_init(const struct cpuinfo_x86
             ppin_msr = MSR_AMD_PPIN;
     }
 
-    x86_mce_callback_register(amd_f10_handler);
-    mce_recoverable_register(mc_amd_recoverable_scan);
-    mce_register_addrcheck(mc_amd_addrcheck);
+    if ( bsp )
+    {
+        x86_mce_callback_register(amd_f10_handler);
+        mce_recoverable_register(mc_amd_recoverable_scan);
+        mce_register_addrcheck(mc_amd_addrcheck);
+    }
 
     return c->x86_vendor == X86_VENDOR_HYGON ?
             mcheck_hygon : mcheck_amd_famXX;
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -820,7 +820,7 @@ static void intel_mce_post_reset(void)
     return;
 }
 
-static void intel_init_mce(void)
+static void intel_init_mce(bool bsp)
 {
     uint64_t msr_content;
     int i;
@@ -846,6 +846,9 @@ static void intel_init_mce(void)
     if ( firstbank ) /* if cmci enabled, firstbank = 0 */
         wrmsrl(MSR_IA32_MC0_STATUS, 0x0ULL);
 
+    if ( !bsp )
+        return;
+
     x86_mce_vector_register(mcheck_cmn_handler);
     mce_recoverable_register(intel_recoverable_scan);
     mce_need_clearbank_register(intel_need_clearbank_scan);
@@ -985,9 +988,10 @@ enum mcheck_type intel_mcheck_init(struc
 
     intel_init_mca(c);
 
-    mce_handler_init();
+    if ( bsp )
+        mce_handler_init();
 
-    intel_init_mce();
+    intel_init_mce(bsp);
 
     intel_init_cmci(c);
 


