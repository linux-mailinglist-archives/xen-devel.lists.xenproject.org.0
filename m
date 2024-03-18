Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC7C87ECCA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 16:55:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694842.1083997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFKh-000831-Mq; Mon, 18 Mar 2024 15:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694842.1083997; Mon, 18 Mar 2024 15:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFKh-0007zq-K0; Mon, 18 Mar 2024 15:55:27 +0000
Received: by outflank-mailman (input) for mailman id 694842;
 Mon, 18 Mar 2024 15:55:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rE6T=KY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rmFKf-0007zk-SQ
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 15:55:25 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee146862-e53f-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 16:55:23 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a46805cd977so453034566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 08:55:23 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a1709067f1400b00a468bcde79bsm3745619ejr.109.2024.03.18.08.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 08:55:23 -0700 (PDT)
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
X-Inumbo-ID: ee146862-e53f-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710777323; x=1711382123; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dUEPalGmDXdpQ5eI8mLGAlTuARjS7QQ1V8I4dDK1z9g=;
        b=PW7fPvrSAS5vX6XQUOVgE6VDArsAz6fz/9Kbl0feTgmRoKFoMgY+MM32hLpF+6+jIh
         7cezVfLKrL8fGcErsZ5EFfcmXRIMqqcAWIiUx2zFjO++7M/Hqw5Oj8r2Hp8rkd3a0O4u
         GV9tHWHeqkDb28D9du6egdOHurD5bj8/iWEFe196baWfbhhZksC/OJsMVxD7EbojA7gV
         mq5yufwOiwXdxhhce8y3JJ1KGZ8fpCqYuVjeO0K6NLvpIQLoOG6S3YjfFkTK8fXM5Fhm
         FVwdn+64QDv4UIn6shyruvNwc/Fk72qvpFB3NSAO4kKPaScRVMmkp+cqeCaWwWUTem5Y
         9Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710777323; x=1711382123;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dUEPalGmDXdpQ5eI8mLGAlTuARjS7QQ1V8I4dDK1z9g=;
        b=EpnPhbPvBfm/1CKOtnV8AsJWwYSFvM5RG/Tbh6sU6p9bP3qqQ4k4OiJXMaHPpxYjEa
         wn8YrNo3Iww9icxR8b9rvzrE4f/0s6OP3cxDFnk71dwKa1Qq0OsTGv5MYpFzD4ySfVVa
         mjbHszGtom/Ae89MDYjlnlcpIB8dLFyVtDoB+rgyXMRABXlnvU3VWQ7yIG8RlHEKH/M2
         61DVr3XotnO1Zh8W3dXljAjMqUc64UgQvKnG1q5m57r1nR5Q3ZoIDZ4nLcAPmMdK42iJ
         KusFpGBTTm5MIF1ztKWdllYGleSRkiCg4zOKERQMZJ3hrHYKYuZ41mHP1ZprNdlFrgOE
         3s7g==
X-Forwarded-Encrypted: i=1; AJvYcCVMl0KkkOo0AaC6xBvIYJcxYzlEvYkJjGNfAqUwuqyrk828r1aKI+cMFoYR8U+WqQXZn2O5j/UNbTkbx0WDPKcllV6LpbJ25xRHRoATfhE=
X-Gm-Message-State: AOJu0YyDLuYvpOJjwqSPQu5mXUiP8A2zemMVfJtb46QL2PETMAmG0RR9
	Vm9ll8OSDCDiPfAuzuvYT5EjDW1nQS+n5J7AUyyCmEfbDC4atWQv0otKn/d3MqI=
X-Google-Smtp-Source: AGHT+IH5jFzXO8+bsqCVFgSb/RdY2e94djCs8rhKL5LhE2LqQwj/c5m685dqh5OnfADlo0VInRFv8Q==
X-Received: by 2002:a17:906:17d5:b0:a46:ba9d:29aa with SMTP id u21-20020a17090617d500b00a46ba9d29aamr2398417eje.66.1710777323136;
        Mon, 18 Mar 2024 08:55:23 -0700 (PDT)
Message-ID: <39e1f192-9790-49da-8f33-1eeb6a245539@suse.com>
Date: Mon, 18 Mar 2024 16:55:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] xen/spinlock: add
 rspin_[un]lock_irq[save|restore]()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-5-jgross@suse.com>
 <1b8417b8-93aa-4976-a27a-701cfdf183b4@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <1b8417b8-93aa-4976-a27a-701cfdf183b4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.03.24 15:43, Jan Beulich wrote:
> On 14.03.2024 08:20, Juergen Gross wrote:
>> Instead of special casing rspin_lock_irqsave() and
>> rspin_unlock_irqrestore() for the console lock, add those functions
>> to spinlock handling and use them where needed.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with two remarks:
> 
>> --- a/xen/common/spinlock.c
>> +++ b/xen/common/spinlock.c
>> @@ -475,15 +475,31 @@ void _rspin_lock(rspinlock_t *lock)
>>       lock->recurse_cnt++;
>>   }
>>   
>> +unsigned long _rspin_lock_irqsave(rspinlock_t *lock)
>> +{
>> +    unsigned long flags;
>> +
>> +    local_irq_save(flags);
>> +    _rspin_lock(lock);
>> +
>> +    return flags;
>> +}
>> +
>>   void _rspin_unlock(rspinlock_t *lock)
>>   {
>>       if ( likely(--lock->recurse_cnt == 0) )
>>       {
>>           lock->recurse_cpu = SPINLOCK_NO_CPU;
>> -        spin_unlock(lock);
>> +        _spin_unlock(lock);
> 
> This looks like an unrelated change. I think I can guess the purpose, but
> it would be nice if such along-the-way changes could be mentioned in the
> description.

I think it would be better to move that change to patch 3.

> 
>> --- a/xen/include/xen/spinlock.h
>> +++ b/xen/include/xen/spinlock.h
>> @@ -272,7 +272,15 @@ static always_inline void spin_lock_if(bool condition, spinlock_t *l)
>>    */
>>   bool _rspin_trylock(rspinlock_t *lock);
>>   void _rspin_lock(rspinlock_t *lock);
>> +#define rspin_lock_irqsave(l, f)                                \
>> +    ({                                                          \
>> +        BUILD_BUG_ON(sizeof(f) != sizeof(unsigned long));       \
>> +        ((f) = _rspin_lock_irqsave(l));                         \
> 
> Perhaps in the context of another patch in the series I think I had
> pointed out that the outer pair of parentheses is unnecessary in
> constructs like this.

Oh, this one slipped through, sorry for that.

Will fix it in the next iteration.


Juergen

