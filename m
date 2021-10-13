Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BEF42C472
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 17:06:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208614.364808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafpH-0007TY-5R; Wed, 13 Oct 2021 15:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208614.364808; Wed, 13 Oct 2021 15:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafpH-0007Qb-2M; Wed, 13 Oct 2021 15:05:51 +0000
Received: by outflank-mailman (input) for mailman id 208614;
 Wed, 13 Oct 2021 15:05:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dUCo=PB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mafpG-0007QV-5b
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 15:05:50 +0000
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03b2cd67-4eae-486f-a546-a264529d4ed5;
 Wed, 13 Oct 2021 15:05:49 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u18so9511437wrg.5
 for <xen-devel@lists.xenproject.org>; Wed, 13 Oct 2021 08:05:49 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id m36sm6529717wms.6.2021.10.13.08.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 08:05:47 -0700 (PDT)
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
X-Inumbo-ID: 03b2cd67-4eae-486f-a546-a264529d4ed5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zJOBhlYMSYleHwtQe85+9w/XLjPZ59ZgHkB5p8AjHqg=;
        b=PB5gou64VDJEdNOHBLPaZXOtqYju7+eXNThBxQk8E+mWakLVSTvLcMqPXUBFfQe/Sg
         c45ABIKKrWnOl/KcjkwmMIFENi8VlvKfrjie5uUXrQcK4nWadENyYM17PGZLvsGBf7Rn
         RGqAHF/oVjLPH+odzy8t7KX+gEcBDic1e1DRrF0ppxByuW9N6TivoMqd3yMe8KCnVfCQ
         k4ZUiEo/0a/zG87mu5p7j5deHE73yugJroywCc3vruJ5irn4cK/dLgZRjRenlW0eFqjW
         sTP1I+E0Zs4b/MVZu5Qbs0oIK7s4D1owYxnoJjcD3ZZKgVwv3v5BwlZzxXeI650OGITh
         cUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zJOBhlYMSYleHwtQe85+9w/XLjPZ59ZgHkB5p8AjHqg=;
        b=r8ThM7P7Ap2jtHaLrKBtWXn58Wb0t/3Xob83XPA4pasFvnC+0zVhMXC+/WDx5kBHw7
         uwkfQoh3k9HhZKSFVO6gwmvOJZ8gOOzl+Jehn8ru4B7wS2id6L7PVobRu7wqFP5UGFx1
         pUCgNz1sQJk0R6+L0GKbBUZFIwx57zg1opWvt+Qol6t+7xRqrQJb6mO/x52OExbegiB4
         LDKK/INIQP50tcR0EvAIHyMxHB46+4BzSQ0W9u2JGbmmSqdHUNVumSgb8jq0E4OBeZ1k
         Fu1JFiOOQSashd6DwnV9W5GgY6YcnzGaPwdcx9DfywFQc00pvTcEx+1LgNHLIq6MsdbM
         zQ1Q==
X-Gm-Message-State: AOAM531Tm+eBLrfguzZ3FN7K86W9r8qZ4uugT7R00W3kzadcKB8vygS+
	0UZRxgsgLCovIlFTUWgMSRQ=
X-Google-Smtp-Source: ABdhPJwXaayRM6TCF7lUuU37k/KPj6vRiL4BML/ay5d+FJaoibNyrgaKMxOUYjgNWm+aApMqktrSrw==
X-Received: by 2002:a5d:59a3:: with SMTP id p3mr7552165wrr.146.1634137548128;
        Wed, 13 Oct 2021 08:05:48 -0700 (PDT)
Subject: Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct
 xen_domctl_getdomaininfo
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <9e6e1378-7ee3-b692-b57d-29b597160661@gmail.com>
 <1634073720-27901-1-git-send-email-olekstysh@gmail.com>
 <f9b8b55b-cfe4-2bfa-44db-e898800def72@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f51ec1a9-f265-cd18-792b-017224b8667c@gmail.com>
Date: Wed, 13 Oct 2021 18:05:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f9b8b55b-cfe4-2bfa-44db-e898800def72@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 13.10.21 16:56, Jan Beulich wrote:

Hi Jan

> On 12.10.2021 23:22, Oleksandr Tyshchenko wrote:
>> @@ -95,7 +95,7 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
>>   
>>       info->cpu_time = cpu_time;
>>   
>> -    info->flags = (info->nr_online_vcpus ? flags : 0) |
>> +    info->flags |= (info->nr_online_vcpus ? flags : 0) |
>>           ((d->is_dying == DOMDYING_dead) ? XEN_DOMINF_dying     : 0) |
>>           (d->is_shut_down                ? XEN_DOMINF_shutdown  : 0) |
>>           (d->controller_pause_count > 0  ? XEN_DOMINF_paused    : 0) |
> I don't think this is a useful change - you move from a simple write
> to a read-modify-write operation. With this dropped again, hypervisor
> parts:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks!

Will drop.


>
> While this has meanwhile moved quite far from the original proposal,
> I still wonder in how far Andrew may have remaining concerns. Did
> you check with him, perhaps on irc?
> But of course catching his
> attention may be difficult, so no (further) feedback by him should
> probably not keep this from getting committed (if no other open
> issues remain).

If I remember correctly, I made several attempts to clarify in the 
initial thread. But, I have to admit, not via IRC (I am expecting some 
troubles with my IRC client last time and I haven't figured out yet 
why). Of course, it would be correct to get a feedback to make sure that 
there would be no remaining concerns (as the main concern to use domctl 
was addressed) or otherwise.


>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


