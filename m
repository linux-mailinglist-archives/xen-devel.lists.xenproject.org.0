Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 125C887ECCC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 16:56:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694844.1084007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFLI-0008Vh-Vz; Mon, 18 Mar 2024 15:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694844.1084007; Mon, 18 Mar 2024 15:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFLI-0008Te-Ro; Mon, 18 Mar 2024 15:56:04 +0000
Received: by outflank-mailman (input) for mailman id 694844;
 Mon, 18 Mar 2024 15:56:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rE6T=KY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rmFLH-0008TW-5d
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 15:56:03 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05237969-e540-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 16:56:02 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a46cf8f649dso85387366b.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 08:56:02 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a1709067f1400b00a468bcde79bsm3745619ejr.109.2024.03.18.08.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 08:56:01 -0700 (PDT)
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
X-Inumbo-ID: 05237969-e540-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710777362; x=1711382162; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQJre/nhIH5uFLd1fQUCQ+si34B+icspJjrPPPSh1lc=;
        b=fAE9P/cYhNVeoOlOnvB1UZjlcI3k3izzjlTWsV3lZHAsnSw0Xr9VoCfMZ/6zrIBa9R
         5RS3Ru78LpUt2RUJVPvA5hUd7W3tfi4W+cfD+nxf4pGCFU6UDeRUBmpKQI5/P/QmnVYt
         xLUQiNN24SLzjYzmGGOO+ugTgP//XkBlp8OZ9i6sHJGMYGvLxud89oUddVn8r4mD28wp
         BC2U3eBgreXNsnwKLKYrzhNcOcgGp2J4vi9KAO7Pj5EPXwCYU1XedpJwb/MxHT/BrAGc
         7ALLqXJs4dJyfwKYypZMelUkcs4g5LBpOZvOIPiR4IwoJE2yQW14Wo7agQFj2jcdaSXj
         Z35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710777362; x=1711382162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQJre/nhIH5uFLd1fQUCQ+si34B+icspJjrPPPSh1lc=;
        b=syZEViNwDyEKFTfZ2WLoD4B3+AxfWzHLxiVYJ2mrEAlKB0EphlvVk+eO0Q+awEyYmS
         I+8VO1hepxuEvWFr8Sy1hfmDJ8VpKPzCH5tSaG7BD/cSZIgSEx8KjT2c1qKBHWQ/UqMw
         T+DfLVsVOgecWBohcnAV+DeE8jSU/p5hQ1gH093KN7H9ibTh43G6/yfu6ds7mLvgQ+nV
         thY2x8cVOGycT3PPNHYzCBU88wDOLKGUkX7ShU2ev88gT7NqUbm65AUkmk0n9pnTyZFd
         DN1plmU+sO7flcPRHddJkaro5XQjuhaQLy4PN3YMmAyrtbj99NBmOYb7tpyI/QXFLPQT
         SZLA==
X-Forwarded-Encrypted: i=1; AJvYcCWNRznOmYwHfmZbhcPyzgAqK1jezEtGt9X/7LUKlKlBxA1S8CwXdKugncsAB0cploV9Bed4k2MvAiKEs5rMO5tCmqYhZtWv+VjqXJCwhio=
X-Gm-Message-State: AOJu0Yx4EFYoF4fzbQLXqrXdDoF9PF/QI14xuZ+0R26NGQaaVWW5nGZN
	t453PgZ7QH/IE97XisL/fjgHlRa3gPwLBVHbnZTQltW2t0xFzKcU1V1adLOpl3dyIDE3mUyWnLX
	E
X-Google-Smtp-Source: AGHT+IEMMgMWIQ5gsSHnFkOzSu1V0ntClm2HytSdOJ9OGykCmxb0n3NUKwmkQypEsPLmwTcWMFxxiA==
X-Received: by 2002:a17:906:b2d1:b0:a46:d430:2ced with SMTP id cf17-20020a170906b2d100b00a46d4302cedmr389329ejb.29.1710777361863;
        Mon, 18 Mar 2024 08:56:01 -0700 (PDT)
Message-ID: <b18afca2-e864-4bb7-8cce-6486c9d938a2@suse.com>
Date: Mon, 18 Mar 2024 16:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/13] xen/spinlock: support higher number of cpus
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-12-jgross@suse.com>
 <37b4410d-8fc5-40c3-bff8-49eaae2298c4@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <37b4410d-8fc5-40c3-bff8-49eaae2298c4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.03.24 16:08, Jan Beulich wrote:
> On 14.03.2024 08:20, Juergen Gross wrote:
>> --- a/xen/include/xen/spinlock.h
>> +++ b/xen/include/xen/spinlock.h
>> @@ -8,16 +8,16 @@
>>   #include <asm/system.h>
>>   #include <asm/spinlock.h>
>>   
>> -#define SPINLOCK_CPU_BITS  12
>> +#define SPINLOCK_CPU_BITS  16
>>   
>>   #ifdef CONFIG_DEBUG_LOCKS
>>   union lock_debug {
>> -    uint16_t val;
>> -#define LOCK_DEBUG_INITVAL 0xffff
>> +    uint32_t val;
>> +#define LOCK_DEBUG_INITVAL 0xffffffff
> 
> With this #define I can see the desire for using a fixed width type for "val".
> However, ...
> 
>>       struct {
>> -        uint16_t cpu:SPINLOCK_CPU_BITS;
>> -#define LOCK_DEBUG_PAD_BITS (14 - SPINLOCK_CPU_BITS)
>> -        uint16_t :LOCK_DEBUG_PAD_BITS;
>> +        uint32_t cpu:SPINLOCK_CPU_BITS;
>> +#define LOCK_DEBUG_PAD_BITS (30 - SPINLOCK_CPU_BITS)
>> +        uint32_t :LOCK_DEBUG_PAD_BITS;
> 
> .. "unsigned int" ought to be fine for both of these.

Fine with me.


Juergen


