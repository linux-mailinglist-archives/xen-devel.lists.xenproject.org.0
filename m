Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B369D2D2E53
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 16:34:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47565.84177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmezs-0001sV-Lm; Tue, 08 Dec 2020 15:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47565.84177; Tue, 08 Dec 2020 15:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmezs-0001s6-IX; Tue, 08 Dec 2020 15:33:48 +0000
Received: by outflank-mailman (input) for mailman id 47565;
 Tue, 08 Dec 2020 15:33:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KXXm=FM=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmezq-0001s1-Ho
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 15:33:46 +0000
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e67e432-3244-4b8c-99b1-933c354867b8;
 Tue, 08 Dec 2020 15:33:45 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id b4so16430394lfo.6
 for <xen-devel@lists.xenproject.org>; Tue, 08 Dec 2020 07:33:45 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t17sm1058782lfl.125.2020.12.08.07.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 07:33:43 -0800 (PST)
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
X-Inumbo-ID: 2e67e432-3244-4b8c-99b1-933c354867b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=EJ6EQJyET7wZB+Ih40QfYrwivg33/KKPS/tK5AgC9AY=;
        b=QdMYjnC12NvPHdzhf3Vn+UeuLWWpb9TKYdb9pUmxEipIbppFgtjLYV13HJ8yrjMqTs
         qVfmCqi2MY39jc2mZsTHPidU69Q27Frxrb51UGTwxZ7bYkttpTlgJoIw7fxpHRJErnWV
         7yqUCrRDppOOVQacePSV1Joqz6ZKDFerJLb02GzsXJ3CkRtUartLP1djLk9dBkZ4LGDF
         Ts2F7w/gj7a5vW+Sb7eJOoPaG35qnkize+LfzGjniZr8mGyvKHd4N58cd8URHIJqQ5UZ
         CIiXIFbwxmbLbKGlB66BG5rxXuCZe9g9MCQ+NzLGnCLOWGrBC4p9N4bNALYY7StuFC/F
         WfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=EJ6EQJyET7wZB+Ih40QfYrwivg33/KKPS/tK5AgC9AY=;
        b=PTk4z36ViY5/Q/waKoF81R+Z2/INCSAK2xz9vbQY9T/38Ex/V0uhDWvROj9nj214Lz
         IiWDXoZYplGXLtO8y4/CP0/HYAlsAWR+OZ6fPKWqt9gNl7R/e31ATs6GVE4Qeks9T4y5
         OOgN4t/eu+YUrzx3BfNHYNH/XInCxnXzLqJsDCvMT/TPGxfVBEYBBex52zz6N8IL5wb1
         YU9yGkkUndcemoMpOSrs+3NI5WCnlh1FKvvMKuLpbkG7UlAPEAQapcfbEsmlxBOjlbVd
         X9zFHIdk5CnYyQZx6LjYtzSGDY/YrEqUrsOEaX7pZzDf5TlWMVMAJbkqgzk57RSDrBMx
         62jQ==
X-Gm-Message-State: AOAM530ydrzQZj2W+JOw+uovDOxZbm3y8Rn/yZdFLJGiO1MahdzzQGjM
	hZPy7JXHizLqPgrnh3teYadetIb08pY3VQ==
X-Google-Smtp-Source: ABdhPJyh2p4+/mDRSxTmMGrDT7yESBgSDcwRz6o/2LuunaqqSetOVZMVtf06a6jAMF1PbwkDD9/hOg==
X-Received: by 2002:ac2:4c96:: with SMTP id d22mr9845887lfl.288.1607441623907;
        Tue, 08 Dec 2020 07:33:43 -0800 (PST)
Subject: Re: [PATCH V3 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-18-git-send-email-olekstysh@gmail.com>
 <3bb4c3b5-a46a-ba31-292f-5c6ba49fa9be@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6026b7f3-ae6e-f98f-be65-27d7f729a37f@gmail.com>
Date: Tue, 8 Dec 2020 17:33:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3bb4c3b5-a46a-ba31-292f-5c6ba49fa9be@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 08.12.20 17:11, Jan Beulich wrote:

Hi Jan

> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>> --- a/xen/include/xen/ioreq.h
>> +++ b/xen/include/xen/ioreq.h
>> @@ -55,6 +55,20 @@ struct ioreq_server {
>>       uint8_t                bufioreq_handling;
>>   };
>>   
>> +/*
>> + * This should only be used when d == current->domain and it's not paused,
> Is the "not paused" part really relevant here? Besides it being rare
> that the current domain would be paused (if so, it's in the process
> of having all its vCPU-s scheduled out), does this matter at all?do any extra actionsdo any extra actions

No, it isn't relevant, I will drop it.


>
> Apart from this the patch looks okay to me, but I'm not sure it
> addresses Paul's concerns. Iirc he had suggested to switch back to
> a list if doing a swipe over the entire array is too expensive in
> this specific case.
We would like to avoid to do any extra actions in 
leave_hypervisor_to_guest() if possible.
But not only there, the logic whether we check/set mapcache_invalidation 
variable could be avoided if a domain doesn't use IOREQ server...


-- 
Regards,

Oleksandr Tyshchenko


