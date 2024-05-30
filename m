Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3540B8D5175
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 19:46:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732917.1138968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCjqp-0001x8-VA; Thu, 30 May 2024 17:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732917.1138968; Thu, 30 May 2024 17:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCjqp-0001vL-SD; Thu, 30 May 2024 17:46:07 +0000
Received: by outflank-mailman (input) for mailman id 732917;
 Thu, 30 May 2024 17:46:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8pxM=NB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCjqp-0001vF-7a
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 17:46:07 +0000
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [2607:f8b0:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7abd8beb-1eac-11ef-b4bb-af5377834399;
 Thu, 30 May 2024 19:46:02 +0200 (CEST)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3c9cc681ee0so621606b6e.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 10:46:02 -0700 (PDT)
Received: from [10.125.231.30] ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ae4a7462a6sm455936d6.40.2024.05.30.10.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 10:45:59 -0700 (PDT)
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
X-Inumbo-ID: 7abd8beb-1eac-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717091161; x=1717695961; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8EyIqUxtnOINUrW9rFJ3KihtzaOkt2Vxdi5/JFaCyqk=;
        b=Ut7mwNtWcokbTdbZT0cQdKWGlfh/79o11wrpwYHQNFmcCTT3P1rFVzIdtoB37ZeRnM
         NusCXoWN3KloCiCRUvhKQhOriJM1br0H+/pTkdRIasih7T8hwKEtVBdXu2SoxSQmSHir
         xZ3rFPKAn22ok2j0JZztKqOGM5ZXDyKZFFAaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717091161; x=1717695961;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EyIqUxtnOINUrW9rFJ3KihtzaOkt2Vxdi5/JFaCyqk=;
        b=wylaC5D4JNxG9wEMFvTZbKN4uWy1WNY/5qiL8v2CTpcMOd4U0pZfSfciaRGhLL2tFR
         J10eW4QmHkZpZQLWq6g7FLTERaQgR0jYDTb3ki1IK61bFTVjRoBS7ZPtM3mLJcgLsUrq
         jtyEGe393MgP3bxHkSkr2Ex36AcUH+89g8joMCEBI1lnJD+1oxZ79KodNGQiNlaUCVSo
         aU2Lej9kKbipFASRFJmHcw0d+N96pT160vxDNfTdvXiSqSBeVrWoRsGTogjCsK0igfzJ
         NCLnk9lw8sv3vn3J8C+08/xNtWNU36IgYeSlw5cQfpBTCl80ULXxZon2YoqmsRKxsOXQ
         x1tQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3hnVvUyXlWQAcaV2lHBNKSatij/1nqstuFJnVFW+DABH7nAcvTeYjBTI+pwUSK3o+j/Rislsyh4OZW6Bl0lRmes+3dEkjU79Ppj97i74=
X-Gm-Message-State: AOJu0YwXMnqd8xAf6oc/JiSqKFf7YulDOYQPQRt4BJ7lAwzS8CdoTavg
	9SCFG9sD3ixnp70GEp6Ufp31PTUjBFeoYQskCk5BkE6Fx2cYqNtOaU5rOuMC8rc=
X-Google-Smtp-Source: AGHT+IFxeKXYq48pYd3SIZXu8Mx/AM4laNIxC/SFNNFXYx1M4EibGPLEo/iX1PDG0PLIMDMD+BuS5w==
X-Received: by 2002:a05:6808:3010:b0:3c9:9473:4300 with SMTP id 5614622812f47-3d1dcd20f26mr3505299b6e.48.1717091160796;
        Thu, 30 May 2024 10:46:00 -0700 (PDT)
Message-ID: <61c227f6-9515-4bfb-932b-aa0a5d33bc66@citrix.com>
Date: Thu, 30 May 2024 18:45:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 7/8] xen/riscv: enable full Xen build
To: "Oleksii K." <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
 <1cea913117f771a5f3b4404d7bfb7e1329f3f38e.1717008161.git.oleksii.kurochko@gmail.com>
 <1ecd7a2c-b7da-4c59-8ebd-c3841d5991f8@citrix.com>
 <2747a20d490252c279dd051c41a9b8dc69fb4c3e.camel@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2747a20d490252c279dd051c41a9b8dc69fb4c3e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/05/2024 6:12 pm, Oleksii K. wrote:
> On Thu, 2024-05-30 at 17:48 +0100, Andrew Cooper wrote:
>> On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
>>> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
>>> index 8285bcffef..bda35fc347 100644
>>> --- a/xen/arch/riscv/stubs.c
>>> +++ b/xen/arch/riscv/stubs.c
>>> @@ -24,12 +24,6 @@ DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t,
>>> cpu_core_mask);
>>>  
>>>  nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
>>>  
>>> -/*
>>> - * max_page is defined in page_alloc.c which isn't complied for
>>> now.
>>> - * definition of max_page will be remove as soon as page_alloc is
>>> built.
>>> - */
>>> -unsigned long __read_mostly max_page;
>>> -
>>>  /* time.c */
>>>  
>>>  unsigned long __ro_after_init cpu_khz;  /* CPU clock frequency in
>>> kHz. */
>>> @@ -419,21 +413,3 @@ void __cpu_die(unsigned int cpu)
>>>  {
>>>      BUG_ON("unimplemented");
>>>  }
>>> -
>>> -/*
>>> - * The following functions are defined in common/irq.c, but
>>> common/irq.c isn't
>>> - * built for now. These changes will be removed there when
>>> common/irq.c is
>>> - * ready.
>>> - */
>>> -
>>> -void cf_check irq_actor_none(struct irq_desc *desc)
>>> -{
>>> -    BUG_ON("unimplemented");
>>> -}
>>> -
>>> -unsigned int cf_check irq_startup_none(struct irq_desc *desc)
>>> -{
>>> -    BUG_ON("unimplemented");
>>> -
>>> -    return 0;
>>> -}
>> All 3 of these are introduced in the previous patch and deleted again
>> here.  Looks like a rebasing accident.
> Not really.
>
> This was done to avoid build failures for RISC-V. If the HEAD is on the
> previous patch where these changes are introduced and then we just drop
> them, it will lead to a linkage error because these functions are
> defined in common/irq.c, which isn't built for RISC-V if the HEAD is on
> the previous patch:
>    /build/xen/arch/riscv/entry.S:86: undefined reference to `max_page'

Nothing in the series touches entry.S, so I'm not sure what this is
complaining about.

The stub for get_upper_mfn_bound() references max_page, but it's only
used in a SYSCTL so you can avoid the problem with a BUG_ON().

BTW, you also don't need a return after a BUG_ON(). 
__builtin_unreachable() takes care of everything properly for you.


>    riscv64-linux-gnu-ld: prelink.o:(.rodata+0x8): undefined reference to
>    `irq_startup_none'
>    riscv64-linux-gnu-ld: prelink.o:(.rodata+0x10): undefined reference to
>    `irq_actor_none'
>    riscv64-linux-gnu-ld: prelink.o:(.rodata+0x18): undefined reference to
>    `irq_actor_none'
>    riscv64-linux-gnu-ld: prelink.o:(.rodata+0x20): undefined reference to
>    `irq_actor_none'
>    riscv64-linux-gnu-ld: xen-syms: hidden symbol `irq_actor_none' isn't
>    defined
>
> That is why these stubs were introduced in the previous patch (because
> common/irq.c isn't built at that moment) and are removed in this patch
> (since at the moment of this patch, common/irq.c is now being built).

These OTOH are a side effect of how no_irq_type works, which is
horrifying, and not something I can unsee.

I'll see about fixing it, because I really can't bare to leave it like
this...

~Andrew

