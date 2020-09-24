Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B25527782F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 20:02:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLVZZ-0000cr-M4; Thu, 24 Sep 2020 18:02:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOGg=DB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kLVZY-0000ch-00
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 18:02:24 +0000
X-Inumbo-ID: 496570dc-c0ca-4481-8f6e-e8ee663a7ddb
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 496570dc-c0ca-4481-8f6e-e8ee663a7ddb;
 Thu, 24 Sep 2020 18:02:23 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id k25so159690ljg.9
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2020 11:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=QozUyaOlUZOZUPpOP3Sy+XCd7oWASxbBPpHi2pq5vXU=;
 b=CYj54T0Ylf3TqKFYaR320qqIhynMRtNmgwjW3g0nrL81gIk6Qys47P6tQwMChGbpMc
 7slDVPfxfO/6xYqlg1yX6AfcFSGxOqy70R8l9UldhTp1JS3rBh0W0i2sUiQO8Xzq4z2h
 YOTrGpKMk1EPOCEeKq544oZMFv1n5/ve62ZrJNk2ys4QkT9CFVZHa1qpb/lh3QqSBAG2
 Qtapy7BvQvycQyKqOM0QgfrjxdDnYT4/Wjf4fJkTuFP3z3OclJD/JmfoJmLrbVtcV6AV
 NrYnwaKQ7pcw+nCVbCjTPLZIiiLN9lLWnWFMlSvFhULcEb2yL58QPklyVuiH+S6ng8xU
 i2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QozUyaOlUZOZUPpOP3Sy+XCd7oWASxbBPpHi2pq5vXU=;
 b=CX9dLOis44FSKRiNAqo92o82Nt5QHpZuy/zqmKoKvKQORswnW38YAW0Yjh7sAcBUWs
 0a1KqsrtqS9JPzbUoQ9D/hpz3KVxuPldjNLJyJAxgI0SAM6lwjNrPX+i76JZtRroeZcJ
 9H3ZSf1OT9zDgBzIzXBFMmCJ8ggHaGH1fjnVWgv6e3TuVvsBslgnID50Yhk9uHdlflZC
 4IUFQyRIswxEWZc50q5ZfSNG8FFBkyGKMy0AjfXCRWR7/oaYF0xtO3eXdR7sGxVYbQX0
 q+oB9G0T5SeCYszxfr7shdQxoBGro/14FfgW1QSte33HaRiSg/dbrwAMJ+XHIVtRxpzV
 dygg==
X-Gm-Message-State: AOAM530a14OYKIQ5lDLB5Iu+6JLNlvIizOR3U8SooC4kovV7xCNqj88R
 +pqff29UM3yUlRIkCPRWoq4=
X-Google-Smtp-Source: ABdhPJzwZ3yEc3a8724GGMdEhtIBblCLazpJUqSWrsy7A9ohwUEEiv1taag1cDgdVw1vqS6Hn5HOUA==
X-Received: by 2002:a2e:d01:: with SMTP id 1mr60775ljn.121.1600970541935;
 Thu, 24 Sep 2020 11:02:21 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id s16sm2307388ljg.87.2020.09.24.11.02.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 11:02:21 -0700 (PDT)
Subject: Re: [PATCH V1 09/16] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
From: Oleksandr <olekstysh@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-10-git-send-email-olekstysh@gmail.com>
 <be3401e8-db2b-82a5-b117-2c0fc8b85811@xen.org>
 <7fbab25d-18a9-83d6-2596-f0f9d149058c@gmail.com>
 <af29723b-8ed6-ca8f-8848-29aa65f42b74@suse.com>
 <ffe5148a-e366-d1f1-0a32-2e385ac1934e@gmail.com>
Message-ID: <a039e213-d25b-1819-3a37-8ed858fa17b8@gmail.com>
Date: Thu, 24 Sep 2020 21:02:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ffe5148a-e366-d1f1-0a32-2e385ac1934e@gmail.com>
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


On 24.09.20 19:02, Oleksandr wrote:

Hi

>
> On 24.09.20 14:08, Jan Beulich wrote:
>
> Hi Jan
>
>> On 23.09.2020 22:16, Oleksandr wrote:
>>> On 23.09.20 21:03, Julien Grall wrote:
>>>> On 10/09/2020 21:22, Oleksandr Tyshchenko wrote:
>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>> @@ -91,6 +108,28 @@ struct arch_domain
>>>>>    #endif
>>>>>    }  __cacheline_aligned;
>>>>>    +enum hvm_io_completion {
>>>>> +    HVMIO_no_completion,
>>>>> +    HVMIO_mmio_completion,
>>>>> +    HVMIO_pio_completion
>>>>> +};
>>>>> +
>>>>> +struct hvm_vcpu_io {
>>>>> +    /* I/O request in flight to device model. */
>>>>> +    enum hvm_io_completion io_completion;
>>>>> +    ioreq_t                io_req;
>>>>> +
>>>>> +    /*
>>>>> +     * HVM emulation:
>>>>> +     *  Linear address @mmio_gla maps to MMIO physical frame
>>>>> @mmio_gpfn.
>>>>> +     *  The latter is known to be an MMIO frame (not RAM).
>>>>> +     *  This translation is only valid for accesses as per
>>>>> @mmio_access.
>>>>> +     */
>>>>> +    struct npfec        mmio_access;
>>>>> +    unsigned long       mmio_gla;
>>>>> +    unsigned long       mmio_gpfn;
>>>>> +};
>>>>> +
>>>> Why do we need to re-define most of this? Can't this just be in common
>>>> code?
>>> Jan asked almost the similar question in "[PATCH V1 02/16] xen/ioreq:
>>> Make x86's IOREQ feature common".
>>> Please see my answer there:
>>> https://patchwork.kernel.org/patch/11769105/#23637511
>>>
>>> Theoretically we could move this to the common code, but the 
>>> question is
>>> how to be with other struct fields the x86's struct hvm_vcpu_io
>>> has/needs but
>>> Arm's seems not, would it be possible to logically split struct
>>> hvm_vcpu_io into common and arch parts?
>> Have struct vcpu_io and struct arch_vcpu_io as a sub-part of it?
> Although it is going to pull a lot of changes into x86/hvm/*, yes this 
> way
> we indeed could logically split struct hvm_vcpu_io into common and 
> arch parts in a clear way.
> If it is really worth it, I will start looking into it.
Julien, I noticed that three fields mmio* are not used within current 
series on Arm. Do we expect them to be used later on?
I would rather not add fields which are not used. We could add them when 
needed.

Would be the following acceptable?
1. Both fields "io_completion" and "io_req" (which seems to be the only 
fields used in common/ioreq.c) are moved to common struct vcpu as part 
of struct vcpu_io,
     enum hvm_io_completion is also moved (and renamed).
2. We remove everything related to hvm_vcpu* from the Arm header.
3. x86's struct hvm_vcpu_io stays as it is (but without two fields 
"io_completion" and "io_req").
     I think, this way we separate a common part and reduce Xen changes 
(which are getting bigger).


-- 
Regards,

Oleksandr Tyshchenko


