Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366D596DE79
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 17:38:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791194.1201004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEYf-0003Tv-98; Thu, 05 Sep 2024 15:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791194.1201004; Thu, 05 Sep 2024 15:38:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEYf-0003SQ-57; Thu, 05 Sep 2024 15:38:05 +0000
Received: by outflank-mailman (input) for mailman id 791194;
 Thu, 05 Sep 2024 15:38:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJQt=QD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smEYd-0003SJ-LH
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 15:38:03 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5a8d346-6b9c-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 17:38:01 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8a7596b7dfso122962666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 08:38:01 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a796a2bd6sm67667566b.189.2024.09.05.08.37.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 08:38:00 -0700 (PDT)
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
X-Inumbo-ID: d5a8d346-6b9c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725550681; x=1726155481; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BNb81B1ABWf1AL8e9Pbko8whGkTK+fr3AxvNNVokFJY=;
        b=SZnGt1cGNXsXO4KJDElvW1FuQgivQQowObScKITK6JHi06EWsdA3KppkIuaIOO6jZZ
         2Wu4ElfML9QkDMmFgbGTdWkinld0EUEUtWR/N/krLJP1CkQYRJV/8cQW7bWKk7wuwuqo
         mYoaVW/MPFJ0QNtjKEM/vNMu635KkuykiT6YI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725550681; x=1726155481;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNb81B1ABWf1AL8e9Pbko8whGkTK+fr3AxvNNVokFJY=;
        b=n2mEPlD04yVWr8gL94qNj5q1kPx5bSY6wb++kQn8xvyeMv71cc903ZFl57tgJWImJG
         VYObyZW9IoFD4nA/AJVFViNBxsMwyBk5Yxh/6WAxibrg+WX6MT+gBLVECskekbgFQDvO
         Q/f6s3CInUuGd1168HuLadCKya7YEPM921Ls0dVr3IZDnhx58mNNoRgHYhLrLgqa9HZd
         y5q188iK7+AKYW+LVrnaBkNH42Wp2kvljn8tleK5g0owJQLHOr8bbbShl/HDYDmf8BVc
         yRyJ7sFZLxnjXjYpYABEY5r9kAy6bn7L7vsnkCAbXA+jhVjxhoHNGJoTyqKTzhyBC6N/
         VzTA==
X-Forwarded-Encrypted: i=1; AJvYcCVlFqFJRk3f0ZCBNF3MS5wNrdZHnbk7Jn47AR81xEgbNjv5VyYJsXS/qXfU4oXuyfLMYdzjrPfMscI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOAlif5lVLzCxnwlbUpsxvoaa9RtJtDBSXzXE0L4arTQY9ZCjT
	J+6ckjS2Fo7eWGhKk670GYflDmMmLMY28PgE3tpZPq1xff2a5zX7SubPY5bDXDCW+KEGTbnAaJ2
	N
X-Google-Smtp-Source: AGHT+IE3ogdeszfsEkSVoyyS9ZL6j+VqqcCj+/t7r7G0GWZzrTqwgwyLluhpGD2RYWjMPZslu5RNYA==
X-Received: by 2002:a17:906:4fce:b0:a72:7b17:5d68 with SMTP id a640c23a62f3a-a8a42fb125cmr654248166b.3.1725550680588;
        Thu, 05 Sep 2024 08:38:00 -0700 (PDT)
Message-ID: <0d7aaaea-e674-4a68-8fa0-27cf6caecb96@citrix.com>
Date: Thu, 5 Sep 2024 16:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/acpi: Drop acpi_video_flags and use
 bootsym(video_flags) directly
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Frediano Ziglio <frediano.ziglio@cloud.com>
References: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
 <20240905130657.4075906-2-andrew.cooper3@citrix.com>
 <D3YFYZHD1LCU.PZC83EWK8JAU@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <D3YFYZHD1LCU.PZC83EWK8JAU@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/09/2024 4:05 pm, Alejandro Vallejo wrote:
> On Thu Sep 5, 2024 at 2:06 PM BST, Andrew Cooper wrote:
>> This removes a level of indirection, as well as removing a somewhat misleading
>> name; the variable is really "S3 video quirks".
> nit: Would it be beneficial to rename video_flags to s3_video_flags?

Probably.  Also to give it some named constants rather than magic numbers.

But I think I'll leave that as an exercise to someone with more time.

>
>> More importantly however it makes it very clear that, right now, parsing the
>> cmdline and quirks depends on having already placed the trampoline; a
>> dependency which is going to be gnarly to untangle.
>>
>> That said, fixing the quirk is easy.  The Toshiba Satellite 4030CDT has an
>> Intel Celeron 300Mhz CPU (Pentium 2 era) from 1998 when MMX was the headline
>> feature, sporting 64M of RAM.  Being a 32-bit processor, it hasn't been able
>> to run Xen for about a decade now, so drop the quirk entirely.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
>> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> ---
>>  xen/arch/x86/acpi/power.c       |  2 +-
>>  xen/arch/x86/dmi_scan.c         | 12 ------------
>>  xen/arch/x86/include/asm/acpi.h |  1 -
>>  3 files changed, 1 insertion(+), 14 deletions(-)
> Always nice to see old hacks disappear.
>
>   Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Thanks.

~Andrew

