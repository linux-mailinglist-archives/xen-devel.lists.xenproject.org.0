Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E02ABEBF3
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 08:25:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991493.1375333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHctB-0003Ga-Vx; Wed, 21 May 2025 06:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991493.1375333; Wed, 21 May 2025 06:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHctB-0003ES-TV; Wed, 21 May 2025 06:25:17 +0000
Received: by outflank-mailman (input) for mailman id 991493;
 Wed, 21 May 2025 06:25:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHctA-0003EM-H3
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 06:25:16 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b6c9ded-360c-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 08:25:15 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-601a9e65228so1573730a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 23:25:15 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004550358asm8625437a12.0.2025.05.20.23.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 23:25:14 -0700 (PDT)
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
X-Inumbo-ID: 5b6c9ded-360c-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747808714; x=1748413514; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+G2FemtRri8XxdnSu4MvLGBgUKayZGtMV0PcDdUkTgY=;
        b=BP38GR9wD4aUdidAqBnrMW2vKb6Yd2wVS8gi4JAlB6LXEQEGRohgY1H8y//UGchyoe
         r2Fv/hTrdCQ6+1dKq9uF2/ti75WdJEYfcIZuLLsMMu9E/nqbp5UU7RtiJJU0/nZvjmS7
         qZPDLzxuaWKGRRK6tz0nGjphwEUlQ3sfWqn0JlWU1g9a6y+iK33YMbrZmFWTb8w6VkE2
         wf7or1RhCfsSJcaLk3dOhanh8G5qe8XX5LfIc2gKqpE1MnIZPvLijh+zYfzTfv70046p
         KPv9C1fjKm8xRTdcuXASioa3qbXOc8DkaJbNKkWfqzydeWyUjR2WlDvC5G+03CmbqOmL
         sq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808714; x=1748413514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+G2FemtRri8XxdnSu4MvLGBgUKayZGtMV0PcDdUkTgY=;
        b=PRttQSdclFxn/DUwJS9jHY4pgXu1/6fVhs1MH2tAtU2jlT7+DgsMJVMI5cSBE2Gf7s
         oMgtZjrdgebiaTFUX9kw4JFfbOqn7GntTn+Hjaz8QKUdAU5ACZGtP/WKo1zxtBww63LW
         ClcxonOfpkyyNVtC8sl4/MwTJ4de1AAUVH2T/36wdLfPJm7fdTIs9JbuG5OETgVSsxXO
         r/2bribGncTJ5tAiAHAqJXfwFgOgyp98eDn71Oo/V3Zx4xU6F9vED4yyuggvqMpLnDv+
         9DFb4urcD5Qt87UF+E1w7YWhy4D1Kyh/M15qyeDOjYv/I3c3qAI6ytqkChGlRbhs5YnZ
         7+kA==
X-Gm-Message-State: AOJu0Ywph2nFYC4Qf/5oouIRHjeNYidEkp5mW/2bIJg5+mvnFOy0iKMk
	tFoCyE4i18eTnt55Ie2vitXkjhTSqR0RsdaMm4RdsGniQhVoidqYuXJt5ENtKzpJ5A==
X-Gm-Gg: ASbGncvjwcRrVufIlPauskmjQXek1n62st7F3F7ppmdkyGx4BjDALctHqG+qsl3cEHd
	/xefR0GnWCZ3QvUN1COGMeqWSDj76RA5hlL+KIWauXP0ZilGUDATD+lUxYqvffDvMCYakhTvysk
	eijChoIdvF8nrhSiWyqhRf88nInwyXtniCX12048p4qeuVYjy0c+bhGaku8BZGAtwqEXzkoIAOG
	xhV+vZ3u1+r8lqfgm7W3TlRu1eOgAORJjcHNTv1zvpfYlGW1hrlIIGGWCn6b8NC5qchCwVO6qDc
	sFYKLOzYXPH5aUON1Ta3qtX/6Gl4s1tXiGHpFEllsWFWXPLkfWORVSANA4+V+w==
X-Google-Smtp-Source: AGHT+IF4Pcb+4NB5OVrO9kHDOJ0ELxNQSVih4GsB+pNvtcCavrEhN7C9FhwFoqy0rjJV1azsy+X0Dw==
X-Received: by 2002:a05:6402:50cb:b0:600:5a9e:2b52 with SMTP id 4fb4d7f45d1cf-6008a7a40camr16581389a12.8.1747808714563;
        Tue, 20 May 2025 23:25:14 -0700 (PDT)
Message-ID: <79ae134b-f364-472f-b9a2-eeb1ff55c6fc@suse.com>
Date: Wed, 21 May 2025 08:25:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] vpci/header: Emulate extended capability list
 for dom0
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-4-Jiqian.Chen@amd.com>
 <b569f90b-673d-44c0-b350-8a6f5f3c8d78@suse.com>
 <BL1PR12MB5849E0E13D669CE6B2755399E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <bcdc0848-0c12-4ee0-b923-c7d5243bf097@suse.com>
 <BL1PR12MB58494740C0B258C63C3EBC08E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <20d48f86-d7fe-47c8-89ab-61d816e1d6e9@suse.com> <aCswbbh-0GTdr1tr@Mac.lan>
 <BL1PR12MB5849FAED8343F6F2D2C68BA5E79EA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BL1PR12MB5849FAED8343F6F2D2C68BA5E79EA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.05.2025 08:08, Chen, Jiqian wrote:
> On 2025/5/19 21:21, Roger Pau Monné wrote:
>> On Mon, May 19, 2025 at 03:10:17PM +0200, Jan Beulich wrote:
>>> On 19.05.2025 09:13, Chen, Jiqian wrote:
>>>> On 2025/5/19 14:56, Jan Beulich wrote:
>>>>> On 19.05.2025 08:43, Chen, Jiqian wrote:
>>>>>> On 2025/5/18 22:20, Jan Beulich wrote:
>>>>>>> On 09.05.2025 11:05, Jiqian Chen wrote:
>>>>>>>> @@ -827,6 +827,34 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>>>>>>>>                                                   PCI_STATUS_RSVDZ_MASK);
>>>>>>>>  }
>>>>>>>>  
>>>>>>>> +static int vpci_init_ext_capability_list(struct pci_dev *pdev)
>>>>>>>> +{
>>>>>>>> +    unsigned int pos = PCI_CFG_SPACE_SIZE, ttl = 480;
>>>>>>>
>>>>>>> The ttl value exists (in the function you took it from) to make sure
>>>>>>> the loop below eventually ends. That is, to be able to kind of
>>>>>>> gracefully deal with loops in the linked list. Such loops, however,
>>>>>>> would ...
>>>>>>>
>>>>>>>> +    if ( !is_hardware_domain(pdev->domain) )
>>>>>>>> +        /* Extended capabilities read as zero, write ignore for guest */
>>>>>>>> +        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>>>>>>>> +                                 pos, 4, (void *)0);
>>>>>>>> +
>>>>>>>> +    while ( pos >= PCI_CFG_SPACE_SIZE && ttl-- )
>>>>>>>> +    {
>>>>>>>> +        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
>>>>>>>> +        int rc;
>>>>>>>> +
>>>>>>>> +        if ( !header )
>>>>>>>> +            return 0;
>>>>>>>> +
>>>>>>>> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write32,
>>>>>>>> +                               pos, 4, (void *)(uintptr_t)header);
>>>>>>>
>>>>>>> ... mean we may invoke this twice for the same capability. Such
>>>>>>> a secondary invocation would fail with -EEXIST, causing device init
>>>>>>> to fail altogether. Which is kind of against our aim of exposing
>>>>>>> (in a controlled manner) as much of the PCI hardware as possible.
>>>>>> May I know what situation that can make this twice for one capability when initialization?
>>>>>> Does hardware capability list have a cycle?
>>>>>
>>>>> Any of this is to work around flawed hardware, I suppose.
>>>>>
>>>>>>> Imo we ought to be using a bitmap to detect the situation earlier
>>>>>>> and hence to be able to avoid redundant register addition. Thoughts?
>>>>>> Can we just let it go forward and continue to add register for next capability when rc == -EXIST, instead of returning error ?
>>>>>
>>>>> Possible, but feels wrong.
>>>> How about when EXIST, setting the next bits of previous extended capability to be zero and return 0? Then we break the cycle.
>>>
>>> Hmm. Again an option, yet again I'm not certain. But that's perhaps just
>>> me, and Roger may be fine with it. IOW we might as well start out this way,
>>> and adjust if (ever) an issue with a real device is found.
>>
>> Returning -EEXIST might be fine, but at that point there's no further
>> capability to process.  There's a loop in the linked capability list,
>> and we should just exit.  There needs to be a warning in this case,
>> and since this is for the hardware domain only it shouldn't be fatal.
>>
> If I understand correctly, I need to add below in next version?
> 
>          rc = vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write32,
>                                 pos, 4, (void *)(uintptr_t)header);
> +
> +        if ( rc == -EEXIST )
> +        {
> +            printk(XENLOG_WARNING
> +                   "%pd %pp: there is a loop in the linked capability list\n",

I think we shouldn't say "loop" unless we firmly know that's what the
issue is. Maybe use "overlap" instead? And then also log the offending
register range? (As a nit: "there is" and "linked" are not adding any
value to the log message; to keep them short [without losing
information], please try to avoid such.)

Jan

