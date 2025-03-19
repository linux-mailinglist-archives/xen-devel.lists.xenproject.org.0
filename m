Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9825A68CA0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920520.1324669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusQA-0006XD-9x; Wed, 19 Mar 2025 12:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920520.1324669; Wed, 19 Mar 2025 12:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusQA-0006UB-6W; Wed, 19 Mar 2025 12:21:18 +0000
Received: by outflank-mailman (input) for mailman id 920520;
 Wed, 19 Mar 2025 12:21:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zx04=WG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tusQ8-0006Tw-HQ
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:21:16 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a26d1dbd-04bc-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 13:21:07 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-394780e98easo4360378f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 05:21:07 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df413esm20413275f8f.20.2025.03.19.05.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 05:21:06 -0700 (PDT)
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
X-Inumbo-ID: a26d1dbd-04bc-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742386867; x=1742991667; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+y7YPQFirj3wlpzq9NoPsLfC4T2AQlip2MwqNvwifHA=;
        b=BLuvfEi4SZ/v2gVXduHk5mURJLFhwdOD9YltNSSA9Z01Tn2eQ5NmNwFSOOc98w+shA
         TAK4x8hbavTGJgl9lzfYQlar2wTrudAuM1D2gmBH12MIThLNCMBsT8oYy2kz9wN0f35D
         zcSCumVfMfxlURwu+6v3Ti3Yijac9bWfRi2pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742386867; x=1742991667;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+y7YPQFirj3wlpzq9NoPsLfC4T2AQlip2MwqNvwifHA=;
        b=CYsu2BBe58ZpEdBMfJblLzYmYe7sDiZl0G0J+0ZW8iU1tHmYa77+XqP1FOsrlL/ENL
         LHHi74O7mmTf64cwnUMHAmHvwpUpglZxMadpRIi1+Uedt/Os3nGGLsshTetwmrJdFLvd
         96JkcNG2RsSsBRG1lXiPsH7RxUrgZkUiRjtn7xy+jvZ5OMMlxp4FJQ07dPpOqGJjZq5M
         ALm0DKUvjbR/xjT7BGwtiusLIHQ0cyQO2UhFpNbyC+ErC0FbUHFy3/97PPVCO8lRCxmz
         Ta3vs93KcwI2M7XfApTkxqpGREVTVwK+ctuZyqBnz4whfdZ7Gn6nAgLlE4oG7j2i6s6c
         EytQ==
X-Gm-Message-State: AOJu0YzCIESMjD82Vj5Pz+pLDOCTBBkCksGb1VUtRDvHqlV/YLpTTTTb
	yAMm8aCKpio0quvDB3dxCN2g+iYPHNpm6XfLYdcQsJs2XfdXWDfNCaMeQJolUaQ=
X-Gm-Gg: ASbGncsUmsqYrpxFxkfHOHCQOZOHdQX1QSuerEYtcZS0N/glhVe/tww5C9YgLn8wu23
	eSkk/kbeeg/zDtOIGG8diwLn9eVU03UzUGQgMNIeMKMh+LFhwmDjq4EFZ19e4V/EBHPKSAhEEM1
	kEcw6RY0qsJ7HxqAOktFnXwyCven7wZjgW2Zvtq//ZQsY2IKizkVr8evl3KkowWAh/6zhtjatXJ
	ZIlAYIBx8S2Rl4MfovB0S1qH3dvay+XTp+KYntS0IeJ7wMV2/W2AMIp3bdX79Tv8bwfmN6Gxl25
	irYadLS+Nb+bUozks4ay9c7T5V86OAi57yHP9Q1VOWrHjgUrBnpwW3ZDKJyRJLBleTWrO3P/Oxi
	AN6YLdzLi
X-Google-Smtp-Source: AGHT+IHZbuoYwz/a85YWoSnI4j/P2QumoipQxf1oq+qEfpPEsdZnn3LwY8lOGNbDD+7gm3MrlhrA8g==
X-Received: by 2002:a05:6000:21c5:b0:391:492a:c9c2 with SMTP id ffacd0b85a97d-399739ef51amr1869223f8f.33.1742386866900;
        Wed, 19 Mar 2025 05:21:06 -0700 (PDT)
Message-ID: <6f6a9ac1-4d80-47fa-ace2-81341f9d72e0@citrix.com>
Date: Wed, 19 Mar 2025 12:21:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/setup: correct off-by-1 in module mapping
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <f346b510-dbd1-431a-ad35-3f1b8fe76c58@suse.com>
 <Z9q1Zv9IEJOCycan@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z9q1Zv9IEJOCycan@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/03/2025 12:15 pm, Roger Pau Monné wrote:
> On Wed, Mar 19, 2025 at 12:21:53PM +0100, Jan Beulich wrote:
>> If a module's length is an exact multiple of PAGE_SIZE, the 2nd argument
>> passed to set_pdx_range() would be one larger than intended. Use
>> PFN_{UP,DOWN}() there instead.
>>
>> Fixes: cd7cc5320bb2 ("x86/boot: add start and size fields to struct boot_module")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1730,7 +1730,7 @@ void asmlinkage __init noreturn __start_
>>      {
>>          unsigned long s = bi->mods[i].start, l = bi->mods[i].size;
>>  
>> -        set_pdx_range(paddr_to_pfn(s), paddr_to_pfn(s + l) + 1);
>> +        set_pdx_range(PFN_DOWN(s), PFN_UP(s + l));
> Is the set_pdx_range() provided smfn, emfn range inclusive?
>
>>          map_pages_to_xen((unsigned long)maddr_to_virt(s), maddr_to_mfn(s),
>>                           PFN_UP(l), PAGE_HYPERVISOR);
> Isn't this line also bogus, as there's no guarantee that the start
> address is aligned to PAGE_SIZE?  And hence the length should take
> into account a possible page offset of s?

All modules are page aligned, because we require this of the bootloader.

Prior to cd7cc5320bb2, Xen strictly depended on it, because we shifted
mod_start by 12 to operate on it.

cd7cc5320bb2 retained the alignment check, panic("Bootloader didn't
honor module alignment request\n");, but operates in terms of paddr, not
frames.

~Andrew

