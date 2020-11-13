Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263982B1F41
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 16:53:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26717.55176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdbOM-0002I2-0P; Fri, 13 Nov 2020 15:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26717.55176; Fri, 13 Nov 2020 15:53:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdbOL-0002Hd-Sz; Fri, 13 Nov 2020 15:53:37 +0000
Received: by outflank-mailman (input) for mailman id 26717;
 Fri, 13 Nov 2020 15:53:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kdbOK-0002HY-Dj
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 15:53:36 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5bd413d-4755-4114-b90f-f7a1d23bc0e8;
 Fri, 13 Nov 2020 15:53:35 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 74so14503326lfo.5
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 07:53:35 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f9sm1595055lfa.187.2020.11.13.07.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 07:53:28 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kdbOK-0002HY-Dj
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 15:53:36 +0000
X-Inumbo-ID: d5bd413d-4755-4114-b90f-f7a1d23bc0e8
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d5bd413d-4755-4114-b90f-f7a1d23bc0e8;
	Fri, 13 Nov 2020 15:53:35 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 74so14503326lfo.5
        for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 07:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=wAmQ7hvO7oCPlSvUDNV0wFKLiIoXw4qlSqyYl9lvpEk=;
        b=o+jkUKDcYK+fJPRePEhnY56WU1qlN6GoYb9l4Cc2phXgQhgZNk3I7X0gGKSTLhzWh9
         ec/PId0QMLfH0DQgX/1+gT+A8vDrVYFcLvTMZi58deXLfZtTkiIyKOwKkofINUGCURxB
         5Q8eqOfVL9RcrGawILWUJjnOI5FFTUojB6osKeBhGDU6FHfRr9fXfU+Ia5edkN8+rrV1
         1AAsAFvqgoR7TdEwj4YED6ziDW5yaqa7oq6vSDXb57Q+5HKmpImATuXE5corRRzLU9R2
         gQCzOHuZ0ah7YRzF8dPXDQZsrUxigY2t12ByYYMJfESSt1k4vu1qBas75Cg3R+n6mb7R
         8Tgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=wAmQ7hvO7oCPlSvUDNV0wFKLiIoXw4qlSqyYl9lvpEk=;
        b=Z9jDv30vN1yuhxeTO44FB18l/oaLkwlVgS4ALSRn1UGOoQcADgsWIqp0ytjxCKRiN/
         IIXSru15el9nIr0bHUAliLG+pMzY6/U82TTWpkcyrOUk7v0o64Y7WYy7jonDqL3S6APD
         ksAUx/NruhgucSAoM2tSuiIL6ZocRI5d0e8kzARtdrYn6LUT2B2lHHT1QFMwAavTrOX8
         WhhO4Av9e8D5idYmdqzBe92BS2aiJddeNJpUepCJVwq8jbzOuz/af+HqNDzFP6zcQDNV
         ekki744Siern4vGJFHOUYCozariBcS2lquVt5UrJlZq5RW12TcajqDQDSyO6pwP0m6CP
         EmvQ==
X-Gm-Message-State: AOAM5329uOR7Y7MkVGW/wi4RCLynj2XsGicsyiMBHeF0PucjlkChHuYE
	hngXRPeh1sFM4jD5lxTtm/d4PL3A6rbTlQ==
X-Google-Smtp-Source: ABdhPJy/Pv65L6U3qFCnQcVQGplfVcijbVrMf/ugMAyMfNeDo7cSrpWXkiCbg/lXY62yBMmAWQqFXg==
X-Received: by 2002:a19:8396:: with SMTP id f144mr1087638lfd.444.1605282809084;
        Fri, 13 Nov 2020 07:53:29 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id f9sm1595055lfa.187.2020.11.13.07.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 07:53:28 -0800 (PST)
Subject: Re: [PATCH V2 12/23] xen/ioreq: Remove "hvm" prefixes from involved
 function names
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-13-git-send-email-olekstysh@gmail.com>
 <e3064b77-71c3-9d8d-2324-6839895101f4@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d3b6623c-683d-2845-78c3-a114193b0ce4@gmail.com>
Date: Fri, 13 Nov 2020 17:53:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e3064b77-71c3-9d8d-2324-6839895101f4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12.11.20 13:45, Jan Beulich wrote:

Hi Jan.

> On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch removes "hvm" prefixes and infixes from IOREQ
>> related function names in the common code.
> AT least some of the functions touched here would be nice to be
> moved to a more consistent new naming scheme right away, to
> avoid having to touch all the same places again. I guess ioreq
> server functions would be nice to all start with ioreq_server_
> and ioreq functions to all start with ioreq_. E.g. ioreq_send()
> and ioreq_server_select().

As it was initially discussed at patch #1, ok , I will prepare a list
of the proposed renaming so we could find a common ground I hope.
After that I will make required renaming.

-- 
Regards,

Oleksandr Tyshchenko


