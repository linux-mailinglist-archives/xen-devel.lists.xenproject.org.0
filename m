Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C998283018E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 09:53:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668283.1040347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ1fu-0000QZ-Tz; Wed, 17 Jan 2024 08:53:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668283.1040347; Wed, 17 Jan 2024 08:53:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ1fu-0000Nz-R2; Wed, 17 Jan 2024 08:53:30 +0000
Received: by outflank-mailman (input) for mailman id 668283;
 Wed, 17 Jan 2024 08:53:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQ1ft-0000Nt-8S
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 08:53:29 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1a4f434-b515-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 09:53:28 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d6b4e2945so120510575e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 00:53:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g21-20020a05600c311500b0040d30af488asm25621342wmo.40.2024.01.17.00.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 00:53:27 -0800 (PST)
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
X-Inumbo-ID: e1a4f434-b515-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705481607; x=1706086407; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uJn2eh7MjoWn0LJErIUlXzhR/Fos7qV73ZOoCBsBgU=;
        b=YASAWTU0RbN7GaKNKtm4B1dlU2BUCHlwUlJaGaQ4yHuD9j6iJ1eWhaJXR7cxC/DCN/
         oC9f66rfWdk1hEz7GsqH4H4Lf7lgJRernX0v4Jkt8ps8MtNu9RSH05IwfEt4d/QIfyvq
         +nSFKS9mi5CJD4Qz8tM4ED3XtjEx+yAEoghNnH65GxtuZxfrR+YyhAnz6y/n1yA7e+5d
         SbKCBnpV9YgqaFgJScqIyz+Sv58VjGr8O0CcBicRHO31njfdljb9jP8wW860UCA2L4j2
         ZOuI95vaTyl8ut0/xwiqgj7564V1Hq+PPZ1yCclzANJeyuLjXtEjMRQzEwwZ3Kq/asYn
         tSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481607; x=1706086407;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0uJn2eh7MjoWn0LJErIUlXzhR/Fos7qV73ZOoCBsBgU=;
        b=nQdUAbX6LARPrVW8eeiG88V6zHgjIf2KR38aNQuv91Zq0UkZcyizwiYzsMCXW879hM
         twhDGkd6Whp/1EBctaR0PhG7GdF+RxKuZkRw60vfOQXeSr7to0z7JxRLO7rFIAtywX5x
         ZrqTdV34OY/gYszzyD2sntiD0EIfMfAgRYRNluW8dV3URNoPgHJh/JTdevUO6uS20+7a
         oeXPmpz319zrsbD3V+KaVd1wP2jTGSbIH+XUDVsIWuqVAb6zJihXkLuH4/R771eb8P9R
         yM4VgzSoIQ2N5W3UmI+EiDmxiItJn15DjwRm0eXtfbNveRp9K/m8Q9IDJYqE1n6nrg+6
         kAwg==
X-Gm-Message-State: AOJu0YxzPWtQ5+db6y4gqcHBINLT79gf78hKnDfN/lSMcs1uj3eINlpu
	qvFDO9haB5Z1K6pVIL4o6qIZ0ajoxBnc6lbq4eE5TunBXw==
X-Google-Smtp-Source: AGHT+IHWPrO8zv1AyrTR5DvLnGDFk/ctIrcJbeHK4pBHZ8GM4c2qtuOuRiSJJ00xYT/YfqTUMyNyEw==
X-Received: by 2002:a05:600c:4f90:b0:40e:3a07:41e with SMTP id n16-20020a05600c4f9000b0040e3a07041emr2766018wmq.162.1705481607626;
        Wed, 17 Jan 2024 00:53:27 -0800 (PST)
Message-ID: <fda7586f-a1d1-4500-a6c4-d0e010223ee2@suse.com>
Date: Wed, 17 Jan 2024 09:53:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PVH: Dom0 "broken ELF" reporting adjustments
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

elf_load_binary() isn't the primary source of brokenness being
indicated. Therefore make the respective log message there conditional
(much like PV has it), and add another instance when elf_xen_parse()
failed (again matching behavior in the PV case).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -570,6 +570,8 @@ static int __init pvh_load_kernel(struct
     if ( (rc = elf_xen_parse(&elf, &parms, true)) != 0 )
     {
         printk("Unable to parse kernel for ELFNOTES\n");
+        if ( elf_check_broken(&elf) )
+            printk("Xen dom0 kernel broken ELF: %s\n", elf_check_broken(&elf));
         return rc;
     }
 
@@ -588,7 +590,8 @@ static int __init pvh_load_kernel(struct
     if ( rc < 0 )
     {
         printk("Failed to load kernel: %d\n", rc);
-        printk("Xen dom0 kernel broken ELF: %s\n", elf_check_broken(&elf));
+        if ( elf_check_broken(&elf) )
+            printk("Xen dom0 kernel broken ELF: %s\n", elf_check_broken(&elf));
         return rc;
     }
 

