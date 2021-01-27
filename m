Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A977C305B2C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 13:23:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76084.137155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4jpz-0000EM-KZ; Wed, 27 Jan 2021 12:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76084.137155; Wed, 27 Jan 2021 12:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4jpz-0000Dy-HJ; Wed, 27 Jan 2021 12:22:19 +0000
Received: by outflank-mailman (input) for mailman id 76084;
 Wed, 27 Jan 2021 12:22:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kelV=G6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l4jpy-0000Dt-DR
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 12:22:18 +0000
Received: from mail-lj1-x22a.google.com (unknown [2a00:1450:4864:20::22a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81e38574-a40d-43c4-980a-51c5a4bafecd;
 Wed, 27 Jan 2021 12:22:17 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id a25so1858937ljn.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 04:22:17 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h9sm465064lfj.24.2021.01.27.04.22.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 04:22:15 -0800 (PST)
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
X-Inumbo-ID: 81e38574-a40d-43c4-980a-51c5a4bafecd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=m9t+itjT9/wzQxErG1N5o66C9Qic51I+Dt46qx5fArw=;
        b=IahbtPTNg5VapF+XPe39IwJ3xqVSXKXR7NQukKohA2rmcVcwOngufMr7BZ12d4UBbp
         XDEP8lddTTaHAtmW8YkHgVpoAypuLpfh1vFrjZmH4z+s9VgQaa6h0mZEnZmzsTnfdktY
         PV6zLQAbRtkN5PlFkt/pmZ47FW3P4NUGckSeu9Fw+kj/SqetKeatAX6ARsZ7JIfQzC5G
         oP+TABYvI65maJlSaszeTbUYp7lCAKQKNbX0VgGWNs1rKoCUrtSIptZJi/z1bKdl/rPS
         QQrMP6pZO4Q+V9tjxz6mvKOkUknyJAIc1J19awNPmRoI26o7Wo8+2esaV6KHEaleTcu3
         gWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=m9t+itjT9/wzQxErG1N5o66C9Qic51I+Dt46qx5fArw=;
        b=hEA9+HGxl6/tsE2+AFy2NUKcxpRf9xeAgqtqLPQNggA7suPEcK+I1BEYtwVFrV8FO6
         M0HNLhUn4npGL/8VSSVEqeYZ3uQhmwu1cnGjAjQdjTMrxY2hfQsrWMnYE2MyNIYceIsu
         DP7T+fsJ4iNIvKOQy9MXzoK/2RjdIw/nLv4gbviE1sH4wTxja+UWoiV5RJZbyly2lnNF
         S75eq7ALysbNPk3zV/WhhOxjrKMYV9bwAgdxWiVKozLiLKg53oFXUUMY4fCL5vbm6sFb
         g4RoZC/ObaA5NNevuBSYuS71C9HyD1WxTWOj8FjMrlLGfBRCJPtb9Dnlj9ay62v+sfjc
         mdgA==
X-Gm-Message-State: AOAM530wQU3NrOec3EAu+6RoUh3uoTtNaOhAa99xsT+QTuGQMftidmvY
	mj5zMmJe0irbW53yrGvfkwU=
X-Google-Smtp-Source: ABdhPJzlzxxMd6NbpOxat7xjbQQ3pn8YtPzwq3tfWKM08QsxO6ogee4jbtysi/rQvTnamcFPXabE6w==
X-Received: by 2002:a2e:9ed1:: with SMTP id h17mr5223020ljk.160.1611750136300;
        Wed, 27 Jan 2021 04:22:16 -0800 (PST)
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-15-git-send-email-olekstysh@gmail.com>
 <355e613a-3c9d-7978-62cd-a35df057e5cd@xen.org>
 <d54a9ef4-b707-1887-a7f7-b33c6f0f97d9@gmail.com>
 <06704224-bb57-c55e-a2ee-23032095e8ea@xen.org>
 <e2dcc876-291f-1244-933c-179f97a84e07@gmail.com>
 <57d95c18-5215-03e7-7849-73c9fe968e75@xen.org>
 <e0bc7f80-974e-945d-4605-173bd05302af@gmail.com>
 <9aa563c1-de53-cafc-f7e7-c3da49b6ef6e@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7d49becb-8774-5756-f2ed-ddba544231cc@gmail.com>
Date: Wed, 27 Jan 2021 14:22:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9aa563c1-de53-cafc-f7e7-c3da49b6ef6e@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 27.01.21 12:24, Jan Beulich wrote:

Hi Jan

> On 21.01.2021 09:50, Oleksandr wrote:
>> On 20.01.21 17:50, Julien Grall wrote:
>>> On 17/01/2021 18:52, Oleksandr wrote:
>>>> error2.txt - when add #include <public/hvm/dm_op.h> to xen/ioreq.h
>>> It looks like the error is happening in dm.c rather than xen/dm.h. Any
>>> reason to not include <public/hvm/dm_op.h> in dm.c directly?
>> Including it directly doesn't solve build issue.
>> If I am not mistaken in order to follow requirements how to include
>> headers (alphabetic order, public* should be included after xen* and
>> asm* ones, etc)
>> the dm.h gets included the first in dm.c, and dm_op.h gets included the
>> last. We can avoid build issue if we change inclusion order a bit,
>> what I mean is to include dm.h after hypercall.h at least (because
>> hypercall.h already includes dm_op.h). But this breaks the requirements
>> and is not way to go.
>> Now I am in doubt how to overcome this.
> First, violating the alphabetic ordering rule is perhaps less
> of a problem than putting seemingly stray #include-s anywhere.
> However, as soon as ordering starts mattering, this is
> indicative of problems with the headers: Either the (seemingly)
> too early included one lacks some #include-s, or you've run
> into a circular dependency. In the former case the needed
> #include-s should be added, and all ought to be fine. In the
> latter case, however, disentangling may be a significant
> effort, and hence it may be sensible and acceptable to instead
> use unusual ordering of #include-s in the one place where it
> matters (suitably justified in the description). Ideally such
> would come with a promise to try to sort this later on, when
> time is less constrained.
Thank you for the explanation. I think, I am facing the former case (too 
early included one lacks some #include-s),
actually both common/dm.c and arch/arm/dm.c suffer from that.
It works for me if I add the following to both files (violating the 
alphabetic ordering rule):

+#include <xen/types.h>
+#include <public/hvm/dm_op.h>
+
  #include <xen/dm.h>


So, if I got your point correctly, we could include these both headers 
by dm.h) Would it be appropriate (with suitable justification of course)?
I think, we could avoid including xen/sched.h by dm.h (need to recheck), 
just these two headers above.


>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


