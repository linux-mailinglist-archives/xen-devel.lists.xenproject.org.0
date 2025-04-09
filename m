Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5964EA825F6
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 15:17:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943990.1342575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VJF-0005nX-KT; Wed, 09 Apr 2025 13:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943990.1342575; Wed, 09 Apr 2025 13:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VJF-0005lP-Fe; Wed, 09 Apr 2025 13:17:41 +0000
Received: by outflank-mailman (input) for mailman id 943990;
 Wed, 09 Apr 2025 13:17:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2VJE-0005lC-27
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 13:17:40 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 028995cc-1545-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 15:17:39 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso45952215e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 06:17:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893f0b14sm1634041f8f.65.2025.04.09.06.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 06:17:38 -0700 (PDT)
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
X-Inumbo-ID: 028995cc-1545-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744204658; x=1744809458; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WBgpIGZijaunSknpbdMvhEhWqabmIbHp9KZM49gqIg=;
        b=Xngs/F50saxzORVCUSwVGFyfYEh7N5WIKtvfyw9CT9c/F5aVFWGxGAvneslNiYjWKg
         boXlf6ghV9TNSV7geseyOHiw9eyUd3c39uveFLM+p+S1Ii8dMNqOayLSREce59VLalDm
         XQpmf9SYmgYAvpidG5XJtGNrosZTnWfJBp5FapN9DCe9pFLDaixFQ4Fi7GyLL1bIIaiW
         TMDYjzU6Mzy/mjXEI+i2T3c9zobynkZM3zYNcFdRgOnx5d3KeYjylQQo5PBhhb9Y/yF/
         nOuCdaHtM3p5L/TkWrjsRmuI4m0HlrswVbJcXcCmnTtk98St9i0pwuHMT+pqDtqJyMq7
         FyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744204658; x=1744809458;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+WBgpIGZijaunSknpbdMvhEhWqabmIbHp9KZM49gqIg=;
        b=QZWb0xmq3p1eKt45pzF1H4HVfS9qmDo/PacTa1jp7yXoiOfKanxUrL+E5ydUbpZlds
         OLxPpBi2zCZD8RgAsGJQZ3ITAsusqiBzrHEQzQWQmV62pWHVm7EfpakFaahvy5a23o3Z
         5vGWa7JbdvB4zbkhYulkbLnqrtLHCHoSPmXlsJ7iYU/+lXMq8nJlHSl9iguuEh+kofYz
         q5N7rK8TstbFbxHDyKrLmrS3K3GqbyEYbcr/fhr9Gbp6QEO/wws8bRjikbAuFAx0tTrd
         vQvLoBMD6sGUD8EHldPcdW1jdd4REMX7+byNwO5KSL/tqJrq1Y76AyxrD0lMiYp116mA
         kzFw==
X-Gm-Message-State: AOJu0Yxw+dobowLCUJMAgAXG2kEAb7feEwjKizWS//hol6tCUrqMtb+s
	/05hVa8/vvvPf7Q86YmuW2hLLT0CjiWtL5xdH1l9d6V8cROWyWv5H4BSN6nKMeqPlt+0pYOnzcE
	=
X-Gm-Gg: ASbGncuvCt4MpnZK3gAqkS8RppZP2ZhRdUnDe9So7MzdWamJNiQOn5tkMs0/yJw/VAv
	lVPmkNA9D/xzi76oA6ntooECulZ79DEYkDXktyqbasbiKMO4BVSPxIWogmZymtVsf9f8lN4r7+u
	IlYxlCj31XBTDhwMq1b8EbrrTsag8i8Vvcryzc+hZKWcjH4y/UfZc3o0BWbP5hjYTxtk2tjFQoQ
	qxrl84jAyQFAyixtetpz/Bt+UZUwLHb75GkDdRyOVOORWaY3++YvJ20b90v0atIBMp0ztKXigLd
	KHnvr4bU76nEti80Gs4Lfn9Q4jKazCVH74eMGdj3cGWutp0IKA2akdWtqn+IlVPv2gLh1xnuc6M
	jS6iI+sZ5H9vHBw/exts1N4G3Ew==
X-Google-Smtp-Source: AGHT+IF865JH7by6iBsNz4B6dY3pcY4yWaOQEa+Vq0KEK+MOs2N36CzfXVC3s9zAnY4YoVtTR1qLIA==
X-Received: by 2002:a05:600c:19cf:b0:43c:e2dd:98f3 with SMTP id 5b1f17b1804b1-43f1ff3ba52mr17752025e9.21.1744204658374;
        Wed, 09 Apr 2025 06:17:38 -0700 (PDT)
Message-ID: <055d3235-7ee0-472b-b520-6426b51d3927@suse.com>
Date: Wed, 9 Apr 2025 15:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: improve local variable use in
 hvm_hap_nested_page_fault()
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

First gfn can be set just once, rather than (conditionally) twice.

And then gfn can be used in two function calls, rather than re-
calculating the value there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wasn't quite sure about continuing to use an open-coded shift.
PFN_DOWN() could be used, or paddr_to_pfn(). Neither looks to be an
overly good fit to translate a gaddr to a gfn, yet gaddr_to_gfn() can't
be used quite nicely either as long as gfn isn't of type gfn_t.

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1794,7 +1794,7 @@ void hvm_inject_event(const struct x86_e
 int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
                               struct npfec npfec)
 {
-    unsigned long gfn = gpa >> PAGE_SHIFT;
+    unsigned long gfn;
     p2m_type_t p2mt;
     p2m_access_t p2ma;
     mfn_t mfn;
@@ -1841,12 +1841,13 @@ int hvm_hap_nested_page_fault(paddr_t gp
                 hvm_inject_hw_exception(X86_EXC_GP, 0);
             return 1;
         case NESTEDHVM_PAGEFAULT_L0_ERROR:
-            /* gpa is now translated to l1 guest address, update gfn. */
-            gfn = gpa >> PAGE_SHIFT;
+            /* gpa is now translated to l1 guest address. */
             break;
         }
     }
 
+    gfn = gpa >> PAGE_SHIFT;
+
     /*
      * No need to do the P2M lookup for internally handled MMIO, benefiting
      * - 32-bit WinXP (& older Windows) on AMD CPUs for LAPIC accesses,
@@ -1854,7 +1855,7 @@ int hvm_hap_nested_page_fault(paddr_t gp
      */
     if ( !nestedhvm_vcpu_in_guestmode(curr) && hvm_mmio_internal(gpa) )
     {
-        if ( !handle_mmio_with_translation(gla, gpa >> PAGE_SHIFT, npfec) )
+        if ( !handle_mmio_with_translation(gla, gfn, npfec) )
             hvm_inject_hw_exception(X86_EXC_GP, 0);
         rc = 1;
         goto out;
@@ -1982,7 +1983,7 @@ int hvm_hap_nested_page_fault(paddr_t gp
          (npfec.write_access &&
           (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server))) )
     {
-        if ( !handle_mmio_with_translation(gla, gpa >> PAGE_SHIFT, npfec) )
+        if ( !handle_mmio_with_translation(gla, gfn, npfec) )
             hvm_inject_hw_exception(X86_EXC_GP, 0);
         rc = 1;
         goto out_put_gfn;

