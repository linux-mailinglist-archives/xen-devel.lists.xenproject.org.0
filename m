Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3488CC2BC
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 16:02:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727730.1132379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mXV-0003mO-QP; Wed, 22 May 2024 14:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727730.1132379; Wed, 22 May 2024 14:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mXV-0003kr-Mw; Wed, 22 May 2024 14:01:57 +0000
Received: by outflank-mailman (input) for mailman id 727730;
 Wed, 22 May 2024 14:01:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9mXT-0003jS-VK
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 14:01:55 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7e74376-1843-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 16:01:53 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a5a4bc9578cso969281666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 07:01:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1787c70asm1780655866b.56.2024.05.22.07.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 07:01:52 -0700 (PDT)
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
X-Inumbo-ID: d7e74376-1843-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716386513; x=1716991313; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9e/6q4LVEqR3l1oMUflAuDP7qSLzmBssTUhZHefql1Q=;
        b=Z7W0NzR1Il98/n+/R8uffi4VhjDqWY81rfwfXgUOESCsAHse/gXpQYcUW1PVhNAPYJ
         YyRrf6RuYp8S4CQMER4wZY2HH4NUoQj6zOXS8jMCXAz3LS0S1+6bRxEQOic5rbG8VwgR
         ZK5oarqBmPlHPUFf16rgMIu0p8dLUXbl7MNGkDCe9AUyL1HobK+X18uK4CvtRJmZ//X9
         jY90aPNjxxy3bsvF/T57QClO6LdVH8q4xhAJFC1GgpGhWfM5loHA39H4FvowdZpAvrxT
         PHb+bbudS8ULnYuNaf3dCdG6/UfrYtaJvlDtNWLnCNJBhWeVeWNYaVNHc2hb/Tv2r/Pi
         0CzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716386513; x=1716991313;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9e/6q4LVEqR3l1oMUflAuDP7qSLzmBssTUhZHefql1Q=;
        b=qCu6g0E/L4+Pq5fsG3U2oJU0GskFkzglAqVr1EL5YPmunHxqKFZAnoYSD9zQUDQk54
         AM/4XOL+rdaObUyzBNlsorOdY6EDDtcGrsV+SYzCMgeFszZqLijkVJB9fBj5XWG5QRlR
         EjiQ92Lgex3Sq+zM+bbNB/YHLxTnk5rBiwAVJrlfQ50kNSkZw221B4ezhZeRKBRtj16i
         lXT9V6CyfbKIenWldmatxykqrj/iZ59U/iDpEgWkuHfSWbLHqzKNYY2mrv71rxt8gGvU
         aqdIrhnVS60prGZHYMiPMvtmpiJHhwnU5yxQx9RzMBBjvnep16IesBnTJJ8bzxuNfYwJ
         E2MA==
X-Forwarded-Encrypted: i=1; AJvYcCXLEbhzRnw08Qrm/NmcixgPqvSXv3bKAB2oMcIbMgz1X+bnZ56qJV/HIamAVr+zv3l5D2IqPxd91uyIZPSz0LR+DOZBF48fNoKklezHqqI=
X-Gm-Message-State: AOJu0Yzp2/AMgA4UQ5dpRboXtP+CqHxeByX8IG+sNENQUXdrBi+rfiHZ
	BO1Qzf2bCYFmQzvC/78q2X+E6fdnlLTRH9ushfxw88ShCz7dWA5D2p6rKOF8EA==
X-Google-Smtp-Source: AGHT+IE/UHt6PbQ9yaDqY3FWicYb/NW+enBGyQdA40YLDPXv7O4f4ocjNAtEfs729l3T+c9NzSzPWw==
X-Received: by 2002:a17:906:d28d:b0:a59:cdf4:f948 with SMTP id a640c23a62f3a-a6228207bdamr207207766b.65.1716386512957;
        Wed, 22 May 2024 07:01:52 -0700 (PDT)
Message-ID: <6d77bd71-400b-4786-ab8c-5ea2b734a8da@suse.com>
Date: Wed, 22 May 2024 16:01:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86: detect PIT aliasing on ports other than
 0x4[0-3]
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <14d35449-fc65-4dcf-95db-8d94dd3455fb@suse.com>
 <df53dd77-9341-4a72-a4ce-33654b2e877d@suse.com>
 <aee2a6f1-c94c-4265-af24-ae54e1ceca96@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <aee2a6f1-c94c-4265-af24-ae54e1ceca96@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.05.2024 15:57, Jason Andryuk wrote:
> On 2024-05-22 08:59, Jan Beulich wrote:
>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -427,6 +427,74 @@ static struct platform_timesource __init
>>       .resume = resume_pit,
>>   };
>>   
>> +unsigned int __initdata pit_alias_mask;
>> +
>> +static void __init probe_pit_alias(void)
>> +{
>> +    unsigned int mask = 0x1c;
>> +    uint8_t val = 0;
>> +
>> +    if ( !opt_probe_port_aliases )
>> +        return;
>> +
>> +    /*
>> +     * Use channel 2 in mode 0 for probing.  In this mode even a non-initial
>> +     * count is loaded independent of counting being / becoming enabled.  Thus
>> +     * we have a 16-bit value fully under our control, to write and then check
>> +     * whether we can also read it back unaltered.
>> +     */
>> +
>> +    /* Turn off speaker output and disable channel 2 counting. */
>> +    outb(inb(0x61) & 0x0c, 0x61);
>> +
>> +    outb(PIT_LTCH_CH(2) | PIT_RW_LSB_MSB | PIT_MODE_EOC | PIT_BINARY,
>> +         PIT_MODE);
>> +
>> +    do {
>> +        uint8_t val2;
>> +        unsigned int offs;
>> +
>> +        outb(val, PIT_CH2);
>> +        outb(val ^ 0xff, PIT_CH2);
>> +
>> +        /* Wait for the Null Count bit to clear. */
>> +        do {
>> +            /* Latch status. */
>> +            outb(PIT_RDB | PIT_RDB_NO_COUNT | PIT_RDB_CH2, PIT_MODE);
>> +
>> +            /* Try to make sure we're actually having a PIT here. */
>> +            val2 = inb(PIT_CH2);
>> +            if ( (val2 & ~(PIT_STATUS_OUT_PIN | PIT_STATUS_NULL_COUNT)) !=
>> +                 (PIT_RW_LSB_MSB | PIT_MODE_EOC | PIT_BINARY) )
>> +                return;
>> +        } while ( val2 & (1 << 6) );
> 
> You can use PIT_STATUS_NULL_COUNT here.

Indeed, and I meant to but then forgot. Thanks for noticing.

> With that:
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks.

Jan

