Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E686B83AD2D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 16:24:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671093.1044242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSf6e-0006vC-90; Wed, 24 Jan 2024 15:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671093.1044242; Wed, 24 Jan 2024 15:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSf6e-0006tL-5P; Wed, 24 Jan 2024 15:24:00 +0000
Received: by outflank-mailman (input) for mailman id 671093;
 Wed, 24 Jan 2024 15:23:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSf6c-0006tB-Fo
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 15:23:58 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 978b6f0e-bacc-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 16:23:57 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cdeb954640so67458931fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 07:23:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h3-20020a05660224c300b007ba7365ef13sm7073466ioe.51.2024.01.24.07.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 07:23:56 -0800 (PST)
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
X-Inumbo-ID: 978b6f0e-bacc-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706109837; x=1706714637; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiFe89OlB0ztEDTTtlTEcBTLBXtT94hlr0TSVcs2b+E=;
        b=Lfww/1dBJdRPTxMjVxJGyhI8jWzmlbnt5r4814+o32lEUiYXvY977f3robu2KLa3pq
         H0iNS7YPdwpPkkriDHRfr/ivk53CFuLXaMuCZHa/k3A/h25v8pDCRtTxPIL9KjsRDFTe
         4LlVEXm5T+oeBS/0GqseYpeFk7rcXh3FH4WFgWRIdgbg/Xlq9kvrRRJyy2+vJ86Z+L4f
         c43cmxiZz3IBqvS+hyYOu1vilvXPsRdr6C7yGr5jHNLzP2m2N+PCp/k4Ean3UAYt5vnu
         5pUFD3IehfHcW0nJ7WjFaW64nVTcxY62NwdkAcU/wZs5sMnHhvz+WeH6pZOZpGaTRx4E
         3hJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706109837; x=1706714637;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HiFe89OlB0ztEDTTtlTEcBTLBXtT94hlr0TSVcs2b+E=;
        b=aRkw42QDFjgMneVzzdiMIOzMykWTf2+rn4MELR/rlbfgd0MxdvOt8oE93JY3/Avlca
         Yc8YwMOI5vgdBJrlt4+mdAyY5nvEGNO2zfnRyOC0vHqb4J13YYiTaFaLabMIJBSl+zXt
         f9ZmEHf0ac4TN1Y7hgwfrQI6R0Kc1rRi38OeER5FHQnaXIY5R9gY6nMGL88BQzWuNjRZ
         CjHzLxZFayFNs03St+81nlwNWGt3bfMGSu5l1CQghtvn6yA1vy5sUs6aLzJa/CsxPSwy
         UYy4fil4Ge/6WzUByksGFfYmUrVJAsT9HOAvwcKEe9v0NFTvjbdtU1LJJPFFFeaJbgD/
         0IOQ==
X-Gm-Message-State: AOJu0YwJ+a4iadt8Qx1mC+/IHd3RsFk3FAJPG1AEm2hEYvXnOS7BHN4H
	kyTXMdLHJEKHdva/pvU+8hNHhfqZLukL0XpVfjYbJaDUnSUPZYNllo1uze9QCgO3KBVhaUWZWAo
	=
X-Google-Smtp-Source: AGHT+IGV+ClFAcCU/Sm/fLZ72mgavjoi7hja4VvglCxK6aPfBpO4QKyje84qoTmeX8vOOxmYbq3BSQ==
X-Received: by 2002:a2e:80d9:0:b0:2cd:3487:9a05 with SMTP id r25-20020a2e80d9000000b002cd34879a05mr824693ljg.88.1706109836883;
        Wed, 24 Jan 2024 07:23:56 -0800 (PST)
Message-ID: <3a2345f2-c4a5-4265-b96f-8eed0f193706@suse.com>
Date: Wed, 24 Jan 2024 16:23:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/entry: replace two GET_CURRENT() uses
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

Now that we have %r14 set up using GET_STACK_END() in a number of
places, in two places we can eliminate the redundancy of GET_CURRENT()
also invoking that macro. In handle_ist_exception() actually go a step
farther and avoid using %rbx altogether when retrieving the processor
ID: Obtain the current vCPU pointer only in the PV32-specific code
actually needing it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -118,6 +118,7 @@ void __dummy__(void)
 #endif
 
     OFFSET(CPUINFO_guest_cpu_user_regs, struct cpu_info, guest_cpu_user_regs);
+    OFFSET(CPUINFO_processor_id, struct cpu_info, processor_id);
     OFFSET(CPUINFO_verw_sel, struct cpu_info, verw_sel);
     OFFSET(CPUINFO_current_vcpu, struct cpu_info, current_vcpu);
     OFFSET(CPUINFO_per_cpu_offset, struct cpu_info, per_cpu_offset);
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -749,7 +749,7 @@ FUNC(handle_exception, 0)
 .Lxcpt_cr3_okay:
 
 handle_exception_saved:
-        GET_CURRENT(bx)
+        mov   STACK_CPUINFO_FIELD(current_vcpu)(%r14), %rbx
         testb $X86_EFLAGS_IF>>8,UREGS_eflags+1(%rsp)
         jz    exception_with_ints_disabled
 
@@ -1128,9 +1128,8 @@ handle_ist_exception:
 #ifdef CONFIG_PV
         testb $3,UREGS_cs(%rsp)
         jz    restore_all_xen
-        GET_CURRENT(bx)
         /* Send an IPI to ourselves to cover for the lack of event checking. */
-        movl  VCPU_processor(%rbx),%eax
+        mov   STACK_CPUINFO_FIELD(processor_id)(%r14), %eax
         shll  $IRQSTAT_shift,%eax
         leaq  irq_stat+IRQSTAT_softirq_pending(%rip),%rcx
         cmpl  $0,(%rcx,%rax,1)
@@ -1139,6 +1138,7 @@ handle_ist_exception:
         call  send_IPI_self
 1:
 #ifdef CONFIG_PV32
+        mov   STACK_CPUINFO_FIELD(current_vcpu)(%r14), %rbx
         movq  VCPU_domain(%rbx),%rax
         cmpb  $0,DOMAIN_is_32bit_pv(%rax)
         je    restore_all_guest

