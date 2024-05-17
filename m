Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF838C8190
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 09:40:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723876.1129015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7sBn-0006EB-AV; Fri, 17 May 2024 07:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723876.1129015; Fri, 17 May 2024 07:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7sBn-0006Bt-7l; Fri, 17 May 2024 07:39:39 +0000
Received: by outflank-mailman (input) for mailman id 723876;
 Fri, 17 May 2024 07:39:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bw27=MU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7sBl-0006Bn-QC
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 07:39:37 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c563fb0-1420-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 09:39:36 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-51f0f6b613dso2178061e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 00:39:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bed72bbsm11643241a12.57.2024.05.17.00.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 00:39:35 -0700 (PDT)
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
X-Inumbo-ID: 9c563fb0-1420-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715931576; x=1716536376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KEU05UX5DXF0EkY4DoKFBorUQ7NKoRlveCGyioriTzY=;
        b=UCXC+k+W7SQJUKfjMhLswKuNvMjFp8aC63fzVQ1Qh++Tl1639+O6/BNQ5FMR3FX14x
         SzFpv5oFLExNZ54GRwb9EHJN+f1WYy+WHzteSTsQP9AwetURJ1esPVwOWRcZ8vrI1Dbs
         MX3aDLd44mVUNpQjENa5ts0nuhOOpBbYQfaR+ibK9oIMxtUYkQyDCliCLRJg66Rbvx9K
         nzJDfbZVyjN9YJ8QhhtrnlPFXLXwAZZdk3OES9b/QO2xqZs3E8J4EhnFodUiKaR6XTgM
         ukNPXgFdYRVExBhCHJeIgn0lZOoXN4ZoJDsz8ioRPctS5i1HsoGOea+7GS1Gw3hZ/E/e
         zZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715931576; x=1716536376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KEU05UX5DXF0EkY4DoKFBorUQ7NKoRlveCGyioriTzY=;
        b=quJ9GoV2QZLxuf5yqJUwmOuXBfQ+RmKYZ8YHVbgM8CAYWxN/Mj//oR0AZUJMtt8G71
         1jf/Gvbee4KUXHW9watOnSBnuINAgYXZwez33ZqIuzafduh0uLp75uyTMdF1rp79ErBz
         rLyc0y4lQtjXej7gIQiuHPFQmsc7jHkVFt0YAU3rTHX05+Gp/Mgu0R8/gmXmmtYElAqw
         vup8GpC/R1apnLKKO1Or03VUAXavr3mCXEyTh8+GFNBCEaVmC7q0C45khKBOZOlPPfmf
         YtBKfa764bi3RjrpAXXUmjS9DbQn2eGexGBbGeZ7llG6nylGGPh2QDRAfoPWRCFO0t1c
         XCOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVRaOMkcgCexZbyYbK2CS1dBcAGbB9sSgcatC2YAbSvyKWojEzkEgDu5xqVaMNRBW6jks4uPo3RKvcpBlDf217VyNV5zsrzIzpa8gOm9Q=
X-Gm-Message-State: AOJu0YxMgFUcUYtOhx8VuC59fkKSlsJGM6RrKh0OImvVOsnoSM31gmNW
	Op0NyvrecM6d3JCyzO3cgUrLOSK4i3Rcwihek0XpEEgjG7ymfXGOw0CaWp7uiA==
X-Google-Smtp-Source: AGHT+IG2NE19+Xx58x2IPIxxQmMj72AE+b4WoR5NLCOTTGDbkoXphyhU+1XDIxzGCHaFwCVS4z9YWw==
X-Received: by 2002:a05:6512:39c9:b0:522:33dd:dcd9 with SMTP id 2adb3069b0e04-52233dddd7amr14957725e87.33.1715931576142;
        Fri, 17 May 2024 00:39:36 -0700 (PDT)
Message-ID: <c943807b-f5dd-4e46-aac3-a519c4051f4f@suse.com>
Date: Fri, 17 May 2024 09:39:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19?] xen/x86: pretty print interrupt CPU affinity
 masks
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20240515152925.77197-1-roger.pau@citrix.com>
 <06844367-cc1d-42f7-b925-ba78b4532b11@citrix.com>
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
In-Reply-To: <06844367-cc1d-42f7-b925-ba78b4532b11@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2024 19:13, Andrew Cooper wrote:
> On 15/05/2024 4:29 pm, Roger Pau Monne wrote:
>> Print the CPU affinity masks as numeric ranges instead of plain hexadecimal
>> bitfields.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  xen/arch/x86/irq.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
>> index 80ba8d9fe912..3b951d81bd6d 100644
>> --- a/xen/arch/x86/irq.c
>> +++ b/xen/arch/x86/irq.c
>> @@ -1934,10 +1934,10 @@ void do_IRQ(struct cpu_user_regs *regs)
>>                  if ( ~irq < nr_irqs && irq_desc_initialized(desc) )
>>                  {
>>                      spin_lock(&desc->lock);
>> -                    printk("IRQ%d a=%04lx[%04lx,%04lx] v=%02x[%02x] t=%s s=%08x\n",
>> -                           ~irq, *cpumask_bits(desc->affinity),
>> -                           *cpumask_bits(desc->arch.cpu_mask),
>> -                           *cpumask_bits(desc->arch.old_cpu_mask),
>> +                    printk("IRQ%d a={%*pbl}[{%*pbl},{%*pbl}] v=%02x[%02x] t=%s s=%08x\n",
> 
> Looking at this more closely, there's still some information obfuscation
> going on.
> 
> How about "... a={} o={} n={} v=..."
> 
> so affinity, old and new masks are all stated explicitly, instead of
> having to remember what the square brackets mean, and in particular that
> the masks are backwards?

Just one question: Why put old ahead of new? Aiui that's what you refer to
with "backwards", yet I don't see what's backwards about it. Old would
possibly matter only when the IRQ was recently moved, whereas new (actually:
Why "new"?) would matter at all times. I'd see "... a={} m={} o={} v=..."
as more appropriate.

Jan

