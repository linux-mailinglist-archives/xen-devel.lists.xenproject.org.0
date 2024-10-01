Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C09798C15F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 17:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808243.1220114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svebW-0007HP-1l; Tue, 01 Oct 2024 15:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808243.1220114; Tue, 01 Oct 2024 15:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svebV-0007Ev-V1; Tue, 01 Oct 2024 15:15:57 +0000
Received: by outflank-mailman (input) for mailman id 808243;
 Tue, 01 Oct 2024 15:15:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svebU-0006cV-RY
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 15:15:56 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e75d128-8008-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 17:15:56 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-537a399e06dso6505097e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 08:15:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c299aca5sm729826066b.224.2024.10.01.08.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 08:15:55 -0700 (PDT)
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
X-Inumbo-ID: 0e75d128-8008-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727795756; x=1728400556; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sjsBqq7ERY0I9Pp9VoYjNgavFM9yKqdiMFCtPcKDqbg=;
        b=IuBv05IGNrT/veMfo9wpWIup1x89loxU5JWxWqeczPFVTWg03Ruezokr28PaDKUrgF
         hSyRgM19eNrwnEcPQrfgPE88Gpx6QUwT58CH0yvzer/xxhKX46+uAyyFiZKjP+rnDKca
         uJ1j/UYP5nlq0UH8ortmGVgpfoe4E2kJ97zyISJaZRDwsDHnNR7BQrTmUQ6sSoWPUliQ
         ns5L/F0Of9Wdbnm3FDLW0BnADd0gJa1OfBDlnfW4RBJQ6zabgPBOQJcEUPFBgGaWsGm/
         SiN4ctTH0k/oGqecegZbdkooo3CddGeJ3ELLugHov4bOO8kiQmB4/XdW1Lv3kqKtnWXs
         9lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727795756; x=1728400556;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sjsBqq7ERY0I9Pp9VoYjNgavFM9yKqdiMFCtPcKDqbg=;
        b=ATB5h3b8TiSc/t3r7z1uYFxWts493k1PM9WUjmyuFxvckigLMOpKwIpwoL6vGYT+ee
         FBN6ub3xmzb74tBDDnVitWTayaKxjYGe5W8EZlr8NmV+kvuc7vcvL6xCKjYUuPhBA+WJ
         N741/K7H7BxNMHCRnZZGwut94asSYTgwu/Rkz40/QbaKBUshF2zlf1bSViY9pBe8ObzY
         Ifhy6l2qQqWxEJ/CKkMq/4iskur45UiM3jm112Nf9FYubig2Vgxj+3KmQl9aNsb37ltd
         r7bWhU5i0h/BvALngcfgN1nO8xtyBRa6bFmyA7Q4txiWLt8cXFcv8neMyAIQFEPh2m59
         76sg==
X-Gm-Message-State: AOJu0Ywli16MeLwiv+AsVsvA9nQ5MC+0Pr7Ks9Hvl7kxlQAn0g9JO9zN
	ENjXhcqYkjDdOwZGNo06iFmE/LMSg171H9WqyJoFaLb2nO8FJRqp5152Y7C01sgJN7jARTQ6QoY
	=
X-Google-Smtp-Source: AGHT+IHq5yhz7ot9y7JTTyL6KR2Wcrx/BJ+S0h8LRDuZX50qvlrPYnDnE9WmfuzmRniHPmQ6xKa2rA==
X-Received: by 2002:a05:6512:3b8d:b0:52b:bf8e:ffea with SMTP id 2adb3069b0e04-5389fc6429dmr9702674e87.40.1727795755726;
        Tue, 01 Oct 2024 08:15:55 -0700 (PDT)
Message-ID: <b0d5a6d5-e6ee-4281-8d33-b90444633373@suse.com>
Date: Tue, 1 Oct 2024 17:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 06/11] x86: move ENTRY(), GLOBAL(), and ALIGN
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
In-Reply-To: <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... to boot code, limiting their scope and thus allowing to drop
respective #undef-s from the linker script.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
An obvious alternative would be to convert boot code right away too, but
I think this has lower priority for now.
---
v7: Re-base.
v6: New.

--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -10,6 +10,15 @@
 #include <asm/cpufeature.h>
 #include <public/elfnote.h>
 
+#define ALIGN .align CONFIG_FUNCTION_ALIGNMENT, CODE_FILL
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
@@ -42,14 +42,6 @@
 /* Linkage for x86 */
 #ifdef __ASSEMBLY__
 #define CODE_FILL 0x90
-#define ALIGN .align CONFIG_FUNCTION_ALIGNMENT, CODE_FILL
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
@@ -1260,7 +1260,7 @@ FUNC_LOCAL(autogen_stubs, 0) /* Automati
         .if vec >= FIRST_IRQ_VECTOR
 #endif
 
-        ALIGN
+        .align CONFIG_FUNCTION_ALIGNMENT, CODE_FILL
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
 


