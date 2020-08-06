Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37EA23DA08
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 13:37:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3eDV-0006Vm-7e; Thu, 06 Aug 2020 11:37:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTjn=BQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k3eDT-0006Vg-Qg
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 11:37:47 +0000
X-Inumbo-ID: 3e76ec6e-369b-4b10-abc5-867b43a3a818
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e76ec6e-369b-4b10-abc5-867b43a3a818;
 Thu, 06 Aug 2020 11:37:47 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id z14so13780622ljm.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2020 04:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=3qvrv2NcCrVhNCjBXcmn6ydC3U+4juJl4Q8+G+Je9Zk=;
 b=BdCPfklsNJcLwrOcGt/pIEQva8ijnwCjRAtFio+TZ/jR5Uhiux8Z/AmMrcdntQeFXp
 553h3r/EmRU88emS7/btRuN3NZ6tmL+EVe0xOpiMD09qFIp0BG7GZknw/BQHN3b78tZW
 IPJrlMYe4135gwUkMmecWBdSUvxSGYTXt7jm4ypAQj5HaB8Ei4HApS93Zbzi+Qbyg82m
 WJmBD+Nc9aowWNfDiw7V+uKcE+BBWOuid7RED66DFw6itKw0Xpe9mp4ewpLcZonflm/p
 2+T+taXYyfbkmumprNqzWlezzmo8FhEte6yLj6u6Whi8JyQHrB90X44tnQisEoc0GUnf
 FAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3qvrv2NcCrVhNCjBXcmn6ydC3U+4juJl4Q8+G+Je9Zk=;
 b=bThR6+kZxB3/I3cCHm/OUfusDgvT6DgEFMkAj8pqlOR5WpY7HF53m2TFVGbXCRBEN/
 aVoHeCL9w2F7ahARGg20len4cbKLwTP01svtFMYT82+ZZx6g8XkNL2TSJX0s9xcSFpAE
 ClQqY4BLAznRWD4NjvfV00/p597OYBHNiQg7kn8t8NdCMdF9Ia5XV3E5rx2t9b1apQTG
 R6iiN8FWQsnJRZYytyFPRGlxsbB0RmDGKbe+JfnbNC0WQJDswxVu3cpEZ8zKLNjO5vc6
 AAxofemvsCBj5uucqtl8NYix/HH0rbfzTtZ+7fDpLmi6wItjLOPLEU63aSSx+4/5IyXZ
 IJXQ==
X-Gm-Message-State: AOAM533KQJPXkyrQ4VnmHwxiDA+T+5hqrO715NPSqFozuwxMax8C8pQA
 74RsKD2o4IYdBeJLGN3MqbM=
X-Google-Smtp-Source: ABdhPJwIz48LYBOkFJt9OBx2MfKKXy/WzkbfWa5xcacF/QjLGvR5GGktIpH29IDVMhsea39NomdmVw==
X-Received: by 2002:a2e:b00f:: with SMTP id y15mr3844992ljk.223.1596713865812; 
 Thu, 06 Aug 2020 04:37:45 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l5sm2304962ljh.56.2020.08.06.04.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 04:37:45 -0700 (PDT)
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <6bfc3920-8f29-188c-cff4-2b99dabe166f@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b0103c16-0cec-1734-93a6-3a4169448179@gmail.com>
Date: Thu, 6 Aug 2020 14:37:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6bfc3920-8f29-188c-cff4-2b99dabe166f@xen.org>
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


On 05.08.20 16:30, Julien Grall wrote:
> Hi,

Hi Julien


>
> On 03/08/2020 19:21, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> As a lot of x86 code can be re-used on Arm later on, this patch
>> splits IOREQ support into common and arch specific parts.
>>
>> This support is going to be used on Arm to be able run device
>> emulator outside of Xen hypervisor.
>>
>> Please note, this is a split/cleanup of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>>   xen/arch/x86/Kconfig            |    1 +
>>   xen/arch/x86/hvm/dm.c           |    2 +-
>>   xen/arch/x86/hvm/emulate.c      |    2 +-
>>   xen/arch/x86/hvm/hvm.c          |    2 +-
>>   xen/arch/x86/hvm/io.c           |    2 +-
>>   xen/arch/x86/hvm/ioreq.c        | 1431 
>> +--------------------------------------
>>   xen/arch/x86/hvm/stdvga.c       |    2 +-
>>   xen/arch/x86/hvm/vmx/realmode.c |    1 +
>>   xen/arch/x86/hvm/vmx/vvmx.c     |    2 +-
>>   xen/arch/x86/mm.c               |    2 +-
>>   xen/arch/x86/mm/shadow/common.c |    2 +-
>>   xen/common/Kconfig              |    3 +
>>   xen/common/Makefile             |    1 +
>>   xen/common/hvm/Makefile         |    1 +
>>   xen/common/hvm/ioreq.c          | 1430 
>> ++++++++++++++++++++++++++++++++++++++
>>   xen/include/asm-x86/hvm/ioreq.h |   45 +-
>>   xen/include/asm-x86/hvm/vcpu.h  |    7 -
>>   xen/include/xen/hvm/ioreq.h     |   89 +++
>>   18 files changed, 1575 insertions(+), 1450 deletions(-)
>
> That's quite a lot of code moved in a single patch. How can we check 
> the code moved is still correct? Is it a verbatim copy?
In this patch I mostly tried to separate a common IOREQ part which also 
resulted in updating x86 sources to include new header.  Also I moved 
hvm_ioreq_needs_completion() to common header (which probably wanted to 
be in a separate patch). It was a verbatim copy initially (w/o 
hvm_map_mem_type_to_ioreq_server) and then updated to deal with arch 
specific parts.
In which way do you want me to split this patch?

I could think of the following:

1. Copy of x86's ioreq.c/ioreq.h to common code
2. Update common ioreq.c/ioreq.h
3. Update x86's parts to be able to deal with common code
4. Move hvm_ioreq_needs_completion() to common code

-- 
Regards,

Oleksandr Tyshchenko


