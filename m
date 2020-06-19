Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B60200A2B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 15:31:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmH73-0001lX-NA; Fri, 19 Jun 2020 13:31:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JQVA=AA=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1jmH73-0001lP-0e
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 13:31:21 +0000
X-Inumbo-ID: 2902c15c-b231-11ea-bca7-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2902c15c-b231-11ea-bca7-bc764e2007e4;
 Fri, 19 Jun 2020 13:31:20 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t21so7574833edr.12
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2020 06:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Oxt1StwaUiC4djXg8ZT3f+J1WnLfc5wAvRyWOgwguKg=;
 b=Aa7LWdLKXj8wj6UIAaWWeoltjgxQ4Vxm+CIJJUnrcLbpSbFFg7M6nkOzdKoOUKkEap
 v4TSY6GPJbS/ZvJmuQsNQAjCCq1SCSU+GxrbyiQv1hQt/3fBRf0JbJHVVIzxKHj1ipHI
 eDFZhI4qPVKZPDsPfMcFkDkfGZh9GPkO7UAhUfE98Yp6NeDiq7T290jawKRUmKwO0vTV
 FPUCxKnFSDE83RgxaMYJAr16mwTHjpf102O65D0QsWhRQKWqU3vx2sAXCAJVnUkeB+F2
 a9/8Za64+/qnY9LmN5wm/a5WkAQoVQyKvMUwloB++XnUUu7f35QHbeKm5MTKmAiMktrq
 d7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Oxt1StwaUiC4djXg8ZT3f+J1WnLfc5wAvRyWOgwguKg=;
 b=LLwvltI5wfHLTyklP+rJ2WEdPau+RdXozFMePzY5S5gO1pTzfSA+Y5y7Ib8JaZdWpN
 hNxGGJUfMM8LDM6zjLSnUXhNp6R3TIWaFtMqss5Oh4d94EZW4mi+VcrjUPyuUQDvKKmn
 czeQSVpeJ7CM7a0tqGXo5z1QCM8JChKanlweVs+ZfDsSqx66z+1SFsaZUDnXXbd6B2kQ
 9mpegXqXZiRWtEEhD1KVeVKi5pSVRA91y/SRkomBiSwsbyvXl+eMImVMswkD/KKKm8Ze
 oXRHVrprfLMPHbIOQ5VB31q+RVZS73as1Cmgx4vIp3Cu+oPtTgqdkHBZc4HHL1XHriWc
 W/7w==
X-Gm-Message-State: AOAM531nBqWUIAuaBcd0E7m3mMmBYaM1+7IRGsY35aQb6PSB5Cq7AEoP
 +U51/dm4RobCofDFgiZ1u1a8bbQfwJM=
X-Google-Smtp-Source: ABdhPJzjCN26/UEWXvyN3yxsvsZgg/Ik6GuChNV3fxyvx6YI6AV59C4i7ug+X4uv4RqJxMyA+GHCLg==
X-Received: by 2002:a05:6402:3c1:: with SMTP id
 t1mr3427952edw.350.1592573478628; 
 Fri, 19 Jun 2020 06:31:18 -0700 (PDT)
Received: from [192.168.10.4] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id p26sm4530673eds.57.2020.06.19.06.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 06:31:18 -0700 (PDT)
Subject: Re: UEFI support in ARM DomUs
To: Peng Fan <peng.fan@nxp.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Julien Grall <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
 <17a14578-6fc7-925d-6f69-8b2fcbf40ff3@epam.com>
 <9d4a6e78-49d3-01c3-251b-6d66f56c2761@xen.org>
 <ebf32205-55b0-8a40-1935-d3591be058ce@epam.com>
 <d7334aea-363e-49f6-f8c3-336e3c20eb0f@xen.org>
 <424cfbdc-0744-fcf7-5bb4-52aca2357df7@epam.com>
 <DB6PR0402MB2760B7DF20EEDEB32B02191188980@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <e59df241-774b-c8e8-ea19-0e95ccbf29ad@gmail.com>
Date: Fri, 19 Jun 2020 16:31:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760B7DF20EEDEB32B02191188980@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/19/20 4:16 PM, Peng Fan wrote:
>> Subject: Re: UEFI support in ARM DomUs
>>
>>
>> On 6/19/20 3:59 PM, Julien Grall wrote:
>>> Hi,
>>>
>>> On 19/06/2020 13:51, Oleksandr Andrushchenko wrote:
>>>> On 6/19/20 3:47 PM, Julien Grall wrote:
>>>>> They will not be available from the fdt, but you can retrieve them with an
>> hypervisor call (see HVM_PARAM_STORE_PFN,
>> HVM_PARAM_CONSOLE_PFN).
>>>> Yes, and it used in the relevant pieces of code (hyp calls)
>>>>> One question though, why do you need to map them in advance?
>> Couldn't you map them on demand?
>>>> Well, we need to at least estimate the pg_table size so we can reserve and
>> allocate memory later,
>>> Oh, so U-boot doesn't support runtime page-table table allocation. Is that
>> right?
>> As per my understanding no, we provide a memory map and the tables are
>> allocated beforehand
> You are right.
ok, so then we only have a choice of probing the range via hyp calls
> Regards,
> Peng.
>>>> so I have to provide memory range from either by coding a constant or
>> looking into the devtree at
>>>> hypervisor { reg = <>; }. It is a bit tricky though
>>> Looking for a node in the device-tree shouldn't be too difficult given that you
>> have fdt_* available.
>>> However, please not that <reg> doesn't refer to the guest magic pages.
>> Instead, it provides a region you can use for mapping the grant-table frames
>>
>> Indeed, this is in my case 0x38000000, but the magic is at 0x39000000
>>
>> So, I need the memory range set up beforehand, but I can't as there is no cute
>> way to get that.
>>
>> Of course, I can issue a hyp call to get HVM_PARAM_CONSOLE_PFN and use it
>> as the base address,
>>
>> but this smells like a hack. I can call other HVM_PARAM_ to get their pfns and
>> set up the memory regions,
>>
>> but this looks a bit weird. I need that constant badly ;)
>>
>>> Cheers,
>>>

