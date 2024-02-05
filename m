Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1777B849EAF
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:48:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676334.1052462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX1CJ-0001y2-Lb; Mon, 05 Feb 2024 15:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676334.1052462; Mon, 05 Feb 2024 15:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX1CJ-0001vm-I8; Mon, 05 Feb 2024 15:47:51 +0000
Received: by outflank-mailman (input) for mailman id 676334;
 Mon, 05 Feb 2024 15:47:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rX1CI-0001Vi-3x
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:47:50 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e93dd040-c43d-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:47:48 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-51109060d6aso6438945e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:47:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f6-20020a5d4dc6000000b0033b40a3f92asm1462046wru.25.2024.02.05.07.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 07:47:47 -0800 (PST)
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
X-Inumbo-ID: e93dd040-c43d-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707148067; x=1707752867; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1rVO9e5D92rCqHAjFHdqkTCys0FSsMEaNoKUX7kZn2k=;
        b=LwLmniRqIKnWnOVa9NutNwBXSBuhgQrVRElrUs6HR32tGcgs1sU14pbNpmgY0o+uUq
         7hnJmpIzbbKsJN7Nyczqwc2cAXsgWUwsNXgtmpHtUXn9OaHXmnynRokbS/VUK4xM9OuE
         rMKKhMYX2selPTQ7es8dmtWDLqkM26ijHsiutCRVtmc0RD93qCte9EDDF/DWnwrxDj+M
         4+czffAwXOPhOz8yfU0eThvbeTWb2pKp/q3r3lFpoTSC1Ailqc0POgjgY0P05277zUjC
         9ufMURQ1mZ/UyqqAiElAQL98/0B/icedN9koJBROKvRCR6J7NvDP78RWXwiDYlw0AsKh
         DbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707148067; x=1707752867;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1rVO9e5D92rCqHAjFHdqkTCys0FSsMEaNoKUX7kZn2k=;
        b=O4jjsWB1BEvSppG+PvZKmsKkRQHmrS/LRXfs4RApepNAfRklLwVydEq6Ofw+7lHZIy
         NkjkEe+Cy3Nemsv9yT9LRb3yKGHEwzS0nN2DOajtcvQdFzrlpyXVh2kU1cZxG949M02g
         /5FkgMsTBTOyUjz7KzhhUK0fKlqRIBa7AI2Fc95zPbuzjFtQpxOlAWd7et+JfIDgbK86
         qzMJ/egSITCXrOjna1cEA2XopveBABtMSkeqr2NAOhWp4RXrcyZzseuCuxMJOBOeYOPm
         NH/GzbeaJoZV4t4RCZsJP9ZC2kGDYvgJYch1H7lXTPhKqrGy2QCCaAQdiIxLZqgPKMeG
         1+lA==
X-Gm-Message-State: AOJu0Yy3V6htlfTnc15FaZOx1+3RGqsgoM+VjgQN28UwmKbRSOmEHxsj
	7pA726exXEZ3XlcnXQeDUHol7xa/N8gQbyChR+wUk2SO8KgkHI7JXGWPmA8tRg==
X-Google-Smtp-Source: AGHT+IG5VSNUfcRlkbw8HtS1/77aKseWakb/Vnp4BYvtYMCA7GYXGnB50RKYetfposQ5u3WCcscLEg==
X-Received: by 2002:a05:6512:247:b0:511:4dac:f1ab with SMTP id b7-20020a056512024700b005114dacf1abmr7746lfo.40.1707148067606;
        Mon, 05 Feb 2024 07:47:47 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW/dmIqM9uVgxqG0FLJ93uD9oMbRyzHRyIhab5OSj8RfgH3RlySxMTfLooy0Vt1VHdLT10kIerNHIul+j5jTCu5JL1pCbTylBdpRtnx8TNwcXSfaBinWS3F1l/Cy0v8xJsY6dg0VeZfvaJ8R83xdOvpQMOsnAIOhTkT0aAg773nSYVkhpTN41nxcRP2X8lZeJ6QD5DJ3bJNqL1N/5Xy7BbrXakGl9Tz8H0OOhsYhA0MpvhV8iQiQoSvExDgVFn73FTUCZeKwFmR5fc+3nsFFf+F7VB4eFEIKh9r0O180kFIyVA1BNMYeuLiggIfAFS2oXa+
Message-ID: <2a21b871-8762-43ee-b9f3-bf34869d008f@suse.com>
Date: Mon, 5 Feb 2024 16:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/IOMMU: address violations of MISRA C:2012 Rule
 14.4
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1702310368.git.maria.celeste.cesario@bugseng.com>
 <746a33fff1386b2e76657b5f7cfb31f3b117a1fe.1702310368.git.maria.celeste.cesario@bugseng.com>
 <891a1ab0b772910999f49878ae679634@bugseng.com>
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
In-Reply-To: <891a1ab0b772910999f49878ae679634@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:36, Nicola Vetrini wrote:
> On 2023-12-13 17:10, Simone Ballarin wrote:
>> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
>>
>> The xen sources contain violations of MISRA C:2012 Rule 14.4 whose
>> headline states:
>> "The controlling expression of an if statement and the controlling
>> expression of an iteration-statement shall have essentially Boolean 
>> type".
>>
>> Add comparisons to avoid using enum constants as controlling 
>> expressions
>> to comply with Rule 14.4.
>> No functional change.
>>
>> Signed-off-by: Maria Celeste Cesario  
>> <maria.celeste.cesario@bugseng.com>
>> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
>> ---
>> Changes in v2
>> - rename prefix from AMD/IOMMU to x86/IOMMU
>> - move changes on msi.c and hpet.c in this patch.
>> ---
>>  xen/arch/x86/hpet.c                      | 6 +++---
>>  xen/arch/x86/msi.c                       | 4 ++--
>>  xen/drivers/passthrough/amd/iommu_init.c | 4 ++--
>>  xen/drivers/passthrough/vtd/iommu.c      | 4 ++--
>>  xen/drivers/passthrough/vtd/quirks.c     | 2 +-
>>  5 files changed, 10 insertions(+), 10 deletions(-)
>>
> 
> +Stefano
> 
> Hi all,
> 
> this patch seems not to have been committed into staging, unlike the 
> other patch from this series. Since these are the only remaining 
> violations for Rule 14.4, then I think these changes could be reviewed.

It's no surprise the change isn't committed yet, when it hasn't had any
of the necessary tags. As far as I'm concerned, I seem to recall
indicating clearly that I'm not happy with this change, and hence acks
would need to come from elsewhere.

Jan

