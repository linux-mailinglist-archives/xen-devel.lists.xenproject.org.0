Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 601769DACCD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 19:01:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845035.1260531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGMLr-0006sF-NH; Wed, 27 Nov 2024 18:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845035.1260531; Wed, 27 Nov 2024 18:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGMLr-0006pr-Ka; Wed, 27 Nov 2024 18:01:23 +0000
Received: by outflank-mailman (input) for mailman id 845035;
 Wed, 27 Nov 2024 18:01:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k0uU=SW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tGMLq-0006pl-DA
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 18:01:22 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98adfb3c-ace9-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 19:01:16 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9a977d6cc7so429678866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 10:01:16 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d3fc7a9sm6342911a12.62.2024.11.27.10.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 10:01:14 -0800 (PST)
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
X-Inumbo-ID: 98adfb3c-ace9-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzEiLCJoZWxvIjoibWFpbC1lajEteDYzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk4YWRmYjNjLWFjZTktMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzMwNDc2LjgxOTM1OCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732730476; x=1733335276; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bDLP9mbgI9gmR3ZbQwSJds3EiPuOJx84Eu0LC0TaxTM=;
        b=pa+X+VVr0Jbk2r8F9Z5UzVv14V+d7fbgxx4pRRAuFD3l382fAaN/9dnVlBxj4vfk3+
         tJq/VTBMLkiY8Q5ogvmywLBNi1NG+yNaJFiaEsfdadejGy6XzrnZA2iCzPA5jlrfTlpy
         4dCxS6IlABkHLsMNen34t+oaV75qRkU9NryoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732730476; x=1733335276;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDLP9mbgI9gmR3ZbQwSJds3EiPuOJx84Eu0LC0TaxTM=;
        b=suFJHY/2AyKIxtJ2pQpYaIoIH+teyTazswBlqfzIICRmOgAi8wSpvhQVXekD3aYBUA
         zyzMMEOg7fOUhgv80/sDvxuYScGEC9zkFoPP4+ki128zWZAxBNA83D9IjioGPh+/ori7
         CLy1YvHCfb4If+7S4qUFCfHjxQsThq2G2s2q7UhBILo8fPOMqwXrYyMtYfgX37X/FR+x
         aEm/l/oDOA7OHQm2NuS28uZloHbcLE8OhvslYlKLv+GmZHypmRKZd1/mvazayiZDIN+a
         xoEvBnupzaiJLJ9zDVQeruVZpoShBz0Fa7j1s18dOqbtGF3k4knfT/dTAWmUQ2j+PAuM
         D9GA==
X-Forwarded-Encrypted: i=1; AJvYcCVaKiX8AkIx4Kh45OfygvKEl5GYgxJ8D0JzlaRsXYU/hGzZ12o9S6H3izs9eIkFUktnAdfzHl+Z1+c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDSh26N2hDiCpUV1yLvI7frt/j3rjA9KHzjt3gNZC/Y5HEj/ad
	fc7dc50Y6Eg/0sTpX2eO1oyhlun6BMIhH0J4DtyeI0o8V411GUsPvH580mc2LfA=
X-Gm-Gg: ASbGncsBU9A+dFtkUCFOmsY+SDIE0JnXeq6+iSAVJ+G1lrLseZPBrqlJ2dNmoWQjQKG
	2J0fZfs7+Lg0kWJftuy6l8V12k9AUx/TqUF1w5niwgowBCBxTx3j7ujbrstsIsOjlAMl7WI+OPv
	BDZRJhAEUya2jkxbweJcwcBHIVl/q4ky3L6JTvo5HF5ql1g6YoFcJpIG4aNn3bG7ZPRwB2++wnM
	AddcrbxfR6oXVpSn/XRWsvduZWGwEQaOzzV9subk3iqkHeOqdWpH7pFQATippA=
X-Google-Smtp-Source: AGHT+IEsLO31vG2dJ1zNJ84hTok9cOmYJuwyemxpabxdAP3h1CIVs8fx4VTjUeYJorWhJm9rFnBmRw==
X-Received: by 2002:a05:6402:1d55:b0:5d0:88ea:6560 with SMTP id 4fb4d7f45d1cf-5d088ea65a4mr2466763a12.31.1732730475371;
        Wed, 27 Nov 2024 10:01:15 -0800 (PST)
Message-ID: <912ba37b-f60f-4423-bb10-37c708382951@citrix.com>
Date: Wed, 27 Nov 2024 18:01:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/APIC: Remove workaround Pentium 3AP APIC_ESR erratum
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Javi Merino <javi.merino@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <3270b77c005745dcf56cc833bdf3e4c703190b05.1732639041.git.javi.merino@cloud.com>
 <20241126205859.23090-1-andrew.cooper3@citrix.com>
 <a2efdf6c-ab52-4ab6-931e-0801844b4875@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a2efdf6c-ab52-4ab6-931e-0801844b4875@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2024 8:20 am, Jan Beulich wrote:
> On 26.11.2024 21:58, Andrew Cooper wrote:
>> @@ -1389,8 +1381,7 @@ static void cf_check error_interrupt(void)
>>      unsigned int i;
>>  
>>      /* First tickle the hardware, only then report what went on. -- REW */
>> -    apic_write(APIC_ESR, 0);
>> -    v = apic_read(APIC_ESR);
>> +    v = apic_read_esr();
>>      ack_APIC_irq();
> As indicated in the earlier reply, I think this comment should be dropped,

This one probably can, but ...

> plus ...
>
>> --- a/xen/arch/x86/smpboot.c
>> +++ b/xen/arch/x86/smpboot.c
>> @@ -422,7 +422,7 @@ void asmlinkage start_secondary(void *unused)
>>  static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>>  {
>>      unsigned long send_status = 0, accept_status = 0;
>> -    int maxlvt, timeout, i;
>> +    int timeout, i;
>>  
>>      /*
>>       * Normal AP startup uses an INIT-SIPI-SIPI sequence.
>> @@ -444,8 +444,7 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>>      /*
>>       * Be paranoid about clearing APIC errors.
>>       */
>> -    apic_write(APIC_ESR, 0);
>> -    apic_read(APIC_ESR);
>> +    apic_read_esr();
> ... the one here.

... this one is still correct in place.


I almost had a second function called apic_clear_esr() which was just
(void)apic_read_esr().

I could put that back in if you think it would be clearer ?

>  With that and with Javi's change folded into here,
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

