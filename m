Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4435F98CDE5
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 09:42:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808628.1220591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svtzH-0000jh-Lb; Wed, 02 Oct 2024 07:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808628.1220591; Wed, 02 Oct 2024 07:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svtzH-0000gu-Ix; Wed, 02 Oct 2024 07:41:31 +0000
Received: by outflank-mailman (input) for mailman id 808628;
 Wed, 02 Oct 2024 07:41:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svtzG-0000go-Uu
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 07:41:30 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcf1b238-8091-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 09:41:30 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5399651d21aso2663791e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 00:41:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2776d92sm815990766b.29.2024.10.02.00.41.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 00:41:29 -0700 (PDT)
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
X-Inumbo-ID: bcf1b238-8091-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727854889; x=1728459689; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5CHaMSAiL5AEl471kqqmTQg9/r6lFXAI5Aki2hX8i4=;
        b=JoSphJNJjP6rZXngSYoXTQaPWWXR00Jz0V9iDVSvDGotlTE/ttVPogmTGuejwGQMOC
         A0r01jX1hfMBk28GM3vBs01l45it6hJWVW07FnSMVaIUt45eCPK1pNunXG+FJklBXG/f
         6tl4+3BM36elsEWyaZ+GxrJ5glm2ow/qOCdF9qIzDodA5mnLTdIfSOC5UgKrO5N1jUgZ
         O0skjRrPJHLQZ8j9nrXmsCnA6T+yygw3DVYuU7WnIYfkrp21NqcEnUNuolWdp1K0YQ4T
         Kb4ne63jKmXtqVD2X0oIIFOY7relSwj4ae8Q+cmg3UAh+3CL67tehmSHh5DpAUBKsRXu
         FO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727854889; x=1728459689;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5CHaMSAiL5AEl471kqqmTQg9/r6lFXAI5Aki2hX8i4=;
        b=SLTQNp9ZUAFae7Q+3XjPBiLIg+3iNZPryyYd4cVuloc/tR1mKsIa0KfXUCBryEmXqn
         PpkYQ5B/Fwe88rMmfzwrsAzznDtK99pKBY4YZ6RR2X15j8ESIiI5W1Q/Ga1RYVAIWMkV
         AMyqOBuKr/Xka3cJ2CnZ63562/r96V1x8MWGBACu9waC3GJ9RYoxNJR0EObDqZw5Erup
         AkAsAGi/w8wH9n2JHuj0T7hDvvE7piktL5THUTj0o6K33GMn6Kj8DHZ/9wmkMpnJMG2d
         15uRmQRKRqozqMieQ0Ymnoir2UyTqAvzHcwCJtbkWp5pdsjAVQim0IlF3VOUoGZ8eatO
         fyyg==
X-Gm-Message-State: AOJu0Yx7CSimLwPla1YCZa6Dyq44DGzQ88kLDKZ9aT8fH5Bn+3MpLK9B
	qskjlftpIKo5f3zslbrASACFP1IcC2BPZO2QkBqhLPpye03QNw34RLFc8lgaRQQgmBDqvqX4OeM
	=
X-Google-Smtp-Source: AGHT+IERdqb9qdHStl8or4ETA8QyqQH0N09K/GXe6HtT9FCs2ZdArU+R3G+yiOCIJZXE2u5kWS7jGQ==
X-Received: by 2002:a05:6512:1245:b0:538:9b5d:9885 with SMTP id 2adb3069b0e04-539a0601d0amr1167689e87.0.1727854889539;
        Wed, 02 Oct 2024 00:41:29 -0700 (PDT)
Message-ID: <26cfd90a-91f2-4bf4-9607-8ab6c7823048@suse.com>
Date: Wed, 2 Oct 2024 09:41:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/ACPI: annotate assembly data with type and size
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

Further use the generic framework from xen/linkage.h. While there drop
excess alignment and move to .bss.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course alongside ASM_INT() we could introduce ASM_QUAD() and
ASM_QUAD_LOCAL() (only the latter needed right here) to aid readability.
Thoughts?

--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -1,3 +1,5 @@
+#define DATA_FILL 0 /* For the .bss contributions at the bottom. */
+
 #include <asm/asm_defns.h>
 #include <asm/msr-index.h>
 #include <asm/page.h>
@@ -134,13 +136,20 @@ LABEL(s3_resume)
         ret
 END(do_suspend_lowlevel)
 
-.data
-        .align 16
+        .bss
 
-saved_rsp:      .quad   0
-saved_cr0:      .quad   0
+DATA_LOCAL(saved_rsp, 8)
+        .quad   0
+END(saved_rsp)
+DATA_LOCAL(saved_cr0, 8)
+        .quad   0
+END(saved_cr0)
 #ifdef CONFIG_XEN_SHSTK
-saved_ssp:      .quad   0
+DATA_LOCAL(saved_ssp, 8)
+        .quad   0
+END(saved_ssp)
 #endif
 
+        .data
+
 ASM_INT(saved_magic, 0x9abcdef0)

