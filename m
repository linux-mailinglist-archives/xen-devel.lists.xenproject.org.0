Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BF1872110
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 15:04:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688809.1073442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhVP3-00060h-Pl; Tue, 05 Mar 2024 14:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688809.1073442; Tue, 05 Mar 2024 14:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhVP3-0005yj-N1; Tue, 05 Mar 2024 14:04:21 +0000
Received: by outflank-mailman (input) for mailman id 688809;
 Tue, 05 Mar 2024 14:04:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhVP2-0005yd-KZ
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 14:04:20 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41d5fb5e-daf9-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 15:04:18 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a44e3176120so357305466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 06:04:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z20-20020a170906271400b00a441cb52bfcsm6098270ejc.165.2024.03.05.06.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 06:04:17 -0800 (PST)
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
X-Inumbo-ID: 41d5fb5e-daf9-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709647457; x=1710252257; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gYp1d3LLJ7Rbx1dzq46z952PRA1TGcqipE4P/XboyY=;
        b=azPCxJrndwVWwA+h90xThTQlk9ESMvjQBC+BZwazDueRfBuEDhGTwmHHMQ60RxlKFF
         D3hGSZOK4lgd5OzJzdGmF0ekFOsMRm43BaR6zESK18WMOt0AZH10QCNPLBxE65HGiWr6
         jXUwbUWY3ljoO7MftsykVOvOJOFtoAqaAj6o9ZNEbaJDr+l1ch+BdStDMiLD1RGDjBdb
         VkTe34/LZn+Ixe0IxOP2E7/NISO58pNAqd5hh/AzOhMax4A77Arp5pTqJtsmD+7X4iMf
         WC7GrK4VdFk2YVw+HJZmxYIfvvCGNnxs5ezd9vjj2K1vniV3A27r6QVa/NcGvVf2fo5A
         60Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709647457; x=1710252257;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9gYp1d3LLJ7Rbx1dzq46z952PRA1TGcqipE4P/XboyY=;
        b=PLx4r+9zpTW399QSMrLmnU3Pz+IhFgXUMvC3w5fc0G+NkSsr7Vp7/ZTD6m5xyEo5R3
         t4uygnzcYJSlTPVF7ZxyTHcqWD+H35P6VGCaMnOk347A6COYP2vHFXabQ7S+hzgtkxVO
         qdOhS9TCZ5d4jWWMpBZ3Yhioa7Hueyklf+tNTkArjcktmYYCF1wUn6y+Xab+48GZOTE9
         qay2OJd4KsS2WJ6x4mxm4SfjTo2QptlKQstUTDg695ImY340Ffe4w9KvbN1ZLe7/YDMj
         jFuXzWrx688t67l9Oswqk48eTNWH2P3Pw8pFeQWdeQwRTCWIyVuui5bo42ZQ+x08SxMq
         gaBQ==
X-Gm-Message-State: AOJu0YznEUFzD/tzP2Sjw5BbIpce2v20sNywWSGXP5xxH6zLjY44/nlA
	nFEAm25OTNl/HWwRR4vTnmaiHRIYYKPaEVU4qyJVHg5AZD44SzEfxTVYh6bsge1J5hOTApJmdwo
	=
X-Google-Smtp-Source: AGHT+IEmx183CeLsgL4hlq8MMiJ4ZlOOteea0qMS5xQRs89h5q+8N9szLSe57ThrQil464A8UKtSQw==
X-Received: by 2002:a17:906:560b:b0:a45:7dc6:5bb with SMTP id f11-20020a170906560b00b00a457dc605bbmr2853544ejq.71.1709647457608;
        Tue, 05 Mar 2024 06:04:17 -0800 (PST)
Message-ID: <0ba4903d-638d-408e-bcd4-7c13cb56e078@suse.com>
Date: Tue, 5 Mar 2024 15:04:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/entry: shrink insn size for some of our EFLAGS
 manipulation
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

--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -52,7 +52,7 @@ UNLIKELY_END(syscall_no_callback)
         movq  %rax,TRAPBOUNCE_eip(%rdx)
         movb  %cl,TRAPBOUNCE_flags(%rdx)
         call  create_bounce_frame
-        andl  $~X86_EFLAGS_DF,UREGS_eflags(%rsp)
+        andb  $~(X86_EFLAGS_DF >> 8), UREGS_eflags + 1(%rsp)
 /* %rbx: struct vcpu */
 test_all_events:
         ASSERT_NOT_IN_ATOMIC
@@ -223,7 +223,7 @@ LABEL_LOCAL(.Lrestore_rcx_iret_exit_to_g
 /* No special register assumptions. */
 iret_exit_to_guest:
         andl  $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), EFRAME_eflags(%rsp)
-        orl   $X86_EFLAGS_IF, EFRAME_eflags(%rsp)
+        orb   $X86_EFLAGS_IF >> 8, EFRAME_eflags + 1(%rsp)
         addq  $8,%rsp
 .Lft0:  iretq
         _ASM_PRE_EXTABLE(.Lft0, handle_exception)
@@ -346,7 +346,7 @@ LABEL(sysenter_eflags_saved, 0)
 
         GET_STACK_END(bx)
         /* PUSHF above has saved EFLAGS.IF clear (the caller had it set). */
-        orl   $X86_EFLAGS_IF, UREGS_eflags(%rsp)
+        orb   $X86_EFLAGS_IF >> 8, UREGS_eflags + 1(%rsp)
         mov   STACK_CPUINFO_FIELD(xen_cr3)(%rbx), %rcx
         test  %rcx, %rcx
         jz    .Lsyse_cr3_okay
@@ -361,11 +361,11 @@ LABEL(sysenter_eflags_saved, 0)
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

