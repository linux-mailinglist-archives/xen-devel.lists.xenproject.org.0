Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A86FBA64EC5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 13:29:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916783.1321821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9az-00007i-4e; Mon, 17 Mar 2025 12:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916783.1321821; Mon, 17 Mar 2025 12:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9az-00006V-1t; Mon, 17 Mar 2025 12:29:29 +0000
Received: by outflank-mailman (input) for mailman id 916783;
 Mon, 17 Mar 2025 12:29:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kom6=WE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tu9ax-00006N-NB
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 12:29:27 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 767fd4a2-032b-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 13:29:25 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-390effd3e85so3583814f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 05:29:25 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7eb92csm15209457f8f.91.2025.03.17.05.29.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 05:29:24 -0700 (PDT)
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
X-Inumbo-ID: 767fd4a2-032b-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742214565; x=1742819365; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=823G+J4ZKO7/nLi4x73IIWjsB5UpvNUVZTwsq9acxgI=;
        b=B//G1WU/Vp1VGlf0M1qX0d4qpLM4XNslbsO2ofdSGJ6pgiQXd4apK/5GfLTHMjothE
         ehIrEw1563/vGHR1+wkfuIlFsupEV5HXCeP6M+cDxLtAZk8si7s9izqgA9IDRW/X2Wnm
         /O0yvA/xcKDmsVXcu/9eF0S2EH/JTvmo9s9FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742214565; x=1742819365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=823G+J4ZKO7/nLi4x73IIWjsB5UpvNUVZTwsq9acxgI=;
        b=ZJFR4uE4rf9oiD7JkG/iCZBjttG5nx5xA/2WZOHSEAyUl74peMdE4jdLZjVBUWtqw7
         QbR5NGUVb4J44KLOQJ5DQKMsRnmo2YBOOakoLJcLjZI4U7djh4uNIx94HKJLPEL0odD5
         rPfBxpt/q6S6ordVs+3Tn+LQFAULQj7adUWvwuKXyg1qLEDCUjMlQfHUihZg6Gyum4jN
         IGeusHNof3b2gmRRctlOBEXcHT18ky9c3atiSN0HuBAD6mxg5uUSob7Q/ewYB/PsWQgN
         lKN+brCV+mGkf0X+XU3hBW6gyakPB09/K88hyGNVF/dUyh9np5FmH6y8FwvT8OiUGh7T
         TrYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb32YqrRGyEU7XBar7QCC2C02mOZE/GgzKxdEULmQAueGCF8CLfzyNMsve86hgsOVKS3Xg/2ZWKkc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaM7Gnf5ZBLy9iiSLgBXzXks/vCXVhRNWC+Am7gau+Am0dg7dA
	qWdExOtguNQRd0OV8g59hGVdDRq6a7egAzRAp2nbm8zUPd4iiy8IIu2MUEJg70U=
X-Gm-Gg: ASbGncvcaUBf6wJGk9q04thwodp/xQwyprHzf+n9anmpgwDo94+VA06U+pOT0uptlVi
	IobDupwFCxz5jJggzW7h0+SMEwiLRHIEaV9GYD7SeCOsTemHYUXMDjSPhtc+3tGnngnZsP1BEkI
	L0M+5W0lzgjLW9PPA36Id+Bh7bjxEpkAIJDiHAwgAWAd0HYaD/b81NOGghT+tFjIcGwHnblp+az
	bvDt5FLw3XWc8CUSlQJsxPBsX2PGRJz5p/7ijzBhoL9HpErexysa1hoxbPFZ4pNu3uVx3ToAaGG
	q227T3z8Q77fIjMjs+rijinoXqPg1JYRTNmifr5/D9VI2D/qHjVMoajX6GoSGqqbdx636QwxuQR
	NJK7ggBVO
X-Google-Smtp-Source: AGHT+IFXULe/XJktsZh8T2eGd/Lm0QEzKIGL4RKkIQYEUGPZdkIt9s7Fr9r6Q80sJspkIPdbaYYhyA==
X-Received: by 2002:adf:a31b:0:b0:390:eb50:37c3 with SMTP id ffacd0b85a97d-3971e0bfa2emr10936941f8f.27.1742214565108;
        Mon, 17 Mar 2025 05:29:25 -0700 (PDT)
Message-ID: <46821c0b-45ca-4016-a997-518ea29475c7@citrix.com>
Date: Mon, 17 Mar 2025 12:29:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/traps: Drop incorrect BUILD_BUG_ON() and comment in
 load_system_tables()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250314183346.77356-1-andrew.cooper3@citrix.com>
 <5fa5f84b-0cae-4757-af06-155d68de3209@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5fa5f84b-0cae-4757-af06-155d68de3209@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/03/2025 9:03 am, Jan Beulich wrote:
> On 14.03.2025 19:33, Andrew Cooper wrote:
>> It is only the hardware task switching mechanism which cares about a TSS being
>> at least 0x67 bytes long.
> I/O bitmap accesses are where this particular limit comes into play. For
> 32-bit task switching a slightly shorter one would still do, I think?

Even by x86 standards its a terrible hack.  32-bit task switching
mandates 0x67, even though the IO bitmap is not accessed for the
outgoing or incoming task.

For IO accesses in general, a limit shorter than the IO bitmap pointer
means no IO bitmap, and IO accesses in Ring3 take #GP.

>
>>  Furthermore, since this check was added, the limit is now 0x6b if CET-SS is
>> active.
> Which isn't reflected at all in struct tss64: Aiui that's an addition to the
> 32-bit TSS only.

0x67 isn't relevant to tss64 either.  It's strictly for hardware task
switching, which is strictly for 32bit.


>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -900,8 +900,6 @@ void load_system_tables(void)
>>  		wrmsrl(MSR_INTERRUPT_SSP_TABLE, (unsigned long)ist_ssp);
>>  	}
>>  
>> -	BUILD_BUG_ON(sizeof(*tss) <= 0x67); /* Mandated by the architecture. */
>> -
>>  	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
>>  			 sizeof(*tss) - 1, SYS_DESC_tss_avail);
> All of the above said, the removal worries me primarily with the sizeof()
> still in use here.

Xen uses IST4 but not IST5.

Xen could set the limit to 67 (== 0x43) and everything would continue to
be fine.  In fact, this is quite possibly a better option than poisoning
IST[5..7].

I'm deleting the BUILD_BUG_ON() because everything about it, even the
comment, is incorrect for Xen.

~Andrew

