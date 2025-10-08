Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8A4BC4B6B
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 14:09:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139569.1474863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Syp-0002gV-I5; Wed, 08 Oct 2025 12:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139569.1474863; Wed, 08 Oct 2025 12:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Syp-0002dL-F9; Wed, 08 Oct 2025 12:09:15 +0000
Received: by outflank-mailman (input) for mailman id 1139569;
 Wed, 08 Oct 2025 12:09:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6Syn-0002bG-Ds
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 12:09:13 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99a9cd10-a43f-11f0-9d15-b5c5bf9af7f9;
 Wed, 08 Oct 2025 14:09:11 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b00a9989633so197913466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 05:09:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865e77427sm1676283666b.36.2025.10.08.05.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 05:09:10 -0700 (PDT)
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
X-Inumbo-ID: 99a9cd10-a43f-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759925351; x=1760530151; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CQHd4wEwIxA8EYq1sK1nmKSywNrw8V/zyA8SKDYD/Wo=;
        b=YTU3PE16B/gcJdYuuK9z3GD37TRbfnh0L6w3ZbfD4xAGf6PE5yyzAHPLfpqGKeZVir
         MApJW8wg26hBtYX9R6Olwff6Je0J1vYJ/HnXbwd11pEEqGPnXngEW1bTypP1rpV4tXQu
         nJAC+6MUsD/zLHTvZlB0UK/jT+eoci1oV695sJQQY3tR1gG6u0lAEDh/6HFAJE1Y8LSI
         RgTGHulfpVYDegksEdFOTnj8uB1pTZZXExMQs3st9QiRCBywdYcWFRAb8SLQfDUWX6my
         297Z2vQY3N+yD7WnTvDiza2XTXBIffcNW2brZHNbH8xzmGAuT+3votZZsqReNEXk218U
         UeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759925351; x=1760530151;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQHd4wEwIxA8EYq1sK1nmKSywNrw8V/zyA8SKDYD/Wo=;
        b=ucRrJX54wXHmhUzyS4dnHtQBtk0tecW+8r7o9wfBQyH6sUZQxWbtHM9QusN0z86Pon
         tUf7Ch6v+YlN6eLq4TPG/+UoIqfAiZgTLo5/66UY3LBMNfevav+NW0F65rBICvPuJsdt
         YbekG/sEESYMsl4w0asxEmvg/AWtPrJxYfz7L3jg2i3uKxn6qtliBFQ93OVC9Z//Oedx
         2TVONwLNm6aNXmD+2Kr4mLA8PKPf7e0fnNRx7aLRDVKudTTKx5fZlBH9So7OeY3vGlhW
         kp0gLnDld0hqELtfZygCx3mA9XERHA651ZSO5aroa3IEc/qPVLGmhCx6FhDkDUEVwosq
         jWQg==
X-Gm-Message-State: AOJu0YwLI4PpF3ec4e6OUe7tdgx0Wvo36g4IHEux2aakkqqTPPX4S4ZI
	AAHYLX8XcqqVGhOaCoj2uZNYtNRuml+Dpq97AzglgfG+1Md1yJgSKU6Thdj3kIbJDFvZZ1dpOjQ
	ofW0=
X-Gm-Gg: ASbGnctvkzrmHnTFe+JFbB9nGnNR2RNuEgsIlga75wTNCyjPSPkylHQF596fks7rUmp
	0T43eD9FuqGGZEAwD1V59sGQeoFPodtybZhrJlJLfX2Xt1AJTa1ea2NGmemVbfJjiDsOPv2FFtI
	hbWXGXYpT3Y+NbBAN1Gk3ct5UFk7XjldfyHSsAt8viIks+wC4nSv3ENo8JrHBYR2gPRf0Z9Gb+9
	ruNtxnicc6LPKoC40HcOTr0Sh8NS+HFN8tT7f11M5mU/n30WcOXkdJNW/zY/TJbuZ6YA/9AvB9s
	hQ1CdVbsRzi1In+o2D2BxG4P2xHBaUKlCDv7IXqy9HM+xN1FG2repyEKC2CSN5KF1TPC8e0faOy
	vDxGv3jS4iB6SpDrcgaloDztIVTZu29A+HayiboeDIk4R+6yKbFytYPUjU9sKX+SDd8bW5oIcv3
	tIPAuO1x6y04F0Z6SaQTzvyYaIqA4iU3O6OETr6HI+LeQxhRB864AT
X-Google-Smtp-Source: AGHT+IG/VHcpXFHzeG3ksNVlQZOSZbHxOxDrGTGVv0cOatI8eGJa71rRnB4Ut3F74ldeiTGMSIXLyA==
X-Received: by 2002:a17:907:94c8:b0:b38:49a6:5839 with SMTP id a640c23a62f3a-b50bd050fe3mr387928266b.11.1759925351117;
        Wed, 08 Oct 2025 05:09:11 -0700 (PDT)
Message-ID: <61a05ec1-aca7-4c3f-be6f-1bb053b2cd00@suse.com>
Date: Wed, 8 Oct 2025 14:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.21??? 3/3] x86/vLAPIC: properly support the CMCI LVT
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

Rather than unconditionally accepting reads and writes while discarding
the value written, make accesses properly conditional upon CMCI being
exposed via MCG_CAP, and arrange to actually retain the value written.
Also reflect the extra LVT in LVR.

Note that this doesn't change the status quo of us never delivering any
interrupt through this LVT.

Fixes: 70173dbb9948 ("x86/HVM: fix miscellaneous aspects of x2APIC emulation")
Fixes: 8d0a20587e4e ("x86/hvm: further restrict access to x2apic MSRs")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The Fixes: tags are referencing where the explicit mentioning of APIC_CMCI
in what are now guest_{rd,wr}msr_x2apic() was introduced; the mis-handling
really pre-dates that, though.

In principle the later assignment to "nr" in vlapic_do_init() could now be
dropped again. I wasn't quite sure though whether that's a good idea.

--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -31,10 +31,13 @@
 #include <public/hvm/ioreq.h>
 #include <public/hvm/params.h>
 
-#define LVT_BIAS(reg)                   (((reg) - APIC_LVTT) >> 4)
+#include <../cpu/mcheck/x86_mca.h> /* MCG_CMCI_P */
+
+#define LVT_BIAS(reg)                   (((reg) - APIC_CMCI) >> 4)
 
 #define LVTS \
-    LVT(LVTT), LVT(LVTTHMR), LVT(LVTPC), LVT(LVT0), LVT(LVT1), LVT(LVTERR),
+    LVT(LVTT), LVT(LVTTHMR), LVT(LVTPC), LVT(LVT0), LVT(LVT1), LVT(LVTERR), \
+    LVT(CMCI),
 
 static const unsigned int lvt_reg[] = {
 #define LVT(which) APIC_ ## which
@@ -57,6 +60,7 @@ static const unsigned int lvt_valid[] =
 #define LVT0_VALID    LINT_MASK
 #define LVT1_VALID    LINT_MASK
 #define LVTERR_VALID  LVT_MASK
+#define CMCI_VALID    (LVT_MASK | APIC_DM_MASK)
 #define LVT(which)    [LVT_BIAS(APIC_ ## which)] = which ## _VALID
     LVTS
 #undef LVT
@@ -697,8 +701,17 @@ int guest_rdmsr_x2apic(const struct vcpu
         return X86EMUL_EXCEPTION;
 
     offset = reg << 4;
-    if ( offset == APIC_ICR )
+    switch ( offset )
+    {
+    case APIC_ICR:
         high = (uint64_t)vlapic_read_aligned(vlapic, APIC_ICR2) << 32;
+        break;
+
+    case APIC_CMCI:
+        if ( !(v->arch.vmce.mcg_cap & MCG_CMCI_P) )
+            return X86EMUL_EXCEPTION;
+        break;
+    }
 
     *val = high | vlapic_read_aligned(vlapic, offset);
 
@@ -868,6 +881,10 @@ void vlapic_reg_write(struct vcpu *v, un
         vlapic_set_reg(vlapic, APIC_ICR2, val & 0xff000000U);
         break;
 
+    case APIC_CMCI:         /* LVT CMCI */
+        if ( !(v->arch.vmce.mcg_cap & MCG_CMCI_P) )
+            break;
+        fallthrough;
     case APIC_LVTT:         /* LVT Timer Reg */
         if ( vlapic_lvtt_tdt(vlapic) !=
              ((val & APIC_TIMER_MODE_MASK) == APIC_TIMER_MODE_TSC_DEADLINE) )
@@ -1024,9 +1041,12 @@ int guest_wrmsr_x2apic(struct vcpu *v, u
             return X86EMUL_EXCEPTION;
         break;
 
+    case APIC_CMCI:
+        if ( !(v->arch.vmce.mcg_cap & MCG_CMCI_P) )
+            return X86EMUL_EXCEPTION;
+        fallthrough;
     case APIC_LVTTHMR:
     case APIC_LVTPC:
-    case APIC_CMCI:
         if ( val & ~(LVT_MASK | APIC_DM_MASK) )
             return X86EMUL_EXCEPTION;
         break;
@@ -1438,7 +1458,9 @@ static void vlapic_do_init(struct vlapic
     if ( !has_vlapic(vlapic_vcpu(vlapic)->domain) )
         return;
 
-    vlapic_set_reg(vlapic, APIC_LVR, 0x00050014);
+    nr = 6 + !!(vlapic_vcpu(vlapic)->arch.vmce.mcg_cap & MCG_CMCI_P);
+    vlapic_set_reg(vlapic, APIC_LVR,
+                   0x00000014 | MASK_INSR(nr - 1, APIC_LVR_MAXLVT_MASK));
 
     for ( i = 0; i < 8; i++ )
     {
--- a/xen/arch/x86/include/asm/apicdef.h
+++ b/xen/arch/x86/include/asm/apicdef.h
@@ -15,7 +15,10 @@
 #define			GET_xAPIC_ID(x)		(((x)>>24)&0xFFu)
 #define			SET_xAPIC_ID(x)		(((x)<<24))
 #define		APIC_LVR	0x30
-#define			APIC_LVR_MASK		0xFF00FF
+#define			APIC_LVR_VERSION_MASK	0xff
+#define			APIC_LVR_MAXLVT_MASK	0xff0000
+#define			APIC_LVR_MASK		(APIC_LVR_VERSION_MASK | \
+						 APIC_LVR_MAXLVT_MASK)
 #define			APIC_LVR_DIRECTED_EOI	(1 << 24)
 #define			GET_APIC_VERSION(x)	((x)&0xFF)
 #define			GET_APIC_MAXLVT(x)	(((x)>>16)&0xFF)


