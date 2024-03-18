Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5BA87EC97
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 16:50:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694831.1083977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFF9-0005Gd-Rx; Mon, 18 Mar 2024 15:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694831.1083977; Mon, 18 Mar 2024 15:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFF9-0005Ek-P5; Mon, 18 Mar 2024 15:49:43 +0000
Received: by outflank-mailman (input) for mailman id 694831;
 Mon, 18 Mar 2024 15:49:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rE6T=KY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rmFF8-0005EW-Hp
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 15:49:42 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 219fd712-e53f-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 16:49:40 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56829f41f81so6310253a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 08:49:40 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 cf13-20020a0564020b8d00b00569731a1eb2sm1332485edb.46.2024.03.18.08.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 08:49:39 -0700 (PDT)
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
X-Inumbo-ID: 219fd712-e53f-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710776980; x=1711381780; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wUV2XqQza7lh7Z9gxvg1e3DFAK1zWnksTDOLlHqEAkY=;
        b=GCVS9vgAYSTmI11CLFKfyG0+obFmC+2F/SNsCbS8bgqSK+tGGfnkUjMbJVAyVfalmZ
         a6yoNM/haGV9cU/DZdCwoklXWf4aHlMpKQFRLcCxQu/MbceC9Eoj98xS827bZroMffN1
         SFw++gLA2FE718DPUzzj+mm39fLEHiQDtJ4is8aq7lPky3ZMSnrfAU5PdAWcrpeH04vW
         +hLVzgQ3588uSUrZP/WV3it7t4EoHM60z7W3/VhprORnLr0DIKk9ukqPxroxCQmq4vTM
         Qqwa7kLPFZX6CEBs0+vhHPuj114ZNc0/XbD4mgJbVbnikp3RwQTUr5BN4nzG9UpGK2uc
         wNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710776980; x=1711381780;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUV2XqQza7lh7Z9gxvg1e3DFAK1zWnksTDOLlHqEAkY=;
        b=mLBMXgdLRH7KomqY4IOO+qoaH3m/aTQaE8TLZL9WO4QPs2soSy82lBfXPC/pV7R9Gj
         NaqkJoBjap9QiL9QG2/DxcC/kz+mmUwVhJ6yyoFBNpF3HtL+gTtv7M0ZKAyanT+Qr5KQ
         o567Km9n1dkYtk7ODVaksL6SFHuWZGHduu3eV36/VheP9Udc5c4EnSYZR4IixyM2zZWu
         OZsIWt7wCws9049AfPfHbRKIKsTTZgoo7tE6DMaT3YTDAGEtRT3h2nedsHi3CFHCv3Uk
         NJZJu4jRf3rnL34HAG3UClHQrGFcb/bHxcKIOQhGOyO9oQWjL8sQ/no7t5QIK43tseBC
         yZuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA0w2mjON6ySePDZoh4ILzsB9YBC5MDo0K3R68hC7dsWiaiwV520XhlF50M3QU9kojlUb2vFLxwUl7uwumIQ2EiRd9CTeuCEWPPE/sW60=
X-Gm-Message-State: AOJu0Yy7pOs8XcTcSoSaMM6/xjUEMLfTzkRBRi7eJxsOYpXXp2VxBxMY
	5SLiWzF11G5mtzslnQvgqhwrkxZ33FhZiIKwAat/foS0h6PIBGsqVWi3/a04pMc=
X-Google-Smtp-Source: AGHT+IGG2F9tc9AENOeLchADcnW+T578qfq5oq+avDI9GfHDfpZu+hQyGGuYqxelY9JDronlgGimDA==
X-Received: by 2002:a05:6402:2401:b0:568:a05e:eafd with SMTP id t1-20020a056402240100b00568a05eeafdmr10636679eda.39.1710776980111;
        Mon, 18 Mar 2024 08:49:40 -0700 (PDT)
Message-ID: <f7c320c3-0289-453a-8106-da7538dd5e96@suse.com>
Date: Mon, 18 Mar 2024 16:49:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] xen/spinlock: add missing rspin_is_locked() and
 rspin_barrier()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-9-jgross@suse.com>
 <ceb2083a-0d57-44fb-bd78-d8f44ae0bc9b@suse.com>
 <db53e1fa-d356-4fc8-a319-2a793f964961@suse.com>
 <e8ba5b07-e2ac-4520-9f0b-a0bc11dd34da@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <e8ba5b07-e2ac-4520-9f0b-a0bc11dd34da@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.03.24 16:44, Jan Beulich wrote:
> On 18.03.2024 16:31, Jürgen Groß wrote:
>> On 18.03.24 15:57, Jan Beulich wrote:
>>> On 14.03.2024 08:20, Juergen Gross wrote:
>>>> --- a/xen/common/spinlock.c
>>>> +++ b/xen/common/spinlock.c
>>>> @@ -395,14 +395,7 @@ static bool always_inline spin_is_locked_common(const spinlock_tickets_t *t)
>>>>    
>>>>    int _spin_is_locked(const spinlock_t *lock)
>>>>    {
>>>> -    /*
>>>> -     * Recursive locks may be locked by another CPU, yet we return
>>>> -     * "false" here, making this function suitable only for use in
>>>> -     * ASSERT()s and alike.
>>>> -     */
>>>> -    return lock->recurse_cpu == SPINLOCK_NO_CPU
>>>> -           ? spin_is_locked_common(&lock->tickets)
>>>> -           : lock->recurse_cpu == smp_processor_id();
>>>> +    return spin_is_locked_common(&lock->tickets);
>>>>    }
>>>
>>> The "only suitable for ASSERT()s and alike" part of the comment wants
>>> to survive here, I think.
>>
>> Why?
>>
>> I could understand you asking for putting such a comment to spinlock.h
>> mentioning that any *_is_locked() variant isn't safe, but with
>> _spin_is_locked() no longer covering recursive locks the comment's reasoning
>> is no longer true.
> 
> Hmm. I guess there is a difference in expectations. To me, these
> functions in principle ought to report whether the lock is "owned",
> not just "locked by some CPU". They don't, hence why they may not be
> used for other than ASSERT()s.

Okay, thanks for clarification. I'll change the comment accordingly.


Juergen

