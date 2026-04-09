Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDltKcqR12k2PwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:47:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 189AD3C9D70
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:47:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277138.1562399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnqi-0003Q5-U6; Thu, 09 Apr 2026 11:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277138.1562399; Thu, 09 Apr 2026 11:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnqi-0003Ne-Qk; Thu, 09 Apr 2026 11:47:04 +0000
Received: by outflank-mailman (input) for mailman id 1277138;
 Thu, 09 Apr 2026 11:47:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAnqh-0003NY-Aw
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 11:47:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAnqf-0093Tl-4l
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:47:02 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d791a8-bab6-0a2a0a5309dd-0a2a450b83b0-28
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:47:02 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d791b6-bca8-0a2a450b0019-d155dd36d85b-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:47:02 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43cfce3a195so480039f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 04:47:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d2971sm66014178f8f.22.2026.04.09.04.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 04:47:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1775735222; x=1776340022; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9UQNUiqMM0UOFM4a1BtaZDXuAXWKKjh0UmiRRYcOEZc=;
        b=FOx27flRsZQ5mv0j5cT4mtys/l+9lH0vUVMBeTi8Nzp44HC2ktaF5UoTuLlIvLD7cw
         Z1SVq9pViwVhyc8bixMTNSNzffOxE1zo9lIlxDXQS29P91UkAMmDhXA9oHH0Ag4pGCVA
         mklCc5GG9/vVDP+GLDIw49nf4BuiM0wd5ZwJYwdK6fu6kpyPXqmX80NdEGDGtAaQZQcd
         SJAfpOHPbK4s4KhDAt2Bqk0ss+E4s8130US88/R6lxIZwpvhttDEAP7h/uiS1FOAA1Ai
         CsfRQKrL4UdAHNwQ2nJTuxsIa+5jlL7vPmB9fO2oiVfnNFoOVUrXxBgJ5S2wv4drxitN
         b8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775735222; x=1776340022;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UQNUiqMM0UOFM4a1BtaZDXuAXWKKjh0UmiRRYcOEZc=;
        b=YSHM+lV/CtmYup/rdzONLq8ybtUN7BC1WX6WoEOHCIvsyjr9jw84VSL95Nq7AAE/dc
         Hw8qzF9Y7Ekz0dEt3Rt4bJe0aHyDy19MQp3pbT85Xyp9TAP4jSHhp3l0r8L9fJuENijT
         RUXjR83K/o6d07vqNIJRzTtWMRsLlospIMJpbXom8cbgXBcQBHwE9qckubJOWGI0Z0CX
         Dt0pH79e8YYiQSxdCEu1rF+socWFhhd9LD3ALZoqZgPOH/7q/ssYTxqa6dn5kWxGNk5w
         q+ENGYhJv7llmsJOYwmbdSD3tinVbEZlMXkbXuprclOgMg+zGsGli8E5Osjj9VTrbq/F
         WRtA==
X-Forwarded-Encrypted: i=1; AJvYcCWo+Hm+FEwDuAnJEa1IzvR6QbCZM//VqWb4Of2zmJACjpvgXEL/aYB5vJtATkP9ksXJD+A8lwHQCmY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHLL4MAzMCZhu+oVyAvb8exPEE3uGLK0mHy6bfBqeQsoI7TPcx
	zGrUGxMyb+oa9FfSBws7R3tcFyARxjrTMq0uh01qDAVQ7xVLC8RfzuE8Wi8iXegCUQ==
X-Gm-Gg: AeBDievHTrC4U/m47RsjWG/MIsNYhHI7WaL1H072et0FXCrmfmSJkCjgJltSWPWgMGr
	oypb4ZsOjg9a9SAdoxXdwkxXduk6f8LlHQg+0uC51DpzRmwLu/3wk7SdxbJK5alblcvu8fuzwZT
	iJMrjnRBVd3LwQfC+6Z64SdvhIghEx9y2GgOFVyifQWYMaIHGFudJDMnHQKsuwBepQIHpJ0ccKP
	J008YJbSwiY1K8eGrcDHStCdlgQb8KfYeNCKK38XHH4ip7PumJXvj5pQ6bpcWYj7uuEhIz7f4zo
	4sqe5+sePyihQDLK6DsgJFNVpQDFEB2RlCoLscXbfQo3ok9BkrpFZxTQiAkeGUgO+rHKBWTKQvQ
	HmILUmaQ6D087KUDawrTuVkq1jlwspIdHdPlHCfiy5m3lk16+X8eP4t6ynHEVqsSkksE3m59U6i
	F0KWd1rRV+M7e0HR273YV+3VMBYmycOuAaJyRlLVLUUeTd3XtEcl6/aTpn2W4rXnt1ww1Gmg9yT
	WjzkTsjzRNW6XI=
X-Received: by 2002:a05:6000:22c7:b0:43b:8f30:39bb with SMTP id ffacd0b85a97d-43d5a18be29mr4283669f8f.24.1775735221729;
        Thu, 09 Apr 2026 04:47:01 -0700 (PDT)
Message-ID: <97a6f4cb-d938-404d-89c8-cb44e974817c@suse.com>
Date: Thu, 9 Apr 2026 13:46:59 +0200
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
X-purgate-ID: tlsNG-42698a/1775735222-1734C2A1-D05DD6E1/0/0
X-purgate-type: clean
X-purgate-size: 5209
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,call_data.info:url];
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
X-Rspamd-Queue-Id: 189AD3C9D70
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

The adding of the alignment attribute isn't strictly required here, is it?
Can it, with its own justification, be split out?

However, wrt what I said in the first reply, putting a full cpumask_t in
per-CPU data is even a little worse than having one as a global. Imo this
also wants to become cpumask_var_t. Then the attribute wouldn't be quite
applicable anymore anyway.

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

In the description you say "Track which CPUs are currently running
on_selected_cpus()", yet as per this the bit can remain set after the
function was left. Which isn't just an issue of describing things
correctly; there's also a performance concern: The IPI handler(s) will
need to carry out more work than necessary. That's not a lot of work (only
the subsequent cpumask_test_cpu() there), but also not nothing.

I also think another barrier is needed above here: We may only clear the
bit in tasks when the empty ->selected is globally visible. More generally,
since the bit in tasks is what everything derives from, barriers are
apparently needed around all of its updating / accessing. Which also meant
that ...

> +    }
>  
> -    if ( cpumask_empty(&call_data.selected) )
> -        goto out;
> +    data->func = func;
> +    data->info = info;
> +    data->wait = wait;
>  
> -    call_data.func = func;
> -    call_data.info = info;
> -    call_data.wait = wait;
> +    smp_wmb();

... besides (as already indicated) this barrier needing to move ...

> -    smp_send_call_function_mask(&call_data.selected);
> +    cpumask_copy(&data->selected, selected);

... here, I think that another one is going to be needed ...

> -    while ( !cpumask_empty(&call_data.selected) )
> -        cpu_relax();
> +    cpumask_set_cpu(cpu, &tasks);

... here, such that ...

> -out:
> -    spin_unlock(&call_lock);
> +    smp_send_call_function_mask(&data->selected);

... upon receipt of the IPI the target sees the up-to-date value.

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
>  
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

I understand you only re-indent this code, but I'm struggling with the
purpose of the barrier here. With the smp_rmb() above there are no reads
to isolate (data->func and data->info can't change while the bit in
data->selected is still set). And there are no earlier writes at all,
unless anything done outside of the interrupt handler would matter.

Jan

