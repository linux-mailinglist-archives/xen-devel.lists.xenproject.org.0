Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7E48C2CBD
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 00:45:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720112.1123140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5YzV-0003BO-NK; Fri, 10 May 2024 22:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720112.1123140; Fri, 10 May 2024 22:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5YzV-00039A-KK; Fri, 10 May 2024 22:45:25 +0000
Received: by outflank-mailman (input) for mailman id 720112;
 Fri, 10 May 2024 22:45:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4i6G=MN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s5YzU-000392-A7
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 22:45:24 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbc5d350-0f1e-11ef-b4bb-af5377834399;
 Sat, 11 May 2024 00:45:22 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41a72f3a20dso17708135e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 15:45:22 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce24efsm78524385e9.19.2024.05.10.15.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 15:45:21 -0700 (PDT)
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
X-Inumbo-ID: fbc5d350-0f1e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715381121; x=1715985921; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sn6WsIBQzi2paWx2AV+3jgJbQsaBnBIozeWKELO4BZU=;
        b=BFn+FueisxjxAw4xnWWTs+rHKR1eo/lTAl+lpsxSAi7zyM0BTbD286Q/YtPL+mDAKx
         p+JUU+9zaJp8lvajZ6X2l4HXqnE+cdSPjCwKt71ayorLkk2CaxzkDFmGD2E3y2tURkjP
         HbyZCXOykr3qzYfx+lhZLw0rcqtxMZoTnVeEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715381121; x=1715985921;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sn6WsIBQzi2paWx2AV+3jgJbQsaBnBIozeWKELO4BZU=;
        b=PaQaw+h3465u/OMRpvDTCKwLc9Zr2m2tKN8/sYbxnQyYj6Ls80E/aulbDVdGs9eeJg
         f6tMFNv+9ZqrF3vnixsdNJ2yvyaIzOEWySbxGVPmjWToeZu84ywFYBPxaPcLnxFGzD1x
         202YQ1OT+dEgvSArGxo10lW+sG2t5/LMEG/9ciCOtVk27+rLkpicxbh1lI8MY1qZLD4Y
         PXIBig4t9DkWXFeac5gMq5qALQl0d6EAfCufj7eJeg90/2K+fv9CsGhSWyDvhrIQ4h7B
         9IX9VYSRjzCQF6kFzNWMLtJzSbmynn5YxAcoggErISIf7LoE39AyEYjh4zWORwc8Trg9
         2ZgA==
X-Forwarded-Encrypted: i=1; AJvYcCXhi6zWTODcXNdvwNY1PxHlZ7/4sD6ktntuDZ+cr9dUCi0JhoHF0okt2WOPTRTllu+CqzHUZnEEbBfgJUxFfdxo9jP2//qM8UrKgv9/g+I=
X-Gm-Message-State: AOJu0Yxpz0sCmHbkjcMspFxYQbX4yqX1DNPtGYOf6v7X/4oO/ZpOXR3X
	o6btXu9dKPNTx1v9AZsXN8gvq+eI7BOx19GNzGlU8pdrxR8KBNHPeP0vayt9X+c=
X-Google-Smtp-Source: AGHT+IHLax7T17bbvizcPdXomnhVe6GKAZmA6+qk9CH8eom9zoZKay3NOCDtz1jUPjv8wq4BkaIyRw==
X-Received: by 2002:a05:600c:1f93:b0:417:d4f5:6501 with SMTP id 5b1f17b1804b1-41feac5a3b8mr29511265e9.27.1715381121468;
        Fri, 10 May 2024 15:45:21 -0700 (PDT)
Message-ID: <be534982-5b4f-4f90-8484-faf09e44a618@citrix.com>
Date: Fri, 10 May 2024 23:45:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/misra: add R21.6 R21.9 R21.10 R21.14 R21.15
 R21.16
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <alpine.DEB.2.22.394.2404261435010.3940@ubuntu-linux-20-04-desktop>
 <cf0cd2ef-58df-476f-89c5-c843a85f71f7@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cf0cd2ef-58df-476f-89c5-c843a85f71f7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/05/2024 10:48 pm, Andrew Cooper wrote:
> On 26/04/2024 10:36 pm, Stefano Stabellini wrote:
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> ---
>>
>> Changes in v3:
>> - add explanation in footnote
>> - remove comment from 21.14, 21.15, 21.16
>>
>>  docs/misra/rules.rst | 42 ++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>> index b7b447e152..5ba7394f05 100644
>> --- a/docs/misra/rules.rst
>> +++ b/docs/misra/rules.rst
>> @@ -652,12 +652,48 @@ maintainers if you want to suggest a change.
>>         declared
>>       - See comment for Rule 21.1
>>  
>> +   * - `Rule 21.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_06.c>`_
>> +     - Required
>> +     - The Standard Library input/output routines shall not be used
>> +     - Xen doesn't provide, use, or link against a Standard Library [1]_
>> +
>> +   * - `Rule 21.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_09.c>`_
>> +     - Required
>> +     - The library functions bsearch and qsort of <stdlib.h> shall not be used
>> +     - Xen doesn't provide, use, or link against a Standard Library [1]_
>> +
>> +   * - `Rule 21.10 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_10.c>`_
>> +     - Required
>> +     - The Standard Library time and date routines shall not be used
>> +     - Xen doesn't provide, use, or link against a Standard Library [1]_
>> +
>>     * - `Rule 21.13 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_13.c>`_
>>       - Mandatory
>>       - Any value passed to a function in <ctype.h> shall be representable as an
>>         unsigned char or be the value EOF
>>       -
>>  
>> +   * - `Rule 21.14 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_14.c>`_
>> +     - Required
>> +     - The Standard Library function memcmp shall not be used to compare
>> +       null terminated strings
>> +     -
>> +
>> +   * - `Rule 21.15 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_15.c>`_
>> +     - Required
>> +     - The pointer arguments to the Standard Library functions memcpy,
>> +       memmove and memcmp shall be pointers to qualified or unqualified
>> +       versions of compatible types
>> +     -
>> +
>> +   * - `Rule 21.16 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_16.c>`_
>> +     - Required
>> +     - The pointer arguments to the Standard Library function memcmp
>> +       shall point to either a pointer type, an essentially signed type,
>> +       an essentially unsigned type, an essentially Boolean type or an
>> +       essentially enum type
>> +     - void* arguments are allowed
>> +
>>     * - `Rule 21.17 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_17.c>`_
>>       - Mandatory
>>       - Use of the string handling functions from <string.h> shall not result in
>> @@ -712,3 +748,9 @@ maintainers if you want to suggest a change.
>>       - The value of a pointer to a FILE shall not be used after the associated
>>         stream has been closed
>>       -
>> +
>> +
>> +.. [1] Xen implements itself a few functions with names that match the
>> +       corresponding function names of the Standard Library for developers'
>> +       convenience. These functions are part of the Xen code and subject to
>> +       analysis.
> I discovered the hard way (c/s 1357f1fa588f1) that numbered footnotes
> are an issue when the document gets more complicated.
>
> I'd suggest using #xen-stdlib as a named footnote instead of [1].
>
> Can fix on commit.

And a ".. rubric:: Footnotes" is wanted too.  Fixed on commit, after
conferring with Stefano.

~Andrew

