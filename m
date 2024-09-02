Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D539968743
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 14:13:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787842.1197309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl5vF-0005El-VX; Mon, 02 Sep 2024 12:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787842.1197309; Mon, 02 Sep 2024 12:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl5vF-0005CL-Sv; Mon, 02 Sep 2024 12:12:41 +0000
Received: by outflank-mailman (input) for mailman id 787842;
 Mon, 02 Sep 2024 12:12:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qspk=QA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sl5vE-0005CE-1j
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 12:12:40 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4e59643-6924-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 14:12:37 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8695cc91c8so414999866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 05:12:37 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988fea68dsm548246466b.26.2024.09.02.05.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 05:12:36 -0700 (PDT)
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
X-Inumbo-ID: a4e59643-6924-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725279157; x=1725883957; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=90j+JINz63Gkn6hXX1l31V6CyFK2yTL2ActqlAZjhxM=;
        b=q4yq4xQo2e0a3/Kewen7d7qMRPku1ZsM117SUEkufS3RzM9mj5jfzyiPq0IDZVtrGA
         LAMmK3rBN7mnrY0iM4Vpgzc0k0fKVAI40VN3dFImmu4wChcvHQ/Dd0c3zin+74VAScQM
         Z+gzOdNN1GIxgQP15ihPF8RTH0KOl57oxOw9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725279157; x=1725883957;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90j+JINz63Gkn6hXX1l31V6CyFK2yTL2ActqlAZjhxM=;
        b=nBYjnKDLKFxocBOn2Xre/O/YoI+DHpBVbn7v1qrU8Qda5GHmS20B9gdObnvqf1jknG
         1OxC37S3COwFEu+qfE0nHga/cSpi5O758/Ou7c7OmLkTswhRq1lAgZNu5/B5LG+Bh5Ki
         AKoSG456VpmI9cLJE/lkKwgq1kSmKwlBRp1MNQou1YiM7pz+6sICjc1VbiIWAlun+bz3
         vWE3mR3gZ/fQ70SLLcEZaGVK56zn3oieXIeCYJTG1bDF8mPKfI8hkNH/M19CxnY+hCcc
         Ar3B8m54iYMONT3NmFAWP9VIl8ybQDCRumAmvSL0LdLaEMKtn/e9jwqWByN0h5r1IBN1
         q/zg==
X-Forwarded-Encrypted: i=1; AJvYcCWkjpHAA7nNE0rQxXSV9f1uS1zIpz+HzViLPkZGt3cc0gPBeaPoR+cBcpf/JEN59wbDZMpcajzZXZ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3MshOw6UwIY0Ra6TOkflWESMtAsqA77XSoMFjOyBTNLRB3h8f
	QQ4utXwIgM3qASDqF7fJGNEESRkEbB7DE3pfEh0qax+ni4ejjVc7qhWAggz3iWw=
X-Google-Smtp-Source: AGHT+IHmCfmfH4gk9oHtCsBYhtNnmBZB0dIuBR6trFiRZQOzv6pa495RQyn0x3fi5rPr5K9q0Vetfw==
X-Received: by 2002:a17:907:e86:b0:a72:4320:19f3 with SMTP id a640c23a62f3a-a897f930b04mr964856666b.39.1725279156880;
        Mon, 02 Sep 2024 05:12:36 -0700 (PDT)
Message-ID: <d7dec8ec-16ae-4364-9b0d-3d36bc7b8ed2@citrix.com>
Date: Mon, 2 Sep 2024 13:12:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Use <xen/types.h>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240902115912.3145737-1-andrew.cooper3@citrix.com>
 <bbc0be08-690b-467c-9f77-193d3fa38bb9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bbc0be08-690b-467c-9f77-193d3fa38bb9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/09/2024 1:07 pm, Jan Beulich wrote:
> On 02.09.2024 13:59, Andrew Cooper wrote:
>> --- a/xen/arch/x86/boot/cmdline.c
>> +++ b/xen/arch/x86/boot/cmdline.c
>> @@ -31,6 +31,8 @@ asm (
>>      );
>>  
>>  #include <xen/kconfig.h>
>> +#include <xen/types.h>
> And why not include the file centrally ...
>
>> --- a/xen/arch/x86/boot/defs.h
>> +++ b/xen/arch/x86/boot/defs.h
>> @@ -20,14 +20,10 @@
>>  #ifndef __BOOT_DEFS_H__
>>  #define __BOOT_DEFS_H__
>>  
>> -#include <xen/stdbool.h>
> ... here? Both above and ...
>
>> --- a/xen/arch/x86/boot/reloc.c
>> +++ b/xen/arch/x86/boot/reloc.c
>> @@ -26,6 +26,8 @@ asm (
>>      "    jmp  reloc                    \n"
>>      );
>>  
>> +#include <xen/types.h>
>> +
>>  #include "defs.h"
> ... here you have the inclusion ahead of that of defs.h, so there aren't
> any other dependencies (unless something subtle is going on).

Because I intend to delete defs.h entirely.

I've had a bit of fun unpicking __stdcall (looking to remove it
entirely, and replace with fastcall), and we need to shuffle a couple
more macros into macros.h, but all of defs.h can be replaced with
types.h, compiler.h and macros.h

The other problem right now (forcing the order of inclusion here), is
that multiboot*.h implicitly use types.h.

~Andrew

