Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A70A0584B0E
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 07:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377300.610436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHISu-0003uN-9H; Fri, 29 Jul 2022 05:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377300.610436; Fri, 29 Jul 2022 05:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHISu-0003ry-6U; Fri, 29 Jul 2022 05:23:12 +0000
Received: by outflank-mailman (input) for mailman id 377300;
 Fri, 29 Jul 2022 05:23:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N3XD=YC=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oHISs-0003rm-OQ
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 05:23:10 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87fd51aa-0efe-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 07:23:08 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id sz17so6598982ejc.9
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jul 2022 22:23:08 -0700 (PDT)
Received: from [192.168.1.93] (adsl-69.109.242.233.tellas.gr. [109.242.233.69])
 by smtp.gmail.com with ESMTPSA id
 1-20020a170906200100b0072b40cb28a8sm1223307ejo.29.2022.07.28.22.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 22:23:07 -0700 (PDT)
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
X-Inumbo-ID: 87fd51aa-0efe-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bkArkBMFaSF/dRm7YFfpjL5+yokN4a60zgz8WQkGncw=;
        b=lokOm7O1NJ7QcFykkVVWXQrJhFAY4bhSBCvFogwdwJE4afF3kMUwuFRflUIrgig+YS
         urVPj5Ucq36deX3TLGbd5kJmJC44/xQIQjBhKS5MrxweQWO+1hgC3SRBe9ROjtmAkDrw
         hQX7P8XubA7ML0so9XrJVFn4ET3wUqldJ87VdkoVV0NQRl6Z0/SwU4/wHeRsODAICLuP
         XRUVWXIBDaruV+3Us5fXVTy4olyYPV2sQ5eVnkyQLyFIZIdYJyigg7DvAWyDYbFU5vRU
         h/JMrgUDUIFOoRJOFPvKPgZNZSsvxoCP7r5Y9jGG2xseFzKtO0kU/sNR7b61x1Xbj33O
         eFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bkArkBMFaSF/dRm7YFfpjL5+yokN4a60zgz8WQkGncw=;
        b=Rj1dS5xni06woX0dWNcR/5MBhlwYpGfyClNTTz3EJuf0t0NunlTE4FTYlnB4DDcgyR
         Bu9misb13N79qGnLT+xBgQVxR36JjugBfJOSv2ZG1b01HKI25SQQm7boautXe+voQ8p4
         NkYEEBn3FYUFiFBz5keCKsPrheUrmjRglV9e+uviPYR5hhUFsMVscEerkVjiXmbA5l9i
         NNWvTSFAZMbc10ckw2RU+NMAPifxx7Vg9+tv6JaiSGp2NKBfak1yuIsR9dwpOVJH0SS2
         SAW8efx3UzhdMpFe216Jw4t8+5eZZ4t2dHtiE7ZK/fDvjVXEX5gMOZsvPIDhtTdswZ8j
         EjDA==
X-Gm-Message-State: AJIora/ik3zPjIGF1f9HwCKWicdisI30QMbwFFA1HGDaiGRxU7F07dnZ
	tdnwx9scm82b2/3mi5WXC5M=
X-Google-Smtp-Source: AGRyM1v1iRKtORqp1f6u5u+Wc7ZWi3i/iST1EUN7J7QcgkHAE5UtnvWNtXu+7Ysp3VZYfc/pO1hxSg==
X-Received: by 2002:a17:906:ef90:b0:72b:9ce5:f016 with SMTP id ze16-20020a170906ef9000b0072b9ce5f016mr1525167ejb.697.1659072187878;
        Thu, 28 Jul 2022 22:23:07 -0700 (PDT)
Message-ID: <ec89b2e1-a18a-9ef7-1ca8-edd19e737d4f@gmail.com>
Date: Fri, 29 Jul 2022 08:23:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220728134943.1185621-1-burzalodowa@gmail.com>
 <0a8ff178-280d-717f-dacb-4eb9f57a24eb@xen.org>
 <83c17bf6-b9b2-a297-6f7f-dd08231d0f90@suse.com>
 <c71c9522-2df5-35a3-d39c-706d5c9d5263@xen.org>
 <alpine.DEB.2.22.394.2207281551140.4648@ubuntu-linux-20-04-desktop>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2207281551140.4648@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 7/29/22 01:56, Stefano Stabellini wrote:
> On Thu, 28 Jul 2022, Julien Grall wrote:
>> On 28/07/2022 15:20, Jan Beulich wrote:
>>> On 28.07.2022 15:56, Julien Grall wrote:
>>>> On 28/07/2022 14:49, Xenia Ragiadakou wrote:
>>>>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>>>>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>>>>> @@ -461,7 +461,7 @@
>>>>>     /* Access to system registers */
>>>>>        #define WRITE_SYSREG64(v, name) do {                    \
>>>>> -    uint64_t _r = v;                                    \
>>>>> +    uint64_t _r = (v);                                              \
>>>>
>>>> I am failing to see why the parentheses are necessary here. Could you
>>>> give an example where the lack of them would end up to different code?
>>>
>>> I think it is merely good practice to parenthesize the right sides of =.
>>> Indeed with assignment operators having second to lowest precedence, and
>>> with comma (the lowest precedence one) requiring parenthesization at the
>>> macro invocation site, there should be no real need for parentheses here.
>>
>> I am not really happy with adding those parentheses because they are
>> pointless. But if there are a consensus to use it, then the commit message
>> should be updated to clarify this is just here to please MISRA (to me "need"
>> implies it would be bug).
> 
> Let me premise that I don't know if this counts as a MISRA violation or
> not. (Also I haven't checked if cppcheck/eclair report it as violation.)
> 
> But I think the reason for making the change would be to follow our
> coding style / coding practices. It makes the code simpler to figure out
> that it is correct, to review and maintain if we always add the
> parenthesis even in cases like this one where they are not strictly
> necessary. We are going to save our future selves some mental cycles.
> 
> So the explanation on the commit message could be along those lines.

First, the rule 20.7 states "Expressions resulting from the expansion of 
macro parameters shall
  be enclosed in parentheses". So, here it is a clear violation of the 
rule because the right side of the assignment operator is an expression.

Second, as I stated in a previous email, if v is not enclosed in 
parentheses, I could write the story of my life in there and compile it 
:) So, it would be a bug.

So, I recommend the title and the explanation i.e
"xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation

The macro parameter 'v' is used as an expression and needs to be enclosed in
  parentheses."
to remain as is because they are accurate.

Xenia

