Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538EA30757D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 13:07:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76974.139173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l565K-0006tk-OZ; Thu, 28 Jan 2021 12:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76974.139173; Thu, 28 Jan 2021 12:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l565K-0006tL-LS; Thu, 28 Jan 2021 12:07:38 +0000
Received: by outflank-mailman (input) for mailman id 76974;
 Thu, 28 Jan 2021 12:07:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tEu6=G7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l565J-0006tG-4t
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 12:07:37 +0000
Received: from mail-lj1-x229.google.com (unknown [2a00:1450:4864:20::229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a709830-bd86-4c30-be86-6d519f6396c3;
 Thu, 28 Jan 2021 12:07:36 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id f11so5999959ljm.8
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 04:07:36 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id e22sm1962472ljg.78.2021.01.28.04.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 04:07:03 -0800 (PST)
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
X-Inumbo-ID: 4a709830-bd86-4c30-be86-6d519f6396c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vzs07POZkyi+yedUnli2x7lLx8fPZ+Vn+tqEfLBwqj8=;
        b=TgjQvXe12wyIIcBXVizUdrlnMZIFXjOJTRwNj3sdHTSYrQRHdMrt1KdSeuh62v6pla
         L1meG8e9hlkJ+UXp36HWjNsceLtY4nKn2KkjiNjpDF1Avg2dQuA0127ylgXBVuLmepHu
         A6z/hQe9qQnDVIz0pZJ851xgfWant+2k6D5SgJMrt6aDeqC1g0V+34GYR1lHyaG10pwW
         DRso6Yn3aF7jORFO9NKtNxt1BkkRkUxOXn11kF9bnJ0PFJ2TYO990G7f5hCwUzyfvpSM
         J6FrQSqS10EDhGKOUjQe0ryBeaKkuL3yLG7U9ezRtByGoQVJVCA0Wu1yYKYVL+3qNR1T
         CDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vzs07POZkyi+yedUnli2x7lLx8fPZ+Vn+tqEfLBwqj8=;
        b=L8gtJOn8TjGzlDlvH69NoBl/D5P6pqfDwEd8BjvkBpKvAadBYfJh92icQW48TfpJ4N
         OVOSOBlg2cU46MVIqsoihBLUN/hskjTbheh4b0SYg+cy1GI4HTRYr3TS92XuI0gmKaHU
         sAeytwoqax29PvnQrqfQFZzTxf11oft4voDOoRwo685Q0jr5jME+nnySgbxZYhrCSXcF
         aJrR9WIKO2n4OoTJPa2filGGnNTJv0sTIUnlk7EXJzN1fsi7k+sWkU4bpGYao4LJ/A+I
         as9k4hLuXzVaSmvb1UXa0o6bxr8eNc75ONS+lanz6PPcwU46SSJycDZ6fZfFaadxsPVX
         uHHw==
X-Gm-Message-State: AOAM532GLQa1kKJy1wFsor7gMDevtE1tT+4O6LERyTQSrtShtfHrLa1o
	HigYyps2LTRiXnfH/eSUOv3jg8ig7Qdpew==
X-Google-Smtp-Source: ABdhPJxvCvYyj1+sR4HWZnxzy3c5CYBgazRMo4C4UQ45mhefJGmo01XHbrMF4Sha97KEgylkF3Q/hQ==
X-Received: by 2002:a05:651c:113c:: with SMTP id e28mr8068039ljo.356.1611835654862;
        Thu, 28 Jan 2021 04:07:34 -0800 (PST)
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <19fa20ec-739b-250a-19f5-c4cbafd632fa@gmail.com>
Date: Thu, 28 Jan 2021 14:06:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d83c0736-c5cb-23e1-1cb3-fefe6907f091@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 28.01.21 12:52, Jan Beulich wrote:

Hi Jan

> On 25.01.2021 20:08, Oleksandr Tyshchenko wrote:
>> --- /dev/null
>> +++ b/xen/include/xen/dm.h
>> @@ -0,0 +1,41 @@
>> +/*
>> + * Copyright (c) 2016 Citrix Systems Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along with
>> + * this program; If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#ifndef __XEN_DM_H__
>> +#define __XEN_DM_H__
>> +
>> +#include <xen/sched.h>
>> +
>> +struct dmop_args {
>> +    domid_t domid;
>> +    unsigned int nr_bufs;
>> +    /* Reserve enough buf elements for all current hypercalls. */
>> +    struct xen_dm_op_buf buf[2];
> So this is then the patch where the public header needs including,
> to satisfy this use of a struct declared there independent of what
> xen/sched.h includes. In fact public/xen.h needs including here
> as well, I think, for domid_t. Otoh I can't see why you include
> xen/sched.h.

Yes, xen/sched.h indeed doesn't need to be included here, I mentioned 
that we could just replace

it by xen/types.h (this is the minimum what we need here I think). As I 
understand public/xen.h is already included by public/hvm/dm_op.h...


>
> My previously given ack applies only with this properly sorted.

Got it, sure.



>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


