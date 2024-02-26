Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0196C86793C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 15:58:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685599.1066570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1recQx-0002EQ-BR; Mon, 26 Feb 2024 14:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685599.1066570; Mon, 26 Feb 2024 14:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1recQx-0002CF-8l; Mon, 26 Feb 2024 14:58:23 +0000
Received: by outflank-mailman (input) for mailman id 685599;
 Mon, 26 Feb 2024 14:58:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdVt=KD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1recQv-0002C8-8e
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 14:58:21 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a59f019-d4b7-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 15:58:19 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d27184197cso37617391fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 06:58:19 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 de38-20020a05620a372600b0078749c88a19sm2533729qkb.0.2024.02.26.06.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 06:58:18 -0800 (PST)
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
X-Inumbo-ID: 7a59f019-d4b7-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708959499; x=1709564299; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KuHciCMiUtxsCMKWCTP1a/IkFfjhZRlK6gsKtMae7oY=;
        b=n6XYWJbraHviR0+108RVBAyw/dP7gVKly5Ear4vFWq6tDoOTPYAiLoR+2yxTfmKAx8
         qQhb1O4wLiZi8qIdjjDObcBUI5apllXBSNZj96mZ3u0n+qb1DsCV0YrwbAp9dLEmbrU5
         ImYX5M+r+uQEfCJjs1qfJqCiqcjURKnX2ScXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708959499; x=1709564299;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KuHciCMiUtxsCMKWCTP1a/IkFfjhZRlK6gsKtMae7oY=;
        b=O3kJS1zOZ+ZHQqdhR/CegoA/JROPWNFav/s+QmrXeIQWaN6H0H7x8YzSUnM2e5TLTB
         ZNR9vKw9lBUDoych3D5mYLgUfGwq/VScWQJEmcYnGOeHoFxMHQJ9KdNFixwyNWTK3odu
         KIB3BG6M9/0xYCxcWUB/Kh638yLZTvxMJlw6JPq7ZowuG2w5iB+s7VDXsKR9WjRjct/c
         3a+RK52WpnlYT2ijOtx6xRlOm4ux4OM+biVU4Up/n3Xqj1tYnbCRjJrjKkzOtVyxiymv
         K6E4YV4HWtS7CCt3NLy8/83DHMS3DNxERILtVO3RF9uYmBB950I8o3F+OUUdE6D/Hop2
         j4tA==
X-Forwarded-Encrypted: i=1; AJvYcCUK2pv7DK2fFwoGOYkqKgPCkE5aH/iXJ1ZW+MSZA+OJx7pi8GX2bwOj5VfiQJygqkiUkT9tZ6kOXpc4eaj3bVcRA9a3nWfvf41SSoul8FQ=
X-Gm-Message-State: AOJu0YxAUAnGtqp+/NimNcvOUCgDCWsofnDBgFXnYBPEF5IpT1EPjuE7
	hoP/abAYf4di8Y+fWpzH5MoAsl11tXSK/ONvSvdYigp0ibKnWlVYEpuu5pzKeYM=
X-Google-Smtp-Source: AGHT+IHazFue5sC/kKfus/eRWOoVcf0/70OTD4Imy1YQYFTHv0AgoTSCiPRy8I94aqraHVuZxtqX3g==
X-Received: by 2002:a05:651c:211a:b0:2d2:8bbf:8fc2 with SMTP id a26-20020a05651c211a00b002d28bbf8fc2mr2205533ljq.34.1708959498811;
        Mon, 26 Feb 2024 06:58:18 -0800 (PST)
Message-ID: <7cc656d6-4bf0-4b53-ab95-5d49238cc876@citrix.com>
Date: Mon, 26 Feb 2024 14:58:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/entry: Introduce EFRAME_* constants
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240226125501.1233599-1-andrew.cooper3@citrix.com>
 <20240226125501.1233599-4-andrew.cooper3@citrix.com>
 <01621599-7d1f-4cfb-9844-06fba32a62aa@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <01621599-7d1f-4cfb-9844-06fba32a62aa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/02/2024 2:32 pm, Jan Beulich wrote:
> On 26.02.2024 13:55, Andrew Cooper wrote:
>> restore_all_guest() does a lot of manipulation of the stack after popping the
>> GPRs, and uses raw %rsp displacements to do so.  Also, almost all entrypaths
>> use raw %rsp displacements prior to pushing GPRs.
>>
>> Provide better mnemonics, to aid readability and reduce the chance of errors
>> when editing.
>>
>> No functional change.  The resulting binary is identical.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with one small request:
>
>> --- a/xen/arch/x86/x86_64/asm-offsets.c
>> +++ b/xen/arch/x86/x86_64/asm-offsets.c
>> @@ -51,6 +51,23 @@ void __dummy__(void)
>>      OFFSET(UREGS_kernel_sizeof, struct cpu_user_regs, es);
>>      BLANK();
>>  
>> +    /*
>> +     * EFRAME_* is for the entry/exit logic where %rsp is pointing at
>> +     * UREGS_error_code and GPRs are still guest values.
>> +     */
> "still/already" or some such to match "entry/exit"?

Ok.

~Andrew

