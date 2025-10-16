Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46878BE20EA
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 09:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144311.1477755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9ItD-0000Xy-GW; Thu, 16 Oct 2025 07:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144311.1477755; Thu, 16 Oct 2025 07:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9ItD-0000VC-DW; Thu, 16 Oct 2025 07:59:11 +0000
Received: by outflank-mailman (input) for mailman id 1144311;
 Thu, 16 Oct 2025 07:59:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9ItB-0007pw-Ma
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 07:59:09 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe7bd6d2-aa65-11f0-9d15-b5c5bf9af7f9;
 Thu, 16 Oct 2025 09:59:08 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47114a40161so1689375e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 00:59:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711442d9e8sm10793715e9.7.2025.10.16.00.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 00:59:07 -0700 (PDT)
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
X-Inumbo-ID: fe7bd6d2-aa65-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760601548; x=1761206348; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mDniou9WYZld/SO0uxKyVzlKGg8gcbQ1JbEW9khtE74=;
        b=W1xaO/clhiI+Wd3YSoVzR8GViJVe+QK0F2P9YE21bblm0j5wlX/Wt5i9mtO/yHEZWX
         rmmsdCX4VGsesUB33OCzitlJrlo8lSwhikfAYCmDF0EVIxlk7fx7Yqg85NM+eTBdPXj0
         80DbpQx0YD3aD/LZ+a81+wqCihf+QWMtmylSv5TCXznjLvowF+1Ng3Ky+duNc7PhjYJ7
         2ajWhipyznZS0QnzrnXpwo/jkF4v6SmjdcLpjargbsyx/d2m2UlA4gRQxpM7WMBceGLB
         GtGpwr7FIX8270m3yw9JLmJy01gJ3DiFPagVQy3QSHAIkydssld9wel6t7qeAUOrJeAu
         azkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760601548; x=1761206348;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDniou9WYZld/SO0uxKyVzlKGg8gcbQ1JbEW9khtE74=;
        b=Z4Wdb4PYe6xe38953xVTpLAHr8Xy4plNj9ouU6NREWN7yoe4fD9brkSQaN45A0qZKk
         CIomi+T9n560ON+WUgijEe2QEJqK9l7pxvfla1or1RYzmZvC8kvVsOgNz9dlPz+fd+LP
         w6KYkt5oQm89Ygc1Cv274za0fWJy3SW7g+n1gVPtSiJh8qx7FiqncGJO8AKrI1ayGQDe
         sOtSC9hX6AR3aF0WTFB6uDfoxf4J+K7j4jcq7F85WcVyYnAN/LCiPqHpWk/nJkQMInLf
         2VpVUHJgDvpcKW0WX7+KOc1bsbfQYglbnlKDMX6jhqj1riCnuvQOQxm9kgeztOViPryH
         ASag==
X-Gm-Message-State: AOJu0Yzn3Z6n1uqvgI6uQRqhQjN8ocxfvVYn+C7vmygyaUCRtIb13lZJ
	I5ICrOicznp/rPUD7PcNz5JQ2+A7z/rFKL1LACv/7PJuDKl3oYfwXcuiwq3d3vM2p7iQUlINx8h
	oGiU=
X-Gm-Gg: ASbGncujSgfXqY+5ouAt5Fx90XgMuwj9MrWI/KDfYq1AsWcHktfdMwLUU8k9ktfOf4s
	LgSZLVsGVjLfRGD0VuLfJm6kXSMTJSFX1GYyflTfMeQfrJSsWv11pELOoTZRzEjPf6vmzgWQl11
	+ipAE+6wp/O+UtA2HngVBXAsL/CCcOL9eAeG6Hl1KA0VSP/UAvphd3IalULGvcdBYu7AkH9geiO
	vKZ6nrZHld7RHabGrsJvCX7wk1k7DIX909Tc37tKfLRC67FAY9JFleVdwizs1TGrAYAmWOplGep
	BzX9VtIr3dr+SdyvKr5fd9OErhgx+j0niS6UUz2tOruHY4PzqAIBOhpnic2Lwf4lUO7ZADnQonK
	VDs7GRClKVzKkL05ijdv81Vo/k/FpLnVB0BEv0kxtJhtQNQh2UC110sRa/OGQoKabkFCQkXVnM1
	w0Kjm71LIYuatThBFMVNIUiZ+ki9EGNmPGV5wcambgj06ZTs4fsvWPFwSU5xXE
X-Google-Smtp-Source: AGHT+IGY7JyWdhKpgajqR9Tbd8baVb8qFGtetsoqLljI1e5CZifGPT8r4QF8+bS7K8lmPVKC4Ks1NQ==
X-Received: by 2002:a05:600d:41c4:b0:471:7a:7905 with SMTP id 5b1f17b1804b1-471007a7a8bmr46415245e9.34.1760601548125;
        Thu, 16 Oct 2025 00:59:08 -0700 (PDT)
Message-ID: <22e7ed27-0bd3-4735-aa2f-f3b31b5a03e4@suse.com>
Date: Thu, 16 Oct 2025 09:59:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/3] x86/vLAPIC: properly support the CMCI LVT
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
---
v2: Introduce vlapic_has_cmci(). Re-base over change to earlier patch.

--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -31,10 +31,19 @@
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
+
+enum {
+#define LVT(which) VLAPIC_LVT_ ## which
+    LVTS
+#undef LVT
+};
 
 static const unsigned int lvt_reg[] = {
 #define LVT(which) APIC_ ## which
@@ -57,6 +66,7 @@ static const unsigned int lvt_valid[] =
 #define LVT0_VALID    LINT_MASK
 #define LVT1_VALID    LINT_MASK
 #define LVTERR_VALID  LVT_MASK
+#define CMCI_VALID    (LVT_MASK | APIC_DM_MASK)
 #define LVT(which)    [LVT_BIAS(APIC_ ## which)] = which ## _VALID
     LVTS
 #undef LVT
@@ -78,6 +88,11 @@ static const unsigned int lvt_valid[] =
 
 static void vlapic_do_init(struct vlapic *vlapic);
 
+static bool vlapic_has_cmci(const struct vlapic *vlapic)
+{
+    return GET_APIC_MAXLVT(vlapic_get_reg(vlapic, APIC_LVR)) >= VLAPIC_LVT_CMCI;
+}
+
 static int vlapic_find_highest_vector(const void *bitmap)
 {
     const uint32_t *word = bitmap;
@@ -697,8 +712,17 @@ int guest_rdmsr_x2apic(const struct vcpu
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
+        if ( !vlapic_has_cmci(vlapic) )
+            return X86EMUL_EXCEPTION;
+        break;
+    }
 
     *val = high | vlapic_read_aligned(vlapic, offset);
 
@@ -868,6 +892,10 @@ void vlapic_reg_write(struct vcpu *v, un
         vlapic_set_reg(vlapic, APIC_ICR2, val & 0xff000000U);
         break;
 
+    case APIC_CMCI:         /* LVT CMCI */
+        if ( !vlapic_has_cmci(vlapic) )
+            break;
+        fallthrough;
     case APIC_LVTT:         /* LVT Timer Reg */
         if ( vlapic_lvtt_tdt(vlapic) !=
              ((val & APIC_TIMER_MODE_MASK) == APIC_TIMER_MODE_TSC_DEADLINE) )
@@ -1024,9 +1052,12 @@ int guest_wrmsr_x2apic(struct vcpu *v, u
             return X86EMUL_EXCEPTION;
         break;
 
+    case APIC_CMCI:
+        if ( !vlapic_has_cmci(vlapic) )
+            return X86EMUL_EXCEPTION;
+        fallthrough;
     case APIC_LVTTHMR:
     case APIC_LVTPC:
-    case APIC_CMCI:
         if ( val & ~(LVT_MASK | APIC_DM_MASK) )
             return X86EMUL_EXCEPTION;
         break;
@@ -1438,9 +1469,11 @@ static void vlapic_do_init(struct vlapic
     if ( !has_vlapic(vlapic_vcpu(vlapic)->domain) )
         return;
 
+    nr = ARRAY_SIZE(lvt_reg) -
+         !(vlapic_vcpu(vlapic)->arch.vmce.mcg_cap & MCG_CMCI_P);
     vlapic_set_reg(vlapic, APIC_LVR,
                    MASK_INSR(0x14, APIC_LVR_VERSION_MASK) |
-                   MASK_INSR(ARRAY_SIZE(lvt_reg) - 1, APIC_LVR_MAXLVT_MASK));
+                   MASK_INSR(nr - 1, APIC_LVR_MAXLVT_MASK));
 
     for ( i = 0; i < 8; i++ )
     {


