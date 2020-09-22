Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2792274936
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 21:32:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKo1Z-00084y-6l; Tue, 22 Sep 2020 19:32:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cWTz=C7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kKo1X-000841-7f
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 19:32:23 +0000
X-Inumbo-ID: d395bd20-1728-4b09-8362-d623ed31badb
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d395bd20-1728-4b09-8362-d623ed31badb;
 Tue, 22 Sep 2020 19:32:22 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id k25so15164461ljk.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2020 12:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Dcy8/xRSA9CV4sCqed77hrCyQ+q/dQFc5ov3+8uc8MY=;
 b=hGGrDOg1ab2zqkqLA1sIzqQ4Hqxz0dpJIFJWmOz8DKVFhSlv1+IUOQMP//g4sjLTfv
 Icb15JzRVaAzLCRoEAHyBYZhxUpc3bAyG9oqUI4Pj6n+h2O76EQRYC86dLEwxjCcDrAx
 3Lfoce/EtJcAxtzcQdnTAZRysnL0kdSogCNe3rs+4w1EK+7HWc0l8dULw6X2f1QCv4hX
 6YUaI6925VFBtGWLxpRk5hfhq7Ki9LdXbqAOdgpcL0VzP7XEPrUcJluVmoEzKxw9AmL+
 658lyo4UyXsx+MGRVPXBCxIl/kQIpiUrEMLcwZDKkLl3W9vniC56drfBF6zVifzfVHZK
 Divg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Dcy8/xRSA9CV4sCqed77hrCyQ+q/dQFc5ov3+8uc8MY=;
 b=DySDmK8VVBYaOh8R4FylsiF6HiHoBupPxX4GlcesoLh7144yR4NnCFzGFd+476HtPN
 iOrJztYgvwIrhyQhs84TsJ16Q91qRVj2s3j7z21Wl+vkxEP6zW+2mWRbgVB04WugYtfw
 ELm53BNN0Y05bm5b9owInfiM/s9uT7yH4J4R7IYgjKkO2WqRkX6q75JJXUu86pUitdw0
 OuZ0sfC4sjBLmGVEOou17ODxEgbReLSMCBTjSlM/XONmWRI0WgtydOht3Aophnrv/4TM
 /fPYqnQKup7705Rt2ATz69e9WakH/a0YVRZE+Jjv7DzmaL/jb5L+9ibX/sYtgG2h82Tn
 83NQ==
X-Gm-Message-State: AOAM530xQlvj1fMLX5nBlm3DmpLv7PnQXEEksYHMlEi/Pv5PuV6cXQhf
 iyBnfh8o553PPd4EwTGNhOk=
X-Google-Smtp-Source: ABdhPJwWheR1mQ/+Tf/Nf+OJx6f+hJwTnDfFkzPFGqjgmactWLFY8TLbOesPeIxPhc8clif8z0h6Wg==
X-Received: by 2002:a2e:b52c:: with SMTP id z12mr1862955ljm.437.1600803140909; 
 Tue, 22 Sep 2020 12:32:20 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id d18sm3762231lfm.178.2020.09.22.12.32.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 12:32:20 -0700 (PDT)
Subject: Re: [PATCH V1 13/16] xen/ioreq: Make x86's invalidate qemu mapcache
 handling common
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-14-git-send-email-olekstysh@gmail.com>
 <83dfb207-c191-8dad-1474-ce57b6d51102@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <2cab3ca5-0f2b-a813-099f-95bbf54bb9c8@gmail.com>
Date: Tue, 22 Sep 2020 22:32:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <83dfb207-c191-8dad-1474-ce57b6d51102@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 16.09.20 11:50, Jan Beulich wrote:

Hi Jan, Roger

> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -1490,6 +1490,12 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
>>       /* Ensure the hypercall trap instruction is re-executed. */
>>       if ( current->hcall_preempted )
>>           regs->pc -= 4;  /* re-execute 'hvc #XEN_HYPERCALL_TAG' */
>> +
>> +#ifdef CONFIG_IOREQ_SERVER
>> +    if ( unlikely(current->domain->qemu_mapcache_invalidate) &&
>> +         test_and_clear_bool(current->domain->qemu_mapcache_invalidate) )
>> +        send_invalidate_req();
>> +#endif
>>   }
> There's a lot of uses of "current" here now, and these don't look to
> exactly be cheap on Arm either (they aren't on x86), so I wonder
> whether this is the point where at least "current" wants latching
> into a local variable here.

Sounds reasonable, will use local variable


>
>> --- a/xen/arch/x86/hvm/hypercall.c
>> +++ b/xen/arch/x86/hvm/hypercall.c
>> @@ -18,8 +18,10 @@
>>    *
>>    * Copyright (c) 2017 Citrix Systems Ltd.
>>    */
>> +
>>   #include <xen/lib.h>
>>   #include <xen/hypercall.h>
>> +#include <xen/ioreq.h>
>>   #include <xen/nospec.h>
> While I don't care much about the presence of absence of the blank
> line between head comment and #include-s, I don't see why you add
> one here.

Accidentally), will remove.


>
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -1651,6 +1651,11 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>           break;
>>       }
>>   
>> +#ifdef CONFIG_IOREQ_SERVER
>> +    if ( op == XENMEM_decrease_reservation )
>> +        curr_d->qemu_mapcache_invalidate = true;
>> +#endif
> I don't see why you put this right into decrease_reservation(). This
> isn't just to avoid the extra conditional, but first and foremost to
> avoid bypassing the earlier return from the function (in the case of
> preemption). In the context of this I wonder whether the ordering of
> operations in hvm_hypercall() is actually correct.
Good point, indeed we may return earlier in case of preemption, I missed 
that.
Will move it to decrease_reservation(). But, we may return even earlier 
in case of error...
Now I am wondering should we move it to the very beginning of command 
processing or not?
AFAIU before this patch qemu_mapcache_invalidate was always set in 
hvm_memory_op() if XENMEM_decrease_reservation came
despite of possible errors in the command processing.


> I'm also unconvinced curr_d is the right domain in all cases here;
> while this may be a pre-existing issue in principle, I'm afraid it
> gets more pronounced by the logic getting moved to common code.

Sorry I didn't get your concern here.


> Roger - thoughts either way with, in particular, PVH Dom0 in mind?

>> --- a/xen/include/xen/ioreq.h
>> +++ b/xen/include/xen/ioreq.h
>> @@ -97,6 +97,8 @@ static inline bool hvm_ioreq_needs_completion(const ioreq_t *ioreq)
>>              (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != IOREQ_WRITE);
>>   }
>>   
>> +void send_invalidate_req(void);
> Perhaps rename to ioreq_send_invalidate(), ioreq_send_invalidate_req(),
> or send_invalidate_ioreq() at this occasion?

I would prefer function with ioreq_ prefix.


>
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -512,6 +512,8 @@ struct domain
>>       /* Argo interdomain communication support */
>>       struct argo_domain *argo;
>>   #endif
>> +
>> +    bool_t qemu_mapcache_invalidate;
> "bool" please.

ok

-- 
Regards,

Oleksandr Tyshchenko


