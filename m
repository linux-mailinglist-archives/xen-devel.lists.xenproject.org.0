Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D55DD2B1F7D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 17:03:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26751.55227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdbY4-00047K-Ur; Fri, 13 Nov 2020 16:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26751.55227; Fri, 13 Nov 2020 16:03:40 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdbY4-00046v-Rb; Fri, 13 Nov 2020 16:03:40 +0000
Received: by outflank-mailman (input) for mailman id 26751;
 Fri, 13 Nov 2020 16:03:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kdbY3-00046p-In
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 16:03:39 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54ab88de-d774-493a-b652-26989deddbf5;
 Fri, 13 Nov 2020 16:03:38 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u18so14517108lfd.9
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 08:03:38 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id a8sm722416ljq.77.2020.11.13.08.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 08:03:31 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kdbY3-00046p-In
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 16:03:39 +0000
X-Inumbo-ID: 54ab88de-d774-493a-b652-26989deddbf5
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 54ab88de-d774-493a-b652-26989deddbf5;
	Fri, 13 Nov 2020 16:03:38 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u18so14517108lfd.9
        for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 08:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=LmTZA96QKs8xdi4U0xx3GlMAMvZ/h0NGq07ZxAKmDo8=;
        b=T6e9gy2nkB09kkTsUx9HDOQxKkQBotjG2A0rz3Q03pVWFGpbboBBkpOF8Bzf1sJsQS
         7+n7/LTzIh+6ca77iH0YG5uNCSZL02Td9QnanoJmVGVzAGPJk4+kxaqkQbxqLg9OHthC
         l2SBbKY5ADBaeShbpe0iv0ymRn6CLILtxvS9iXNDjDOTFGiGnwnDPCt6wj0vZPN8FOdC
         bBp3HORP7xTiJDcQks+85sodPpvpuIIqfjxBucL+r9MlMNlrlq3gjYpTGaxL/DntF3GH
         T0Q2Bh9F48bmBgRtUNvVVEyzNyNtfzrlyQxzxLzwWx0+wRe6KMAaaNcyFQ9tbCEgFMlX
         Mdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=LmTZA96QKs8xdi4U0xx3GlMAMvZ/h0NGq07ZxAKmDo8=;
        b=a+SmcfxkMuRnHepYevqeIzNW58wxeQhhve3C/JX+5bU0yuo1QYyonB5mrey5PUMXCY
         KS2TKgZpsMQ7H3pFL8d7pInHPVSc6RXiYY/BJykTD9OC2fwKrfhI9LibMA2yJocwkWu2
         BXZ1FLigdRlON4RxzUwBwfrZvEupGh1yWfyjWQLjWrtFdXbjZJ8jlmSPzImfJ1wgnMj/
         RCIIZsJ5WJApBzR715H8BftW0YFrCvaKlHkeraKdO2a26EVXhPRfA+jt6TmyDbJIAgG1
         tS64FMDZTgHUP0JZhV0xu23D334cfFVw0uqyunr/IryrOIGodBDV6CPnokWn6IJWYW2l
         ZkdA==
X-Gm-Message-State: AOAM530RqJTzLMcCvdJY6+Bz1/BgG6hMwo4Zk5BgZDoXBSgMvhldCFr3
	RhpWKaHROQYYx3FbgU3r3wa36Sp0wAjJGA==
X-Google-Smtp-Source: ABdhPJzIuJK968n1V0CEJJ52LMvwuTr6Rbi6YzXDhyMB1i0EGuu1zw9RAbvRiCUTIa5drOEPkSBh2A==
X-Received: by 2002:a19:c191:: with SMTP id r139mr1265705lff.258.1605283412442;
        Fri, 13 Nov 2020 08:03:32 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id a8sm722416ljq.77.2020.11.13.08.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 08:03:31 -0800 (PST)
Subject: Re: [PATCH V2 20/23] xen/ioreq: Make x86's send_invalidate_req()
 common
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-21-git-send-email-olekstysh@gmail.com>
 <86ac139b-4dfd-fc45-ea77-3bd51acaea15@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <efa0907b-5033-b005-a825-41a51c9b17b0@gmail.com>
Date: Fri, 13 Nov 2020 18:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <86ac139b-4dfd-fc45-ea77-3bd51acaea15@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12.11.20 13:55, Jan Beulich wrote:

Hi Jan

> On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
>> --- a/xen/include/asm-x86/hvm/io.h
>> +++ b/xen/include/asm-x86/hvm/io.h
>> @@ -97,7 +97,6 @@ bool relocate_portio_handler(
>>       unsigned int size);
>>   
>>   void send_timeoffset_req(unsigned long timeoff);
>> -void send_invalidate_req(void);
>>   bool handle_mmio_with_translation(unsigned long gla, unsigned long gpfn,
>>                                     struct npfec);
>>   bool handle_pio(uint16_t port, unsigned int size, int dir);
>> diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
>> index 0679fef..aad682f 100644
>> --- a/xen/include/xen/ioreq.h
>> +++ b/xen/include/xen/ioreq.h
>> @@ -126,6 +126,7 @@ struct ioreq_server *select_ioreq_server(struct domain *d,
>>   int send_ioreq(struct ioreq_server *s, ioreq_t *proto_p,
>>                  bool buffered);
>>   unsigned int broadcast_ioreq(ioreq_t *p, bool buffered);
>> +void send_invalidate_ioreq(void);
> Again while renaming this function anyway could we see about giving
> it a suitable and consistent name? Maybe
> ioreq_request_mapcache_invalidate() or (to avoid the double "request")
> ioreq_signal_mapcache_invalidate()? Maybe even ioreq_server_...().
iirc send_invalidate_ioreq() was one of the proposed names during V1 review.
But to follow new scheme, I am fine with both the first and second.

-- 
Regards,

Oleksandr Tyshchenko


