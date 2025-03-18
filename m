Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF12CA67BD1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 19:20:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919778.1324149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tubYE-0007TH-Hw; Tue, 18 Mar 2025 18:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919778.1324149; Tue, 18 Mar 2025 18:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tubYE-0007RC-Ei; Tue, 18 Mar 2025 18:20:30 +0000
Received: by outflank-mailman (input) for mailman id 919778;
 Tue, 18 Mar 2025 18:20:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0H9a=WF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tubYD-0007R6-QI
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 18:20:29 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab33f8c3-0425-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 19:20:28 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so37438245e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 11:20:28 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffb62d7sm141593285e9.6.2025.03.18.11.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 11:20:27 -0700 (PDT)
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
X-Inumbo-ID: ab33f8c3-0425-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742322028; x=1742926828; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H5xN6qXsYllDTAGed2Q2zyU8H00IyBSqSOp1CQPa/fM=;
        b=DjJWsYvXSe4nbmIvnTwTsxnI2AEYbZrr7Sbpaq4tBtlhQ4ugaIqLRJFoMPBF5qDU8U
         8deP/v3u4+Qj8RddcrT8CIITWlebm3clBQr0eIlw7PwlXq1XECmongjlW9NeuqkTli8z
         KcqTVoJXJ0+sdRRI59PWPBtQ1efn0umQE48xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742322028; x=1742926828;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5xN6qXsYllDTAGed2Q2zyU8H00IyBSqSOp1CQPa/fM=;
        b=Ygw0bRr0rRbW3lpJdq/MpGKiMSG93wQMr+WPUrgsu5/+2NroOWxmpF6MBpEddzZMCD
         mHI0faxbMg+jEn56L8R5mrlyHCtG1Y59DKrG5IxcKtISEACYu1ZiSZXUo12eVeA/1nvE
         u1Jco2MRhbqX5ZyChYxWR1dFDsgmCccGf23m2t41CvQ/3A5urWyy5rxWWujqvCg4Uch8
         DQkdXXz8OAkx0z4kXHehGPqdv5ZdUYVa0YwBo1gWoHHFePSYCLLB/f9jjjpoefZ7cgMV
         8cWc8VMiA7OTflVmmVYuvm4L9zT0BOG0Dq/Oz9e9LHL23S+D/LJ51FT8B7a3iHOnO/ip
         hcYw==
X-Forwarded-Encrypted: i=1; AJvYcCXiU+37YLJir6QD2Dws18THzVdxIa7are4Z2rtBufFgGptiBkMZAQW/8yeKEn1jsDWH0xs+jve6OEc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHg/nkpSeN2hWEerFCQf4tj3E0I8HcvLb5a0GLQ1otIsdVr8zy
	oY4gYyvjf2Xe73LgFgySyrjV89nBj/CnrHUN+y6itj1w6qX8j0bTy/Up+r1BkJY=
X-Gm-Gg: ASbGncuYDDxysTBjdDjOjXlkF4h9BCRRfQqLrFe06xCpqMWnPvPNAdMLLeAFnOeaNy1
	gjgp0u6owvZXnGFkXmk9g7EQMqFS1rGi/PApWOCJa8aIvSQZkGjeHyEtHcUbUKMRcZUFCA6SDNs
	yVznF2PPlaDV5T3rCfmHF9bqfmgmkGIsFCmILqPeQAbWRwQdFcMhJ59RwmETsuEVH/jgBHGSUwa
	9kZK06ob0j2SWEL/a7njXYL3Ys7fp3Opu2z5IYxRRi7+hwpUp7Q/HEBLznonhJs/JumUixreqvj
	CNCZ/vl4QElLUto+L7MTuuZ6qWx3haUsGTuhN3gu1AY5ruF9ygzhv9y+QzJ0ZTwjTxSIxDW8Oz3
	gE+cQCUlP
X-Google-Smtp-Source: AGHT+IF/DTzrJhR8qACA+mE28dePEbkUzLTrkdY2Gins1Ps3i7HEhHssLl1AxPYj0r9yyy+f9B8ZwA==
X-Received: by 2002:a05:600c:8714:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-43d41b05ccbmr1487795e9.15.1742322027534;
        Tue, 18 Mar 2025 11:20:27 -0700 (PDT)
Message-ID: <e99fa98b-b244-4c0f-8248-9a4965653378@citrix.com>
Date: Tue, 18 Mar 2025 18:20:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Drop __text_section()
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250314175933.67422-1-andrew.cooper3@citrix.com>
 <83894b99-54ca-460c-8463-9d6854987935@suse.com>
 <0644d20e-9846-48e2-b83f-4fc157107f31@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0644d20e-9846-48e2-b83f-4fc157107f31@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/03/2025 5:15 pm, Andrew Cooper wrote:
> On 17/03/2025 8:43 am, Jan Beulich wrote:
>> On 14.03.2025 18:59, Andrew Cooper wrote:
>>> This is an unnecessary indirection.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> So, this is the patch causing build chaos.  I've reproduced locally,
> even though I still can't explain what is going on.
>
> One example breakage is:
>
>> In file included from drivers/passthrough/amd/iommu_acpi.c:20:
>> In file included from ./include/xen/acpi.h:41:
>> In file included from ./include/xen/list.h:10:
>> ./include/xen/bug.h:107:5: error: invalid operand for inline asm
>> constraint 'i'
>>     BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);
>>     ^
>> ./include/xen/bug.h:94:20: note: expanded from macro 'BUG_FRAME'
>>     asm volatile (
>> _ASM_BUGFRAME_TEXT(second_frame)                          \
>>                    ^
>> ./include/xen/bug.h:68:5: note: expanded from macro '_ASM_BUGFRAME_TEXT'
>>    
>> ".Lbug%=:"BUG_INSTR"\n"                                                        
>> \
>>     ^
>> 1 error generated.
>> make[4]: *** [Rules.mk:249: drivers/passthrough/amd/iommu_acpi.o] Error 1
> although most translation units fail in the same way.
>
> This is run_in_exception_handler(), but there's nothing obviously wrong
> in the preprocessed source.  The parameters are respectively:
>
> : [bf_type] "i" (0),
>   [bf_ptr] "i" (fn),
>   [bf_msg] "i" (((void*)0)),
>   [bf_line_lo] "i" (((0) & ((1 << (31 - 24)) - 1)) << 24),
>   [bf_line_hi] "i" (((0) >> (31 - 24)) << 24)
>
> which is as expected.
>
>
> There is one difference I have noticed which is clearly relevant but I'm
> not sure how.
>
> __section() isn't exactly __attribute__((__section__(s))), because (just
> out of scope of the patch), __clang__ adds a __used attribute to
> __section().
>
> The logic doing this is ahead of __used being defined, and the TUs which
> break are -DINIT_SECTIONS_ONLY which includes init.h prior to __used
> having being defined.
>
> And yet, there's no un-expanded __used in the preprocessed source.
>
> Also, this only goes wrong in the Shim build, not in the main build.
>
> Also, building the object file in isolation seems to work fine, although
> this seems to remove -DINIT_SECTIONS_ONLY from the cmdline which is
> almost certainly masking what's going wrong.

It is the extra __used in the Clang case.  Taking that out causes
everything to compile fine.

Attempts to minimise the failing case aren't working.  cvise has
minimised to:

void run_in_exception_handler_fn() {
  asm("" ::"i"(run_in_exception_handler_fn));
}

but this is clearly not the same issue because it's not sensitive to the
presence/absence of __used.

I can't help but feeling that "error: invalid operand for inline asm
constraint 'i'" is a knock-on effect from something else, rather than
the original root cause.

~Andrew

