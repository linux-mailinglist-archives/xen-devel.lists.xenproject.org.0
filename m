Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FE09739DC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:30:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795652.1205064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1sK-0004AJ-TC; Tue, 10 Sep 2024 14:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795652.1205064; Tue, 10 Sep 2024 14:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1sK-00047B-Q7; Tue, 10 Sep 2024 14:29:48 +0000
Received: by outflank-mailman (input) for mailman id 795652;
 Tue, 10 Sep 2024 14:29:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so1sI-000473-GF
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:29:46 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f893da7-6f81-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 16:29:44 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d2b4a5bf1so114463866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 07:29:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ce9732sm488927566b.151.2024.09.10.07.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:29:43 -0700 (PDT)
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
X-Inumbo-ID: 1f893da7-6f81-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725978584; x=1726583384; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lMupAigUAFMTX8s9ijgnH5O07hYh+HPlIchUXaApAOU=;
        b=LXxhsEkWzVGQ1Bv93SRH6f2a7gKBJlCwVJXTtqv4v4b4Rm0zgTpY9OC60zsdB1tF61
         t/XYmcRxr7tR3ixOBC9wD1iy5dVl2/kUrGriNUapjluraeDZrDKz5YAK4iN75s2EDkR7
         rJWkgbF6hEXl2CmGSBEutiF7m0Ae0B9ofVu+OwyY7+85n0YSN7c4V6tYqVqjwjpMyDML
         qiIFK0un+dN0xUqF4w4v7bpyXiOuhCICQ8Z4yeN5mM411c2dNih45hevTpqfqxrAEc9K
         seLg9Z6NU5AC62NXN63SPx6PASGhw5mJ4dyvGbIiSP/B43n08lx46h82kQCKoBg9dhg6
         Ol8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725978584; x=1726583384;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMupAigUAFMTX8s9ijgnH5O07hYh+HPlIchUXaApAOU=;
        b=MGgorWCh1tRC/cCgKl+WytDp1IANYWgW/ZUEzep5gqIfL3PmNoZIlOcs4+FyzfIFL5
         TJnH0fRK7jZzV83wK0Qw8bjep/7VQg4wbISqhVG5cDPXTe17JIQK6ma+orFB0F4fMEFH
         bgUMwLnLgAxwfAyrOZBmxWvbgeaXe4LvyyTgLVMAqcRxjuq9whR9psxQrmvUbD2V8B/o
         /D6FHIEmDg7TanvGl3cE53rxM4z+O3leG78b8BGCXT2pB8hyZNj9ZFZkKFlg+K7vvRzX
         xtNFVIZ1nKrXZocSFMtVLr7HYC/7R43m/XBfRBKetZEVwtr7JAoSiygvKRO8C5FbUiU4
         V10g==
X-Forwarded-Encrypted: i=1; AJvYcCWeUiMtnXhWfvG04X7muD1I/GI/HPLtGSk8/y+/IKE9Zoq9YGqu3XU02sj3C2tK9teC8zvVkDI97yU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9CsCYTe2aBsNePx4jGdlhyYDlfE2/4zxzBOKwfGghWtclpMfS
	MO+SEalDQBI4oOUe9J+H/maLyNV7OmWaNhS7Nc07uEilktX9vWl9YQbBqayrhgQObqS+a0UK90w
	=
X-Google-Smtp-Source: AGHT+IELwH9KBj84r5e+67IuPSozWSYDQzk7+fAva82QAPNq+iYQes2pa3USQW2dzNWYxHiTO/J5wQ==
X-Received: by 2002:a17:907:968e:b0:a7a:a960:99ee with SMTP id a640c23a62f3a-a8ffab9759bmr93882166b.32.1725978583681;
        Tue, 10 Sep 2024 07:29:43 -0700 (PDT)
Message-ID: <7d55bda8-222a-46c8-a810-79ba5c0928d3@suse.com>
Date: Tue, 10 Sep 2024 16:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] x86/time: introduce command line option to select
 wallclock
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240909145455.7517-1-roger.pau@citrix.com>
 <20240909145455.7517-4-roger.pau@citrix.com>
 <985c0d70-55de-43ba-a1b3-811487bb05be@suse.com>
 <ZuBFNu_GFygZwvil@macbook.local>
 <a52b019c-3f1c-4528-91f4-7bc1258c87d9@suse.com>
 <ZuBWsn2wgf9g1Nyv@macbook.local>
Content-Language: en-US
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
In-Reply-To: <ZuBWsn2wgf9g1Nyv@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.09.2024 16:24, Roger Pau Monné wrote:
> On Tue, Sep 10, 2024 at 03:49:52PM +0200, Jan Beulich wrote:
>> On 10.09.2024 15:10, Roger Pau Monné wrote:
>>>  Would you be fine with
>>> adding the following in init_xen_time():
>>>
>>>     /*
>>>      * EFI run time services can be disabled form the command line, hence the
>>>      * check for them cannot be done as part of the wallclock option parsing.
>>>      */
>>>     if ( wallclock_source == WALLCLOCK_EFI && !efi_enabled(EFI_RS) )
>>>         wallclock_source = WALLCLOCK_UNSET;
>>>
>>>     if ( wallclock_source == WALLCLOCK_UNSET )
>>>         probe_wallclock();
>>
>> ... this is probably the best we can do (nit: s/form/from/ in the comment;
>> maybe also "..., hence the check done as part of option parsing may not
>> suffice" or some such).
> 
> I didn't put in my previous reply, but I've removed the efi_enabled()
> check from the option parsing and instead added this comment:
> 
>         /*
>          * Checking if run-time services are available must be done after
>          * command line parsing.
>          */
> 
> I don't think there's much point in doing the check in
> parse_wallclock() if it's not reliable, so your reference in the
> comment to "the check done as part of option parsing" is no longer
> valid.

Hmm. Rejecting the option if we can is reasonable imo. "efi=rs" can imo only
sensibly be used to override an earlier "efi=no-rs". Hence what we see while
parsing the wallclock option gives us at least reasonable grounds to reject
the option if EFI_RS is already clear. We then merely fail to reject the
option if the flag is cleared later.

Yet in the end I'd be happy to leave this particular aspect to you and the
EFI maintainers.

Jan

