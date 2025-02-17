Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87794A38D62
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 21:40:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890869.1299995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk7tq-0006fa-Eg; Mon, 17 Feb 2025 20:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890869.1299995; Mon, 17 Feb 2025 20:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk7tq-0006dk-CD; Mon, 17 Feb 2025 20:39:30 +0000
Received: by outflank-mailman (input) for mailman id 890869;
 Mon, 17 Feb 2025 20:39:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kh3E=VI=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1tk7to-0006de-FL
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 20:39:28 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47be18b9-ed6f-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 21:39:27 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-30a28bf1baaso14785181fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 12:39:27 -0800 (PST)
Received: from [192.168.0.110] ([91.123.151.154])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a2e03ef65sm5961551fa.73.2025.02.17.12.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 12:39:24 -0800 (PST)
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
X-Inumbo-ID: 47be18b9-ed6f-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739824767; x=1740429567; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wC05XpYJYtT/5DEkcyzW6eTIX7iKHT80GbRR8kS4Ibc=;
        b=WNf6B6kyCW0p/hdn/sFRzYVexi8mOC5jDWW3p5LqHvcGr/lgsPgDAE9dpM2zXdGXfK
         zPADtEL12mWjmB9rdUJx1p7QlhJ90R0tlWdWxuW8EWrB1fcboePT7lXPQbLHKmleKPmP
         V5ZprbYD1NIVdrFdNvlss8u1JustD6u7xqsTTOTztJNzyVoGOtk6CF5Ycr7HO1dNZwTv
         K0WAiSJ/faqq3BGbMYHZPCjxnYzKiuSdPHcGDLEWRrkfiZg6YC7SpCGK2sMkx3tb2Ww4
         az+8ThY2LOhgo+It8S08cvtONCC60ZSHrquZORj+7lt9YRIu2xKHVczG3M88qpT+rY7q
         DLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739824767; x=1740429567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wC05XpYJYtT/5DEkcyzW6eTIX7iKHT80GbRR8kS4Ibc=;
        b=H+uTld6tYOfI9XjCWDwFwLNoIfc0lI5L5QS3J4OuZ8TOYeit8CnG3iogVaBvKt//Fg
         L3pu8JgdFUZ+I0kpr6F6DfmpKXE73iCpxhP9zI0IG+gV3Ft7Bfv1l5gOpNAsrWwYki9J
         tMyr4tdUfA/D8kD8P+bSkxS01RgTjLzqgBT1aomB9zGbqPug91HZiNYq6aZkNT/tDIJ7
         B2MpGGnmCX/T/y36AR+Me/vC8eArqmntJP5Y59R2fcvgQVmGyv0TZAWf6RoKXkSz4YIv
         BFSWIsEA7eRvnP5ovjJ8mLuJXx/m3cWow5liUcX/HZofnGDe39AU9d3hyPmwH5XRmFVY
         yt1w==
X-Forwarded-Encrypted: i=1; AJvYcCX3jtVMKqhsWHdZnBnvyzdoCLIEYgdzaB3NEDgXUeZd+HrXMew/pqwc5NZGDoJ5iwVASZeppK9PMwY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKRkUu61Lw7ufKPG313ZLeGUIy1RYijrAyhn2rMfpPQZr54+Ch
	Y7yuF0y0o5UfKzbqrQPGXJ6REjiF9XFX+OlpX1+R+3CXb48nei4x
X-Gm-Gg: ASbGncuVVmBphhtD4CvUGvdyOlmHsMz53A7XydIVeWay3Nxt8t3PDJdJyheLfTDYztO
	ufhc1tf5yYGTJtrWdA7J4Jy5ngeL1La9gKklfkLeo60yXCCD47Ds7n6p+rpUzuO+fNwH5WR7Rgv
	2plYphSoCU4q6eTYkTg/Qnhsn3MbCHJ3G7xRuZ7OL2fc4M/3NG1pWuS/aZ1gsvgqKzL6ZJhubJz
	4dgFK1+QBh3IxNc8u3QpxSLk8UxPDyXvit0N3Nd/ksgFK0RzdUsNc9ySzGaAxbuUu03autdPR2V
	8Es2w3S4omQ9JKFr7EHM
X-Google-Smtp-Source: AGHT+IHr2wYmaOGSmUdZGyfbIDj/SpoVj8WoKdEWjkk9TUwGoOm4A3v5zfHfXNZ93ZKI3adzMe851g==
X-Received: by 2002:a2e:8890:0:b0:309:2653:5dc9 with SMTP id 38308e7fff4ca-30927aff12emr29445501fa.37.1739824766365;
        Mon, 17 Feb 2025 12:39:26 -0800 (PST)
Message-ID: <507b71a6-f72d-4414-9d18-c96d1e0f5e71@gmail.com>
Date: Mon, 17 Feb 2025 22:39:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/memory: Make resource_max_frames() to return 0 on
 unknown type
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250217102741.4122367-1-olekstysh@gmail.com>
 <24e6c348-a5c3-415e-a5b9-69d948eb15c2@citrix.com>
 <ab9ac9b5-2d2f-469a-83dc-304c880cbf55@gmail.com>
 <f3c0d480-e0cc-469d-8d7f-5e2402e48f8d@citrix.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <f3c0d480-e0cc-469d-8d7f-5e2402e48f8d@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 17.02.25 15:52, Andrew Cooper wrote:

Hello

> On 17/02/2025 1:11 pm, Oleksandr Tyshchenko wrote:
>>
>>
>> On 17.02.25 13:09, Andrew Cooper wrote:
>>
>>
>> Hello Andrew
>>
>>
>>> On 17/02/2025 10:27 am, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> This is actually what the caller acquire_resource() expects on any kind
>>>> of error (the comment on top of resource_max_frames() also suggests
>>>> that).
>>>
>>> :(
>>>
>>> So it broke somewhere between v3 and v8 of the original patch series,
>>> but I can't seem to find the intervening series on lore.
>>>
>>> Given the comment, I suspect I got inadvertently-reviewed into this bug.
>>>
>>>> Otherwise, the caller will treat -errno as a valid value and
>>>> propagate incorrect
>>>> nr_frames to the VM. As a possible consequence, a VM trying to query
>>>> a resource
>>>> size of an unknown type will get the success result from the
>>>> hypercall and obtain
>>>> nr_frames 4294967201.
>>>
>>> This is one of the few interfaces we have low level testing for.
>>>
>>> tools/tests/resource/test-resource.c
>>
>> yes
>>
>>>
>>> Please could you add a step looking for an invalid resource id and check
>>> you get 0 back?
>>
>>
>>
>> Sure. I was thinking where to add this step and propose the following
>> change. I will send a formal patch once I find a way how to easily
>> test this change.
>>
> 
> https://lore.kernel.org/xen-devel/cover.36ee649a8537af1a5fb5b3c5b7ffc0d8a1369969.1739496480.git-series.marmarek@invisiblethingslab.com
> 
> 
> wires these tests up in Gitlab CI.


thanks for the pointer.

I didn't manage to run as is. But I managed to craft something suitable 
for running just test-resource based on these patches.

> 
>>
>>
>>  From 872565da55b7e87e1664714bb1b3ee84245db4a5 Mon Sep 17 00:00:00 2001
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Date: Mon, 17 Feb 2025 14:16:50 +0200
>> Subject: [PATCH] tests/resource: Verify that Xen can deal with invalid
>>   resource type
>>
>> The sign of the presence of a corresponding bugfix is an error
>> returned on querying the size of an unknown for Xen resource type.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>>   tools/tests/resource/test-resource.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/tools/tests/resource/test-resource.c
>> b/tools/tests/resource/test-resource.c
>> index 1b10be16a6..197477c3f3 100644
>> --- a/tools/tests/resource/test-resource.c
>> +++ b/tools/tests/resource/test-resource.c
>> @@ -123,6 +123,22 @@ static void test_gnttab(uint32_t domid, unsigned
>> int nr_frames,
>>           fail("    Fail: Managed to map gnttab v2 status frames in v1
>> mode\n");
>>           xenforeignmemory_unmap_resource(fh, res);
>>       }
>> +
>> +    /*
>> +     * While at it, verify that an attempt to query the size of an
>> unknown
>> +     * for Xen resource type fails. Use the highest possible value
>> for variable
> 
> s/for //, I think?
> 
>> +     * of uint16_t type.
>> +     */
>> +    rc = xenforeignmemory_resource_size(
>> +        fh, domid, 65535,
>> +        XENMEM_resource_grant_table_id_shared, &size);
> 
> XENMEM_resource_grant_table_id_shared should probably be 0 here.
> 
> But, I'd suggest choosing 3 (literal 3, not some kind of constant from
> the headers) for the major resource number.  That has the side effect of
> forcing people to extend this test case when they add a new resource type.
> 
>> +
>> +    /*
>> +     * Success here indicates that Xen is missing the bugfix to make
>> size
>> +     * requests return an error on an invalid resource type.
>> +     */
>> +    if ( !rc )
>> +        fail("    Fail: Expected error on an invalid resource type,
>> got success\n");
> 
> I'd phrase this differently.  "Check that Xen rejected the resource type."
> 
> "avoid this bug we already fixed" won't be useful to people reading this
> code in the future.  It's in the commit message.


Thanks for the preliminary review, I agree with the comments.

I will send a patch for the test-resource soon.

> 
> ~Andrew

