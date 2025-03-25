Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2E1A6EBEA
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 09:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926142.1329007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twzws-0003FN-8c; Tue, 25 Mar 2025 08:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926142.1329007; Tue, 25 Mar 2025 08:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twzws-0003Cu-5N; Tue, 25 Mar 2025 08:47:50 +0000
Received: by outflank-mailman (input) for mailman id 926142;
 Tue, 25 Mar 2025 08:47:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twzwr-0003BT-44
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 08:47:49 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3e2dea0-0955-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 09:47:48 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-391342fc148so3649780f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 01:47:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f99561dsm13322509f8f.12.2025.03.25.01.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 01:47:47 -0700 (PDT)
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
X-Inumbo-ID: d3e2dea0-0955-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742892467; x=1743497267; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yg12JQpbt3xSZii10quMSUNM1Ae6R1UGjJH8iR4jZ4U=;
        b=bqOO504yx26u0VV21ta4brkjIYNO4UxjWEHdw3OWhfdy6sKVN7X2K4/EDjDESHUjy3
         xhRDNk7dORfPaoDQjQkcWObd5oQRk+CquPst1AgAl6WgpMZBpYm2ysjJ2sxab+BkAb28
         bsnrAhYQOnNG8kiiM9Vdx24RVP9K3gb9INHh8O++IsFiKofmkj2rPD1nGBbbjKmJZ7BP
         zefHxQ/BO8QgfQ7YkUZCOUAPtAxq/1kqoF7D8ZroUzw+M0+uQRgZO1YF4C4lTnDY70Ba
         IG3c+LEt5GcPr9piqIpQwnvO5vorvxlTHAO56/bgrOBez2tLdqzIp0o1KPEkWQrUMhet
         Y0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742892467; x=1743497267;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yg12JQpbt3xSZii10quMSUNM1Ae6R1UGjJH8iR4jZ4U=;
        b=D+mnBGJ/E/IYCQW+ftNvVzvbfsXbVbgx8fHbhx26ciTATcgyS1L+aTWvLZTdyLXgOO
         MjLEC08RTAvOwHVYXA7Y2XmKsJ2XbeWNh3WmAToLxVfXk0QlELjFCGA1Sul/7Ao3SFSs
         gg/pvwUkw8FoC77IuezVCNEvglYhLokDK571cXAHWmgN/5/eE6cEd2K7QHg9WYePClOI
         EEFPpbobYjc0FvL8z+6BFXFKaeEtaPArMb2vorZtYPQugeCIyXFzuGDNcCrFKHh160oG
         PUOgtZI+m5++rRo6QTRq5oBNH5Gdl1DZawLTmZTYqzyryo70yyg8uRL5Q0T85AEP+j4X
         bMGg==
X-Gm-Message-State: AOJu0Yx2ruohFH4Ah4cEC5+a6pceqJ1B8pz8HgFEHYCzDvlrEt8Vr02+
	jtwUxSG0RVXzvDQf+AUqonf4uqg9DIJEESmG4PamN0A1mja+vDO8iILR5cw5ZsDfEH7nRLQbFcA
	=
X-Gm-Gg: ASbGnctOsmRfo7k4gxnxKCLmXCkTqh0LvDsBvKBH1Bk+OIyDea/XkdSA0xpW18Ex0WJ
	jpUl40MpEmrbszPHE6K628tTX3wsFseRSBGhcs3tCt9NjasBLDgRSYxbYHuEripDnfI18CTlGyU
	zu3jjTxLyVWWvl28PQtM0nlfhXIIQmqqAbUAGs/cC0bxaIRPj/03o4UxlAdlcnh6h/opL1hxgtd
	80Gs492mccorXzgEc7ZOhp5zHALCYlJDZYCvWaaHb9NuHe+KUkoEIWL6Nhccv6ApOnCItzbVYh8
	kvlnB9T7JglllL3quYpacOF0v/Fz6mCP2dnbIX+jnZvbht8NWmjitS0cQc/skby3Z49a1EqHoMc
	0q7jOaE/xWdqvTsR/lZ/p5D34ghD6Ow==
X-Google-Smtp-Source: AGHT+IEE2txPys+XsdSX06hZvWGqolJ/3k2FKfSlRvhYsJYGeooOzR6LFfel7c8MJBNUvRiVTWmCVA==
X-Received: by 2002:a05:6000:4014:b0:391:6fd:bb65 with SMTP id ffacd0b85a97d-3997f8f5e17mr15514201f8f.9.1742892467598;
        Tue, 25 Mar 2025 01:47:47 -0700 (PDT)
Message-ID: <89d87fb0-88af-4495-92dd-cde28d8c25ff@suse.com>
Date: Tue, 25 Mar 2025 09:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4] x86/PVH: account for module command line length
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
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
v4: Keep only ever accumulating into extra_space.
v3: Permit empty initrd with non-empty module command line again.
v2: Use elf_round_up(). Introduce initrd_cmdline local. Re-base.

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -652,6 +652,7 @@ static int __init pvh_load_kernel(
     unsigned long image_len = image->size;
     unsigned long initrd_len = initrd ? initrd->size : 0;
     const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) : NULL;
+    const char *initrd_cmdline = NULL;
     struct elf_binary elf;
     struct elf_dom_parms parms;
     size_t extra_space;
@@ -715,7 +716,23 @@ static int __init pvh_load_kernel(
     extra_space = sizeof(start_info);
 
     if ( initrd )
-        extra_space += sizeof(mod) + ROUNDUP(initrd_len, PAGE_SIZE);
+    {
+        size_t initrd_space = elf_round_up(&elf, initrd_len);
+
+        if ( initrd->cmdline_pa )
+        {
+            initrd_cmdline = __va(initrd->cmdline_pa);
+            if ( !*initrd_cmdline )
+                initrd_cmdline = NULL;
+        }
+        if ( initrd_cmdline )
+            initrd_space += strlen(initrd_cmdline) + 1;
+
+        if ( initrd_space )
+            extra_space += ROUNDUP(initrd_space, PAGE_SIZE) + sizeof(mod);
+        else
+            initrd = NULL;
+    }
 
     if ( cmdline )
         extra_space += elf_round_up(&elf, strlen(cmdline) + 1);
@@ -740,12 +757,11 @@ static int __init pvh_load_kernel(
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

