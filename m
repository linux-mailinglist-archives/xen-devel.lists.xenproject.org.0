Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B473078B2
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 15:53:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77140.139549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58f9-00019d-OV; Thu, 28 Jan 2021 14:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77140.139549; Thu, 28 Jan 2021 14:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58f9-00019H-KY; Thu, 28 Jan 2021 14:52:47 +0000
Received: by outflank-mailman (input) for mailman id 77140;
 Thu, 28 Jan 2021 14:52:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tEu6=G7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l58f8-00019A-1f
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:52:46 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43b0957a-2830-4d80-8c38-fa9e66b14b54;
 Thu, 28 Jan 2021 14:52:45 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id u25so7944921lfc.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 06:52:44 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l18sm1672941lfg.294.2021.01.28.06.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 06:52:43 -0800 (PST)
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
X-Inumbo-ID: 43b0957a-2830-4d80-8c38-fa9e66b14b54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6gzcnSt22EC9a8JcoYjRJqQHMSp26aqfEM6zbr1BzYk=;
        b=CaRdoZ8Ut/UXQJe9/8qmPPIlvU4yiCJS1k/DwFui3clCc7PyU592q5ZSlAATBft3iX
         gwUn0FF9WtijU+hrghxdtDPXc7t17qen1ofhWz/EY9xeBmllZ1NnfwLa0vaszsOdd/Zq
         PSu/1gEsHvVotPOVR1ktiVWXA/5HpK1wXUlOiv9KzcWqTNS8SKtQwrLmqAX94ms+Zvqy
         /ILloiOaR2CGu2l8MdHt4wE9dky6je1xux2APu5mF6GO9NdpBoLHKZ0sQi9tAyYvvjPq
         AgKJd4e6vAS20qXy0fvUCXKBEvMN3f3nTz7U0wLkFfSlSTPqZwtBKf2TpBxyyYpoJPte
         P4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6gzcnSt22EC9a8JcoYjRJqQHMSp26aqfEM6zbr1BzYk=;
        b=TlE3/57wln77skNdsZX6ZLE5HUUCGnRLF4FcmDCxaMWAMUjZgMOuQsa3JDNCjCq16j
         IwL8etCTo3hZiC9C7twEn1YQMhzuuQXWbOyYZJJgYEbcijCNxAM7ERilaueqYDxF80Bs
         EpJmzF2oLEODw3yLPt4XP6zB9JYOZGrl5+t6hWhASUh9DrPnEi2Rpkzwua9cHGAEz4y4
         RVi+E6MH78bdrXr38sLMF8hai4Qnj5kYbOETMOTL+M71E8Rvj9cI1arh2HAfKXMsjVGz
         Kvv5DT6ZPGsuGcOOW26HoJk0Mbe4O9oU/naQt7R+YbSGQ03a9fjdy6iwK7/DY+IcssnH
         IrsQ==
X-Gm-Message-State: AOAM5330lg9nlzMyBZ3yIT9uV4BT33uC08WhUq4ZvBV+bVU5XSdKE1i2
	WkgBwE6yYFvqD3n9P0lAVwg=
X-Google-Smtp-Source: ABdhPJwxH02QNTf9oV+xbk+r7t+xFCcosC3F+a16K2pKJ4mmEOMRKMT9BbWb+BwCMyHCC9LGt+8svQ==
X-Received: by 2002:a19:589:: with SMTP id 131mr8236980lff.525.1611845563919;
        Thu, 28 Jan 2021 06:52:43 -0800 (PST)
Subject: Re: [PATCH V5 14/22] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-15-git-send-email-olekstysh@gmail.com>
 <67136393-8454-9d28-628a-bfb380fd8fc9@xen.org>
 <aa19b356-aa5b-2427-ab8d-2c1ade84ad1c@gmail.com>
 <a5fd81ac-3ed4-40e7-66d7-a8daf3be4987@xen.org>
 <078a6aa6-2f72-d816-9e14-8132648d3370@gmail.com>
 <d0ff4658-30c2-ffed-3a9d-3dadd6195a61@gmail.com>
 <fef8ba7e-d434-5c72-779c-53fd323558de@gmail.com>
 <4385cb3d-c91f-08d2-e9c3-6d3d7af155b0@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <bcee25d0-1022-3aed-e269-e2e097b0d899@gmail.com>
Date: Thu, 28 Jan 2021 16:52:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4385cb3d-c91f-08d2-e9c3-6d3d7af155b0@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 28.01.21 16:41, Julien Grall wrote:

Hi Julien

>
>
> On 28/01/2021 14:29, Oleksandr wrote:
>>
>> Hi Julien
>>
>>
>> On 28.01.21 15:39, Oleksandr wrote:
>>>
>>> On 28.01.21 13:33, Oleksandr wrote:
>>>
>>> Hi Julien
>>>
>>>>
>>>> On 28.01.21 11:40, Julien Grall wrote:
>>>>
>>>> Hi Julien
>>>>
>>>>> Hi Oleksandr,
>>>>>
>>>>> On 27/01/2021 19:20, Oleksandr wrote:
>>>>>  >  >>> So I think we may be able to drop the include from 
>>>>> asm/hvm/domain.h
>>>>>> (this would avoid to include it everywhere...).
>>>>>>
>>>>>> I have tried that, but other CUs use definitions from 
>>>>>> public/hvm/dm_op.h, for example:
>>>>>>
>>>>>> p2m-pt.c: In function 'p2m_type_to_flags':
>>>>>> p2m-pt.c:87:33: error: 'XEN_DMOP_IOREQ_MEM_ACCESS_WRITE' 
>>>>>> undeclared (first use in this function)
>>>>>>           if ( p2m->ioreq.flags & XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
>>>>>>                                   ^
>>>>>> So, I would prefer to leave it as is, please let me know if you 
>>>>>> think otherwise.
>>>>>
>>>>> AFAICT, there is only 2 places (p2m-pt.c and p2m-ept.c) that 
>>>>> requires <public/hvm/dm_op.h> but doesn't directly include it. 
>>>>> Folding the diff below in patch #4 should do the job:
>>>>
>>>> ok, will do
>>>
>>>
>>> Just to clarify, you mentioned about patch #4, but shouldn't we make 
>>> these changes in patch #9 which actually tries to sort dm related 
>>> stuff?
>>
>> or a least in patch #8 which moves the stuff from 
>> asm-x86/hvm/domain.h to xen/ioreq.h (including the user of 
>> XEN_DMOP_IO_RANGE_PCI),
>
> I looked at the header asm-x86/hvm/domain.h after applying patch #4, 
> there is nothing requiring DMOP from there.
>
> I tried to build it with this series applied up to patch #4 + my diff. 
> It does build without any issue.

Hmm, interesting. I might miss something, but I got an build issue if I 
split these changes with patch #4 and build the series up to this patch:

In file included from 
/media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/include/asm/domain.h:7:0,
                  from 
/media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/include/xen/domain.h:8,
                  from 
/media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/include/xen/sched.h:11,
                  from 
/media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/include/asm/paging.h:29,
                  from 
/media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/include/asm/guest_access.h:11,
                  from 
/media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/include/xen/guest_access.h:10,
                  from compat.c:1:
/media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/include/asm/hvm/domain.h:44:28: 
error: 'XEN_DMOP_IO_RANGE_PCI' undeclared here (not in a function)
  #define NR_IO_RANGE_TYPES (XEN_DMOP_IO_RANGE_PCI + 1)
                             ^
/media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/include/asm/hvm/domain.h:60:35: 
note: in expansion of macro 'NR_IO_RANGE_TYPES'
      struct rangeset        *range[NR_IO_RANGE_TYPES];
                                    ^
/media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/Rules.mk:189: 
recipe for target 'compat.o' failed
make[3]: *** [compat.o] Error 1


>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


