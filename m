Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9241787379B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 14:20:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689134.1074164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhrBx-00035A-Ov; Wed, 06 Mar 2024 13:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689134.1074164; Wed, 06 Mar 2024 13:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhrBx-00032Y-MK; Wed, 06 Mar 2024 13:20:17 +0000
Received: by outflank-mailman (input) for mailman id 689134;
 Wed, 06 Mar 2024 13:20:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhrBv-00032O-MO
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 13:20:15 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 448f3a3d-dbbc-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 14:20:14 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-513173e8191so8651540e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 05:20:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 pv18-20020a170907209200b00a44b90abb1dsm5488207ejb.110.2024.03.06.05.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 05:20:13 -0800 (PST)
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
X-Inumbo-ID: 448f3a3d-dbbc-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709731214; x=1710336014; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ir/m3nUHAc93iVzQkj1bZcSedz9SoljniaiWtgBL3sM=;
        b=QSL29rtgagCCMBYI8xLVOidHgqkpP6ovdNtTc7sH6MbSazXao9Ke2XX9clY3g+Eplo
         PpIkcG56P41QShMEPc2kBseQlrbWLlLvj09HoeIPKsiWaO81Dcrg71ElLEVVDJp5iKVo
         YCSRVQNLyEZHSyLTQYgW8NSaYtD2s7g6uFFLTj5fr6ug7xAGbEL0vlsT4wDr2v5J9u97
         Uaske9pfNA805fxi7Fvu3zfR/PhVLCth38FJVqdpnpSA4fee6IdY7OJBwXruEhmy94Fd
         SpDrYKOQdJ3meCSK0fNeozP0j94HidUi1LL7NdWg2weGpTi4pBr19A3DqY9PGDYa4Cub
         XVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709731214; x=1710336014;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ir/m3nUHAc93iVzQkj1bZcSedz9SoljniaiWtgBL3sM=;
        b=sD+gLPsKsRE0thul37u0qT9NMPbaFApSl1ChNkAEc/Xzptaq5ji3B4Xcep52AaXhjT
         vFxPs3Y4WJn2IbF5tjhVav/3Gabxicr5bBALp1RB4NICESXQ5ZI9KzHORnWj03FDwXCp
         1xVaHd/aG+LmqiQEostv/I717syBt9t8fkSNBs9RFz/5vNcWeQ9ZyI5sU5BgroTfMJQ6
         ZSRhz/DI6N+7IsFNdKSv2nAiPg3K9pGMRhBs1GPNbX1gdlL7Kz1KTKn3i9IVE2yeOl/k
         /2qKZVbrGd8ZyJRa9S+3iZV3v4dP3gN2kbgaDDJrb+h03bUIOHAzD+cMe1uwCj1AXYsY
         y+kQ==
X-Gm-Message-State: AOJu0YyjgNLn7RCFQqO5ZMVPTnC/VFMkFdSNJYd4aZZUgr3aM527UDdJ
	hQpQtKk/IgnLbRg8ekAYpnnLpmJD8aFUGxD59XBMBbZ2eoxHv6pnV5FCkUHN3eQ0OmNiRZfqWMM
	=
X-Google-Smtp-Source: AGHT+IHoAuXlDSvZEWgCgyz7PSkyGjh+3vPeSz09C4rtgttNn6dWuo378+VQ41znJHZWBUWim4SDBw==
X-Received: by 2002:ac2:4ed2:0:b0:513:1c07:3be1 with SMTP id p18-20020ac24ed2000000b005131c073be1mr3038198lfr.4.1709731214014;
        Wed, 06 Mar 2024 05:20:14 -0800 (PST)
Message-ID: <88024bc6-6448-4bf5-b0f6-a75a697cb54f@suse.com>
Date: Wed, 6 Mar 2024 14:20:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/entry: shrink insn size for some of our EFLAGS
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
v2: Drop switch_to_kernel change.

--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
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

