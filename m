Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83495A732A6
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 13:53:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929250.1331873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txmjm-0003D0-AE; Thu, 27 Mar 2025 12:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929250.1331873; Thu, 27 Mar 2025 12:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txmjm-0003A3-75; Thu, 27 Mar 2025 12:53:34 +0000
Received: by outflank-mailman (input) for mailman id 929250;
 Thu, 27 Mar 2025 12:53:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4IZU=WO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txmjk-00039v-Ia
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 12:53:32 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bea1574-0b0a-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 13:53:30 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-391342fc1f6so730762f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 05:53:30 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3372sm19652320f8f.21.2025.03.27.05.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 05:53:29 -0700 (PDT)
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
X-Inumbo-ID: 7bea1574-0b0a-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743080010; x=1743684810; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cR34hP6YfG7nxmCQDDp10EAADh7a/Vmu6OpCrNswbQ8=;
        b=siUfrGdaOFW+Cfswb3fpDocLxWnDGEA3e1hg5DPHwxMwH2H+Z2d/uPQO6M+IItsoge
         REITvs9yajRIPTecXNtMHo3y02MkobUffU2WDjhB9H4Qdchs75D69+qpzXR+I4U4s6+1
         cMH3l01xR80/0Rl8vzkYBc6+v4ntnr039QGgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743080010; x=1743684810;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cR34hP6YfG7nxmCQDDp10EAADh7a/Vmu6OpCrNswbQ8=;
        b=wZhq+VojngnYRuQa4483NasP0cFYiXaTIT8v9C9gwIjKErchCCv45G8KgR3c51rORR
         SIuanJrbAJiCPXJg80+hcr7e7bUpec/brOzJ1Sz6eo1izca5cpcnGYLG8UCJPsVnoyu7
         ME+45EP1+CTZF4AX5Weh9Uopj/67chmapHSmm8vGN6HzQDbcJQsd4NvGD9Xor7MZUiQQ
         D/EYN2nNfl/tqk+tuwGcC9ZG1h/o1rlibNDRQYong4JYKfQhUDHvtqOnjHNpDkbYgJP2
         WUW8iW9nIx+bq5u/npaWp1EICbuLaVZo11o+cbshut0NI6CDYw9gU1Qwu7UKJwo72B2X
         zcxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1ofiaTP2k3pxDasvk+9BLwx6DyVPCvYNSVtDZB52pQmF/t20riGTvUrurJDY77yeEgvALoXQOkjc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywi6LhrZD0q5WJ+gQbdtKo27AOf/5c2mpeS019uVqynPkv+OXPu
	Dq0QRHZFFKnundDRtkL1ALTLd904Le9h4CCMNw1l5hiBuYCnrKc/coTxxbR5kbA=
X-Gm-Gg: ASbGncumdj1TEg8/+gDUumLMT8DXy2GdEMdVfX7FMW8nMEguWfqHwSZjArUqTPhx/lY
	makanFxGmOQlP49uBq5bLiTk4TUU/Iktag4eRB+3FRbG6knVMNGZWHVbjUovigrqB62N7mnfub+
	Ewxj6jNuHLanQl8uyzvXFvNC21Kytl7CwuU9ldnCkTimGFiPJsMLP2e2QyVa5nbDzXrHEEm9GSo
	Lq3FfBabKDDEQjZGAmxOJrGEGkkNBa2pGcR6HIvrDFOdhKeXu6hmNcveHg6VDIJ70ZRbMya/lOD
	TZ4+FTrAuARIZMLkw/KwqPcNizfFoH8+C76Rlim4Ig8K+pXel/s0RnRv7+QmPGVK39Wn7Ex/LS6
	JD1c5xCYQlyL4yhtSSz+H
X-Google-Smtp-Source: AGHT+IEZX2/Qyyk7Hn2e0FBDGi1sPRq5TRJIlePl32vUcBnMyhh224k2vYs1b2nT+T4jxqtI0+fRJA==
X-Received: by 2002:a05:6000:2911:b0:390:f552:d291 with SMTP id ffacd0b85a97d-39ad1748a57mr2995137f8f.22.1743080010028;
        Thu, 27 Mar 2025 05:53:30 -0700 (PDT)
Message-ID: <f7381aa7-cfc8-4225-b500-374804cbf23d@citrix.com>
Date: Thu, 27 Mar 2025 12:53:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/config.h: Move BITS_PER_* definitions from
 asm/config.h to xen/config.h
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <4f085bcbf5b6f1bc42824bfb08724e8a9bbd4918.1743005389.git.oleksii.kurochko@gmail.com>
 <17a808cf-e676-4c30-9068-34a9a4d568d7@citrix.com>
 <994b9d44-f82f-4eb7-8742-9041ba2caf17@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <994b9d44-f82f-4eb7-8742-9041ba2caf17@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/03/2025 8:21 am, Jan Beulich wrote:
> On 27.03.2025 01:44, Andrew Cooper wrote:
>> On 26/03/2025 5:47 pm, Oleksii Kurochko wrote:
>>> diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
>>> index d888b2314d..dbbf2fce62 100644
>>> --- a/xen/include/xen/config.h
>>> +++ b/xen/include/xen/config.h
>>> @@ -98,4 +98,13 @@
>>>  #define ZERO_BLOCK_PTR ((void *)-1L)
>>>  #endif
>>>  
>>> +#define BYTES_PER_LONG  __SIZEOF_LONG__
>>> +
>>> +#define BITS_PER_BYTE   __CHAR_BIT__
>>> +#define BITS_PER_INT    (__SIZEOF_INT__ << 3)
>>> +#define BITS_PER_LONG   (BYTES_PER_LONG << 3)
>>> +#define BITS_PER_LLONG  (__SIZEOF_LONG_LONG__ << 3)
>>> +
>>> +#define POINTER_ALIGN   __SIZEOF_POINTER__
>> See how much nicer this is.  This patch possibly wants to wait until
>> I've fixed the compiler checks to update to the new baseline, or we can
>> just say that staging is staging and corner case error messages are fine.
>>
>> One thing, you have to replace the "<< 3" as you're hard-coding 8 here
>> and ignoring __CHAR_BIT__.
>>
>> I'd suggest keeping the BITS_PER_BYTE on the LHS, e.g:
>>
>> #define BITS_PER_INT    (BITS_PER_BYTE * __SIZEOF_INT__)
>>
>> which tabulates better.
>>
>> I suggest keeping BITS_PER_XEN_ULONG to be arch-local.
> I agree here despite ...
>
>>   ARM is the
>> odd-one-out having a non-64bit arch use a 64bit XEN_ULONG.
> ... not agreeing here: x86 is the odd-one-out; I sincerely hope any new ports
> to 32-bit architectures / flavors will avoid compat layer translation by making
> this type a proper 64-bit one. Architectures truly being 32-bit only, with no
> expectation of a 64-bit flavor ever appearing, would be different.

I have some very firm opinions about this.

It is an error that the type xen_ulong exists, anywhere.  The fact it
wasn't named guest_ulong shows a profound misunderstanding of its
purpose and usage in the API/ABI.

Similarly, BITS_PER_XEN_ULONG is buggily named, and should be
BITS_PER_GUEST_ULONG, as demonstrated by it's singular use in Xen
(calculating BITS_PER_EVTCHN_WORD(d)).

ARM declaring that arm32 uses 64-bit xen_ulongs was cutting a corner
that's going to bite twice as hard when 128bit comes along, and
RISCV-128 is in progress already.

All of this needs purging from the API/ABIs before RISC-V/PPC inherit
the mistakes that are holding x86 and ARM back.

~Andrew

