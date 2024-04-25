Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 506538B2410
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 16:27:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712112.1112529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s003Q-0003cH-K8; Thu, 25 Apr 2024 14:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712112.1112529; Thu, 25 Apr 2024 14:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s003Q-0003aT-FV; Thu, 25 Apr 2024 14:26:28 +0000
Received: by outflank-mailman (input) for mailman id 712112;
 Thu, 25 Apr 2024 14:26:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s003O-0003aL-Hc
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 14:26:26 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb3e7466-030f-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 16:26:24 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a58872c07d8so401423566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 07:26:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f5-20020a170906138500b00a5531e61002sm9537491ejc.206.2024.04.25.07.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 07:26:23 -0700 (PDT)
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
X-Inumbo-ID: cb3e7466-030f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714055184; x=1714659984; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UoynMmNlIkOLxRvb/HPJS9wiCcgwjYyCPIIxLwtPwqs=;
        b=KpJajXCgmSpXG2Hx3fMsB1uDyC7ruYU84nnHfSL358sGgEQfY9CiZ/tujtc8e/OJz0
         nMUkyXXxEsCO7JGwGmaTtajNzxoVMTymg2zrUj8F6o1FgdLcuMlao8N//OIt152pSOW8
         6FZZemzGrFhTTpX7v2dKGefZlnrBnPw7ndP/Qx++K8z+WSfTbiJ9Olh22zAehb5ver7W
         58Bi1yp8I0KL735IhdXtup4bqqKGEDv8FfZt9DE6Qtx/1qv9LiiZgbN8vQj8eqNzdBnW
         2s7M09nnv8IDFlh2yN/7Yup1svvB6f54krLgcAZPID9BYjHZhVDJ1JQ2oQJz2f0owpyf
         Kbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714055184; x=1714659984;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UoynMmNlIkOLxRvb/HPJS9wiCcgwjYyCPIIxLwtPwqs=;
        b=WFD+k9vHnHAi/fPjv7AZ3KHJlW1XVSCRGTu37Cb09IH7JShrtk30kWSDYQv89xOMpU
         JB8PoaLFiiscdJS4DJ/jkduBGQT8b8hfJ123Z6siA0tpEjYgGFkEMnbUTQobnXS99A6A
         ZDT1maGs2tdl54GWc6y6UB+lX3AsYuglFowsSZ4o8yR3gLCiHmiigSrb43bPPpDwAZWd
         wvaq5t0kg9Wo9BY+/acR336Pc08e2Ytz6HBERQwBk/tMIzLvF7Yt2uWPH38EZIgOE/iB
         6O62p8fDh6rdyumxUxLQVKST2eemLdR1IN2MKWlHRx/uZ15dLcTyx9Unn9L0HpWJZLMt
         Dvnw==
X-Gm-Message-State: AOJu0YxScWdRx5x7hymfRjb+oVUPXZEjhO8rzQm6TLGcpaV86lT/VPKw
	ph8EVmhfhuZJ24LUANiP/egTt3Z+YvhznOQmPTL6yxgdnsCaprDVIdqf/iJrT0yTZcBGTADlcIk
	=
X-Google-Smtp-Source: AGHT+IGeC+PXfCA+YbMD5GxcRk3JXcR7VagRu/HkUhyDtWki1+Yh91LIDU27tFOigqdgPYbEKf4/YQ==
X-Received: by 2002:a17:907:724d:b0:a58:bd49:da9d with SMTP id ds13-20020a170907724d00b00a58bd49da9dmr1817267ejc.18.1714055183527;
        Thu, 25 Apr 2024 07:26:23 -0700 (PDT)
Message-ID: <e3048e97-23f0-4c51-84c5-2ba48d6e4ff1@suse.com>
Date: Thu, 25 Apr 2024 16:26:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86/entry: shrink insn size for some of our EFLAGS
 manipulation
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

Much like was recently done for setting entry vector, and along the
lines of what we already had in handle_exception_saved, avoid 32-bit
immediates where 8-bit ones do. Reduces .text.entry size by 16 bytes in
my non-CET reference build, while in my CET reference build section size
doesn't change (there and in .text only padding space increases).

Inspired by other long->byte conversion work.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Numbers above are biased by me also having the straight-line-speculation
change in the tree, thus every JMP is followed by an INT3. Without that,
.text.entry size would also shrink by 16 bytes in the CET build.
---
v3: Re-base.
v2: Drop switch_to_kernel change.

--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -226,7 +226,7 @@ LABEL_LOCAL(.Lrestore_rcx_iret_exit_to_g
 /* No special register assumptions. */
 iret_exit_to_guest:
         andl  $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), EFRAME_eflags(%rsp)
-        orl   $X86_EFLAGS_IF, EFRAME_eflags(%rsp)
+        orb   $X86_EFLAGS_IF >> 8, EFRAME_eflags + 1(%rsp)
 
         SPEC_CTRL_COND_VERW     /* Req: %rsp=eframe                    Clob: efl */
 
@@ -355,7 +355,7 @@ LABEL(sysenter_eflags_saved, 0)
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
         /* PUSHF above has saved EFLAGS.IF clear (the caller had it set). */
-        orl   $X86_EFLAGS_IF, UREGS_eflags(%rsp)
+        orb   $X86_EFLAGS_IF >> 8, UREGS_eflags + 1(%rsp)
         mov   STACK_CPUINFO_FIELD(xen_cr3)(%r14), %rcx
         test  %rcx, %rcx
         jz    .Lsyse_cr3_okay
@@ -370,11 +370,11 @@ LABEL(sysenter_eflags_saved, 0)
         cmpb  $0,VCPU_sysenter_disables_events(%rbx)
         movq  VCPU_sysenter_addr(%rbx),%rax
         setne %cl
-        testl $X86_EFLAGS_NT,UREGS_eflags(%rsp)
+        testb $X86_EFLAGS_NT >> 8, UREGS_eflags + 1(%rsp)
         leaq  VCPU_trap_bounce(%rbx),%rdx
 UNLIKELY_START(nz, sysenter_nt_set)
         pushfq
-        andl  $~X86_EFLAGS_NT,(%rsp)
+        andb  $~(X86_EFLAGS_NT >> 8), 1(%rsp)
         popfq
 UNLIKELY_END(sysenter_nt_set)
         testq %rax,%rax

