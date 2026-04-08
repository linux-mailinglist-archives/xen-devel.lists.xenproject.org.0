Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 76KfBFd+1mmQFwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 18:12:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 632FE3BEB74
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 18:12:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276322.1561838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAVV9-0001Gb-3q; Wed, 08 Apr 2026 16:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276322.1561838; Wed, 08 Apr 2026 16:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAVV9-0001EQ-0Y; Wed, 08 Apr 2026 16:11:35 +0000
Received: by outflank-mailman (input) for mailman id 1276322;
 Wed, 08 Apr 2026 16:11:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAVV7-0001EK-Lz
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 16:11:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAVV7-00AdaD-15
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 18:11:33 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d67e2a-bab6-0a2a0a5309dd-0a2a45049de6-18
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 18:11:32 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d67e34-bb33-0a2a45040019-d1558035cc22-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 18:11:32 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-488971db0fdso49225e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 09:11:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd22c77csm2072995e9.12.2026.04.08.09.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 09:11:31 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775664692; x=1776269492; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P1G0f3IMv1NB+YAotfeV75ZWWWD/EYwL8HU7VrQCfPA=;
        b=M+SRBEGbMlWDterKl8o41D0htnO345fwGCqpz7W2rxyRpqspkDRgcHp6AM7TEacyXH
         xA74vVR3wOKdxPTxTz9YLsf9LJq368D3VhHLY8t5jCwlJZZwAssU7IIVqRClJ52bFxYl
         gt1EeFvxN8QiH2nXbxAGGoeldABzWJa8eAbuwtCwHal3EsHRdF65EQeEFwGPrUaxbb+e
         vOKPLrJWgYky4yBFFnxc+nx6DhPY5HSYIEy1tf11v0YokihgPJ+cMSa9qpm+VSAtKeal
         xGSOk79G5cot3S+WzOhojU+MvL5iQzA1oSlxuwvt6ObHim69KWHL63ZWnFyu8h2URZAe
         AobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775664692; x=1776269492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1G0f3IMv1NB+YAotfeV75ZWWWD/EYwL8HU7VrQCfPA=;
        b=ATfPEbX/LPyq0sjRIsR92pBBApAM2ECD/0yVzQSbvND0t9BvwUGAzKsbNr1rRT8eE1
         Pji//k6skH0WfJmx8niqKEvGcVe8mMdGKnKlhwfdVMgnoVemLKe7w4rHDlALLTKIIcQB
         TZQPCVfyxlCOAJPuf2mIfbIR0SQSX3RHM06RprFZfA2ZuaNLlEQ5GMS1w2He3FTvXfca
         7eEE5mgkmdIF5NQ+Efugn+I6/ryEY+VlZnFn3o8q2rXz7iGjzvIAhRz5VwtPkeM7mcDa
         r8M6xbv/CDlzZLiZlurmbCwrUUF9pdXfdNf3uC5Y/vdkdCz7T6Bmt8yHxV2aa/Pgebh5
         wqtA==
X-Forwarded-Encrypted: i=1; AJvYcCUpwUlB37Yb+QuNUB0+7kNcfaIaQelQ1hyh2/cGLtLEVYoywl0d6h0E3TcnZYGhhhfWKLvkMGyTOrs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNtNCap4dU/3zufgYqbvLjY9bTsZY1+ELT07BpzUK8j7BwkO0W
	Mieg3sjx/oPL23nzCXjgfGvObv1ubeqYrAYOqCYt2J8ODXrfegxnzJfErbTTIvinMg==
X-Gm-Gg: AeBDies6w7alz5+KGaATM9E7K6yQHqFNehXpIeQc7fnol/HdUL/BLMUTElwQMyjSN1s
	dB1745E5EurrP4YsA74lHDSdwGJTWh4vHmDz+Dp6IAfDKLF0nSMlusOAg4NabxNAKM9yHWElpy2
	hjPLqDfYPH2PrPBCSVUTb12StuE1HcjvQ0o+05bcdsgvU+MGKJJ5qfRIyjRkLCFvlMi5tj8wg7G
	QyT9mBqMgMaagw6PuR3MAdD3Nmme+yHpsMD086gpzieFuC3l/ckOPltbQZg05AHeESxyV4KF9cx
	AN5j6cKvSGv815l0e+N3iCtURposG2Kd93FSkQJ0PT1RpkfrNMQYUnH6apwljhy1lmZP8MxYXbe
	0ocBotyMzSDXIK3v5TOuyw+mgb0swOAThSbdMdvpGrhzHhELdHqY0QHHvvrOF2nBAjUamrlQQOc
	dAyTkfQFg2gE21h1xEoRkp2Xw+bg3BBE0q5QaOy7QbOgQhQYuP5FuQUS68TuBPqoIY6lUA0FwVh
	A+XJPVriP8mha4=
X-Received: by 2002:a05:600c:548d:b0:485:3423:727d with SMTP id 5b1f17b1804b1-488cd068ce8mr3762285e9.26.1775664692269;
        Wed, 08 Apr 2026 09:11:32 -0700 (PDT)
Message-ID: <c7ea5ab4-ee7e-4843-8c32-c205a50ab9e2@suse.com>
Date: Wed, 8 Apr 2026 18:11:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/smp: Rewrite on_selected_cpus() to be lockless
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
 <20260401163521.3603665-3-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260401163521.3603665-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1775664692-B2B3851B-B2D308B2/0/0
X-purgate-type: clean
X-purgate-size: 4574
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 632FE3BEB74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 18:35, Ross Lagerwall wrote:
> --- a/xen/common/smp.c
> +++ b/xen/common/smp.c
> @@ -24,13 +24,15 @@
>  /*
>   * Structure and data for smp_call_function()/on_selected_cpus().
>   */
> -static DEFINE_SPINLOCK(call_lock);
> -static struct call_data_struct {
> +struct call_data_struct {
>      void (*func) (void *info);
>      void *info;
>      int wait;
> -    cpumask_t selected;
> -} call_data;
> +    cpumask_t selected __cacheline_aligned;
> +};
> +
> +DEFINE_PER_CPU(struct call_data_struct, call_data);
> +static cpumask_t tasks;

Only first pass feedback for now (I still need to go over all of this more
thoroughly).

Having cpumask_t variables anywhere (not just on the stack, where they're
particularly problematic) isn't very nice. Can this become cpumask_var_t?
(We really also need to deal with the one in smp_call_function(), for
example.)

> @@ -50,55 +52,84 @@ void on_selected_cpus(
>      void *info,
>      int wait)
>  {
> +    struct call_data_struct *data;
> +    unsigned int cpu = smp_processor_id();
> +
>      ASSERT(local_irq_is_enabled());
>      ASSERT(cpumask_subset(selected, &cpu_online_map));
>  
> -    spin_lock(&call_lock);
> +    if ( cpumask_empty(selected) )
> +        return;
> +
> +    data = &this_cpu(call_data);
>  
> -    cpumask_copy(&call_data.selected, selected);
> +    if ( !data->wait )
> +    {
> +        /* Wait for any previous async call to complete */
> +        while ( !cpumask_empty(&data->selected) )
> +            cpu_relax();
> +
> +        cpumask_clear_cpu(cpu, &tasks);

Since you set this bit again almost immediately, the above can only be to
make sure that ...

> +    }
>  
> -    if ( cpumask_empty(&call_data.selected) )
> -        goto out;
> +    data->func = func;
> +    data->info = info;
> +    data->wait = wait;

... these updates and ...

> -    call_data.func = func;
> -    call_data.info = info;
> -    call_data.wait = wait;
> +    smp_wmb();
>  
> -    smp_send_call_function_mask(&call_data.selected);
> +    cpumask_copy(&data->selected, selected);

... and this copying happen with the bit clear. Don't you need another
barrier then, though (between cpumask_clear_cpu() and the writes)?

Further isn't the barrier you add coming too early? While the bit in
tasks is clear, nobody's going to look at ->selected. Doesn't the
barrier need to live here, to isolate from ...

> -    while ( !cpumask_empty(&call_data.selected) )
> -        cpu_relax();
> +    cpumask_set_cpu(cpu, &tasks);

... this?

> -out:
> -    spin_unlock(&call_lock);
> +    smp_send_call_function_mask(&data->selected);
> +
> +    if ( wait )
> +    {
> +        while ( !cpumask_empty(&data->selected) )
> +            cpu_relax();
> +
> +        cpumask_clear_cpu(cpu, &tasks);
> +    }
>  }
>  
>  void smp_call_function_interrupt(void)
>  {
> -    void (*func)(void *info) = call_data.func;
> -    void *info = call_data.info;
>      unsigned int cpu = smp_processor_id();
> -
> -    if ( !cpumask_test_cpu(cpu, &call_data.selected) )
> -        return;
> +    unsigned int i;
> +    struct call_data_struct *data;
> +    void (*func)(void *info);
> +    void *info;

Please move into the loop's scope whatever can be moved there.

>      irq_enter();
>  
> -    if ( unlikely(!func) )
> -    {
> -        cpumask_clear_cpu(cpu, &call_data.selected);
> -    }
> -    else if ( call_data.wait )
> -    {
> -        (*func)(info);
> -        smp_mb();
> -        cpumask_clear_cpu(cpu, &call_data.selected);
> -    }
> -    else
> +    for_each_cpu ( i, &tasks )
>      {
> -        smp_mb();
> -        cpumask_clear_cpu(cpu, &call_data.selected);
> -        (*func)(info);
> +        data = &per_cpu(call_data, i);
> +
> +        if ( !cpumask_test_cpu(cpu, &data->selected) )
> +            continue;
> +
> +        smp_rmb();

This barrier looks as if it also needs to move (up).

Jan

> +        func = data->func;
> +        info = data->info;
> +
> +        if ( unlikely(!func) )
> +        {
> +            cpumask_clear_cpu(cpu, &data->selected);
> +        }
> +        else if ( data->wait )
> +        {
> +            (*func)(info);
> +            smp_mb();
> +            cpumask_clear_cpu(cpu, &data->selected);
> +        }
> +        else
> +        {
> +            smp_mb();
> +            cpumask_clear_cpu(cpu, &data->selected);
> +            (*func)(info);
> +        }
>      }
>  
>      irq_exit();


