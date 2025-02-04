Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865DBA27709
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 17:21:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881728.1291891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfLex-0004xf-BP; Tue, 04 Feb 2025 16:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881728.1291891; Tue, 04 Feb 2025 16:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfLex-0004vS-8a; Tue, 04 Feb 2025 16:20:23 +0000
Received: by outflank-mailman (input) for mailman id 881728;
 Tue, 04 Feb 2025 16:20:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yR1u=U3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tfLev-0004vM-UQ
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 16:20:21 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec20a93c-e313-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 17:20:17 +0100 (CET)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-38daf1f5091so390276f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 08:20:17 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e245f4a8sm198934435e9.37.2025.02.04.08.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 08:20:16 -0800 (PST)
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
X-Inumbo-ID: ec20a93c-e313-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738686017; x=1739290817; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M4EovPjOYAoXTT/pXIE1TyQJEu/M2D4KCn6tH2veppM=;
        b=fjZjKUSTiKU1nrUJH/04nf4IGQ9Zf38pNvEUHAI5X3wxhixWXrjOKiM+2yzSb8uxVY
         nwt1Bh6JmLzyx/qVrtIp0dKD0fcu61OL3l6IcM5N5HSQ1cwrlJCnAtchDW+o764kLMyB
         ns0RvXWRnl/s8RQ+JHofs+lHbuCtPHT28SNPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738686017; x=1739290817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4EovPjOYAoXTT/pXIE1TyQJEu/M2D4KCn6tH2veppM=;
        b=sl2Dj3hyaZC0jH6Y6XkVy6mV5Z9/cEMpAMPW6AXIRJxygoa1kK1g374WKDy2dz+sRS
         HLfJs7AdBnTxc4uD57LzFxWgIuJYRSZm1a4LEk5nKLQrPx7/Y1BcHAp0FmRvBnFBGS4K
         flgdc4ZDj1GcvvFhDkF00O8RebYK9Kj7SJiLx8i4QgKqH5RI4+i60me7qXHoMcwBWokm
         PQic9OJGJoG5yGHxbc83wf7fBjAkrlpF3kO1AqGEMmePvD+0HHryqeQthHrrq/qGPlWj
         qN9+bUr99VF5QnbvNHpaeD19er6ZNqyiYOUKGL6GCLze7WhTuA1B5ufQ/kKdyNizmdix
         n+AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTV8gVEYeCYQBu/aYJrIxAMzLfJ5F21N9rOyFbE3fem+BpDCPm48qT4bZIqrLgvBQPIOVs9hWvEX0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBYObs07zP2iCPfJHTke4aqsVRsO7e6hW2IflMrjrQoD64Z6+L
	0mTvSvVj1QlWWunfPRzhTa6bojgg9PlamNasFelYlIdlBoDpaTgXl0LCFF07ktI=
X-Gm-Gg: ASbGncu6P8JftpXHq3Lk1yKC1CfsjFQVAcEXse9BZczvp3CpklQekMkyoKgzZ/M827n
	0sH6w6Bdn0QLUPqte3EOzNSvPbO73AuUymhxFuaAMycLQElTpQouecG6AzVrvMAaWz62MMbKi37
	P0FW4wp7vx9swmgJJkxWJVCmGFX50B4paxGtBpOUTm8C+0Ilquh9grWNELwEwSnmjTU+Po0AMop
	T/ZUc8LNSbe6x1dvCjtYV7H/KtjD8mBKsTAOH7vh2u5bBQhkhP2Sf40bAhguAzvxvwWTKJ8BG+2
	qZj+L5F/HZOT5B4zkmXXEEOQpvyqr+zutHma0/brePayj/I/qAFuHEo=
X-Google-Smtp-Source: AGHT+IF+YjrlV1xNPScLfIoJjPLRB3vmiW53Db9CYbsvGHGlFdjSdsaPSJtTXoa+LkI6yZET9yInrg==
X-Received: by 2002:a05:6000:2c1:b0:38c:5ce2:7755 with SMTP id ffacd0b85a97d-38c5ce27ebbmr16476274f8f.23.1738686017121;
        Tue, 04 Feb 2025 08:20:17 -0800 (PST)
Message-ID: <e78b9755-76f6-4189-a000-7a7e3588cae9@citrix.com>
Date: Tue, 4 Feb 2025 16:20:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
References: <20250122101407.52282-1-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250122101407.52282-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/01/2025 10:14 am, Frediano Ziglio wrote:
> Although code is compiled with -fpic option data is not position
> independent.

This doesn't parse.  ITYM "Although the code is compiled with -fpic,
pointers in data are not position independent."

>  This causes data pointer to become invalid if
> code is not relocated properly which is what happens for
> efi_multiboot2 which is called by multiboot entry code.

"efi_multiboot2()" to highlight that you're naming a function.

>
> Code tested adding
>    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
> in efi_multiboot2 before calling efi_arch_edd (this function
> can potentially call PrintErrMesg).
>
> Before the patch (XenServer installation on Qemu, xen replaced
> with vanilla xen.gz):
>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic ID - 00000000 !!!!
>   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX:0
>   RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 0000000000210246
>   RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 0000000000000010
>   RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 000000007FF0C210
>   RSI  - FFFF82D040467CE8, RDI - 0000000000000000
>   R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 0000000000000000
>   R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 000000007FF0C1B8
>   R14  - 000000007EA33328, R15 - 000000007EA332D8
>   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
>   GS   - 0000000000000030, SS  - 0000000000000030
>   CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 000000007FC01000
>   CR4  - 0000000000000668, CR8 - 0000000000000000
>   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
>   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
>   GDTR - 000000007F9DB000 0000000000000047, LDTR - 0000000000000000
>   IDTR - 000000007F48E018 0000000000000FFF,   TR - 0000000000000000
>   FXSAVE_STATE - 000000007FF0BDE0
>   !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=000000007EE20000, EntryPoint=000000007EE23935) !!!!
>
> After the patch:
>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>   Test message: Buffer too small
>   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>
> This partially rollback commit 00d5d5ce23e6.
>
> Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI platforms")
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

00d5d5ce23e6 needs to be a second fixes tag then too.

In hindsight, it was a naive fix.  But, by reverting this part of it,
you're reintroducing a build breakage on Clang.

I wrote that construct because it is what Clang-3.8 generated, albeit
with the proper __initconstrel attribute to make the
SPEICAL_DATA_SECTIONS check be happy.

Anyway, see:
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=x86/urgent&id=1105ab42a84bc11c62597005f78ccad2434fbd66

This needs to be paired with an unconditional -fno-jump-tables covering
any TU which the MB2+EFI path executes at the wrong address.

~Andrew

