Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB92C5340D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 17:02:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160273.1488462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDIx-0004fz-8Y; Wed, 12 Nov 2025 16:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160273.1488462; Wed, 12 Nov 2025 16:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDIx-0004df-5q; Wed, 12 Nov 2025 16:02:43 +0000
Received: by outflank-mailman (input) for mailman id 1160273;
 Wed, 12 Nov 2025 16:02:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJDIw-0003Aq-Do
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 16:02:42 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04d926c2-bfe1-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 17:02:42 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b7346565d7cso1497266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 08:02:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bdbc9656sm1637870866b.7.2025.11.12.08.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 08:02:40 -0800 (PST)
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
X-Inumbo-ID: 04d926c2-bfe1-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762963361; x=1763568161; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wgkw+eYOL5L3CwgaXu6ndBDKkP0t/xOwNYF4OBIds/I=;
        b=FGFJTghD7aaOlcaD9U3mmdR8Xdk1apbvdLzZBPz0I7PQa/DecympL80qzTHkPcbyUh
         5kYPchwepDuEZWwUo4xs29S2TvpzSqELmhgkYW+v6a7kjTNgL0dLdEoGKKv6ERBNMiI6
         y36Umj8Cf2/UHUtVkCz7zSHmz+6cM+xPjHLGeapmNjemR+/6dzlIeSKAiRLKavsXsbYi
         jK9WYc9POaQBULb5xShe8hC/Tp4v7SzMOMkhc4honH09KqtIicYLbp+rjuu4Nvy2P5vR
         3HROror52wt4Lz0VDNJM/GHTZdIbjE7EPLGd/mztUPAMt7/mBKsN4iK29yPkLYzGcJN2
         85lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762963361; x=1763568161;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wgkw+eYOL5L3CwgaXu6ndBDKkP0t/xOwNYF4OBIds/I=;
        b=ofe/kpR2bhVFjA8TblDyqDDcIXUwBAXr1orWycPrPFMqHPSg0l8wJzDJH6XO0iF8cr
         1sxS+Osko2h+fsnKQNV9eko12kXQG1VqeK0a0nAZuT5dWoiuZGU4+xS0uObDtemXpYKc
         VLGhU77AibFB8gvqtDmEE0CcACshqz94nxy27RlnGmZ2CndTXV+zQJxVoRk7dUU6dsRF
         k+yI/LXLpj5MJOg9p4R7qmeM5I9twZE1A4dgLfXPrN+RkQEA9qi/Xuha8e8xkcPg9+47
         WCGqxOof+YY8YgcAk6VcXODYpSfDKr5IrvFM2lPfqn82CjkMwJQHTiEdU9RpCkPJBs3v
         csJg==
X-Forwarded-Encrypted: i=1; AJvYcCVFs/zmVwlRHSzhUVy8++mwF9335gsWb+bed9Kq7sMijwokpjp3Sf212qxD5o2+aJE0H5jsZZYvZUc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8PRuvqn/T2LkdeGeJYAuWvoQNU4MeJA7nIqul5ZxwnR5fTCqK
	Qy+eaa9RNlkq9sSx7Wm+4B6k8OPW4DGhJ4spKCu6d9W781pt7zh3HK0iYzqH9uDW7g==
X-Gm-Gg: ASbGncsVoFcYIVaFbyft0y+GpHLAl9LHsqU6YuR1kEvnh1kpeeA34M1APEt/4lazRGB
	47HI8ScOEfulh+MlBzoQWi07IQG4Fcm8bOODlv75Uof2in6PPa3lVrTqLFeBTZWvRS+EOUBSsdv
	vuFyFUqADadIi/ZSHCRHh288qDOMCnQ/SKI8VztUYw3ckKxu+9CcGNQrWZDChwX3L3gLiyi4w2V
	HOFWo0/izaLVXlaSew+NeKM1UqeDJFeJ8CZLMiVRv6IVlT8Zkz5K8sjEnag8N/lqX70qRyvvY22
	MrHsGtHumO4XPtEt346FnfO2Y5OqzmNZJ8wGnHWdGMs9CGyYwRBi/PWRCNSCzhY+l9V+63F8omW
	8fh2Cm//KvXUQAFuKMZy6FwEXPM1N8dOBBYZoLP8kgya1UdiowyxdI0BeRWTqViHW3Uo3u1ZVDo
	zMpHl0SHWsFbXSSlV3jPYO9ZekOYxEl+5oCVujWk3gZ+uDhGJUrAMZGQOdsDG9ECDkimWLUYqii
	kc=
X-Google-Smtp-Source: AGHT+IH+cymoi9wa/1QnVqHpLVASOZ7QslR267tYQckiMfiX1Qy9pKnV+v50igM6QlXZTMQ47eW4Dw==
X-Received: by 2002:a17:907:3d8f:b0:b70:e15b:286a with SMTP id a640c23a62f3a-b7331b69ddfmr389284166b.57.1762963361251;
        Wed, 12 Nov 2025 08:02:41 -0800 (PST)
Message-ID: <3f73f2a0-1c91-44de-b87b-fac35447af5b@suse.com>
Date: Wed, 12 Nov 2025 17:02:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86: Remove stubs from asm/pv/domain.h
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <Jason.Andryuk@amd.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20251112152235.224001-1-alejandro.garciavallejo@amd.com>
 <20251112152235.224001-3-alejandro.garciavallejo@amd.com>
 <a7991534-b200-4b00-9a45-2d4c167d7ec3@epam.com>
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
In-Reply-To: <a7991534-b200-4b00-9a45-2d4c167d7ec3@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2025 16:56, Grygorii Strashko wrote:
> On 12.11.25 17:22, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -571,15 +571,17 @@ int arch_vcpu_create(struct vcpu *v)
>>   
>>       if ( is_hvm_domain(d) )
>>           rc = hvm_vcpu_initialise(v);
>> -    else if ( !is_idle_domain(d) )
>> -        rc = pv_vcpu_initialise(v);
>> -    else
>> +    else if ( is_idle_domain(d) )
>>       {
> 
> The is_idle_domain() wants to go first here, i think.
> [1] https://patchwork.kernel.org/comment/26646246/

It's a "positive" check (no !) here, so no, imo the order above is fine.

>>           /* Idle domain */
>>           v->arch.cr3 = __pa(idle_pg_table);
>>           rc = 0;
>>           v->arch.msrs = ZERO_BLOCK_PTR; /* Catch stray misuses */
>>       }
>> +    else if ( IS_ENABLED(CONFIG_PV) )
>> +        rc = pv_vcpu_initialise(v);
>> +    else
>> +        rc = -EOPNOTSUPP;
>>   
>>       if ( rc )
>>           goto fail;
> 
> Actually, if you are here and have time and inspiration :)
> - if ( is_idle_domain(d) ) staff can be consolidated at the
>    beginning of arch_vcpu_create() which will make it much more readable and simple.

This may indeed be possible, but needs to be done with care. Iirc at least
once someone already screwed up there, while trying something along these
lines.

Jan

