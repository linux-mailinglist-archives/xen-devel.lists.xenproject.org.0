Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CF030305A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 00:41:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74564.134034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4BTV-00043E-PG; Mon, 25 Jan 2021 23:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74564.134034; Mon, 25 Jan 2021 23:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4BTV-00042p-Lh; Mon, 25 Jan 2021 23:40:49 +0000
Received: by outflank-mailman (input) for mailman id 74564;
 Mon, 25 Jan 2021 23:40:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTVL=G4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l4BTT-00042R-RH
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 23:40:47 +0000
Received: from mail-lj1-x22b.google.com (unknown [2a00:1450:4864:20::22b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ac0c8f2-9b31-4bc4-b557-d347b6ad0719;
 Mon, 25 Jan 2021 23:40:46 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id i17so17506415ljn.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 15:40:46 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t20sm1192938lji.36.2021.01.25.15.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 15:40:45 -0800 (PST)
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
X-Inumbo-ID: 1ac0c8f2-9b31-4bc4-b557-d347b6ad0719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=tiBZJgmqME3Y/Ik8DqD8nb0WRn+JEiUYia9+mCMJcLo=;
        b=WfeaICBZfiDgheK0AbdKXPlboGwnRWrlLihwGT2zHgrMnhVk2GuLYV16mZ6XaZJuIO
         rGZFFAinoBLihA3epGIQS59Z75RExvEnMGKnDsjkPfgfz7gL53D1BD5PPD0BwvDeAra7
         pIfj2ZZqhxVZeL528FEXSYWY+YYA/Nz5q2LhDz5Jzcxti0KIs6Nlh3D8APZ9WFsOMrcr
         rJvUaggiav3covc1PBc/+83T3LZ7sd3JoKpHV8TYu0RbE7lzXj4gZaUXTJcbU5TIOe7i
         ZK0GnI2JyaaOsH/hrPRVUpMZYvRR+TohIIdY5Ig1GOpCoJQObiv7H9i1qv18L4MlDWvJ
         15kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=tiBZJgmqME3Y/Ik8DqD8nb0WRn+JEiUYia9+mCMJcLo=;
        b=CHDX61VS8ok+lrx/PVww4C02R/WB+2H+E0xxN9wwGGRiNjbCfoacC1iddWkoM6v3Ib
         MVAZ75VKYLCa9Tub2jygjIKbprWqAzGgATZordVGhoZxjSEKEUgJ1KG5Gh7wYFkPU/qS
         +pTUQEs6uutkX0T1+41ewa3zZZCNi9aoo2ivuuuOZ6c5XbWgFCxHrjK4H1daPcfXFk4r
         M9AkK+xWkgLFb7wzZJXqbC7tUvXFXqfC+/6RQUpTpy7KhwO1uVC2WZOnifyuotzx2l+1
         DFqRJzihi0PwHEv/neEZKAHAH4MWW6QkrdEAhbXVTYYBUBX2NnzOpTwxXAz1FBW/du8X
         D/nw==
X-Gm-Message-State: AOAM531cxvI+NkeYF1VD/EvHxVUH38AjO71dd+3KsROOKNQnuvTCDkYe
	FjF84jJemmdCG0GLZkGEkmU=
X-Google-Smtp-Source: ABdhPJziYJgPcYyO9wchJSdrIDiKKYgD5DkMvpIdt2Bs7Vouq/1lo6VTmC3DWwAFAyzNM7Z5o0wABw==
X-Received: by 2002:a2e:9252:: with SMTP id v18mr1407650ljg.352.1611618045761;
        Mon, 25 Jan 2021 15:40:45 -0800 (PST)
Subject: Re: [PATCH V5 04/22] xen/ioreq: Make x86's IOREQ feature common
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-5-git-send-email-olekstysh@gmail.com>
 <CAJ=z9a1c+obN3KW_cMr7OH0112_gHSxnAoEJb9qW6R1J38QgQQ@mail.gmail.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <20270711-36bc-6d7d-16cb-4572cace47ed@gmail.com>
Date: Tue, 26 Jan 2021 01:40:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJ=z9a1c+obN3KW_cMr7OH0112_gHSxnAoEJb9qW6R1J38QgQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 26.01.21 01:13, Julien Grall wrote:
> Hi,

Hi Julien


>
> On Mon, 25 Jan 2021 at 19:09, Oleksandr Tyshchenko <olekstysh@gmail.com> wrote:
>> ***
>> Please note, this patch depends on the following which is
>> on review:
>> https://patchwork.kernel.org/patch/11816689/
>> The effort (to get it upstreamed) was paused because of
>> the security issue around that code (XSA-348).
>> ***
> I read this comment as "This series should be applied on top the patch
> X". However, looking at your branch, I can't see the patch. What did I
> miss?
You didn't miss anything. Patch series doesn't contain it. I mentioned 
about this patch in order not to forget about it
and draw reviewer's attention. Looks like, the activity (to get it 
upstreamed) hasn't been resumed yet and I don't know what we should do 
with that dependency
in the context of this series...


>
> Cheers,

-- 
Regards,

Oleksandr Tyshchenko


