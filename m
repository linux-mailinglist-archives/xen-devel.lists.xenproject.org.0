Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82715870803
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 18:08:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688478.1072640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhBnH-00053O-CK; Mon, 04 Mar 2024 17:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688478.1072640; Mon, 04 Mar 2024 17:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhBnH-00050W-9E; Mon, 04 Mar 2024 17:08:03 +0000
Received: by outflank-mailman (input) for mailman id 688478;
 Mon, 04 Mar 2024 17:08:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bpxf=KK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rhBnG-00050Q-Lg
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 17:08:02 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0b1b46f-da49-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 18:08:00 +0100 (CET)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7882a0bcf82so48531985a.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 09:08:00 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 az17-20020a05620a171100b007882b4cecf8sm833945qkb.57.2024.03.04.09.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 09:07:58 -0800 (PST)
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
X-Inumbo-ID: c0b1b46f-da49-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709572079; x=1710176879; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=grBI+R5l7zUIrymp7ugv/IqxjfbJ+5u0sP9KyA3WXxU=;
        b=Fu7F1dyrHr9j42/rErYmlqR+l7WTh21VTNjJdzy3RmGnFoGyPrr2/tMQWuRawwuK6L
         d6VmP/e1URvpC5Bglhgkd39SSwrbfhnx5T7vbHYCENYGEpbb7d4rvqfzaaIE+0S7o7Up
         Pm5p56lVaEbwo1szucTrJAy4rcC0KpCDFXiSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709572079; x=1710176879;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=grBI+R5l7zUIrymp7ugv/IqxjfbJ+5u0sP9KyA3WXxU=;
        b=EUs5ERGGbQJpQGP8wkSzAQG2qZ4VsNUyOzW9smkr8FtG23S0UE56ypKn2OfIaZDDOV
         1YSLa1em9M9TOxvUZFGdmdx8yjm6OVNv4RG/+BCOGZsuq22tJC5swL0wpLVLdbVyjnHa
         ZdBE3LBvtwfoxfW1sq8Y4fcYW8ToOFxcuGvao0LhDVdWDT29LmvlzxI59YVEQlDVc3ki
         Whe58yV+k55il8E2n6MpIk9Yv7Xwna56JtLNTRQWejTOPoqJhSMN1fWDjJ5KCOi9EvR5
         fMhEZeDulgmK2De64lSbTq0milbjm7Q3D7dqYSdEEEU9RPfXOCiBYk9FQFbmQZyjtmsk
         b3ww==
X-Forwarded-Encrypted: i=1; AJvYcCXbsTcyyjlb5TjSN0zRWUXBU933xSa+DTGWDeIOX7HRGJnhCOOLqVXsxWC/vYySy9EFQWaOHTTJVNfScva2oHJm3Emah+8ChxLTolR0av4=
X-Gm-Message-State: AOJu0YymtgtaNiFYqw7D0YSdH34jEnY5wkuRPCCGC+sQyjwj6Kzyn44n
	QKFnFqX6tFCnRHLrulYRqV64M6j0MFJ8HKH7Uorux8uGKxlQRVwpRjs3yHOCsIY=
X-Google-Smtp-Source: AGHT+IGuHOc6tkDINx8wJCfd5VXYquM7FrFGugq3Sib5v0L0ZrB9qQQqnb89/569AadrA7jNXUhK5w==
X-Received: by 2002:a37:c441:0:b0:788:1a86:5428 with SMTP id h1-20020a37c441000000b007881a865428mr7721276qkm.58.1709572079072;
        Mon, 04 Mar 2024 09:07:59 -0800 (PST)
Message-ID: <4fb729fa-8519-4244-a795-cc66a79cd346@citrix.com>
Date: Mon, 4 Mar 2024 17:07:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/*/nospec: Provide common versions of
 evaluate_nospec/block_speculation
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
 <20240304161041.3465897-2-andrew.cooper3@citrix.com>
 <c9f92495-2c00-443f-bffd-1b09cb8a8c84@xen.org>
 <d343c58c-2a3a-45a9-8d67-64d1506d973c@suse.com>
 <5c06c437-b62c-4bee-8694-1be597887718@xen.org>
 <141ed8a2-df4f-492c-a192-4ffa7f4c8384@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <141ed8a2-df4f-492c-a192-4ffa7f4c8384@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/03/2024 4:55 pm, Jan Beulich wrote:
> On 04.03.2024 17:46, Julien Grall wrote:
>> On 04/03/2024 16:41, Jan Beulich wrote:
>>> On 04.03.2024 17:31, Julien Grall wrote:
>>>> On 04/03/2024 16:10, Andrew Cooper wrote:
>>>>> It is daft to require all architectures to provide empty implementations of
>>>>> this functionality.
>>>> Oleksii recenlty sent a similar patch [1]. This was pushed back because
>>>> from naming, it sounds like the helpers ought to be non-empty on every
>>>> architecture.
>>>>
>>>> It would be best if asm-generic provides a safe version of the helpers.
>>>> So my preference is to not have this patch. This can of course change if
>>>> I see an explanation why it is empty on Arm (I believe it should contain
>>>> csdb) and other arch would want the same.
>>> Except that there's no new asm-generic/ header here (as opposed to how
>>> Oleksii had it). Imo avoiding the need for empty stubs is okay this way,
>>> when introducing an asm-generic/ header would not have been. Of course
>>> if Arm wants to put something there rather sooner than later, then
>>> perhaps the functions better wouldn't be removed from there, just to then
>>> be put back pretty soon.
>> I am confused. I agree the patch is slightly different, but I thought 
>> the fundamental problem was the block_speculation() implementation may 
>> not be safe everywhere. And it was best to let each architecture decide 
>> how they want to implement (vs Xen decide for us the default).
>>
>> Reading the original thread, I thought you had agreed with that 
>> statement. Did I misinterpret?
> Yes and no. Whatever is put in asm-generic/ ought to be correct and safe
> by default, imo. The same doesn't apply to fallbacks put in place in
> headers in xen/: If an arch doesn't provide its own implementation, it
> indicates that the default (fallback) is good enough. Still I can easily
> see that other views are possible here ...

With speculation, there's absolutely nothing we can possibly do in any
common code which will be safe generally.

But we can make it less invasive until an architecture wants to
implement the primitives.

~Andrew

