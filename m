Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F93240BEE
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 19:28:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5Bav-00078t-Oh; Mon, 10 Aug 2020 17:28:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qWL+=BU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k5Bau-00078o-7t
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 17:28:20 +0000
X-Inumbo-ID: 4da25352-ed87-4dca-ad4d-6e68e0de9c8f
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4da25352-ed87-4dca-ad4d-6e68e0de9c8f;
 Mon, 10 Aug 2020 17:28:18 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id j22so5163746lfm.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2020 10:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=OfDLlFqJUG7ZuiZEqW5c6ioQLjjFvuKwk1+W93IdMac=;
 b=YW+wIbIjx+YCudCZHMtvmQ9lHyviX5URgIGkTEJUapmLvWG2eJnjy37upFo6trobcI
 fO0I98LxE3O5ls8JqAy6dY+gV6WFCvCWBHgJywBQQqP105T6nklDjQli5kMgO69sjvde
 OtHQbp1kbKg5WamTVnzyvmG/R45LL3tePGJszCt4x/llOKO9pckeuB5wnQUJl+4OzwyT
 aICm8rwARBkB/4tClqneJePu9+BTE985Sm/6B4UVKJYLCUtM94sx/upyZKUFMQGO5VQL
 ifn59XINmeAvcrfv30HuuIFCU8Up6gSCg5bLL3xRoDvgriSUcWwbludfMuARbzdpWWqj
 rpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=OfDLlFqJUG7ZuiZEqW5c6ioQLjjFvuKwk1+W93IdMac=;
 b=umQW0bpX77i9HBpUCFVXWR2UHRmovZBaMqngLIkS+XrlRiyX6LbodiOQ7MZx7WV9UA
 FbqFDHEy/vj/ldnDc6dsEBoiw3HDBDYE3Gtk8C3BZe1h+cDJ/LVHZEV4US7lOAhDTfAz
 tYP9oa1ZCfVwiSBs79C/diPsX4K6p4zroWvm6fQb3DffFENfW9gY2m2a7t9YLOQxCTRF
 3nQ14rt14KTDGr+pVdt069raKJzEWhttqsi0a+gvWPbJoqheyAJjvC+N6GtP35QF9R+H
 WDfCZQoHJqdKSaVMc9eUWYSBURiki/SbmKl1hgZ82zXaw5NyK3Qh/wz1YfYpuoYp5pbE
 43bw==
X-Gm-Message-State: AOAM533NAl6E5fqMNo4Rxbo7S10t1xOt2x+RM92BxG0IzGdfcPOtfbyB
 A9sPpF2vjGJ35WB82j3gqC8=
X-Google-Smtp-Source: ABdhPJw6e3CoQUn2MTFVZrYtb1GKVSjwn6vXSfsRV+Pjqg3xb9dCFc3Nnpdtw+wXbWm/p65JY8wByw==
X-Received: by 2002:a19:ef0d:: with SMTP id n13mr1087860lfh.102.1597080496771; 
 Mon, 10 Aug 2020 10:28:16 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id y9sm9448046ljm.89.2020.08.10.10.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2020 10:28:16 -0700 (PDT)
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <6bfc3920-8f29-188c-cff4-2b99dabe166f@xen.org>
 <b0103c16-0cec-1734-93a6-3a4169448179@gmail.com>
 <c5cb0196-f761-52f5-ef32-d0a560bd559c@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <5b79b86a-abb8-3b37-baa1-1bcc43034eab@gmail.com>
Date: Mon, 10 Aug 2020 20:28:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c5cb0196-f761-52f5-ef32-d0a560bd559c@xen.org>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 10.08.20 19:29, Julien Grall wrote:
> Hi,

Hi Julien


>
> On 06/08/2020 12:37, Oleksandr wrote:
>>
>> On 05.08.20 16:30, Julien Grall wrote:
>>> Hi,
>>
>> Hi Julien
>>
>>
>>>
>>> On 03/08/2020 19:21, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> As a lot of x86 code can be re-used on Arm later on, this patch
>>>> splits IOREQ support into common and arch specific parts.
>>>>
>>>> This support is going to be used on Arm to be able run device
>>>> emulator outside of Xen hypervisor.
>>>>
>>>> Please note, this is a split/cleanup of Julien's PoC:
>>>> "Add support for Guest IO forwarding to a device emulator"
>>>>
>>>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> ---
>>>>   xen/arch/x86/Kconfig            |    1 +
>>>>   xen/arch/x86/hvm/dm.c           |    2 +-
>>>>   xen/arch/x86/hvm/emulate.c      |    2 +-
>>>>   xen/arch/x86/hvm/hvm.c          |    2 +-
>>>>   xen/arch/x86/hvm/io.c           |    2 +-
>>>>   xen/arch/x86/hvm/ioreq.c        | 1431 
>>>> +--------------------------------------
>>>>   xen/arch/x86/hvm/stdvga.c       |    2 +-
>>>>   xen/arch/x86/hvm/vmx/realmode.c |    1 +
>>>>   xen/arch/x86/hvm/vmx/vvmx.c     |    2 +-
>>>>   xen/arch/x86/mm.c               |    2 +-
>>>>   xen/arch/x86/mm/shadow/common.c |    2 +-
>>>>   xen/common/Kconfig              |    3 +
>>>>   xen/common/Makefile             |    1 +
>>>>   xen/common/hvm/Makefile         |    1 +
>>>>   xen/common/hvm/ioreq.c          | 1430 
>>>> ++++++++++++++++++++++++++++++++++++++
>>>>   xen/include/asm-x86/hvm/ioreq.h |   45 +-
>>>>   xen/include/asm-x86/hvm/vcpu.h  |    7 -
>>>>   xen/include/xen/hvm/ioreq.h     |   89 +++
>>>>   18 files changed, 1575 insertions(+), 1450 deletions(-)
>>>
>>> That's quite a lot of code moved in a single patch. How can we check 
>>> the code moved is still correct? Is it a verbatim copy?
>> In this patch I mostly tried to separate a common IOREQ part which 
>> also resulted in updating x86 sources to include new header.  Also I 
>> moved hvm_ioreq_needs_completion() to common header (which probably 
>> wanted to be in a separate patch). It was a verbatim copy initially 
>> (w/o hvm_map_mem_type_to_ioreq_server) and then updated to deal with 
>> arch specific parts.
>
> I would prefer if the two parts are done separately. IOW, the code 
> movement be nearly a verbatim copy.
>
>> In which way do you want me to split this patch?
>>
>> I could think of the following:
>>
>> 1. Copy of x86's ioreq.c/ioreq.h to common code > 2. Update common 
>> ioreq.c/ioreq.h
>> 3. Update x86's parts to be able to deal with common code
>> 4. Move hvm_ioreq_needs_completion() to common code
>>
>
> Ideally the code movement should be done in the same patch. This helps 
> to check the patch is only moving code and also avoids mistakes on 
> rebase.
>
> So my preference would be to first modify the x86 code (e.g. renaming) 
> to make it common and then have one patch that will move the code.

ok, will try to split accordingly. Thank you


-- 
Regards,

Oleksandr Tyshchenko


