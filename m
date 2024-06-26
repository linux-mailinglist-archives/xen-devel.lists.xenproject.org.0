Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C23899198E9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 22:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749469.1157569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMZ9x-00025x-5D; Wed, 26 Jun 2024 20:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749469.1157569; Wed, 26 Jun 2024 20:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMZ9x-00023R-29; Wed, 26 Jun 2024 20:22:29 +0000
Received: by outflank-mailman (input) for mailman id 749469;
 Wed, 26 Jun 2024 20:22:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3iT=N4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sMZ9v-00023J-Vt
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 20:22:27 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd2e08d8-33f9-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 22:22:26 +0200 (CEST)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-6a3652a732fso28365586d6.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 13:22:26 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b57e732b6fsm8775776d6.116.2024.06.26.13.22.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 13:22:23 -0700 (PDT)
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
X-Inumbo-ID: cd2e08d8-33f9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719433345; x=1720038145; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3/LzR6jK3l/gKPb0WTlW/GXBuoMxm8aLVCTlEEHjDFs=;
        b=jHcx/WRw6vOT9tSrlv9DkRhscbeR6QMmEDOei0VA35T3V7Sqyyx3tRLXDhYAZbw4Fk
         AnI0+chD/itSIgkvVCjo/IKoaof9AjbxlDLjMJF6J8w5Al5WWAFUbCJMEmctJKuUq2dM
         FUFlLHccC7yL4vFRZl39RK/qpEnR2+Vc8h47g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719433345; x=1720038145;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/LzR6jK3l/gKPb0WTlW/GXBuoMxm8aLVCTlEEHjDFs=;
        b=sGX290Z/C5/4xFQP2SN33mqUBeQBQuyvP5BNd5oMX7dhKw5PbMGER0rn5JdtWE8j1s
         iOZD6VEU1XnfLjX5H62Cu3h+aiZCsz+qntmIzzO5mK3v+raB3EopabcVi9PCCM6z/f1q
         0mgevXKHxUOtTVT9AwU4eCiDd3xmyEkQBW0UJoDJiBYka448kzKyPm6eliEofnJVHQhw
         tHAJH6n7X/w820cDtMCgecAOkRRdLXT8rXc1Ws86dLFyydaVWsz9Eh6z2eytQX2je6Mc
         MAEd/5tNKtMcV+IICAETKqEo8nn8O4aq48bPT/TapdG9p13VB7WdwuQfWh7gCK47j7ka
         q60w==
X-Forwarded-Encrypted: i=1; AJvYcCXJZDV/b54Z8TLFhoJZggR8udiT1s9qH0rBjF0y/S2qyrk9IhLZupg+kWOBrN+zfzaYN8Oc37K4v09u2DH9SfpuemWed+eRgs7nUP2M4H4=
X-Gm-Message-State: AOJu0Yw11uMWF8joFlBKyHDrLZcxTvp+ZhVndTu8d+tgsH2K4BQq5uks
	qrOLdMvGwMT2pgfjIgwxvRlbAI/FlcTfNWKod359Owg2x2RmZ/p/vlXoQMTFoDU=
X-Google-Smtp-Source: AGHT+IFOyGnpDr70neuE+DaSPSWVfUnP1cQxFty6UoGCpcZWM1VNoA02ieW7D8wz9BXAc2qUg1mmyA==
X-Received: by 2002:a05:6214:1630:b0:6b4:4585:8e43 with SMTP id 6a1803df08f44-6b5409e0c10mr104240376d6.31.1719433344835;
        Wed, 26 Jun 2024 13:22:24 -0700 (PDT)
Message-ID: <e6e7070b-d4c6-4e86-8de0-54726d2e8383@citrix.com>
Date: Wed, 26 Jun 2024 21:22:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] xen/bitops: Introduce for_each_set_bit()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
 <20240625190719.788643-5-andrew.cooper3@citrix.com>
 <38c35f34-a55c-4647-874e-9d88fa899a58@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <38c35f34-a55c-4647-874e-9d88fa899a58@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/06/2024 1:03 pm, Jan Beulich wrote:
> On 25.06.2024 21:07, Andrew Cooper wrote:
>> --- a/xen/include/xen/bitops.h
>> +++ b/xen/include/xen/bitops.h
>> @@ -56,6 +56,16 @@ static always_inline __pure unsigned int ffs64(uint64_t x)
>>          return !x || (uint32_t)x ? ffs(x) : ffs(x >> 32) + 32;
>>  }
>>  
>> +/*
>> + * A type-generic ffs() which picks the appropriate ffs{,l,64}() based on it's
>> + * argument.
>> + */
>> +#define ffs_g(x)                                        \
>> +    sizeof(x) <= sizeof(int) ? ffs(x) :                 \
>> +        sizeof(x) <= sizeof(long) ? ffsl(x) :           \
>> +        sizeof(x) <= sizeof(uint64_t) ? ffs64(x) :      \
>> +        ({ BUILD_ERROR("ffs_g() Bad input type"); 0; })
> I guess the lack of parentheses around the entire construct might be the
> reason for the problems you're seeing, as that ...
>
>> @@ -92,6 +102,20 @@ static always_inline __pure unsigned int fls64(uint64_t x)
>>      }
>>  }
>>  
>> +/*
>> + * for_each_set_bit() - Iterate over all set bits in a scalar value.
>> + *
>> + * @iter An iterator name.  Scoped is within the loop only.
>> + * @val  A scalar value to iterate over.
>> + *
>> + * A copy of @val is taken internally.
>> + */
>> +#define for_each_set_bit(iter, val)                     \
>> +    for ( typeof(val) __v = (val); __v; )               \
>> +        for ( unsigned int (iter);                      \
>> +              __v && ((iter) = ffs_g(__v) - 1, true);   \
> ... affects what effect the "- 1" here has.

Yes, it was this.

After fixing the bracketing, everything is green. 
https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1349243540

~Andrew

