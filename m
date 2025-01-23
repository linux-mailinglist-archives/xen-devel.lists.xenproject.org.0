Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60056A1A1E5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 11:32:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876157.1286526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tauVW-000124-AJ; Thu, 23 Jan 2025 10:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876157.1286526; Thu, 23 Jan 2025 10:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tauVW-0000zr-7J; Thu, 23 Jan 2025 10:32:18 +0000
Received: by outflank-mailman (input) for mailman id 876157;
 Thu, 23 Jan 2025 10:32:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tauVU-0008FU-55
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 10:32:16 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fa30f07-d975-11ef-a0e5-8be0dac302b0;
 Thu, 23 Jan 2025 11:32:14 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso4823035e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 02:32:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf327e327sm18385898f8f.87.2025.01.23.02.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 02:32:13 -0800 (PST)
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
X-Inumbo-ID: 4fa30f07-d975-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737628334; x=1738233134; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HneC4tuDeqdivr7ucNMyxLt3tAp+7YCblsbiCrRGkJ8=;
        b=DGnbataJNvBmAyVVW6OhXH92C1mXC88FF8r5HNNjusx3Y+zDkDn+n46SRnCs9gXX+z
         WofvVvKon4D2Wq3piz1keCHLjmOTSJElkw6Y74kheCMFdcV7UhIuiKzwtOi+XaEtjpfk
         StYHlyj2L9M9JMFpprERYLOdd+aN/b6HrhyjarxJiRVCggxKDj9urexNlvXDjed263hz
         lEG9VhObzd4G46qGwKdECDy/kmQMO8QYgAq0q0HeVB84ssWweG12rdyxZrKGvO1qmKWJ
         joi5YuNoM2aaKfak6wCTZ3XYUBJZ2AreN924C4l0hnN1qPSLztSP195BmcWPn2Zu0e06
         0HIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737628334; x=1738233134;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HneC4tuDeqdivr7ucNMyxLt3tAp+7YCblsbiCrRGkJ8=;
        b=P54aZ0UBZD1qMt3sLaMYO2dyS17H0lEyB5OrPT+zHADu78V1ZoToy0Nib0hQx57UxG
         /8otyREh5pddKOkjbnEPcEb6XQohmyE3ObHu42WlYF/4224TqY7nJG0XGOzkVTooqj9x
         4Q81G/KVJXhq4Q/j4vwI/3dyelkrx4tqad2FHBvKXSvfrCabw8zEMXgNqHuyzcbeMrMz
         hOs7Ei1N8N8Hp130pHTqIvcC8eKRhgm2J94/ZH9pTL1ulFMBGrGLeIGVlViAHkVAt+fE
         oIHG6XhLH4sfMHr1Mu9LjKA5e6DzoYjCphI/8BFclVFr3sAYHgkI+oJs9kJwiqIm81CE
         6eJQ==
X-Gm-Message-State: AOJu0YyOe1TBuBFkWQJHkAyEBLxw2m7Oyq2Wy+TEmpguQ0c5nLfQfGWc
	0mOEKFfL5fDA6sIHHJXiQiQ1mjTdSsdjZdZV/fYnDVQEBNx3m3edTZ3Ctx8JnK/V3Qn8ufpubOs
	=
X-Gm-Gg: ASbGncsMKZTOtqDoj72n1hHql5m+ZY6AzfYcIUeTkNSUOP8z0v8dKmPXxVAiFJqG3is
	muuke1ohjILPSVvRdonRpF9vE73278jGoOE/aDTQB2WoeQjOnuMPB48oLf/BHmxMysEvAAOMAtM
	21LI1A+9fPUkOxwtwNfntCSSUwcHqFckd5nPhjynRkfZ5bDjjVckNox53M/ukYkC7mnrGN6Zsr5
	13cmYRb6yeGwaly+bZSp+lh+A//Y6RKkTYdVq0o/FTo/SVtrKKa2dWWl2oZKV5bPQw122pNizUj
	LOF5+Gjg/QfSkhy9y1ymoZ+N4C8O3Bwt74QLzcA95eqZTkGBcpFpO+26L6FThOlfrg==
X-Google-Smtp-Source: AGHT+IHb/PlX38QozwvGAx+OkBsBBWcIYqoCdLQn0lCrvawFT0EMu1SZpBRSTyuztnrfiO3rTvciBw==
X-Received: by 2002:a5d:64e9:0:b0:382:450c:2607 with SMTP id ffacd0b85a97d-38bf566e73cmr19476285f8f.4.1737628333808;
        Thu, 23 Jan 2025 02:32:13 -0800 (PST)
Message-ID: <93c773f3-2426-43ef-ab15-64c6589234d3@suse.com>
Date: Thu, 23 Jan 2025 11:32:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 4/4] x86/HVM: drop redundant access splitting
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <729f7896-55b7-4b5b-a7e9-6eb0420e0b14@suse.com>
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
In-Reply-To: <729f7896-55b7-4b5b-a7e9-6eb0420e0b14@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With all paths into hvmemul_linear_mmio_access() coming through
linear_{read,write}(), there's no need anymore to split accesses at
page boundaries there. Leave an assertion, though.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
v3: Transform an expression. Re-base over parameter renaming in an
    earlier patch.
v2: Replace ASSERT() by more safe construct.

--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -1084,7 +1084,7 @@ static int hvmemul_linear_mmio_access(
 {
     struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
     unsigned long offset = gla & ~PAGE_MASK;
-    unsigned int chunk, buffer_offset = gla - start_gla;
+    unsigned int buffer_offset = gla - start_gla;
     struct hvm_mmio_cache *cache = hvmemul_find_mmio_cache(hvio, start_gla,
                                                            dir, buffer_offset);
     paddr_t gpa;
@@ -1094,13 +1094,17 @@ static int hvmemul_linear_mmio_access(
     if ( cache == NULL )
         return X86EMUL_UNHANDLEABLE;
 
-    chunk = min_t(unsigned int, size, PAGE_SIZE - offset);
+    if ( size + offset > PAGE_SIZE )
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


