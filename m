Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D519B200A22
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 15:29:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmH5R-0000zF-Bm; Fri, 19 Jun 2020 13:29:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JQVA=AA=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1jmH5P-0000ya-Pr
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 13:29:39 +0000
X-Inumbo-ID: e9d72306-b230-11ea-bca7-bc764e2007e4
Received: from mail-ej1-x62b.google.com (unknown [2a00:1450:4864:20::62b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9d72306-b230-11ea-bca7-bc764e2007e4;
 Fri, 19 Jun 2020 13:29:34 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id y13so10217236eju.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2020 06:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=PaKgpu3SbRk0W/p/Y9wdwsKzeRIqBbye0JpiACweMuA=;
 b=QV0OKVgs5Gaaf3lUVKLkF4Iok/qgTt0GhjuT1T3W43BheL+EuvPoYXKQnt+G0CIRgg
 /QUClyiPn7GiJ6vCOWzAhGVjviZ2FvL5LBqNZoUHNtuLnyDilskryFafl7Gdcf0yGcDB
 BjDBGS9h35SX46pNL0EECtfqCxU3Bo2Q+D9KBSO7b2CCJseVtTVo5T9R0buXp2g/BYkQ
 i2IQdqRwB9A/kMGGqQ0jfqdlyXzsmiiiY0NktdqujYoObdtN7rkS7hTQVhUbbFDUm9hu
 P137vV+nt+qmCv1+0y6k3u8pQg8u4HSQZfc3m5mVfY32adqoZx6gWtleLcP6Pxai1PV6
 r6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=PaKgpu3SbRk0W/p/Y9wdwsKzeRIqBbye0JpiACweMuA=;
 b=LiorRPGYPHuc4msiB5wV0r/A6d1IwT4nIJDtbAB2+BMBgQayNmtkkcAeETVzTFJuiU
 l9I+4X+CKaE7caId6tEYkVs6jL5vccKF8scPfoUhKI8s/74C152QNXaiPYZLkKWCsGDN
 SfWZK17Wrq2TFmywHyttVLXK+iUZzL5JkRNCFkVSwFozN0vZAdnUdc95/Xxq53zRd/OE
 PNmUo9lGdb377hPpJ00v60mnCGyjVseu1/gfHH+vBAbrV8CM80Qlq8gwht4HJTH98CV0
 OKi0DbNmrC/vk+1tlxgGvScIncYRF68bphQjUlIF4D1Fu3u+oMqxXG7Wqm/EJ0KsAPEd
 Tcyg==
X-Gm-Message-State: AOAM533HsP7X3nWWdhS65UZO1kmCqgCfSiLH2gNsIH3uOGi/8TpIPxMQ
 vcGw7nHq/mZVXT+BPWf0FgCPH644fzo=
X-Google-Smtp-Source: ABdhPJzeeN6ZLrMsZgQNXTLPMnYiOV9Nr/gzkb453ZogbwZ2nhrdPIOtqYIL1NsXqUhhhfx/NXnvVw==
X-Received: by 2002:a17:906:c150:: with SMTP id
 dp16mr3588367ejc.536.1592573373031; 
 Fri, 19 Jun 2020 06:29:33 -0700 (PDT)
Received: from [192.168.10.4] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id d6sm4788714edn.75.2020.06.19.06.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 06:29:32 -0700 (PDT)
Subject: Re: UEFI support in ARM DomUs
To: Julien Grall <julien@xen.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Julien Grall <julien.grall.oss@gmail.com>,
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
 <b3e805ef-fb0d-308c-57fb-e7b78f82a786@xen.org>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <e40308c0-6a0e-a32c-b36e-ef0620a9b9a9@gmail.com>
Date: Fri, 19 Jun 2020 16:29:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b3e805ef-fb0d-308c-57fb-e7b78f82a786@xen.org>
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
 Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/19/20 4:15 PM, Julien Grall wrote:
>
>
> On 19/06/2020 14:06, Oleksandr Andrushchenko wrote:
>>
>> On 6/19/20 3:59 PM, Julien Grall wrote:
>>> Hi,
>>>
>>> On 19/06/2020 13:51, Oleksandr Andrushchenko wrote:
>>>> On 6/19/20 3:47 PM, Julien Grall wrote:
>>>>> They will not be available from the fdt, but you can retrieve them with an hypervisor call (see HVM_PARAM_STORE_PFN, HVM_PARAM_CONSOLE_PFN).
>>>> Yes, and it used in the relevant pieces of code (hyp calls)
>>>>> One question though, why do you need to map them in advance? Couldn't you map them on demand?
>>>>
>>>> Well, we need to at least estimate the pg_table size so we can reserve and allocate memory later,
>>>
>>> Oh, so U-boot doesn't support runtime page-table table allocation. Is that right?
>> As per my understanding no, we provide a memory map and the tables are allocated beforehand
>
> Ok :(.
>
>>>
>>>>
>>>> so I have to provide memory range from either by coding a constant or looking into the devtree at
>>>>
>>>> hypervisor { reg = <>; }. It is a bit tricky though
>>>
>>> Looking for a node in the device-tree shouldn't be too difficult given that you have fdt_* available.
>>>
>>> However, please not that <reg> doesn't refer to the guest magic pages. Instead, it provides a region you can use for mapping the grant-table frames
>>
>> Indeed, this is in my case 0x38000000, but the magic is at 0x39000000
>>
>> So, I need the memory range set up beforehand, but I can't as there is no cute way to get that.
>>
>> Of course, I can issue a hyp call to get HVM_PARAM_CONSOLE_PFN and use it as the base address,
>>
>> but this smells like a hack. I can call other HVM_PARAM_ to get their pfns and set up the memory regions,
>>
>> but this looks a bit weird.
>
> Why is it weird? In general, you only want to map exactly what you need. Not less, not more.
>
> In your situation, you only care about two pages, the console page and the xenstore page. The rest shouldn't be mapped.
Ok, so I'll try get pfns for HVM_PARAM_CONSOLE_PFN + XENSTORE_PFN_OFFSET via hyp call and map those
>
>> I need that constant badly ;)
>
> No you don't ;).
>
> Cheers,
>
Thanks for helping with this

