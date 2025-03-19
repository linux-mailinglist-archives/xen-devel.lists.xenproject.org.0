Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659A8A68B22
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 12:18:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920274.1324490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1turR0-00079G-Mr; Wed, 19 Mar 2025 11:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920274.1324490; Wed, 19 Mar 2025 11:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1turR0-00076F-JK; Wed, 19 Mar 2025 11:18:06 +0000
Received: by outflank-mailman (input) for mailman id 920274;
 Wed, 19 Mar 2025 11:18:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1turQy-000769-Ri
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 11:18:04 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2d87bd5-04b3-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 12:18:03 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so29253595e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 04:18:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4453227dsm15598075e9.40.2025.03.19.04.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 04:18:02 -0700 (PDT)
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
X-Inumbo-ID: d2d87bd5-04b3-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742383083; x=1742987883; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJPOZclbjSgxgc7yTSWYoEITrHjsgTLSTZISf6b28RQ=;
        b=JxKf1pClZEnyhP4tH1/CBYxadMJXHf0VvSw1QVVGwupDWuTeopjdJ1xRK6UEE1m35Y
         4vtObLS1ir+Qe8Hupfn0OOpCJhtfeCm61H5JPKlVC+0886G6UT9WX9NeJ6RRVgP8QPFp
         WcV9YA0rtrZRqEXaPQqAMf4CgUC1nIn6oUHbrb7iEoGxrFbWvAZ3dhxmeFu83Vhn48E/
         GGIlcYIewfOrE/BFzxswbHwGKvuXDwjSjAyg/UD9a4VppuNMdq2SpddbnQpQ7J92C+zj
         LRcHmeDZQ8JwFg77ULUxvR5IYTdBlZCIcCN6OAka2+WHIwII+Yx6GpvjgEbV9LkkFK4b
         JVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742383083; x=1742987883;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nJPOZclbjSgxgc7yTSWYoEITrHjsgTLSTZISf6b28RQ=;
        b=ksnf3fru/NGPkQNfQs6Nfrvv/79InRsQblI3iyjjR7DpbLmH16iBue3Y7y+kYCpsDB
         iKZGKkFQlQ0QayekcnE9gXfjRkorzQGowE0S78xjjgE3qsR7U1odx2FRETSwgZt+mJXy
         608OEPkGuiHg6c8RHzIXW/5kjp7GRWspo577A8/4H7slM2TuTW0mE0KAZ5TJxRgO1Nai
         5RmFdWyRsq8o2CBgPGiescgdHmtxkBXf6Pz8a5maa7xhM35lJLo2V8q5hB/P95BnVmwF
         8FD9EaE35QqRmoK4+PcNOyOfbggwLO2vB/k7UsyJ5LxS/ZVsmhhhuGXVuudsWMuX8NP5
         GsEQ==
X-Gm-Message-State: AOJu0Yz1ByBETwDm0ZVyh7MY8CioNmcKDddNbWcp0fS785yWdBFMonzI
	XFj7VfaPjRqA0rzTd85FmPLiqR6zrC4H430VbWj2fKw5jI32Iocxx8Va2MQTHebdQ+7PP/87XyQ
	=
X-Gm-Gg: ASbGncuRbZT2Jbqd1NCCZHV5IDaw2dexLibjHqO5GXoBtL9JH//2OreAFz8G+iwG9fB
	TrKqix8r+aio86VtGiMBDQUJ4J4jRflgQTnm7o+ZI/xbppS0ut4JNuDEjrU1KAPCroyTikToYax
	fGnD0iKxDjGj0CRcUeHgU4yr+bkLoadNhu5yJy0RbIS3P8v/THRCB3s8Fxt9xAO0DW+SaHKB4HK
	5GGIVX5PHIVFb2xEp8fVdQn6JgcEJXbTeaa9XJsFE6osFYW5mGM3itCXAuNdoc87yZ2NgKtEDf0
	oPMkBnONWLnnv7kqWHk36luNY8yEoFULFACELlP8/CVLQa2xvsXSwKdLCTfF0utY26ZuKl40SUG
	ubhaSPXjpA3xIMak/taovaKM13vjeyA==
X-Google-Smtp-Source: AGHT+IHosA9DLXwEIyHGDtuTd2Ak31mqs67yWFvlumPS8cdMoZwYc6pB1Y1jXZHmNmD3motywj9NRw==
X-Received: by 2002:a05:600c:1911:b0:43c:fd2b:823a with SMTP id 5b1f17b1804b1-43d438103f4mr14330845e9.24.1742383082612;
        Wed, 19 Mar 2025 04:18:02 -0700 (PDT)
Message-ID: <730d8143-8cda-49da-a48a-3b82c2b77c9d@suse.com>
Date: Wed, 19 Mar 2025 12:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PVH: account for module command line length
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
by padding and actual size of module command line.

Fixes: 0ecb8eb09f9f ("x86/pvh: pass module command line to dom0")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -712,7 +712,15 @@ static int __init pvh_load_kernel(
      * simplify it.
      */
     last_addr = find_memory(d, &elf, sizeof(start_info) +
-                            (initrd ? ROUNDUP(initrd_len, PAGE_SIZE) +
+                            (initrd ? ROUNDUP(ROUNDUP(initrd_len,
+                                                      elf_64bit(&elf) ? 8 : 4) +
+                                              (initrd->cmdline_pa &&
+                                               strlen(__va(initrd->
+                                                           cmdline_pa))
+                                               ? strlen(__va(initrd->
+                                                             cmdline_pa)) + 1
+                                               : 0),
+                                              PAGE_SIZE) +
                                       sizeof(mod)
                                     : 0) +
                             (cmdline ? ROUNDUP(strlen(cmdline) + 1,
@@ -740,16 +748,19 @@ static int __init pvh_load_kernel(
         if ( initrd->cmdline_pa )
         {
             char *str = __va(initrd->cmdline_pa);
-            size_t len = strlen(str) + 1;
+            size_t len = strlen(str);
 
-            rc = hvm_copy_to_guest_phys(last_addr, str, len, v);
-            if ( rc )
+            if ( len++ )
             {
-                printk("Unable to copy module command line\n");
-                return rc;
+                rc = hvm_copy_to_guest_phys(last_addr, str, len, v);
+                if ( rc )
+                {
+                    printk("Unable to copy module command line\n");
+                    return rc;
+                }
+                mod.cmdline_paddr = last_addr;
+                last_addr += len;
             }
-            mod.cmdline_paddr = last_addr;
-            last_addr += len;
         }
         last_addr = ROUNDUP(last_addr, PAGE_SIZE);
     }

