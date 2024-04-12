Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7C28A2E96
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 14:53:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704652.1101151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvGP6-0000lq-BK; Fri, 12 Apr 2024 12:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704652.1101151; Fri, 12 Apr 2024 12:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvGP6-0000jc-7D; Fri, 12 Apr 2024 12:53:16 +0000
Received: by outflank-mailman (input) for mailman id 704652;
 Fri, 12 Apr 2024 12:53:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yOJy=LR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rvGP4-0000jO-8x
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 12:53:14 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f2771e8-f8cb-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 14:53:13 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-78a2a97c296so46887185a.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 05:53:13 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l9-20020a05620a210900b0078eccaec580sm808044qkl.81.2024.04.12.05.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Apr 2024 05:53:11 -0700 (PDT)
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
X-Inumbo-ID: 9f2771e8-f8cb-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712926392; x=1713531192; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gelp3xPVtXUQtNlYB4R2qcaxabLNfvpVO7O7GhYjQIo=;
        b=IEAtbaklstflilU0UBvaaN2f88tI+AzwTxvw+dsXPUPQIJ6UhCMR2y5IYfyCj83eTO
         lB82r5gLYRTWxmuhW4RYWfvGnxFIj7yip//CVFCm+n8SmXM/6qgLz3v0feGGziV5eDvI
         /pS/bv0E9gkcoXv8gYyGcJKDj0TD5eF6NlEJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712926392; x=1713531192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gelp3xPVtXUQtNlYB4R2qcaxabLNfvpVO7O7GhYjQIo=;
        b=XzdxY1UI1as2R5mYy2zyZB7Aj8ZKw26pgmwaOLolHv4D7AxcWa2hG+/AwO8OLTh57G
         Nj4QJvldAxQvoQaztnpT5Z7HwVIf1z4Aj6/dPL4pLzyQ34E8PCCJimN/CuB9By3nklpa
         5z1RT46vZ0leRwrNcByfTAlAdU06jb0P44yfQVNW/RmNlHPLGFG7crHUw4J17wPVCbsz
         uOmRvDVUL86/FRshogv1mBYZBrKryD+YSX9uIf/Dc3A/HPfcdce8YMqlXEuRg83elUnN
         pKjcNHrkvGbW3bHOcyh7HAL6nGBnC6Z8x5P5cy/MpmUgv+ScaKnu7f/JfSdAGPOnPtvf
         b5rw==
X-Forwarded-Encrypted: i=1; AJvYcCVMSXhea2vvjYBBsh0Yl2XX1mZAnjLW1r8NJIF1+6shdrJgwF49v9ukZKwgJIqKk+OBAZZy8cPONh3nzzGiwbTVMF8SPucv3ch4fGlAUEc=
X-Gm-Message-State: AOJu0YyO//z3tLGfP6vAb6z/dwzWOWSjd06KGKUZYxNS0rYAIa4pLwen
	Y5/Bqkd75sIl4hoNmyFuHo9VLwi2AQX5ysMsi7kqmaTf/92xAr88QLd4xTlxG4g=
X-Google-Smtp-Source: AGHT+IG38Xou+6KUO5MnVN/lIdL+vQEz1dg5ubUPjWsxXgGc9Mv7v6OPb7BxErISOQVBkxEmU2XibQ==
X-Received: by 2002:a05:620a:5744:b0:78e:c2ac:3d9d with SMTP id wj4-20020a05620a574400b0078ec2ac3d9dmr3026713qkn.8.1712926392211;
        Fri, 12 Apr 2024 05:53:12 -0700 (PDT)
Message-ID: <7a28a0ac-07a2-42d9-9872-ebc27d751bd9@citrix.com>
Date: Fri, 12 Apr 2024 13:53:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] gzip: refactor state tracking
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
 <20240411152518.2995-4-dpsmith@apertussolutions.com>
 <360958a2-5b0d-4fbc-8637-2a33185bdd8d@citrix.com>
 <c03b4f1e-f2c9-4f92-a369-b8afad56bc0b@apertussolutions.com>
 <9a5112a3-26fe-49a8-93ed-cd8c9610576c@apertussolutions.com>
 <5e63a5b7-d62f-443c-9755-66dbc70fee98@citrix.com>
 <8551e410-332d-4e74-91b8-677bba38f90c@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8551e410-332d-4e74-91b8-677bba38f90c@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/04/2024 1:51 pm, Daniel P. Smith wrote:
> On 4/12/24 08:18, Andrew Cooper wrote:
>> On 12/04/2024 12:41 pm, Daniel P. Smith wrote:
>>> On 4/12/24 07:34, Daniel P. Smith wrote:
>>>> On 4/11/24 15:24, Andrew Cooper wrote:
>>>>> On 11/04/2024 4:25 pm, Daniel P. Smith wrote:
>>>>>> diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
>>>>>> index 1bcb007395ba..9b4891731b8b 100644
>>>>>> --- a/xen/common/gzip/gunzip.c
>>>>>> +++ b/xen/common/gzip/gunzip.c
>>>>>> @@ -102,12 +109,13 @@ __init int gzip_check(char *image, unsigned
>>>>>> long image_len)
>>>>>>    __init int perform_gunzip(char *output, char *image, unsigned
>>>>>> long image_len)
>>>>>>    {
>>>>>> +    struct gzip_data gd;
>>>>>>        int rc;
>>>>>
>>>>> By the end of this series,
>>>>>
>>>>> Reading symbols from xen-syms...
>>>>> (gdb) p sizeof(struct gzip_data)
>>>>> $1 = 2120
>>>>>
>>>>> x86 has an 8k stack and this takes 1/4 of it.  Other bits of state
>>>>> are
>>>>> dynamically allocated, even in inflate.c, so I'd highly recommend
>>>>> doing
>>>>> the same for this.
>>>>
>>>> I take it you are mainly talking about crc_32_tab? Yes, I can switch
>>>> that to being dynamically allocated.
>>>
>>> Never mind, reading your comment on patch4 made me realize you wanted
>>> the instance of struct dynamically allocated. Though the answer is
>>> still, yes, we can dynamically allocate it.
>>
>> I wrote this before realising that crc_32_tag could be shrunk.
>>
>> If it's only1k on the stack, then that's a whole lot less bad, and is
>> perhaps ok.  I guess it depends on the stack size of the other
>> architectures.
>>
>> Still - I expect dynamically allocating would be a safer course of
>> action.  Internal blocks are dynamically allocated already, so this is
>> "just" one more.
>
> Another course of action that could be considered is making a unit
> file global instance of the struct, and then memset() it to zero
> instead of allocating and freeing from heap. The global instance
> should be able to be made init_data and dropped after init was complete.
>
> I am good with either way, just let me know which would be preferred
> and I will adjust appropriately.

Other things inside gzunip() are dynamically allocated.  I'd keep this
consistent with the others.

~Andrew

