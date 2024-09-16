Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7042C979C4D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 09:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799280.1209219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6Xv-0000yU-EZ; Mon, 16 Sep 2024 07:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799280.1209219; Mon, 16 Sep 2024 07:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6Xv-0000vo-BK; Mon, 16 Sep 2024 07:53:19 +0000
Received: by outflank-mailman (input) for mailman id 799280;
 Mon, 16 Sep 2024 07:53:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OuWe=QO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sq6Xt-0000vh-Pr
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 07:53:17 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9b7d0b6-7400-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 09:53:13 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5365aa568ceso3104893e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 00:53:15 -0700 (PDT)
Received: from [10.9.6.216] (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e7c72sm274650366b.187.2024.09.16.00.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 00:53:14 -0700 (PDT)
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
X-Inumbo-ID: b9b7d0b6-7400-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726473195; x=1727077995; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/yI0ipNaoopYuH7pPyht0tt1qPFfLVJOMDv8U6vkky8=;
        b=J0jVJ9Y0ykkUOMEIWrJP09/tcgDwNgZ0p0+MfzyODhwDFqu/Mneae6x+UBcT3rKEQf
         NZCbBlz+Am2RMr1Y298zINpK1a/KzfflkqNOnFRJzzqiGZwwTQnrsH8Izqj+biFFpPuT
         CcQ7EYfHfvWfzaLqsX+kyHGoZuunmCAK7sMnmumgN4ED0RMAxZWNigkuunzOydXJCZWW
         gMLpieI5bVxfjctzMh9SbZeZxJmkSGJquY/nCbuGj8fNwf20+JMobaWEummJMyWxUAvm
         YuPoMCnO/p9aTYw6YrGMW0RreJ0h1kOG6XIB7VqeW7nnrAskxaGRECpF6RN2hp1bbjDO
         dgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726473195; x=1727077995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/yI0ipNaoopYuH7pPyht0tt1qPFfLVJOMDv8U6vkky8=;
        b=sI0NgDzjgVehX08xXNFYFzt3csxpFN2rguijjFg7yqB7e53/tQAlYOx3kDCXsoZbIK
         E29utyYtwOrMDM6E6rFCDZvM/2eZAfd7BJ+WC7WXQuVgvaIWBwx9SzXcDbb+alY2y2+h
         DTiz9n8cNtzhAxpRduO4rRUmYc5K7lZgpB9Jsc4q13AThXDPnuNoMd2mUFlDEecjgIDo
         Mw8/eL06oGdRU6ky4SbPStb86bigNN8CniNxBkijgGvbR5Ezvk9bVI6gNYFxQ0H/QHnh
         PYiivUl6U79UmrNF5A4EDor3BFNWjPuWZNglgtpiEeOoP0FsMVpQqfPvEoCjqTt4qN3h
         lKPA==
X-Forwarded-Encrypted: i=1; AJvYcCVlg5aUItkH9fYAtc9RY+Pqwi/XeFDbF2pS9EAswgRfrjPjgG7p9nm+gw8hgtSNKEu0mRQTiV/KoAw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkjeiTv0hVBybyu36KoszPoX840lD1mr2/0HEYtOk23jEnpnQb
	nB7T2Vmm+L04qE+uyV5mN0i7rB/GYcnr4QLPiHaKIeKSoMypDHMF/R8YlxS/YA==
X-Google-Smtp-Source: AGHT+IE3lvF5Ujyz0QNHO43PodAkG2yFss8OMFCGZ/gbyJ9Gxne6t1B8XuX4/QN272Lom6BNN8u/1A==
X-Received: by 2002:a05:6512:2216:b0:52c:e10b:cb33 with SMTP id 2adb3069b0e04-5367ff32872mr6028223e87.50.1726473194989;
        Mon, 16 Sep 2024 00:53:14 -0700 (PDT)
Message-ID: <bb557c1b-39e3-4498-b2f7-8cc316a29e56@suse.com>
Date: Mon, 16 Sep 2024 09:53:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] x86/time: introduce command line option to select
 wallclock
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240913075907.34460-1-roger.pau@citrix.com>
 <20240913075907.34460-2-roger.pau@citrix.com>
 <bc713147-3235-4151-8026-1c922e871755@suse.com>
 <ZufjSIH6yqKS5e_E@macbook.local>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZufjSIH6yqKS5e_E@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.09.2024 09:50, Roger Pau Monné wrote:
> On Fri, Sep 13, 2024 at 02:38:14PM +0200, Jan Beulich wrote:
>> On 13.09.2024 09:59, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/time.c
>>> +++ b/xen/arch/x86/time.c
>>> @@ -1552,6 +1552,37 @@ static const char *__init wallclock_type_to_string(void)
>>>      return "";
>>>  }
>>>  
>>> +static int __init cf_check parse_wallclock(const char *arg)
>>> +{
>>> +    wallclock_source = WALLCLOCK_UNSET;
>>
>> With this ...
>>
>>> +    if ( !arg )
>>> +        return -EINVAL;
>>> +
>>> +    if ( !strcmp("auto", arg) )
>>> +        ASSERT(wallclock_source == WALLCLOCK_UNSET);
>>
>> ... I'm not convinced this is (still) needed.
> 
> It reduces to an empty statement in release builds, and is IMO clearer
> code wise.  I could replace the assert with a comment, but IMO the
> assert conveys the same information in a more compact format and
> provides extra safety in case the code is changed and wallclock_source
> is no longer initialized to the expected value.

Well, so be it then.

Jan

