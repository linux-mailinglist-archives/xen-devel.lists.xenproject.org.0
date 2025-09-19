Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5EBB8A4A9
	for <lists+xen-devel@lfdr.de>; Fri, 19 Sep 2025 17:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126910.1468165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzd3I-0006Ep-MZ; Fri, 19 Sep 2025 15:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126910.1468165; Fri, 19 Sep 2025 15:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzd3I-0006DE-JB; Fri, 19 Sep 2025 15:29:36 +0000
Received: by outflank-mailman (input) for mailman id 1126910;
 Fri, 19 Sep 2025 15:29:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uzd3H-0006D6-6D
 for xen-devel@lists.xenproject.org; Fri, 19 Sep 2025 15:29:35 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7175e53c-956d-11f0-9d14-b5c5bf9af7f9;
 Fri, 19 Sep 2025 17:29:33 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3df15fdf0caso2014043f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Sep 2025 08:29:33 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698033cd5csm56570205ad.136.2025.09.19.08.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 08:29:32 -0700 (PDT)
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
X-Inumbo-ID: 7175e53c-956d-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758295773; x=1758900573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HmOvKQ2Lgm8QOTcAN98WW76aXj91TXMiVdioKx/66XI=;
        b=X/RaMiXgkMi64Hu7jfjs6u5GDtVu/t9J21cz739dNUs863s7GYznBQrGfWqPx9Na+n
         MbcRNT7ljZNloOHxsPqs4ptycdzAEWF7/U60ImDsd3kmSDx1ShyebcEWNBQibbLZdsPv
         lTjrWVPOcYmndr4xkR2wVjN2Fuuc74s6xKn6QjiTg3OKLLh++i/PLPfplSLmz3uWr+VN
         QFY35ZOQtyyJ9BVpqoTQx5ydMcXN7DtmlY4tK0N4h4e7S4oCRjI6F/CHb5Q+2ZLIfjFe
         zAaZlAm75hmgfqLxOzJQwvbQIXURScn1lOaxMxV1SqcuHk/yqheZdHHdRpO+qDeVbETw
         XVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758295773; x=1758900573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HmOvKQ2Lgm8QOTcAN98WW76aXj91TXMiVdioKx/66XI=;
        b=f5ItOb5JceblNn5EkwMN+ZJp259IhGiy4xwXB4RsVui/a07p8+FanYjoBMqkKlUaLB
         Eujvhy6MuY5G73jXWwc/6NwuVk7hCiVVfFoj/DVFa0He/L0qD3+Z9reTzE+JdBV4bt8c
         t1ncunPX5DuoZuZm98qe/GnbjecAX5WkbgfUHT1owslQjtkv3+j54DKaarutIjb5YP+x
         Wx3cYuSKfYjuWw0YIq0pANbmx6I7e4IdM6AM/L6iC0ZpPRZMTd42mCKR84Tu9p74/0cr
         v/3+bY61TO/DY08Mai1GPEUX/5BYsZ2YiiJlycvW2ER2t1hy1/FA3dfV2MAtKamXMeBM
         N4Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXiKxU9Am6EVBn3WjRmBAPRX+TB61FqmhzsV16k4wYbNEEdsq2rzJXntBhMKRtN80nvMge+qF2KDCg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOV7o0M+aIK3eDPc2whmYDJ/BDqxB1lfwCADxV49ocZrW5jd7C
	xU8B9pGuoIcYtygf637KmpMA/Y62uUqaBUt99CjG9tJnN1aE/5CCD5mAu71frrPW7w==
X-Gm-Gg: ASbGncuIgUCZ/M/rdxkRVj6JUuX6B4nYdXwriQOeQbkeuudK5W17A2coGXgKw4cJe0G
	FHGxjIowwWqt64k4k6nY858v2XegywKHgYKvOWnylbORGpyzOBlqH3Uuicpkf2VewE8V8Fu1WSd
	s3OeHf9fhW+VaDE+kCt+fil+4QJkTbWWqN0YA4UY9Aawx5OzXvw92vNdPNJZudzApfPIqbgG4Oh
	f3twPmExpLk4slB3il3veDv9GrvhyjPMfRl74RUO9QpZbAhrvneYly4zJv4oNdqExhqVbXy7a0F
	Qs6i8/F1PRUNvPohSP8m62Ff/uOLqQ8GGBIRcnQkxoFE7Jj9OkWJp6vH+Ioo7CppKt46Z7vRsod
	Mpq2mpmocKsqP6j5/MfeFafyalzWqMOXFU/2lPv9v+nY=
X-Google-Smtp-Source: AGHT+IFVnEGwW60BREuwFEUl79/9sCKVWRvigl2eoFNG3bcqsQGBWBIGZzGWJAdXSFYVwExfhyDQqg==
X-Received: by 2002:a05:6000:1789:b0:3ec:df2b:14c8 with SMTP id ffacd0b85a97d-3ee7d0c8b68mr3236855f8f.20.1758295773092;
        Fri, 19 Sep 2025 08:29:33 -0700 (PDT)
Message-ID: <146fc872-2ba5-4dc5-9e0f-2d10e2836a2e@suse.com>
Date: Fri, 19 Sep 2025 17:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v3] x86: make Viridian support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250916134114.2214104-1-grygorii_strashko@epam.com>
 <0e1a6339-a4fb-4697-acfa-392168b391d4@suse.com>
 <2d6e5cc6-15c1-40ce-8742-1b77b32203a9@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2d6e5cc6-15c1-40ce-8742-1b77b32203a9@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.09.2025 19:17, Grygorii Strashko wrote:
> On 18.09.25 18:41, Jan Beulich wrote:
>> On 16.09.2025 15:41, Grygorii Strashko wrote:
>>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
>>> @@ -1116,14 +1116,14 @@ static int cf_check viridian_save_domain_ctxt(
>>>   {
>>>       const struct domain *d = v->domain;
>>>       const struct viridian_domain *vd = d->arch.hvm.viridian;
>>> -    struct hvm_viridian_domain_context ctxt = {
>>> -        .hypercall_gpa = vd->hypercall_gpa.raw,
>>> -        .guest_os_id = vd->guest_os_id.raw,
>>> -    };
>>> +    struct hvm_viridian_domain_context ctxt = {};
>>>   
>>>       if ( !is_viridian_domain(d) )
>>>           return 0;
>>
>> This check doesn't check for vd being non-NULL, so this still feels a little
>> fragile, even if it looks correct now.
> 
> Hm. May be I missing smth., but
> - if is_viridian_domain(d) and viridian_domain_init() succeeded
>    then d->arch.hvm.viridian != NULL, like always
>    (otherwise domain will not be created)
> 
> - if !is_viridian_domain() then code will not go further
> 
> so I'm missing to see how !d->arch.hvm.viridian (!vd) can happen here.

Well, as said - it feels a _little_ fragile, as it's not the NULL-ness of
the pointer that is checked.

>>> +    ctxt.hypercall_gpa = vd->hypercall_gpa.raw;
>>> +    ctxt.guest_os_id = vd->guest_os_id.raw,
>>> +
>>>       viridian_time_save_domain_ctxt(d, &ctxt);
>>>       viridian_synic_save_domain_ctxt(d, &ctxt);
>>>   
>>
>> Just below here we have viridian_load_domain_ctxt(), which I'm pretty sure
>> now also needs to gain some check: Save records coming from user space, we
>> can't really rely on there being none of this type for a non-Viridian domain.
> 
> As per my understanding:
> viridian_load_domain_ctxt() calls hvm_load_entry_zeroextend() which
> should not succeed if context was not saved (which shouldn't happen for
> !is_viridian_domain(d) case).

I don't understand what you mean with "was not saved". To be free of security
issues, we need to cope with any (bogus or not) record appearing.

Jan

