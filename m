Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FFC277623
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 18:03:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLThp-0006Nb-Dt; Thu, 24 Sep 2020 16:02:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOGg=DB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kLTho-0006NW-AC
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 16:02:48 +0000
X-Inumbo-ID: 10a84a10-eaff-49bc-bcfc-0aa7c1acc789
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10a84a10-eaff-49bc-bcfc-0aa7c1acc789;
 Thu, 24 Sep 2020 16:02:47 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id b19so3190464lji.11
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2020 09:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=tB0uPrVNqOsYnkX6oL7X3TfZo31rqXN9O+ONbVyqYu0=;
 b=Q9KkEnYHyE1LbDwuf/Xb+gcYD9NeAvFA+uCuPhMBPF6cUUhzP2PJZaNa86vC+CroAJ
 W8oZe93M8ZNjOqoH+T7kIKC3GsLLDf0xgBiZ1mptqcqigs7RvC17xsFcsqpnhuoL/qig
 5wnLu4n8CSEp2oLuI0OZL9DcfpB+Bt8+pvihyUoJvPsz7Gt2zMjukWvfQ/9ssYcP2tEd
 g0QlR3QC3gv8kHOeQvJsBxiz95NeTpvoimC5kaaZIpD/r2IFS7p1yYMdJ1IECTo88kGt
 wdIItDH12erbmOWwFIR3vn76+viFCoTIu+ywJOpLY8iZSJWcYE1gu1c/vWaqSxJqpWVM
 rfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=tB0uPrVNqOsYnkX6oL7X3TfZo31rqXN9O+ONbVyqYu0=;
 b=tOWAahfR93k6xoTej/YcWlNMUyDcYD+vak30sc3ajEg8KyDB+JvmIepiyHXJnAt4XB
 V2W0KSkr0/55os/CMnF71pwJbnb7pgPnbHrqMdHdDvDoPyCKx9Ev7ORtJ966Tkyu1PBW
 uB74aXbTOPOuUsml2rV6Pdzzxjx8HONLP5OW/E7SVdVMii5jx1AmutiJr6aU/V1gKrDp
 Hnkaci55hpFg5U377tYYJdMRvZYMC6VNAyywSOIQ7XkF0p5r0KMshyOle9XlbRPlM0Mo
 qSQdLuHUqdF+sekteRjHk4eNDj3qxvPNTI1IY9jsLxHUpW08onSyfIRsvOByk8D7Bvdl
 dSuA==
X-Gm-Message-State: AOAM530cVAdqQeS9zHa1coFeKTNaSd4qQksMtuVhZW/tyKH/CA3PTQc8
 DQPKvxuAjxDXODfOHtzz3qM=
X-Google-Smtp-Source: ABdhPJx2DG62NUTKNMa7qub2rd3/ZRbQLMXEp16yx1IcRkbYS+4dyzD7uDzyp4OyLQXwOnOXhDyqJA==
X-Received: by 2002:a2e:8e63:: with SMTP id t3mr155495ljk.132.1600963366124;
 Thu, 24 Sep 2020 09:02:46 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k14sm2410508lfm.90.2020.09.24.09.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 09:02:45 -0700 (PDT)
Subject: Re: [PATCH V1 09/16] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-10-git-send-email-olekstysh@gmail.com>
 <be3401e8-db2b-82a5-b117-2c0fc8b85811@xen.org>
 <7fbab25d-18a9-83d6-2596-f0f9d149058c@gmail.com>
 <af29723b-8ed6-ca8f-8848-29aa65f42b74@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ffe5148a-e366-d1f1-0a32-2e385ac1934e@gmail.com>
Date: Thu, 24 Sep 2020 19:02:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <af29723b-8ed6-ca8f-8848-29aa65f42b74@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 24.09.20 14:08, Jan Beulich wrote:

Hi Jan

> On 23.09.2020 22:16, Oleksandr wrote:
>> On 23.09.20 21:03, Julien Grall wrote:
>>> On 10/09/2020 21:22, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> @@ -91,6 +108,28 @@ struct arch_domain
>>>>    #endif
>>>>    }  __cacheline_aligned;
>>>>    +enum hvm_io_completion {
>>>> +    HVMIO_no_completion,
>>>> +    HVMIO_mmio_completion,
>>>> +    HVMIO_pio_completion
>>>> +};
>>>> +
>>>> +struct hvm_vcpu_io {
>>>> +    /* I/O request in flight to device model. */
>>>> +    enum hvm_io_completion io_completion;
>>>> +    ioreq_t                io_req;
>>>> +
>>>> +    /*
>>>> +     * HVM emulation:
>>>> +     *  Linear address @mmio_gla maps to MMIO physical frame
>>>> @mmio_gpfn.
>>>> +     *  The latter is known to be an MMIO frame (not RAM).
>>>> +     *  This translation is only valid for accesses as per
>>>> @mmio_access.
>>>> +     */
>>>> +    struct npfec        mmio_access;
>>>> +    unsigned long       mmio_gla;
>>>> +    unsigned long       mmio_gpfn;
>>>> +};
>>>> +
>>> Why do we need to re-define most of this? Can't this just be in common
>>> code?
>> Jan asked almost the similar question in "[PATCH V1 02/16] xen/ioreq:
>> Make x86's IOREQ feature common".
>> Please see my answer there:
>> https://patchwork.kernel.org/patch/11769105/#23637511
>>
>> Theoretically we could move this to the common code, but the question is
>> how to be with other struct fields the x86's struct hvm_vcpu_io
>> has/needs but
>> Arm's seems not, would it be possible to logically split struct
>> hvm_vcpu_io into common and arch parts?
> Have struct vcpu_io and struct arch_vcpu_io as a sub-part of it?
Although it is going to pull a lot of changes into x86/hvm/*, yes this way
we indeed could logically split struct hvm_vcpu_io into common and arch 
parts in a clear way.
If it is really worth it, I will start looking into it.

-- 
Regards,

Oleksandr Tyshchenko


