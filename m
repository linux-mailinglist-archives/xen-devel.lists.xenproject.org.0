Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E300E96BE8B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 15:30:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790381.1200132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slq5d-0007sM-6S; Wed, 04 Sep 2024 13:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790381.1200132; Wed, 04 Sep 2024 13:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slq5d-0007qr-3Y; Wed, 04 Sep 2024 13:30:29 +0000
Received: by outflank-mailman (input) for mailman id 790381;
 Wed, 04 Sep 2024 13:30:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slq5c-0005qq-I0
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 13:30:28 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8a323d2-6ac1-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 15:30:26 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso603837966b.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 06:30:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989221c24sm803774066b.196.2024.09.04.06.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 06:30:25 -0700 (PDT)
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
X-Inumbo-ID: d8a323d2-6ac1-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725456626; x=1726061426; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d304rnLLf8wqFXcdxGQwytZrZHtgz+7F/g6Hp97VsEM=;
        b=Xn39PM4HHoo1txcrKQJEB+0RbbPKUhfzvUpkium642ynNNUWdAeTklalNAkRgXRquH
         tCMnXnG3aRBtBnqxKAvmBFvojVeAoLWg/LikR7eEdcSrk8YWKNarzZGtulTkiLDFBYAI
         RHIPeMi+6zgDdX+0IOXzsY2LqflW0McCww365Y2qN5U2RqTsyuzr6wR0D+28SZ7L0NAT
         eB5gIQGPWqEML0aLIiOtScnXiRE5wO4cJ9kvDCaM3wGSaVk4qoFQv54DA8CRK3kFfJPA
         f6k6ynSZg9JxlMBYFcwz1buaamGVv5Q1j+Ks4ELkOzuwVuZZM6rvAP79p0kA0skZSVUe
         x8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725456626; x=1726061426;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d304rnLLf8wqFXcdxGQwytZrZHtgz+7F/g6Hp97VsEM=;
        b=HR+jgCeSTvWyr1EE+kHRTyRkYd6QmYMYyadd0y4I6W1I3Ym0qhiH0y6e473AS44khB
         /GsXTfgC0QcRtg1DrBi5LBRFeO5+UqAkO7SaNEgKXB7saiogpCW+IW3ykPiTRfhUa1IF
         WWqELgRhfTTuaxEibgoV1O7rOP6W7VYn5YPl8p+PwggUVOycrmiDYWUkVIHU2HreP2IJ
         kFRjv9UUJb1rOJ9YaNrAf3I+DraiGL+dDnfw6aplRC7UZpBF23hpbmNeA2p5TQlYk37o
         HUJlwlvZLyM8gnFiSpzgTfaomi000NGJI7wQdemwukhkpb+EjTqsLw8f/4G+ircR+J94
         fFIA==
X-Gm-Message-State: AOJu0YwGJf2vZkXPJIGaYkny6WyDZTEvnZTKiQONWwhx43BYKtA6O1nL
	VQJq2R7Vuj8Uh2aZ42zqEg58TQfWKACFoK4vW7KzzepewYg4yQ+hnVKOS7996DptOIPSHE1ztH4
	=
X-Google-Smtp-Source: AGHT+IEWfC+RJs0qL7syaZj9ksV52s+RpS7FHzjt5wCK9gixdQWjmjPqvlFlA3gUQYIerB8VXajdCw==
X-Received: by 2002:a17:907:3e94:b0:a86:8a05:760d with SMTP id a640c23a62f3a-a8a1d29ba0dmr555838966b.5.1725456626180;
        Wed, 04 Sep 2024 06:30:26 -0700 (PDT)
Message-ID: <bcaab3fd-2dca-4504-ad4b-830bc8dcf923@suse.com>
Date: Wed, 4 Sep 2024 15:30:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/5] x86/HVM: drop redundant access splitting
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <31906cba-8646-4cf9-ab31-1d23654df8d1@suse.com>
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
In-Reply-To: <31906cba-8646-4cf9-ab31-1d23654df8d1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

With all paths into hvmemul_linear_mmio_access() coming through
linear_{read,write}(), there's no need anymore to split accesses at
page boundaries there. Leave an assertion, though.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
@@ -1094,13 +1094,13 @@ static int hvmemul_linear_mmio_access(
     if ( cache == NULL )
         return X86EMUL_UNHANDLEABLE;
 
-    chunk = min_t(unsigned int, size, PAGE_SIZE - offset);
+    ASSERT(size <= PAGE_SIZE - offset);
 
     if ( known_gpfn )
         gpa = pfn_to_paddr(hvio->mmio_gpfn) | offset;
     else
     {
-        rc = hvmemul_linear_to_phys(gla, &gpa, chunk, &one_rep, pfec,
+        rc = hvmemul_linear_to_phys(gla, &gpa, size, &one_rep, pfec,
                                     hvmemul_ctxt);
         if ( rc != X86EMUL_OKAY )
             return rc;
@@ -1108,27 +1108,8 @@ static int hvmemul_linear_mmio_access(
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


