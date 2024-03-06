Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99207873832
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 14:57:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689338.1074185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhrlf-0000Vn-ML; Wed, 06 Mar 2024 13:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689338.1074185; Wed, 06 Mar 2024 13:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhrlf-0000UH-JT; Wed, 06 Mar 2024 13:57:11 +0000
Received: by outflank-mailman (input) for mailman id 689338;
 Wed, 06 Mar 2024 13:57:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhrle-0000UB-KH
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 13:57:10 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c0aa140-dbc1-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 14:57:08 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56647babfe6so10016008a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 05:57:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f4-20020a05640214c400b005660742bf6bsm6964300edx.52.2024.03.06.05.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 05:57:07 -0800 (PST)
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
X-Inumbo-ID: 6c0aa140-dbc1-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709733428; x=1710338228; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GpSXwArW6nSc+7qCqeXjiXiJRJKCqG2IrSnbmiJuBhE=;
        b=NOMlw2geZsg/VQPYmgUoJCOiR0S0Ay3QrHBSiuGkRjE4lOcOIX9yjm6QM+N+XqNWTB
         pk8/WzMnqHfkUtpXd1i3HtyE875o0L3Py5EISBrKy/pqxbJ+PKmx1PTDRi3KJZPMQ5lV
         msoS+1rSnnN5F6pvdIg1wgtwMwPuk1/JzRgW3Jwbns28AT9SEbsPOqo/qsBuFboJn8OC
         GRdd3ACAQ3HlXycd3tjSvws0PlHMKuPmj2+CIK1z6+f3B8eggRChVnbz2+qGuaOMhniP
         4VfQiYaSQVZLVMQf7l1kJ594gumY3K7Dh7AdwNtEiOYw3TpWX3mbQz+6pwYhcrQxB9Wi
         e93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709733428; x=1710338228;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GpSXwArW6nSc+7qCqeXjiXiJRJKCqG2IrSnbmiJuBhE=;
        b=YkZ/owg/5WboE8ZzF2DRXAJd5VtnmxddJ3yor6DnJS2ihvXl+ZUepN3SGGcwv5NsG1
         fqLCxYQaPol6zjbd8Z4mtN7aUJRikbZjJLQMga+DhwA+h+IYerxkyS+XJnzt31vrb9nx
         XRfB6mEjJLo+Jr5xJdRTxC1hN9z2EuNbtYqmekxEs5CX23zYyiFLVbDwY2WJl5KZz5s5
         rHQUdqmBztObqlisDbx9kPGZH1p46F8ONz/hetFKV8Kbte2/HBPE88lW+lmGl5haAwyO
         PVkcnVruF/5RucOnkjxS+m8X0EkUNVgbyn4immlj0/W4rw9Q8ZBzdZx1LqjxB9ElilFy
         +a0g==
X-Gm-Message-State: AOJu0YxGcHSgrS7BQAkIAc5ov3JoUE9THeAX4n9mv6JJiwoeB49zb/MX
	zf4w3wYFs2gORSvbLIX/w7j1QGGwv4aaYv2b8IP3MEs0nf1gr9d2TI2i8ED+vDFf41dDdGt8tSE
	=
X-Google-Smtp-Source: AGHT+IEliJC6RtMBmtdjfaLY+Ep/8E9D/K60osP95+9w2tiABwxyL4DZmGGCl9dx9j5vdBNFcHKzVw==
X-Received: by 2002:a50:8d86:0:b0:566:825b:98 with SMTP id r6-20020a508d86000000b00566825b0098mr10880581edh.6.1709733427792;
        Wed, 06 Mar 2024 05:57:07 -0800 (PST)
Message-ID: <c28e7361-2427-4bfa-ad4d-f4ba1d17183d@suse.com>
Date: Wed, 6 Mar 2024 14:57:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/entry: re-order exception entry points
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

Arrange for Disp8 JMPs to be usable. On top of the MOVL->MOVB conversion
this further reduces entry point size, such that in particular INT3 (for
guarding against straight line speculation) would then also still fit
within the same 16-byte block, irrespective of CET-IBT being enabled. Of
course when CC_SPLIT_SECTIONS=y the ordering here doesn't matter at all.

Which of the non-IST exception entry points are moved is based on
presumed / guessed frequency of use.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Arguably we could move all these entry points ahead of handle_exception,
accepting that the first few will continue to use Disp32 JMPs.

--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -725,6 +725,59 @@ FUNC(common_interrupt)
         jmp ret_from_intr
 END(common_interrupt)
 
+FUNC(entry_BP)
+        ENDBR64
+        pushq $0
+        movb  $X86_EXC_BP, EFRAME_entry_vector(%rsp)
+        jmp   handle_exception
+END(entry_BP)
+
+FUNC(entry_SS)
+        ENDBR64
+        movb  $X86_EXC_SS, EFRAME_entry_vector(%rsp)
+        jmp   handle_exception
+END(entry_SS)
+
+FUNC(entry_AC)
+        ENDBR64
+        movb  $X86_EXC_AC, EFRAME_entry_vector(%rsp)
+        jmp   handle_exception
+END(entry_AC)
+
+FUNC(entry_NM)
+        ENDBR64
+        pushq $0
+        movb  $X86_EXC_NM, EFRAME_entry_vector(%rsp)
+        jmp   handle_exception
+END(entry_NM)
+
+FUNC(entry_MF)
+        ENDBR64
+        pushq $0
+        movb  $X86_EXC_MF, EFRAME_entry_vector(%rsp)
+        jmp   handle_exception
+END(entry_MF)
+
+FUNC(entry_XM)
+        ENDBR64
+        pushq $0
+        movb  $X86_EXC_XM, EFRAME_entry_vector(%rsp)
+        jmp   handle_exception
+END(entry_XM)
+
+FUNC(entry_UD)
+        ENDBR64
+        pushq $0
+        movb  $X86_EXC_UD, EFRAME_entry_vector(%rsp)
+        jmp   handle_exception
+END(entry_UD)
+
+FUNC(entry_GP)
+        ENDBR64
+        movb  $X86_EXC_GP, EFRAME_entry_vector(%rsp)
+        jmp   handle_exception
+END(entry_GP)
+
 FUNC(entry_PF)
         ENDBR64
         movb  $X86_EXC_PF, EFRAME_entry_vector(%rsp)
@@ -908,41 +961,6 @@ FUNC(entry_DE)
         jmp   handle_exception
 END(entry_DE)
 
-FUNC(entry_MF)
-        ENDBR64
-        pushq $0
-        movb  $X86_EXC_MF, EFRAME_entry_vector(%rsp)
-        jmp   handle_exception
-END(entry_MF)
-
-FUNC(entry_XM)
-        ENDBR64
-        pushq $0
-        movb  $X86_EXC_XM, EFRAME_entry_vector(%rsp)
-        jmp   handle_exception
-END(entry_XM)
-
-FUNC(entry_NM)
-        ENDBR64
-        pushq $0
-        movb  $X86_EXC_NM, EFRAME_entry_vector(%rsp)
-        jmp   handle_exception
-END(entry_NM)
-
-FUNC(entry_DB)
-        ENDBR64
-        pushq $0
-        movb  $X86_EXC_DB, EFRAME_entry_vector(%rsp)
-        jmp   handle_ist_exception
-END(entry_DB)
-
-FUNC(entry_BP)
-        ENDBR64
-        pushq $0
-        movb  $X86_EXC_BP, EFRAME_entry_vector(%rsp)
-        jmp   handle_exception
-END(entry_BP)
-
 FUNC(entry_OF)
         ENDBR64
         pushq $0
@@ -957,13 +975,6 @@ FUNC(entry_BR)
         jmp   handle_exception
 END(entry_BR)
 
-FUNC(entry_UD)
-        ENDBR64
-        pushq $0
-        movb  $X86_EXC_UD, EFRAME_entry_vector(%rsp)
-        jmp   handle_exception
-END(entry_UD)
-
 FUNC(entry_TS)
         ENDBR64
         movb  $X86_EXC_TS, EFRAME_entry_vector(%rsp)
@@ -976,24 +987,6 @@ FUNC(entry_NP)
         jmp   handle_exception
 END(entry_NP)
 
-FUNC(entry_SS)
-        ENDBR64
-        movb  $X86_EXC_SS, EFRAME_entry_vector(%rsp)
-        jmp   handle_exception
-END(entry_SS)
-
-FUNC(entry_GP)
-        ENDBR64
-        movb  $X86_EXC_GP, EFRAME_entry_vector(%rsp)
-        jmp   handle_exception
-END(entry_GP)
-
-FUNC(entry_AC)
-        ENDBR64
-        movb  $X86_EXC_AC, EFRAME_entry_vector(%rsp)
-        jmp   handle_exception
-END(entry_AC)
-
 FUNC(entry_CP)
         ENDBR64
         movb  $X86_EXC_CP, EFRAME_entry_vector(%rsp)
@@ -1025,6 +1018,20 @@ FUNC(entry_DF)
         tailcall do_double_fault
 END(entry_DF)
 
+FUNC(entry_DB)
+        ENDBR64
+        pushq $0
+        movb  $X86_EXC_DB, EFRAME_entry_vector(%rsp)
+        jmp   handle_ist_exception
+END(entry_DB)
+
+FUNC(entry_MC)
+        ENDBR64
+        pushq $0
+        movb  $X86_EXC_MC, EFRAME_entry_vector(%rsp)
+        jmp   handle_ist_exception
+END(entry_MC)
+
 FUNC(entry_NMI)
         ENDBR64
         pushq $0
@@ -1161,13 +1168,6 @@ FUNC(handle_ist_exception)
 #endif
 END(handle_ist_exception)
 
-FUNC(entry_MC)
-        ENDBR64
-        pushq $0
-        movb  $X86_EXC_MC, EFRAME_entry_vector(%rsp)
-        jmp   handle_ist_exception
-END(entry_MC)
-
 /* No op trap handler.  Required for kexec crash path. */
 FUNC(trap_nop, 0)
         ENDBR64

