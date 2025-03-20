Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 472F0A69D6A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 02:08:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921252.1325168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tv4O9-00035W-5j; Thu, 20 Mar 2025 01:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921252.1325168; Thu, 20 Mar 2025 01:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tv4O9-000340-2i; Thu, 20 Mar 2025 01:08:01 +0000
Received: by outflank-mailman (input) for mailman id 921252;
 Thu, 20 Mar 2025 01:07:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vaXX=WH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tv4O7-00033S-TV
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 01:07:59 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2ec0f44-0527-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 02:07:58 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d0c18e84eso861925e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 18:07:58 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df402esm21964124f8f.1.2025.03.19.18.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 18:07:56 -0700 (PDT)
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
X-Inumbo-ID: c2ec0f44-0527-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742432877; x=1743037677; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x/t6J1DknPWMwW0+03iZVmsoPmfDELB0NZvCQbEkhoA=;
        b=hf1x9RaJlgLY+feyXiccVK22PPkcwHLlMSmUk/LRQr5jYcinivYYsoACF2sZnXTn/0
         YO9Ol0tN5K4Nmw5ehdFBEAZLVUAoe7rcPBB81G6M9d2q+Kg6rDLVb0uZdHOwKYszwX+q
         c879XmYNXXsR8SfDsz3WHMW/F4l0vqCw0a+wI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742432877; x=1743037677;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/t6J1DknPWMwW0+03iZVmsoPmfDELB0NZvCQbEkhoA=;
        b=Rjn0b/8JFbsKQj27EHYZTnwsVOsJ3eF49tZnNQ3x7dnm7hzKOnDX8ZyCJV7p9sYlZ9
         Og/75J9FhsKGGdPcTrkdN4KZFcIQRm0twtCeShhzpeKKH65ZMU4LVzdnFPNbDD34Gh9K
         FSkMbdK/qVsS2XE2vFaCjQ8ii7aK6tN9qjJTh9r2f9dJ5h0kAZjcOAsHZkDSFMkkjI6P
         /skDfDCKonfrFhpksiw35ZyaL+v803QqMWcMtLiUirqrIc7hwF/cpHhJzaPADDplnF4S
         3dUivlhSZa1JpKkamqulVPv2uL2AWlNNff62IJYzpe0poydt6FDaaV6oBNg+0MX8KUcW
         x+ug==
X-Forwarded-Encrypted: i=1; AJvYcCWarTrsxKdxx0fAC4S/xIt0Ikyq4Fh+htUJkDTePwAPIBxfMzbcDSmzNoxmT38r/W0wehr5RFeLqQ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz391oYb9imGls7Gm1zMxxQo9305yMymd271kw4w8RiMokxNZMR
	uvdaaCW9dk3MAXO2wZBtoz46OOXk3/3QZ37DfEZWiGYhU47ZanXGl6MaESNSrAo=
X-Gm-Gg: ASbGncvjvAeEBpaA6LDIT1KKgTwkqZEjxlfHRW2pbWgiWFl9n6BnAXyckib/lgOOLeu
	fblV4GbIkSoy82pcNeeALdcpQggyevZwculGhVJJooociZKWI6SDGHZicxufCKqOlJASRaxdOH7
	YKM1TrleJjULiBs9xLrjg6LJFdNF+q3TcGwrBuIEouIIskN87+Akqidt928glkS/X1JlY/4fHho
	G2HG/2Q5M0wrHFBwum/kOEfpg6rkbOVQ1jBtUiFhnxpx52cY4317Igb+ud+TGVRfn9VtnCVvnJp
	s5QMrPkVSxqP24iNwN0djRWuuA+fXzRDZmDC1xBg2jUbsjHF2nvGPZw0P8GR4tgLUgusVGb8O1g
	hw4LjdgIYnw==
X-Google-Smtp-Source: AGHT+IHFh6tgTh8gsfTrYv/RO+vG7iBlwMYCwKwQhrzxU5oZgg1oi3KFm7WmHDZjW7NcZcrYaSR/mA==
X-Received: by 2002:a05:600c:5117:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-43d495095ebmr10238055e9.3.1742432877449;
        Wed, 19 Mar 2025 18:07:57 -0700 (PDT)
Message-ID: <33ef3e0d-02fb-4fb5-91f1-d5cef64bb030@citrix.com>
Date: Thu, 20 Mar 2025 01:07:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Simplify the expression for extra allocation
 space
To: Jason Andryuk <jason.andryuk@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250319171346.19478-1-andrew.cooper3@citrix.com>
 <c56988e5-bfaa-4b2b-8182-8e0f42963448@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c56988e5-bfaa-4b2b-8182-8e0f42963448@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/03/2025 9:41 pm, Jason Andryuk wrote:
> On 2025-03-19 13:13, Andrew Cooper wrote:
>> The expression for one parameter of find_memory() is already
>> complicated and
>> about to become moreso.  Break it out into a new variable, and
>> express it in
>> an easier-to-follow way.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks.

>
> One thought...
>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>   xen/arch/x86/hvm/dom0_build.c | 18 +++++++++++-------
>>   1 file changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/dom0_build.c
>> b/xen/arch/x86/hvm/dom0_build.c
>> index 6a4453103a9a..6591949984b8 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -654,6 +654,7 @@ static int __init pvh_load_kernel(
>>       const char *cmdline = image->cmdline_pa ?
>> __va(image->cmdline_pa) : NULL;
>>       struct elf_binary elf;
>>       struct elf_dom_parms parms;
>> +    size_t extra_space;
>>       paddr_t last_addr;
>>       struct hvm_start_info start_info = { 0 };
>>       struct hvm_modlist_entry mod = { 0 };
>> @@ -711,13 +712,16 @@ static int __init pvh_load_kernel(
>>        * split into smaller allocations, done as a single region in
>> order to
>>        * simplify it.
>>        */
>> -    last_addr = find_memory(d, &elf, sizeof(start_info) +
>> -                            (initrd ? ROUNDUP(initrd_len, PAGE_SIZE) +
>> -                                      sizeof(mod)
>> -                                    : 0) +
>> -                            (cmdline ? ROUNDUP(strlen(cmdline) + 1,
>> -                                               elf_64bit(&elf) ? 8 : 4)
>> -                                     : 0));
>> +    extra_space = sizeof(start_info);
>> +
>> +    if ( initrd )
>> +        extra_space += sizeof(mod) + ROUNDUP(initrd_len, PAGE_SIZE);
>> +
>> +    if ( cmdline )
>> +        extra_space += ROUNDUP(strlen(cmdline) + 1,
>> +                               elf_64bit(&elf) ? 8 : 4);
>
> These component values are re-calculated below.  With additional
> variables, they could be calculated once and used for find_memory()
> and later last_addr adjustments.

This is a prerequisite for Jan's
https://lore.kernel.org/xen-devel/730d8143-8cda-49da-a48a-3b82c2b77c9d@suse.com/T/#u
which adjusts several aspects.

Given Jan is intending to do some cleanup in this area, I'll not
complicated my change further.  If there are dregs left afterwards, the
can be cleaned up too.

~Andrew

