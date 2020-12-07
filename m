Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D14B22D1B87
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 22:00:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47019.83245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmNbj-0006En-TL; Mon, 07 Dec 2020 20:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47019.83245; Mon, 07 Dec 2020 20:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmNbj-0006EO-QO; Mon, 07 Dec 2020 20:59:43 +0000
Received: by outflank-mailman (input) for mailman id 47019;
 Mon, 07 Dec 2020 20:59:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=exIY=FL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmNbi-0006EJ-EI
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 20:59:42 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62d2cb66-1c0b-42ca-b705-361a12e6955d;
 Mon, 07 Dec 2020 20:59:41 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f11so4706527ljn.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 12:59:41 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id m15sm2215097lji.130.2020.12.07.12.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 12:59:39 -0800 (PST)
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
X-Inumbo-ID: 62d2cb66-1c0b-42ca-b705-361a12e6955d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=oUiUZRqpkI5YFscM3PoZHzn1lds/nMS0/PGFFF8wK4E=;
        b=rHgkQbb+mwY/o+VhZkZGbQ1+9k6p551rkDrFJYks5J/Yk99AyuNCPBqE72b0ahEz/c
         OLbkyFE+8+rfiJlee4aTiO/6ZxiwmtryZnNhti2cHXX+JpXUt0Gq0qAapWMpaJHVznW+
         aZlJzfEu09di4dZhGfYMlyW3z8P7qYhcnmapgfsM1aKSrMJiZ9qzwFrtKNtC8T+oWBXh
         /rIEUL534xnkZ+jxEd3aTmRdm3sRgvWvvM9RASJuXfzCIQY6cvSgDBo1rr1QSUictqV+
         AmG+d8jKMA4JlvBhuWZX9fo1t5lTN2IlCZxgYD67FjIAaYAV2cCvGnzVF4ot0gz1u2JL
         Oscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=oUiUZRqpkI5YFscM3PoZHzn1lds/nMS0/PGFFF8wK4E=;
        b=dTN+J5v1U0u5bVTFnY8XrrHnZX+nnT6zprgxR5Vg8wcOLo4qNPthz7s4Jb9+e2CkX4
         qHPkLEsxc4+c88v54GxmvwNriaoPIggzD7rZ/kjln6M5ihSYMx4R7n43ok1mCjlMuKC6
         DyNv8/BLohvCdxMfVJzNFKFc2XagLTBiSxwLdzc0vEprpzRJPschzrEWth2RNpGreARY
         jomY0cqHtMSknxeYoVzaFMKjtWKG2dw2R+1dAoiOgolqHejfBhkoHWzhnli6QZaYkSog
         eCvFAvMP+XjpNsprtrPdy0l67oZrl8OcFK8hfrMhAhl3kgyi1fMlPWpDqWxi9cdK3ct5
         CL9Q==
X-Gm-Message-State: AOAM532Idf1CMnBjeFT+91Grq1pNrR6CztnzcRKfCvPbxcqJk3kF9dsF
	SqI4g7T5y4Y4dmZ/kfq7a9Eaxv5CphwGTw==
X-Google-Smtp-Source: ABdhPJxeC6hdyBW9LinjpbvmeQ71a09hY3YeLRYmLYM6E7EXRtXTzzOUisCwCBGrfHQ9HlR1TrO49Q==
X-Received: by 2002:a2e:3807:: with SMTP id f7mr1480028lja.24.1607374779722;
        Mon, 07 Dec 2020 12:59:39 -0800 (PST)
Subject: Re: [PATCH V3 11/23] xen/ioreq: Move x86's io_completion/io_req
 fields to struct vcpu
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-12-git-send-email-olekstysh@gmail.com>
 <742899b6-964b-be75-affc-31342c07133a@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d7d867d3-b508-0c6c-191f-264e1e08bf39@gmail.com>
Date: Mon, 7 Dec 2020 22:59:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <742899b6-964b-be75-affc-31342c07133a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 07.12.20 14:32, Jan Beulich wrote:

Hi Jan, Paul.

> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>> --- a/xen/arch/x86/hvm/emulate.c
>> +++ b/xen/arch/x86/hvm/emulate.c
>> @@ -142,8 +142,8 @@ void hvmemul_cancel(struct vcpu *v)
>>   {
>>       struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
>>   
>> -    vio->io_req.state = STATE_IOREQ_NONE;
>> -    vio->io_completion = HVMIO_no_completion;
>> +    v->io.req.state = STATE_IOREQ_NONE;
>> +    v->io.completion = IO_no_completion;
>>       vio->mmio_cache_count = 0;
>>       vio->mmio_insn_bytes = 0;
>>       vio->mmio_access = (struct npfec){};
>> @@ -159,7 +159,7 @@ static int hvmemul_do_io(
>>   {
>>       struct vcpu *curr = current;
>>       struct domain *currd = curr->domain;
>> -    struct hvm_vcpu_io *vio = &curr->arch.hvm.hvm_io;
>> +    struct vcpu_io *vio = &curr->io;
> Taking just these two hunks: "vio" would now stand for two entirely
> different things. I realize the name is applicable to both, but I
> wonder if such naming isn't going to risk confusion.Despite being
> relatively familiar with the involved code, I've been repeatedly
> unsure what exactly "vio" covers, and needed to go back to the

  Good comment... Agree that with the naming scheme in current patch the 
code became a little bit confusing to read.


> header. So together with the name possible adjustment mentioned
> further down, maybe "vcpu_io" also wants it name changed, such that
> the variable then also could sensibly be named (slightly)
> differently? struct vcpu_io_state maybe? Or alternatively rename
> variables of type struct hvm_vcpu_io * to hvio or hio? Otoh the
> savings aren't very big for just ->io, so maybe better to stick to
> the prior name with the prior type, and not introduce local
> variables at all for the new field, like you already have it in the
> former case?
I would much prefer the last suggestion which is "not introduce local
variables at all for the new field" (I admit I was thinking almost the 
same, but haven't chosen this direction).
But I am OK with any suggestions here. Paul what do you think?


>
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -145,6 +145,21 @@ void evtchn_destroy_final(struct domain *d); /* from complete_domain_destroy */
>>   
>>   struct waitqueue_vcpu;
>>   
>> +enum io_completion {
>> +    IO_no_completion,
>> +    IO_mmio_completion,
>> +    IO_pio_completion,
>> +#ifdef CONFIG_X86
>> +    IO_realmode_completion,
>> +#endif
>> +};
> I'm not entirely happy with io_ / IO_ here - they seem a little
> too generic. How about ioreq_ / IOREQ_ respectively?

I am OK, would like to hear Paul's opinion on both questions.


>
>> +struct vcpu_io {
>> +    /* I/O request in flight to device model. */
>> +    enum io_completion   completion;
>> +    ioreq_t              req;
>> +};
>> +
>>   struct vcpu
>>   {
>>       int              vcpu_id;
>> @@ -256,6 +271,10 @@ struct vcpu
>>       struct vpci_vcpu vpci;
>>   
>>       struct arch_vcpu arch;
>> +
>> +#ifdef CONFIG_IOREQ_SERVER
>> +    struct vcpu_io io;
>> +#endif
>>   };
> I don't have a good solution in mind, and I'm also not meaning to
> necessarily request a change here, but I'd like to point out that
> this does away (for this part of it only, of course) with the
> overlaying of the PV and HVM sub-structs on x86. As long as the
> HVM part is the far bigger one, that's not a problem, but I wanted
> to mention the aspect nevertheless.
>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


