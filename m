Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA49E873D71
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 18:22:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689428.1074385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhuy3-0002hV-H2; Wed, 06 Mar 2024 17:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689428.1074385; Wed, 06 Mar 2024 17:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhuy3-0002ez-CZ; Wed, 06 Mar 2024 17:22:11 +0000
Received: by outflank-mailman (input) for mailman id 689428;
 Wed, 06 Mar 2024 17:22:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b0MG=KM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rhuy2-0002et-Ke
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 17:22:10 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f445cf05-dbdd-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 18:21:23 +0100 (CET)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-7884384438dso776485a.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 09:21:23 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 pa7-20020a056214480700b0068f8a21a065sm7692538qvb.13.2024.03.06.09.21.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 09:21:21 -0800 (PST)
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
X-Inumbo-ID: f445cf05-dbdd-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709745682; x=1710350482; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1nxCopfxV6EPaal9AV9NrrH/uSsPcKDTN5Lg9Eqtxm0=;
        b=STH8+PseeWnXHqGh1GFJOFAVTEjmQS5VWeRB7zeZvPBQFCEd4o3m6mkxiCX7xajZfD
         DmaLpolCfA4y+z0UbGb/Bx7qGTfUad+TCnifRy9tYsDjQiX4ustSz0W4lnmx0j/Z+Xp7
         rixgR7xX5EsfmAewBB23UsEAwH9+asHtqu65E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709745682; x=1710350482;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1nxCopfxV6EPaal9AV9NrrH/uSsPcKDTN5Lg9Eqtxm0=;
        b=rk0Pf9SDMjiJNvnqWldZ2+h1HnHlXQGgl3Gtr6MUCTrhgHWRKrBmBgnjk7XSxPe5bq
         G6JJMm6u9z4zeoDDp+GhTBdagq1cpFOTp0O6ZXmrFxyk+JANv24oeUl8a+9+s8y/2Ap3
         rG3JtIWOU/C6rbzVcyij8d+5AK7u1MXkTB+MpBZdlhkTTdkgqBv03XLm6ZG4m8KzOzCv
         AKTr68CX63KH2V8wsm7c3dzKNNu29fWKOXPW8HuN/iERJaac/f6C8e/whlITXaPDLD27
         xXimxoVZz01Ns6ZRkmw4ugoGi5CO55u8z34KKkGoywUbdFKrnIblzl5nK5wxEinF9dyC
         2vwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+kriAvZbFccpsMLi8ZSXRp80+nmDeV+p7F7J/FCzTYsBc65G6qOLaB3o2qi3p2kJNa0mPsAU2k9oz0befh/PuLfXN5/YbRjvrC/4Ia5s=
X-Gm-Message-State: AOJu0YwpixJGYwZTvXKK5Ri4YAUtFW1yDeM3T5Of11t8P2T/PGrLYCFc
	4P265pPTsi+UMv8btdq/6wrzK9ijQlO3JJfdAu6dzEKs7U3ZCDlHv3Fza0RdLQInxJ4cr6G4fwG
	X
X-Google-Smtp-Source: AGHT+IHZDpEhAuKepksGbYvfCWJt9FC0LhsmdRD5cSIpZSd48qCFy29X3e4nnc1HI9Z+8HxVASL6/A==
X-Received: by 2002:ad4:56e3:0:b0:68f:edeb:6b8c with SMTP id cr3-20020ad456e3000000b0068fedeb6b8cmr4999098qvb.12.1709745682250;
        Wed, 06 Mar 2024 09:21:22 -0800 (PST)
Message-ID: <82126c3a-0cde-452f-86aa-2571482f42aa@citrix.com>
Date: Wed, 6 Mar 2024 17:21:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/virtual-region: Include rodata pointers
Content-Language: en-GB
To: Ross Lagerwall <ross.lagerwall@cloud.com>, Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
 <20240305121121.3527944-3-andrew.cooper3@citrix.com>
 <87b82706-f538-4807-abaf-1e59cebd286b@suse.com>
 <CAG7k0EqWrPU0qocSJHyJAQca44LakQwZwAbiv5GRk-sQeaAYAg@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAG7k0EqWrPU0qocSJHyJAQca44LakQwZwAbiv5GRk-sQeaAYAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/03/2024 5:09 pm, Ross Lagerwall wrote:
> On Tue, Mar 5, 2024 at 2:17 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 05.03.2024 13:11, Andrew Cooper wrote:
>>> --- a/xen/include/xen/virtual_region.h
>>> +++ b/xen/include/xen/virtual_region.h
>>> @@ -16,6 +16,9 @@ struct virtual_region
>>>      const void *text_start;                /* .text virtual address start. */
>>>      const void *text_end;                  /* .text virtual address end. */
>>>
>>> +    const void *rodata_start;              /* .rodata virtual address start (optional). */
>>> +    const void *rodata_end;                /* .rodata virtual address end. */
>>> +
>>>      /* If this is NULL the default lookup mechanism is used. */
>>>      symbols_lookup_t *symbols_lookup;
>> While perhaps the least bad one can do without quite a bit more churn,
>> I'm still irritated by a virtual region (singular) suddenly covering
>> two ranges of VA space. At the very least I think the description should
>> say a word of justification in this regard. An alternative, after all,
>> could have been for livepatch code to register separate regions for
>> rodata (if present in a patch).
>>
>> A follow-on question then would be why ordinary data isn't reflected in
>> a virtual region. Aiui that's just because livepatch presently has no
>> need for it.
>>
>> Underlying question to both: Is the virtual region concept indeed meant
>> to be fully tied to livepatch and its needs?
>>
> Virtual regions were introduced for live patching but I don't think it
> is completely tied to live patching. It was introduced so that any code
> can participate in symbol lookup, bug frame and exception table entry
> search, rather than special casing "if livepatch" in many places.
>
> I agree that the virtual region concept is being abused here - it's just
> being used as a convenient place to store rodata start/end and doesn't
> really have much to do with the text start & end / bug frame / exception
> table entry search that the virtual region is intended for.
>
> Maybe Andrew can explain why he used this approach?

I feel the simplicity and obviousness of patch 3 speaks for itself.

How do you propose fixing it differently.

~Andrew

