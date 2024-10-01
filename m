Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D66C98B78D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 10:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807843.1219539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svYaU-0000Ao-46; Tue, 01 Oct 2024 08:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807843.1219539; Tue, 01 Oct 2024 08:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svYaU-00007i-1D; Tue, 01 Oct 2024 08:50:30 +0000
Received: by outflank-mailman (input) for mailman id 807843;
 Tue, 01 Oct 2024 08:50:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svYaR-0006bI-SH
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 08:50:27 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33e95ba1-7fd2-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 10:50:26 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so785864566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 01:50:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2775b3csm668996866b.27.2024.10.01.01.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 01:50:25 -0700 (PDT)
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
X-Inumbo-ID: 33e95ba1-7fd2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727772626; x=1728377426; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LME1v2y5K47DGz0uUCZNveBYET3FXFVivr3ZLArlZP4=;
        b=TkOrNyykSRdOgaoDKVVAjI61rudCr4SdDLjU29ABOjfMkkuRGqjSdyccxAO7cdBNcP
         gY4wFdU39114owEj+nd3gXmr2dnAXz0dlldyGmq/FK13DzAme0rdWe5MK1D0jYgSd1eK
         r6UdkPbu8JJvVKWV0F2cASdTQkBsz9D9YWQufsTrXC7BErJtiv4crqcmRdpIk0vcWF21
         pPy5NPrtAzwQU6HIidXHJWUk3PAmfOqzVyGfijq2aKqq4TXrh+Yo2d8mjg1ohLo75gIm
         SnZV6G88HHnRI9hlNyyzpNkx9Rtf+51IuMT6hk4Mjuxef7bZg1m5JA4oYaEQVFIXXM3o
         xc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727772626; x=1728377426;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LME1v2y5K47DGz0uUCZNveBYET3FXFVivr3ZLArlZP4=;
        b=B8Zi6S5Sqa9PLMj0s6p843pBLozjc6pHs5I/q1UuGlxdAzbNUrxf3Y+gRJgFVRe27u
         Oq3ll2wUX6EnavvVmMnhBV78NA1qoUAN2MHAffpWr1enF0kezM5TgdIcO0UG+y40eUrW
         fMrbaHB8X1QJ/9O3rNiiXD8CWorv8WOhkdHtKo2WAUoVsdIHdXYunXJfm3cmf9GvX5Cp
         i+h2iWwBZiFtfMDJHghGUDzwgp2qaXt4VXupjlQxS52BHzzpa5r40GwH0DYCMPhVV4i2
         OvSglkdz4Tt4LmKk1bFAEV0n4f4jjFjzPWVUF2VhaGhDOIOerSY19w1NgDC/ZKsj07Xj
         lObA==
X-Gm-Message-State: AOJu0Yy8ipGaOgCflMniQS++RcjDJ6J1SP7dmfclFhGTuCClBct1aSPR
	m1v6+D6Uo7xfmlAR/lwVpBGOuxpUAKKf6OoK5GwKIhMwmoGURz+yB8HsMatsGIbXY6iUFp4uHq0
	=
X-Google-Smtp-Source: AGHT+IGRvliJJXGYn8enUcuI2BUAJAWEKNN1SLxvmIKQ4ZJBZ8WCEKTZ8tZ54H0cF+46lkmtTHWbww==
X-Received: by 2002:a17:907:2cc5:b0:a86:a1cd:5a8c with SMTP id a640c23a62f3a-a93c49218b7mr1624745366b.22.1727772625801;
        Tue, 01 Oct 2024 01:50:25 -0700 (PDT)
Message-ID: <7d73f0c5-3d16-4cf3-b8de-e45f539e8916@suse.com>
Date: Tue, 1 Oct 2024 10:50:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 5/5] x86/HVM: drop redundant access splitting
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com>
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
In-Reply-To: <3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

With all paths into hvmemul_linear_mmio_access() coming through
linear_{read,write}(), there's no need anymore to split accesses at
page boundaries there. Leave an assertion, though.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Replace ASSERT() by more safe construct.

--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -1084,7 +1084,7 @@ static int hvmemul_linear_mmio_access(
 {
     struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
     unsigned long offset = gla & ~PAGE_MASK;
-    unsigned int chunk, buffer_offset = gla - start;
+    unsigned int buffer_offset = gla - start;
     struct hvm_mmio_cache *cache = hvmemul_find_mmio_cache(hvio, start, dir,
                                                            buffer_offset);
     paddr_t gpa;
@@ -1094,13 +1094,17 @@ static int hvmemul_linear_mmio_access(
     if ( cache == NULL )
         return X86EMUL_UNHANDLEABLE;
 
-    chunk = min_t(unsigned int, size, PAGE_SIZE - offset);
+    if ( size > PAGE_SIZE - offset )
+    {
+        ASSERT_UNREACHABLE();
+        return X86EMUL_UNHANDLEABLE;
+    }
 
     if ( known_gpfn )
         gpa = pfn_to_paddr(hvio->mmio_gpfn) | offset;
     else
     {
-        rc = hvmemul_linear_to_phys(gla, &gpa, chunk, &one_rep, pfec,
+        rc = hvmemul_linear_to_phys(gla, &gpa, size, &one_rep, pfec,
                                     hvmemul_ctxt);
         if ( rc != X86EMUL_OKAY )
             return rc;
@@ -1108,27 +1112,8 @@ static int hvmemul_linear_mmio_access(
         latch_linear_to_phys(hvio, gla, gpa, dir == IOREQ_WRITE);
     }
 
-    for ( ;; )
-    {
-        rc = hvmemul_phys_mmio_access(cache, gpa, chunk, dir, buffer, buffer_offset);
-        if ( rc != X86EMUL_OKAY )
-            break;
-
-        gla += chunk;
-        buffer_offset += chunk;
-        size -= chunk;
-
-        if ( size == 0 )
-            break;
-
-        chunk = min_t(unsigned int, size, PAGE_SIZE);
-        rc = hvmemul_linear_to_phys(gla, &gpa, chunk, &one_rep, pfec,
-                                    hvmemul_ctxt);
-        if ( rc != X86EMUL_OKAY )
-            return rc;
-    }
-
-    return rc;
+    return hvmemul_phys_mmio_access(cache, gpa, size, dir, buffer,
+                                    buffer_offset);
 }
 
 static inline int hvmemul_linear_mmio_read(


