Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AEF9623E7
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 11:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784597.1193982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjFI7-0003ix-DA; Wed, 28 Aug 2024 09:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784597.1193982; Wed, 28 Aug 2024 09:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjFI7-0003hO-9k; Wed, 28 Aug 2024 09:48:39 +0000
Received: by outflank-mailman (input) for mailman id 784597;
 Wed, 28 Aug 2024 09:48:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjFI5-0003hI-Ja
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 09:48:37 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b222efe7-6522-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 11:48:36 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42bac9469e8so348655e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 02:48:36 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e54851d9sm219066766b.24.2024.08.28.02.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 02:48:34 -0700 (PDT)
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
X-Inumbo-ID: b222efe7-6522-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724838516; x=1725443316; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t1bbLMZVqWv5hn4w+rWnt+7lHpcNra8b9rwjurRD0Vo=;
        b=dpkS098I/yJdzoOSGv0EQnSEF7U/AWMZXQgtNn8pFp+OdfKU4ZwPGB91BXZN/Wioav
         XHWCm1/sIY7sCy3suyZDhSlmcDCEp7yez+tgP+1IjCALwut/Ho/TsgHAfvN20iGFjSzi
         Iv7A/GkVfck1rtXMHSTTt1GvPR+nO1M4teADY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724838516; x=1725443316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1bbLMZVqWv5hn4w+rWnt+7lHpcNra8b9rwjurRD0Vo=;
        b=S08FEXzW0aF7q8azj3qmC+xNY2I3nxtiMQGnROTno0KFbYUwB48xSvLfxQAUikyBH4
         2iWpwfQkbiujkHMZql0vVJwV41hPFFp6tHCwYepy7tADCX0PFfKN+N/J5hSdVMOjqnsF
         SeewTFraHMk48NjRLxsCOPmxz4YiNRepFDVZDnFbFI0zPz6VrPWEBR41TN47bxqon6L9
         1HDwXICBM/ckbqO+2tuglJg3TzStOOvFvnO3y3HLC3LJ+AleuBB6AEnwBKvb13VNPxzU
         VLGoOpR2DN4qZ0R6D9+Lq3owtNukVXIuOC9sJC7yCpg/6C+n+4tzyVemrUexNpuNq9Q3
         nARQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN+oYDqj7mt1WFZeYi0CJm+E+J7G+IlaKAJQPk88cw/YfAdH3D0WaYs2O7IrsBVRB0vL2oUxafA9E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzStmgd8KNqrHpZ/Eq8xE661l0M/MdLzG69jTJ6yN3xJql9KVd6
	e6GKa1B601FttSedeecBtbTkPogzjSTOlUjyoCzPQ8F0jpGl6E6K+4aLXww1cc0=
X-Google-Smtp-Source: AGHT+IGIcwEiFwYJZlsB0jsOcOn/H4IUiU+sCzzjcSFyZvR1dw/u2WTODQ46dJPhaaaAT2xKW5yTKA==
X-Received: by 2002:a5d:4404:0:b0:371:8a70:b10e with SMTP id ffacd0b85a97d-373118e9f6dmr9693976f8f.60.1724838515106;
        Wed, 28 Aug 2024 02:48:35 -0700 (PDT)
Message-ID: <0d831d53-ebc4-48b6-9d50-b0d554c298de@citrix.com>
Date: Wed, 28 Aug 2024 10:48:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM/vgic: Fix variable shadowing in vgic_to_sgi()
To: Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20240827234522.2237355-1-andrew.cooper3@citrix.com>
 <748f9e0d-e630-42f2-9273-95e2e85c524f@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <748f9e0d-e630-42f2-9273-95e2e85c524f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2024 8:06 am, Michal Orzel wrote:
>
> On 28/08/2024 01:45, Andrew Cooper wrote:
>>
>> for_each_set_bit() allocates its own variable intentionally as loop-scope
>> only.  Unfortunately, this causes the inner 'i' to shadow the outer 'i'.
> NIT: I'd mention it violates MISRA R5.3

Done.

>
>> Drop the outermost 'i' and 'vcpuid' variables, moving them into a more narrow
>> scope and correcting them to be unsigned which they should have been all
>> along.
>>
>> Fixes: 9429f1a6c475 ("ARM/vgic: Use for_each_set_bit() in vgic_to_sgi()")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  xen/arch/arm/vgic.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
>> index 8ffe099bcb5f..6ecd9146511c 100644
>> --- a/xen/arch/arm/vgic.c
>> +++ b/xen/arch/arm/vgic.c
>> @@ -468,8 +468,6 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
>>                   int virq, const struct sgi_target *target)
>>  {
>>      struct domain *d = v->domain;
>> -    int vcpuid;
>> -    int i;
>>      unsigned int base, bitmap;
>>
>>      ASSERT( virq < 16 );
>> @@ -483,7 +481,8 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
>>
>>          for_each_set_bit ( i, bitmap )
>>          {
>> -            vcpuid = base + i;
>> +            unsigned int vcpuid = base + i;
> With this change you should replace the printk specifier from %d to %u for vcpuid.

So I should, yes.

>
> Apart from that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks.  Sorry for breaking CI.

I did run Eclair on it, but for the manually triggered run, it only
generates a warning, and does not trigger a "pipeline {failed,fixed}"
event, because the pipeline hasn't changed state from the last time I
ran it.

I'm not sure if we can do any better for something which is
conditionally manually triggered.

~Andrew

