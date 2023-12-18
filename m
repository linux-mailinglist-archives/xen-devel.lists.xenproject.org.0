Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0086D817701
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 17:10:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656214.1024291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFGBs-00016h-CG; Mon, 18 Dec 2023 16:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656214.1024291; Mon, 18 Dec 2023 16:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFGBs-00014Z-9J; Mon, 18 Dec 2023 16:10:00 +0000
Received: by outflank-mailman (input) for mailman id 656214;
 Mon, 18 Dec 2023 16:09:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFGBq-00013E-Pg
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 16:09:58 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2d35f74-9dbf-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 17:09:56 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c29f7b068so36859015e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 08:09:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c4fc900b004094d4292aesm42281231wmq.18.2023.12.18.08.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 08:09:55 -0800 (PST)
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
X-Inumbo-ID: e2d35f74-9dbf-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702915796; x=1703520596; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WGvpzE47+XxTh03qndxYZP4lk++VDW0OY6mUvrKO8aY=;
        b=SQTyv3zjsjBu3LGzuKoJi1mqVz1QTS5XpxgxwKZKaz3vtux09OXH3HikL+maOIj86A
         TUMYg0JbxAvmxYXEQGgB0YQPwkW/F3oEktuEzAu8aXZXzjbaqgEYsT02r3hZaXR0zxCV
         iE5lwOw92d/HzhI9n4Gb5r0t1uoS0/Ev26hVwjvPYgjvilyQWa+vdeo6nJh8/N0law8e
         mQGp1/skRxZVHlycVhOsJFu+3EQE01DIf8eHdCzgyTwqn0czHcSqzd44WZUYx9hQYeFQ
         sAarg43j2vatFKNptFy+iuPKLJ/xPjgqDHI1DUCXwzvt5+96rySKCXq2jQkFJwtUHu2G
         f5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702915796; x=1703520596;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WGvpzE47+XxTh03qndxYZP4lk++VDW0OY6mUvrKO8aY=;
        b=GkbaL1JsT05yPv8/jdL8sbL0MT308HxeDNM63S7J6MQ4RTJ10S6ymG43Itt3cDaVV2
         yVpVtHHDIiJ0Kk96Kw177T+KyTLVX91yH2ELrdKrvEoIYdB3r0FRU9DsDlpCqPn9AeXo
         inTS2kaRZjhAFnjWS83uW0tmlEHjiD3bF1C9/AkEkmMwSaIhkQRO9vVBVUCYy2AFtvgC
         spizs/MxHfFMuNKNmwfJ1dlRQw6StI9YOJhUwtvxWHlhUBo+1ISUj0IAS0dflkHXW/ek
         Alb95BeGGdxFyboSqwiWBZ3mnWIVLS10CndtqTVlFstvyw0ZTe2b1nQ4sDquWba/P/ZO
         hVAA==
X-Gm-Message-State: AOJu0Yz34Vzd2lQS/3/Y5Mb18YXkaaG92sogkKZv3BNMwm5omfvnxt90
	J6HJFbvZooUzR6ujZQPmAJ0Bi4LG1tRLrzDmGAHA
X-Google-Smtp-Source: AGHT+IEHWsqM2shrJrTn0BmxevD3a6X/A4eKe9burTeXaKPkHYGAf+e65SqSzCF4ItAwi3mtqP9RTw==
X-Received: by 2002:a05:600c:198b:b0:40c:4be1:ae11 with SMTP id t11-20020a05600c198b00b0040c4be1ae11mr6923476wmq.188.1702915796123;
        Mon, 18 Dec 2023 08:09:56 -0800 (PST)
Message-ID: <4e4408de-6362-4f4d-bd8b-fed5956a9472@suse.com>
Date: Mon, 18 Dec 2023 17:09:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] x86: limit issuing of IBPB during context switch
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <29e2b527-16b8-e72d-f625-781aedf21bc4@suse.com> <ZYBi83-LWEwywUuD@macbook>
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
In-Reply-To: <ZYBi83-LWEwywUuD@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2023 16:19, Roger Pau Monné wrote:
> On Tue, Feb 14, 2023 at 05:11:40PM +0100, Jan Beulich wrote:
>> When the outgoing vCPU had IBPB issued and RSB overwritten upon entering
>> Xen, then there's no need for a 2nd barrier during context switch.
>>
>> Note that SCF_entry_ibpb is always clear for the idle domain, so no
>> explicit idle domain check is needed to augment the feature check
>> (which is simply inapplicable to "idle").
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks. However, aiui the plan still is for Andrew to pick up this series
and integrate it with other work he has in progress (or he is planning to
do).

>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -2005,17 +2005,26 @@ void context_switch(struct vcpu *prev, s
>>      }
>>      else
>>      {
>> +        unsigned int feat_sc_rsb = X86_FEATURE_SC_RSB_HVM;
>> +
>>          __context_switch();
>>  
>>          /* Re-enable interrupts before restoring state which may fault. */
>>          local_irq_enable();
>>  
>>          if ( is_pv_domain(nextd) )
>> +        {
>>              load_segments(next);
>>  
>> +            feat_sc_rsb = X86_FEATURE_SC_RSB_PV;
>> +        }
>> +
>>          ctxt_switch_levelling(next);
>>  
>> -        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) )
>> +        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) &&
>> +             (!(prevd->arch.spec_ctrl_flags & SCF_entry_ibpb) ||
>> +              /* is_idle_domain(prevd) || */
> 
> I would rather add a comment to note that the idle domain always has
> SCF_entry_ibpb clear, rather than leaving this commented check in the
> condition.

While I think I can see your point, I like it this way to match the
other !is_idle_domain() that's here.

>> +              !boot_cpu_has(feat_sc_rsb)) )
> 
> I do wonder if it would be more fail safe (and easier to expand going
> forward) if we introduce a new cpu_info field to track the CPU state:
> relevant here would be whether RSB has been overwritten and IBPB
> executed.  Such state would be cleared on each return from guest path.

To be honest - I'm not sure whether that would help or make things more
fragile. More state also means more things which can become incorrect /
inconsistent.

Jan

