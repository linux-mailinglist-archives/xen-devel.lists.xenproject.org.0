Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D43CCB2F3
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 10:33:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189358.1510137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWANI-0003V8-HO; Thu, 18 Dec 2025 09:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189358.1510137; Thu, 18 Dec 2025 09:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWANI-0003TR-Ei; Thu, 18 Dec 2025 09:32:44 +0000
Received: by outflank-mailman (input) for mailman id 1189358;
 Thu, 18 Dec 2025 09:32:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YG3a=6Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWANG-0003TL-V6
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 09:32:43 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fcc4bcc-dbf4-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 10:32:41 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b76b5afdf04so64005066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 01:32:41 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b802350dac6sm175572866b.65.2025.12.18.01.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 01:32:40 -0800 (PST)
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
X-Inumbo-ID: 7fcc4bcc-dbf4-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766050361; x=1766655161; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NsW2HasN28O50F+ltWdsLG61URTHIRksaI0HaR3fnu4=;
        b=WNI/MIBaHCudJK3FRgdPKkHKznojgceGTlGptPKKMuve3VBj0XVoX738CuVIDGbx3x
         KyBRCuGxWE0qK2uuv/6eHgF4FIBPupUuf7uojZ70+RqPpB0XvbWtBTFGjKICZWr6q1lf
         VPNNsJeztgrpw3fhKNuFu31a990fQhnwyLk4W2LWObFJcR0OJi9NcT6a0Sx+ZV9VPVKk
         FkOJ6xIdTAmRvaZoEW3LUJepFfqtQANYRpw5YYKIsGDi5E+j6raljvsVdAL4H7YHVI9L
         waWPjpbMrJLpaRQXJZngiivL2r5gC9ch/FWqxS+fdQyshO3AVAhVva1C4ve96KHyE5mU
         s7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766050361; x=1766655161;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NsW2HasN28O50F+ltWdsLG61URTHIRksaI0HaR3fnu4=;
        b=E1DeQzrZb9nXnlLb6aauDzo8Xk8yUBf1hUabZ9SbwEWEyI706TXzIoqttMCcf4knGv
         w8Sp3EX8zn0Lni6uERn48nAAhVjE152+Qo2KQuH/gD3vxG8rTcMTBnzAjVeu17tJn4p5
         ZtARJQ4RZJqjKMmEffS4eD2Vk6QQwIq8+5DxNlcGLlOkVj8Qb4nGcb8mmyfS4obEt4gR
         eu5IElQJsLoh1cjGMSb1YYrk8y96Zt1hMcPyNX5OhiF0Nu/h6+xrwl18dcAVtTDHKUZ/
         YZU0GkARzYk3Vs4iKqYADloOjZz/s0t0E+DPD5/1xq0JFcRzOkUOw3/gDEra5pjp47EH
         m7FA==
X-Forwarded-Encrypted: i=1; AJvYcCV1EnYJPWt9ov7+p986u8TDrCctpIYKanprabU8leMvDCR8Wi6wU58KB9FcfuNlpArVBrOL8uTD8N4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxS8PcmMXWVKdIOqrO25HSMWiPjeh2EKidMmD10tg1IQpq0Fe7J
	4q907LJ03l7zhEyX2KarUm6oWWpu7Z2Cch/ChJHs69gJezbamlzoJcz7
X-Gm-Gg: AY/fxX5Q2TlKSxCNbTqU1On/AJwTrK2PLt7ffRXbkcS+lKIfC7Vdu2GoJ/RSb1uE4EK
	6248zT/9lqsJ9bW9t9ZfYAEmnHrVFQWpCxns6hGp3XuMBBGcsPOGBXGeTd+ygTWMhe+xnAQ8EZO
	mQCW/N/0SCA+FQqyV2W2dtaWeLjg92M8xqqGNajKo0y7vuHgrhzS21bGx6S387AxvcoGvooYY14
	OY9GEZgoHYCZbHsFCVCtkB1YqN05k9izN+KClahTaMRopIEai8AJ7bZK/FHei0HeM10md0lsFBU
	HqQ/jwAqzWCb+I8nPnATI4Arh8WbSvlKclcDcSqxOLEk1wcZTJOR1SPLxthYtPLzWKXO2uVuyBI
	t6xqmBZZktBDJl2K+CFGPw+CsLk8DQPpNz+LvJGEiJKdmMiC43IfEOnfBtNs6DkpWjgl2fK1Rkf
	ITD9fSWzzwRbr5xswmZtOHctOaoUlO0My6eLG9cN6Rex0GTdf7E/VfgAWecOSn7VQl
X-Google-Smtp-Source: AGHT+IHLcybJDH1Sheu6aAv+Kc+/1UIa4y3lewol8uVEeS2DvIHPVI+7wc1x37+iMtO+806Fzqebqg==
X-Received: by 2002:a17:906:6a04:b0:b79:fcc9:b00d with SMTP id a640c23a62f3a-b7d23a9f4b3mr2165038966b.59.1766050360299;
        Thu, 18 Dec 2025 01:32:40 -0800 (PST)
Message-ID: <7a74c5eb-4335-4217-acca-87f7cd572cd0@gmail.com>
Date: Thu, 18 Dec 2025 10:32:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen: move alloc/free_vcpu_struct() to common code
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <5f75053750a9fca2b5fecf1dcf6f097b25e8f27f.1765967934.git.oleksii.kurochko@gmail.com>
 <8aee5daf-be3b-4f10-aa38-b8c1504ba0b4@citrix.com>
 <7bec6dab-9776-4f94-b121-0be696be78d8@gmail.com>
Content-Language: en-US
In-Reply-To: <7bec6dab-9776-4f94-b121-0be696be78d8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/17/25 4:37 PM, Oleksii Kurochko wrote:
>
> On 12/17/25 12:46 PM, Andrew Cooper wrote:
>> On 17/12/2025 10:53 am, Oleksii Kurochko wrote:
>>> alloc_vcpu_struct() and free_vcpu_struct() contain little
>>> architecture-specific logic and are suitable for sharing across
>>> architectures. Move both helpers to common code.
>>>
>>> To support the remaining architectural differences, introduce
>>> arch_vcpu_struct_memflags(), allowing architectures to override the
>>> memory flags passed to alloc_xenheap_pages(). This is currently needed
>>> by x86, which may require MEMF_bits(32) for HVM guests using shadow
>>> paging.
>> You lost the comment explaining the restriction.  This needs adding 
>> back.
>>
>>> Move the definition of MAX_PAGES_PER_VCPU to xen/domain.h and default
>>> it to 1. Retain the ARM64 exception (with CONFIG_NEW_VGIC) where two
>>> pages are required due to larger per-IRQ structures.
>> CONFIG_NEW_VGIC is still off by default, unsupported, and has had no
>> work on it since it's introduction in 2018.
>>
>> There are a lot of good reasons to enforce struct vcpu being a single
>> page allocation, not least because an allocation can fail due to
>> fragmentation despite there being enough free RAM.
>>
>> I would far rather that common code enforced it being page size, and
>> NEW_VGIC gets deleted or adjusted to cope, than to make it this easy for
>> architectures to shoot themselves in the foot.
>
> I am not sure that everyone would agree to simply drop|NEW_VGIC|.
>
> Based on the commit message ...:
>     ARM: new VGIC: Allocate two pages for struct vcpu
>         At the moment we allocate exactly one page for struct vcpu on 
> ARM, also
>     have a check in place to prevent it growing beyond 4KB.
>     As the struct includes the state of all 32 private (per-VCPU) 
> interrupts,
>     we are at 3840 bytes on arm64 at the moment already. Growing the 
> per-IRQ
>     VGIC structure even slightly makes the VCPU quickly exceed the 4K 
> limit.
>     The new VGIC will need more space per virtual IRQ. I spent a few 
> hours
>     trying to trim this down, but couldn't get it below 4KB, even with 
> the
>     nasty hacks piling up to save some bytes here and there.
>     It turns out that beyond efficiency, maybe, there is no real 
> technical
>     reason this struct has to fit in one page, so lifting the limit to 
> two
>     pages seems like the most pragmatic solution.
>     Restrict the compilation error to compiling with the new VGIC and for
>     ARM64 only.
>
> ... Given this, I initially thought it would be difficult to adjust.
> However, it seems there might be enough to do the following ...:
> @@ -238,7 +238,7 @@ struct arch_vcpu
>      union gic_state_data gic;
>      uint64_t lr_mask;
>
> -    struct vgic_cpu vgic;
> +    struct vgic_cpu *vgic;
>
>      /* Timer registers  */
>      register_t cntkctl;
>
> ... with|vgic| allocated in|vcpu_vgic_init()| and freed 
> in|vcpu_vgic_free()|.
>
> I only checked whether this is sufficient to build with ...:
>    #if defined(CONFIG_NEW_VGIC) && defined(CONFIG_ARM_64)
>    -#define MAX_PAGES_PER_VCPU  2
>    +#define MAX_PAGES_PER_VCPU  1
>    #endif
>     $ grep -nE "^(CONFIG_NEW_VGIC|CONFIG_ARM_64)=y" xen/.config
>   13:CONFIG_ARM_64=y
>   28:CONFIG_NEW_VGIC=y
> ... and it seems to work.
>
> The question to the Arm maintainers is whether you would be fine with 
> such a
> solution.

I've done some measurements with the suggested changes [1] to Arm’s|arch_vcpu|
structure. As a result, the size of|struct vcpu| on Arm is reduced to 2048 bytes,
compared to 3840 bytes (without the changes in [1] and with|CONFIG_ARM_64=y|) and
4736 bytes (without the changes in [1] and with both|CONFIG_ARM_64=y| and
|CONFIG_NEW_VGIC=y|).

The result looks good enough, so I will propose [1] while preparing v2 of this
patch.

Also, all CI tests passed: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2220545118

[1] xen/arm: optimize the size of struct vcpu ( https://gitlab.com/xen-project/people/olkur/xen/-/commit/946a1c2cfaf4157074470a653bba5baa8561ebbf )

~ Oleksii

>
>>
>>> The ARM implementation of alloc/free_vcpu_struct() is removed and
>>> replaced by the common version. Stub implementations are also dropped
>>> from PPC and RISC-V.
>>>
>>> Finally, make alloc_vcpu_struct() and free_vcpu_struct() static to
>>> common/domain.c, as they are no longer used outside common code.
>>>
>>> No functional changes.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>

