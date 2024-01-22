Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF042836492
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 14:41:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669895.1042386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuYC-0005bV-L5; Mon, 22 Jan 2024 13:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669895.1042386; Mon, 22 Jan 2024 13:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuYC-0005ZX-IG; Mon, 22 Jan 2024 13:41:20 +0000
Received: by outflank-mailman (input) for mailman id 669895;
 Mon, 22 Jan 2024 13:41:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPlZ=JA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rRuYB-0005Y4-7j
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 13:41:19 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb5eab41-b92b-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 14:41:17 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cca8eb0509so35336151fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 05:41:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bm7-20020a056e02330700b003627e7b69c8sm603276ilb.76.2024.01.22.05.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 05:41:17 -0800 (PST)
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
X-Inumbo-ID: eb5eab41-b92b-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705930877; x=1706535677; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gQiTUoB8bG3hbenFnAZCwyFKHLeA13w6e6iDnvkSNlE=;
        b=KyFRthheAO0xbqlwC6UXO9NicuV6ENjI1ilZEwAoO2GqA0uikSHk9iJLGd9cKXw0lA
         ezrz9qXEM0qF1jVGogwO88RxY9bE2zCF6uoTNGwymlMuuzuOMl9GZRub92lcT2rC/PoE
         9acWjn76wqFCRnM/v1EhuqUbPFF+PoZmgbVksRrjLlTeXQhtm1sAaj005FGzJLPq4X/G
         XfdRSr7gM+vPwBzcTDF1NeH12jaEIK8FGousqCblCRPxBCWVsUE19YQSx2lTjR9oDwIK
         AdxPVUW8z0+jjGoc6k+8GWdVP8oet8XalwDTtN8mp8kHxkl1r+GqZO2y+AwyTsH3gm94
         XegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705930877; x=1706535677;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQiTUoB8bG3hbenFnAZCwyFKHLeA13w6e6iDnvkSNlE=;
        b=XZTt/rl2/uGDiujSynKaxAlhjRC3lu2RzPwn6xjndWxBbPwozxw7aabnfiOenwsJ6E
         hTu9xMyBvCJUsw4xbbNEqR0gsQ8deoq4flZ/G+GS/NOysntnlrN9R0I1II8LteVqs/q9
         n6u6/N17tbhU6LQI9K44ukU60Duh+zt0zrey+2Rb146MbTeeqOyj4Vzfio4bViolyjYg
         Ggmfanb/wD4/qJefvQDxTIF2NFf/iiMXJFM9pBtGDdg5xoT7H4eA7kVQcj7XIcphohPr
         rZRz5jUL+ANAobbUjrCHyDR1pP3u+7rVKj6gS77jj5B6rMPv3cZHM+kHHfsYkW+v9pbx
         TitQ==
X-Gm-Message-State: AOJu0YyJokoKO1tGhr+PLQp6u2uAz4lGJuKpb/VDd3dUZK0h5wEuWLjR
	yJN/lG56srocw4M//45BGGfAQCkjcFxryaz7J9/gglRjqGANPPacQ+ANu68mOvzgSbhTx9vLfCs
	=
X-Google-Smtp-Source: AGHT+IF2OFhBV/MCaRblskpSFb5QCSm+rYtJLQDdV72NpQx7Egq5O1/8RO6hr3vPLu/7JJQUaHfBsg==
X-Received: by 2002:a2e:7a1a:0:b0:2cc:6d87:9a91 with SMTP id v26-20020a2e7a1a000000b002cc6d879a91mr1606703ljc.72.1705930877499;
        Mon, 22 Jan 2024 05:41:17 -0800 (PST)
Message-ID: <7edea456-81ba-4e83-9441-0e82333ce168@suse.com>
Date: Mon, 22 Jan 2024 14:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86: Dom0 "broken ELF" reporting adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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

elf_load_binary() isn't the primary source of brokenness being
indicated. Therefore make the respective PVH log message there
conditional (much like PV has it), and add another instance when
elf_xen_parse() failed (again matching behavior in the PV case).

Make the PV side match the (new) use of %pd here.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Use %pd and bring PV in line with that as well.

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -570,6 +570,8 @@ static int __init pvh_load_kernel(struct
     if ( (rc = elf_xen_parse(&elf, &parms, true)) != 0 )
     {
         printk("Unable to parse kernel for ELFNOTES\n");
+        if ( elf_check_broken(&elf) )
+            printk("%pd kernel: broken ELF: %s\n", d, elf_check_broken(&elf));
         return rc;
     }
 
@@ -588,7 +590,8 @@ static int __init pvh_load_kernel(struct
     if ( rc < 0 )
     {
         printk("Failed to load kernel: %d\n", rc);
-        printk("Xen dom0 kernel broken ELF: %s\n", elf_check_broken(&elf));
+        if ( elf_check_broken(&elf) )
+            printk("%pd kernel: broken ELF: %s\n", d, elf_check_broken(&elf));
         return rc;
     }
 
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -1041,8 +1041,7 @@ int __init dom0_construct_pv(struct doma
 
 out:
     if ( elf_check_broken(&elf) )
-        printk(XENLOG_WARNING "Dom0 kernel broken ELF: %s\n",
-               elf_check_broken(&elf));
+        printk("%pd kernel: broken ELF: %s\n", d, elf_check_broken(&elf));
 
     return rc;
 }

