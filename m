Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F67687ECF5
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:06:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694862.1084036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFUe-0004NW-D7; Mon, 18 Mar 2024 16:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694862.1084036; Mon, 18 Mar 2024 16:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFUe-0004KP-AX; Mon, 18 Mar 2024 16:05:44 +0000
Received: by outflank-mailman (input) for mailman id 694862;
 Mon, 18 Mar 2024 16:05:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rE6T=KY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rmFUd-0004KJ-5V
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:05:43 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ec1419d-e541-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:05:42 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a46aaf6081fso255143666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:05:42 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 i22-20020a17090671d600b00a46d58fbc11sm81704ejk.118.2024.03.18.09.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 09:05:41 -0700 (PDT)
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
X-Inumbo-ID: 5ec1419d-e541-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710777941; x=1711382741; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n2z791031MnjwyORIdmOta/N62xQ8VXP7ioyI/cQbCk=;
        b=FGIr0c/2wyQH2G0vhDj1rAKZdtZv3G8aKhRW4ZzIYkXt4WtP1lyKcquRu8eaPmfc9y
         SYBToLecdVV6MTrX3E1syq4wP0olnyzC6csot73IaIduIGagBNtpSg9Qk0rfTRv5QJkd
         O/YzSPz5CbcvaCRs32RLlnSLyB2mbHiuT48azJ+5uSdxeZbjb3jYYMpr+kJPhIpeBvZc
         iKyY9u1wzjq3HflY/NlEGW2eg0ILRtOTKyD1sds/Hi8pZmv0+IPNXbnomn4lAOuH9Ckh
         xsyPs0pTlm/s/JED3l6ro4wErjSHhKJMVhx1W6+HD6AN+wkaQSigvqjfQ175VgvJoVf9
         mwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710777941; x=1711382741;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n2z791031MnjwyORIdmOta/N62xQ8VXP7ioyI/cQbCk=;
        b=EApccBI7KKZdE4hXQNuyy/Rpc5p+IH6DPrm4eOJ2dcu9AScyar1ci+fmM9KPx/xQcd
         a6fd1y1vZ//lln6iTXUonjbSygC92lsCd6J1WFhEqSFZEWHvyjhuxnQq4RiNq80GxU4A
         gPmu87X3+XDbZ+QNCJnWZWgzxf8Kdl7YPh5iq380fMCtu5qAEkB4zRY6ddGsrWKo4gbL
         +BiFkDMHsPGMGs5TQzS8v6EVFvJXO9Qx6x/uqm/e4ih/lwCZtaGG6Y1hb5HRe7T6mHXa
         q6yNAo3NVcuW1PG3T9ssrdeAF3+ePDsabbBU9uH9vuCx5hnwvAbzY0mvSR4u++smHgmJ
         Ipuw==
X-Forwarded-Encrypted: i=1; AJvYcCXNvJBi0f/BP4tQEnp8v4M6KpWsj8P24466V1XXUrvtb8bBJFK+qCi+qNYAchRkreldT3Kt4gXrFp7sDiIc+hjxTpX8Gt/8B6eBbDxSgFI=
X-Gm-Message-State: AOJu0Yzgvf5y08CV8QR4eIQg0ui4I/fvISAagEYkf/x9gYOHTLWqWCcj
	MxXpH+tGaMsukuB19bT4++7ERtv+xAQujWAYy4euaBa4OotkNFG5S5x5Sb3d9uY=
X-Google-Smtp-Source: AGHT+IFPUFT8UOZBxZ217QsFSB7tcASN6JcFr+Ty+CUte1Eo59pgmjDm4BNwLqrSvmQ5ET0k24ohsQ==
X-Received: by 2002:a17:907:7e93:b0:a46:a9f7:eebd with SMTP id qb19-20020a1709077e9300b00a46a9f7eebdmr4631967ejc.47.1710777941595;
        Mon, 18 Mar 2024 09:05:41 -0700 (PDT)
Message-ID: <51229f1e-bfbb-41b2-82a9-4b58ce9afaa2@suse.com>
Date: Mon, 18 Mar 2024 17:05:40 +0100
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
 <39e1f192-9790-49da-8f33-1eeb6a245539@suse.com>
 <1ac7b3cd-2f61-4c13-8cac-f74f953ffb08@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <1ac7b3cd-2f61-4c13-8cac-f74f953ffb08@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.03.24 16:59, Jan Beulich wrote:
> On 18.03.2024 16:55, Jürgen Groß wrote:
>> On 18.03.24 15:43, Jan Beulich wrote:
>>> On 14.03.2024 08:20, Juergen Gross wrote:
>>>> Instead of special casing rspin_lock_irqsave() and
>>>> rspin_unlock_irqrestore() for the console lock, add those functions
>>>> to spinlock handling and use them where needed.
>>>>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> with two remarks:
>>>
>>>> --- a/xen/common/spinlock.c
>>>> +++ b/xen/common/spinlock.c
>>>> @@ -475,15 +475,31 @@ void _rspin_lock(rspinlock_t *lock)
>>>>        lock->recurse_cnt++;
>>>>    }
>>>>    
>>>> +unsigned long _rspin_lock_irqsave(rspinlock_t *lock)
>>>> +{
>>>> +    unsigned long flags;
>>>> +
>>>> +    local_irq_save(flags);
>>>> +    _rspin_lock(lock);
>>>> +
>>>> +    return flags;
>>>> +}
>>>> +
>>>>    void _rspin_unlock(rspinlock_t *lock)
>>>>    {
>>>>        if ( likely(--lock->recurse_cnt == 0) )
>>>>        {
>>>>            lock->recurse_cpu = SPINLOCK_NO_CPU;
>>>> -        spin_unlock(lock);
>>>> +        _spin_unlock(lock);
>>>
>>> This looks like an unrelated change. I think I can guess the purpose, but
>>> it would be nice if such along-the-way changes could be mentioned in the
>>> description.
>>
>> I think it would be better to move that change to patch 3.
> 
> Hmm, it would be a secondary change there, too. I was actually meaning to
> commit patches 2-5, but if things want moving around I guess I better
> wait with doing so?

Hmm, maybe just drop this hunk and let patch 7 handle it?


Juergen

