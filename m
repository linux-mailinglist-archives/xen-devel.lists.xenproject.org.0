Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1B1D250E8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 15:50:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205249.1519603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgOgG-0006Nm-H8; Thu, 15 Jan 2026 14:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205249.1519603; Thu, 15 Jan 2026 14:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgOgG-0006LD-EI; Thu, 15 Jan 2026 14:50:36 +0000
Received: by outflank-mailman (input) for mailman id 1205249;
 Thu, 15 Jan 2026 14:50:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ba0k=7U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vgOgF-0006L7-Rz
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 14:50:35 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8be149a4-f221-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 15:50:34 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b86ed375d37so134970566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 06:50:34 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a27cc6bsm2814906366b.23.2026.01.15.06.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 06:50:32 -0800 (PST)
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
X-Inumbo-ID: 8be149a4-f221-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768488634; x=1769093434; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=16eX45xSUfz4pCxpxfVOREW80XWq4NETUSWgOvDD4hY=;
        b=WpnWo/QuD5ul7ZoTeH3Uup5k6wC8u+Jeu4Mi6inAI9ayOWH1Bg2Xjrbd6Z9y2CjN/5
         4Jhk+oc0PjpYviDlwG3vhMnb5NsrNdiYLfyr8uQmyH9cbUKddjOARUJGwEKvnNfu1IeP
         zYmfJW9+BLrccqRMrStbI9qbelor8hwIiANYGhqmZq+IiAOFDDRV8ikRehANK8PvPdOg
         vm3GYunHHirfJAvxzziBLOI5N/X4HUMIojmseQs0o/tzuNX6mkiVjKeIyZK181mNRsNQ
         SQ4i6oEiRNuhD3C+D1CYi3B7nvhmuW6WW7Oyr/mjGk0t0mwbYaFEPUUukiEdTLw9P0F1
         H3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768488634; x=1769093434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=16eX45xSUfz4pCxpxfVOREW80XWq4NETUSWgOvDD4hY=;
        b=VDELMopaOp5eQC1cYrg/sMZUAwpV4eIZ/g5t5Q25FLTN8LaqMXePPSSEY9//cRF7vZ
         OKxypg1MMhnX5mvEE11TyJBmvmqAuzPjQ9cCWwT7HK3x2sGp/UNCDXeNCjFNPFh0wjxD
         ovefhndQOonUuZlHK2jCyUz2eJMhyau+Q3Q8jhjTblDZBAhpCGS9N58/H+C4oDRjOMWP
         mmClDEdTQXj9nHNO2fukw2dOxOdI5V1EEGeYc+kh4wLIUxASlrOMqdDFVIhGK6NWRhuN
         vsEM/meNKCUf9BuT3iTzfS5AV0f7ka0bqCS/6I6t4TyEHpFGu2caTUucDTVklV8GjTKg
         Wa/g==
X-Forwarded-Encrypted: i=1; AJvYcCVvV1y21ubHoLHth96GoAcaHlQnhEnByMmSQmTAQy/Ak0/nZYsc50+HWO1pbWMIp84SNT+H1LclhY8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWTReXhV2MrgMBKj96au00zYKEDij3fWjQhxWwbsaQ16/x4Utx
	iY/mEjTjxv5alhcboQJ7JfEMo6o3L/HiiYUJ4QlzbRtm86mLIKi618G0
X-Gm-Gg: AY/fxX5F6heCTvqqxIp3QrbM+NSVl3WKmRZPe72MS2OehANKCjceIbzDbgtIVDyxoHK
	7D0PlQ1NqUJfi1aGAUeKoq2jFihZpqbpMFsebAp+E4YoXuV5HV7KuObH04k7zbOe7FDquay2jnL
	SDQ5FCVh3UdaIERumGs6l3Yo3fKlgK1oBgaur3HdVKhjuqJdB+/1/pimPd0e+DUYKJjS4lb91P4
	pOVxJtVRd+XKxmWllGFX6P/SgPHPqE6bQnqYh2UnWB9u3BaUxJS0L5T8AdCLZv5ylAFNpv92G2X
	lTWhEM26LbqFRDWn9c3ts+QIFXewI+xsHHDxIWCqp0aNzQDSGfMh7bJZmE33aXCm8DRaBrrMeg8
	J4LcxaG0kA7l75tPQexlo9OOniEfahiA2p9mb8JSn0448I0b9kj9rxGaYNinX7Z/EH5ManYPtnf
	rXEWZKOYLodRCHtNEJhDosUI/VNoSAF1MbB+ycG+2q+kbpDqvgQSMAZQavY4JDSTc=
X-Received: by 2002:a17:907:75c7:b0:b87:6f58:a848 with SMTP id a640c23a62f3a-b876f58b96cmr300906766b.51.1768488633420;
        Thu, 15 Jan 2026 06:50:33 -0800 (PST)
Message-ID: <4e94f7f5-2cf2-4695-873b-5d269f10ddac@gmail.com>
Date: Thu, 15 Jan 2026 15:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: dump CSRs on unexpected traps
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260115125601.70834-1-oleksii.kurochko@gmail.com>
 <8377bdc2-d92d-4c3f-893b-19c842cad3a7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8377bdc2-d92d-4c3f-893b-19c842cad3a7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/15/26 2:12 PM, Jan Beulich wrote:
> On 15.01.2026 13:56, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/traps.c
>> +++ b/xen/arch/riscv/traps.c
>> @@ -17,6 +17,10 @@
>>   #include <asm/traps.h>
>>   #include <asm/vsbi.h>
>>   
>> +#define print_csr(csr) do { \
>> +    printk("\t" #csr ": %#02lx\n", csr_read(csr)); \
> Why the 02 in the format? If you wanted to align things, you'd use %016lx. (I
> also don't think the 0x prefixes are overly useful in such dumping, but others
> may disagree.) As an aside, the width of 2 would be fully consumed by your use
> of #, except for zero which would (oddly) be printed as 00 afaict.

I used before 0x%02lx and after switch to %# don't think that 02 would fully consumed
by #.

I am okay to use just %lx.

>
>> +} while ( 0 )
> Why the do/while wrapping, btw?

Added it automatically, there is no really to have it here. I'll drop.


>
>> @@ -99,12 +103,63 @@ static const char *decode_cause(unsigned long cause)
>>       return decode_trap_cause(cause);
>>   }
>>   
>> +static void dump_csrs(unsigned long cause)
>> +{
>> +    unsigned long hstatus;
>> +    bool gva;
>> +
>> +    printk("\nDumping CSRs...\n");
>> +
>> +    printk("Supervisor CSRs\n");
>> +    print_csr(CSR_STVEC);
>> +    print_csr(CSR_SATP);
>> +    print_csr(CSR_SEPC);
>> +
>> +    hstatus = csr_read(CSR_HSTATUS);
>> +    gva = !!(hstatus & HSTATUS_GVA);
> No need for !! when the lhs type is bool. Question is whether gva is useful
> to have as a local in the first place, when ...
>
>> +    printk("\tCSR_STVAL: %#02lx%s\n", csr_read(CSR_STVAL),
>> +           gva ? ", (guest virtual address)" : "");
> ...  this it's sole use (you don't use where you could further down).

Agree, with such usage there is no really necessity for it.

>
>> +    printk("\tCSR_SCAUSE: %#02lx\n", cause);
>> +    printk("\t\tDescription: %s\n", decode_cause(cause));
>> +    print_csr(CSR_SSTATUS);
>> +
>> +    printk("\nVirtual Supervisor CSRs\n");
>> +    print_csr(CSR_VSTVEC);
>> +    print_csr(CSR_VSATP);
>> +    print_csr(CSR_VSEPC);
>> +    print_csr(CSR_VSTVAL);
>> +    cause = csr_read(CSR_VSCAUSE);
>> +    printk("\tCSR_VSCAUSE: %#02lx\n", cause);
>> +    printk("\t\tDescription: %s\n", decode_cause(cause));
>> +    print_csr(CSR_VSSTATUS);
> Everything below I understand wants dumping, but for much of the above
> that's less clear to me. Why would guest's values be relevant when we
> have a hypervisor problem?

It could be useful when we jump to guest, something wasn't configured
correctly and so lets say an illegal instruction in guest happen and
so it would be useful to at least understand what is this instruction
based on VSEPC or VSTVAL.

All others probaly there is no need to have printed, I don't remember
that I used them during debug.


>
>> +    printk("\nHypervisor CSRs\n");
>> +
>> +    print_csr(CSR_HSTATUS);
> Above you special-case VSCAUSE, but here you re-read HSTATUS.

Because above I re-used 'cause' then for decode_cause().

>
>> +    printk("\t\thstatus.VTSR=%d\n", !!(hstatus & HSTATUS_VTSR));
>> +    printk("\t\thstatus.VTVM=%d\n", !!(hstatus & HSTATUS_VTVM));
>> +    printk("\t\thstatus.HU=%d\n", !!(hstatus & HSTATUS_HU));
>> +    printk("\t\thstatus.SPVP=%d\n", !!(hstatus & HSTATUS_SPVP));
>> +    printk("\t\thstatus.SPV=%d\n", !!(hstatus & HSTATUS_SPV));
>> +    printk("\t\thstatus.GVA=%d\n", !!(hstatus & HSTATUS_GVA));
> Might these better be put on a single line, e.g. in the form
>
>    [VTSR SPVP SPV]
>
> i.e. enumerating the (interesting) set bits textually?

Agree, visually it would be better.

>
>> +    print_csr(CSR_HGATP);
>> +    print_csr(CSR_HTVAL);
>> +    print_csr(CSR_HTINST);
>> +    print_csr(CSR_HEDELEG);
>> +    print_csr(CSR_HIDELEG);
>> +    print_csr(CSR_HSTATEEN0);
>> +}
>> +
>>   static void do_unexpected_trap(const struct cpu_user_regs *regs)
>>   {
>>       unsigned long cause = csr_read(CSR_SCAUSE);
>>   
>>       printk("Unhandled exception: %s\n", decode_cause(cause));
>>   
>> +    dump_csrs(cause);
>> +
>>       die();
>>   }
> Apart from CSRs, how about also dumping GPRs?

Maybe, it is a good idea and it would be nice to add them.

I just almost never needed them for debugging so I am not printing
them.

~ Oleksii


