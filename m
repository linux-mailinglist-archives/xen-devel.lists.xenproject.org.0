Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E5AB09342
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 19:33:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047178.1417627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucSU9-0007OX-Q8; Thu, 17 Jul 2025 17:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047178.1417627; Thu, 17 Jul 2025 17:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucSU9-0007N6-MB; Thu, 17 Jul 2025 17:33:33 +0000
Received: by outflank-mailman (input) for mailman id 1047178;
 Thu, 17 Jul 2025 17:33:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ObpW=Z6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ucSU8-0007N0-Nj
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 17:33:32 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27c8f0dd-6334-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 19:33:30 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4560add6cd2so10398025e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 10:33:30 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45634f85fd1sm28583365e9.25.2025.07.17.10.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 10:33:29 -0700 (PDT)
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
X-Inumbo-ID: 27c8f0dd-6334-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752773610; x=1753378410; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bccVe+5v4XzPn4UrxAi+eHPun4Ac5Aipxi7kGTh1znA=;
        b=chRPK+Rt3YOG0592K7VbsjbeXUaqtZs7Td75UHzKlhK0eGn5DgvFWFnHuXaSzEAuvJ
         gML0j1RpjEJ3xtbwFlZgPOwi+SPO+OyOPkogHqqVlDLXiLzOfuW7PaF27w0EvGOZTOD2
         V4qtrYRcm3RfmmCveQ44OwadT4aJ2MiVHrxg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752773610; x=1753378410;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bccVe+5v4XzPn4UrxAi+eHPun4Ac5Aipxi7kGTh1znA=;
        b=vZAYWiiCWD+n2sWoKDQSf1RuRdwwHRJE0IE8xTO8t8naTlErSdAIxRjKbOhfxoaHmT
         kqnCPdhNweZ9XuM0DUkNd7EnLcPm4JF2u+D2ROQx0RgbFtjjpptT3NOyn4F76anP910L
         6fe3yxwRxQQE6cuzX1by4M+viVwRzym5LpGK1oGTT+q5clrsm1LxCsaUJ3NHpY30f/Td
         d5s7z/NDRSOfqLDePmNnVRyVsshqLQGQRNjIby3xHHyYH00+M5lXnBeylOjZnpLhBmdw
         1IznkCcKiSDqU0Ug/pi/Gh/5kaVvt4kbsPIBvwK9ulrRk6hiTuanOmKVPd0BY9cMw8dz
         HBNg==
X-Forwarded-Encrypted: i=1; AJvYcCUPlu5hftDMu2b88fdhisLaTzpLhTpkr/ApqNMNTcL/UItntBLj8kyczEq2/PqiwSN+r7p7G62PwLY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymmTl5xCh0fzUZ5xcmD5EpIUtgR3M8GvSYnnlRZminEf6mBLpk
	LWcaYo3uniplB+M+kCzQN/bmAbj850l29YEh+7EdJgDIVdDDV/taz3Km0VTQ6b6rZTM=
X-Gm-Gg: ASbGnctPDBWnBgmnpqBeNuhrkJbjBlkWZHOzVz2bvIR7EEnHMyYyJuxNPyH1W775HJy
	IujJfbW6Fw7l61QiSLjrtYbHT7Ea1PaJHPsenEwni9Zc54BLyntQcom+/HV8hfug07gcSs8gDlh
	/NK8WIblRhVcT7mXsql3f5LqiH7TVh6p+hN6d7f558TbDmyo4gWn6kkDzqZnKi0TkxN66P8IeSC
	kgvlZ4FX0UKPvBQjwXmIioODKxGcQFcjfypX1XFd1TQILFgm1Im7z61GT4R3mnhbLCgCT5ewnB/
	kUF2EmKzZ0DwUz87SV/IAh3a2p7ZNwTkAfAl5ghuvtax8PxXJueUEitjhwAjPrh58hYAyOVrBlG
	NlIkSMSrol2NKc+IOYEDYSwe5SxIBKitRbuv/brbFUDbDd3jWolNupi6d50/6fPBU8Sx3
X-Google-Smtp-Source: AGHT+IHUOMVFzchVBh0BdU18KaIt5GSU+yIb1GuLa57qRt20weZMc2ZtD4ySgzxh1K3KO1ydlEe8ww==
X-Received: by 2002:a05:600c:3b94:b0:455:f7d5:1224 with SMTP id 5b1f17b1804b1-456347b5b16mr43260775e9.9.1752773610014;
        Thu, 17 Jul 2025 10:33:30 -0700 (PDT)
Message-ID: <29ec55c7-7117-445c-96ac-c878c715bee2@citrix.com>
Date: Thu, 17 Jul 2025 18:33:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] x86: Break struct x86_cpu_id out of processor.h
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-3-andrew.cooper3@citrix.com>
 <6e1a6ee3-033c-4b44-bb50-be3e90026a8e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6e1a6ee3-033c-4b44-bb50-be3e90026a8e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/07/2025 8:23 am, Jan Beulich wrote:
> On 16.07.2025 19:31, Andrew Cooper wrote:
>> Only 5 files use struct x86_cpu_id, so it should not be in processor.h.  This
>> is in preparation to extend it with VFM support.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with two nits:
>
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/match-cpu.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef X86_MATCH_CPU_H
>> +#define X86_MATCH_CPU_H
>> +
>> +#include <xen/stdint.h>
>> +
>> +struct x86_cpu_id {
>> +    uint16_t vendor;
>> +    uint16_t family;
>> +    uint16_t model;
>> +    uint16_t feature;
>> +    const void *driver_data;
>> +};
>> +
>> +/*
>> + * x86_match_cpu() - match the CPU against an array of x86_cpu_ids[]
>> + *
>> + * @table: Array of x86_cpu_ids. Last entry terminated with {}.
> This reads slightly odd to me: I'd have expected "Last entry needs to be ..."
> or "Table terminated with ...".
>
>> + * Returns the matching entry, otherwise NULL.
> Perhaps add "first"? Due to use of wildcards, multiple entries could in
> principle match.

Both fixed.  The comment really wasn't great to start with.

~Andrew

