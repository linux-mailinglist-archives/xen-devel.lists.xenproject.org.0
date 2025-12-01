Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59120C965E4
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 10:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175633.1500252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ08d-0005An-Ag; Mon, 01 Dec 2025 09:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175633.1500252; Mon, 01 Dec 2025 09:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ08d-000598-7n; Mon, 01 Dec 2025 09:24:07 +0000
Received: by outflank-mailman (input) for mailman id 1175633;
 Mon, 01 Dec 2025 09:24:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tSLg=6H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vQ08c-000590-0B
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 09:24:06 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a8d1606-ce97-11f0-9d19-b5c5bf9af7f9;
 Mon, 01 Dec 2025 10:24:04 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-640a0812658so250828a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Dec 2025 01:24:04 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6475104fd7asm11908263a12.23.2025.12.01.01.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 01:24:02 -0800 (PST)
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
X-Inumbo-ID: 7a8d1606-ce97-11f0-9d19-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764581043; x=1765185843; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gjl86UMleKeXJVTalJzmHYE5u/oaUaq48LnSt91wgiU=;
        b=Y4OrRQFO+gn3EQQXcmxCCXTGbxJUNFI3mBoGBrYxkwH+AZAh5MbjBTGF4uNN4jtsMu
         gJC+kKO5ua/K+FATepAVeUCtSASJOqXbosxp0Zur+9aNIQOov0zJDaoa/QZCefutRfxu
         caMFA31AEvlt+c7ORYwP8Trvt3YctknbEpEOBRrBxOZ5Pw1I4iF8AFr0L4w1wnzY+KNN
         3DKhbAVRLxkq/RmV32BG4f6PZlHn2fxwJQdhqneVBnIui37xciVMbgI3HGjbtBODwuSJ
         /vjUq3rVEwUWnfUXIeFmAh5/ElIjQYEmQjD+uNqQ5bujDB22SKtOmTaP+sTg+NiGf5cy
         6Z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764581043; x=1765185843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gjl86UMleKeXJVTalJzmHYE5u/oaUaq48LnSt91wgiU=;
        b=fnCZkxlBhmQYlzV+Kq5N8T6Q8qrsisbNbXrqniXpAAdu5TItEGfRJi9wsPQoRiAdz1
         0UUa/44k72fZg7EJs+FU3SRE8hI8GXbrT949WlO9Ybcg2bHEzuKJYyd4YePDtgbG/PJn
         wxyR1GaDquMyet/5NLXXJIs9WRGAZIQ/n2k7vsWPjKxnKQPouB5BF5HEOfkwfRfdcL46
         3XG9HAE5E/xaP+8ki2BoQQBB9eqL6Wbm0h8xRjiB6h5EigWzttpjvhUzz0dqAxHN9Ahp
         W2cT5V0McbvJh7mzwiwmrPqv/ugp0dUCiG3qq2aVB0U+e+sDeASpC2ViDX+TjlBwE550
         Hm4w==
X-Forwarded-Encrypted: i=1; AJvYcCUr0+7onruzbg7XXSBzllMiQ2SJb8Sma7/DYdr2hcdNzrYcvLYuXAvTY03Qf7KpOGbhJhDSTbD04Po=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzN9lzgyePRH2CRcJDLlfkq5zjUFXaY8KJkb7QScafeYbH+tV3
	bbGt36E8Ndg3wtC1u0M/CmZ2xkU04PupceMkrWpPmTYk6bPUHwi0OyjL
X-Gm-Gg: ASbGnctFlBGXmB7T87WxkQVfPM0pjfBFIXet9BMPQ5SjbeIpSREgTnbdOrCVUdmAiho
	uk4Ar36imUNUdczEOeZjadPDj5+NaqljOyDKI4ss300u3pTDoZkTRFJsiRudv70bxEeSeHlceuG
	wRVHpNTYod2FBDzFyy5x9nvlrvPioz73uCfsKjSaOmaafkiFp9W3KQfh3pwZOfK2SKxolerL0FQ
	KUjWVYZ66TcWE8ufw0tH55nADtwWnbprhymcf7OCMyfVvyMrYr//ULJ0mhbWgJ07Jic9u6mBBLm
	9wx1sjuF9CQKEFB0/ESnjaL9l0JwUK94xiQqZBNnAg1ZpjPOr+hUSasmVNVYlsy3NMQB1WqHfkW
	0jK+GUxMX1ViQAvmllCS1yPwWszviq82HLj7VnX3qlHrGg/IVuSFoVZwXTXeR3wv+2hcxBAoYaw
	PPtXeFYLodFCqUAzX6judW8PpWKKKZ3JRMTt501jrUyUNmmEH0L1fSuuR3152woJ9x
X-Google-Smtp-Source: AGHT+IEtqOiXGuT042WRpanUP/NoXdVrppQ7RvY4zWSra4S1bcvJH/FTDtbbXAl3J/dDLg7y2xit4g==
X-Received: by 2002:a05:6402:3510:b0:640:b99c:de83 with SMTP id 4fb4d7f45d1cf-645eb2a87e1mr24300946a12.17.1764581043201;
        Mon, 01 Dec 2025 01:24:03 -0800 (PST)
Message-ID: <74fdbc0e-7919-4a89-8cd4-cc6cf3ffc402@gmail.com>
Date: Mon, 1 Dec 2025 10:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: move vcpu_kick() declaration to common header
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <b009997b5f3e7489fadb5f62f1623fc4d13bf271.1764344988.git.oleksii.kurochko@gmail.com>
 <0173e0bd-130a-4966-b0f1-882f8dd78aa1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0173e0bd-130a-4966-b0f1-882f8dd78aa1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/1/25 9:40 AM, Jan Beulich wrote:
> On 28.11.2025 17:23, Oleksii Kurochko wrote:
>> The vcpu_kick() declaration is duplicated across multiple
>> architecture-specific event.h headers (ARM, x86, PPC).
>>
>> Remove the redundant declarations and move vcpu_kick() into
>> the common xen/include/xen/sched.h header.
>>
>> Drop the definition of vcpu_kick() from ppc/include/asm/event.h,
>> as it is already provided in ppc/stubs.c.
>>
>> Add inclusion of xen/sched.h in the files where vcpu_kick() is
>> used.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.


> albeit preferably with at least ...
>
>> --- a/xen/arch/x86/cpu/mcheck/vmce.c
>> +++ b/xen/arch/x86/cpu/mcheck/vmce.c
>> @@ -12,6 +12,7 @@
>>   #include <xen/event.h>
>>   #include <xen/kernel.h>
>>   #include <xen/delay.h>
>> +#include <xen/sched.h>
>>   #include <xen/smp.h>
>>   #include <xen/mm.h>
>>   #include <asm/hvm/save.h>
> ... this change omitted. This file includes the private "mce.h", which in turn
> includes xen/sched.h.
>
>> --- a/xen/arch/x86/pv/traps.c
>> +++ b/xen/arch/x86/pv/traps.c
>> @@ -10,6 +10,7 @@
>>   #include <xen/event.h>
>>   #include <xen/hypercall.h>
>>   #include <xen/lib.h>
>> +#include <xen/sched.h>
>>   #include <xen/softirq.h>
> Somewhat similarly here, xen/event.h includes xen/sched.h. That's less obviously
> guaranteed, though, so making the include explicit here is likely okay.

I am generally okay with not adding what is probably an unnecessary new header
inclusion, but it is unclear to me why we should avoid including a header just
because it is already included by another one. In other words, if one day someone
removes "xen/sched.h" from "mce.h", is it acceptable for this to result in a
compilation error? How do we decide when such an error is acceptable and when
it is not?

Should the default behavior be that if header X is already included indirectly
through other headers, there is no need to include header X directly?

~ Oleksii


