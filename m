Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A5697A2CC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 15:18:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799521.1209518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqBc2-0008At-AX; Mon, 16 Sep 2024 13:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799521.1209518; Mon, 16 Sep 2024 13:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqBc2-00089K-7p; Mon, 16 Sep 2024 13:17:54 +0000
Received: by outflank-mailman (input) for mailman id 799521;
 Mon, 16 Sep 2024 13:17:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W1kI=QO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sqBc1-00089E-Ix
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 13:17:53 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 141b4f52-742e-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 15:17:52 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8a7596b7dfso652148666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 06:17:52 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b3067sm315908166b.98.2024.09.16.06.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 06:17:51 -0700 (PDT)
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
X-Inumbo-ID: 141b4f52-742e-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726492672; x=1727097472; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kMF5TrLypKNuLHnDGiMejOMsQQNHlG+5NdS4aYkT7pc=;
        b=lEiKcTZ9pTh8thVWYC+IPMeeVoeFQXSxGfsNFPEH0x33tLyP3J57b0JX3YglTqsrob
         g85mGZSwsB3KyoWuK/uNg7C2YCffiz0z5Uec9/NgU1augzeLB5bbDWFt+XfH1tZQRn8B
         TkbNaIhk2KfwyXygE65iGvd+SHQ62eEq79Bv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726492672; x=1727097472;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMF5TrLypKNuLHnDGiMejOMsQQNHlG+5NdS4aYkT7pc=;
        b=d3EEHEwuYBAkj51CjI2duc2MrXIXc3gDnbYa3zzI3vqWsycDMjBJYoAi/Z8VtWXJ3i
         o/iiQxuyFDb2XjAYWLutODQwIBnonYwAMwOcT2oAuCZee0Y8zCTJYSH90mW8aMCUhE+z
         MQ/ZK7jL+k28J7UlYZ2WcxvTWNKOu5Cz7GbvHIA6uhDjpCAK5F3CB2Vul4NalAx7diIn
         L2afmxvkHmtp5PiMjsVgkLaA/bkAZGIS5IrnGv2dfgJcjznv4HzrEeg/mK3q/YaBR9TP
         28pluW8l2X+STQpZB7osxSkP1VRegA7WL453r3PWTyZ+ypVTeLMQT5eyGXpIx4cwU2cS
         SqxQ==
X-Gm-Message-State: AOJu0YwYk7Lc8Il7XksgevCtF3YwSn8lU/UjP1lYabwm53u2STr2Ci8Y
	31wwPxVAelcJeuhrNwvgzg2WMR48iWdPdf3NhsIF7gitqmNpGfTYYdaBTpzOgT4=
X-Google-Smtp-Source: AGHT+IFcwKT/RRhbwto3FLp2E+ywBiX9p60c92Ljtr+ArQp3adoXU8VLS8/tbWxTtUohiiPcY0J7Bg==
X-Received: by 2002:a17:907:e8e:b0:a8d:4954:c209 with SMTP id a640c23a62f3a-a8ffae0018emr2120918366b.22.1726492671957;
        Mon, 16 Sep 2024 06:17:51 -0700 (PDT)
Message-ID: <32136482-10e4-4f3e-ac8b-a05b7718f069@citrix.com>
Date: Mon, 16 Sep 2024 14:17:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Drop stale comment about zeroing the stack
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240916115811.2076392-1-andrew.cooper3@citrix.com>
 <CACHz=ZiemNMMBk7GT9+Y=WLN5zm-M7-QDwa-H760Ca=THPvkNw@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACHz=ZiemNMMBk7GT9+Y=WLN5zm-M7-QDwa-H760Ca=THPvkNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/09/2024 2:16 pm, Frediano Ziglio wrote:
> On Mon, Sep 16, 2024 at 12:58 PM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
>> This used to be true, but was altered by commit 37786b23b027 ("x86/cet: Remove
>> writeable mapping of the BSPs shadow stack") which moved cpu0_stack into
>> .init.bss.stack_aligned.
>>
>> Fixes: 37786b23b027 ("x86/cet: Remove writeable mapping of the BSPs shadow stack")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
>> ---
>>  xen/arch/x86/boot/head.S | 6 +-----
>>  1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
>> index 12bbb97f33d4..cfc5a7b47d29 100644
>> --- a/xen/arch/x86/boot/head.S
>> +++ b/xen/arch/x86/boot/head.S
>> @@ -652,11 +652,7 @@ trampoline_setup:
>>          cmpb    $0, sym_esi(efi_platform)
>>          jnz     1f
>>
>> -        /*
>> -         * Initialise the BSS.
>> -         *
>> -         * !!! WARNING - also zeroes the current stack !!!
>> -         */
>> +        /* Initialise the BSS. */
>>          lea     sym_esi(__bss_start), %edi
>>          lea     sym_esi(__bss_end), %ecx
>>          sub     %edi,%ecx
>>
>> base-commit: a8bf14f6f331d4f428010b4277b67c33f561ed19
> Nice to know!

Indeed, and it certainly helps one of your rearranging patches.

> Acked-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Thanks.

~Andrew

