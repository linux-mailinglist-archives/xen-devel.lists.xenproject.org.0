Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4E2273F16
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 12:00:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKf4k-0005Ln-DY; Tue, 22 Sep 2020 09:59:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cWTz=C7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kKf4j-0005Li-1V
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 09:59:05 +0000
X-Inumbo-ID: 8abf055e-cfa6-4e56-8f83-1c26e6a2ed81
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8abf055e-cfa6-4e56-8f83-1c26e6a2ed81;
 Tue, 22 Sep 2020 09:59:03 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b22so17303454lfs.13
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2020 02:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ATm+Xt2TB6izqM4H91/fBvsNIvoyjZ1nNRpZ3pwzCGU=;
 b=anNpGLDVAml01SW4VAmU/jKAHiAxtwd3FX3ttOZgbeW2gh/YUVBS+Rl45nj9n3bUWL
 d9mI2YjtlqPIQviY8EXZQp2GfhzhEyS2jAasFFpt7OJD+dRM9YG4P57APo5CUAGC1M2P
 pNYGxqoIFA1sioNj5WrYH8/E9DQ/qVAatnIPFErDZFmP3cm2oA9FAYeOYdiwxI373n9g
 z6rWkYAt4qbX5paTgFl8ps8QCYGReTfS6VO2KvG3HaVimQrh+UVUkRkie8uQn5kHF07D
 DHK230oRmysregSqWRxqzJvjKjH3pFwh9D+OWW2kATx698gGAMBOhkywc7NU3wS/WxBr
 vMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ATm+Xt2TB6izqM4H91/fBvsNIvoyjZ1nNRpZ3pwzCGU=;
 b=Cude48CWHLgsStDNiZ8ChJD6eGAd4N4s7wC6XzsYBDOzdBcDGlripiA/0fdAPMEmI/
 Mx0eqUPm4Xh+w/VowYdfeKLYIgei/aZUqhhbvFirGKl6k0RMDIZuwKatm3NIDAR8pENl
 hdUw1TcBOYjGrG4h+K5r44OgizQUGhLC+dh7os1MvdooWHZN5o86BWE+FQ45t7JUqGUy
 kkHskuv2XtUIUk8u+e4cW5FSXJg93lG0bH4SrRursYw06iG8tbBpZr54RGXC0YSnp5FK
 0mmjzMRH4AnpumozM/UqvA5Cs9hGLlM5Bac1k8QYDv1ltMwt6rfdfJg7UOdl5BNxWeaJ
 ax4Q==
X-Gm-Message-State: AOAM532+1rJi6ANMcZIa18mBYu581/jWj63D5/p+ToYTgDpEfaOyXIZi
 322CTsuUV4+S6+wSCkeFtw0=
X-Google-Smtp-Source: ABdhPJz8bfye41WEhIX9/xqd6YYm5XjcAztO5XSkZbx7P7sB9hVbj/qA+k0anlgMlRBA4tPUQ+Ovng==
X-Received: by 2002:a19:e03:: with SMTP id 3mr1246760lfo.488.1600768742279;
 Tue, 22 Sep 2020 02:59:02 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id e14sm3630115ljp.15.2020.09.22.02.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 02:59:01 -0700 (PDT)
Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-3-git-send-email-olekstysh@gmail.com>
 <7de88222-1a45-7bff-0b45-95f76b4ec019@suse.com>
 <51856cdc-54b4-3d39-bd7b-1b6ac3fc1736@gmail.com>
 <bf128337-699f-5942-b387-aa896000700c@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <97b48017-55e1-8464-031a-b54dd8e4e474@gmail.com>
Date: Tue, 22 Sep 2020 12:58:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bf128337-699f-5942-b387-aa896000700c@suse.com>
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


On 22.09.20 09:33, Jan Beulich wrote:

Hi Jan

> On 21.09.2020 21:02, Oleksandr wrote:
>> On 14.09.20 17:17, Jan Beulich wrote:
>>> On 10.09.2020 22:21, Oleksandr Tyshchenko wrote:
>>>> --- /dev/null
>>>> +++ b/xen/include/xen/ioreq.h
>>>> @@ -0,0 +1,82 @@
>>>> +/*
>>>> + * ioreq.h: Hardware virtual machine assist interface definitions.
>>>> + *
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
>>>> +#ifndef __IOREQ_H__
>>>> +#define __IOREQ_H__
>>> __XEN_IOREQ_H__ please.
>> ok
>>
>>
>>>> +#include <xen/sched.h>
>>>> +
>>>> +#include <asm/hvm/ioreq.h>
>>> Is this include really needed here (i.e. by the code further down in
>>> the file, and hence by everyone including this header), or rather
>>> just in a few specific .c files?
>> I think, just in few specific .c files. Which are x86/hvm/ioreq.c and
>> common/ioreq.c now and several other files later on (x86/hvm/dm.c,
>> arm/io.c, etc)
>> Shall I include that header in these files instead?
> Yes please, and please take this as a common guideline. While
> private headers are often used to include things needed by all
> of the (typically few) users of the header, non-private ones
> shouldn't create unnecessary dependencies on other headers. As
> you've said further up - you did run into hard to resolve
> header dependencies yourself, and the practice of including
> headers without strict need is one of the reasons of such
> problems.

Got it.


>
>>>> +#define GET_IOREQ_SERVER(d, id) \
>>>> +    (d)->arch.hvm.ioreq_server.server[id]
>>> arch.hvm.* feels like a layering violation when used in this header.
>> Got it. The only reason why GET_IOREQ_SERVER is here is inline
>> get_ioreq_server(). I will make it non-inline and move both to
>> common/ioreq.c.
> Which won't make the layering violation go away. It's still
> common rather than per-arch code then. As suggested elsewhere,
> I think the whole ioreq_server struct wants to move into
> struct domain itself, perhaps inside a new #ifdef (iirc one of
> the patches introduces a suitable Kconfig option).
Well, your advise regarding ioreq_server sounds reasonable, but the 
common ioreq.c
still will have other *arch.hvm.* for both vcpu and domain. So looks 
like other involved structs should be moved
into *common* struct domain/vcpu itself, correct? Some of them could be 
moved easily since contain the same fields (arch.hvm.ioreq_gfn),
but some of them couldn't and seems to require to pull a lot of changes 
to the Xen code (arch.hvm.params, arch.hvm.hvm_io), I am afraid.
Or I missed something?


> This goes
> alongside my suggestion to drop the "hvm" prefixes and infixes
> from involved function names.
Well, I assume this request as well as the request above should be 
addressed in the follow-up patches, as we want to keep the code movement 
in current patch as (almost) verbatim copy,
Am I correct?

-- 
Regards,

Oleksandr Tyshchenko


