Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFE483026E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 10:37:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668322.1040417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2M6-00050n-F4; Wed, 17 Jan 2024 09:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668322.1040417; Wed, 17 Jan 2024 09:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2M6-0004yK-Bq; Wed, 17 Jan 2024 09:37:06 +0000
Received: by outflank-mailman (input) for mailman id 668322;
 Wed, 17 Jan 2024 09:37:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQ2M4-0004wC-I1
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 09:37:04 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f825b2f6-b51b-11ee-9b0f-b553b5be7939;
 Wed, 17 Jan 2024 10:37:02 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e72a567eeso32556055e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 01:37:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b16-20020adfe650000000b00337a81a0a89sm1207581wrn.114.2024.01.17.01.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 01:37:02 -0800 (PST)
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
X-Inumbo-ID: f825b2f6-b51b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705484222; x=1706089022; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFqWW5VsBqyLXFmEo7/4sxcjiyzuJkj0f+lb546UJ40=;
        b=cmAULrSxsu7/InZOz6U4EORF+C1dWk0LC207WcRKGXTZ8sOX6IbCGMbA5yXOLO3FPk
         xW9qbUq/Qlg75D1afSTI4hcRX8XztXyqCYh9TxSdJLXj3FrAE44kxB0avw1j53jJd+m6
         7j8sbbnqEXVqNdeIjcrxBsQWaKJt9dZzNmi21kTS/1B84MRBM87p8F97v4JDRjNMJ2yX
         2LKhE5JYzSNgDDneGqQU6QX8HDtwUnxzJo5gBsU9nPF2wmF4d3w1Wnui8uvEVAN24Xgs
         b8/mKQetsHJCaZauDzX7I+J2IneDntfRd1dQiVP4QgvRd16QQE5iB0NDR7TrfgVYNvQH
         H/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705484222; x=1706089022;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fFqWW5VsBqyLXFmEo7/4sxcjiyzuJkj0f+lb546UJ40=;
        b=wq2nJs8Y7mCCyFbOxuNjAwsrRZn1ahxzAGpm0lsNxBFM4lmH3Jcn9SdaJlr6G3dtl7
         SFdKnJDXTYTN+4oaT3qWWY8EVnRtnQ/XYEfKGrliu5J97fqlNep6cZGOLbiVD1XO4J9a
         2s3pEMlmk6/J8+mxJXZmYaTopOV/GBIEEP6KnZUIXLSCfSiinG+eaY+/WHhAtXqjN7Fv
         02OK/p10lhEJnefS3RhYRsS7PSKNtp8jPrIoJwEzlxGKdcuze7jS2riFyBHj3ucunDlb
         f/BJQviMT4OvpsUMpS8+SkwPSLktWe0B+slUVaVD/uYlCEuLY/4OoCZ7aW0uFGuhy58E
         VFGw==
X-Gm-Message-State: AOJu0YzFw6T9COTMzjZYVkkog8xQ5X9qTHjUx9wbyk8UGf5jxNmn5+b/
	denYe09fcv0gK+MoWgY+LxqqX2KB38uqoZybklVMyiYtzg==
X-Google-Smtp-Source: AGHT+IHgyd8afn6XbClzUUL+fC+1zLdh2cUL+Iq7vApGCsszqBVEKKypKkSyFySw7QbV1uXIg58CFA==
X-Received: by 2002:a05:600c:1f86:b0:40b:5f03:b3b1 with SMTP id je6-20020a05600c1f8600b0040b5f03b3b1mr2784312wmb.211.1705484222341;
        Wed, 17 Jan 2024 01:37:02 -0800 (PST)
Message-ID: <28b46611-ff98-45cd-a2b0-ffe36b8f0ccf@suse.com>
Date: Wed, 17 Jan 2024 10:37:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/PV: avoid indirect call for I/O emulation quirk hook
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

This way ioemul_handle_proliant_quirk() won't need ENDBR anymore.

While touching this code, also
- arrange for it to not be built at all when !PV,
- add "const" to the last function parameter and bring the definition
  in sync with the declaration (for Misra).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Obviously the file may want moving to pv/ then. I wasn't sure whether
to also fold doing so right into here.

Of course things could also be done the other way around: Have
ioemul_handle_quirk as function name and ioemul_handle_proliant_quirk
be the boolean.
---
v2: Don't use alternative_call(); drop indirect call altogether.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -45,7 +45,7 @@ obj-$(CONFIG_LIVEPATCH) += alternative.o
 obj-y += msi.o
 obj-y += msr.o
 obj-$(CONFIG_INDIRECT_THUNK) += indirect-thunk.o
-obj-y += ioport_emulate.o
+obj-$(CONFIG_PV) += ioport_emulate.o
 obj-y += irq.o
 obj-$(CONFIG_KEXEC) += machine_kexec.o
 obj-y += mm.o x86_64/mm.o
--- a/xen/arch/x86/include/asm/io.h
+++ b/xen/arch/x86/include/asm/io.h
@@ -47,10 +47,14 @@ __OUT(b,"b",char)
 __OUT(w,"w",short)
 __OUT(l,,int)
 
-/* Function pointer used to handle platform specific I/O port emulation. */
+/*
+ * Boolean indicator and function used to handle platform specific I/O port
+ * emulation.
+ */
 #define IOEMUL_QUIRK_STUB_BYTES 9
+extern bool ioemul_handle_quirk;
 struct cpu_user_regs;
-extern unsigned int (*ioemul_handle_quirk)(
-    uint8_t opcode, char *io_emul_stub, struct cpu_user_regs *regs);
+unsigned int ioemul_handle_proliant_quirk(
+    uint8_t opcode, char *io_emul_stub, const struct cpu_user_regs *regs);
 
 #endif
--- a/xen/arch/x86/ioport_emulate.c
+++ b/xen/arch/x86/ioport_emulate.c
@@ -8,11 +8,10 @@
 #include <xen/sched.h>
 #include <xen/dmi.h>
 
-unsigned int (*__read_mostly ioemul_handle_quirk)(
-    uint8_t opcode, char *io_emul_stub, struct cpu_user_regs *regs);
+bool __ro_after_init ioemul_handle_quirk;
 
-static unsigned int cf_check ioemul_handle_proliant_quirk(
-    u8 opcode, char *io_emul_stub, struct cpu_user_regs *regs)
+unsigned int ioemul_handle_proliant_quirk(
+    uint8_t opcode, char *io_emul_stub, const struct cpu_user_regs *regs)
 {
     static const char stub[] = {
         0x9c,       /*    pushf           */
@@ -95,7 +94,7 @@ static const struct dmi_system_id __init
 static int __init cf_check ioport_quirks_init(void)
 {
     if ( dmi_check_system(ioport_quirks_tbl) )
-        ioemul_handle_quirk = ioemul_handle_proliant_quirk;
+        ioemul_handle_quirk = true;
 
     return 0;
 }
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -112,7 +112,7 @@ static io_emul_stub_t *io_emul_stub_setu
     /* Some platforms might need to quirk the stub for specific inputs. */
     if ( unlikely(ioemul_handle_quirk) )
     {
-        quirk_bytes = ioemul_handle_quirk(opcode, p, ctxt->ctxt.regs);
+        quirk_bytes = ioemul_handle_proliant_quirk(opcode, p, ctxt->ctxt.regs);
         p += quirk_bytes;
     }
 

