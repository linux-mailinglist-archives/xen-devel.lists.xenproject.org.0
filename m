Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9838308B96
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 18:34:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78385.142623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Xet-0000Ch-4E; Fri, 29 Jan 2021 17:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78385.142623; Fri, 29 Jan 2021 17:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Xet-0000CG-13; Fri, 29 Jan 2021 17:34:11 +0000
Received: by outflank-mailman (input) for mailman id 78385;
 Fri, 29 Jan 2021 17:34:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5Xes-0000C6-6q
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 17:34:10 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c796c66-ee41-420c-9eb6-fdac073d9b43;
 Fri, 29 Jan 2021 17:34:09 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b2so13634269lfq.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 09:34:09 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id x31sm2125047lfu.10.2021.01.29.09.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 09:34:07 -0800 (PST)
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
X-Inumbo-ID: 9c796c66-ee41-420c-9eb6-fdac073d9b43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=DXW/bakaUkg1HBRWdyU1hcDhxAVPR8mpTTG8QvUeLlE=;
        b=CFqcsTKr+nUSZGdfD/Hf0+ikvgP9w0CDF7nVfl27xt7CCjueY80i9j0UlCh0Y0FI7j
         FWUmg/o6xnD+V/plZIt0kI2YsAsYOwktyihb4+An+yuhoVQ2bJ+EAfacMTjlNvhzERrP
         9TK54hILNOOUcYsE9LzshTm346h+nmZxC+WJ1Z3fCWrMab4xV68hM6LlCnRE7M5eA6sA
         C8lrn9+8IK+x7ZTTUdJptWZMdXCnM8Cw7QM73vQETxh62TgvAO3U7I1bpfQF7NIrnXVa
         0oXkDONzCWy0mjG3DPcl8Hoi6nTcCDj1HmVadU+qH4ERrstpKatrIwjKBzQv2uGxe+0Z
         6gBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=DXW/bakaUkg1HBRWdyU1hcDhxAVPR8mpTTG8QvUeLlE=;
        b=MA1XZkD1BI4EpxNBmTaFmUwwQZHNIAJ2/lvnWzU+s4hnQDCAsZwwwCsaEiarPdo7oL
         VxroTX9pNNG+jsdUAQaB52Onm/zciAJ0k5ZwuQaUpq4FY26FuvxDzRWiTxp9js/886j/
         uj2Uk6CYrfGhw/K0L78zaR1aUr3uHAiwJishmWOsNzj6wEBAoxfQuBDBMMDAS4GQaLMg
         E5aLFDdH1QSH2N542F14ax9m6eFrMoIefI/FPcA0np7VYEfZzhvCDlJueDSzqic7WrEY
         uRLoKybvOaV3+DIxS1LwQVPwOCLH79ffdZbIqhz9nsQY8lx8G7EIqmEk9ySVr5tuJJT/
         EYZQ==
X-Gm-Message-State: AOAM531da4U5sTTkeHzYfpUzimqdZmMldqIQVp6PqCnMl1wFPY8Dc5D9
	aRyYvx6gVoFXLvpBOydpf4U=
X-Google-Smtp-Source: ABdhPJwNmlKg+o6XX4bsaZqE9LvqC/Db0dTRJhAJJol6Fv+67+dTQFX1UUafgRyjmLKclsK8klppEw==
X-Received: by 2002:a19:c6:: with SMTP id 189mr2673979lfa.481.1611941648207;
        Fri, 29 Jan 2021 09:34:08 -0800 (PST)
Subject: Re: [PATCH V6 00/24] IOREQ feature (+ virtio-mmio) on Arm
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Kaly Xin <Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <0149ee4f-a148-fc30-2bb2-d39f53a9feee@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <eb9d1d1e-6df7-c215-7e85-74d10c98dda8@gmail.com>
Date: Fri, 29 Jan 2021 19:34:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0149ee4f-a148-fc30-2bb2-d39f53a9feee@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 29.01.21 19:01, Julien Grall wrote:
> Hi Oleksandr,


Hi Julien, all.


>
> On 29/01/2021 01:48, Oleksandr Tyshchenko wrote:
>> Julien Grall (3):
>>    xen/ioreq: Make x86's IOREQ related dm-op handling common
>>    xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
>>    arm/ioreq: Introduce arch specific bits for IOREQ/DM features
>>
>> Oleksandr Tyshchenko (21):
>>    x86/ioreq: Prepare IOREQ feature for making it common
>>    x86/ioreq: Add IOREQ_STATUS_* #define-s and update code for moving
>>    x86/ioreq: Provide out-of-line wrapper for the handle_mmio()
>>    xen/ioreq: Make x86's IOREQ feature common
>>    xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
>>    xen/ioreq: Make x86's hvm_mmio_first(last)_byte() common
>>    xen/ioreq: Make x86's hvm_ioreq_(page/vcpu/server) structs common
>>    xen/ioreq: Move x86's ioreq_server to struct domain
>>    xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu
>>    xen/ioreq: Remove "hvm" prefixes from involved function names
>>    xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
>>    xen/arm: Call vcpu_ioreq_handle_completion() in check_for_vcpu_work()
>>    xen/mm: Handle properly reference in set_foreign_p2m_entry() on Arm
>>    xen/ioreq: Introduce domain_has_ioreq_server()
>>    xen/dm: Introduce xendevicemodel_set_irq_level DM op
>>    xen/arm: io: Abstract sign-extension
>>    xen/arm: io: Harden sign extension check
>>    xen/ioreq: Make x86's send_invalidate_req() common
>>    xen/arm: Add mapcache invalidation handling
>>    xen/ioreq: Do not let bufioreq to be used on other than x86 arches
>>    xen/ioreq: Make the IOREQ feature selectable on Arm
>
> I have used the v7 of the last and committed the series.

Perfect!


>
>
> I am looking forward for the virtio support :).

ok)


>
>
> Thanks for the hard work!

Thank you to all of you for your *thorough* review and help!


>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


