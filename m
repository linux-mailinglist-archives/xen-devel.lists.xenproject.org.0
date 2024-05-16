Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255308C766D
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 14:31:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723280.1127996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7aGa-0003PH-E4; Thu, 16 May 2024 12:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723280.1127996; Thu, 16 May 2024 12:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7aGa-0003Mz-Ap; Thu, 16 May 2024 12:31:24 +0000
Received: by outflank-mailman (input) for mailman id 723280;
 Thu, 16 May 2024 12:31:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lir8=MT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s7aGY-00010i-LH
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 12:31:22 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3356c494-1380-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 14:31:21 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-520f9d559f6so902460e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 05:31:21 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c34fed1sm10355362a12.96.2024.05.16.05.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 05:31:20 -0700 (PDT)
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
X-Inumbo-ID: 3356c494-1380-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715862680; x=1716467480; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wPrPh7gWtAYkvlpDuB8QIJDgNh4So4IIXhJClXiAi+A=;
        b=RaMFKC0A0vUk/lvH8P+1UZ5GfbhuKUUvsK0e0PjURe1UzrlHMRGFPVSx+n78xI6wAG
         f87FZR9/xnKeoRfz99BxZAHb/djx/Sg/jMUOCyjYbWk3lRexZaoq8V0PJRUDBZTKnEAG
         +GZlZxrvGGY83IVNpGkiwOBiQygFm3DYV5dWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715862680; x=1716467480;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPrPh7gWtAYkvlpDuB8QIJDgNh4So4IIXhJClXiAi+A=;
        b=o3Nath6moY+Z8hoy9wQy3ecHHHKJmUECHzIeNDVwLthhXxvJw5micuJd/2DStme/oS
         H1hd2CZfHhsJrPG+VpXp8C3DMF8rTxs11Cd+NnraPUJsMKWp8jt+CgWDLxbgoIoOzC5l
         OKnlDsIZyZDQBseQFYBuMg0tPXyDMbosxoCx2H8yYrf1UUwkH/PD2d6mpcWZhDiLIwkE
         +acdehVkrEptQusmlzOV8wnoAGHcvGydUJi2dGRb5kZ0vUCPIOX1xoqGWkwoddWhiSt/
         GgtUAMjDIaf5oSY5nob4nxTF8oRBqq4UNArtbLCP/zFtMit8BFKBpLWzYFLfjcxFRmZH
         2V3A==
X-Forwarded-Encrypted: i=1; AJvYcCUVQCOeY1kfcljMQod1q8fBPDpgtIgSIQUrSGlYJAVtmJfhOIsC+uLOFYmwQcZQsMtatUGiJ7GiwZyBgjUh0Avo6HjXSzwHeCjnheb50Y8=
X-Gm-Message-State: AOJu0YxfB0/jBFowuFGLyqMjHaG7UHgYiR65yshxVE6iHoOUR/9njUsp
	eJ29V5I6K99NCTTQQCqI6IuXFkeyQ7BfKqz6aANmIpCrcaFYO4hsw4nSHN/JlC4=
X-Google-Smtp-Source: AGHT+IF3nDhH9LYtt/iQWz4RRaI6H2Gn+1QrjsiyCqehySKP46LMIOQnBqrSYG8g4ifRufiESkQ7nQ==
X-Received: by 2002:a19:8c56:0:b0:51d:a87e:27e6 with SMTP id 2adb3069b0e04-5221006e5a4mr11256617e87.67.1715862680481;
        Thu, 16 May 2024 05:31:20 -0700 (PDT)
Message-ID: <f4621fbf-50b8-45a2-aa4c-b94572753573@citrix.com>
Date: Thu, 16 May 2024 13:31:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Further fixes to identify "ucode already up to
 date"
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Fouad Hilly <fouad.hilly@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240516113103.3018940-1-andrew.cooper3@citrix.com>
 <7d8fa536-f196-46e8-870f-0cfb57c8a65d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7d8fa536-f196-46e8-870f-0cfb57c8a65d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/05/2024 12:44 pm, Jan Beulich wrote:
> On 16.05.2024 13:31, Andrew Cooper wrote:
>> When the revision in hardware is newer than anything Xen has to hand,
>> 'microcode_cache' isn't set up.  Then, `xen-ucode` initiates the update
>> because it doesn't know whether the revisions across the system are symmetric
>> or not.  This involves the patch getting all the way into the
>> apply_microcode() hooks before being found to be too old.
>>
>> This is all a giant mess and needs an overhaul, but in the short term simply
>> adjust the apply_microcode() to return -EEXIST.
>>
>> Also, unconditionally print the preexisting microcode revision on boot.  It's
>> relevant information which is otherwise unavailable if Xen doesn't find new
>> microcode to use.
> Since you do this for the BSP only, I'm okay with that. Doing this for all
> CPUs would have added too much verbosity imo, and I would then have asked
> to log the pre-existing revision only when no update would be done by us.
>
>> Fixes: 648db37a155a ("x86/ucode: Distinguish "ucode already up to date"")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with one small request related to the remark above:
>
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -881,6 +881,8 @@ int __init early_microcode_init(unsigned long *module_map,
>>  
>>      ucode_ops.collect_cpu_info();
>>  
>> +    printk(XENLOG_INFO "Boot microcode revision: 0x%08x\n", this_cpu(cpu_sig).rev);
> Can this please be "BSP" or "Boot CPU" instead of just "Boot", to clarify
> which CPU's information this is? I'm pretty sure you too have hit systems
> where firmware doesn't update all cores.

I'll switch to BSP.

I have further plans (4.20 at this point) to reduce logspam.

* The AP boot path should warn if it finds a revision which isn't the
bsp_orig version, cached version, or thread-0 revision.  Most of what is
printed right now is expected and normal in the system.

* Late load should print once, not once per CPU.

~Andrew

