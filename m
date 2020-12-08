Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1627B2D304F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 17:57:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47609.84264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmgIB-0001zi-A7; Tue, 08 Dec 2020 16:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47609.84264; Tue, 08 Dec 2020 16:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmgIB-0001zJ-6X; Tue, 08 Dec 2020 16:56:47 +0000
Received: by outflank-mailman (input) for mailman id 47609;
 Tue, 08 Dec 2020 16:56:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KXXm=FM=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmgIA-0001zE-82
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 16:56:46 +0000
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 649081aa-017a-46f5-9b1c-2e9a740de779;
 Tue, 08 Dec 2020 16:56:45 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a1so19248764ljq.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Dec 2020 08:56:45 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t30sm490478lft.266.2020.12.08.08.56.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 08:56:43 -0800 (PST)
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
X-Inumbo-ID: 649081aa-017a-46f5-9b1c-2e9a740de779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Yucp48b98YYkkh285rGvs6t+fiwz8/XBk1X/+qcHqoA=;
        b=krjHIFexf97C6Ohi+e3vSA9kbyI8AnlrAepw+5V4a/UWj/CfiIn0pKR86arCbT59xy
         JTvZelpgMrjjtz+I9+Sbs5ZoWoQ1nyy6GUQzgKZbq1++5exLq4PjJfjDQ43Y5FEbD+SZ
         rvrWdqzdGObORNgdwUFVCeCgFgIbJiiRXJ3+TkDRktRbxUn8szM/plrT3EGpFD9iO9rS
         CFsgfDdJtpMiMIQ++ipwifS97c0dJugIjf+V4/noSbwTD3brcWDWYkg+STtmnzGc4jPF
         9TLGNJcro/LyAqvZ5JSmPdxNqom49J+8aG+Ua+MrblEMx5RBa8V4TzOS8fEeMo5av7zJ
         M5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Yucp48b98YYkkh285rGvs6t+fiwz8/XBk1X/+qcHqoA=;
        b=oIH5f2uFqA/hn0RE6BJ4n+aEd59U7dS0Nd5x/6kzKCNrhBXm0Rc19+uj0/b6gW0ykB
         ggvfCMNHnK3+Cv2LFf05kJG6jLsVmxpRxTE8ewn4DUznmqHny9rp24BT4ETRVYrwsNZ8
         1l/cKqFi6R+aIv5Tx2HJUD+UJd+vEKg9ESsncVGbaw0J5Sj7W3dB2r9L9V5jVTjI/vks
         8zu6hW1m3sBdn9JEc/Oe6oP/erWCuq+WTfaSFuu8bFNPXOLkKBkF90CdCsj1TgNmh0Wg
         WQJjjXYCjM8b9RPaJKVIJTXqsNRfkW/LcRHl70b4EunfPI6sWYKWxBhoxtxm502F9yij
         RxKA==
X-Gm-Message-State: AOAM532KuO9KtxU5S1FMszhrGi/Hi96keq++5Vsk/8yxRIh4EhM9s8iL
	J0gMaeilYibs9NgJRgg9hYBbr9uQeG7kww==
X-Google-Smtp-Source: ABdhPJxgbgiB2THHpUyQfP69rIMiMJfgYSOvA7/js4UeJcsOjRnsNu4zpESYg2auOrKZEFAbGsSt2Q==
X-Received: by 2002:a2e:2284:: with SMTP id i126mr6375905lji.93.1607446604110;
        Tue, 08 Dec 2020 08:56:44 -0800 (PST)
Subject: Re: [PATCH V3 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
From: Oleksandr <olekstysh@gmail.com>
To: Paul Durrant <paul@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-18-git-send-email-olekstysh@gmail.com>
 <3bb4c3b5-a46a-ba31-292f-5c6ba49fa9be@suse.com>
 <6026b7f3-ae6e-f98f-be65-27d7f729a37f@gmail.com>
Message-ID: <18bfd9b1-3e6a-8119-efd0-c82ad7ae681d@gmail.com>
Date: Tue, 8 Dec 2020 18:56:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6026b7f3-ae6e-f98f-be65-27d7f729a37f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hi Paul.


On 08.12.20 17:33, Oleksandr wrote:
>
> On 08.12.20 17:11, Jan Beulich wrote:
>
> Hi Jan
>
>> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>>> --- a/xen/include/xen/ioreq.h
>>> +++ b/xen/include/xen/ioreq.h
>>> @@ -55,6 +55,20 @@ struct ioreq_server {
>>>       uint8_t                bufioreq_handling;
>>>   };
>>>   +/*
>>> + * This should only be used when d == current->domain and it's not 
>>> paused,
>> Is the "not paused" part really relevant here? Besides it being rare
>> that the current domain would be paused (if so, it's in the process
>> of having all its vCPU-s scheduled out), does this matter at all?do 
>> any extra actionsdo any extra actions
>
> No, it isn't relevant, I will drop it.
>
>
>>
>> Apart from this the patch looks okay to me, but I'm not sure it
>> addresses Paul's concerns. Iirc he had suggested to switch back to
>> a list if doing a swipe over the entire array is too expensive in
>> this specific case.
> We would like to avoid to do any extra actions in 
> leave_hypervisor_to_guest() if possible.
> But not only there, the logic whether we check/set 
> mapcache_invalidation variable could be avoided if a domain doesn't 
> use IOREQ server...


Are you OK with this patch (common part of it)?


-- 
Regards,

Oleksandr Tyshchenko


