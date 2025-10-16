Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B01BE20E1
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 09:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144293.1477736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Ise-0007yv-SA; Thu, 16 Oct 2025 07:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144293.1477736; Thu, 16 Oct 2025 07:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Ise-0007xH-OJ; Thu, 16 Oct 2025 07:58:36 +0000
Received: by outflank-mailman (input) for mailman id 1144293;
 Thu, 16 Oct 2025 07:58:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9Isd-0007pw-Dw
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 07:58:35 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9f70343-aa65-11f0-9d15-b5c5bf9af7f9;
 Thu, 16 Oct 2025 09:58:34 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46e491a5b96so2902115e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 00:58:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57cd11sm33493875f8f.5.2025.10.16.00.58.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 00:58:33 -0700 (PDT)
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
X-Inumbo-ID: e9f70343-aa65-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760601514; x=1761206314; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sbB11aEJPQVIFWe/Qwz6Yn3arLp5D2vKoRWUXi0zgXk=;
        b=gdTT6F/GH9ysGuoCTfpU5SySI1UGHrE5I3Io3PPOJGWeMdu4RS9fhQ9Jdgfl52GcUi
         htPNrHSQX2yxxAE2ij5I/x/NjQz0N2FBYxsxfit6LUwlm6f1cQnIoK/6WP1tpuIQryIZ
         2d0w0TbgTJBTeV5QY1TpcDgKZ/7CzJCU5QNHYIvhQsDosdOJpB0gdBiFqOemvoxPcIl8
         EUbrSwfIX9azEOzyfdhYJNnx7ywOIJCL+iy5VyEceH11DMvXJlwx1h3tZxNdti8Ddse7
         pQq/0sOMT60hD8p1zJVhdqDw+M16AZC6X7FLamVxB0KWWzds8Ul5o8bkO/86vOuJO7cg
         t31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760601514; x=1761206314;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbB11aEJPQVIFWe/Qwz6Yn3arLp5D2vKoRWUXi0zgXk=;
        b=JqCFnb9nMZrajw1vQB2G/vhjnUe2uPyq5GuYzPO6r9daR311rXT0jAbQknM1zrC47X
         LhR+Hg/lFG4AetdLMNCE4vmTNNZJIImda72mH7OnbNrKIk1RyAEAxwyLsjptdUjmGGn1
         fTykQ4sFc6NfjtHwZmHEJaFTQq4jskzova1R6sEprtxWMFaA9QpGgwfltvz2GNmT7fK3
         PY8zZ6GacCUpkGHtewdUbITleD/FZt1aKzV6YwwrdfLBfdDAHMZBXF05p9/CfwDBTlVC
         /HRRgKMvDKwB9dVSLoegjvBYnFS+mZ3cAXHNQrbcSZqBpbrzJX7j80zEwmi6iuJUuZuH
         4jxg==
X-Gm-Message-State: AOJu0YzNLcQjXcUXectP1JWov2b8E3xkNpHrcAkAEsniJFEcY2f0/fhO
	r2SGV95nxuXktykw0KoAVgSsk0tEiH5Se1tZyyIjgpQ5I0rY4mmzq0K975K3ZaJOnVuwwVj7+2s
	yDd0=
X-Gm-Gg: ASbGncuP+fekUZH1maJthZChpVvFuPyBQMz3f1/rNceu3V4Eguk5mRCmi9MfNwuMZiJ
	Z9kdu7XSFEwIyuOuUo6BSGHNZvpOLNwU4ctmLSQ2N/9f4Fj8DRXlPxfo/fYHCHLSlO1z2KoQIwx
	aEpkpNSJEqGExk2DUlvwrCAXSABZn9klhJohVJXxpfVpO5oz9GvNqQhrtj/O7ixzIp6RShJB0pi
	yjmqjk7jAkrVMlvGxdaHjp5cSynTPCg1R2qzfZsK5TQJiJ5V9UfAWmEs8hdtYOPMcyq8v2pNQ11
	gvzldMQjDZejsmE+sVEOF/crOpx7+6c5aMq8d+PhiQtXLog472uxaeITKawGiM4rLUnaMig09Hf
	j9PFhim8oPciwxHTHMfj42dBQ93G+DDT+QvbiIdDgn3M8+O9gY+3WU+LtTJeAS2EgXrjXItC0g4
	sg0Tbjhlq2eNEPEOrnn+Gbtp0xXebmv4HLCJVtjVfSr7C2GrLCt9Jo11jeo1HJPfguDk5TXXo=
X-Google-Smtp-Source: AGHT+IFdXYC5QKb1ISW9s896MV2t+hBdIy1qZz065LRMSvBNv/QmoFeIiweU9cSQGU1e8Qs+0N78vw==
X-Received: by 2002:a05:600c:609b:b0:456:13b6:4b18 with SMTP id 5b1f17b1804b1-46fa9b106cbmr242418445e9.31.1760601513765;
        Thu, 16 Oct 2025 00:58:33 -0700 (PDT)
Message-ID: <6d8046b6-3b1b-425a-80c1-c0d3b9f5d3ba@suse.com>
Date: Thu, 16 Oct 2025 09:58:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/3] x86/vLAPIC: add indirection to LVT handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <amc96@srcf.net>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <37ba42d2-c89a-4c19-a1d8-b4a9c32f677a@suse.com>
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
In-Reply-To: <37ba42d2-c89a-4c19-a1d8-b4a9c32f677a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In preparation to add support for the CMCI LVT, which is discontiguous to
the other LVTs, add a level of indirection. Rename the prior
vlapic_lvt_mask[] while doing so (as subsequently a 2nd array will want
adding, for use by guest_wrmsr_x2apic()).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The new name (lvt_valid[]) reflects its present contents. When re-based on
top of "x86/hvm: vlapic: fix RO bits emulation in LVTx regs", the name
wants to change to lvt_writable[] (or the 2nd array be added right away,
with lvt_valid[] then used by guest_wrmsr_x2apic()). Alternatively the
order of patches may want changing.
---
v2: Check incoming MAXLVT in lapic_check_regs().

--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -32,7 +32,16 @@
 #include <public/hvm/params.h>
 
 #define VLAPIC_VERSION                  0x00050014
-#define VLAPIC_LVT_NUM                  6
+#define LVT_BIAS(reg)                   (((reg) - APIC_LVTT) >> 4)
+
+#define LVTS \
+    LVT(LVTT), LVT(LVTTHMR), LVT(LVTPC), LVT(LVT0), LVT(LVT1), LVT(LVTERR),
+
+static const unsigned int lvt_reg[] = {
+#define LVT(which) APIC_ ## which
+    LVTS
+#undef LVT
+};
 
 #define LVT_MASK \
     (APIC_LVT_MASKED | APIC_SEND_PENDING | APIC_VECTOR_MASK)
@@ -41,20 +50,21 @@
     (LVT_MASK | APIC_DM_MASK | APIC_INPUT_POLARITY |\
     APIC_LVT_REMOTE_IRR | APIC_LVT_LEVEL_TRIGGER)
 
-static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =
+static const unsigned int lvt_valid[] =
 {
-     /* LVTT */
-     LVT_MASK | APIC_TIMER_MODE_MASK,
-     /* LVTTHMR */
-     LVT_MASK | APIC_DM_MASK,
-     /* LVTPC */
-     LVT_MASK | APIC_DM_MASK,
-     /* LVT0-1 */
-     LINT_MASK, LINT_MASK,
-     /* LVTERR */
-     LVT_MASK
+#define LVTT_VALID    (LVT_MASK | APIC_TIMER_MODE_MASK)
+#define LVTTHMR_VALID (LVT_MASK | APIC_DM_MASK)
+#define LVTPC_VALID   (LVT_MASK | APIC_DM_MASK)
+#define LVT0_VALID    LINT_MASK
+#define LVT1_VALID    LINT_MASK
+#define LVTERR_VALID  LVT_MASK
+#define LVT(which)    [LVT_BIAS(APIC_ ## which)] = which ## _VALID
+    LVTS
+#undef LVT
 };
 
+#undef LVTS
+
 #define vlapic_lvtt_period(vlapic)                              \
     ((vlapic_get_reg(vlapic, APIC_LVTT) & APIC_TIMER_MODE_MASK) \
      == APIC_TIMER_MODE_PERIODIC)
@@ -827,16 +837,16 @@ void vlapic_reg_write(struct vcpu *v, un
 
         if ( !(val & APIC_SPIV_APIC_ENABLED) )
         {
-            int i;
+            unsigned int i,
+                nr = GET_APIC_MAXLVT(vlapic_get_reg(vlapic, APIC_LVR)) + 1;
             uint32_t lvt_val;
 
             vlapic->hw.disabled |= VLAPIC_SW_DISABLED;
 
-            for ( i = 0; i < VLAPIC_LVT_NUM; i++ )
+            for ( i = 0; i < nr; i++ )
             {
-                lvt_val = vlapic_get_reg(vlapic, APIC_LVTT + 0x10 * i);
-                vlapic_set_reg(vlapic, APIC_LVTT + 0x10 * i,
-                               lvt_val | APIC_LVT_MASKED);
+                lvt_val = vlapic_get_reg(vlapic, lvt_reg[i]);
+                vlapic_set_reg(vlapic, lvt_reg[i], lvt_val | APIC_LVT_MASKED);
             }
         }
         else
@@ -878,7 +888,7 @@ void vlapic_reg_write(struct vcpu *v, un
     case APIC_LVTERR:       /* LVT Error Reg */
         if ( vlapic_sw_disabled(vlapic) )
             val |= APIC_LVT_MASKED;
-        val &= array_access_nospec(vlapic_lvt_mask, (reg - APIC_LVTT) >> 4);
+        val &= array_access_nospec(lvt_valid, LVT_BIAS(reg));
         vlapic_set_reg(vlapic, reg, val);
         if ( reg == APIC_LVT0 )
         {
@@ -1424,7 +1434,7 @@ bool is_vlapic_lvtpc_enabled(struct vlap
 /* Reset the VLAPIC back to its init state. */
 static void vlapic_do_init(struct vlapic *vlapic)
 {
-    int i;
+    unsigned int i, nr;
 
     if ( !has_vlapic(vlapic_vcpu(vlapic)->domain) )
         return;
@@ -1452,8 +1462,9 @@ static void vlapic_do_init(struct vlapic
 
     vlapic_set_reg(vlapic, APIC_DFR, 0xffffffffU);
 
-    for ( i = 0; i < VLAPIC_LVT_NUM; i++ )
-        vlapic_set_reg(vlapic, APIC_LVTT + 0x10 * i, APIC_LVT_MASKED);
+    nr = GET_APIC_MAXLVT(vlapic_get_reg(vlapic, APIC_LVR)) + 1;
+    for ( i = 0; i < nr; i++ )
+        vlapic_set_reg(vlapic, lvt_reg[i], APIC_LVT_MASKED);
 
     vlapic_set_reg(vlapic, APIC_SPIV, 0xff);
     vlapic->hw.disabled |= VLAPIC_SW_DISABLED;
@@ -1639,13 +1650,23 @@ static int cf_check lapic_check_regs(con
 {
     unsigned int vcpuid = hvm_load_instance(h);
     int rc;
+    const struct hvm_hw_lapic_regs *regs;
 
     if ( (rc = lapic_check_common(d, vcpuid)) )
         return rc;
 
-    if ( !hvm_get_entry(LAPIC_REGS, h) )
+    regs = hvm_get_entry(LAPIC_REGS, h);
+    if ( !regs )
         return -ENODATA;
 
+/* Like vlapic_get_reg(), but without having a struct vlapic instance. */
+#define GET_REG(reg) (*(const uint32_t *)&regs->data[reg])
+
+    if ( GET_APIC_MAXLVT(GET_REG(APIC_LVR)) >= ARRAY_SIZE(lvt_reg) )
+        return -ERANGE;
+
+#undef GET_REG
+
     return 0;
 }
 


