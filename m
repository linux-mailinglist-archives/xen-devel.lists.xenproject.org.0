Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9744784CBB9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 14:38:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677573.1054257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi7j-0001qh-3s; Wed, 07 Feb 2024 13:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677573.1054257; Wed, 07 Feb 2024 13:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi7j-0001pH-12; Wed, 07 Feb 2024 13:37:59 +0000
Received: by outflank-mailman (input) for mailman id 677573;
 Wed, 07 Feb 2024 13:37:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXi7h-0000oU-Aj
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 13:37:57 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 195b303c-c5be-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 14:37:55 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40f033c2e30so5412265e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 05:37:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056000110c00b0033b4ebc3c8fsm1328999wrw.2.2024.02.07.05.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 05:37:54 -0800 (PST)
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
X-Inumbo-ID: 195b303c-c5be-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707313075; x=1707917875; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YjmnSJwKzDpM0u5Pn+iHXjwC2VYerV7wNfCIIKzoSdk=;
        b=a/XQdWITxE3GaPINMKu5S+GDaSDA+tn5jzD+GuTUWliYQl9s5+NrwqYG5rCJwCaPda
         f6g/BbH/4WCvStQly0uIna22yFXHjUzaZxpaZ9Akw/zgmItM9kc3yfT/s3L2afMpHVV6
         uWYVwTIxnoJy2vn+VoS6T+i90k7qZn5kKAAyHeTIKkc598MW5Qcy69TtqDZIScdeljMt
         GBrJVxr9VAHX5y57yPiiN2XJ4rGXVggNDyciValHbbIYKHj30fBJEGqSuCmEIho5xmcS
         Kq9anCNVqaI7rcxTa+Clq9ayKbRpw6E9coF2F+kXYzMwZX6RzyNrCF4b07a9IEi/VK81
         ofrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707313075; x=1707917875;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YjmnSJwKzDpM0u5Pn+iHXjwC2VYerV7wNfCIIKzoSdk=;
        b=mQpKeqIJO/XsbDPaFR55janBjD1lVSqkAAV4l0XqaAAFlU2LMIz/l5x3hjAk4E7XLE
         s1jNP/R1CxJoWeFkI8N8U0gK7weoRU9MZmcXrWi7Tc+EacWUc0PU0WpjNQ9KgESibIqT
         Q8bpwsVhU0ciKcd419kooQNPmZxU6+xrgtiEubzW7ohCPyXhNW0rssuKo1SDqQtVorHt
         9CE4zvh+oDryfvJ6tYUIF/tSOhGZCHLCzzs33T+G3cKfHwAFitJTH43kyOpvjmTImkUU
         2DH4+mUnnm8YVnIG3GO20M/YiQWEFm+1JepoT7NDioxZ+KtMHIxriGvHZw7iEYwdT953
         LVEQ==
X-Gm-Message-State: AOJu0YwgGudOvkAgljd8xGw7UQaEAbd0Wgry7rWN8Y/itPgEnu9531Tl
	V5raSUlM++JXCgAM4BBjK2S0552FSAXs5Khqyv5eFWWEGUGxUJd+YCKoVOj35G0bDALSD30+ktg
	=
X-Google-Smtp-Source: AGHT+IFIHCSmXG0T6Q2bGWzEPV7V0mNOStg32L3BpcsG4d89iHLOwNJgqR5ZSsZMIA8DmFvMvAimpw==
X-Received: by 2002:adf:f410:0:b0:33b:3fe8:6413 with SMTP id g16-20020adff410000000b0033b3fe86413mr4042855wro.27.1707313075072;
        Wed, 07 Feb 2024 05:37:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXpQ+thZHgfpMWIr7AbathifGsjYNkr2ViU0JJR0dAKbtDRfTUvw0iSXnDeixeMRkyHCKnIWgVcl6rcXp3APL74VONGyJ50qXo1p/d9EEZ+CvatvWYoNSKMznKtwYMq4Y2QFCCOEkpqVER
Message-ID: <cbc04b39-44cd-4f1f-a011-5d9d313f24d3@suse.com>
Date: Wed, 7 Feb 2024 14:37:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v6 4/7] x86/ACPI: annotate assembly functions with type and
 size
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

Use the generic framework from xen/linkage.h.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The .Lsuspend_err label is used in a cross-function manner here, but
it's not clear to me what - if anything - to do about this.
---
v6: New.

--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -7,7 +7,7 @@
         .text
         .code64
 
-ENTRY(do_suspend_lowlevel)
+FUNC(do_suspend_lowlevel)
         push    %rbp
         push    %rbx
         push    %r12
@@ -32,6 +32,7 @@ ENTRY(do_suspend_lowlevel)
 
         /* It seems we didn't suspend.  Get out of here. */
         jmp     .Lsuspend_err
+END(do_suspend_lowlevel)
 
         /*
          * do_suspend_lowlevel() is arranged to behave as a regular function
@@ -43,7 +44,7 @@ ENTRY(do_suspend_lowlevel)
          *
          * Everything else, including the stack, needs restoring.
          */
-ENTRY(s3_resume)
+FUNC(s3_resume)
         lgdt    boot_gdtr(%rip)
 
         mov     saved_cr0(%rip), %rax
@@ -132,6 +133,7 @@ ENTRY(s3_resume)
         pop     %rbx
         pop     %rbp
         ret
+END(s3_resume)
 
 .data
         .align 16
@@ -142,5 +144,4 @@ saved_cr0:      .quad   0
 saved_ssp:      .quad   0
 #endif
 
-GLOBAL(saved_magic)
-        .long   0x9abcdef0
+ASM_INT(saved_magic, 0x9abcdef0)


