Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F7297EB1E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 13:54:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801997.1212100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssheR-0003Mj-2f; Mon, 23 Sep 2024 11:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801997.1212100; Mon, 23 Sep 2024 11:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssheQ-0003Jm-VZ; Mon, 23 Sep 2024 11:54:46 +0000
Received: by outflank-mailman (input) for mailman id 801997;
 Mon, 23 Sep 2024 11:54:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssheP-0002pA-M3
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 11:54:45 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f75d0f5-79a2-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 13:54:44 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c5bca59416so1606484a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 04:54:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061330b08sm1210961466b.201.2024.09.23.04.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 04:54:43 -0700 (PDT)
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
X-Inumbo-ID: 9f75d0f5-79a2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727092483; x=1727697283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qjlbtj/NrSZzsEAIxXrSppa8c/EYDVy5sCgYGPVesXw=;
        b=W4ATBLKZRaZU7zm6wpgTTybD4OXmlwz1QdKjq8+BwAJSd1FI2hvL4g206dAMmFIouK
         +t43WJV07+gGVpidcAeA8oojS27HPjPX5zTVn31iuDeY3xmbiEJ56PxYPPvilZ2AGhRB
         x4wehRpvNcv3P+tFT9BUvNRGWzmroQtPy4l3I2sLbXgV0RacCItCrQ2WO/AUHpMJiBjM
         DQSwE95OygBBea/BCiu20iokTzakpoD+ppW1+j0eWjsGFnpE/7ySVpE723Qbi7GNGFSv
         t8zkMcoVPutM9XwLYmRiCRbaJm/qwiVT7agu5/eo3axlIrZES9kPumyoZ4TNW0zFUvai
         8miA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727092483; x=1727697283;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qjlbtj/NrSZzsEAIxXrSppa8c/EYDVy5sCgYGPVesXw=;
        b=vF4rhKYqOZjMsBTFfANJnnlxUnrdkhiY8oJZgyx3HYkJxOAReanq+lY3qeJ2WeP6zD
         KbYuZ32dCJl6UktmpheQoXOZUPIWs09KjJGObcPhsDg+J8NMkwZkchI5fbEc/qlTMhC9
         +mR9piMLeyPx/N0IcUFPcJNyG98gR9R2a2iOB/jqydeFYIIIwjZWQa1z8P2lrf59yAQW
         odFRywWtbk11aeNznu4iO+jLOebSGJJR0dWr0/REZdOGDARZvonhC86uA1T+aeyEXs3a
         GNr34bkfwVWUtfGSUg00aomblubQlF2PGat1qtLm17jv1Q92xyDOVYFR7/4FCx6kaIaG
         RYTA==
X-Gm-Message-State: AOJu0Yzi/vm8GDp8eSpDSxm7q4+cyLZI9jSab3uOFXXWjMvfdyl8NrXH
	vWbq+FwguP6KqdOz/94o+vPnOXtxCCMZjud+nEsWsgyo2PAi2ZLHtc7kJuxhIQ==
X-Google-Smtp-Source: AGHT+IGcz1FUpLIsakRavNyX2l9dvA2XgGjgn8y4Kw5AWxz/f87T1QgSkiGoyC4zHrtccUuxKpS1cA==
X-Received: by 2002:a17:907:e610:b0:a8d:4b02:334c with SMTP id a640c23a62f3a-a90d5841a3cmr982928666b.64.1727092483359;
        Mon, 23 Sep 2024 04:54:43 -0700 (PDT)
Message-ID: <b4cddc52-e527-4c1b-90d9-50490363b5c2@suse.com>
Date: Mon, 23 Sep 2024 13:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/shutdown: mask LVTERR ahead of offlining CPUs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240919142748.43821-1-roger.pau@citrix.com>
 <7a6906a2-6860-4575-a88d-90be5ec43eee@citrix.com>
 <Zu0z2ZO7lwTklq19@macbook.local>
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
In-Reply-To: <Zu0z2ZO7lwTklq19@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.09.2024 10:35, Roger Pau Monné wrote:
> On Thu, Sep 19, 2024 at 10:19:49PM +0200, Andrew Cooper wrote:
>> On 19/09/2024 4:27 pm, Roger Pau Monne wrote:
>>> @@ -364,6 +369,18 @@ void smp_send_stop(void)
>>>          fixup_irqs(cpumask_of(cpu), 0);
>>>          local_irq_enable();
>>>  
>>> +        /*
>>> +         * Mask the local APIC error vector ahead of stopping CPUs.
>>> +         *
>>> +         * On AMD the local APIC will report Receive Accept Errors if the
>>> +         * destination APIC ID of an interrupt message is not online.  There's
>>> +         * no guarantee that fixup_irqs() will evacuate all interrupts -
>>> +         * possibly because the sole CPU remaining online doesn't have enough
>>> +         * vectors to accommodate all.
>>> +         */
>>> +        smp_call_function(mask_lvterr, NULL, true);
>>> +        mask_lvterr(NULL);
>>> +
>>>          smp_call_function(stop_this_cpu, NULL, 0);
>>
>> Irrespective of the question over approach, stop_this_cpu() should end
>> up clearing LVTERR.  Why doesn't that suffice?
> 
> No, because those are no ordered.  The sequence needs to strictly be:
> 
>  - Mask LVTERR on all CPUs.
>  <wait for masking to be done uniformly>
>  - Stop CPUs.
> 
> Otherwise CPUs might be stopped before LVTERR has been uniformly
> masked, leading to Receive accept error reported on the CPUs that
> don't yet have LVTERR masked.

Yet fixup_irqs() has moved everything to CPU0. Nothing should go to any of
the APs anymore. Fiddling with LVTERR here feels like curing a symptom
rather than the root cause.

Jan

