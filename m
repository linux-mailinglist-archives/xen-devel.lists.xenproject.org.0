Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C8294B948
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 10:50:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773788.1184223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbyq0-0002MI-US; Thu, 08 Aug 2024 08:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773788.1184223; Thu, 08 Aug 2024 08:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbyq0-0002Jm-Rs; Thu, 08 Aug 2024 08:49:36 +0000
Received: by outflank-mailman (input) for mailman id 773788;
 Thu, 08 Aug 2024 08:49:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbypz-0002Jg-UU
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 08:49:35 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22bacde9-5563-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 10:49:34 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7a94478a4eso286641066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 01:49:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c0c7e0sm712311066b.75.2024.08.08.01.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 01:49:33 -0700 (PDT)
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
X-Inumbo-ID: 22bacde9-5563-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723106974; x=1723711774; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJkaHtA/J9SI/0adxdVabs1XoyBLCWwlOZV6CZRNFa0=;
        b=eqrItFViadim2kUolCGKlNPllUseSeRuit8OYH2xnn461+I++CwnYEBaTqio7eLuD0
         yBVC5geUvXCyB3sbTSpoxEvUDVgghWCNctt+9paHlTLMcOKvih/gBp0fnazn8ijXaB/t
         C0JOFhF3QyryM7BE/7gkWVN7bUyNagko8dRZAuNHcGI0kJhOA1JOKIwXDUsabWe1Cj02
         r9Z3iQtR0vWaKe/nNLwnGTTK0wdCZKS7eZkdQvveZ9u5+D35iOxbcAQDIs5/T9kkxOnk
         KZ2Oqpft2rmUWpkJfXzIe+o3lf+R+fY81c9nCSAmkFzKi48+2hS3Z2F+/DoT4zvO4LaQ
         ZqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723106974; x=1723711774;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJkaHtA/J9SI/0adxdVabs1XoyBLCWwlOZV6CZRNFa0=;
        b=Kseqk97EZOt0iyOtCA3FiI5nSWG9516HnJ+s+pu4rrqBlBzd/qZZ5pQQh+WA+RsCSd
         eiYiCucI0FGzLDhC6HjhwFdMW8wIZ6WMTqRgfio3za0wkkYTR1Xrrz7wtwSMfe30fu2P
         jEDlN/50bonPBH8wu0KgaIWelhwuODkMN5Afh9Yplr4JuNbkwgLFNm+wdI4YWHEMODID
         i6PoB7/gALj5CWzGcNF45b2uMl1bm2askTNSu/P5CVZrALkzwyqFuB3ZdaW5eXnhMwxi
         C6C6L7rcF18JUxY/3tRD0n5v7p0zBjZBvaXnP0O9ExjjUy3dehd1TVAnn88b1iiMJg16
         R7RA==
X-Gm-Message-State: AOJu0YxBpZI2i56YYMY4z20887LHOR8OWXIvLPa1U/0aMk6n3vbQmtK6
	c+p7uZNLlEZsIHtv1gY46kU6+CWaMQJBrtfoU9ltJFteQRZP/0kEC3PUIU2XPJemLkgPi2bYmRo
	=
X-Google-Smtp-Source: AGHT+IH984NpWgziB3hXTmoZOVXVVMBbflrYRbfZq/UfTjZUglFAlGkm0i2S8N5KujOl8D1ityPuIQ==
X-Received: by 2002:a17:906:c108:b0:a7a:afe8:1015 with SMTP id a640c23a62f3a-a809207c521mr91324466b.29.1723106973900;
        Thu, 08 Aug 2024 01:49:33 -0700 (PDT)
Message-ID: <f2186827-62e6-4b24-8a6c-0c2a9499c232@suse.com>
Date: Thu, 8 Aug 2024 10:49:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: slightly simplify MB2/EFI "magic" check
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

A few dozen lines down from here we repeatedly use a pattern involving
just a single (conditional) branch. Do so also when checking for the
boot loader magic value.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I further question the placement of the clearing of vga_text_buffer,
just out of context: Shouldn't that be placed with the increments of
efi_platform and skip_realmode? Or else is the terminology in comments
("on EFI platforms") wrong in one of the two places? In the end, if we
are entered at __efi64_mb2_start but the magic doesn't match, we simply
don't know what environment we're in. There may or may not be a VGA
console at the default address, so we may as well (try to) write to it
(just like we do when entered at start).

--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -233,13 +233,11 @@ __efi64_mb2_start:
 
         /* Check for Multiboot2 bootloader. */
         cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
-        je      .Lefi_multiboot2_proto
 
         /* Jump to .Lnot_multiboot after switching CPU to x86_32 mode. */
         lea     .Lnot_multiboot(%rip), %r15
-        jmp     x86_32_switch
+        jne     x86_32_switch
 
-.Lefi_multiboot2_proto:
         /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline. */
         xor     %esi,%esi
         xor     %edi,%edi

