Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51C18D3B09
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 17:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732192.1138083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCLGd-0006QW-Un; Wed, 29 May 2024 15:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732192.1138083; Wed, 29 May 2024 15:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCLGd-0006O6-Rw; Wed, 29 May 2024 15:31:07 +0000
Received: by outflank-mailman (input) for mailman id 732192;
 Wed, 29 May 2024 15:31:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuQ4=NA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCLGc-0006Nv-Go
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 15:31:06 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 761f1814-1dd0-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 17:31:04 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52a54d664e3so1217773e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 08:31:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6590d02e53sm45253766b.119.2024.05.29.08.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 08:31:03 -0700 (PDT)
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
X-Inumbo-ID: 761f1814-1dd0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716996664; x=1717601464; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M0ApkL0EDfx0AVoficEZQyK5XZidmmaFxKpqjcjDPTg=;
        b=Xnd6snh+13PhyTrxchSgPKU0rVnniAeShrq4OihajYF0Pv3IsnsMdscZTEqVdf9jVH
         5lwhq40C+C2Mvkz+gw2f9pt5aQM1jqSXVl8FDm/1stUydRsJKQs/TnaiCtAR4RRntMrp
         Gb89o/OnZt4FyluZ6lPqezhQ8A0HlLQKcuEuiFYF33oXALk4z2WCxijCf99Po/dAeowh
         Ao0zaw4Dy7tobw3TXHv3YmEklf2f+1bYcjfgWI0uPjMs3UcHdw4ZjxWiQg2EthMp0bF5
         HlM2FMSphRywfWnLMkTdgnbaOHk/l2ydN/UyCuTuxXLu+L4Ny+bIf5hcJrgkKUytjo7b
         juDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716996664; x=1717601464;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0ApkL0EDfx0AVoficEZQyK5XZidmmaFxKpqjcjDPTg=;
        b=EmaSrKkN8ishBdidD15Nn8QuY3fFjxqCMPCE8dJk+eLGaZxQqc3FfictUrdbQI7767
         /eWxR9iX88iRUHCBhy24bkee9dU34J4XOl4pXUSmC4dgIl4ezK9bod1vkrMpaElfMzuP
         EQqbkuOMdpt06IDGI33yv4DlrYR1U7roz4PwV/v2xbZ11k4xWtWnSSY9TkOx87rOG0Pm
         zldCLyooWHSfkM0FXXXv+rJA451dpr0CyZy2fqS28LTqwdsFqSm0KzFqRzS3gecM5YYt
         Enl/+A2E3rmWHNOmLgcO/IWWqkRKubj/du2vbMyAtrb2C7ej7LLJAFuNrMQsgiZVPE4A
         v3WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAb98N0Q4JFaWF3/dQT6BT6tJ4vCxkcssXumEMInxr1+LCa+C4rm55EpBPP8abNywwEyEcp6jxpQWb6Fpncveclfp7CbatkltXfT+DTI8=
X-Gm-Message-State: AOJu0YyT1ktC9JatwqOWC2cwV53mxEf4yw0LVO0vZOdQVHlq62cQ9aig
	mJCaSvHAVaUifn4a0cCQE/+DpLEF6H0nGcaWDT78nUrFjwWnK7P9UHljtJqH9g==
X-Google-Smtp-Source: AGHT+IF0uzGLQlLjUHzcntWU8AcBe0p2JBn7yQXrVfpE49iOBGndG5TFByqo/L0+xHTAWidMJ3Mxhw==
X-Received: by 2002:a05:6512:214f:b0:52b:660a:666 with SMTP id 2adb3069b0e04-52b660a0821mr858544e87.38.1716996663888;
        Wed, 29 May 2024 08:31:03 -0700 (PDT)
Message-ID: <b427a74b-60e4-4bdf-96dd-164ea2506ba1@suse.com>
Date: Wed, 29 May 2024 17:31:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 2/9] xen/cpu: do not get the CPU map in
 stop_machine_run()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20240529090132.59434-1-roger.pau@citrix.com>
 <20240529090132.59434-3-roger.pau@citrix.com>
 <7954b3c2-e101-4db0-b317-a6585a6a8689@suse.com> <ZldHvAW_2nqAuWcq@macbook>
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
In-Reply-To: <ZldHvAW_2nqAuWcq@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.05.2024 17:20, Roger Pau Monné wrote:
> On Wed, May 29, 2024 at 03:04:13PM +0200, Jan Beulich wrote:
>> On 29.05.2024 11:01, Roger Pau Monne wrote:
>>> The current callers of stop_machine_run() outside of init code already have the
>>> CPU maps locked, and hence there's no reason for stop_machine_run() to attempt
>>> to lock again.
>>
>> While purely from a description perspective this is okay, ...
>>
>>> --- a/xen/common/stop_machine.c
>>> +++ b/xen/common/stop_machine.c
>>> @@ -82,9 +82,15 @@ int stop_machine_run(int (*fn)(void *data), void *data, unsigned int cpu)
>>>      BUG_ON(!local_irq_is_enabled());
>>>      BUG_ON(!is_idle_vcpu(current));
>>>  
>>> -    /* cpu_online_map must not change. */
>>> -    if ( !get_cpu_maps() )
>>> +    /*
>>> +     * cpu_online_map must not change.  The only two callers of
>>> +     * stop_machine_run() outside of init code already have the CPU map locked.
>>> +     */
>>
>> ... the "two" here is not unlikely to quickly go stale; who knows what PPC
>> and RISC-V will have as their code becomes more complete?
>>
>> I'm also unconvinced that requiring ...
>>
>>> +    if ( system_state >= SYS_STATE_active && !cpu_map_locked() )
>>
>> ... this for all future (post-init) uses of stop_machine_run() is a good
>> idea. It is quite a bit more natural, to me at least, for the function to
>> effect this itself, as is the case prior to your change.
> 
> This is mostly a pre-req for the next change that switches
> get_cpu_maps() to return false if the current CPU is holding the CPU
> maps lock in write mode.
> 
> IF we don't want to go this route we need a way to signal
> send_IPI_mask() when a CPU hot{,un}plug operation is taking place,
> because get_cpu_maps() enough is not suitable.
> 
> Overall I don't like the corner case where get_cpu_maps() returns true
> if a CPU hot{,un}plug operation is taking place in the current CPU
> context.  The guarantee of get_cpu_maps() is that no CPU hot{,un}plug
> operations can be in progress if it returns true.

I'm not convinced of looking at it this way. To me the guarantee is
merely that no CPU operation is taking place _elsewhere_. As indicated,
imo the local CPU should be well aware of what context it's actually in,
and hence what is (or is not) appropriate to do at a particular point in
time.

I guess what I'm missing is an example of a concrete code path where
things presently go wrong.

Jan

