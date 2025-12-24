Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33326CDBD71
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 10:44:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192875.1511939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYLPF-0002md-5p; Wed, 24 Dec 2025 09:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192875.1511939; Wed, 24 Dec 2025 09:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYLPF-0002k6-2P; Wed, 24 Dec 2025 09:43:45 +0000
Received: by outflank-mailman (input) for mailman id 1192875;
 Wed, 24 Dec 2025 09:43:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYLPC-0002k0-Uu
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 09:43:42 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6a96c1e-e0ac-11f0-9cce-f158ae23cfc8;
 Wed, 24 Dec 2025 10:43:12 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-598efcf3a89so5798120e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 01:43:12 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a1861f85dsm4822450e87.73.2025.12.24.01.43.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Dec 2025 01:43:11 -0800 (PST)
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
X-Inumbo-ID: f6a96c1e-e0ac-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766569392; x=1767174192; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kTeZegnuJTiKkWXCugrXS1xONo6wmmfVLwXs4g/KXKA=;
        b=WU8fE095FYOu4Vp4DW4/APQGax/RJpzP5NtBLWLdFeSh2OmvDLlv059dHQbSN6AjDQ
         6VXE7HBpmqVk8QIKlIKfGuPK7vrQczeDJmq/d49wzUB43F8+1B04fCom8wTFezZxMTyc
         S09h1nIvyfS6b6oQ1mUU+d7gouTyrDOW1sltu3BjZPkMnOTlpYIoIjvBUOz2iyeuixSN
         /BsPoNG9J/X0ggPC5OFl6JPLYnp+q2/cpUzQd3jV/5BHKPJtVnohBQQXONMk4lxCDF+3
         puDNZNRU6HEAQ/4o6MlmGeH0NilKRdgn+Spng3+oHtVzPuZolDB5ttpp8NMAAdej3kSq
         DF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766569392; x=1767174192;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kTeZegnuJTiKkWXCugrXS1xONo6wmmfVLwXs4g/KXKA=;
        b=AKkPyt4vkyz25893hFOLDs55FW6CJizDzjq+/c0h437igrfF2ydLMvCk+47mxaUCvV
         BLRuO4nWP4RR/tbgyzLRh17dUvuese3Tc6z7p4B4SAsQxyCUvOICMXVxez/HOtS+5mT8
         DmZmqcYS37zkaBSpKMSr/ycX7x1/N3EJ2MC+0KxwumjyvJ/3PlcejIT8cKoTbdvjcWlz
         Ea0oka6Cba/1jOeFZDM/CA3SXiXpwaZzqWo/uwrzuGruCpJpPOEQNBaMbVMLLlZ3EQTs
         vhJcOGeF6pr+AU6hgtNM7SuZ4kvyHCJ7Jllw5bmGBvQsWOitBeg2YKrFMzDQaENiU6NZ
         ddpg==
X-Forwarded-Encrypted: i=1; AJvYcCWx/yCOY/k/Fn/yFP1YufktLRs558yRewAhECXmo19/vylum8aI4gBpTk4Nu4iLO2AFMHL4ZYuCf1k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1rU081M8SuxndXI9w+dV//mHyxDVfEKTi8it4dNtP4cujcpW5
	RhskwfJUD7uaDVAj+o3J9ikpKsdJegA1ekjL9krg+lzOZTJG5G1uSbOA
X-Gm-Gg: AY/fxX7NOHPkElChAISpR6s2E4CwktSd+q6Ok545V07vCDa5VHr8zR+JdjODI3jcdHZ
	I2wOtJWZOr18R/9SHhQayoUyfhzhPduCrjO35TRcnSnhM1LAp8eK7wvY4+CpKn6LcmUuwAXWk+l
	R5YVPml5UTHXKjC5qYLnV5yoo6jPiT6CRnWA4DYE2AUH5MazAM3IkpvUqt6jWpmqw3wDDrEgdVn
	ymawqHRKGKqfJ41pRfz1Ou4Wf6E9zJfBCMTEGeymIO1COiZgiqbylWown5RK/jolRe66WJBILp0
	MvrYSYg7fUGdGxQfn54dWXYrZJAKGVDDSGh9xMtowWk5zQO6+okia9eUv+8GFSornhdYQmswcrW
	3oLDqbUHy7fZIvCusSsHybQX/MtbwkxtaYmNYWqGWImUNhDS1Bd93TRLaVKl0dNz80Zt5yD6w3n
	OO0C/F0vGE7dnVhWa1JtbE8CnUqwrVqK2nKpbbl/bUvm+Ccip2gI9j06pHqkUiru2s
X-Google-Smtp-Source: AGHT+IFb5TINByeCKF+DINOhGYc88r5vudLqxCzjPVayFnzj4v9iQdIAnCuQkl9p5OI268rR95pOAg==
X-Received: by 2002:a05:6512:3d1e:b0:598:8f91:a03e with SMTP id 2adb3069b0e04-59a17df1de2mr5709571e87.50.1766569391690;
        Wed, 24 Dec 2025 01:43:11 -0800 (PST)
Message-ID: <babde702-eaf1-4f97-8961-14f1e635128d@gmail.com>
Date: Wed, 24 Dec 2025 10:43:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] xen/riscv: add RISC-V legacy SBI extension support
 for guests
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766399205.git.oleksii.kurochko@gmail.com>
 <f4225d3134ec12a392a2e5d91414bfdf9d0665a1.1766399205.git.oleksii.kurochko@gmail.com>
 <74eec4dc-de48-4060-8f87-ba04023fda17@suse.com>
 <ace5aa8d-d192-4f6e-a0b7-0005f759d151@gmail.com>
Content-Language: en-US
In-Reply-To: <ace5aa8d-d192-4f6e-a0b7-0005f759d151@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/24/25 10:05 AM, Oleksii Kurochko wrote:
>
> On 12/23/25 5:11 PM, Jan Beulich wrote:
>> On 22.12.2025 17:37, Oleksii Kurochko wrote:
>>> +static int vsbi_legacy_ecall_handler(unsigned long eid, unsigned 
>>> long fid,
>>> +                                     struct cpu_user_regs *regs)
>>> +{
>>> +    int ret = 0;
>>> +
>>> +    switch ( eid )
>>> +    {
>>> +    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
>>> +        vsbi_print_char(regs->a0);
>>> +        break;
>>> +
>>> +    case SBI_EXT_0_1_CONSOLE_GETCHAR:
>>> +        ret = SBI_ERR_NOT_SUPPORTED;
>>> +        break;
>>> +
>>> +    default:
>>> +        /*
>>> +         * TODO: domain_crash() is acceptable here while things are 
>>> still under
>>> +         * development.
>>> +         * It shouldn't stay like this in the end though: guests 
>>> should not
>>> +         * be punished like this for something Xen hasn't implemented.
>>> +         */
>>> +        domain_crash(current->domain,
>>> +                     "%s: Unsupported ecall: FID: #%lx, EID: #%lx\n",
>> Hmm, wait - patch 1 says you would consistently use #%lu for FIDs. I 
>> can adjust
>> while committing, unless you tell me not to.
>
> I think that we should drop printing FID at all for Legacy extension 
> as according to
> the spec.:
>   The SBI function ID field in a6 register is ignored because these 
> are encoded as multiple SBI
>   extension IDs.
> And according to "Function Listing" FID will be 0:
> https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-legacy.adoc#function-listing
>
> I would be happy if you could drop printing of FID during commit. Let 
> me know if you want me to
> drop printing of FID in the next patch series version.
>
EID printing should be also updated to #%#lx.

Sorry for noticing that only now.

~ Oleksii


