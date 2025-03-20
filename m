Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7399A6A295
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 10:28:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921534.1325358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvCCP-0007cI-Pf; Thu, 20 Mar 2025 09:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921534.1325358; Thu, 20 Mar 2025 09:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvCCP-0007ZP-Mn; Thu, 20 Mar 2025 09:28:25 +0000
Received: by outflank-mailman (input) for mailman id 921534;
 Thu, 20 Mar 2025 09:28:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvCCO-0006dm-FW
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 09:28:24 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab089b54-056d-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 10:28:23 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso3242605e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 02:28:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4aafde63sm13470285e9.6.2025.03.20.02.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 02:28:21 -0700 (PDT)
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
X-Inumbo-ID: ab089b54-056d-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742462902; x=1743067702; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LR4q00Qu7pVr1t1WkpZ6J3edBbbtA7hEJhI3V8nsuD0=;
        b=T05opnJ/viRpH7ifR8Oe0dcyhlZLGf4nj9bTeSyBSb9I+LxjEE5+WbVZmdIL1fPr8S
         mZlslS3wM/w9CT/49moL/vzJUvNfkipAjGjxoqGw1W3RcxlLLeE9xh2tktPdbpRGDjfc
         OOI46il8XYPlZaFtdkneTToajF3JwlZqwbAyuLec2pfoTDxaTAF2oI+Ubeg7Z1mL9aC1
         nOy94v1ikwV3L6bKrSSd8I9yJn4Vw63UlCkGZMivgG2x48c+bPdOFxKlVAhpy4xQxr3q
         yOjVK+mcx+PWDFloYErVjR0nw3xp0cH93bojYjiWaNzewaANcaMAMhO333V44PXeBbLI
         5d2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742462902; x=1743067702;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LR4q00Qu7pVr1t1WkpZ6J3edBbbtA7hEJhI3V8nsuD0=;
        b=o/8j4+8ca+uEOK0NB3StWcZ/OKyQbeTBTakqZ4Tv7vQQAXXKfYIlwQbYI/5QFubDdr
         h+fPrx3jnYKeFw6CaUQpWf69J2HLDeA5xoe3cA84ydyCuvZO38Bz9oHg+iM8ZAYH+Qhu
         C2F3ysHDv0zh4B9xHmn2RW8ZoCjaL/7vo6o6bib4w2LY8BvKnQwBLB4cTJbXiCy1LyAR
         eCBrsuG97+szlaTXqSpvGqrbpAekglP3O6S2hIhs0P0l3+DLbiuEVU53an1AZJw33fPa
         VkLpOr9qhHRfFicAR25a6zyEwvqsNL5uqyhv/eUuEcM8Romw8UgNvk8XdxYdYM+NkxBJ
         Ovrg==
X-Gm-Message-State: AOJu0YzdIDbKGR06KU1ozKQkuGjJF5l9blCa2AcB33u4emb+hu5LHc+q
	FBSrIx679usCNRngZb38Zul7tUreRkH1yyQ9ji492hWrRlQqY39Mf8mm2KJacpOQbddSZJ0BCKc
	=
X-Gm-Gg: ASbGncs/4sNrCZ8xDxcLrp+68E2qts8N86mMqAguSvzt2vN5L2bPKWVRrz6ttRDVSMj
	XNUllqDztBjawsy4puaFTxf/PKAM22gPnc3RXW8oM+UV8x6UkKsr9vTTfJymcNy8Ermat8vCZiK
	0MkTLsR8Jnzau6HKTU38XLYmlz5odyiOJWBNPXMYSLC8238pKVVGU70GEizg9d9jqNVapPKz9Ig
	Peoa4CYYbwLeoBCktuRC1y3qw7rAAXkDRcNZKh7wyxVMOIeiTqsJMMsrWHUa/Gv0CvD9OQkVbdD
	meUhVazZJtz3gKwM/8RVUeQVN3gI3pHtdCuO/tNyQi9rc6kyse3Fxsrt5aQG7YjjVjzYYtk3lsV
	ryenNUNrs/7BSdzTBA2dzBD8boPqTy8uTvQM824kX
X-Google-Smtp-Source: AGHT+IHfGhO9NUAVrd6ex6WE5OU5jqSxXmjhTnLHT1vgjSDyM3MJ3l1SrYia3+omJmWZ8fPaEEC8mw==
X-Received: by 2002:a05:600c:3659:b0:43c:ec72:3daf with SMTP id 5b1f17b1804b1-43d491bf814mr17909295e9.14.1742462902110;
        Thu, 20 Mar 2025 02:28:22 -0700 (PDT)
Message-ID: <9bdc10ba-8572-46b3-a39e-e011e97d1e85@suse.com>
Date: Thu, 20 Mar 2025 10:28:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/2] x86/PVH: account for module command line length
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <577ddc98-fdbb-48af-9c7e-1a411383516b@suse.com>
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
In-Reply-To: <577ddc98-fdbb-48af-9c7e-1a411383516b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

As per observation in practice, initrd->cmdline_pa is not normally zero.
Hence so far we always appended at least one byte. That alone may
already render insufficient the "allocation" made by find_memory().
Things would be worse when there's actually a (perhaps long) command
line.

Skip setup when the command line is empty. Amend the "allocation" size
by padding and actual size of module command line. Along these lines
also skip initrd setup when the initrd is zero size.

Fixes: 0ecb8eb09f9f ("x86/pvh: pass module command line to dom0")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Use elf_round_up(). Introduce initrd_cmdline local. Re-base.

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -652,9 +652,10 @@ static int __init pvh_load_kernel(
     unsigned long image_len = image->size;
     unsigned long initrd_len = initrd ? initrd->size : 0;
     const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) : NULL;
+    const char *initrd_cmdline = NULL;
     struct elf_binary elf;
     struct elf_dom_parms parms;
-    size_t extra_space;
+    size_t extra_space = 0;
     paddr_t last_addr;
     struct hvm_start_info start_info = { 0 };
     struct hvm_modlist_entry mod = { 0 };
@@ -712,10 +713,23 @@ static int __init pvh_load_kernel(
      * split into smaller allocations, done as a single region in order to
      * simplify it.
      */
-    extra_space = sizeof(start_info);
+    if ( initrd_len )
+    {
+        extra_space = elf_round_up(&elf, initrd_len);
+
+        if ( initrd->cmdline_pa )
+        {
+            initrd_cmdline = __va(initrd->cmdline_pa);
+            if ( !*initrd_cmdline )
+                initrd_cmdline = NULL;
+        }
+        if ( initrd_cmdline )
+            extra_space += strlen(initrd_cmdline) + 1;
+
+        extra_space = ROUNDUP(extra_space, PAGE_SIZE) + sizeof(mod);
+    }
 
-    if ( initrd )
-        extra_space += sizeof(mod) + ROUNDUP(initrd_len, PAGE_SIZE);
+    extra_space += sizeof(start_info);
 
     if ( cmdline )
         extra_space += elf_round_up(&elf, strlen(cmdline) + 1);
@@ -727,7 +741,7 @@ static int __init pvh_load_kernel(
         return -ENOMEM;
     }
 
-    if ( initrd != NULL )
+    if ( initrd_len )
     {
         rc = hvm_copy_to_guest_phys(last_addr, __va(initrd->start),
                                     initrd_len, v);
@@ -740,12 +754,11 @@ static int __init pvh_load_kernel(
         mod.paddr = last_addr;
         mod.size = initrd_len;
         last_addr += elf_round_up(&elf, initrd_len);
-        if ( initrd->cmdline_pa )
+        if ( initrd_cmdline )
         {
-            char *str = __va(initrd->cmdline_pa);
-            size_t len = strlen(str) + 1;
+            size_t len = strlen(initrd_cmdline) + 1;
 
-            rc = hvm_copy_to_guest_phys(last_addr, str, len, v);
+            rc = hvm_copy_to_guest_phys(last_addr, initrd_cmdline, len, v);
             if ( rc )
             {
                 printk("Unable to copy module command line\n");
@@ -775,7 +788,7 @@ static int __init pvh_load_kernel(
          */
         last_addr += elf_round_up(&elf, strlen(cmdline) + 1);
     }
-    if ( initrd != NULL )
+    if ( initrd_len )
     {
         rc = hvm_copy_to_guest_phys(last_addr, &mod, sizeof(mod), v);
         if ( rc )


