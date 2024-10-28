Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F8D9B365D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 17:23:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826830.1241252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5SVw-0003P9-KM; Mon, 28 Oct 2024 16:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826830.1241252; Mon, 28 Oct 2024 16:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5SVw-0003MX-HI; Mon, 28 Oct 2024 16:22:44 +0000
Received: by outflank-mailman (input) for mailman id 826830;
 Mon, 28 Oct 2024 16:22:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5SVv-0003MR-2L
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 16:22:43 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daa3571f-9548-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 17:22:41 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a99f1fd20c4so649888966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 09:22:41 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b331b0d44sm387376266b.187.2024.10.28.09.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 09:22:40 -0700 (PDT)
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
X-Inumbo-ID: daa3571f-9548-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730132560; x=1730737360; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S9r1AOXX79dMDitDZP8094KbsR0t3/bmLUeSgYO5vjw=;
        b=ZniQOPW/4kwQDl5A/pyeK6Jy/bTt4e2kAxVZeb4txpGOYJOjY6+jWMRSc7xJF5f7cS
         +i9Uwhzktz9DWnH8BwgEYml8JuuI1FlIUbCXC3fIl6KEvr//kGrVNHnIaE62X4ZRw8+4
         /V0VwaDO0MpLlaha/91YbLxJGBPaKvw1pPCcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730132560; x=1730737360;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9r1AOXX79dMDitDZP8094KbsR0t3/bmLUeSgYO5vjw=;
        b=qTacfdDI+bpuL/t2xq/G7a0bbxvkSURafeXy5mo2X8Y5KlCWp1C3s+ygS5sgeMOJtJ
         pSYOaLZJlJFBuLsMRAzrUJ/Kj9YhlnaIITCYQqYUVutM1B72rp+0pH0XZxSC/2edk7Hj
         yiF913xa1CpEeg+6LspEfG7QVt6gNygwAhS7JvyWbuKYFRad363hfGmkpte/tn+UH/V6
         zwdDTB/kzdzrjQVczlemBDhquBtSjd35kmBEKfAT6yWN6SuumcKgYp43BO/I3n4scrHY
         1NMERiAnj8Qj0uKZsT9ISZ3jrd4xJf4Y13yFjoR3NkfimhYeoh7BoBeXoYXjicqJkGok
         0S4g==
X-Forwarded-Encrypted: i=1; AJvYcCUV5HZHocHutjkDfz3A5JcSwN/jBIwSSinmuWrmdMXKtivU8v9TCqtp8LAfI9eAlZ3aqp8eTcm9heQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAGAUjaQHDow25Om74P5MY8DH3Yr5D2EjVeS4aSChovr6BUrzz
	VmJP/2axRfhVwzCOpAeFjFw45LdHigbrFW+w9BFRlTTdAt5l1z+4XUpQD2TYqzakSbvGzgmir2O
	x
X-Google-Smtp-Source: AGHT+IErECNCNwgmzkqhwkuGcEdhNeEw7Bg+N5Fsg2t+J+elnKyNVEiIJL74uix6FHJd9su9lK+k4g==
X-Received: by 2002:a17:907:7d87:b0:a9a:f0e:cd4 with SMTP id a640c23a62f3a-a9de619a63bmr918745566b.55.1730132560530;
        Mon, 28 Oct 2024 09:22:40 -0700 (PDT)
Message-ID: <1b3b07f9-f949-4b4b-ab33-4282929db220@citrix.com>
Date: Mon, 28 Oct 2024 16:22:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] x86/ucode: Drop ucode_mod and ucode_blob
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-10-andrew.cooper3@citrix.com>
 <f4a7cb7a-2b76-4d97-adbb-430bfcd0d054@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f4a7cb7a-2b76-4d97-adbb-430bfcd0d054@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/10/2024 4:04 pm, Jan Beulich wrote:
> On 28.10.2024 10:18, Andrew Cooper wrote:
>> @@ -789,23 +734,47 @@ static int __init early_update_cache(const void *data, size_t len)
>>      return rc;
>>  }
>>  
>> +/*
>> + * Set by early_microcode_load() to indicate where it found microcode, so
>> + * microcode_init_cache() can find it again and initalise the cache.  opt_scan
>> + * tells us whether we're looking for a raw container or CPIO archive.
>> + */
>> +static int __initdata early_mod_idx = -1;
>> +
>>  static int __init cf_check microcode_init_cache(void)
>>  {
>>      struct boot_info *bi = &xen_boot_info;
>> +    void *data;
> Afaics the sole reason this isn't const void * and ...
>
>> @@ -819,7 +788,7 @@ presmp_initcall(microcode_init_cache);
>>   */
>>  static int __init early_microcode_load(struct boot_info *bi)
>>  {
>> -    const void *data = NULL;
>> +    void *data = NULL;
> ... you're actively dropping const here (which I consider bad) is
> find_cpio_data() wrongly taking void * as 2nd parameter.

No; it's only one of 2 reasons.

>  Internally it
> copies the parameter to a const char * variable, so the non-const param
> is bogus.

... and then back into a non-const variable, hence why such a change
doesn't work.

>  With the const here retained and const added further up (on
> top of a trivial prereq patch adjusting find_cpio_data(), which I've
> just sent out):
> Acked-by: Jan Beulich <jbeulich@suse.com>

Only after this series has make const-ness consistent through this
logic, can you go about changing CPIO.

~Andrew

