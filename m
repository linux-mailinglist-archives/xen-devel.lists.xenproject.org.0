Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8535987358E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 12:26:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689072.1074022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpP4-0006Rt-AD; Wed, 06 Mar 2024 11:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689072.1074022; Wed, 06 Mar 2024 11:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpP4-0006P8-7d; Wed, 06 Mar 2024 11:25:42 +0000
Received: by outflank-mailman (input) for mailman id 689072;
 Wed, 06 Mar 2024 11:25:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhpP3-0006P2-FE
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 11:25:41 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 431d76d4-dbac-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 12:25:40 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a458eb7db13so112713066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 03:25:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w18-20020a17090652d200b00a4320e22b31sm7133679ejn.19.2024.03.06.03.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 03:25:39 -0800 (PST)
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
X-Inumbo-ID: 431d76d4-dbac-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709724340; x=1710329140; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zf1Waj0LmMTyGt1GCCI2TdwHJ4hgHS02iTcHBtw6WHI=;
        b=cQ6yZitXcL3xBrbQ8v6Q42vDmTs4jH7liqCk4I8asmb1LfEqrL8vcE0gs7OWaXoN4r
         ZXBOesdFyRcMcy5swqEtCyAmbcu3RWzOXi/DGaiPHlViQrUVU+MU2zvsb+vHxFQrlv/h
         PUG5rIOhM/ujQcYr0yzasujHeF4E0GSrIh/9VcwLAlqfpUwBaTay50xSo65b55fnpB5D
         mhjZOa3rSfjcsz0xSG5huKqXOdqruI6VpFTJ1soIkY9xPpguOxFXgiAyBnU9dvaP7Wq6
         F7/eY+1QgPpgEnI5gjClAbw54mlySJ41Non9mp/5DA145WtFgHKt6XVvR+zgC8JJ7aeT
         026g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709724340; x=1710329140;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zf1Waj0LmMTyGt1GCCI2TdwHJ4hgHS02iTcHBtw6WHI=;
        b=Nr8Jr+5slZTgN5cJjxPCNDTLPqfvw+4AtaSvmnde0LkQ+WbVP1EXUglyPIx0cWRF1L
         bs9GkR5BPF9u6eTjOLE5247h5IUopXQ9PYYTAOQ0RG+5hM/AE8lKXUXts94n+YlfEvPf
         yzIP5UTpOYTw5CKudjJHNXenbYD8riAUDaOOikSLp5NRTAHTObhkFNQw0P1WHzwTq3Eg
         Si1QwJqjce5e5dGWyYL07NMd2LIxvSO9cR75RPIjr3+1jUiwSyOPmhMcdF6+hKsMOAd8
         jVWmi10ZfbP6+xK9PdwayJlZCtjgxcc1zl+vwAByZ0XN+MVX3s2Gy3V/fQT7xfmLPsD6
         ITMA==
X-Gm-Message-State: AOJu0YxuimFflQnWWJzjl7vg9Ce+lACqy+hlY4m0lK1pGwqfXMEXLWtZ
	7srf4AVnOoNzFPn8j78wSYZQtCCZWxpXPJUYLlvvnfZPX7+/NoC5wtf/KGV0sIT6iquWngewa5A
	=
X-Google-Smtp-Source: AGHT+IGnq28vUHn7hfcJEwujD1i++7PEuHNcqlOqt4hlZwl7YHrIF391IHGucqa2DimvaeRVfl6gyw==
X-Received: by 2002:a17:906:ae56:b0:a45:46e0:be9a with SMTP id lf22-20020a170906ae5600b00a4546e0be9amr5779447ejb.35.1709724339792;
        Wed, 06 Mar 2024 03:25:39 -0800 (PST)
Message-ID: <d0fba0c4-7a37-4ad7-80c8-5d2e129601a7@suse.com>
Date: Wed, 6 Mar 2024 12:25:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/asm: add commas to further macros definitions/invocations
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

In light of recent observations with how macros are handled by gas,
let's play by what we informally set for ourselves as a guideline: Use
commas to separate parameters/arguments.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In INDIRECT_{CALL,JMP} adding commas to the arguments passed on makes
things look a little odd (for no longer looking similar to ordinary use
of instruction mnemonics + operands). Thoughts on omitting the commas
there?

--- a/xen/arch/x86/include/asm/alternative-asm.h
+++ b/xen/arch/x86/include/asm/alternative-asm.h
@@ -11,7 +11,7 @@
  * enough information for the alternatives patching code to patch an
  * instruction. See apply_alternatives().
  */
-.macro altinstruction_entry orig repl feature orig_len repl_len pad_len
+.macro altinstruction_entry orig, repl, feature, orig_len, repl_len, pad_len
     .long \orig - .
     .long \repl - .
     .word \feature
--- a/xen/arch/x86/include/asm/asm-defns.h
+++ b/xen/arch/x86/include/asm/asm-defns.h
@@ -29,7 +29,7 @@
     BUG   /* Shouldn't return */
 .endm
 
-.macro INDIRECT_BRANCH insn:req arg:req
+.macro INDIRECT_BRANCH insn:req, arg:req
 /*
  * Create an indirect branch.  insn is one of call/jmp, arg is a single
  * register.
@@ -59,11 +59,11 @@
 
 /* Convenience wrappers. */
 .macro INDIRECT_CALL arg:req
-    INDIRECT_BRANCH call \arg
+    INDIRECT_BRANCH call, \arg
 .endm
 
 .macro INDIRECT_JMP arg:req
-    INDIRECT_BRANCH jmp \arg
+    INDIRECT_BRANCH jmp, \arg
 .endm
 
 #ifdef CONFIG_XEN_IBT
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -281,7 +281,7 @@ static always_inline void stac(void)
  * @compat: R8-R15 don't need reloading, but they are clobbered for added
  *          safety against information leaks.
  */
-.macro RESTORE_ALL adj=0 compat=0
+.macro RESTORE_ALL adj=0, compat=0
 .if !\compat
         movq  UREGS_r15(%rsp), %r15
         movq  UREGS_r14(%rsp), %r14
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -104,7 +104,7 @@
 .L\@_done:
 .endm
 
-.macro DO_OVERWRITE_RSB tmp=rax xu
+.macro DO_OVERWRITE_RSB tmp=rax, xu
 /*
  * Requires nothing
  * Clobbers \tmp (%rax by default), %rcx
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -158,7 +158,7 @@ FUNC(compat_restore_all_guest)
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
 
-        RESTORE_ALL adj=8 compat=1
+        RESTORE_ALL adj=8, compat=1
 .Lft0:  iretq
         _ASM_PRE_EXTABLE(.Lft0, handle_exception)
 END(compat_restore_all_guest)

