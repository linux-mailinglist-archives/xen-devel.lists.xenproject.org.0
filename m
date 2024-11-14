Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C859C892E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 12:45:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836332.1252212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBYHg-0005XF-Bm; Thu, 14 Nov 2024 11:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836332.1252212; Thu, 14 Nov 2024 11:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBYHg-0005V2-8R; Thu, 14 Nov 2024 11:45:12 +0000
Received: by outflank-mailman (input) for mailman id 836332;
 Thu, 14 Nov 2024 11:45:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3TDs=SJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBYHe-0005Uu-NI
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 11:45:10 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e405ee17-a27d-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 12:45:05 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5ceca0ec4e7so685166a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 03:45:05 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79b89b78sm489123a12.14.2024.11.14.03.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 03:45:04 -0800 (PST)
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
X-Inumbo-ID: e405ee17-a27d-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzEiLCJoZWxvIjoibWFpbC1lZDEteDUzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU0MDVlZTE3LWEyN2QtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTg0NzA1LjM3MTUyOSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731584705; x=1732189505; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ex8GpRSqTxFHga8D7ZgTHkOrTwevkNjZ8GqEOSrkUzc=;
        b=a+nP7jdUmbBGBaxFValzBWSECT3TT5IgY6VFvJOlzFfHX/8vo65X1tJspYgiTzvkBj
         bojGgeZUhXlUtKffQZe4QKz8ayU7c0vPPG8XU9D5UyehYpE/Q77PSTMQSC70DkkCa/SY
         QAQgwEnfh/fVh4TzKDuMO2qzZh6+k66qqmLCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731584705; x=1732189505;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ex8GpRSqTxFHga8D7ZgTHkOrTwevkNjZ8GqEOSrkUzc=;
        b=AbYrFwkPxqaaxSoy0yyEKIaR9vB0wqd2D5sYv3A0DSTtCF+B6VsBT+madN/H//SoGl
         cA9J7hPS9c0mE+YdCa8klQZ8TkB2uaMb+FSmdjiW8nfTQ6UdpR+I/CAnXeVnRILv7IYo
         WTAr0Krnp5LQSKmdGtdfCS/qkdjcu8tu1faY9m4ffF5i2+OmYr1GIRmWgPzoOb4R6VGj
         LGiyZoXMC59IW7hftBFRdoEq+zekE3KDSVv+KTkMK3G1ualKhQ8OhVpeJYLZq9X3qd2c
         4+j329vH9ocapg+HTOsKQEbqFIruK9jDeowjZySKw+AR3QNQ4vX4dZI4VBbHpgCwU5Lr
         IIbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEbyq1WDaYHTJ3/2xbieemWGc8WmBrVV8Eq+M+nlBVV+PK5YfXFM7XIE8pL60zj+67u9M+3YHEktg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5NYwd40kQGTaeGIpmGvKXthXZQnywhd47l1gwmtPV+u9IZ/Ik
	+oDD4ZI4w9DvoemkcrhBowdxAxB1YxZjfM0Q4zyNa+YXvjjU9eHrODnarmxMYUI=
X-Google-Smtp-Source: AGHT+IGlAwn8fzbPiSQJNKta3JZnyGsvLZBwbjOJPpI8KeM2M4tFSUUYAY+P6d36NZB/VLvw1h+E8g==
X-Received: by 2002:a05:6402:2786:b0:5cf:3dc3:7a3f with SMTP id 4fb4d7f45d1cf-5cf3dc37aa2mr13186160a12.5.1731584704726;
        Thu, 14 Nov 2024 03:45:04 -0800 (PST)
Message-ID: <a3a0b4b9-19e6-4d49-86ed-92ded7bd10da@citrix.com>
Date: Thu, 14 Nov 2024 11:45:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86emul: ignore VEX.W for BMI{1,2} insns in 32-bit
 mode
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <367ba117-f376-433b-bd70-586d7519d94c@suse.com>
 <39de64e1-c615-4ec3-ad05-ff99f27a8e30@suse.com>
 <6442a109-de9a-4b81-a283-2d72bbc3d284@citrix.com>
 <3788f564-7f02-4e2e-ac4c-b29214206e0d@suse.com>
 <876f727c-8929-4149-af72-c3344db06e31@citrix.com>
 <935442f7-4821-4215-a053-eeb1347282bb@citrix.com>
 <9815fb42-9205-4740-97b4-0b915de0c71b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9815fb42-9205-4740-97b4-0b915de0c71b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/11/2024 9:39 am, Jan Beulich wrote:
> On 13.11.2024 14:32, Andrew Cooper wrote:
>> On 13/11/2024 1:31 pm, Andrew Cooper wrote:
>>> On 13/11/2024 8:01 am, Jan Beulich wrote:
>>>> On 13.11.2024 01:24, Andrew Cooper wrote:
>>>>> On 12/11/2024 3:00 pm, Jan Beulich wrote:
>>>>>> While result values and other status flags are unaffected as long as we
>>>>>> can ignore the case of registers having their upper 32 bits non-zero
>>>>>> outside of 64-bit mode, EFLAGS.SF may obtain a wrong value when we
>>>>>> mistakenly re-execute the original insn with VEX.W set.
>>>>>>
>>>>>> Note that the memory access, if any, is correctly carried out as 32-bit
>>>>>> regardless of VEX.W.
>>>>> I don't understand why this is true.
>>>> This talks about the access to guest memory, which is op_bytes based.
>>>> And op_bytes determination handles VEX.W correctly afaics. I've added
>>>> "guest" near the start of the sentence for clarification.
>>> Ah - that makes things much clearer.
>>>
>>> I had neglected to consider the access to guest memory.
>>>
>>> In addition to a "guest" earlier, I'd suggest having a new paragraph at
>>> this point, and ...
>>>
>>>>> If we write out a VEX.W=1 form of BEXTR/etc and emulate while in 64bit
>>>>> mode, it will have an operand size of 64.
>>>>>
>>>>> I can believe that ...
>>>>>
>>>>>>  Internal state also isn't leaked, as the field the
>>>>>> memory value is read into (which is then wrongly accessed as a 64-bit
>>>>>> quantity when executing the stub) is pre-initialized to zero.
>>> ... this reading:
>>>
>>> "The emulator-local memory operand will be accessed as a 64-bit
>>> quantity, but it is pre-initialised to zero so no internal state an leak"
>>>
>>> or similar.
> That's to _replace_ the "Internal state ..." sentence then, rather than an
> added separate sentence / paragraph? It says exactly the same, after all.

Ideally, yes.  I think it's clearer this way around.

~Andrew

