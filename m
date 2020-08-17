Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 179CA24687E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 16:37:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7gFV-0007Xp-QN; Mon, 17 Aug 2020 14:36:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EDHT=B3=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k7gFU-0007Xk-8L
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 14:36:32 +0000
X-Inumbo-ID: 9df3d565-7e41-4cfa-b6df-0d37b0134149
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9df3d565-7e41-4cfa-b6df-0d37b0134149;
 Mon, 17 Aug 2020 14:36:31 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id s9so8495126lfs.4
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2020 07:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=3GRDJVGVpDXm6do0rjuBrYqkIhLXQugX1AhjFdE7Z1Y=;
 b=gQ3oK9mPTW9JJme1hZx7ZxA02Uds1q0cQPmC+lr/iIWXX0hf3gfFumOWth1KAdIN0I
 l/l13xb8mlTUgllAsC67CLhijjhOVEzooOFGt0iw9TZJP6bMnHSVk0PApMGX1G2tFSEm
 gJhMGDb/l+jhojbpktgUKoMVMJMrsTf7XB672B+EJc40IqTzjZuLG/yLBdkHeKdPusS4
 VsKlgL12PgcxNF5osE00CaUXdmHCwYfAz02KlZbhFe30P/f2VDUIHJSNoKYtjkUEfqxK
 dFzW0hzf57zcbGQyGgZcI/lq9CHHgt3sjn+sMigev3xyN33Dc2bALcKlPO5XOFzuFHy8
 kXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3GRDJVGVpDXm6do0rjuBrYqkIhLXQugX1AhjFdE7Z1Y=;
 b=Hs0cu7D4Y+i2aYtc6WUUxUh+XA7ALRpXXYWQnFr4B709/6FmeOXXrF8EmqnFhtmYZI
 sR3o+kDAkElCBJiU+HnHoZifW9UAjpIR/UGBsuplLzdLEpw/hkOPVx+s1hxhkbudECcb
 ZsJ/S9cg7zU1g5J8LnX6LZ1SEl8lR88QiW6l1q1av1NuAHeqS3LbwD9m2lFzs0buMHKH
 J6Z5i369b8oKw4qVeKCOB+YAMKslr2k5q/E0HicHRvzWMCLoFFxS+gTCzEvSp/IHUwrb
 0uD36cdidmchKhgRJZtcbtbdDQ56G46zmqf/tnKEgGXYLTN5HXrJiSMVXrIb5tcSP7Z5
 xAQA==
X-Gm-Message-State: AOAM532nmEP4EjFDlq/UgX0UHTnnb+3ZR4eR6vi/qJdc4am5RrD0bZ1e
 LWPC1yxHN628Lmqa/ETuvDI=
X-Google-Smtp-Source: ABdhPJyEnL4nMhh9aPdd882zIyhGDOeJZc/sH1jwY0TqL5vWDwckXKozX9X3wCbn05mhgnHD9bnaEA==
X-Received: by 2002:a19:8c4b:: with SMTP id i11mr7528519lfj.32.1597674989514; 
 Mon, 17 Aug 2020 07:36:29 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id d13sm5555396lfl.89.2020.08.17.07.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 07:36:28 -0700 (PDT)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>
Cc: paul@xen.org, xen-devel@lists.xenproject.org,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Julien Grall' <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <001101d66a33$bba44670$32ecd350$@xen.org>
 <6c4f7698-a015-91c7-83ec-203f63d48900@xen.org>
 <70241cb7-1b04-d3be-90d5-b075ee13ca8c@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <0003868f-c96c-8f31-d0ba-97cf9fd368ed@gmail.com>
Date: Mon, 17 Aug 2020 17:36:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <70241cb7-1b04-d3be-90d5-b075ee13ca8c@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 15.08.20 20:56, Julien Grall wrote:

Hi Julien.

> Hi,
>
> On 04/08/2020 15:01, Julien Grall wrote:
>> On 04/08/2020 08:49, Paul Durrant wrote:
>>>> diff --git a/tools/libxc/xc_dom_arm.c b/tools/libxc/xc_dom_arm.c
>>>> index 931404c..b5fc066 100644
>>>> --- a/tools/libxc/xc_dom_arm.c
>>>> +++ b/tools/libxc/xc_dom_arm.c
>>>> @@ -26,11 +26,19 @@
>>>>   #include "xg_private.h"
>>>>   #include "xc_dom.h"
>>>>
>>>> -#define NR_MAGIC_PAGES 4
>>>> +
>>>>   #define CONSOLE_PFN_OFFSET 0
>>>>   #define XENSTORE_PFN_OFFSET 1
>>>>   #define MEMACCESS_PFN_OFFSET 2
>>>>   #define VUART_PFN_OFFSET 3
>>>> +#define IOREQ_SERVER_PFN_OFFSET 4
>>>> +
>>>> +#define NR_IOREQ_SERVER_PAGES 8
>>>> +#define NR_MAGIC_PAGES (4 + NR_IOREQ_SERVER_PAGES)
>>>> +
>>>> +#define GUEST_MAGIC_BASE_PFN (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT)
>>>> +
>>>> +#define special_pfn(x)  (GUEST_MAGIC_BASE_PFN + (x))
>>>
>>> Why introduce 'magic pages' for Arm? It's quite a horrible hack that 
>>> we have begun to do away with by adding resource mapping.
>>
>> This would require us to mandate at least Linux 4.17 in a domain that 
>> will run an IOREQ server. If we don't mandate this, the minimum 
>> version would be 4.10 where DM OP was introduced.
>>
>> Because of XSA-300, we could technically not safely run an IOREQ 
>> server with existing Linux. So it is probably OK to enforce the use 
>> of the acquire interface.
> One more thing. We are using atomic operations on the IOREQ pages. As 
> our implementation is based on LL/SC instructions so far, we have 
> mitigation in place to prevent a domain DoS Xen. However, this relies 
> on the page to be mapped in a single domain at the time.
>
> AFAICT, with the legacy interface, the pages will be mapped in both 
> the target and the emulator. So this would defeat the mitigation we 
> have in place.
>
> Because the legacy interface is relying on foreign mapping, the page 
> has to be mapped in the target P2M. It might be possible to restrict 
> the access for the target by setting the p2m bits r, w to 0. This 
> would still allow the foreign mapping to work as we only check the p2m 
> type during mapping.
>
> Anyway, I think we agreed that we want to avoid to introduce the 
> legacy interface. But I wanted to answer just for completeness and 
> keep a record of potential pitfalls with the legacy interface on Arm.
ok, the HVMOP plumbing on Arm will be dropped for non-RFC series. It 
seems that xenforeignmemory_map_resource() does needed things. Of 
course, the corresponding Linux patch to support 
IOCTL_PRIVCMD_MMAP_RESOURCE was cherry-picked for that purpose (I am 
currently using v4.14).

Thank you.


-- 
Regards,

Oleksandr Tyshchenko


