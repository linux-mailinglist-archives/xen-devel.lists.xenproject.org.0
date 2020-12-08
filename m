Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB372D3031
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 17:50:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47603.84252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmgBS-00012O-Hl; Tue, 08 Dec 2020 16:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47603.84252; Tue, 08 Dec 2020 16:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmgBS-00011z-EO; Tue, 08 Dec 2020 16:49:50 +0000
Received: by outflank-mailman (input) for mailman id 47603;
 Tue, 08 Dec 2020 16:49:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KXXm=FM=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmgBR-00011u-9d
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 16:49:49 +0000
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6825d8ee-764f-4837-ad14-19bda939b590;
 Tue, 08 Dec 2020 16:49:48 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s11so11845898ljp.4
 for <xen-devel@lists.xenproject.org>; Tue, 08 Dec 2020 08:49:48 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n10sm1259603ljg.139.2020.12.08.08.49.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 08:49:46 -0800 (PST)
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
X-Inumbo-ID: 6825d8ee-764f-4837-ad14-19bda939b590
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NW1ig4hO7jgwy54JnuoHax4nhf8RYyzgMtiDQuWg8VY=;
        b=DKMt6pgpw161wYD0sqSCEZ58f5rHMEBITXp4bpr73qLGCrZHX5qCfI5IBzH/KzNE9l
         fughebjVQkIArf5uKAspgedJLOa2KeUczS47gyiUCNzOEwh+3o85eQ2CJL54oPbQ6lvo
         1r84r6DLAaFACX4dAJs5UfCt+6BXkh8+a3ozjnznk/Mv2gF7TOG86Mg6psL6g60X8dLi
         GbDSyDUaE9FummlO08s5jfolkEi6ikyHBTiG/IZos5lKSNEv4wOXXZ74/5sfXpmVhoVn
         w6OVA7SB0aKPq+E234eLzCuN1OMmkbPZgO1q2ri1IUNH8rTeE/79bztQLJvy5nItU8j7
         2AQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=NW1ig4hO7jgwy54JnuoHax4nhf8RYyzgMtiDQuWg8VY=;
        b=N5GCYHBjSSQ3LeddhsYUIKBBFSuvQV10w/aXW3JpV/nEEsUSO/GC7Vup8dfYTj5xvf
         VEWbYMMduIKpEomW2EhqwYzu8Cqi+nB6+oPK7W+bZfd3WY18cqmvALOS0VkOHKB06pbR
         bmzuaZPt6mSzm/DihC15Hyzl7OcZXEakOY36acjoD9VzK8TIOqVfGwL/LbLANwaz/muB
         nn455I5K04RtDpL9RgNxnjrhR++wrqBBXl1XKu2HY1bV8yLOvXUni+KZ/IWBHGQ9cy6p
         vH0PVND8zbz3Wlg1ueprifCtg4LrpbvNEpcn7JBgqs5HfTCYY35qPUl9Hde8ystOYvGz
         /b4A==
X-Gm-Message-State: AOAM5334v9jacafTwDbTESWqEtkFduYKTzKzfdRtm6Zf1F27sM9zBHAK
	bWGkBTzsg3Hl1hZMYTCxN1XnuJwPHMmrYw==
X-Google-Smtp-Source: ABdhPJyKXTWXrcLigOaVnRME3y7whjXqqsMKHnBJLVZdpn4c2xr+pO98rMtBIcGerZ0+Y4PST7yZ2g==
X-Received: by 2002:a2e:9dcd:: with SMTP id x13mr11177952ljj.147.1607446187249;
        Tue, 08 Dec 2020 08:49:47 -0800 (PST)
Subject: Re: [PATCH V3 20/23] xen/ioreq: Make x86's send_invalidate_req()
 common
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-21-git-send-email-olekstysh@gmail.com>
 <acb09993-40fc-2ab0-21b9-5dbe2f061554@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <efbac31b-1a9d-da16-ef60-372f10451f8e@gmail.com>
Date: Tue, 8 Dec 2020 18:49:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <acb09993-40fc-2ab0-21b9-5dbe2f061554@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 08.12.20 17:24, Jan Beulich wrote:

Hi Jan

> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -552,6 +552,8 @@ struct domain
>>           struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
>>           unsigned int            nr_servers;
>>       } ioreq_server;
>> +
>> +    bool mapcache_invalidate;
>>   #endif
>>   };
> While I can see reasons to put this inside the #ifdef here, I
> would suspect putting it in the hole next to the group of 5
> bools further up would be more efficient.

ok, will put (although it will increase the number of #ifdef)

-- 
Regards,

Oleksandr Tyshchenko


