Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673B42D1A75
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 21:24:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46985.83194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmN37-0002gT-7M; Mon, 07 Dec 2020 20:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46985.83194; Mon, 07 Dec 2020 20:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmN37-0002g4-3u; Mon, 07 Dec 2020 20:23:57 +0000
Received: by outflank-mailman (input) for mailman id 46985;
 Mon, 07 Dec 2020 20:23:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=exIY=FL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmN35-0002fz-8l
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 20:23:55 +0000
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fbe4344-8812-452f-ab76-f557e40d9f4e;
 Mon, 07 Dec 2020 20:23:54 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y22so1655568ljn.9
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 12:23:54 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id e26sm3048339lfj.21.2020.12.07.12.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 12:23:51 -0800 (PST)
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
X-Inumbo-ID: 1fbe4344-8812-452f-ab76-f557e40d9f4e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=C1/GBRlh9ccv1IKSp+8HLv9M0+fWlJEJY01lCU5M4Zk=;
        b=Pd/qEYVRlcc5xxet2eemL5R5l8pRN5QyHcFl2UfNBs4LvPxgYVCyu7i9zYzmdM+QA8
         MWc94AkgJ+dFOGSjORphVIPG81J/1QzkrfRbd1hJAi3NbJT5oCH+HdRKHEXe/jpp+E2E
         O4pIag04zCq8eAV6aX3OlDSBfmpqc1xgmywKaDH3x1bubx9CZdOEzWQ8phERWnyOQ9E7
         mSU3G5fDCSCxuNSJ2glwz3W8owDwLgduSLM1jnsbXr0eIZ3lLIcRcav/u9NwTf/7VZNN
         OXMn76Mm4mDwd/3U6s5hN0KCtjFUmi8cOjsWrsI0ahV00ITNLQlrzz9GtnFStoRrF3eg
         UwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=C1/GBRlh9ccv1IKSp+8HLv9M0+fWlJEJY01lCU5M4Zk=;
        b=EElTXkYizhJEV8H67DhkC0vQmzWjd5be+egJoNTyjmZNOgg9YK+OD/CA/9ylRn/iZP
         R7/jlWwQtjHUlrCyMyND5U0uc0InHIJUKgj/2xC39T6T4kxMtn/t5ODlwUvZW88X8d3o
         6Ar0mT2gt567sqz2XmCUt9K2oDTmAOk7vyqgbsY6L6hWhZRQovKWo+yOwZFxaKQUNVV8
         LgrCOpskCuAQ7bfjEhWLMmcBkt/AVNFtWNpfiUI0+IjSjQLV9nbvH3ErzZhJz0lTOa/u
         RmFVFRgQvm36JR+vGN9kwVUr7QB3GAqlAu9J/x+ZXTpBqKyaisxWrDk59XdFPSJO/YRS
         PEoA==
X-Gm-Message-State: AOAM533HDHb3fW2w+5w3Odi25n55nL+8kNsKfzIzSBunjEpADut9O4I/
	m5GSHNo/l55EiNndIEiaiWTj7sr+rByL0Q==
X-Google-Smtp-Source: ABdhPJxftBqeGVHRAuKApX+C26T5++dOHXKDWOBBYWWpJg3g2a+AYkv5MOUwa9XxG6agbIHy9FNTfw==
X-Received: by 2002:a05:651c:503:: with SMTP id o3mr9022385ljp.253.1607372632707;
        Mon, 07 Dec 2020 12:23:52 -0800 (PST)
Subject: Re: [PATCH V3 09/23] xen/dm: Make x86's DM feature common
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-10-git-send-email-olekstysh@gmail.com>
 <00c3df9f-760d-bb3d-d1d6-7c7df7f0c17c@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <24191fca-78e7-3e6b-ff02-c06e8ae79f56@gmail.com>
Date: Mon, 7 Dec 2020 22:23:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <00c3df9f-760d-bb3d-d1d6-7c7df7f0c17c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.12.20 14:08, Jan Beulich wrote:

Hi Jan.

> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> As a lot of x86 code can be re-used on Arm later on, this patch
>> splits devicemodel support into common and arch specific parts.
>>
>> The common DM feature is supposed to be built with IOREQ_SERVER
>> option enabled (as well as the IOREQ feature), which is selected
>> for x86's config HVM for now.
>>
>> Also update XSM code a bit to let DM op be used on Arm.
>>
>> This support is going to be used on Arm to be able run device
>> emulator outside of Xen hypervisor.
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> Changes RFC -> V1:
>>     - update XSM, related changes were pulled from:
>>       [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for IOREQ/DM features
>>
>> Changes V1 -> V2:
>>     - update the author of a patch
>>     - update patch description
>>     - introduce xen/dm.h and move definitions here
>>
>> Changes V2 -> V3:
>>     - no changes
> And my concern regarding the common vs arch nesting also hasn't
> changed.


I am sorry, I might misread your comment, but I failed to see any 
obvious to me request(s) for changes.
I have just re-read previous discussion...
So the question about considering doing it the other way around (top 
level dm-op handling arch-specific
and call into e.g. ioreq_server_dm_op() for otherwise unhandled ops) is 
exactly a concern which I should have addressed?

-- 
Regards,

Oleksandr Tyshchenko


