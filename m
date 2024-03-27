Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FF188DC8D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 12:31:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698443.1090081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRUO-00011g-PY; Wed, 27 Mar 2024 11:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698443.1090081; Wed, 27 Mar 2024 11:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRUO-0000zT-MA; Wed, 27 Mar 2024 11:30:40 +0000
Received: by outflank-mailman (input) for mailman id 698443;
 Wed, 27 Mar 2024 11:30:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Df3K=LB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rpRUN-0000zN-9u
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 11:30:39 +0000
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [2607:f8b0:4864:20::b2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f1285d2-ec2d-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 12:30:38 +0100 (CET)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-dcbef31a9dbso4785286276.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 04:30:38 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r15-20020a056214212f00b0069698528727sm2175211qvc.90.2024.03.27.04.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 04:30:36 -0700 (PDT)
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
X-Inumbo-ID: 6f1285d2-ec2d-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711539037; x=1712143837; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JwkWMoE6/Cnci5NscGLNDrRSmDoeYlNTnB0n/TZ3vvk=;
        b=HUgIWyphPPAYjDe423yDnHrVWTOigNjY8gSdRRQCGFC/reZIiDswSA9XVFhSbquY1L
         7ltgdt+v+OHQIvCfmOFhFwDsPoA5MBcQNKSlq4GaOEuC6ROitBJODZATQm2gF4wm2SYC
         YgDAWPAA9BGmqT/kgQGGkjfZ5sUz7dwUf+iIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711539037; x=1712143837;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwkWMoE6/Cnci5NscGLNDrRSmDoeYlNTnB0n/TZ3vvk=;
        b=nyQoqSO5WCDRUQp2THvB2B32RjdzA+CkH/Oe75D74WaE4BE+93z74jn/ofvpV50upZ
         l9guRjuvLlSfdduRs8cQSDZixM8DD4xY39xCiviQi0gl2bAq+46G/cYFy6myin4U7rHN
         lTPf5H7SDQFwy1sR8xlHLjPF29OIT60RtNZk0HGwO42pAUwKgnBGLdsNjfcHjjSW+Upw
         v7VwFtZAddfqBAUjUJMxZVGjEWezXzdCRkypctKq1sl6ocnhcZt7WRCrpS5u3CsdZctA
         s+763JvMVRGn6dcZ70EZ5t3AJAmF1rwHtDdZjANlAEVhtcMkdrOaBZl6lBgPBfCyGJui
         kN2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtYyVvK/A/Oo8KYSObZS+o7mgCzcR/SmTY/sg+BTin3VMjySvGOEjkW0oy/W1qDnKhOaV3Vqs+Dbk8S6BpNqlYOTazXphB1GThnlsR0/0=
X-Gm-Message-State: AOJu0YxbF7r1/ZE9qUQHjqqQjngcRVn/eytDznVL2IQJgWqklY9UxJ7K
	Cdb2XrUmy876dwA9nWw0REtnQ90Z9kHHQPLpUUecGevcPTJKzeijJcJ90qMcbvw=
X-Google-Smtp-Source: AGHT+IHW1xP80WA4jBBNUeS1sdHJRAi/twm/YEYC2sGOn/0MA+8E2ktTda2jarA94MPUChe2JY843g==
X-Received: by 2002:a25:8009:0:b0:dcc:7b05:4cbb with SMTP id m9-20020a258009000000b00dcc7b054cbbmr674348ybk.31.1711539036992;
        Wed, 27 Mar 2024 04:30:36 -0700 (PDT)
Message-ID: <4df81c9b-fa7f-4585-a4a7-9f9189baa028@citrix.com>
Date: Wed, 27 Mar 2024 11:30:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen NIC driver have page_pool memory leaks
To: Jesper Dangaard Brouer <hawk@kernel.org>, paul@xen.org,
 Arthur Borsboom <arthurborsboom@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Netdev <netdev@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 kda@linux-powerpc.org, Xen Security <security@xen.org>
References: <CALUcmUncphE8v8j1Xme0BcX4JRhqd+gB0UUzS-U=3XXw_3iUiw@mail.gmail.com>
 <1cde0059-d319-4a4f-a68d-3b3ffeb3da20@kernel.org>
 <857282f5-5df6-4ed7-b17e-92aae0cf484a@xen.org>
 <ba4ac0f4-7a95-4fb2-b128-d7b248e4137a@kernel.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ba4ac0f4-7a95-4fb2-b128-d7b248e4137a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/03/2024 11:27 am, Jesper Dangaard Brouer wrote:
>
>
> On 25/03/2024 13.33, Paul Durrant wrote:
>> On 25/03/2024 12:21, Jesper Dangaard Brouer wrote:
>>> Hi Arthur,
>>>
>>> (Answer inlined below, which is custom on this mailing list)
>>>
>>> On 23/03/2024 14.23, Arthur Borsboom wrote:
>>>> Hi Jesper,
>>>>
>>>> After a recent kernel upgrade 6.7.6 > 6.8.1 all my Xen guests on Arch
>>>> Linux are dumping kernel traces.
>>>> It seems to be indirectly caused by the page pool memory leak
>>>> mechanism, which is probably a good thing.
>>>>
>>>> I have created a bug report, but there is no response.
>>>>
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=218618
>>>>
>>>> I am uncertain where and to whom I need to report this page leak.
>>>> Can you help me get this issue fixed?
>>>
>>> I'm the page_pool maintainer, but as you say yourself in comment 2 then
>>> since dba1b8a7ab68 ("mm/page_pool: catch page_pool memory leaks") this
>>> indicated there is a problem in the xen_netfront driver, which was
>>> previously not visible.
>>>
>>> Cc'ing the "XEN NETWORK BACKEND DRIVER" maintainers, as this is a
>>> driver
>>> bug.  What confuses me it that I cannot find any modules named
>>> "xen_netfront" in the upstream tree.
>>>
>>
>> You should have tried '-' rather than '_' :-)
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/xen-netfront.c
>>
>>
>
> Looking at this driver, I think it is missing a call to
> skb_mark_for_recycle().
>
> I'll will submit at patch for this, with details for stable maintainers.
>
> As I think it dates back to v5.9 via commit 6c5aa6fc4def ("xen
> networking: add basic XDP support for xen-netfront"). I think this
> commit is missing a call to page_pool_release_page()
> between v5.9 to v5.14, after which is should have used
> skb_mark_for_recycle().
>
> Since v6.6 the call page_pool_release_page() were removed (in
> 535b9c61bdef ("net: page_pool: hide page_pool_release_page()") and
> remaining callers converted (in commit 6bfef2ec0172 ("Merge branch
> 'net-page_pool-remove-page_pool_release_page'")).
>
> This leak became visible in v6.8 via commit dba1b8a7ab68 ("mm/page_pool:
> catch page_pool memory leaks").

Thankyou very much for your help here.  Please CC
security@xenproject.org too, because we'll want to issue an XSA (Xen
Security Advisory) when this fix is ready.

~Andrew

