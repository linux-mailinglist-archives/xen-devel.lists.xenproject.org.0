Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D508242B2
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 14:33:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661800.1031525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLNqK-0002Rl-FW; Thu, 04 Jan 2024 13:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661800.1031525; Thu, 04 Jan 2024 13:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLNqK-0002Q8-CI; Thu, 04 Jan 2024 13:33:04 +0000
Received: by outflank-mailman (input) for mailman id 661800;
 Thu, 04 Jan 2024 13:33:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wSyo=IO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rLNqI-0002Q2-E8
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 13:33:02 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7f24dba-ab05-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 14:33:01 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cca5d81826so7094481fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 05:33:01 -0800 (PST)
Received: from [192.168.86.29] ([90.242.36.164])
 by smtp.gmail.com with ESMTPSA id
 fm23-20020a056a002f9700b006dac20d4a57sm1299972pfb.121.2024.01.04.05.32.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 05:33:00 -0800 (PST)
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
X-Inumbo-ID: c7f24dba-ab05-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704375181; x=1704979981; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IOoarImjikDHhb23oqGwyNsvSSa8KI8+QHayYth4w4U=;
        b=dQCnXVgnhb8rXRdN5GcKaPSXbjeZsJfq0dJ4vRm7UWHPdoFYuyiM4xJVeTVkgk6MKR
         3Da2Sby1LEe3IeM7C+XlCDHoIUacYNgHigHylCTWhTKlRbwWgGaFezsueCcnAcptZ71q
         z6X9A6p4ZcuuY9yfXMZaFNfBFsmqm7HmP5SoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704375181; x=1704979981;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IOoarImjikDHhb23oqGwyNsvSSa8KI8+QHayYth4w4U=;
        b=Fh7/dfMa2huouD1NTJfXq32sY3YYqDmE8f8OFmF3lhNIilvtdm13soqMdOOiqCMpTB
         Asmoa8VD/jOYx/5pAzwak6lamLOhautgRVrp+8WCiXJ12Ycx5Tj8/XX9McEaKQ20rY43
         GCN3rLvQL0QKPiXfL6MHDsE8yDoBRjFrcTKShCm2erMT2eXzkQlyaieVqIOVY5s1lMyN
         3O/kkK875BsX8+qiKcfzFvqTbopvxN6MO2CvxDNWozRjW5kaNgfiDGJtgxrs4LCmfOnC
         KYnmMLOnIgyOQBq09l5OOGF70fhuwy84JLwULXODBqfpgOBuQ6ChUn/CnCqat+IjUFV1
         d9Fg==
X-Gm-Message-State: AOJu0Yw219xmV0nict2Xo4BzWwJucX6mCTQz/lOzHIhvH/n10ostuNT9
	yYJaw6iRJNX+7jrwH+0u8tYaFb3EChnvJg==
X-Google-Smtp-Source: AGHT+IE2kgv2LNFO6SVWq2fhcuI6svAHjbDNWZ4Q+AGG02KNmi2uaCxTolgCMXsS6hjZdikmUvaa8A==
X-Received: by 2002:a05:651c:2313:b0:2cc:1d55:eb27 with SMTP id bi19-20020a05651c231300b002cc1d55eb27mr317344ljb.47.1704375180886;
        Thu, 04 Jan 2024 05:33:00 -0800 (PST)
Message-ID: <4458e025-0a4d-4182-bda2-203b1a08ced7@citrix.com>
Date: Thu, 4 Jan 2024 13:32:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/livepatch: Make check_for_livepatch_work() faster in
 the common case
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231222220045.2840714-1-andrew.cooper3@citrix.com>
 <07c7d954-c0f8-447c-9205-646ca2a1de1d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <07c7d954-c0f8-447c-9205-646ca2a1de1d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/01/2024 1:24 pm, Jan Beulich wrote:
> On 22.12.2023 23:00, Andrew Cooper wrote:
>> When livepatching is enabled, this function is used all the time.  Really do
>> check the fastpath first, and annotate it likely() as this is the right answer
>> 100% of the time (to many significant figures).
>>
>> This cuts out 3 pointer dereferences in the "nothing to do path", and it seems
>> the optimiser has an easier time too.  Bloat-o-meter reports:
>>
>>   add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-57 (-57)
>>   Function                                     old     new   delta
>>   check_for_livepatch_work.cold               1201    1183     -18
>>   check_for_livepatch_work                    1021     982     -39
>>
>> which isn't too shabby for no logical change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> I'm still a little disappointed with the code generation.  GCC still chooses
>> to set up the full stack frame (6 regs, +3 more slots) intermixed with the
>> per-cpu calculations.
>>
>> In isolation, GCC can check the boolean without creating a stack frame:
>>
>>   <work_to_to>:
>>     48 89 e2                mov    %rsp,%rdx
>>     48 8d 05 de e1 37 00    lea    0x37e1de(%rip),%rax        # ffff82d0405b6068 <per_cpu__work_to_do>
>>     48 81 ca ff 7f 00 00    or     $0x7fff,%rdx
>>     8b 4a c1                mov    -0x3f(%rdx),%ecx
>>     48 8d 15 45 aa 39 00    lea    0x39aa45(%rip),%rdx        # ffff82d0405d28e0 <__per_cpu_offset>
>>     48 8b 14 ca             mov    (%rdx,%rcx,8),%rdx
>>     0f b6 04 02             movzbl (%rdx,%rax,1),%eax
>>     c3                      retq
>>
>> but I can't find a way to convince GCC that it would be worth not setting up a
>> stack frame in in the common case, and having a few extra mov reg/reg's later
>> in the uncommon case.
>>
>> I haven't tried manually splitting the function into a check() and a do()
>> function.  Views on whether that might be acceptable?  At a guess, do() would
>> need to be a static noinline to avoid it turning back into what it currently
>> is.
> Or maybe move the fast-path check into an inline function, which calls the
> (renamed) out-of-line one only when the fast-path check passes? Downside
> would be that the per-CPU work_to_do variable then couldn't be static anymore.

We can't do that unfortunately.  It's called from assembly in
reset_stack_and_*()

But, I've had another idea.  I think attribute cold can help here, as it
will move the majority of the implementation into a separate section.

~Andrew

