Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AFD2D2D99
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 15:55:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47499.84043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmeO8-0005a8-89; Tue, 08 Dec 2020 14:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47499.84043; Tue, 08 Dec 2020 14:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmeO8-0005Zi-4S; Tue, 08 Dec 2020 14:54:48 +0000
Received: by outflank-mailman (input) for mailman id 47499;
 Tue, 08 Dec 2020 14:54:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KXXm=FM=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmeO6-0005Zb-BQ
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 14:54:46 +0000
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ce931cc-f0fa-49b9-bfc0-3956a563fd4b;
 Tue, 08 Dec 2020 14:54:45 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id m12so1900425lfo.7
 for <xen-devel@lists.xenproject.org>; Tue, 08 Dec 2020 06:54:45 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id o123sm722694lff.84.2020.12.08.06.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 06:54:43 -0800 (PST)
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
X-Inumbo-ID: 3ce931cc-f0fa-49b9-bfc0-3956a563fd4b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=hE6E8q75/HbTu5s7bfWpn41dJTfyrwHIeTndrmaxDHo=;
        b=ZMDkTgT717PXEkxSl+izAJH9utq1o4z8uWAKHaYb5hl1MVw5PyGFyr3tO6xWcRWW/z
         BrBD+0wFGsuAcJLUqY/y1jjfIeS7AZSmLWM9ZEHUp7+wp9IOHQm1CyM+VXkvcho94PG8
         Ca9EzW6NpiFQ/SDiBHSjbEWdA95KwM5GBJHX+/fBKjGYvzDv2tNBi2GFjebUyqQOb81B
         9VSvlaywFXhFhENZzltNn08LRS7BhcVcYH0nsZYtbhMKcwUlgO1K3qXzWIQR+0GLK3FW
         NXuObCwC2+cVq/wSzD4VoB9wT+lE3KsBsoH5mX9rUQGquE4gE3SE0sNPb4jPaU0bWJzH
         fFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=hE6E8q75/HbTu5s7bfWpn41dJTfyrwHIeTndrmaxDHo=;
        b=pGSl8XbT4piho3ReC2WZ/r5DWsER0lsiBzvStjohzazfkpgAJKWeLBxmPwIEAWgek5
         cCL87aF2A11WNmkkSiro0Q+uvFq1J4dMeADqwUGdbmPCkmmaRjbOjWh5yOdsP3ppsXPY
         6SYiylTWIaKHOuklczNpfSbPnodYGz9Sr/qMlZKHXolijTG6sTXpgb7LmbuN+3K3s/zo
         LGm5BYRxjRbMAZK8MMAAvowZNO6CY8/+g07jjp8FdcFUBaXVgPQszAObMAwccKp8Pc7G
         t5y1hA7FgQzkNPEpIXfsxuRb24Id4curI+yI2kA0kIwxdDsvuQrnfe7INW4wS1lzjfHz
         PC5g==
X-Gm-Message-State: AOAM532Kz46IKrE7eix7ueYV51pyYqrF/vC6zRmOTQ0ZRQtUw11gH//L
	Jv2pkFAQt9ChUh3GcEBY+pE1kvoiQG2l6Q==
X-Google-Smtp-Source: ABdhPJxA1Z2GlI0KleWLlDrb2kdosArQuygD8wHkYJbD+A72MhSznOels8QIBISPGf1DZzuMw2TpXQ==
X-Received: by 2002:a19:be0d:: with SMTP id o13mr447115lff.517.1607439283882;
        Tue, 08 Dec 2020 06:54:43 -0800 (PST)
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
 <24191fca-78e7-3e6b-ff02-c06e8ae79f56@gmail.com>
 <7c985117-2bb4-dd5b-53cf-e217e25b2e8e@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f7d06c56-7f76-9ba7-6797-ebd9cf133479@gmail.com>
Date: Tue, 8 Dec 2020 16:54:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7c985117-2bb4-dd5b-53cf-e217e25b2e8e@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 08.12.20 11:30, Jan Beulich wrote:

Hi Jan

> On 07.12.2020 21:23, Oleksandr wrote:
>> On 07.12.20 14:08, Jan Beulich wrote:
>>> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>>>> From: Julien Grall <julien.grall@arm.com>
>>>>
>>>> As a lot of x86 code can be re-used on Arm later on, this patch
>>>> splits devicemodel support into common and arch specific parts.
>>>>
>>>> The common DM feature is supposed to be built with IOREQ_SERVER
>>>> option enabled (as well as the IOREQ feature), which is selected
>>>> for x86's config HVM for now.
>>>>
>>>> Also update XSM code a bit to let DM op be used on Arm.
>>>>
>>>> This support is going to be used on Arm to be able run device
>>>> emulator outside of Xen hypervisor.
>>>>
>>>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> ---
>>>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>>>> "Add support for Guest IO forwarding to a device emulator"
>>>>
>>>> Changes RFC -> V1:
>>>>      - update XSM, related changes were pulled from:
>>>>        [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for IOREQ/DM features
>>>>
>>>> Changes V1 -> V2:
>>>>      - update the author of a patch
>>>>      - update patch description
>>>>      - introduce xen/dm.h and move definitions here
>>>>
>>>> Changes V2 -> V3:
>>>>      - no changes
>>> And my concern regarding the common vs arch nesting also hasn't
>>> changed.
>>
>> I am sorry, I might misread your comment, but I failed to see any
>> obvious to me request(s) for changes.
>> I have just re-read previous discussion...
>> So the question about considering doing it the other way around (top
>> level dm-op handling arch-specific
>> and call into e.g. ioreq_server_dm_op() for otherwise unhandled ops) is
>> exactly a concern which I should have addressed?
> Well, on v2 you replied you didn't consider the alternative. I would
> have expected that you would at least go through this consideration
> process, and see whether there are better reasons to stick with the
> apparently backwards arrangement than to change to the more
> conventional one. If there are such reasons, I would expect them to
> be called out in reply and perhaps also in the commit message; the
> latter because down the road more people may wonder why the more
> narrow / special set of cases gets handled at a higher layer than
> the wider set of remaining ones, and they would then be able to find
> an explanation without having to resort to searching through list
> archives.
Ah, will investigate. Sorry for not paying enough attention to it.
Yes, IOREQ (I mean "common") ops are 7 out of 18 right now. The 
subsequent patch is adding one more DM op - XEN_DMOP_set_irq_level.
There are several PCI related ops which might want to be common in the 
future (but I am not sure).


-- 
Regards,

Oleksandr Tyshchenko


