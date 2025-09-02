Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54BFB40AFD
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 18:49:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107111.1457650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utUCM-0000a3-Iq; Tue, 02 Sep 2025 16:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107111.1457650; Tue, 02 Sep 2025 16:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utUCM-0000YZ-GD; Tue, 02 Sep 2025 16:49:34 +0000
Received: by outflank-mailman (input) for mailman id 1107111;
 Tue, 02 Sep 2025 16:49:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cv9L=3N=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1utUCK-0000YT-Hv
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 16:49:32 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb85af78-881c-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 18:49:30 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45b88bff3ebso17693065e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 09:49:30 -0700 (PDT)
Received: from [10.17.76.214] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b814da51esm182460925e9.8.2025.09.02.09.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 09:49:29 -0700 (PDT)
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
X-Inumbo-ID: cb85af78-881c-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756831770; x=1757436570; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MJ40ZRWGK1gb/0Ib0mzYXkq8QZP/wltgmRDQm7vwZMU=;
        b=LhA80NQ+6y9Aud6nFJ2at6SMaO//H/3WCviqCU5O5KyeCYLoKBhN+pCxeOs8Npp6KP
         3zFu9cfpGylk6nInytcursKIHOEAsdDgi7jqoZlJjHxhv/wHKQzK9c+LINS2ibP9bbHs
         2PTm5hzGLoS7cja98TUSjcN3csqUa+gObeeOzz/VuvoknLuFvHw6BKgWO/+V6Z1P36dA
         zxSFMYRav76GUyPz0j+OEiA458jsmSzhSuUB0yIKg1m2ZlC806vVWSqa+WQnGKoH5Ssd
         p2BpQjLWl9ndkOqgRgMAgDpMq6Pta4UViBiW/qiGkjKovJatoRvDnW6N4/hjLnSr9Tzu
         x5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756831770; x=1757436570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MJ40ZRWGK1gb/0Ib0mzYXkq8QZP/wltgmRDQm7vwZMU=;
        b=NH0wGNPXdh73loa0dDlwOQxMAJVA/6nW7RefN829pmdOpnJKROVG/Jg2gW6s08sG0p
         Wrw83K+UjuRil7vRFQinX/AP11OZr4S80bv9qh7vZbjBKm9vjxcSO1EaJEOkUxU2r/oZ
         D8BFBb6ZQnY/rjBLHfHeCov9EgnbPLVZ21Zet+QavDzLPbYTBlUpfN+2xvwY5ciqaiFS
         qCvTzNET6GkJ3jJO5VDmnnwrh9tNM8J7NcF5jW3W9PFnzICki0dltqmWHWh5UFDlxMWY
         fOKKv944KIsA2pnHMVq9uiLcmwk595hNMGyw7krpQ8NW/xBSrIPNqSDTl4B/JZ/cu3CO
         D3pA==
X-Forwarded-Encrypted: i=1; AJvYcCXjjt6mYHCxq1poUzBx3JBHdtDznCmM/2sf22jBTNtoDGW3U8cUJExKR49C8aSIR3X4OQFwocP6Hs0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8c88n0vITiQR9b0pfAQ8rNpuQ8AZtt9ljMC/XHvR+pbZrGspY
	Iy8n4jhmgr/9qWgd5GWstGXiAKq9wdSp9FKXd9sinYfEQW7tC+b4Lc1v
X-Gm-Gg: ASbGncvVLhuyrjZdWJgEuhqksJVz/2hJh91FtM5q4c2ZbKQ41swS5bVy5A53QMr3DZR
	h6ferPAVhN0IPIAYob+yApzaUG57pVPwfHMRPyakxHZ8AVQG+xHJ3c0fgGAmo3FvRn8hdn7IiiC
	4nqaaVo6lWqhfLh0tjB8z0pILcw6qfikR/DCBYpY7PqRKvDMLqGbB8d+J+rPXmQ4A1YzCKtbFOg
	ARBlzi8JEUocxXXw87geWQfFh4s/KLAY0wZSAafaSM+BsjsvBCdo8z1X6tEHot/51UoEuQDAmbr
	40iYfWnq8j/3krXA8Ydv4x4r5d3iuukkTmjYLGR6bKuXVrWbQa9LA491p/wLUeKfTB3xqDXAieo
	XooxQIeVm4G6aUUHw3gp0PWhBZ/ZiTkgYkkIDpqCvQxLksNSC7j2U4YMpF6FHnIAXMw==
X-Google-Smtp-Source: AGHT+IGxfW4y5GwVfokZdpipEi5/pu1pDbC7Rb5WS652P7zfnqSxmqzsCGKijwM4sSJi+me3SvRHRg==
X-Received: by 2002:a05:600c:3ba8:b0:445:1984:247d with SMTP id 5b1f17b1804b1-45b8552853amr105216085e9.7.1756831769436;
        Tue, 02 Sep 2025 09:49:29 -0700 (PDT)
Message-ID: <0fb4d962-a92a-4b8b-805d-60a03fe1b734@gmail.com>
Date: Tue, 2 Sep 2025 19:49:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/13] xen/arm: irq: Restore state of local IRQs during
 system resume
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
 <18c51957660441c945d51b02be965fbcc19c7c2b.1756763487.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <18c51957660441c945d51b02be965fbcc19c7c2b.1756763487.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02.09.25 01:10, Mykola Kvach wrote:

Hello Mykola

> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> On ARM, the first 32 interrupts (SGIs and PPIs) are banked per-CPU
> and not restored by gic_resume (for secondary cpus).
> 
> This patch introduces restore_local_irqs_on_resume, a function that
> restores the state of local interrupts on the target CPU during
> system resume.
> 
> It iterates over all local IRQs and re-enables those that were not
> disabled, reprogramming their routing and affinity accordingly.
> 
> The function is invoked from start_secondary, ensuring that local IRQ
> state is restored early during CPU bring-up after suspend.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V6:
> - Call handler->disable() instead of just setting the _IRQ_DISABLED flag
> - Move the system state check outside of restore_local_irqs_on_resume()
> ---
>   xen/arch/arm/irq.c | 39 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 6c899347ca..ddd2940554 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -116,6 +116,41 @@ static int init_local_irq_data(unsigned int cpu)
>       return 0;
>   }
>   
> +/*
> + * The first 32 interrupts (PPIs and SGIs) are per-CPU,
> + * so call this function on the target CPU to restore them.
> + *
> + * SPIs are restored via gic_resume.
> + */
> +static void restore_local_irqs_on_resume(void)
> +{
> +    int irq;

NIT: Please, use "unsigned int" if irq cannot be negative

> +
> +    spin_lock(&local_irqs_type_lock);
> +
> +    for ( irq = 0; irq < NR_LOCAL_IRQS; irq++ )
> +    {
> +        struct irq_desc *desc = irq_to_desc(irq);
> +
> +        spin_lock(&desc->lock);
> +
> +        if ( test_bit(_IRQ_DISABLED, &desc->status) )
> +        {
> +            spin_unlock(&desc->lock);
> +            continue;
> +        }
> +
> +        /* Disable the IRQ to avoid assertions in the following calls */
> +        desc->handler->disable(desc);
> +        gic_route_irq_to_xen(desc, GIC_PRI_IRQ);

Shouldn't we use GIC_PRI_IPI for SGIs?


> +        desc->handler->startup(desc);
> +
> +        spin_unlock(&desc->lock);
> +    }
> +
> +    spin_unlock(&local_irqs_type_lock);
> +}
> +
>   static int cpu_callback(struct notifier_block *nfb, unsigned long action,
>                           void *hcpu)
>   {
> @@ -134,6 +169,10 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
>               printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n",
>                      cpu);
>           break;
> +    case CPU_STARTING:
> +        if ( system_state == SYS_STATE_resume )
> +            restore_local_irqs_on_resume();
> +        break;

May I please ask, why all this new code (i.e. 
restore_local_irqs_on_resume()) is not covered by #ifdef 
CONFIG_SYSTEM_SUSPEND?

>       }
>   
>       return notifier_from_errno(rc);


