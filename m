Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB58AA0554
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 10:17:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971639.1360000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9g9I-0006ud-BY; Tue, 29 Apr 2025 08:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971639.1360000; Tue, 29 Apr 2025 08:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9g9I-0006rq-8E; Tue, 29 Apr 2025 08:17:04 +0000
Received: by outflank-mailman (input) for mailman id 971639;
 Tue, 29 Apr 2025 08:17:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9g9G-0006rX-9g
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 08:17:02 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52d0fb49-24d2-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 10:17:00 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5ed43460d6bso8427855a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 01:17:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7016f48ebsm7030399a12.33.2025.04.29.01.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 01:16:59 -0700 (PDT)
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
X-Inumbo-ID: 52d0fb49-24d2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745914619; x=1746519419; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JN7/LYznS6CrtVaGt2tE6QAB/n2kbSOMLlSYtCS/Q8=;
        b=SzaHXM0Les0xbn8xjfiXQm0j5lSeheU1DVOcteQh62MbEuFkgxAymBvFD/O/0WJyzo
         3fYo5sziDlK0WwgzAngr/DizAtQT7amJahni03ODJc7iZWsyXAXLtaiEwg/4mBSsbTgG
         74FEVpSmKDBVDFwwlYLZrgWh3IkbUHEH9u5zDCuh9QW53eKXEW4l3vPj1q3HlJjovxOY
         KI80jpPKaUZBnfxe/ZUqorM+4WdycXmbS2l117S+cp2F/C5gu7OAr69YZOUZWSAgHyR4
         xnjzJN40S0gZ4upRVB5PQvRnJFOfekgKCUWr6xG0eHOdguzQjAi76HaUMqF2+5C/qg4q
         A4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745914619; x=1746519419;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7JN7/LYznS6CrtVaGt2tE6QAB/n2kbSOMLlSYtCS/Q8=;
        b=vAArBGL8tNSIhS0peeB4etPzDGODaFDe/GGdynVUKrp/Uxq9UW052U1AVAZMuq8nE4
         UgJxxejZnSCEaPel0kgNLg75lwa6Hh+6wgpLAsmf9XQoASsN4wEwC0MmmOYBGdE62p4t
         mJJV1Zaq9PV0+fELr22OZRohsSRiGkddj/qCgAITkvoyV8pVqxricaLjQWsS/MgF4rHd
         H7O0wBqhqUs69nzWjVCV64uaEBj9cCF+eiH5lb6lWXURMayGS2FKUO6gpUhTD9Ofhws0
         JosyEZQU00E7xdxV0EmiEcQV7F6C5Q17HschxfQ1JrJ+xf63wuCFN6fNxvrOqMnl73j3
         i9pA==
X-Gm-Message-State: AOJu0YxFuV/a5wSu7q5KRy0ilhRv1a4X+SI34N6HQACZHqrQSaOqKkIM
	ZC9LXphBtwbaxzdf68Q9KH+Q9Qai/XeAYeNPY+B33QDRRi+nZoV8mM2ciOaDzeK/XoFs+hpKAJg
	=
X-Gm-Gg: ASbGncsWWe0ClYRpPMxVd9pbWB9pjT1ckHNEYzhtZnH9R83qSyV/D2ABwgKQ23YP6oh
	DeqATSC9oDIdfQF4ETzTbE6AcVaUQ5l5D+Od8V9M15wWcnoaX+NPCnN4K6IJ2iGAQO40JHZu25Y
	Ts3AkPKkCF4D+S7NO/5zIFejM1TJ/qGkWEdrCt9hXqJ+Kqc1oglpDGJDKx55BUWGDKkuCEonJXs
	JDG0M3GLsvvYSxjAw/AMI/hNuwS7KkDRcqoXyAJqSP9+YyAIYDRhFN3XbTF50Dhxl4ahZk4ji7P
	4KK52lHX+SbDx7VIgx69BLXtHBo3EzFG2TkN8MbEVynNJIrEdZQE9r+6LyBGno3xUvx2DmgX+0J
	8rfBGwEkq6jTqWPKte6W8EX3IXQ==
X-Google-Smtp-Source: AGHT+IEts6C4Iyl7Vwm7umpTqRyz1Fr2E2/06rGtVFHI/Vhlt8F2sRVEwUAMvEQ221jbPIPlICVaeg==
X-Received: by 2002:a05:6402:40d1:b0:5e5:b388:29f9 with SMTP id 4fb4d7f45d1cf-5f83809e247mr2234161a12.5.1745914619530;
        Tue, 29 Apr 2025 01:16:59 -0700 (PDT)
Message-ID: <5020c491-2037-4955-99ce-e6ba02b44aef@suse.com>
Date: Tue, 29 Apr 2025 10:16:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] {hyper,multi}call: further limit arguments to just 5
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

Multicall compat translation and hypercall continuation handling can
also be shrunk to the processing of just (up to) 5 arguments.

Take the opportunity to
- make exceeding the limit noisy in hypercall_create_continuation(),
- use speculation-safe array access in hypercall_create_continuation(),
- avoid a Misra C:2012 Rule 19.1 violation in xlat_multicall_entry(),
- further tidy xlat_multicall_entry() and __trace_multicall_call()
  style-wise.

Amends: 2f531c122e95 ("x86: limit number of hypercall parameters to 5")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
hypercall_xlat_continuation() uses BUG() when encountering too large an
argument count in release builds, but I think that's too harsh. Hence in
hypercall_create_continuation() I'm re-using the existing error path.
Interestingly the multicall part of hypercall_xlat_continuation() has no
check at all which would cover release builds.

With gcc14 code size grows according to my observation, due to the loops
in xlat_multicall_entry() and __trace_multicall_call() both being
unrolled now.

--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -392,7 +392,11 @@ unsigned long hypercall_create_continuat
     if ( mcs->flags & MCSF_in_multicall )
     {
         for ( i = 0; *p != '\0'; i++ )
-            mcs->call.args[i] = NEXT_ARG(p, args);
+        {
+            if ( i >= ARRAY_SIZE(mcs->call.args) )
+                goto bad_fmt;
+            array_access_nospec(mcs->call.args, i) = NEXT_ARG(p, args);
+        }
 
         /* Return value gets written back to mcs->call.result */
         rc = mcs->call.result;
@@ -417,7 +421,7 @@ unsigned long hypercall_create_continuat
                 case 2: regs->x2 = arg; break;
                 case 3: regs->x3 = arg; break;
                 case 4: regs->x4 = arg; break;
-                case 5: regs->x5 = arg; break;
+                default: goto bad_fmt;
                 }
             }
 
@@ -440,7 +444,7 @@ unsigned long hypercall_create_continuat
                 case 2: regs->r2 = arg; break;
                 case 3: regs->r3 = arg; break;
                 case 4: regs->r4 = arg; break;
-                case 5: regs->r5 = arg; break;
+                default: goto bad_fmt;
                 }
             }
 
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -41,7 +41,11 @@ unsigned long hypercall_create_continuat
     if ( mcs->flags & MCSF_in_multicall )
     {
         for ( i = 0; *p != '\0'; i++ )
-            mcs->call.args[i] = NEXT_ARG(p, args);
+        {
+            if ( i >= ARRAY_SIZE(mcs->call.args) )
+                goto bad_fmt;
+            array_access_nospec(mcs->call.args, i) = NEXT_ARG(p, args);
+        }
     }
     else
     {
@@ -65,7 +69,7 @@ unsigned long hypercall_create_continuat
                 case 2: regs->rdx = arg; break;
                 case 3: regs->r10 = arg; break;
                 case 4: regs->r8  = arg; break;
-                case 5: regs->r9  = arg; break;
+                default: goto bad_fmt;
                 }
             }
         }
@@ -81,7 +85,7 @@ unsigned long hypercall_create_continuat
                 case 2: regs->rdx = arg; break;
                 case 3: regs->rsi = arg; break;
                 case 4: regs->rdi = arg; break;
-                case 5: regs->rbp = arg; break;
+                default: goto bad_fmt;
                 }
             }
         }
@@ -177,7 +181,6 @@ int hypercall_xlat_continuation(unsigned
             case 2: reg = &regs->rdx; break;
             case 3: reg = &regs->rsi; break;
             case 4: reg = &regs->rdi; break;
-            case 5: reg = &regs->rbp; break;
             default: BUG(); reg = NULL; break;
             }
             if ( (mask & 1) )
--- a/xen/common/compat/multicall.c
+++ b/xen/common/compat/multicall.c
@@ -14,9 +14,13 @@ typedef int ret_t;
 
 static inline void xlat_multicall_entry(struct mc_state *mcs)
 {
-    int i;
-    for (i=0; i<6; i++)
-        mcs->compat_call.args[i] = mcs->call.args[i];
+    unsigned int i;
+    typeof(mcs->compat_call.args[0]) args[ARRAY_SIZE(mcs->call.args)];
+
+    for ( i = 0; i < ARRAY_SIZE(args); i++ )
+        args[i] = mcs->call.args[i];
+
+    memcpy(mcs->compat_call.args, args, sizeof(args));
 }
 
 #define multicall_entry      compat_multicall_entry
@@ -29,8 +33,8 @@ static inline void xlat_multicall_entry(
 
 static void __trace_multicall_call(multicall_entry_t *call)
 {
-    xen_ulong_t args[6];
-    int i;
+    xen_ulong_t args[ARRAY_SIZE(call->args)];
+    unsigned int i;
 
     for ( i = 0; i < ARRAY_SIZE(args); i++ )
         args[i] = call->args[i];
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -640,7 +640,11 @@ DEFINE_XEN_GUEST_HANDLE(mmu_update_t);
  */
 struct multicall_entry {
     xen_ulong_t op, result;
+#ifndef __XEN__
     xen_ulong_t args[6];
+#else /* Only 5 arguments are supported in reality. */
+    xen_ulong_t args[5], unused;
+#endif
 };
 typedef struct multicall_entry multicall_entry_t;
 DEFINE_XEN_GUEST_HANDLE(multicall_entry_t);

