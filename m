Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4656423EA0
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 15:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202939.357963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY6t4-0002xo-Ut; Wed, 06 Oct 2021 13:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202939.357963; Wed, 06 Oct 2021 13:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY6t4-0002vn-Ru; Wed, 06 Oct 2021 13:23:10 +0000
Received: by outflank-mailman (input) for mailman id 202939;
 Wed, 06 Oct 2021 13:23:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZr5=O2=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mY6t3-0002vf-EP
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 13:23:09 +0000
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0b5a1f4-6f40-4d72-b2ab-cc968618b6f6;
 Wed, 06 Oct 2021 13:23:08 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id f4so4519541edr.8
 for <xen-devel@lists.xenproject.org>; Wed, 06 Oct 2021 06:23:08 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u2sm9584662edb.6.2021.10.06.06.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 06:23:06 -0700 (PDT)
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
X-Inumbo-ID: c0b5a1f4-6f40-4d72-b2ab-cc968618b6f6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=eYG3bvYYg3J9DsJ4ZiMtpUVtoVVxXpmWgwP1iki8aGc=;
        b=pNCc7XPXjbBTZMr7UjipBVumnKzEq65r7Nae6hKT4ccDOd4ZTbUbRxYrBDEosG0RkO
         Zq6CBuaCB1U/sT0YRv7M+2ID3qmcZ5KsDLMyQhgDkitjZBk2My2RcX78vJ6W2wroMMFx
         V2HvEAFkLZ/zHJN/roBZRvmpU+kHPs9jOOYu/ltXcgIl/+nzmkeKTECb5H83zNr2Argv
         aa18hawD52VcVz070VAGvUZT5zLQtaZEPlVvWN0OpCy/HWQU8Pqf/QDdBtqp65ydCbyv
         7Bc0plJlc87PjSmDo1aTpV/mywgFo0kyaKjN6XLdNEtB42IVgiB87yX5W1OlD8Y7CdMO
         hyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=eYG3bvYYg3J9DsJ4ZiMtpUVtoVVxXpmWgwP1iki8aGc=;
        b=sQypcH9P4SW+iTh9yTrjaBtIMYWV1HHK9a2HThq6eok7FcE72cGpB95z1kEiiobdpw
         AAomn7dqDCh4Sewu7AHUKp3nCiGP4czkWhm1CLRDIGBmGDcgtl0afdM0IRxYwb2U0uuJ
         40tp9uGl2g9PsTmUwAzyYmj1vRveAsEweYGP6YcT93KcL02oXd7/71EpjnNmnd8gQJKn
         K41EZfzaOUpbNeOQvYoOj5JH9LrlKmFHz38dsNaHNQL1B6X1DKkZZzfg4i7XqvV79ncW
         7N+/sEe1UdBp2VX1yecBm9KdqH2pD1hl8dvY2HUJrufdld7+z4wuYr/ZvP9GqI4sAHTS
         l6dQ==
X-Gm-Message-State: AOAM5330M+rBFPpsCpqg5c4/08/Jx+u0W0/3YwmcPSfpycyC0ZmutRDO
	5t3QJpcBsEWPG7yuIbS21vw=
X-Google-Smtp-Source: ABdhPJx+T/eHY7FRQKAZNqm/2+tRCK414fst3p0ImjCgRgP/xjviWzsR8Aw4GsHfif+eTUHgUtHRPA==
X-Received: by 2002:a17:906:cc89:: with SMTP id oq9mr31725929ejb.70.1633526586803;
        Wed, 06 Oct 2021 06:23:06 -0700 (PDT)
Subject: [PING] Re: [PATCH] xen/arm: optee: Allocate anonymous domheap pages
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>, Julien Grall <jgrall@amazon.com>
References: <1630935741-17088-1-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2109231308200.17979@sstabellini-ThinkPad-T480s>
 <87bl4jrovq.fsf@epam.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <81f7699b-69c1-da52-a1a7-5000343bf872@gmail.com>
Date: Wed, 6 Oct 2021 16:23:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87bl4jrovq.fsf@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Hello all


Gentle reminder.


On 23.09.21 23:57, Volodymyr Babchuk wrote:
> Hi Stefano,
>
> Stefano Stabellini <sstabellini@kernel.org> writes:
>
>> On Mon, 6 Sep 2021, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> Allocate anonymous domheap pages as there is no strict need to
>>> account them to a particular domain.
>>>
>>> Since XSA-383 "xen/arm: Restrict the amount of memory that dom0less
>>> domU and dom0 can allocate" the dom0 cannot allocate memory outside
>>> of the pre-allocated region. This means if we try to allocate
>>> non-anonymous page to be accounted to dom0 we will get an
>>> over-allocation issue when assigning that page to the domain.
>>> The anonymous page, in turn, is not assigned to any domain.
>>>
>>> CC: Julien Grall <jgrall@amazon.com>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> Acked-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> Only one question, which is more architectural: given that these pages
>> are "unlimited", could the guest exploit the interface somehow to force
>> Xen to allocate an very high number of anonymous pages?
>>
>> E.g. could a domain call OPTEE_SMC_RPC_FUNC_ALLOC in a loop to force Xen
>> to exaust all memory pages?
> Generally, OP-TEE mediator tracks all resources allocated and imposes
> limits on them.
>
> OPTEE_SMC_RPC_FUNC_ALLOC case is a bit different, because it is issued
> not by domain, but by OP-TEE itself. As OP-TEE is more trusted piece of
> system we allow it to request as many buffers as it wants. Also, we know
> that OP-TEE asks only for one such buffer per every standard call. And
> number of simultaneous calls is limited by number of OP-TEE threads,
> which is quite low: typically only two.
>
-- 
Regards,

Oleksandr Tyshchenko


