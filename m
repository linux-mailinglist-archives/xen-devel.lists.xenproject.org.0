Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B9CA3C036
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 14:42:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892942.1301886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkkLL-0008EZ-CG; Wed, 19 Feb 2025 13:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892942.1301886; Wed, 19 Feb 2025 13:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkkLL-0008C2-7F; Wed, 19 Feb 2025 13:42:27 +0000
Received: by outflank-mailman (input) for mailman id 892942;
 Wed, 19 Feb 2025 13:42:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKsl=VK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tkkLK-0008Bs-8w
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 13:42:26 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 579ddac3-eec7-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 14:42:20 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43984e9cc90so5292665e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 05:42:20 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ccd3bsm17921905f8f.22.2025.02.19.05.42.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 05:42:18 -0800 (PST)
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
X-Inumbo-ID: 579ddac3-eec7-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739972540; x=1740577340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EtLt6jbizFS4+7otufxXD6vWUBjyL4ecaGwdU1T7/1A=;
        b=YppBt3OIGwQmlgVeHMUD/W6J1M10Npwa2dfTOOIsMZobitA5G92fMpQ1PTlkkRoE4G
         QceP/93md5Zr4H6Y+3UqCxItrW6xSraA8N1m11ewjAPsJAHueskB0GOryf8vd8lK4QHs
         92d94P+ib6c+o4W4WnPz5WmUsHCXVS579b0Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739972540; x=1740577340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtLt6jbizFS4+7otufxXD6vWUBjyL4ecaGwdU1T7/1A=;
        b=I4oRGXyFSY2hdJ6TmNvu2LirnirKc7y5XeRKCaM+Er5DL5wWx3ItKmayihnijuLvB2
         JA+fiZoYnU4TT7T71cnoeuzYnAbOroEQo6laSiIEsvhluwvm8z9vMJtEv+qRvnOSsM5B
         BubHDq5Pz77Kkrv47hzDhwLbibFCcqavgfgQ9UL84fqJlBgze5bsDInGXiCgRxWge1hq
         Ns7rSTPgRt8rE2dxSpC8I9+BKDPKaJ5FRumbBJoYxcgqKTTY3a0pTnGHHnqTmUTbfoFb
         cl5/RpxenHOTEO6qTvqgRyRzcxvSBOK0lfZlVc28dozbqYWRuuB3bGP8QAC5WIkU63l8
         c80g==
X-Forwarded-Encrypted: i=1; AJvYcCW7IXkH6LAVIYPeTqyyHKSOis83f8O6rRVzokZKOHgfsxUFaPHjhNTrA7ikzXSMZwQ/JWD25yFtXk4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKiINO3hB54ef1ghLkVZnQVjfTmCT7BaWdZqYvIS0QZDRpc+xg
	ANtRMNvpgtayZJo0IUnYvrhvT5Ragu9ubr8Ze6LcHJDxu9IoOYPO+LiUOSuTkVQ=
X-Gm-Gg: ASbGncsxlrD1iOrMMgmvW86vKiRgaSbtZUNH86Nw4cu1rIUsW/HIMswviam8C9JHwS0
	uFniSxbHca0eHBrAYKoXg4Qvp/EfN6gnjPtYtNOHpcNgwKf13zhwkSSrCefRAWSe9FYafOOA6N5
	Gci67wQN3CN6agk8KW6IoyQQHtlSGOJiKbzPHatgaU2cUObNqIX+F3MSMCW9LPhVWZpxAAy4Z+o
	WuiR7wlbxU6quRWnkccA0jrCTUxDKKj/AHY0kOyAvnJkGF6jxJxkQ1P+YDvYtZbmTTmPN+5DGt/
	xDeFrOF6ZTlvHgl65D8bhGhC4wodT9PSjD1axftisEMPRSlpa1ak2+E=
X-Google-Smtp-Source: AGHT+IEaxYky+XwXOrGwxReQmAQaVQlPW1+thTtol9ik/YnMagRVT24NfJpRXjRDVdFFyL+C/autYw==
X-Received: by 2002:a05:6000:1889:b0:38d:b12f:60d1 with SMTP id ffacd0b85a97d-38f57ea23c7mr3131439f8f.26.1739972539336;
        Wed, 19 Feb 2025 05:42:19 -0800 (PST)
Message-ID: <7be67cd9-704b-43d2-ba9b-90399c3fb36f@citrix.com>
Date: Wed, 19 Feb 2025 13:42:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Artem_Mygaiev@epam.com, jbeulich@suse.com,
 Luca.Fancellu@arm.com, roger.pau@citrix.com,
 marmarek@invisiblethingslab.com, anthony.perard@vates.tech
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <b3f7614b-3a2b-4f17-be23-aa69c9f8e065@citrix.com>
 <ba3a8d0c-bc05-4d62-9c56-fc77d5969070@gmail.com>
 <ded403ff-b12b-4794-bbad-f4726a132ada@citrix.com>
 <013ab6c2-65af-4dd7-8796-ac5178a7e600@gmail.com>
 <c16b3ae4-dc26-4e08-81ef-47b6ae4914fe@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c16b3ae4-dc26-4e08-81ef-47b6ae4914fe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/02/2025 1:19 pm, Oleksandr Andrushchenko wrote:
>
>
> On 19.02.25 14:51, Oleksandr Andrushchenko wrote:
>> Hello, Andrew!
>>
>> On 19.02.25 14:49, Andrew Cooper wrote:
>>> On 16/02/2025 5:11 pm, Oleksandr Andrushchenko wrote:
>>>> Hello, Roger!
>>>>
>>>> Please find the branch with all the conversions [1].
>>>> Unfortunately I cannot provide a branch as seen with
>>>> diff --ignore-all-space as such a patch will not simply apply.
>>>>
>>>> Stay safe,
>>>> Oleksandr Andrushchenko
>>>>
>>>> On 16.02.25 13:58, Andrew Cooper wrote:
>>>>> On 16/02/2025 10:21 am, Oleksandr Andrushchenko wrote:
>>>>>> There are two diff files which show what happens in case the same is
>>>>>> applied to the whole xen/drivers directory:
>>>>>> - first one is the result of the "git diff" command, 1.2M [3]
>>>>>> - the second one is for "git diff --ignire-all-space", 600K [4]
>>>>> Please can you format everything, and put it on a branch
>>>>> somewhere, so
>>>>> people can browse.
>>>>>
>>>>> ~Andrew
>>>> [1] https://github.com/andr2000/xen/tree/clang_ml_drivers_v002_diff
> force pushed to the same branch for all Xen

Thankyou.

~Andrew

