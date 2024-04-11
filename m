Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BE48A14A0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 14:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703900.1099857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rutYV-0007If-Ev; Thu, 11 Apr 2024 12:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703900.1099857; Thu, 11 Apr 2024 12:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rutYV-0007G8-Bh; Thu, 11 Apr 2024 12:29:27 +0000
Received: by outflank-mailman (input) for mailman id 703900;
 Thu, 11 Apr 2024 12:29:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZ5N=LQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rutYT-0005wZ-QT
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 12:29:25 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20de0d12-f7ff-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 14:29:23 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-346b96f1483so329203f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 05:29:23 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t7-20020a05600c198700b0041622c88852sm5406647wmq.16.2024.04.11.05.29.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 05:29:22 -0700 (PDT)
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
X-Inumbo-ID: 20de0d12-f7ff-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712838563; x=1713443363; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tcvsdHApO6NhTyLkZGCPDIhAvFpDPS+Tlct1fEu3bTE=;
        b=c4B+II5Fa/ylQJ5oOmXaRIZMijhesDiaVeEj+vEOmLfiZYzJomquJ+w/YUvoRwesDZ
         R5iErVOH1D9L167vjAPxnk6pdQOXrmBtOm7CEUj7lma9URhBTXEG1dawjO1BmJrtS1KC
         4/3c4PD0XRoFK7w1CmJJYTh7xqA0PQ/tzObDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712838563; x=1713443363;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcvsdHApO6NhTyLkZGCPDIhAvFpDPS+Tlct1fEu3bTE=;
        b=Mxo83vq59jekMY/b1xODKWaPtErqFTwt+UH1sEFvEffmKJwCA8ZyxYH7aNQFvhqjZA
         QUXmhlnwQyBHFi/+izUpMvbQLMivA9vfoZobrin5shFKtSF1NyZPvyJaaZ6gemklNJiz
         Iw4kcy8PIyfLNyRoXcmnAjvVR11gn48MzAjLNKgm1jmMnV6vCyheY18riKZLsrFblp4A
         IT30Rf0mglQ66ly4Qu7niQY6thxOj3vQYizADvGjqfI0vwXP51B02Sq3UnofxCvOYKGn
         eG4i31oRn/Y9QImfzdOuUGCu2bX8MuIaQC9kVYPIiSkAMgWAE/WyMGVqfZdQiWJCYljD
         35Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWdcTRR/yeDsl5VqPZRyYAyOGvu0Kq+m00wBmbm0xdH94uwzU3R2xP8kN2gD6ckbOmln7cr+dWFUm6QmsDXcEGEJcRNZ9z5/xkn2NgfbKc=
X-Gm-Message-State: AOJu0YwJ+mzNtcfKcansJ9io6t6XOjwqm/M8BosaV9s7kwYzqneEXzH3
	BbxWzv1ViYEm8f0kTO3CLPd8IDljQWE/jUSAFoxInWFsg5kWYfCcp1AofWmLumI=
X-Google-Smtp-Source: AGHT+IE0LpBnVFIK4EoyooRPFK0T0Y87BjwBGXeKTF5wsJP5ae3h7I35TsO5NfrqUiwKRga1d/ruNA==
X-Received: by 2002:a5d:44cc:0:b0:346:aac5:add8 with SMTP id z12-20020a5d44cc000000b00346aac5add8mr1980338wrr.6.1712838563098;
        Thu, 11 Apr 2024 05:29:23 -0700 (PDT)
Message-ID: <9c552c86-a915-48b0-9a62-fdcb051ed53e@citrix.com>
Date: Thu, 11 Apr 2024 13:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/include: move definition of ASM_INT() to
 xen/linkage.h
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20240403120323.18433-1-jgross@suse.com>
 <e401ffe1-de4b-4548-8eba-feb7e85c9971@suse.com>
 <018e20ba-f15b-48e7-9333-19f6e570d55f@citrix.com>
 <47374e80-4ac3-44d4-a440-5fbebc0c6a6c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <47374e80-4ac3-44d4-a440-5fbebc0c6a6c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/04/2024 3:22 pm, Jan Beulich wrote:
> On 03.04.2024 15:59, Andrew Cooper wrote:
>> On 03/04/2024 1:51 pm, Jan Beulich wrote:
>>> On 03.04.2024 14:03, Juergen Gross wrote:
>>>> ASM_INT() is defined in arch/[arm|x86]/include/asm/asm_defns.h in
>>>> exactly the same way. Instead of replicating this definition for riscv
>>>> and ppc, move it to include/xen/linkage.h, where other arch agnostic
>>>> definitions for assembler code are living already.
>>> And this is why I didn't make a change right away, back when noticing the
>>> duplication: Arch-agnostic really means ...
>>>
>>>> --- a/xen/include/xen/linkage.h
>>>> +++ b/xen/include/xen/linkage.h
>>>> @@ -60,6 +60,8 @@
>>>>  #define DATA_LOCAL(name, align...) \
>>>>          SYM(name, DATA, LOCAL, LASTARG(DATA_ALIGN, ## align), DATA_FILL)
>>>>  
>>>> +#define ASM_INT(label, val)    DATA(label, 4) .long (val); END(label)
>>> ... to avoid .long [1]. There's no arch-independent aspect guaranteeing
>>> that what .long emits matches "unsigned int" as used e.g. in the
>>> declaration of xen_config_data_size.
>> I'd forgotten that point, but I don't think it's a good reason force
>> every architecture to implement the same thing.
> Of course.
>
>> Borrowing a trick from the alternatives, what about this as a sanity check?
>>
>> diff --git a/xen/tools/binfile b/xen/tools/binfile
>> index 0299326ccc3f..21593debc872 100755
>> --- a/xen/tools/binfile
>> +++ b/xen/tools/binfile
>> @@ -35,4 +35,10 @@ DATA($varname, 1 << $align)
>>  END($varname)
>>  
>>          ASM_INT(${varname}_size, .Lend - $varname)
>> +.Lsize_end:
>> +
>> +        .section .discard
>> +        # Build assert sizeof(ASM_INT) == 4
>> +        .byte 0xff - ((.Lsize_end - ${varname}_size) == 4)
>> +
>>  EOF
> Hmm, tools/binfile may not be involved in a build, yet ASM_INT() may
> still be used. Since there may not be any good place, I think we're
> okay-ish for now without such a check.
>
>> Ideally we'd want BYTES_PER_INT here but it turns out that doesn't exist
>> in Xen.  If we find an architecture where .long isn't the right thing,
>> we can make ASM_INT optionally arch-specific.
> We don't even need to go this far - merely introducing an abstraction
> for .long would suffice, and then also allow using that in bug.h.

Ok.  I'll take this patch as-is for now.  We can abstract away .long later.

~Andrew

