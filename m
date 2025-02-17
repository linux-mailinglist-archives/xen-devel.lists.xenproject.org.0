Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45340A37F65
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:08:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889978.1299007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjy3G-0005nV-Gk; Mon, 17 Feb 2025 10:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889978.1299007; Mon, 17 Feb 2025 10:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjy3G-0005lF-Dm; Mon, 17 Feb 2025 10:08:34 +0000
Received: by outflank-mailman (input) for mailman id 889978;
 Mon, 17 Feb 2025 10:08:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kh3E=VI=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1tjy3F-0005l9-HM
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:08:33 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 239ee8e6-ed17-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 11:08:31 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30a2f240156so7085351fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 02:08:31 -0800 (PST)
Received: from [192.168.0.110] ([91.123.151.154])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30920af25d6sm12128831fa.6.2025.02.17.02.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 02:08:29 -0800 (PST)
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
X-Inumbo-ID: 239ee8e6-ed17-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739786911; x=1740391711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P5t6aafMCCQ8Lx2bi4pupQQMGzMcyidCDI6/CAVIBxM=;
        b=FAkADKz0h6rzq7RLrsYWZ271xqXv9sr50uS8A/0NiVZOsFsORXHayWp90aqVqRvWcq
         KBxORyjSLqHB9Vkvaz6xCRfRNIdLsW7bWFY6WIfJXXf2/Kd9ESLt6nfCdz4jWh/XAk1Q
         7ZB5Atq1XL9d2Wg+lZqsz/C5tV1xVdinZkx0W+pkcI9RnuKqLDdPTdSflJ710UbJAhDO
         n/TinKCPXqDGo0ATarNifnnPHihPzHzaxtV+I2o7fuJK+SDcy5QEt4Gkcd/Q5Npcqbk6
         0pIuR1qS/2YNscpK3pkJctVrFEPCBEy+DQbnfrOlyvuh4CGGNegjH19bwBTOI1d4Pfsw
         j/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739786911; x=1740391711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5t6aafMCCQ8Lx2bi4pupQQMGzMcyidCDI6/CAVIBxM=;
        b=U612bUUN7uL4dzMy5mCifyA8XU4Hyet+kxXGX0bASquK8OWMZ6Y2VasNNAIfPBXccP
         C49Yf97sH+xzA+UFQvMPPNC9dhx5vp8NMbbIAK9CYjV3ZBgrhl3Szs88WijF1wjvtXAt
         BwP6z1O0lVyW3/n2NxNW45wrt/rRi/egchOdcaamIH/84LKmu4VhHpupg2cZO5To9ZtM
         N7tkIIgKxI5btEtfuGGc9z6lYB9m4DH6bHDIpYomdwAaxfyIvu4p2jQweqONtpXTWxsz
         m2CqRJ0aRgDkM1mIYqn4lm2MzMpRVOhsLvYJZrY9f9RmvwHJA8rJzAju2XTkSrbDmdj7
         Pb+A==
X-Forwarded-Encrypted: i=1; AJvYcCVnk9+zsLoOCiFdLPNZv777i26RpSeFMi2LEwV2lSpLb4Az77MET+y1bHnQ/Ab7O0NDDm4U6HHUfs8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnkugYo1gxzuHYXVFYuXktG3wKAhiqUib6/HvZrPBV4PNa4x2L
	y2ldqB+kQphHdBRraPpGuyhA0z6yIK6ytHhTOVllnDO4v9R4p288
X-Gm-Gg: ASbGncuwuH2jL1feJVMI5qu7rdHkWpR4CBEMm9iAz/h1aV5VVAkPuHOjWh4yCczwUCs
	AI76f+05QEiivcm/LK2yZ9tedS5+JAe8ywumMUvpoYDPeR+A4Yg4JI1qh3in7Vp9lpzOXWac9Sa
	PHoYU42ckstTPB6ER7on9Pay9WuAJaPi854XSyWndl/VGs/87NTNcWXmwX3I96Z1FEvfFnyY5N5
	E9kYZydGfCizt/8zw8+/u2cNLhH9DSjSD3v1EikgFkL4UdXIsGOwFSkkpN4War640EqZDEKaYpF
	OMVsjWMV5/S8WNJPinRn
X-Google-Smtp-Source: AGHT+IGr64CrBOcs7UEqTlYLy3/GXzTHe+/NB4ynD7A6XK5UrgbFX/IPyDcfsKsUccm0HcA9d64Zjw==
X-Received: by 2002:a2e:9209:0:b0:307:dc28:7508 with SMTP id 38308e7fff4ca-30927ad54bamr20702871fa.27.1739786910544;
        Mon, 17 Feb 2025 02:08:30 -0800 (PST)
Message-ID: <4ae4997c-7920-4f8c-b861-ffdea33fea0f@gmail.com>
Date: Mon, 17 Feb 2025 12:08:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/memory: Make resource_max_frames() to return 0 on
 unknown type
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250216211915.3891185-1-olekstysh@gmail.com>
 <95d6fcfd-6ff2-4b88-973a-1bfb29c8d5e4@suse.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <95d6fcfd-6ff2-4b88-973a-1bfb29c8d5e4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17.02.25 11:18, Jan Beulich wrote:


Hello Jan

> On 16.02.2025 22:19, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This is actually what the caller acquire_resource() expects on any kind
>> of error (the comment on top of resource_max_frames() also suggests that).
>> Otherwise, the caller will treat -errno as a valid value and propagate incorrect
>> nr_frames to the VM. As a possible consequence, a VM trying to query a resource
>> size of an unknown type will get the success result from the hypercall and obtain
>> nr_frames 4294967201.
>>
>> Fixes: 9244528955de ("xen/memory: Fix acquire_resource size semantics")
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>


Thanks.

> albeit preferably with an addition:
> 
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -1157,7 +1157,7 @@ static unsigned int resource_max_frames(const struct domain *d,
>>           return d->vmtrace_size >> PAGE_SHIFT;
>>   
>>       default:
>> -        return -EOPNOTSUPP;
>> +        return 0;
>>       }
>>   }
> 
> Wouldn't we better accompany this by an ASSERT_UNREACHABLE() in the default
> case of _acquire_resource()?


Maybe yes, as I understand, normally we won't get to this point, as an 
unknown type will always be rejected earlier in resource_max_frames().
Will add.



> 
> Jan

