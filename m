Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E61425D4C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 22:29:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203983.359169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYa0q-0008KL-Oq; Thu, 07 Oct 2021 20:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203983.359169; Thu, 07 Oct 2021 20:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYa0q-0008Hr-Li; Thu, 07 Oct 2021 20:29:08 +0000
Received: by outflank-mailman (input) for mailman id 203983;
 Thu, 07 Oct 2021 20:29:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4W4d=O3=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mYa0o-0008Hl-NV
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 20:29:06 +0000
Received: from mail-ed1-x530.google.com (unknown [2a00:1450:4864:20::530])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b0ee69c-3f37-4269-8764-ff5088f10fca;
 Thu, 07 Oct 2021 20:29:05 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id d3so377548edp.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 13:29:05 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id o3sm152710ejg.52.2021.10.07.13.29.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 13:29:04 -0700 (PDT)
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
X-Inumbo-ID: 3b0ee69c-3f37-4269-8764-ff5088f10fca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=VPtIgk2ssf+ZyoZcz++Pw78Q15/HMzgN9246Wli/t84=;
        b=YRrxeZW624MuXI+0UCaz8/VFf1nb/dR2avls1WwRrVUPbqyonZVo+bYsvX582feqDr
         1mMYyXNnSVrxa0ii9qIu0jMNzuPRI79LEYdZZZi7+E+Pi+QVDHMw/6nFjAvXp6lVWk7c
         cGNtvzRoHaRaiDWhm4PW/+/WKXkGg1QvrIkwL6NMrHMgA0K9XpO3ESwADhytMu+/v/E5
         3DF6m5pSWK6TOQ8gRd+UJUZjFVNER38HTsnqdkd/uPUIPKSFszku3rxrMzyQLG2+jHgs
         4fQeLOenmWsjsuseurC9SSFI2EJCHQ3PysL3BWlw1Cq+2sAMU/riFGX9iXpBH71lB8Q+
         h8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=VPtIgk2ssf+ZyoZcz++Pw78Q15/HMzgN9246Wli/t84=;
        b=iqQNZaCtK806wZ4e6qjOzYZq4QFrTlFwfi2Kv6Q46dOh7H3Ye6fGbXKyDUVuIGDP0f
         t9IGM4Of6r9qw+H8QdtZeOv6SqSjTkQICvNLGwUlbA6tCkgkZwZmlEv90W26EWg72D89
         QDP1blyxbYdjJn9SgUlRbWB91M56xvvogRCoZ0HI4YQ65GGpv2wN9ucf8mEd+jPqRHy/
         VJGRH0dLx2jvfDoY9i/cwfsCRunIDEGBNoW2P/KuATJephU7wz8QTt+HmfW2Im30Mvaz
         WpIB1BVsYH8Wis+z8Git43oW3mUZJ3GaKRGQeQTwEApuICBImwzItrWd1Z8pOVkD68ec
         lrZQ==
X-Gm-Message-State: AOAM532i+5+sglVBNFb7IR37YIvnDm4ddlKcOkcU7fj0dlsV2CY7F6PY
	rDmUJRM67qL+LGIPgSg/ZaE=
X-Google-Smtp-Source: ABdhPJymTylFPY1AoUZvRK0ug5RXMqwRN1QgAZ40EsU5jjSIs7/6cAW0xEuoJLYGPHholpqUl0zSXQ==
X-Received: by 2002:a17:906:bc43:: with SMTP id s3mr8291119ejv.46.1633638544869;
        Thu, 07 Oct 2021 13:29:04 -0700 (PDT)
Subject: Re: [PATCH V5 3/3] xen/arm: Updates for extended regions support
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
 <1633519346-3686-4-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2110061843360.3209@sstabellini-ThinkPad-T480s>
 <a5a81348-4b18-6be6-ba85-4c31172459dc@gmail.com>
 <alpine.DEB.2.21.2110071300380.414@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ff6800b3-74f0-3203-6465-1547644924e2@gmail.com>
Date: Thu, 7 Oct 2021 23:29:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110071300380.414@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.10.21 23:06, Stefano Stabellini wrote:

Hi Stefano

> On Thu, 7 Oct 2021, Oleksandr wrote:
>> On 07.10.21 04:50, Stefano Stabellini wrote:
>>
>> Hi Stefano
>>
>>> On Wed, 6 Oct 2021, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> This is a follow-up of
>>>> "b6fe410 xen/arm: Add handling of extended regions for Dom0"
>>>>
>>>> Add various in-code comments, update Xen hypervisor device tree
>>>> bindings text, change the log level for some prints and clarify
>>>> format specifier, reuse dt_for_each_range() to avoid open-coding
>>>> in find_memory_holes().
>>>>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> Thanks for the patch, it looks like you addressed all Julien's comments
>>> well.
>> I believe so)
>
> [...]
>
>>>> @@ -1193,8 +1215,8 @@ static int __init make_hypervisor_node(struct domain
>>>> *d,
>>>>            u64 start = ext_regions->bank[i].start;
>>>>            u64 size = ext_regions->bank[i].size;
>>>>    -        dt_dprintk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
>>>> -                   i, start, start + size);
>>>> +        printk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
>>>> +               i, start, start + size);
>>> Also should be PRIpaddr
>> I thought I needed to change specifier only for variables of type "paddr_t",
>> but here "u64".
> Sorry, you are right.
>
> I added my reviewed-by and made the small typo changes on commit.

Thanks! In case if you haven't committed the patch yet, let's please 
wait for Julien (who asked for this follow-up) to review it.

In any case, I will be able to do another follow-up if needed.


-- 
Regards,

Oleksandr Tyshchenko


