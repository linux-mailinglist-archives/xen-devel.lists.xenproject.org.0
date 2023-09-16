Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D79D7A305C
	for <lists+xen-devel@lfdr.de>; Sat, 16 Sep 2023 14:58:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603573.940609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhUqm-0003PS-HW; Sat, 16 Sep 2023 12:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603573.940609; Sat, 16 Sep 2023 12:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhUqm-0003NM-EW; Sat, 16 Sep 2023 12:56:40 +0000
Received: by outflank-mailman (input) for mailman id 603573;
 Sat, 16 Sep 2023 12:56:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTkj=FA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qhUql-0003NE-M7
 for xen-devel@lists.xenproject.org; Sat, 16 Sep 2023 12:56:39 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 782f977f-5490-11ee-9b0d-b553b5be7939;
 Sat, 16 Sep 2023 14:56:36 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2bcb0b973a5so47444931fa.3
 for <xen-devel@lists.xenproject.org>; Sat, 16 Sep 2023 05:56:36 -0700 (PDT)
Received: from [192.168.1.10] (host-92-12-44-130.as13285.net. [92.12.44.130])
 by smtp.gmail.com with ESMTPSA id
 h27-20020a170906111b00b009a1fef32ce6sm3777515eja.177.2023.09.16.05.56.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Sep 2023 05:56:35 -0700 (PDT)
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
X-Inumbo-ID: 782f977f-5490-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694868996; x=1695473796; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M7jgxxPuxbWU76KV3Hy7c5QtmjotxJWNHz+7GihJMaQ=;
        b=UfHeAZh0kDEBilKDXq6F4w8xl56K4/Y3F4FLnT16queD+y0WZoW96cpTRxRB1vmNCS
         Hiv6w+dTHXt+zIHAqnsZVSrvNjK2LIZ9FQ2uqcWLLtYxNWtTc9wALwOofCeAoY5c/Wdt
         QpSLu9CWv3kGn2q9yq8L6qCY7vG6TSZF02nJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694868996; x=1695473796;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7jgxxPuxbWU76KV3Hy7c5QtmjotxJWNHz+7GihJMaQ=;
        b=bIYw4h3lW2yPgrtDBk4Uq7w5PiQIFLAbXLcxxTVkshQWxPgoqEsYOEj+AV6CdUdTML
         j9Md+/IPwYOlAaRk8etylfM79gcPf4O2kouAGZJCwWKQia4h+EikvCqH1gz8OrXEzNSk
         dM6twHIM3SxFo0CMESJ+DH3EmnlubXqsf0HknkAsbfAAEYzK0dWk+4GzCYQSSjpAa4ky
         QyxKtvpsVnItF4qOpQIr4I2pyQjhaoCyPpLhoGj3E5659a8Ve8Xcm3xLloVeonEvKeFE
         Z+nzVWB9uFkixHzT4P0Hjv56N/GbDMtXo3t8d1WwLYu96yZ3Rz3vbzeLxR1NSLxQwMCF
         l4Jg==
X-Gm-Message-State: AOJu0YxAfeNPI5BwGEFQPWb7D6qVUFqsrz70ffakPyEuVua7kE7FYPNl
	EvvqJGKNJaZMD6bswQPzLOCaiA==
X-Google-Smtp-Source: AGHT+IE47sHKYccZ3NTUWPcoonVCECEkqb9OHh5RB4wiRjGJTLWewkr/2JcaiCUjaGPs3K+Rbypy0w==
X-Received: by 2002:a2e:9297:0:b0:2b9:f13b:6139 with SMTP id d23-20020a2e9297000000b002b9f13b6139mr3970283ljh.20.1694868995737;
        Sat, 16 Sep 2023 05:56:35 -0700 (PDT)
Message-ID: <17514c61-a561-b5a7-8b8f-8c3d8dbd845f@citrix.com>
Date: Sat, 16 Sep 2023 13:56:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 7/7] x86/pv: Rewrite %dr6 handling
Content-Language: en-GB
To: Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-8-andrew.cooper3@citrix.com>
 <0aee121e-a2ac-1c6c-be33-59d842419708@gmail.com>
In-Reply-To: <0aee121e-a2ac-1c6c-be33-59d842419708@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/09/2023 8:50 am, Jinoh Kang wrote:
> On 9/16/23 05:36, Andrew Cooper wrote:
>> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
>> index dead728ce329..447edc827b3a 100644
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -1887,11 +1887,11 @@ void do_device_not_available(struct cpu_user_regs *regs)
>>  /* SAF-1-safe */
>>  void do_debug(struct cpu_user_regs *regs)
>>  {
>> -    unsigned long dr6;
>> +    unsigned long pending_dbg;
>>      struct vcpu *v = current;
>>  
>> -    /* Stash dr6 as early as possible. */
>> -    dr6 = read_debugreg(6);
>> +    /* Stash dr6 as early as possible, operating with positive polarity. */
>> +    pending_dbg = read_debugreg(6) ^ X86_DR6_DEFAULT;
> We don't reset DR6 after reading it, and there is no guarantee that the PV guest
> will reset it either, so it doesn't match PENDING_DBG exactly IIRC.
>
> On the other hand, nothing will probably care about its double-accumulating
> quirk except perhaps monitor users.
>
> Do we want to document that, shadow DR6 for PV (which seems a little overkill
> if we don't trap DR6 access from PV already), or just live with that?

Different DR6's.

This is Xen responding to a real #DB (most likely from a PV guest, but
maybe from debugging activity in Xen itself), and in ...

>>  
>>      /*
>>       * At the time of writing (March 2018), on the subject of %dr6:

... this piece of context missing from the patch, Xen always writes
X86_DR6_DEFAULT back in order to clear the sticky bits.

This behaviour hasn't changed.  Xen always sees a "clean" DR6 on every
new #DB.

For the PV guest, what matters is ...

>> @@ -1963,13 +1963,13 @@ void do_debug(struct cpu_user_regs *regs)
>>           * If however we do, safety measures need to be enacted.  Use a big
>>           * hammer and clear all debug settings.
>>           */
>> -        if ( dr6 & (DR_TRAP3 | DR_TRAP2 | DR_TRAP1 | DR_TRAP0) )
>> +        if ( pending_dbg & X86_DR6_BP_MASK )
>>          {
>>              unsigned int bp, dr7 = read_debugreg(7);
>>  
>>              for ( bp = 0; bp < 4; ++bp )
>>              {
>> -                if ( (dr6 & (1u << bp)) && /* Breakpoint triggered? */
>> +                if ( (pending_dbg & (1u << bp)) && /* Breakpoint triggered? */
>>                       (dr7 & (3u << (bp * DR_ENABLE_SIZE))) && /* Enabled? */
>>                       ((dr7 & (3u << ((bp * DR_CONTROL_SIZE) + /* Insn? */
>>                                       DR_CONTROL_SHIFT))) == DR_RW_EXECUTE) )
>> @@ -1990,24 +1990,23 @@ void do_debug(struct cpu_user_regs *regs)
>>           * so ensure the message is ratelimited.
>>           */
>>          gprintk(XENLOG_WARNING,
>> -                "Hit #DB in Xen context: %04x:%p [%ps], stk %04x:%p, dr6 %lx\n",
>> +                "Hit #DB in Xen context: %04x:%p [%ps], stk %04x:%p, pending_dbg %lx\n",
>>                  regs->cs, _p(regs->rip), _p(regs->rip),
>> -                regs->ss, _p(regs->rsp), dr6);
>> +                regs->ss, _p(regs->rsp), pending_dbg);
>>  
>>          return;
>>      }
>>  
>> -    /* Save debug status register where guest OS can peek at it */
>> -    v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
>> -    v->arch.dr6 &= (dr6 | ~X86_DR6_DEFAULT);
>> -
>>      if ( guest_kernel_mode(v, regs) && v->domain->debugger_attached )
>>      {
>> +        /* Save debug status register where gdbsx can peek at it */
>> +        v->arch.dr6 = x86_merge_dr6(v->domain->arch.cpu_policy,
>> +                                    v->arch.dr6, pending_dbg);
>>          domain_pause_for_debugger();
>>          return;
>>      }
>>  
>> -    pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
>> +    pv_inject_DB(pending_dbg);

... this, which will merge all new pending bits into the guest's DR6.

If the guest chooses not to clean out DR6 each time, then it will see
content accumulate.

To your earlier point of shadowing, we already have to do that.  DR6 is
just one of many registers we need to context switch for the vCPU.

PV guests, being ring-deprivieged, trap into Xen for every DR access,
and Xen handles every one of their #DB exceptions.  This is one reason
why I split the work into several parts.  PV guests are easier to get
sorted properly, and patch 1,2,5,6 are all common improvements relevant
to HVM too.

~Andrew

