Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFF9933D17
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 14:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759963.1169672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU3xs-0001Gi-Qb; Wed, 17 Jul 2024 12:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759963.1169672; Wed, 17 Jul 2024 12:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU3xs-0001F5-N3; Wed, 17 Jul 2024 12:41:00 +0000
Received: by outflank-mailman (input) for mailman id 759963;
 Wed, 17 Jul 2024 12:40:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sU3xr-0001Ew-2n
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 12:40:59 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d055f3e2-4439-11ef-8776-851b0ebba9a2;
 Wed, 17 Jul 2024 14:40:57 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2eefc3d707dso8013711fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2024 05:40:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc38a81sm74556835ad.220.2024.07.17.05.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 05:40:56 -0700 (PDT)
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
X-Inumbo-ID: d055f3e2-4439-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721220057; x=1721824857; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+J5galAPvN30KZAhGbbh4LLw0KDTaLZXX/dCHmJWxQ=;
        b=I0B8NxQ4MoTwq+EFush7gAZ7UOBxxz7nTqTq9yOuku4j5kx92uWCyL2IOak8YfP4IQ
         zy4Mm2APnqw3vVHEIRaif5WWvSlgHF/on8xDkQzfaUf8sQbM2xZXyqzhSvUAgCiyOztH
         yRbJ+CM43L12etZsy9nwsxJ/YZfDwvxqy9n10+U06YHnHHd22f+Qz0AD4ffjAEmN8fbp
         5apG/BBfbE4O5af3ec+3BuVAEoAHxkuJa7yb0pgNJVaMCT+rzLoPBG78GjyhBW+xYDzm
         0b4eo5JErENGSk1L5ogDo2EFg0FE1/HsZ06C3wtPfb1rq90pIrYxpZFcF2Kj4Me+MVeC
         4JBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721220057; x=1721824857;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N+J5galAPvN30KZAhGbbh4LLw0KDTaLZXX/dCHmJWxQ=;
        b=T2IGMeUQE/QRkW8aNt2O4AKedPX7moouDIeACe8muhB5Rfm09zTpKOjC4WYAEeOZmp
         c05kNEzK5CWPKaw1LsrlrVpnK06krlmeLr72G1mn8lT04eHhxih05ee1k18MRAuv3H9c
         z7Gog7LtnbR1oo0eVVmMXrSxaMF423A/1kVq3DTgEIgEgxrcfgyrKDWYzDx0fIRPaKJc
         ocrbAlny3sjEA8ZQwqUFZEYr4kKED/RJAzpevu7W5uymR/cb5MuAkM+sK09s2PJSqcRN
         LL/W/93MkTusFmcwfbgqBHyCtrqc0G+/tZ+SIhfpQzv0TI67xv6C05gR0sBzkYS+cysK
         EstA==
X-Gm-Message-State: AOJu0YxKpT8PiXZdaKfM2ahvX2uRe/Nxa5CI/bwOrgse44SVMMx+5zeK
	0BFymxwqDpaGosCW0UFkJVwDPFGZ0FRWjOZ7EjqM2iN3KHr0DIps5Z/w+yvjOB6fcmWSrPc60qA
	=
X-Google-Smtp-Source: AGHT+IF4B8EKrmpErbu/EmQHHbnV//awrvsTvS4QHLdCljIWoEQrEpYrDI7D7uSUEYHgKgOuc0kzQA==
X-Received: by 2002:a05:651c:485:b0:2ee:6cda:637b with SMTP id 38308e7fff4ca-2eefd13e581mr10627711fa.35.1721220056596;
        Wed, 17 Jul 2024 05:40:56 -0700 (PDT)
Message-ID: <16b45b39-aadd-4a53-bcb9-214ded193db9@suse.com>
Date: Wed, 17 Jul 2024 14:40:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: drop REX64_PREFIX
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

While we didn't copy the full Linux commentary, Linux commit
7180d4fb8308 ("x86_64: Fix 64bit FXSAVE encoding") is quite explicit
about gas 2.16 supporting FXSAVEQ / FXRSTORQ. As that's presently our
minimal required version, we can drop the workaround that was needed for
yet for older gas.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -64,13 +64,12 @@ static inline void fpu_fxrstor(struct vc
     {
     default:
         asm volatile (
-            /* See below for why the operands/constraints are this way. */
-            "1: " REX64_PREFIX "fxrstor (%2)\n"
+            "1: fxrstorq %0\n"
             ".section .fixup,\"ax\"   \n"
             "2: push %%"__OP"ax       \n"
             "   push %%"__OP"cx       \n"
             "   push %%"__OP"di       \n"
-            "   mov  %2,%%"__OP"di    \n"
+            "   lea  %0,%%"__OP"di    \n"
             "   mov  %1,%%ecx         \n"
             "   xor  %%eax,%%eax      \n"
             "   rep ; stosl           \n"
@@ -81,7 +80,7 @@ static inline void fpu_fxrstor(struct vc
             ".previous                \n"
             _ASM_EXTABLE(1b, 2b)
             :
-            : "m" (*fpu_ctxt), "i" (sizeof(*fpu_ctxt) / 4), "R" (fpu_ctxt) );
+            : "m" (*fpu_ctxt), "i" (sizeof(*fpu_ctxt) / 4) );
         break;
     case 4: case 2:
         asm volatile (
@@ -157,13 +156,7 @@ static inline void fpu_fxsave(struct vcp
 
     if ( fip_width != 4 )
     {
-        /*
-         * The only way to force fxsaveq on a wide range of gas versions.
-         * On older versions the rex64 prefix works only if we force an
-         * addressing mode that doesn't require extended registers.
-         */
-        asm volatile ( REX64_PREFIX "fxsave (%1)"
-                       : "=m" (*fpu_ctxt) : "R" (fpu_ctxt) );
+        asm volatile ( "fxsaveq %0" : "=m" (*fpu_ctxt) );
 
         /*
          * Some CPUs don't save/restore FDP/FIP/FOP unless an exception is
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -331,14 +331,6 @@ static always_inline void stac(void)
 #define safe_swapgs                             \
         "mfence; swapgs;"
 
-#ifdef __sun__
-#define REX64_PREFIX "rex64\\"
-#elif defined(__clang__)
-#define REX64_PREFIX ".byte 0x48; "
-#else
-#define REX64_PREFIX "rex64/"
-#endif
-
 #define ELFNOTE(name, type, desc)           \
     .pushsection .note.name, "a", @note   ; \
     .p2align 2                            ; \

