Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD68182A870
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 08:36:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665958.1036325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpbn-0001gN-Ot; Thu, 11 Jan 2024 07:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665958.1036325; Thu, 11 Jan 2024 07:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpbn-0001e9-Lv; Thu, 11 Jan 2024 07:36:11 +0000
Received: by outflank-mailman (input) for mailman id 665958;
 Thu, 11 Jan 2024 07:36:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNpbm-00018Y-GC
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 07:36:10 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 167aee1a-b054-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 08:36:09 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33761e291c1so2929717f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 23:36:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d6-20020a056000114600b003366a9cb0d1sm444087wrx.92.2024.01.10.23.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 23:36:09 -0800 (PST)
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
X-Inumbo-ID: 167aee1a-b054-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704958569; x=1705563369; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wsJ7I3Jk/zIngfzbN4LmAFxnYbDQ+MHJGcXuNQpvhR0=;
        b=RlGdGYBIY3n2TtmHTQuesvPhoFS0+uPksPAUd2mqCJeBc7vpfAXK6txTjPuhBapKWN
         GzCfFNeuFGnf8b9buECKLPSEN003zpuJX8KWZBgRmUwj5KjMAhD1aXPcIRnU0NDUZPRb
         lLevMxIsSCUcnaFQHunK5BK4KxWxiDoelOchK+omRRRmD8DBqYAZ8u45dtbl4ZAurxqk
         WY2Udahagp4/cseKCaK4jDu/ZI++qg5pfU/ZJ/HGeyxzeZqXT8gEiOavqa9JZY6Hw9FU
         mFbTnMa2TimDQs74HYDTZlfDkmXpdZ4rj52rK9UMNHtLN86Zl0TCRxmt3dTxcvyg8OnT
         KF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704958569; x=1705563369;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsJ7I3Jk/zIngfzbN4LmAFxnYbDQ+MHJGcXuNQpvhR0=;
        b=fpJyPOXYlpU670dmkm2091ej2vknp3sJb8GUfbjkiti5f73XT4TVsDU9LLl6YduDvy
         Tx86lClXByNXZk7H05xuglFDyMgGg3L/SoWGEz4d/F0X8SlUYFODPwZviQbwkMXF2Bt7
         CtNDE4jcTD96wv34DirvxWDB/6ou7tP6aXgMDQlR8FtVHRbU5nUaIptsfuBgFwQWDN3m
         o9aF+tQf0GmpmN64GPpRB+mH4lTNUFqM3XN6UmVRQvEE/JNg4Mbcat7Iz9CRk7V6Pzxf
         OfiD8w8H9cphvywyXArIyRf2ujZ3ThYnIVnneKypjdtA5788FSgAJhsmhMoLob4uFkSL
         Xzmw==
X-Gm-Message-State: AOJu0YxtmNdOJCBuPaVme0B1YHp28o/Ncq52bftplSwgwQBV5C7iIcb3
	oUT/4sSWxbAdRPwPS3J9fp8gJn8vfEGlhViCqSFu8tNDUA==
X-Google-Smtp-Source: AGHT+IE3hOSLi7u6eZsceZeT2j0xRdDCG/3bXrXJZVUUgBtflr46yVh4GcwSgLEbkryx8nxxJNW/8A==
X-Received: by 2002:a05:600c:354a:b0:40d:891e:a0f1 with SMTP id i10-20020a05600c354a00b0040d891ea0f1mr119263wmq.7.1704958569288;
        Wed, 10 Jan 2024 23:36:09 -0800 (PST)
Message-ID: <a0078508-a0bf-4885-afdd-0f86cea611a4@suse.com>
Date: Thu, 11 Jan 2024 08:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 7/8] x86/vPMU: drop regs parameter from interrupt functions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
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
In-Reply-To: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The vendor functions don't use the respective parameters at all. In
vpmu_do_interrupt() there's only a very limited area where the
outer context's state would be needed, retrievable by get_irq_regs().

This is in preparation of dropping the register parameters from direct
APIC vector handler functions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1412,7 +1412,7 @@ static void cf_check error_interrupt(str
 static void cf_check pmu_interrupt(struct cpu_user_regs *regs)
 {
     ack_APIC_irq();
-    vpmu_do_interrupt(regs);
+    vpmu_do_interrupt();
 }
 
 void __init apic_intr_init(void)
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -158,7 +158,7 @@ static inline struct vcpu *choose_hwdom_
     return hardware_domain->vcpu[idx];
 }
 
-void vpmu_do_interrupt(struct cpu_user_regs *regs)
+void vpmu_do_interrupt(void)
 {
     struct vcpu *sampled = current, *sampling;
     struct vpmu_struct *vpmu;
@@ -239,6 +239,7 @@ void vpmu_do_interrupt(struct cpu_user_r
         else
 #endif
         {
+            const struct cpu_user_regs *regs = get_irq_regs();
             struct xen_pmu_regs *r = &vpmu->xenpmu_data->pmu.r.regs;
 
             if ( (vpmu_mode & XENPMU_MODE_SELF) )
@@ -301,7 +302,7 @@ void vpmu_do_interrupt(struct cpu_user_r
     /* We don't support (yet) HVM dom0 */
     ASSERT(sampling == sampled);
 
-    if ( !alternative_call(vpmu_ops.do_interrupt, regs) ||
+    if ( !alternative_call(vpmu_ops.do_interrupt) ||
          !is_vlapic_lvtpc_enabled(vlapic) )
         return;
 
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -175,7 +175,7 @@ static void amd_vpmu_unset_msr_bitmap(st
     msr_bitmap_off(vpmu);
 }
 
-static int cf_check amd_vpmu_do_interrupt(struct cpu_user_regs *regs)
+static int cf_check amd_vpmu_do_interrupt(void)
 {
     return 1;
 }
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -772,7 +772,7 @@ static void cf_check core2_vpmu_dump(con
     }
 }
 
-static int cf_check core2_vpmu_do_interrupt(struct cpu_user_regs *regs)
+static int cf_check core2_vpmu_do_interrupt(void)
 {
     struct vcpu *v = current;
     u64 msr_content;
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -31,7 +31,7 @@ struct arch_vpmu_ops {
     int (*initialise)(struct vcpu *v);
     int (*do_wrmsr)(unsigned int msr, uint64_t msr_content);
     int (*do_rdmsr)(unsigned int msr, uint64_t *msr_content);
-    int (*do_interrupt)(struct cpu_user_regs *regs);
+    int (*do_interrupt)(void);
     void (*arch_vpmu_destroy)(struct vcpu *v);
     int (*arch_vpmu_save)(struct vcpu *v, bool to_guest);
     int (*arch_vpmu_load)(struct vcpu *v, bool from_guest);
@@ -99,7 +99,7 @@ static inline bool vpmu_are_all_set(cons
 
 void vpmu_lvtpc_update(uint32_t val);
 int vpmu_do_msr(unsigned int msr, uint64_t *msr_content, bool is_write);
-void vpmu_do_interrupt(struct cpu_user_regs *regs);
+void vpmu_do_interrupt(void);
 void vpmu_initialise(struct vcpu *v);
 void vpmu_destroy(struct vcpu *v);
 void vpmu_save(struct vcpu *v);


