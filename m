Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DAC403054
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 23:34:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181364.328442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNijn-0004oD-JO; Tue, 07 Sep 2021 21:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181364.328442; Tue, 07 Sep 2021 21:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNijn-0004l2-GH; Tue, 07 Sep 2021 21:34:39 +0000
Received: by outflank-mailman (input) for mailman id 181364;
 Tue, 07 Sep 2021 21:34:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjNB=N5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mNijl-0004kw-To
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 21:34:37 +0000
Received: from mail-lj1-x231.google.com (unknown [2a00:1450:4864:20::231])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c141cd11-d8c8-4d3a-adaf-8e5ec596e468;
 Tue, 07 Sep 2021 21:34:36 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id y6so848208lje.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Sep 2021 14:34:36 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id g10sm11246lfb.87.2021.09.07.14.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 14:34:35 -0700 (PDT)
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
X-Inumbo-ID: c141cd11-d8c8-4d3a-adaf-8e5ec596e468
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=X3YkShdpCjM0j8ZJigoaLHyM/keq1t8ObtbGWzImwWs=;
        b=V7Z2S2HGFliTqXR5z+T5SKrmTBIfsYQA/s7U71bLMtmcWh0w18IZXZzNwo0ebUiRxk
         XgeZNNf7lFV4m1cCZ/zo691i89CXPU2ELG1qlRtwHVUiud+rMuibDSUsqAjZqehzC3ig
         xg2cGzo1yAwq6NGWwO4LNWEkdgpoGsvw3OD0ymhb5vWvbTNWNStnTV2YTG/B0Xpv/uce
         hjqiQ3nzhxNnTKBpK83GrNZoXscSZ5Qq/iBj/8BQZcF7C+urcDpxVhMidzOlZfvDOFev
         vilsdOgVU8a0ZZHFFbMr3TJCjSLm//rtDFpNLMQxHwOQV03o36fUR+uvESynoOvKfGQi
         47lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=X3YkShdpCjM0j8ZJigoaLHyM/keq1t8ObtbGWzImwWs=;
        b=Zm7P3cK00zBmm1b5ilRBP24oFY8ONANMJzbg3njQ3dMx0BozKnODTUTLz6PQ0YqJwq
         cZJ3YQDBwuouLq3RcMQo2IX72Qc1SfZbA0WoCK3JNL4wdHhGAm3jCkgk8td7vnhfiLc7
         E9TqWVVFDeBwFO/r7FGj2EYxhe9yyivmQkKyG7DmXZHeX8BmgO8t9E/TA3IesHVgWzAo
         jm/XdpmOrq10jlBbuOgU+rU96HyUbmzn6SKsxBiW3oTOKj5C7a6DEFUTQnZsDTywh3Ba
         YqHZ+OmKXA7I5VK8xfajHxfM2GJr/ljtSf39LM9G6uPA32P+w+I46sDeWBMxC/Iglt/O
         Q2Gw==
X-Gm-Message-State: AOAM532o0Lcqv+Hzf7XhTB587SLSbpGC+wc6By2WOtNYvM442W8WnFXI
	21AxJ6LEvZeiDYJmrodZGd8=
X-Google-Smtp-Source: ABdhPJwLmj7DVmaZk+g6qRV0XlrRzgLrUEGqmkKXpjdOLi1nQnMrPUtIUmK6+j1KR5qFqcM9O4F1uA==
X-Received: by 2002:a2e:90ca:: with SMTP id o10mr232555ljg.67.1631050475852;
        Tue, 07 Sep 2021 14:34:35 -0700 (PDT)
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <PA4PR08MB6253F59F4C63FFE50CC6ADBC92D39@PA4PR08MB6253.eurprd08.prod.outlook.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b420b0ab-588b-f1c3-cf5b-edfefe67ba08@gmail.com>
Date: Wed, 8 Sep 2021 00:34:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <PA4PR08MB6253F59F4C63FFE50CC6ADBC92D39@PA4PR08MB6253.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 07.09.21 11:53, Henry Wang wrote:
> Hi Oleksandr,

Hi Henry


>
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>> Oleksandr Tyshchenko
>> Sent: Thursday, July 29, 2021 12:19 AM
>> To: xen-devel@lists.xenproject.org
>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Daniel De
>> Graaf <dgdegra@tycho.nsa.gov>; Daniel P. Smith
>> <dpsmith@apertussolutions.com>; Ian Jackson <iwj@xenproject.org>; Wei
>> Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; George
>> Dunlap <george.dunlap@citrix.com>; Jan Beulich <jbeulich@suse.com>;
>> Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Roger Pau Monné
>> <roger.pau@citrix.com>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Wei Chen <Wei.Chen@arm.com>
>> Subject: [RFC PATCH] xen/memory: Introduce a hypercall to provide
>> unallocated space
>>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Add XENMEM_get_unallocated_space hypercall which purpose is to
>> query hypervisor to find regions of guest physical address space
>> which are unused and can be used to create grant/foreign mappings
>> instead of wasting real pages from the domain memory for
>> establishing these mappings. The problem with the current Linux
>> on Xen on Arm behaviour is if we want to map some guest memory
>> regions in advance or to perform cache mappings in the backend
>> we might run out of memory in the host (see XSA-300).
>> This of course, depends on the both host and guest memory sizes.
>>
>> The "unallocated space" can't be figured out precisely by
>> the domain on Arm without hypervisor involvement:
>> - not all device I/O regions are known by the time domain starts
>>    creating grant/foreign mappings
>> - the Dom0 is not aware of memory regions used for the identity
>>    mappings needed for the PV drivers to work
>> In both cases we might end up re-using these regions by
>> a mistake. So, the hypervisor which maintains the P2M for the domain
>> is in the best position to provide "unallocated space".
>>
>> The arch code is in charge of finding these regions and filling
>> in corresponding array in new helper arch_get_unallocated_space().
>>
>> This patch implements common and Arm parts, the x86 specific bits
>> are left uniplemented for now.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Tested-by: Henry Wang <Henry.Wang@arm.com>

Thank you!


Please note, I have pushed new version (which is notably different) 
based on the discussion in current thread:

https://lore.kernel.org/xen-devel/1631034578-12598-1-git-send-email-olekstysh@gmail.com/



>
> Kind regards,
>
> Henry
>
-- 
Regards,

Oleksandr Tyshchenko


