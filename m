Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE00307F08
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 21:02:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77442.140250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5DUC-000489-Vc; Thu, 28 Jan 2021 20:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77442.140250; Thu, 28 Jan 2021 20:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5DUC-00047m-ST; Thu, 28 Jan 2021 20:01:48 +0000
Received: by outflank-mailman (input) for mailman id 77442;
 Thu, 28 Jan 2021 20:01:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tEu6=G7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5DUA-00047f-Vv
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 20:01:47 +0000
Received: from mail-lj1-x22e.google.com (unknown [2a00:1450:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 311d70e6-1491-4441-a507-14671e49e5f5;
 Thu, 28 Jan 2021 20:01:45 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id f2so7844854ljp.11
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 12:01:45 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k30sm1769744lfo.166.2021.01.28.12.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 12:01:44 -0800 (PST)
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
X-Inumbo-ID: 311d70e6-1491-4441-a507-14671e49e5f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=a8sCxpm8BjbOrDmAamUB94nVe5Kq0FQKMiaQCIiIbbk=;
        b=ljA/kWZ4CHHZ8/RuFbcFaPrzRe3elza3y6Hrs2cD3FSdqTtBmRw30srpaB3slDnwJe
         a/fl8L2QvPledaRgIv2x0OpyirF3w6P7IKdmiQCi4mz8BI6IG7bbaJ6qH+jji26/VUkO
         G0iFhq5B8wxFOnlbpaXy13RBIiN2X+BeYD05S9vhtaQgJfG5aDhEzj+hbde6zu68m09G
         oTpYhfud2KngaTaFwETqA8yPPJwbSjrJQYIvyCH6XonWWpXpNLOkwfnA/6gbk4CdPPEU
         FgssembHcpvxNGZdRJRMiPXcFDao2PbEiLiFaLkC3Yt3nAocWPo+EO2WE8frUMVWDy61
         lFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=a8sCxpm8BjbOrDmAamUB94nVe5Kq0FQKMiaQCIiIbbk=;
        b=CWwLJCy2BpAdkiV8luLOQvI3UKSTMCNc2IGOIdu7Qz4uRjXLs1ZHl34aXNTOmHMONL
         R4m3Dau39oWBKDNOjowjSxld4kRV1DgCFYk5JnG4HmnONv3auASIKbAyw3moSdHrEuV0
         nSgl/bess2QvVConUb8PmpmUP8aGSD3i+R24JxzDrv9yLGU5Awcq2zG48lgCD30Dkw/C
         nE4sly+f38dKinSXjdFAcEojd+EfsMY/LbUOcC6YluzzB69c13OxR1VY98oiiHDZZ9DQ
         70dTZ0fTDYrUMDb34s2aifcwnbpoK+RWj9oXT/o/4kI1BHNS0YavuoueShoTc+iW1MEl
         4qGA==
X-Gm-Message-State: AOAM533GWKRicY9yIf6EpI/9GVatEfTu60WjoG7h7Ej/YBqlF6f2w9Zv
	n26F/LBMa1mFB9QLOXcky/ktdISy2mHUzQ==
X-Google-Smtp-Source: ABdhPJzL3N1oHAcAjnnEFVVOQbwV+tj7SkC6608CPymlYeQPUcOweZKiu3qKnCXxSNS37xYurXYb8w==
X-Received: by 2002:a2e:88c9:: with SMTP id a9mr488482ljk.107.1611864104605;
        Thu, 28 Jan 2021 12:01:44 -0800 (PST)
Subject: Re: [PATCH V5 09/22] xen/ioreq: Make x86's IOREQ related dm-op
 handling common
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-10-git-send-email-olekstysh@gmail.com>
 <d83c0736-c5cb-23e1-1cb3-fefe6907f091@suse.com>
 <19fa20ec-739b-250a-19f5-c4cbafd632fa@gmail.com>
 <46d8a845-8cbc-365b-1032-f079bf1e7d67@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f131f63b-b8d9-2fe7-d3f0-da4a9faec62d@gmail.com>
Date: Thu, 28 Jan 2021 22:01:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <46d8a845-8cbc-365b-1032-f079bf1e7d67@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 28.01.21 15:18, Jan Beulich wrote:

Hi Jan

> On 28.01.2021 13:06, Oleksandr wrote:
>> On 28.01.21 12:52, Jan Beulich wrote:
>>
>> Hi Jan
>>
>>> On 25.01.2021 20:08, Oleksandr Tyshchenko wrote:
>>>> --- /dev/null
>>>> +++ b/xen/include/xen/dm.h
>>>> @@ -0,0 +1,41 @@
>>>> +/*
>>>> + * Copyright (c) 2016 Citrix Systems Inc.
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or modify it
>>>> + * under the terms and conditions of the GNU General Public License,
>>>> + * version 2, as published by the Free Software Foundation.
>>>> + *
>>>> + * This program is distributed in the hope it will be useful, but WITHOUT
>>>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>>>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>>>> + * more details.
>>>> + *
>>>> + * You should have received a copy of the GNU General Public License along with
>>>> + * this program; If not, see <http://www.gnu.org/licenses/>.
>>>> + */
>>>> +
>>>> +#ifndef __XEN_DM_H__
>>>> +#define __XEN_DM_H__
>>>> +
>>>> +#include <xen/sched.h>
>>>> +
>>>> +struct dmop_args {
>>>> +    domid_t domid;
>>>> +    unsigned int nr_bufs;
>>>> +    /* Reserve enough buf elements for all current hypercalls. */
>>>> +    struct xen_dm_op_buf buf[2];
>>> So this is then the patch where the public header needs including,
>>> to satisfy this use of a struct declared there independent of what
>>> xen/sched.h includes. In fact public/xen.h needs including here
>>> as well, I think, for domid_t. Otoh I can't see why you include
>>> xen/sched.h.
>> Yes, xen/sched.h indeed doesn't need to be included here, I mentioned
>> that we could just replace
>>
>> it by xen/types.h (this is the minimum what we need here I think). As I
>> understand public/xen.h is already included by public/hvm/dm_op.h...
> But that's something you better wouldn't depend on anywhere.
> What one public header does or does not include may change over
> time.

ok, will include public/xen.h as well.

-- 
Regards,

Oleksandr Tyshchenko


