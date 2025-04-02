Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DD5A79190
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 16:57:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935915.1337282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzzWN-0003fQ-Dx; Wed, 02 Apr 2025 14:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935915.1337282; Wed, 02 Apr 2025 14:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzzWN-0003dG-Ak; Wed, 02 Apr 2025 14:56:51 +0000
Received: by outflank-mailman (input) for mailman id 935915;
 Wed, 02 Apr 2025 14:56:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qYE3=WU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzzWL-0003d5-4S
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 14:56:49 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3bd7b34-0fd2-11f0-9ea9-5ba50f476ded;
 Wed, 02 Apr 2025 16:56:48 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-391342fc1f6so6019294f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 07:56:48 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb61b633asm23109565e9.37.2025.04.02.07.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 07:56:47 -0700 (PDT)
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
X-Inumbo-ID: b3bd7b34-0fd2-11f0-9ea9-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743605808; x=1744210608; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nv1p4IGpQMMNQSNqQTAs0ujjLm9bUOMpacx56ZbSUkU=;
        b=XRXAfoNxGMJoi3SSPFOOMjmpxN1kxtLllm6dTiONDe5yXuUVKRI7x2Yf3wx04DEqfm
         bBRDmh2zPE6IB68PiGyffoD8EzbBG7ib9vZ3V9C9yH8U7Q93oA3wChsFYzwRscJuQHpZ
         9l5TM01SwMMQnPAZvAdO/3ffxo3Q+4ZywgtQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743605808; x=1744210608;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nv1p4IGpQMMNQSNqQTAs0ujjLm9bUOMpacx56ZbSUkU=;
        b=rzpsGaMBzG9IGXyyRMfvYywVheCqmlLuAQni8WCGfXLGeHtIQS6BMMGJ6HRBo9/tm0
         cgGL/7miAC5Ka9Oay/qkaoK//TV6idmdRiXY1yeB53boWPTIjDIXVJN0o5kxRkEtZTbe
         aG2rS1N55MEtqHM0G6/sFN2t5UhEf2LAukzO6Drw+QB+Pi9L7znDEobiuCiEeVclLCF5
         tt1BuhYvp1+3C2oy8uyqShnCXJjwI5ZhhwV5g3dMwJDUzMRsDJo4mqxfjbeaT0rtaYxQ
         773vT4I+SEcfxDwh+SB+S+MDNTdGxLaWpVZ4sAMomjHc7mFX46ALTpyItjwhi7oQV12U
         ueMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyXLm5GnRjGS0rpPp7sSgJRfCMIP6SpGGMzhZ7izSUnKyxxXbBtGm9xZ/AvcmsdS3NtFgBR9vi9gY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqEdq+hOvjNX3qMRI//ZX9fgwMY6zX12YIG3I1Ny0syf4EdSF1
	hpzYHcerLpoiMOvkZ5PGoK3w5Mi8qEHENliQ9mKJLYRvAN/WdJ1YKIyzJWnJZQ4=
X-Gm-Gg: ASbGncuk/7mWrJEj3Og5tsyy6AEuZdT6r0gg/B119sbGVziwtPSzTDt8Eyk3XVLWX3X
	ErUalPPQd9viRgFmwjXRaTtdkNwsq8UBrUexpAPNkvmBjcElzOv0RV7Hn+M/6RgTK0Ccku9MHCe
	KMGfB7PAqcdCUervfPMydjnU74Jy8hHtfvs9JNpN6xqoctpCp6/WtkZGBj5LSFMNpRsl87ylQQq
	SNXLc1ZaqVNSy42iNVre4yV/42PYFu4WhqIOL516FnXFKSW8OCtz77SGmrxKQWtNxbbKWbOQYGB
	M64HuaTtWYmQFw3qxe4/i8dJHrUbqrKKEvhlEqruldocWAifIJF0w1ZxVrK8x/yqqCXhk2hDDag
	wXzUU0ck4NA==
X-Google-Smtp-Source: AGHT+IHzP++h2ww1qZXeELRWUTt6/wilZpQQvJ4b0ZwzO4UtO5aSU0bhV/qlHLCNWkvkZ+bz9Ntl2A==
X-Received: by 2002:a05:6000:1789:b0:39c:cc7:3c62 with SMTP id ffacd0b85a97d-39c1211b6edmr13973063f8f.51.1743605807593;
        Wed, 02 Apr 2025 07:56:47 -0700 (PDT)
Message-ID: <70d8d88d-63e1-4622-8b30-09ff2f0eff87@citrix.com>
Date: Wed, 2 Apr 2025 15:56:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/1] xen/x86: drop wrappers of SVM instructions
To: "Alexander M. Merritt" <alexander@edera.dev>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1743601241.git.alexander@edera.dev>
 <034a5518e8dfde9ac707b494f5d863d78efec84e.1743601241.git.alexander@edera.dev>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <034a5518e8dfde9ac707b494f5d863d78efec84e.1743601241.git.alexander@edera.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2025 3:54 pm, Alexander M. Merritt wrote:
> The new toolchain baseline knows the SVM instructions.
>
> Resolves: xen-project/xen#204
>
> Signed-off-by: Alexander M. Merritt <alexander@edera.dev>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, with a couple of
notes.

> ---
>  xen/arch/x86/hvm/svm/svm.h           | 14 +++-----------
>  xen/arch/x86/include/asm/asm-defns.h | 12 ------------
>  2 files changed, 3 insertions(+), 23 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
> index beeaaab4f7..5c5e91a1ac 100644
> --- a/xen/arch/x86/hvm/svm/svm.h
> +++ b/xen/arch/x86/hvm/svm/svm.h
> @@ -23,25 +23,17 @@ void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len);
>  
>  static inline void svm_vmload_pa(paddr_t vmcb)
>  {
> -    asm volatile (
> -        ".byte 0x0f,0x01,0xda" /* vmload */
> -        : : "a" (vmcb) : "memory" );
> +    asm volatile ( "vmload" : : "a" (vmcb) : "memory" );

We tend to prefer :: for empty sections.

>  }
>  
>  static inline void svm_vmsave_pa(paddr_t vmcb)
>  {
> -    asm volatile (
> -        ".byte 0x0f,0x01,0xdb" /* vmsave */
> -        : : "a" (vmcb) : "memory" );
> +    asm volatile ( "vmsave" : : "a" (vmcb) : "memory" );
>  }
>  
>  static inline void svm_invlpga(unsigned long linear, uint32_t asid)
>  {
> -    asm volatile (
> -        ".byte 0x0f,0x01,0xdf"
> -        : /* output */
> -        : /* input */
> -        "a" (linear), "c" (asid) );
> +    asm volatile ( "invlpga" : /* output */ : /* input */ "a" (linear), "c" (asid) );

And here, the output/input comments are useless and can be dropped.

I can fix both on commit if you're happy?

~Andrew

