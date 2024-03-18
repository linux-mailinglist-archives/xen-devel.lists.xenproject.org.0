Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E843E87EC39
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 16:32:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694799.1083931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmExF-0000ij-G6; Mon, 18 Mar 2024 15:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694799.1083931; Mon, 18 Mar 2024 15:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmExF-0000fy-Ct; Mon, 18 Mar 2024 15:31:13 +0000
Received: by outflank-mailman (input) for mailman id 694799;
 Mon, 18 Mar 2024 15:31:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rE6T=KY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rmExE-0000fT-F2
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 15:31:12 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bc695d0-e53c-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 16:31:10 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a44ad785a44so529158466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 08:31:10 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a1709063bd100b00a46caa13e67sm719105ejf.105.2024.03.18.08.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 08:31:09 -0700 (PDT)
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
X-Inumbo-ID: 8bc695d0-e53c-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710775870; x=1711380670; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9GIcfB6F1PaixOlBwvgYhZIcpTkWDg05vPZk8nkA5Q=;
        b=QJEGQnYJ52fxp0AbV6yuteUuoiiBORGVgLNf2OAShvPQ8fOTXZWKn82vNSjQbAeFbm
         MUAhufoG4KQhWEgXJo/h6GyS8DmAW0JdthpXiYCYj6MxBMAbt1A5yfdLr2O4ByjHU0W6
         nhpqsF2lCqF2ddA6KHbM8AoT9lr/jz+hjkHqSREG3mmOXjJkpk/VWVwlbQweUbFzXB5f
         ZrYz3Ild1516Fdu/mCg3lcZ9pWd8FsQaYX89neZZM9cKYlBxE9NPHjvZKMTSQFdWW7RO
         F8JfrOIm68I3IKUkgG5BGJ5doYQSCeMooqWNJHh6SbiOXge4qujFjJPUYiag9MHyylTq
         M/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710775870; x=1711380670;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9GIcfB6F1PaixOlBwvgYhZIcpTkWDg05vPZk8nkA5Q=;
        b=NjTGsCAv6cl0ubFD6SYX8tq3cbcWbEZ2qP10Oj3MJ5hMf4dIVK/AcfeNaFLE0bs4EV
         ULoxcaE8E8Bhhxit/C8114InaykzljKbC2Y0cEE01RjIcNGRC0WRfQR284CC7j5dlK7x
         1/KXxl7TeFWNSL6ZK4y31Kvtl3L3l+BcKBLC/g0uJRkCi0WW5R5QHhhHsBog1/JxqAos
         ASDx4A5twJ7n3JkhkXmqxsqEevyX7AYOwjQovI8TroTPt+Z2vMW9L+bj4sQRh9bWdzUS
         n3I3RWYyWn5bgZLZ6CQ+FgeLQHkBxxy9eDQs1KTqIsH9XTtP/piBymk3Devtz7tg5hSh
         OETQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz2XT/0nXsitG2aTQh/og5V+JxQAwqcHA5pMPKxriAoHVxr3EWt9/CcR7KzxzcnRjsoM0AYetwofkCv7VlOjc4zveRSpUDKKtXxgDpo4Y=
X-Gm-Message-State: AOJu0Yx0kvIVYCRm07lAB4508Fy72qhqBCNwbD69mOEzDY1roRWXih09
	KWJ3XOWldi+1X03EZmCT6BGaIFu/nSvuQ9JJoj/K9Vw+54XhNo/lfM3WwLu6vVs=
X-Google-Smtp-Source: AGHT+IG1MVVqoVKJWTyL7mNMp+0xOrQ/Y2gSECy2cIzsPnS0Qzm/WtRZ1wVx6OcXMF9z/e7BaeNUQw==
X-Received: by 2002:a17:907:208a:b0:a46:636a:2c23 with SMTP id pv10-20020a170907208a00b00a46636a2c23mr7819179ejb.34.1710775869717;
        Mon, 18 Mar 2024 08:31:09 -0700 (PDT)
Message-ID: <db53e1fa-d356-4fc8-a319-2a793f964961@suse.com>
Date: Mon, 18 Mar 2024 16:31:08 +0100
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
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <ceb2083a-0d57-44fb-bd78-d8f44ae0bc9b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.03.24 15:57, Jan Beulich wrote:
> On 14.03.2024 08:20, Juergen Gross wrote:
>> --- a/xen/common/spinlock.c
>> +++ b/xen/common/spinlock.c
>> @@ -395,14 +395,7 @@ static bool always_inline spin_is_locked_common(const spinlock_tickets_t *t)
>>   
>>   int _spin_is_locked(const spinlock_t *lock)
>>   {
>> -    /*
>> -     * Recursive locks may be locked by another CPU, yet we return
>> -     * "false" here, making this function suitable only for use in
>> -     * ASSERT()s and alike.
>> -     */
>> -    return lock->recurse_cpu == SPINLOCK_NO_CPU
>> -           ? spin_is_locked_common(&lock->tickets)
>> -           : lock->recurse_cpu == smp_processor_id();
>> +    return spin_is_locked_common(&lock->tickets);
>>   }
> 
> The "only suitable for ASSERT()s and alike" part of the comment wants
> to survive here, I think.

Why?

I could understand you asking for putting such a comment to spinlock.h
mentioning that any *_is_locked() variant isn't safe, but with
_spin_is_locked() no longer covering recursive locks the comment's reasoning
is no longer true.

> 
>> @@ -465,6 +458,23 @@ void _spin_barrier(spinlock_t *lock)
>>       spin_barrier_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
>>   }
>>   
>> +bool _rspin_is_locked(const rspinlock_t *lock)
>> +{
>> +    /*
>> +     * Recursive locks may be locked by another CPU, yet we return
>> +     * "false" here, making this function suitable only for use in
>> +     * ASSERT()s and alike.
>> +     */
>> +    return lock->recurse_cpu == SPINLOCK_NO_CPU
>> +           ? spin_is_locked_common(&lock->tickets)
>> +           : lock->recurse_cpu == smp_processor_id();
>> +}
> 
> Here otoh I wonder if both the comment and the spin_is_locked_common()
> part of the condition are actually correct. Oh, the latter needs
> retaining as long as we have nrspin_*() functions, I suppose. But the
> comment could surely do with improving a little - at the very least
> "yet we return "false"" isn't quite right; minimally there's a "may"
> missing.

If anything I guess the comment shouldn't gain a "may", but rather say
"Recursive locks may be locked by another CPU via rspin_lock() ..."


Juergen

