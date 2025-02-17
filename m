Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F38B6A38E87
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 23:06:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890922.1300045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk9Fj-0003BT-Ez; Mon, 17 Feb 2025 22:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890922.1300045; Mon, 17 Feb 2025 22:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk9Fj-000395-C5; Mon, 17 Feb 2025 22:06:11 +0000
Received: by outflank-mailman (input) for mailman id 890922;
 Mon, 17 Feb 2025 22:06:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kh3E=VI=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1tk9Fh-00038u-AE
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 22:06:09 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63bbd9f1-ed7b-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 23:06:08 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-30a2594435dso17024121fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 14:06:08 -0800 (PST)
Received: from [192.168.0.110] ([91.123.151.154])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54527244fd7sm1426183e87.12.2025.02.17.14.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 14:06:05 -0800 (PST)
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
X-Inumbo-ID: 63bbd9f1-ed7b-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739829968; x=1740434768; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J81qOjoLKbtqoeO+zdP5fAAu6ABuL3Q7wlxnXbE8ZEw=;
        b=UK+LmJPxr7KLj/vuMEV5Np2JlLS2qoUmkhIFFe9nJGVwQ9LzhvK/hCCAy7/Nm2hk1v
         SErhRLZWn6T88redUH5LxhTkExKen620Ht0R2oOEplhtfU3J/LUPPUNhlF8xrB181PvX
         Hv4G1liZNbseReGtwiJ+ZVgzXzg1KL0BnmnmTvg8diW/7GksWzAdT2mIkIkyh2HZR8xl
         qS+eapkBpwr6MevR2L06xdLZkoQ1/XM6iYl0V/sbqefR7v7g/EiDAawQ6u5gxH7V1/TS
         t1qiXry5/hxuJLt5VMgsE7Yt8XZZWUywMYnW6vt4+cmiRPMwd5o9FUHijcHP9sO2keMx
         EunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739829968; x=1740434768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J81qOjoLKbtqoeO+zdP5fAAu6ABuL3Q7wlxnXbE8ZEw=;
        b=nNTtjV0O0mxAlSlQLf/J/8QJISP9YRK4UzF0DoHqPIGhWNFQvrweKekxMowsa9JpSI
         WmnYStfzO7JHhV0MNphskytYVDUf/t9Ocb9oNZcU1lo1a/O9jdszc0PNHl/ikFdAzXWt
         9KwOS+yGkE4tAXpIEc5FWdP9byfh/VFS5dAdewynpvEJ0qHkxbgAFNvHEksL/I9v/AYV
         l4NuvZKEokvpaOGfwgIFHAy4ACTJdu1RLcc+u4KJm3ho9IBqVa9/6GiIn0ESyy5wfulv
         dSWdHq3h1YO9aeDm6iUXFT5gSvKgOymP/2B6iOVdLims20KBbykFRNJzhWKUnNEfrTDI
         EtZw==
X-Forwarded-Encrypted: i=1; AJvYcCUqiMbbR/Wubed5GfMOLbzbiU5V96S2sILR74jnvXk4ki4eUSlnYCNLVylhun5DjqouQLnkADNMbks=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQSPFVL1Oz1zPEzUSYycc7s7K6q6rPelk2vjFaUytfNO5MuQOQ
	i6YJNeMW/tE+vVX5kXlOnZ2Dx5l0krJ0tq56vBNEYTitS7gA4QAL
X-Gm-Gg: ASbGncv2hpJPzO9TojDVz7Clq25OX0PFZe5+9KrvW6Q7jYcc3H1hUi6Pty6wlSc0wB2
	IYhQ7sEVaqiqwJEyMVdI+mcUug20xKaegPzwXCYpabb83UoFC3NWuK5GwkeF8QxlirWRQowM4iX
	rpXIbZbTKzSEfr4AX3A4cv5rjdQoSasKzO+yOYoQdQFD/IxiJbNgaxw8ppxUGF0gw03b/LQrHqP
	vQ2LXB/7wuxzgVwC8zdffXiBqhGymXOGAh+l5Q+j9vL+aOzAis4GO/yQuEA/VlzpRjh/JKlhmzi
	SaZwYZ7sV1GDreM0fZM+
X-Google-Smtp-Source: AGHT+IHcohTI53AyPDAu7hCchHBvYsYgdCD2aVfm67xHKYSII4sVQ3up3rcDrmTZIgi+OZ5tX8Mtvg==
X-Received: by 2002:a05:6512:280b:b0:545:6a2:e59 with SMTP id 2adb3069b0e04-5453035a0dbmr3230790e87.18.1739829967321;
        Mon, 17 Feb 2025 14:06:07 -0800 (PST)
Message-ID: <0acce644-cc28-4a97-9219-737a9722a596@gmail.com>
Date: Tue, 18 Feb 2025 00:06:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/resource: Verify that Xen can deal with invalid
 resource type
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250217204822.136437-1-olekstysh@gmail.com>
 <3fe4cb88-4fcc-4860-af6e-75907f72f282@citrix.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <3fe4cb88-4fcc-4860-af6e-75907f72f282@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 17.02.25 23:09, Andrew Cooper wrote:

Hello.

> On 17/02/2025 8:48 pm, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The sign of the presence of a corresponding bugfix is an error
>> returned on querying the size of an unknown for Xen resource type.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> Refer https://patchew.org/Xen/20250217102741.4122367-1-olekstysh@gmail.com/
>> Current patch should go in with Xen fix from the link above.
>>
>> 1. w/ fix in Xen:
>>
>> + ./tests/resource/test-resource
>> XENMEM_acquire_resource tests
>> Test x86 PV
>>    Created d1
>>    Test grant table
>> (XEN) [    8.702293] common/grant_table.c:1909:d0v1 Expanding d1 grant table from 1 to 32 frames
>> (XEN) [    8.704499] common/grant_table.c:1909:d0v1 Expanding d1 grant table from 32 to 40 frames
>> Test x86 PVH
>>    Created d2
>>    Test grant table
>> (XEN) [    8.717210] common/grant_table.c:1909:d0v1 Expanding d2 grant table from 1 to 32 frames
>> (XEN) [    8.719477] common/grant_table.c:1909:d0v1 Expanding d2 grant table from 32 to 40 frames
>>   [ ok ]
>>   [ ok ]
>> Welcome to Alpine Linux 3.18
>> Kernel 6.1.19 on an x86_64 (/dev/hvc0)
>>
>> 2. w/o fix in Xen:
>>
>> + ./tests/resource/test-resource
>> XENMEM_acquire_resource tests
>> Test x86 PV(XEN) [    9.839691] common/grant_table.c:1909:d0v0 Expanding d0 grant table from 1 to 2 frames
>>    Created d1
>>    Test grant table
>> (XEN) [    9.846621] common/grant_table.c:1909:d0v1 Expanding d1 grant table from 1 to 32 frames
>> (XEN) [    9.848796] common/grant_table.c:1909:d0v1 Expanding d1 grant table from 32 to 40 frames
>>      Fail: Expected error on an invalid resource type, got success
>> Test x86 PVH
>>    Created d2
>>    Test grant table
>> (XEN) [    9.865235] common/grant_table.c:1909:d0v1 Expanding d2 grant table from 1 to 32 frames
>> (XEN) [    9.867403] common/grant_table.c:1909:d0v1 Expanding d2 grant table from 32 to 40 frames
>>      Fail: Expected error on an invalid resource type, got success
>>   *   Execution of "/etc/local.d/xen.start" failed.
>>   [ !! ]
>>   [ !! ]
>> Welcome to Alpine Linux 3.18
>> Kernel 6.1.19 on an x86_64 (/dev/hvc0)
>> ---
>> ---
>>   tools/tests/resource/test-resource.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
>> index 1b10be16a6..3f5479cf78 100644
>> --- a/tools/tests/resource/test-resource.c
>> +++ b/tools/tests/resource/test-resource.c
>> @@ -123,6 +123,17 @@ static void test_gnttab(uint32_t domid, unsigned int nr_frames,
>>           fail("    Fail: Managed to map gnttab v2 status frames in v1 mode\n");
>>           xenforeignmemory_unmap_resource(fh, res);
>>       }
>> +
>> +    /*
>> +     * While at it, verify that an attempt to query the size of an unknown
>> +     * for Xen resource type fails.
> 
> "If this check starts failing, you've find the right place to test your
> addition to the Acquire Resource infrastructure."
> 
> Or something suitable.  There needs to be a hint of why 3 was picked
> here, and part of this sentence will show up in the context of the patch
> bumping 3 to 4, which also helps remind reviewers to ask if a change
> isn't somewhere in the submitted series.
> 
> Anyway, LGTM now.

Thanks

> 
> Personally, I'd merge this into the bugfix patch.  This improved test
> wants backporting along with the fix, and the end result is still only 3
> hunks.
> 
> Then, I'd suggest posting the combined result for-4.20 (cc Oleksii).
> It's not a major bug, but it's also a very simple and low risk fix too.
> 
> ~Andrew
> 
>> +     */
>> +    rc = xenforeignmemory_resource_size(
>> +        fh, domid, 3, 0, &size);
> 
> P.S.  Now it's simple, fold this back into 1 line.  It causes an extra
> line of the comment to be visible in context.

I agree with the comments.


