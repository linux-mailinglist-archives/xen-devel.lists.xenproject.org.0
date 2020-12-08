Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 683332D3206
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 19:22:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47652.84334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmhcl-0002M4-7H; Tue, 08 Dec 2020 18:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47652.84334; Tue, 08 Dec 2020 18:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmhcl-0002Li-4C; Tue, 08 Dec 2020 18:22:07 +0000
Received: by outflank-mailman (input) for mailman id 47652;
 Tue, 08 Dec 2020 18:22:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KXXm=FM=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmhcj-0002Ld-16
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 18:22:05 +0000
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b95ea55-8f77-485c-8c3f-6d45430de5c2;
 Tue, 08 Dec 2020 18:22:03 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s30so25245754lfc.4
 for <xen-devel@lists.xenproject.org>; Tue, 08 Dec 2020 10:22:03 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f10sm497350lfa.139.2020.12.08.10.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 10:22:01 -0800 (PST)
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
X-Inumbo-ID: 0b95ea55-8f77-485c-8c3f-6d45430de5c2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=WB9Rm/l+/bhTPfa+Zw6hszWR35pGFXfkFBv9V096RoE=;
        b=XnsuMmkyeqLTvbs4ZSB5kWKg/cOI4QqB9U+j/l5lP8QcB9FjBTFFp2mSH/Xb+wPdlz
         i8vk/Ym0yEPLBijKlfx36Lw/Mp/Hk8JGyiqQUoZjpQzMRT1AXfDtJuOOY1uRGm6D7ztR
         sQMuhZ4Aw4Ebmk9QFnSHwxgG25kiRcTPivYIDKowlNKGuyZhnLVn+2Apn9d+dfT+tW9J
         va6g9VA59xT0T/8gOPPSwbtzmZa6BwVBNWghR6GTAP06OKlm7rWMs5gWC7VFCIRvK1y4
         KF6b+dqkKYDe5ZISYSuJlbH0FRL8Yya3+s5YUnT3NOYAy0Iw66Zv8FKUqE0MautBeqLG
         CSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WB9Rm/l+/bhTPfa+Zw6hszWR35pGFXfkFBv9V096RoE=;
        b=ZsWYeguvCm8qsog1/fwg1LhyGgaRQpHB3qwjiy0mpSvSYQ88zjDP9En8wihamz9zND
         hYCV1PYMX0r158jtfe6ohpQAmrO0Fx9Y3bN3t8/jUiQ4KqjWY9WmqDyziB4ovUCwu6ed
         oEFdMlNmMFtI6cN36qzypoMZtm+y/wXPwaVv/+SJBMSdikulBEW3NHYXB77t+xst5Zjj
         Iz5NIDIH6xJk2/zCsf2czpTYuRSPp13uqLM5LS0sOTPPt/C45gJtbF/KQSoq4CBlOZaN
         P7rldb5+Sxo5XvL5w22dss60omlpORxrjP5rxjSsWKtUAWEYjFLTWtt/ueLB9okNtgZ/
         /j8Q==
X-Gm-Message-State: AOAM532Zp9XnS6p4tmJcSMvronUxkUF4ZGQNb3kIlJkSiK9LenHJbA+n
	Lw4uZaXqBgR0KOXgMQo9HXuCSPrKYPvi3w==
X-Google-Smtp-Source: ABdhPJy85mdeKgWspK6QiwaeJBOPYXWPXoVjbhgYkGoIavW0WOzteHHgz0ANqcpOF0FCpwwuad/YzQ==
X-Received: by 2002:a05:6512:6c6:: with SMTP id u6mr10423316lff.174.1607451722370;
        Tue, 08 Dec 2020 10:22:02 -0800 (PST)
Subject: Re: [PATCH V3 11/23] xen/ioreq: Move x86's io_completion/io_req
 fields to struct vcpu
To: paul@xen.org, 'Jan Beulich' <jbeulich@suse.com>
Cc: 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Kevin Tian'
 <kevin.tian@intel.com>, 'Julien Grall' <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-12-git-send-email-olekstysh@gmail.com>
 <742899b6-964b-be75-affc-31342c07133a@suse.com>
 <d7d867d3-b508-0c6c-191f-264e1e08bf39@gmail.com>
 <0d3c01d6cd37$0c013770$2403a650$@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <c3e31e73-585b-4516-27ce-019db254b893@gmail.com>
Date: Tue, 8 Dec 2020 20:21:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0d3c01d6cd37$0c013770$2403a650$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 08.12.20 09:52, Paul Durrant wrote:

Hi Paul, Jan

>>> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>>>> --- a/xen/arch/x86/hvm/emulate.c
>>>> +++ b/xen/arch/x86/hvm/emulate.c
>>>> @@ -142,8 +142,8 @@ void hvmemul_cancel(struct vcpu *v)
>>>>    {
>>>>        struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
>>>>
>>>> -    vio->io_req.state = STATE_IOREQ_NONE;
>>>> -    vio->io_completion = HVMIO_no_completion;
>>>> +    v->io.req.state = STATE_IOREQ_NONE;
>>>> +    v->io.completion = IO_no_completion;
>>>>        vio->mmio_cache_count = 0;
>>>>        vio->mmio_insn_bytes = 0;
>>>>        vio->mmio_access = (struct npfec){};
>>>> @@ -159,7 +159,7 @@ static int hvmemul_do_io(
>>>>    {
>>>>        struct vcpu *curr = current;
>>>>        struct domain *currd = curr->domain;
>>>> -    struct hvm_vcpu_io *vio = &curr->arch.hvm.hvm_io;
>>>> +    struct vcpu_io *vio = &curr->io;
>>> Taking just these two hunks: "vio" would now stand for two entirely
>>> different things. I realize the name is applicable to both, but I
>>> wonder if such naming isn't going to risk confusion.Despite being
>>> relatively familiar with the involved code, I've been repeatedly
>>> unsure what exactly "vio" covers, and needed to go back to the
>>    Good comment... Agree that with the naming scheme in current patch the
>> code became a little bit confusing to read.
>>
>>
>>> header. So together with the name possible adjustment mentioned
>>> further down, maybe "vcpu_io" also wants it name changed, such that
>>> the variable then also could sensibly be named (slightly)
>>> differently? struct vcpu_io_state maybe? Or alternatively rename
>>> variables of type struct hvm_vcpu_io * to hvio or hio? Otoh the
>>> savings aren't very big for just ->io, so maybe better to stick to
>>> the prior name with the prior type, and not introduce local
>>> variables at all for the new field, like you already have it in the
>>> former case?
>> I would much prefer the last suggestion which is "not introduce local
>> variables at all for the new field" (I admit I was thinking almost the
>> same, but haven't chosen this direction).
>> But I am OK with any suggestions here. Paul what do you think?
>>
> I personally don't think there is that much risk of confusion. If there is a desire to disambiguate though, I would go the route of naming hvm_vcpu_io locals 'hvio'.
Well, I assume I should rename all hvm_vcpu_io locals in the code to 
"hvio" (even if this patch didn't touch these places so far since no new 
vcpu_io fields were involved).
I am OK, although expecting a lot of places which need touching here...


>
>>>> --- a/xen/include/xen/sched.h
>>>> +++ b/xen/include/xen/sched.h
>>>> @@ -145,6 +145,21 @@ void evtchn_destroy_final(struct domain *d); /* from complete_domain_destroy
>> */
>>>>    struct waitqueue_vcpu;
>>>>
>>>> +enum io_completion {
>>>> +    IO_no_completion,
>>>> +    IO_mmio_completion,
>>>> +    IO_pio_completion,
>>>> +#ifdef CONFIG_X86
>>>> +    IO_realmode_completion,
>>>> +#endif
>>>> +};
>>> I'm not entirely happy with io_ / IO_ here - they seem a little
>>> too generic. How about ioreq_ / IOREQ_ respectively?
>> I am OK, would like to hear Paul's opinion on both questions.
>>
> No, I think the 'IO_' prefix is better. They relate to a field in the vcpu_io struct. An alternative might be 'VIO_'...
>
>>>> +struct vcpu_io {
>>>> +    /* I/O request in flight to device model. */
>>>> +    enum io_completion   completion;
> ... in which case, you could also name the enum 'vio_completion'.
>
>    Paul

ok, will follow new renaming scheme IO_ -> VIO_ (io_ -> vio_).


-- 
Regards,

Oleksandr Tyshchenko


