Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B1584CBC0
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 14:39:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677583.1054288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi93-0003Ys-1B; Wed, 07 Feb 2024 13:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677583.1054288; Wed, 07 Feb 2024 13:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi92-0003Wv-Ti; Wed, 07 Feb 2024 13:39:20 +0000
Received: by outflank-mailman (input) for mailman id 677583;
 Wed, 07 Feb 2024 13:39:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXi91-0003WW-5C
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 13:39:19 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a920ba9-c5be-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 14:39:18 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33aea66a31cso412730f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 05:39:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056000110c00b0033b4ebc3c8fsm1328999wrw.2.2024.02.07.05.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 05:39:17 -0800 (PST)
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
X-Inumbo-ID: 4a920ba9-c5be-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707313157; x=1707917957; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ivg8xh0fXC1hxH27jiq7v5DWoiDVmbEsIYwYYVUpzS4=;
        b=Obgnlhr+f1zii/+AoaP0+kIaDXOavp/kmgUd0fuQwpRvGvscBnhDHuQTU8Ji1fz63r
         18n6NqP2G0KEPpKIPiZHlrOs5868yBl6Cj4czuFNRE0b/F/PbIloMZhW2mrNOn8yiwcA
         bnLBsWkMuVDiYmj/lbA6djNS0Enqm6t8S83C6nxPdmG4c/eOkxl4HmYCgzc8QKBqEZmH
         51odUB04VCewZANTdxd7N2r4plSiUHBniS3BqCYEXTzCUFX7GyAeq/bMubdbrnQFFq1L
         2iAr8oBWg692CRDUEftWx5zFjPRo2n809ICZnRkQJau+Iuc3tjLwuHPf4tU3W1tm77Q6
         oHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707313158; x=1707917958;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivg8xh0fXC1hxH27jiq7v5DWoiDVmbEsIYwYYVUpzS4=;
        b=FpDz14eODr9EKnF/opvADi0X5VyTK/VKH4nxAVZmHzzO8T+xNXWQLCeU/Ewip4Wb/4
         MAnM7WqyVTMXszkYX1Csa+Cmu01tqdYpM7ywG4P2xqBqL4VqcOqqto5U9SHWLjsT9iuK
         TtbbLbqJex2vjnUzOydojdrFpz3VOuE5MQZQXw+8vL5YRlXDi+/Ze8e0pgJxnmBzkKJE
         WFa2PJDI4obfXQeQc7WV4x6PeybrxfVcuouLbcVhzZdkQKmcp+OWGzyqCrMaN2gjc0kY
         Sfu/X/jzvtoJuCT52ynLGjMHV3FT+5LXmrsEiD3iaDchS8Xom/manFGBV+PThPpPCeyR
         ijGA==
X-Gm-Message-State: AOJu0Yyc3Zku/4YjhdsL9DRoUOnJ8+GZagq3ELpS5tzh9wf3N/JSOCBd
	7w6Q92Ds57qaajMZmmkCu4WoZT9zvQ/O4tqwvd3qPgNUKlSKqiQNIHXAygVDfU8Bf2xJlVuVA2c
	=
X-Google-Smtp-Source: AGHT+IHmlckhq6dGHNx2qssCV2e0/bynu+ZfTWcsbiepMstmyGqYumdOaKYcN9bbm1jkuYUM2agbWQ==
X-Received: by 2002:a5d:67d1:0:b0:33b:51d8:17d7 with SMTP id n17-20020a5d67d1000000b0033b51d817d7mr483477wrw.60.1707313157792;
        Wed, 07 Feb 2024 05:39:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXSnUDo8ufld7OrDNYBTm/ECVPFis4JzxZm2xiWvmlQlLYJxgTEiubKkMLhgYGe66j7m6cvF6G+f10orkR7VeNSWAx0sb/9K5lMdXHHlmumazQoy0FIq77hAjZyJKLAJ+qHMFDRZIkFgDcC
Message-ID: <64785449-1ca6-41f7-9012-2f432c171e3a@suse.com>
Date: Wed, 7 Feb 2024 14:39:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v6 7/7] x86: move ENTRY(), GLOBAL(), and ALIGN
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <3ba82c3a-ff95-43d0-8672-a63b23bc2cdc@suse.com>
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
In-Reply-To: <3ba82c3a-ff95-43d0-8672-a63b23bc2cdc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... to boot code, limiting their scope and thus allowing to drop
respective #undef-s from the linker script.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
An obvious alternative would be to convert boot code right away too, but
I think this has lower priority for now.
---
v6: New.

--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -10,6 +10,15 @@
 #include <asm/cpufeature.h>
 #include <public/elfnote.h>
 
+#define ALIGN .align CODE_ALIGN, CODE_FILL
+#define ENTRY(name)                             \
+  ALIGN;                                        \
+  GLOBAL(name)
+#define GLOBAL(name)                            \
+  .globl name;                                  \
+  .hidden name;                                 \
+  name:
+
         .section .text.header, "ax", @progbits
         .code32
 
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -45,14 +45,6 @@
 #ifdef __ASSEMBLY__
 #define CODE_ALIGN 16
 #define CODE_FILL 0x90
-#define ALIGN .align CODE_ALIGN, CODE_FILL
-#define ENTRY(name)                             \
-  ALIGN;                                        \
-  GLOBAL(name)
-#define GLOBAL(name)                            \
-  .globl name;                                  \
-  .hidden name;                                 \
-  name:
 #endif
 
 #define NR_hypercalls 64
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -1199,7 +1199,7 @@ FUNC_LOCAL(autogen_stubs, 0) /* Automati
         .if vec >= FIRST_IRQ_VECTOR
 #endif
 
-        ALIGN
+        .align CODE_ALIGN, CODE_FILL
 1:
         ENDBR64
         pushq $0
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -5,8 +5,6 @@
 #include <xen/lib.h>
 #include <xen/xen.lds.h>
 #include <asm/page.h>
-#undef ENTRY
-#undef ALIGN
 
 #ifdef EFI
 


