Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6145D9BF972
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 23:47:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831391.1246683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8onL-0003AY-0k; Wed, 06 Nov 2024 22:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831391.1246683; Wed, 06 Nov 2024 22:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8onK-00038b-UP; Wed, 06 Nov 2024 22:46:34 +0000
Received: by outflank-mailman (input) for mailman id 831391;
 Wed, 06 Nov 2024 22:46:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNbQ=SB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t8onI-00038V-PL
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 22:46:32 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4bd067a-9c90-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 23:46:27 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4316a44d1bbso2956315e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 14:46:27 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6b2d13sm37631225e9.12.2024.11.06.14.46.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 14:46:25 -0800 (PST)
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
X-Inumbo-ID: f4bd067a-9c90-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzIiLCJoZWxvIjoibWFpbC13bTEteDMzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY0YmQwNjdhLTljOTAtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTMzMTg3LjE0ODg4Miwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730933186; x=1731537986; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5WjcH9LsZd4f+cNUlGoEXrtphxMziOEhEaYMGYoVdBk=;
        b=OXtBGypGcp5f0CZUJCjcIiQH0piejnRxHru9sfS0HX58nr7Us+NhITqL8wgmwsg3zJ
         ykBV6UbRBJFgx/N2NSU+BMIz2KkIYWjieH+TYtQh8Wy4WjTuSWzvcUNT0qRg7zaLgcOE
         AJ1riaaFY2XXL5xsUAEJB/CZm7/u92OUZAjHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730933186; x=1731537986;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WjcH9LsZd4f+cNUlGoEXrtphxMziOEhEaYMGYoVdBk=;
        b=JUCrADFVxioohX6e5xpLQsDuAywmr1I1yYMn5w2u24J7RRkfvot6bzkcUsWCEDfkZC
         7wUjpHSmlV2ZQQdImc0SPvcUotq8UQkl5M5ahMwvLUV4OFw+T53BvvXYG6G82Gi6MBNT
         tcOrCHPqf4Q6wqk1DWzsE54dvUIYIR7nSW9bF/AbQZZD+QhsKTwhncnMPyYadyt8OeGC
         ig+JytjZ8ZdH68SMmJeWroZiw2tYceGrBuJSB8mJj6uYAMeGcbl9q6gM0o3V0kPjDLbd
         C0aRl6p7G08jTC8CFq9jjVe5a4d1ncGzz5wi73vWKlSrVYQHv0NEVCFOdacd9f64uZKO
         zzxw==
X-Forwarded-Encrypted: i=1; AJvYcCXzqARl/vcp8HbOlYmvX8yEA9Kjshb15R1ZUgr51tyb3dfn79ZJDGGcKTOzcgID/huq5eaSF4TnIwg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxe09E0bvbhl+Aya0KUE/lauGNADd2dI07JoaQuRuzSWabtXZ9j
	LizJ5Ffbh+tMWh9qyZeFZPEZrBPOBJLIfExrioVuNAgHiI6NsefwRDB5U9RhE/o=
X-Google-Smtp-Source: AGHT+IHuq5hH2Jv9TtJrACc44EDHadDm5b3UFEojs1S3B3DgcF6ML4hehyGZ5Q0jWV2u9mFrMnZWiQ==
X-Received: by 2002:a05:600c:511f:b0:42c:b037:5f9d with SMTP id 5b1f17b1804b1-4327b6f466amr231576485e9.3.1730933186290;
        Wed, 06 Nov 2024 14:46:26 -0800 (PST)
Message-ID: <f592170a-6cb3-4bfc-9486-2253a6443e33@citrix.com>
Date: Wed, 6 Nov 2024 22:46:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/12] x86/boot: introduce module release
To: Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-5-dpsmith@apertussolutions.com>
 <773dbe75-d1d3-41ea-8ff7-c031e0e9a920@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <773dbe75-d1d3-41ea-8ff7-c031e0e9a920@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/11/2024 10:16 pm, Jason Andryuk wrote:
> On 2024-11-02 13:25, Daniel P. Smith wrote:
>> @@ -2122,6 +2152,11 @@ void asmlinkage __init noreturn __start_xen(void)
>>       if ( !dom0 )
>>           panic("Could not set up DOM0 guest OS\n");
>>   +    /* Check and warn if any modules did not get released */
>> +    for ( i = 0; i < bi->nr_modules; i++ )
>> +        if ( !bi->mods[i].released )
>> +            printk(XENLOG_ERR "Boot module %d not released, memory
>> leaked", i);
>> +
>
> Why not release the memory here instead of leaking it?
>
> I feel like the corner case of mapping the dom0 initrd is leading to
> this manual approach or releasing modules individually.  That logic
> then has to be spread around.  discard_initial_images() kept the logic
> centralized.  Maybe just replace the mod_end == 0 special case with a
> "don't release me" flag that is checked in discard_initial_images()?

I've been conflicted on this for ages, but I agree.

There are many wonky things with the current arrangement.

First(ish), discard_initial_images() should be named
discard_boot_modules() (if it's saying a separate function).

Second, the individual dom0_build.c's should not be calling this
directly.  They're both right at the end of construction, so it would
make far more sense for __start_xen() to do this after create_dom0(). 
That also avoids needing to export the function.

And yes, as Jason says, the "initrd mapped instead of copied" is a weird
corner case, and the other path manually releasing and also saying
"don't free" is just pointless complexity.  I do like the idea of a
"dont_free" flag.

Thoughts?

I know this would be moving back to a more v7-like approach, but I think
the end approach is cleaner.

~Andrew

