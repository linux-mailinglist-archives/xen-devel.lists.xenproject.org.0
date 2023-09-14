Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4E87A0D06
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 20:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602635.939317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgrF9-0002R3-OT; Thu, 14 Sep 2023 18:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602635.939317; Thu, 14 Sep 2023 18:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgrF9-0002Nz-Lo; Thu, 14 Sep 2023 18:39:11 +0000
Received: by outflank-mailman (input) for mailman id 602635;
 Thu, 14 Sep 2023 18:39:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqVP=E6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgrF8-0002Nr-2N
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 18:39:10 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcf2409a-532d-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 20:39:07 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31f7638be6eso1191821f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 11:39:07 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d6-20020adfef86000000b0031f82743e25sm2427195wro.67.2023.09.14.11.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 11:39:07 -0700 (PDT)
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
X-Inumbo-ID: fcf2409a-532d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694716747; x=1695321547; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qsfT4Ey3oOOVsjw+YjbBKz6D/Z9okdMGB7smZhVyoN8=;
        b=PtJV5RKEtKrF/um2lx2vsMdSNyII9Qjmjgl0+nf6u6qM9JzQO0g1B1Wt3yVeIJRnda
         RqdkdMsouAHEuQLkVCrlb16GyBPWhDlsf4bVrJW0Q+NP6JXh8PNyWs0xcGSRA9ML9TAc
         a3CckWN/XMA5Tjbufw3u8afTEy1TukAWKFXoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694716747; x=1695321547;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsfT4Ey3oOOVsjw+YjbBKz6D/Z9okdMGB7smZhVyoN8=;
        b=nhbFT8vQi/3tm9XMCVwdwHBzNyigRjgO+xRw1/hyyt/f8DWSXLgtjJlr4qG/0Rkmzu
         juF514GucqemYtQzq5+tc3IQHVbU09CK5hvebRtvCEV0gRgWhTCkvMsTvOCiZizG4afc
         o+je1niO9o9MTUOh4OWP5PTnd3ligWtwme+bZPk4tKcCylutqENM13hPkMFJy4SKNzOQ
         s4Mn7RirZ5SAiAf713J6nGdONhoh5Eiax7x/f8QCJhB8wYrZjOQfUEhmDQ36n+ltE/GA
         dWi07XqgLTV1Z1tlDS2lpHo8mNIbslZDS6TqvdpUmKPSmf/lGyVuLZxaK+WueRLVxC36
         QrXg==
X-Gm-Message-State: AOJu0YyLo9nf9D/dWs5z8LpmjoNhGmt3TmHq8eurWjR9MZU0sBcN0OmO
	OK+iuAI0/dtXNuD7oTH2wi3NfQ==
X-Google-Smtp-Source: AGHT+IEbHJTQiImbJV3xo2IrMuuflNMoVmKaRHWnEjCXh0car7BDQGfCjy2eDiyXN1XplqHnO3V4LQ==
X-Received: by 2002:a5d:5149:0:b0:317:6310:a616 with SMTP id u9-20020a5d5149000000b003176310a616mr5774003wrt.36.1694716747346;
        Thu, 14 Sep 2023 11:39:07 -0700 (PDT)
Message-ID: <3e9e1bc0-3d11-9283-b053-0e5ad171b3f1@citrix.com>
Date: Thu, 14 Sep 2023 19:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/5] x86/pv: Rewrite %dr6 handling
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
 <20230912232113.402347-6-andrew.cooper3@citrix.com>
 <7c847e46-6890-5511-dda9-b16e8b0ac7ab@suse.com>
In-Reply-To: <7c847e46-6890-5511-dda9-b16e8b0ac7ab@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/09/2023 5:06 pm, Jan Beulich wrote:
> On 13.09.2023 01:21, Andrew Cooper wrote:
>> --- a/xen/arch/x86/include/asm/domain.h
>> +++ b/xen/arch/x86/include/asm/domain.h
>> @@ -729,6 +729,18 @@ static inline void pv_inject_hw_exception(unsigned int vector, int errcode)
>>      pv_inject_event(&event);
>>  }
>>  
>> +static inline void pv_inject_DB(unsigned long pending_dbg)
>> +{
>> +    struct x86_event event = {
>> +        .vector      = X86_EXC_DB,
>> +        .type        = X86_EVENTTYPE_HW_EXCEPTION,
>> +        .error_code  = X86_EVENT_NO_EC,
>> +        .pending_dbg = pending_dbg,
> This being a sub-field of an unnamed union, the build will break (also
> in pv_inject_page_fault() then, for cr2 being switched at the same time)
> once again for old enough gcc.

I'm sick and tired of utterly obsolete compiler bugs stopping us writing
good code.

It will break HVM #PF too, and I'll fix it for now as these patches need
backporting, but I've got a very strong mind to intentionally break it
next time this comes up in staging.

>> --- a/xen/arch/x86/pv/emulate.c
>> +++ b/xen/arch/x86/pv/emulate.c
>> @@ -71,11 +71,9 @@ void pv_emul_instruction_done(struct cpu_user_regs *regs, unsigned long rip)
>>  {
>>      regs->rip = rip;
>>      regs->eflags &= ~X86_EFLAGS_RF;
>> +
>>      if ( regs->eflags & X86_EFLAGS_TF )
>> -    {
>> -        current->arch.dr6 |= DR_STEP | DR_STATUS_RESERVED_ONE;
>> -        pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
>> -    }
>> +        pv_inject_DB(X86_DR6_BS);
>>  }
> This (not your change, the construct) looks bogus at the first and second
> glance, because of looking at EFLAGS.TF after emulation, when the initial
> state of TF matters. It is only correct (at the third, closer look) because
> the function presently is used only from paths not altering the guest's
> EFLAGS. Do you think it would make sense to add a comment at this occasion?

It is buggy yes, but if you notice, so is SVM's __update_guest_eip() and
VMX's update_guest_eip().

And remember that while for most instructions it's the initial state
that matters, it's the final state that matters for SYSCALL/SYSRET, and
each of LRET/IRET/ERET{U,S} have oddities that aren't currently
expressed in the emulator.

I'll leave a todo for now.  This is a problem that can only reasonably
be fixed by unifying the intercept and emulation paths into a coherent
model of the instruction cycle.

~Andrew

