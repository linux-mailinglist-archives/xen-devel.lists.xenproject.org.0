Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AF63074DC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 12:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76939.139085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55Yq-0003JA-Du; Thu, 28 Jan 2021 11:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76939.139085; Thu, 28 Jan 2021 11:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55Yq-0003Il-AG; Thu, 28 Jan 2021 11:34:04 +0000
Received: by outflank-mailman (input) for mailman id 76939;
 Thu, 28 Jan 2021 11:34:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tEu6=G7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l55Yo-0003Hu-V0
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 11:34:03 +0000
Received: from mail-lj1-x230.google.com (unknown [2a00:1450:4864:20::230])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d022b032-95ee-4adc-8baa-221e65a8ab4b;
 Thu, 28 Jan 2021 11:34:01 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id l12so5899261ljc.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 03:34:01 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id p15sm1529225lfc.286.2021.01.28.03.33.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 03:33:46 -0800 (PST)
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
X-Inumbo-ID: d022b032-95ee-4adc-8baa-221e65a8ab4b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=C8nc54qr91hqP5mk5kE9NoZXMfmBBqjP285Ln7BD4Zo=;
        b=juuqtBm+QxoOmXTGg5Pa9MBwe9KzoDAO759lkaLAEwEwCG+fCUux3d5cnoivC1WUt8
         BHO6mYdYwi46wA/x1AmoTEQ5EzbwHIu++zFb4WREr6/yF/GQd6zTn2313zN5Zd9NqdGa
         41URM1swu8l50AL93i/FQP6jCPseMRejBkRsE1J5fvKdOCxoH/K7Kz9jYeqvQd+Jq+9a
         5BpLTlCMee7ABNjf49vN97sTrlhzZFeyZUbNa7KUNe+GHmS/Aq92CARTjdsxtI7Eje+k
         38EMzuBetmchUuWyjZGWwNLKGoag1fbnqc+EvgaaKDeATAoDqE+1mQq3l8qrekYw8BXy
         hPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=C8nc54qr91hqP5mk5kE9NoZXMfmBBqjP285Ln7BD4Zo=;
        b=T9H0jzZuBBcPPdk6h83UZBMfJ5ybr0KScvk+xDwi+xJpZNC5Ygdyx+qZA0Qn/N8k9v
         w2XplPlWn1+XU7C21s41F15m4qE8jtg/PcH/OwrJb+8cCHbLbaekROmGo5F8wbhFydwl
         sCBzMzkiZqd9xuvo6JE8Z9+CrixKyY/VGHYnPQooLrzvIBPacvkvLPrCaankqyPyEQW0
         /3pkR+29lef4saWiIzoqBi/OyqMo4wFkp4uGc+suljhNIO/5zX0Tqn11+Pc0aP/qd0xD
         CORNAdB3ZCLBVHyNw3VqSPGwxGV+naza1m5KiL/LNUOb0K5cSNmf8KNq/HMWOAQbz/HH
         q7Vg==
X-Gm-Message-State: AOAM533PPoZtHDq0GV5VoKs0lPlqn2LIJYRS1aLKYswbuFRBpmGm0zf/
	pcpN1u4bdb5K8GPEBTQkj54=
X-Google-Smtp-Source: ABdhPJyUq5sIKleqhsM7eooY2Ih5pa+34uKWDBrQuGaHwG/C6NwavimO1OQXjcZCQGqX7hieMekeUQ==
X-Received: by 2002:a05:651c:c5:: with SMTP id 5mr4628448ljr.59.1611833640492;
        Thu, 28 Jan 2021 03:34:00 -0800 (PST)
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <078a6aa6-2f72-d816-9e14-8132648d3370@gmail.com>
Date: Thu, 28 Jan 2021 13:33:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a5fd81ac-3ed4-40e7-66d7-a8daf3be4987@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 28.01.21 11:40, Julien Grall wrote:

Hi Julien

> Hi Oleksandr,
>
> On 27/01/2021 19:20, Oleksandr wrote:
>  >  >>> So I think we may be able to drop the include from 
> asm/hvm/domain.h
>> (this would avoid to include it everywhere...).
>>
>> I have tried that, but other CUs use definitions from 
>> public/hvm/dm_op.h, for example:
>>
>> p2m-pt.c: In function 'p2m_type_to_flags':
>> p2m-pt.c:87:33: error: 'XEN_DMOP_IOREQ_MEM_ACCESS_WRITE' undeclared 
>> (first use in this function)
>>           if ( p2m->ioreq.flags & XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
>>                                   ^
>> So, I would prefer to leave it as is, please let me know if you think 
>> otherwise.
>
> AFAICT, there is only 2 places (p2m-pt.c and p2m-ept.c) that requires 
> <public/hvm/dm_op.h> but doesn't directly include it. Folding the diff 
> below in patch #4 should do the job:

ok, will do


>
> diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
> index 975ab403f235..23d411f01d2f 100644
> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -17,6 +17,7 @@
>
>  #include <xen/domain_page.h>
>  #include <xen/sched.h>
> +#include <public/hvm/dm_op.h>
>  #include <asm/altp2m.h>
>  #include <asm/current.h>
>  #include <asm/paging.h>
> diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
> index c43d5d0413a1..f2afcf49a368 100644
> --- a/xen/arch/x86/mm/p2m-pt.c
> +++ b/xen/arch/x86/mm/p2m-pt.c
> @@ -27,6 +27,7 @@
>  #include <xen/vm_event.h>
>  #include <xen/event.h>
>  #include <xen/trace.h>
> +#include <public/hvm/dm_op.h>
>  #include <public/vm_event.h>
>  #include <asm/altp2m.h>
>  #include <asm/domain.h>
> diff --git a/xen/include/asm-x86/hvm/domain.h 
> b/xen/include/asm-x86/hvm/domain.h
> index 3b36c2f41fa1..f26c1a2e2d5f 100644
> --- a/xen/include/asm-x86/hvm/domain.h
> +++ b/xen/include/asm-x86/hvm/domain.h
> @@ -28,8 +28,6 @@
>  #include <asm/hvm/vmx/vmcs.h>
>  #include <asm/hvm/svm/vmcb.h>
>
> -#include <public/hvm/dm_op.h>
> -
>  #ifdef CONFIG_MEM_SHARING
>  struct mem_sharing_domain
>  {
>
> You would then need to move the include of <public/hvm/dm_op.h> in 
> <xen/dm.h> from this patch to patch #9.

yes, sure


-- 
Regards,

Oleksandr Tyshchenko


