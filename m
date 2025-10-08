Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA6EBC4B65
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 14:08:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139551.1474844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Sy8-0001l7-3t; Wed, 08 Oct 2025 12:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139551.1474844; Wed, 08 Oct 2025 12:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Sy8-0001id-0o; Wed, 08 Oct 2025 12:08:32 +0000
Received: by outflank-mailman (input) for mailman id 1139551;
 Wed, 08 Oct 2025 12:08:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6Sy6-0001EV-24
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 12:08:30 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fc15333-a43f-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 14:08:28 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b457d93c155so1272291466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 05:08:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865e77427sm1676137266b.36.2025.10.08.05.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 05:08:27 -0700 (PDT)
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
X-Inumbo-ID: 7fc15333-a43f-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759925308; x=1760530108; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gZjlRJwLlrRPLiu1WIOHZJ9ycvL7/UqQ6qGKn5cCsGY=;
        b=Z2UpPqHSsvvUUsZutNi8vmsvducl6tmNXjibooAQX6ZHepSLAphyeIc0rga9cpj3ML
         WKige4O8IgORFlniTiNWnHGL2um1BJFjMmFcYf1i9rBOeI74J/p7sG2L+E270tBBAkzJ
         0A5TexrjhU57Oc/FKrVN5k/9Vz/J+qHyXvPkPPwDrMa6ppQ7N7Sr3hSIVWNIPAyQl9mk
         KEuACnWrkTaTawpwJ+V2e/0krL3tkktQZBhVyw4ZaX8HDHsQfOf6IxYUmrUH6wZ9R3/q
         4Vh1wfNWTQ3l1OaBnTPtNhKnTC6iiBbGk+ff1NSBnkJJBjmp3jZCvk7op/PW1539/oVs
         QVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759925308; x=1760530108;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZjlRJwLlrRPLiu1WIOHZJ9ycvL7/UqQ6qGKn5cCsGY=;
        b=qmcqII/9UJXZi+1Wi1/hJEWkLkfRF0hmhDERjEv96hEWqpb7bw/oHUv0L0A+FYpt7Z
         8uAmOJ3EoByJIPi0igvLWEm2MAYKFJC/pX1foEwdDWZVdnmACf0u+bFHccHJUHxcc71W
         gzPUdUVGRcZrya4YKQbeaxKP0cqNdzE1uspJHketUoKW4DXt9HvXavltOHX5gzM75IL9
         LBRAwbXkiMydbRIxdMNKj50Uk4zjYjotyQt8r2M83mJ7BLyPqpNi2MuIMxReFUTCkw2j
         5Dn2nzgBDyYISewCuPdEDqYAtP0YqcGSY7loIqXEVCtQ1/HJ6NxBelz/tEHrexhxikVa
         xVvg==
X-Gm-Message-State: AOJu0YzEF31xXX0Usw2+b30w5H6XRVG3HBJhKay4XVvLrWL0y9y0LwTI
	OCLy23wdxzcTTtc4dB3uwuj0Frph17uvI3X4aPNrHn+TjH6awk2pSuM2aGh2wpMnsKvNBZMdPWS
	zeoA=
X-Gm-Gg: ASbGncsmaj6yxM/YzBkBcq7hPUFQNYvkmDHcsPVOXKJDLux+JqA4lgfjMVGJltWhqps
	xszMc382UsYLPOLLe1I/CVCUZLNQTuULgHuQHZu5WOcU2hEkNzwsL6BFwoQ3emRLfYpEXAUy530
	VV5YG5bx+N4r3w6+VHE/jVG0xVeyfCA1L7FtckSwQpTmsKfWZfuDsNOujm5qNTDCIZ1eaYARTct
	8QK5k9ZOW4FkSgHk7J5U0fhgTPcw2jK9lQD2IwQ+r01iP3eHzx9w+WReI2ME0/PCg1ekSm6a6/9
	cefuaKX7kWwRAPeFNW7Po1nfE6etHjZmmShzsEksbdj5YxHuvoSJ30X0H7Ywz2DGK8XwTwW5TEX
	WS/LEJZ14XqD5bPRZUXf3iK8YeVLOtJpWtkdjT9vdWfc2HhtrMwLGAzBIdx9cnQTeukCoeWpCsg
	JjSy+H4iAtdieeJtC776X3ZeIetf6/I/3KVFBlaFKTXA==
X-Google-Smtp-Source: AGHT+IE4NQw1Jk4ost3GEY9bA/vFz/fclR1v3g3cH2l/PDpkpPu1ZHF6xt4f1f+tZk0kam7q6B5SVg==
X-Received: by 2002:a17:907:80a:b0:b48:6b19:e65c with SMTP id a640c23a62f3a-b50aba9d735mr342606566b.42.1759925307688;
        Wed, 08 Oct 2025 05:08:27 -0700 (PDT)
Message-ID: <dd6b46f8-76f7-46d3-b3be-083b58781f32@suse.com>
Date: Wed, 8 Oct 2025 14:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.21??? 1/3] x86/vLAPIC: add indirection to LVT handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <amc96@srcf.net>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>, Grygorii Strashko <grygorii_strashko@epam.com>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
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
In-Reply-To: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
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


