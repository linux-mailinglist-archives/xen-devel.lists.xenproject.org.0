Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 191AF95C666
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 09:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782167.1191633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shOXh-0007CL-2P; Fri, 23 Aug 2024 07:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782167.1191633; Fri, 23 Aug 2024 07:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shOXg-0007AE-VW; Fri, 23 Aug 2024 07:17:04 +0000
Received: by outflank-mailman (input) for mailman id 782167;
 Fri, 23 Aug 2024 07:17:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1shOXf-0007A8-SV
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 07:17:03 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b10f11c6-611f-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 09:17:01 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5befe420fc2so2328256a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 00:17:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f28f109sm218007166b.55.2024.08.23.00.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 00:17:00 -0700 (PDT)
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
X-Inumbo-ID: b10f11c6-611f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724397421; x=1725002221; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bz8CLLgWlV/7bck03wIYDrH4mmRVyA4EByfbd2a1BD8=;
        b=RxtdgcH21nWHYnk7UowmFYA/ewqPLXVW5F6PnjmesaIXb3M5krDemgcwZV9TxKiwVk
         IT66rXiMTolGYFXWkPdDWWftBX8RA7JMRm6rSDXrpLisFexRj2v7Gc0FCqFjwwXPxBGh
         21a5zI9KliGMnON2/44ok2W7ayWYK44gH6FNz1DZPJ75oa6+TRfjLpD6lr40ShKA7otR
         pl7NLPy6vdillyzczZXwZW0oWFUk3cXFGAviV0x16JzoP3l1+wOp7l3lHMuRD3WUh3pn
         y5Zoum8IvfjB6x8xU6lqpZAkQaxMtaLJelvgTaUIIPnczfE3cDFIIXDbP4SRQSJHJHIn
         ad5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724397421; x=1725002221;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bz8CLLgWlV/7bck03wIYDrH4mmRVyA4EByfbd2a1BD8=;
        b=t2rV3NtceQK7PjG9QNn/vodB5Oc7Cr8U0OwMUM6ZkqAFJ/YmpSzrij1HppcI4ayJcs
         lgHhZnLqtctmHmmrVrWBAkLfMm5CVaJasN2PspepLXphMvjtsXtJgZBFYAlj+yT/hqHj
         1vssVz0KIoTPg4PjCez3sATQ5Uz4foOFEAJiwrDTOmSq9w+HG4bIZsLMdLKGwoShz2hk
         9nvt9qmCS5rovh/cwcyZhYE9WfA9ajh5byFK3T6VP5+xI9DBDzYcDAJTWOwx6FfZH5IO
         yr1qt+UJ/9uSuyenXaYnpYctlfl1+696Pn5JRCy90qB4BekSqn8sdNQPi2tmqrmpq4Fu
         Z+hw==
X-Gm-Message-State: AOJu0YzE/3hMhXdE1N+RXMxC7IlfJ+lxgRE6uZLuwWHSfJZ8h6uCEbwp
	DkWPv6u03C8y1qIYkLeuDWduXPVcU8CU68m7u3QXaQH6GDPKc9ETEofEL9UG98QHZA1QQmNDaX0
	=
X-Google-Smtp-Source: AGHT+IG6YXoZYsN7K394mX6/9pAnXMXC5oc1cSLkNpCZpRwHB/KvO3WusqsXipCrDyIjKz3v7yLuNA==
X-Received: by 2002:a17:907:e245:b0:a86:85eb:bdd1 with SMTP id a640c23a62f3a-a86a52de2e2mr90380166b.31.1724397420881;
        Fri, 23 Aug 2024 00:17:00 -0700 (PDT)
Message-ID: <d14e4ffc-d07b-4a60-8949-ecdcea86cd77@suse.com>
Date: Fri, 23 Aug 2024 09:16:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: drop and avoid use of BUG()
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

Generally it is not a good idea to use BUG() in emulator code. Even for
internal flaws we're better off returning errors to callers, rather than
crashing the system. Replace the sole remaining use and remove the
test / fuzzing harness surrogate. Put in place a declaration pleasing
the compiler when finding uses in Xen headers, while at the same time
breaking the build (at linking time) in case an active reference would
newly appear.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The #undef and override may be going a little too far, but I guess we
can revisit this if and when it actually gets in the way.

While BUG_ON() references BUG() and is hence covered, we may want to
consider to #undef/declare that separately. That way the linker error
would make clear which one it is that was referenced.

I could use EXPECT() instead of kind of open-coding it, but I don't
really like EXPECT(false) or variations thereof.

--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -42,7 +42,6 @@
 
 #include <xen-tools/common-macros.h>
 
-#define BUG() abort()
 #define ASSERT assert
 #define ASSERT_UNREACHABLE() assert(!__LINE__)
 
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1122,7 +1122,9 @@ int x86emul_decode(struct x86_emulate_st
             switch ( def_ad_bytes )
             {
             default:
-                BUG(); /* Shouldn't be possible. */
+                ASSERT_UNREACHABLE(); /* Shouldn't be possible. */
+                return X86EMUL_UNHANDLEABLE;
+
             case 2:
                 if ( ctxt->regs->eflags & X86_EFLAGS_VM )
                     break;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -15,6 +15,9 @@
 # include <asm/x86-vendors.h>
 # include <asm/x86_emulate.h>
 
+# undef BUG /* Make sure it's not used anywhere here. */
+void BUG(void);
+
 # ifndef CONFIG_HVM
 #  define X86EMUL_NO_FPU
 #  define X86EMUL_NO_MMX

