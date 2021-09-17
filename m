Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B09341003E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 22:13:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189696.339548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRKEQ-0006BU-Sy; Fri, 17 Sep 2021 20:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189696.339548; Fri, 17 Sep 2021 20:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRKEQ-00069V-Po; Fri, 17 Sep 2021 20:13:10 +0000
Received: by outflank-mailman (input) for mailman id 189696;
 Fri, 17 Sep 2021 20:13:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmcU=OH=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mRKEO-00069P-Vx
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 20:13:09 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0597f28-8f6b-4610-8999-3754b3e3c759;
 Fri, 17 Sep 2021 20:13:08 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id g1so38073941lfj.12
 for <xen-devel@lists.xenproject.org>; Fri, 17 Sep 2021 13:13:08 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id a8sm601181lfr.256.2021.09.17.13.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 13:13:06 -0700 (PDT)
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
X-Inumbo-ID: d0597f28-8f6b-4610-8999-3754b3e3c759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=019AdyqpxG1TlQueuJaYYUhEsPxQ+fUHO79eW3US8lw=;
        b=Cgy7/q8/wG1mnhu6ObUXArrEf2g2bgxD9mk/YANBhnVCnfQjKREmyAU0PwSWwx3ApO
         KWwYUD4296/oOc7eCOflRMzou9l4bfBeJ7usgeLBkyP2Hz67TAF50F0C5FhKsVton5/w
         hF2LVI2cj3apQTtvlLUJ+qb2zVKck3ap/+d0xuMxJ+ENyhk+6QT8m0Vz7pqq4UKxjLBP
         iMH+nUi4P3GWMRKvMjgpFjcuxMi6OmRQfTbTXA+oxgWB6DeS///3DtHvBEMNjUI5L+/Z
         9mA65irQAErxtptt4nNf5oSGnYV4A7vd24Q3qaEva53s/i4m+8Kfym1umoDv9b9XJ9WJ
         0Bsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=019AdyqpxG1TlQueuJaYYUhEsPxQ+fUHO79eW3US8lw=;
        b=qC3j2Z2RmXyIGcRrExAxt25Vy8vbBe4vU6E24shBoVnumoh+R71DO37xYwaAzLk7pn
         AWkgf4GhyV+55LTcjS4uxXESR1Kgcsra64dZYvsjpiLKHtPBIgMhQ2bvp1Dt2hce+b6f
         TZl7p2vUOgMTwWlaDFl1yqQbggRzl//swo52XiX4s41C3dFsI3mVtk0ly84Xk7KsGUl6
         YH0MR59wQs1oII3TxHrvgQIdT/DWdqCkkv5ZNOhAjLXj4xh7Rf+NIPAtWqXwZEE4Tkjk
         zpGGe8TWvfF0RAFW6vTVa1NV6y9Ed3pHLsmj0Y7UUYL/SigeOOUMTqUpfd4inIFWjqky
         W+wg==
X-Gm-Message-State: AOAM530F/ryj9CKGbiAaoIKAbxqVG+xIp8oIS3W7OlHT44W+G6v10W+n
	/LXis78SHMJudsPLM8BJGidmQsWfpYE=
X-Google-Smtp-Source: ABdhPJzpFfah1LH0Y642rq6UCLNivCQkBImFjhBnlsK/CNcAkjyp7Z/bm/hWKF3iJodpVM/YBHhXaA==
X-Received: by 2002:a2e:4e01:: with SMTP id c1mr10691530ljb.460.1631909587018;
        Fri, 17 Sep 2021 13:13:07 -0700 (PDT)
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for Dom0
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
 <1631297924-8658-3-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2109131726420.10523@sstabellini-ThinkPad-T480s>
 <c3fd1198-15bf-6c05-fe5d-ea29255f1dfe@gmail.com>
 <e832477f-4ed7-4f12-90aa-ebc1843cdc36@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <01c8b151-b035-16de-a26a-0fa19efb9c04@gmail.com>
Date: Fri, 17 Sep 2021 23:13:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e832477f-4ed7-4f12-90aa-ebc1843cdc36@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 17.09.21 18:52, Julien Grall wrote:

Hi Julien

>
>
> On 16/09/2021 00:10, Oleksandr wrote:
>>>> + * The extended regions will be prevalidated by the memory hotplug 
>>>> path
>>>> + * in Linux which requires for any added address range to be 
>>>> within maximum
>>>> + * possible addressable physical memory range for which the linear 
>>>> mapping
>>>> + * could be created.
>>>> + * For 48-bit VA space size the maximum addressable range are:
>>>> + * 0x40000000 - 0x80003fffffff
>>> Please don't make Linux-specific comments in Xen code for interfaces
>>> that are supposed to be OS-agnostic.
>>
>> You are right. I just wanted to describe where these magic numbers 
>> come from.
>> Someone might question why, for example, "0 ... max_gpaddr" can't be 
>> used. I will move
>> that Linux-specific comments to the commit message to keep some 
>> justification of these numbers.
>
> Please keep some rationale in the code. This is a lot easier to 
> understand the code without having to play the git blame game.

ok, to be honest I failed to find how to express OS-depended constraints 
in a OS-agnostic way.


>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


