Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDF883C459
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 15:09:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671538.1044923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT0P8-0004x2-Tc; Thu, 25 Jan 2024 14:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671538.1044923; Thu, 25 Jan 2024 14:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT0P8-0004uN-Qx; Thu, 25 Jan 2024 14:08:30 +0000
Received: by outflank-mailman (input) for mailman id 671538;
 Thu, 25 Jan 2024 14:08:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rT0P7-0004t3-66
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 14:08:29 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3624b681-bb8b-11ee-8a42-1f161083a0e0;
 Thu, 25 Jan 2024 15:08:28 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cd0d05838fso80529671fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 06:08:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dh7-20020a056e021f0700b0035ff0206ae6sm9633439ilb.17.2024.01.25.06.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 06:08:26 -0800 (PST)
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
X-Inumbo-ID: 3624b681-bb8b-11ee-8a42-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706191707; x=1706796507; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HuTXjxH4616szVPq8HliiCCadwqF+XGEvJNni08ZyM=;
        b=LHmz1c2449JbYSLyuNGlnr9WeDyHoXmKIFB4mjMEYVG/53XUFt+NkAfJuwl5pQo4eE
         b2b5cC3NSHPzh4zqLQYkgXR96CHL6ZvqVq6uDvSCwfpGiqae8OpEvRtn9G2cZ25q67Sm
         3sfRs0RvTMguxh+EO/i0zp+nli7wYLaVrWdFgjuPd7t/8VW3b071TuzvgDVAnUe0juNT
         3WtSumLLmXpkqwlXY+4sSmvSlrhznS6OYzbyoQd/5vJt0PVIZhifyPkFpPOWwCyyG+85
         3hKSPpprvfAe+uM4yjkQ9EIx0jZlFSRDQuUVofj7yJ+mf0IEt1iLh8jnKQViLPCCQ87u
         6jYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706191707; x=1706796507;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HuTXjxH4616szVPq8HliiCCadwqF+XGEvJNni08ZyM=;
        b=DmUFAoXVN2e1QM8uoza13bVlyE+C01OFdI+G3Lp6gDDtlg5zAeLoB63WvGZgb/1WSf
         EPGC/fAhRG1dSMOc3gq9MChV+D+MXsqtAFZ7u9AA/sPyOwsDMcv7hMdrQ/lGncdlIyIo
         43blMGY4/gWbXw9vQNuuRB8wcvka5zhyLCYD0NY4hLoQKiSgFQoNzseMIlqkqmEkoocK
         MtouKRTCNKlQw5g8U+TAAojb5Qi+2rNF+k1QaZhvb5pS0f1HDg7AljfMeRNwywwb3ab7
         UbJdVEnY0HQYbmoFYSWJrq7+gbHfzZtiAUGJZPihJpfEwzHUigpPWKD7a58MyTK/dJUt
         luog==
X-Gm-Message-State: AOJu0Yy4esxswTwJgtA1vwc+H4hifBO0G/oM07PC1V9BI2+WR4wcz5vU
	yAdMsDytRHpbhQ3MQ+D84QUZy2EOKyaA5tgVql+JVNATViB4oQsFiaYW+j8FMLu+BMzWgpx7hvo
	=
X-Google-Smtp-Source: AGHT+IHG+r/xE89z+CI9uuliZdlEvOvQp9t0k7rwseUjyEd6Dh2rtvIK83bHF3RCjoBmBibX4nBYMQ==
X-Received: by 2002:a2e:984b:0:b0:2cd:7b5e:7358 with SMTP id e11-20020a2e984b000000b002cd7b5e7358mr544302ljj.25.1706191707394;
        Thu, 25 Jan 2024 06:08:27 -0800 (PST)
Message-ID: <6842ceff-a6cd-475d-b3bb-c828eee6c83a@suse.com>
Date: Thu, 25 Jan 2024 15:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/APIC: purge {GET,SET}_APIC_DELIVERY_MODE()
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

The few uses we have can easily be replaced, eliminating the need for
redundant APIC_DM_* and APIC_MODE_* constants. Therefore also purge all
respective APIC_MODE_* constants, introducing APIC_DM_MASK anew instead.
This is further relevant since we have a different set of APIC_MODE_*,
which could otherwise end up confusing.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -263,22 +263,20 @@ void disconnect_bsp_APIC(int virt_wire_s
         if (!virt_wire_setup) {
             /* For LVT0 make it edge triggered, active high, external and enabled */
             value = apic_read(APIC_LVT0);
-            value &= ~(APIC_MODE_MASK | APIC_SEND_PENDING |
+            value &= ~(APIC_DM_MASK | APIC_SEND_PENDING |
                        APIC_INPUT_POLARITY | APIC_LVT_REMOTE_IRR |
                        APIC_LVT_LEVEL_TRIGGER | APIC_LVT_MASKED );
-            value |= APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING;
-            value = SET_APIC_DELIVERY_MODE(value, APIC_MODE_EXTINT);
+            value |= APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING | APIC_DM_EXTINT;
             apic_write(APIC_LVT0, value);
         }
 
         /* For LVT1 make it edge triggered, active high, nmi and enabled */
         value = apic_read(APIC_LVT1);
         value &= ~(
-            APIC_MODE_MASK | APIC_SEND_PENDING |
+            APIC_DM_MASK | APIC_SEND_PENDING |
             APIC_INPUT_POLARITY | APIC_LVT_REMOTE_IRR |
             APIC_LVT_LEVEL_TRIGGER | APIC_LVT_MASKED);
-        value |= APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING;
-        value = SET_APIC_DELIVERY_MODE(value, APIC_MODE_NMI);
+        value |= APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING | APIC_DM_NMI;
         apic_write(APIC_LVT1, value);
     }
 }
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -139,12 +139,12 @@ static void intel_init_thermal(struct cp
      * BIOS has programmed on AP based on BSP's info we saved (since BIOS
      * is required to set the same value for all threads/cores).
      */
-    if ( (val & APIC_MODE_MASK) != APIC_DM_FIXED
+    if ( (val & APIC_DM_MASK) != APIC_DM_FIXED
          || (val & APIC_VECTOR_MASK) > 0xf )
         apic_write(APIC_LVTTHMR, val);
 
     if ( (msr_content & (1ULL<<3))
-         && (val & APIC_MODE_MASK) == APIC_DM_SMI )
+         && (val & APIC_DM_MASK) == APIC_DM_SMI )
     {
         if ( c == &boot_cpu_data )
             printk(KERN_DEBUG "Thermal monitoring handled by SMI\n");
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -308,12 +308,12 @@ void vpmu_do_interrupt(void)
 
     vlapic_lvtpc = vlapic_get_reg(vlapic, APIC_LVTPC);
 
-    switch ( GET_APIC_DELIVERY_MODE(vlapic_lvtpc) )
+    switch ( vlapic_lvtpc & APIC_DM_MASK )
     {
-    case APIC_MODE_FIXED:
+    case APIC_DM_FIXED:
         vlapic_set_irq(vlapic, vlapic_lvtpc & APIC_VECTOR_MASK, 0);
         break;
-    case APIC_MODE_NMI:
+    case APIC_DM_NMI:
         sampling->arch.nmi_pending = true;
         break;
     }
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -39,7 +39,7 @@
     (APIC_LVT_MASKED | APIC_SEND_PENDING | APIC_VECTOR_MASK)
 
 #define LINT_MASK   \
-    (LVT_MASK | APIC_MODE_MASK | APIC_INPUT_POLARITY |\
+    (LVT_MASK | APIC_DM_MASK | APIC_INPUT_POLARITY |\
     APIC_LVT_REMOTE_IRR | APIC_LVT_LEVEL_TRIGGER)
 
 static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =
@@ -47,9 +47,9 @@ static const unsigned int vlapic_lvt_mas
      /* LVTT */
      LVT_MASK | APIC_TIMER_MODE_MASK,
      /* LVTTHMR */
-     LVT_MASK | APIC_MODE_MASK,
+     LVT_MASK | APIC_DM_MASK,
      /* LVTPC */
-     LVT_MASK | APIC_MODE_MASK,
+     LVT_MASK | APIC_DM_MASK,
      /* LVT0-1 */
      LINT_MASK, LINT_MASK,
      /* LVTERR */
@@ -260,7 +260,7 @@ static void vlapic_init_sipi_one(struct
 {
     vcpu_pause(target);
 
-    switch ( icr & APIC_MODE_MASK )
+    switch ( icr & APIC_DM_MASK )
     {
     case APIC_DM_INIT: {
         bool fpu_initialised;
@@ -329,7 +329,7 @@ static void vlapic_accept_irq(struct vcp
     struct vlapic *vlapic = vcpu_vlapic(v);
     uint8_t vector = (uint8_t)icr_low;
 
-    switch ( icr_low & APIC_MODE_MASK )
+    switch ( icr_low & APIC_DM_MASK )
     {
     case APIC_DM_FIXED:
     case APIC_DM_LOWEST:
@@ -488,7 +488,7 @@ void vlapic_ipi(
 
     dest = _VLAPIC_ID(vlapic, icr_high);
 
-    switch ( icr_low & APIC_MODE_MASK )
+    switch ( icr_low & APIC_DM_MASK )
     {
     case APIC_DM_INIT:
     case APIC_DM_STARTUP:
@@ -993,7 +993,7 @@ int guest_wrmsr_x2apic(struct vcpu *v, u
     case APIC_LVTTHMR:
     case APIC_LVTPC:
     case APIC_CMCI:
-        if ( val & ~(LVT_MASK | APIC_MODE_MASK) )
+        if ( val & ~(LVT_MASK | APIC_DM_MASK) )
             return X86EMUL_EXCEPTION;
         break;
 
@@ -1017,7 +1017,7 @@ int guest_wrmsr_x2apic(struct vcpu *v, u
         break;
 
     case APIC_ICR:
-        if ( (uint32_t)val & ~(APIC_VECTOR_MASK | APIC_MODE_MASK |
+        if ( (uint32_t)val & ~(APIC_VECTOR_MASK | APIC_DM_MASK |
                                APIC_DEST_MASK | APIC_INT_ASSERT |
                                APIC_INT_LEVELTRIG | APIC_SHORT_MASK) )
             return X86EMUL_EXCEPTION;
@@ -1266,7 +1266,7 @@ static int __vlapic_accept_pic_intr(stru
               redir0.fields.dest_id == VLAPIC_ID(vlapic) &&
               !vlapic_disabled(vlapic)) ||
              /* LAPIC has LVT0 unmasked for ExtInts? */
-             ((lvt0 & (APIC_MODE_MASK|APIC_LVT_MASKED)) == APIC_DM_EXTINT) ||
+             ((lvt0 & (APIC_DM_MASK | APIC_LVT_MASKED)) == APIC_DM_EXTINT) ||
              /* LAPIC is fully disabled? */
              vlapic_hw_disabled(vlapic)));
 }
--- a/xen/arch/x86/include/asm/apicdef.h
+++ b/xen/arch/x86/include/asm/apicdef.h
@@ -68,6 +68,7 @@
 #define			APIC_DEST_MASK		0x00800
 #define			APIC_DEST_LOGICAL	0x00800
 #define			APIC_DEST_PHYSICAL	0x00000
+#define			APIC_DM_MASK		0x00700
 #define			APIC_DM_FIXED		0x00000
 #define			APIC_DM_LOWEST		0x00100
 #define			APIC_DM_SMI		0x00200
@@ -95,12 +96,6 @@
 #define			APIC_LVT_REMOTE_IRR		(1<<14)
 #define			APIC_INPUT_POLARITY		(1<<13)
 #define			APIC_SEND_PENDING		(1<<12)
-#define			APIC_MODE_MASK			0x700
-#define			GET_APIC_DELIVERY_MODE(x)	(((x)>>8)&0x7)
-#define			SET_APIC_DELIVERY_MODE(x,y)	(((x)&~0x700)|((y)<<8))
-#define				APIC_MODE_FIXED		0x0
-#define				APIC_MODE_NMI		0x4
-#define				APIC_MODE_EXTINT	0x7
 #define 	APIC_LVT1	0x360
 #define		APIC_LVTERR	0x370
 #define		APIC_TMICT	0x380
--- a/xen/arch/x86/oprofile/nmi_int.c
+++ b/xen/arch/x86/oprofile/nmi_int.c
@@ -290,7 +290,7 @@ static void cf_check nmi_cpu_stop(void *
 	 * power on apic lvt contain a zero vector nr which are legal only for
 	 * NMI delivery mode. So inhibit apic err before restoring lvtpc
 	 */
-	if ( (apic_read(APIC_LVTPC) & APIC_MODE_MASK) != APIC_DM_NMI
+	if ( (apic_read(APIC_LVTPC) & APIC_DM_MASK) != APIC_DM_NMI
 	     || (apic_read(APIC_LVTPC) & APIC_LVT_MASKED) )
 	{
 		printk("nmi_stop: APIC not good %ul\n", apic_read(APIC_LVTPC));

