Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECA3274813
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 20:23:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKmx4-00086M-J0; Tue, 22 Sep 2020 18:23:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cWTz=C7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kKmx3-00086G-Un
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 18:23:42 +0000
X-Inumbo-ID: 13321cc3-29b4-4ff2-a8ec-0909838108fc
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13321cc3-29b4-4ff2-a8ec-0909838108fc;
 Tue, 22 Sep 2020 18:23:41 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id n25so14999609ljj.4
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2020 11:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=t2kL3MzGLu/9L+S+C/eiZPjeYwdCyaw12PCpfqu38Pc=;
 b=q81L1Bm2qI+JWZe8w/qQ4mfUJOG1I0D7VCbsGBP2Smpu98qh8D7aMjDGfElkJTNJDD
 AQ1xPZUKWQbOufaQFklmk000Wsifn0lZCgzz0F5utyNrl4Peenuqq0wsV3r/vzunYwca
 L2Avuc2lZsu0i8SzKdGnlREh+xnP1h/x+BAwX1uodhrLgjNaEMOTrlTnJRnEXvJ5CXsT
 5VmI4HauPMjpQDyu+zhJJyYzlTppOus3c/Gk6bKXbTi8GpZzRbHJfeeFXgT2SScOEPHP
 80QugSjyoFU3GbySAS1eI+7Yf0Psjzg84OoE09ssSJu/NVc3F/x6xJjA0/Gz5+PDDS54
 LFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=t2kL3MzGLu/9L+S+C/eiZPjeYwdCyaw12PCpfqu38Pc=;
 b=hwODO57zRwL05mVanITOlBlPQ8U+ZybBpDjTowQJk116GGEcapY8GyLIMt8lc+0UqQ
 /NZ6xA7ll1fn4crwbCu3zTOulCcZn8r0aMyjRw+rPrW9RPCGpgMcE6fLB2fLDORjSP5O
 5UiGLpBSnaK8w7Pn1HwNbYy8qROrHp+UUtxXoszE/uiicZn4POKyweGKl8jqcpA0Wm0+
 RrsS/ZjCglZposTaTyV4h2VM8wIsTiM2Q1BzEUkwjLNDw4OErUM8y9tOzahjZ74p8bDq
 ym6ltpWWbhRYcW9w0H4C0sA9EitYK8BdcISdEHERAF7pHDzVa4M7DbHJ+ldHiY6/Bna9
 U45w==
X-Gm-Message-State: AOAM530MTWc9hFrxHVBKaTZ2HIFSSZYuzlsgsaXoEhJU1RqxjGb5vfQX
 dQ7z2QmyAnkkSy9JQ7OSjOU=
X-Google-Smtp-Source: ABdhPJyhJlKGdtDsb7GGmboEzBVKTyyMBbv7MSmyoHmcjPCvl3bFTscwjh6ZW5sks/Y+NWRWaxnRkA==
X-Received: by 2002:a2e:b704:: with SMTP id j4mr1850255ljo.329.1600799019620; 
 Tue, 22 Sep 2020 11:23:39 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b134sm3777030lfg.147.2020.09.22.11.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 11:23:39 -0700 (PDT)
Subject: Re: [PATCH V1 11/16] xen/ioreq: Introduce
 hvm_domain_has_ioreq_server()
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-12-git-send-email-olekstysh@gmail.com>
 <93cc6603-44f2-1ceb-997d-cbc51c3ba2c3@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <3b85d5b1-1b34-3128-e4ac-c939ef65f74f@gmail.com>
Date: Tue, 22 Sep 2020 21:23:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <93cc6603-44f2-1ceb-997d-cbc51c3ba2c3@suse.com>
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


On 16.09.20 11:04, Jan Beulich wrote:

Hi Jan

> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch introduces a helper the main purpose of which is to check
>> if a domain is using IOREQ server(s).
>>
>> On Arm the benefit is to avoid calling handle_hvm_io_completion()
>> (which implies iterating over all possible IOREQ servers anyway)
>> on every return in leave_hypervisor_to_guest() if there is no active
>> servers for the particular domain.
>>
>> This involves adding an extra per-domain variable to store the count
>> of servers in use.
> Since only Arm needs the variable (and the helper), perhaps both should
> be Arm-specific (which looks to be possible without overly much hassle)?
Please note that the whole ioreq_server struct are going be moved to 
"common" domain and new variable is going to go into it.
I am wondering whether this single-line helper could be used on x86 or 
potential new arch ...


>
>> --- a/xen/common/ioreq.c
>> +++ b/xen/common/ioreq.c
>> @@ -38,9 +38,15 @@ static void set_ioreq_server(struct domain *d, unsigned int id,
>>                                struct hvm_ioreq_server *s)
>>   {
>>       ASSERT(id < MAX_NR_IOREQ_SERVERS);
>> -    ASSERT(!s || !d->arch.hvm.ioreq_server.server[id]);
>> +    ASSERT((!s && d->arch.hvm.ioreq_server.server[id]) ||
>> +           (s && !d->arch.hvm.ioreq_server.server[id]));
> For one, this can be had with less redundancy (and imo even improved
> clarity, but I guess this latter aspect my depend on personal
> preferences):
>
>      ASSERT(d->arch.hvm.ioreq_server.server[id] ? !s : !!s);

This construction indeed better.


>
> But then I wonder whether the original intention wasn't rather such
> that replacing NULL by NULL is permissible. Paul?
>
>>       d->arch.hvm.ioreq_server.server[id] = s;
>> +
>> +    if ( s )
>> +        d->arch.hvm.ioreq_server.nr_servers ++;
>> +    else
>> +        d->arch.hvm.ioreq_server.nr_servers --;
> Nit: Stray blanks (should be there only with binary operators).

ok


>
>> @@ -1395,6 +1401,7 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
>>   void hvm_ioreq_init(struct domain *d)
>>   {
>>       spin_lock_init(&d->arch.hvm.ioreq_server.lock);
>> +    d->arch.hvm.ioreq_server.nr_servers = 0;
> There's no need for this - struct domain instances start out all
> zero anyway.

ok


>
>> --- a/xen/include/xen/ioreq.h
>> +++ b/xen/include/xen/ioreq.h
>> @@ -57,6 +57,11 @@ struct hvm_ioreq_server {
>>       uint8_t                bufioreq_handling;
>>   };
>>   
>> +static inline bool hvm_domain_has_ioreq_server(const struct domain *d)
>> +{
>> +    return (d->arch.hvm.ioreq_server.nr_servers > 0);
>> +}
> This is safe only when d == current->domain and it's not paused,
> or when they're distinct and d is paused. Otherwise the result is
> stale before the caller can inspect it. This wants documenting by
> at least a comment, but perhaps better by suitable ASSERT()s.

Agree, will use ASSERT()s.


>
> As in earlier patches I don't think a hvm_ prefix should be used
> here.

ok


>
> Also as a nit: The parentheses here are unnecessary, and strictly
> speaking the "> 0" is, too.

ok


-- 
Regards,

Oleksandr Tyshchenko


