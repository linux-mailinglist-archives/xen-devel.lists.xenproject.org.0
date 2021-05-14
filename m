Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F2538027C
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 05:26:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127160.238917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhORZ-0002wj-0n; Fri, 14 May 2021 03:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127160.238917; Fri, 14 May 2021 03:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhORY-0002tv-Td; Fri, 14 May 2021 03:24:52 +0000
Received: by outflank-mailman (input) for mailman id 127160;
 Fri, 14 May 2021 03:24:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhORX-0002tn-Ad
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 03:24:51 +0000
Received: from mail-il1-x131.google.com (unknown [2607:f8b0:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d585e6ba-f43b-487b-b9e5-c51e5fa812d1;
 Fri, 14 May 2021 03:24:50 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id j12so24759098ils.4
 for <xen-devel@lists.xenproject.org>; Thu, 13 May 2021 20:24:50 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id d2sm2412666ile.18.2021.05.13.20.24.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 20:24:49 -0700 (PDT)
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
X-Inumbo-ID: d585e6ba-f43b-487b-b9e5-c51e5fa812d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rjEVrWO3moq8rpuZa0b0GYhpCLgyhm8VlqMw+Ea4qUc=;
        b=vgTI8EkZ7AKRgt7SnHw1F4ELlQWM/xswnMWiCyu5J1CHZNdhbNAQPUNjIVx42VHXpJ
         FrUrV0LAcDEL3QfZaUxezVPEU+2y/eTLThxTcICb4JZFBSvw6Jg+pNFybLi57CFRoiwf
         1+XGBR0qqfNz025ZE5TwpTPPAglGbRgZshdoTkOyM6ilMYhoFCbINBoRboDZaiCDAyV/
         pmuFXGYUt50VhlOauUXKoM7179ZJ8LVHXPMnWAILSvsqPXdIEg2XbEl40X/nWLsPGYRY
         SFZXUjih3/WWNi0mASJUZOjYN2J8JJxwhP3lWXqlksynNng74sX1OylVg6Obdwfu6ZEi
         5UYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rjEVrWO3moq8rpuZa0b0GYhpCLgyhm8VlqMw+Ea4qUc=;
        b=hAOm+jlYCMLWVsV2O4wuz51DIB8yuPD5cfG27vuRndZWdFJPdA9apgQEjtWE9lpZYp
         CHC7bcHK4CI1okJPeVPJmpw9Vlb48lC731RQpxRl28Iq+y1coQS7MvK2oO6uVwxNbhRJ
         t2nmclqFYN1KvqYDWhK0NkHH3HN6F3klIL85VHZeKQ0c5c19dAwGvTl2wkZI2v7e7WHI
         SR1D/TcOl/1e0+FtOQ71pIXv0gsILwtJEcNCKWs3av4dbOx3v9tZKSUbL180UnnkIyrL
         ubl8UuzpFw79iZbjaLXg4vWtxOAJa6dUpK0TC/MTWk6HzxiE2HgbpIbIU89XKTsg8+BT
         7CMA==
X-Gm-Message-State: AOAM530NvaNaC0tewZXmqsiw1Izkc4XQr+7FchsQwsweON8Ng7C1kR7R
	+oYinTB1d4do7Hn+Q04Iovx6pHMxMtZxsg==
X-Google-Smtp-Source: ABdhPJxy11y1+SFBML7QznyUV8e/TjAncibvLacUI8v4Jbu5NWkYW0SX5D0aPeABVndeJXmhg3rfow==
X-Received: by 2002:a92:6804:: with SMTP id d4mr38570373ilc.5.1620962689992;
        Thu, 13 May 2021 20:24:49 -0700 (PDT)
Subject: Re: [PATCH for-next 5/6] xen: Add files needed for minimal riscv
 build
To: Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1614265718.git.connojdavis@gmail.com>
 <7652ce3486c026a3a9f7d850170ea81ba8a18bdb.1614265718.git.connojdavis@gmail.com>
 <84f490e8-7035-565d-4b20-6e46ccc800f2@suse.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <58454a32-12d4-3bf3-f962-887be7bda381@gmail.com>
Date: Thu, 13 May 2021 21:25:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <84f490e8-7035-565d-4b20-6e46ccc800f2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/12/21 10:09 AM, Jan Beulich wrote:
> On 25.02.2021 16:24, Connor Davis wrote:
>> --- a/xen/include/public/hvm/save.h
>> +++ b/xen/include/public/hvm/save.h
>> @@ -106,6 +106,8 @@ DECLARE_HVM_SAVE_TYPE(END, 0, struct hvm_save_end);
>>   #include "../arch-x86/hvm/save.h"
>>   #elif defined(__arm__) || defined(__aarch64__)
>>   #include "../arch-arm/hvm/save.h"
>> +#elif defined(__riscv)
>> +#include "../arch-riscv/hvm/save.h"
> Does the compiler not also provide __riscv__? If it does, using it
> here (and elsewhere) would fit better with the existing logic.
>
No only __riscv is defined


Thanks,

Connor


