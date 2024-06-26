Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71662917BA4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 11:03:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748540.1156279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOYB-0005iP-Je; Wed, 26 Jun 2024 09:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748540.1156279; Wed, 26 Jun 2024 09:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOYB-0005gE-Gz; Wed, 26 Jun 2024 09:02:47 +0000
Received: by outflank-mailman (input) for mailman id 748540;
 Wed, 26 Jun 2024 09:02:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMOYA-0005g8-ME
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 09:02:46 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9a5a524-339a-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 11:02:44 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ec3f875e68so71606041fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 02:02:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7066ac98fc9sm7449069b3a.193.2024.06.26.02.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 02:02:31 -0700 (PDT)
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
X-Inumbo-ID: d9a5a524-339a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719392564; x=1719997364; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bqkMklrYlhAjgUeJ0hm27xKX3s305+zLVUmyJ9bylK4=;
        b=IuCD+fNtQ0Ow9flEr22SJ/XZz4zydJTRoNOOQ0t9Dagn7iiftoUQi1M7miGnPj2G7F
         /0iHilM5URUbgUoOYWpzLP5Uohgk9nFgAnmUlhofzRstSsMYfYzzX/txMVTI5dqbdmLT
         3lbM2Va+7yTAgRaW7kQmtH556VyrrGFaI4M316fhmHn3CQbGbU5tFKX6zPE9+1w/1VaP
         3vkaHsdM5y8o1GtSEBBiY3nu+y0le1jedRzsHufnBI/n/lFBY4FzrveKN6NzdGACVy3B
         TlNERRO4NDhOFAV3Axhj6Nn5UeESJYFBp2HtHJRV0YSTJIGrMg6wMrNioLiPnLx63AZT
         vnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719392564; x=1719997364;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqkMklrYlhAjgUeJ0hm27xKX3s305+zLVUmyJ9bylK4=;
        b=ErblMzET/1iGItsGPd4JKY2y2oJy+X+YYIu0Q3jOAK0GcMNN0LKJ40FECsHxhw8uoS
         OM2soaH3vMhEBmnQlpFB+eW8qDLYcLXXdrSnNRmdE+ZLLHvU4YrYmLl9NI2HVSrkqF5i
         y0AdKvZyI11EbzUu55e7NRUlJayOAMYNQauPS/zYWVRNQFcpKvi5bcBkDsijkljbuk9h
         TWjP7pR4atc8VCATvakPzHlAAkS0XT41Gnkl5V18Y8nXN55dsITpejsdzpxI09iF0oYM
         j8cd3aKOhzuKTSH5sjTUJFFZukf2eIgNFl7xS816cDLYKH/AqeR8sRUMclGqvejKmlUN
         1xJA==
X-Forwarded-Encrypted: i=1; AJvYcCWkOsiLbYgANkqXaVByO/iOvcvCRsnYSOFWUnANZmTX5iNKhGP50P/SdJyFttczMoOYjQj2DwIAV5v3RT4nwthsoxig5jKkvbGn6Tr3yRQ=
X-Gm-Message-State: AOJu0YyzEadqE6rzNfH7uvOiv0z7TV+z8+6kZWXIV92hgEe9QdH56qDy
	0jBXhVOE8sMVs4JTvG1dIDjGlMBEH9f4OUFkC0frMFq34/EUs1qi5ugj5MLiMQ==
X-Google-Smtp-Source: AGHT+IEh+m7kn+LNw3HeLiUsYaIsCFmQe2i4nKVtBN1bzhBikCjJi1QZWRFi30GL1kvliMV60tza+w==
X-Received: by 2002:a2e:7203:0:b0:2ec:2314:3465 with SMTP id 38308e7fff4ca-2ec5b36b959mr54926411fa.11.1719392551651;
        Wed, 26 Jun 2024 02:02:31 -0700 (PDT)
Message-ID: <e740e1be-7890-4e8f-879a-87043ac109c5@suse.com>
Date: Wed, 26 Jun 2024 11:02:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/sched: fix error handling in cpu_schedule_up()
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20240626055425.3622-1-jgross@suse.com>
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
In-Reply-To: <20240626055425.3622-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 07:54, Juergen Gross wrote:
> In case cpu_schedule_up() is failing, it needs to undo all externally
> visible changes it has done before.
> 
> Reason is that cpu_schedule_callback() won't be called with the
> CPU_UP_CANCELED notifier in case cpu_schedule_up() did fail.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Fixes: 207589dbacd4 ("xen/sched: move per cpu scheduler private data into struct sched_resource")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two questions, just for my own reassurance:

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -2755,6 +2755,36 @@ static struct sched_resource *sched_alloc_res(void)
>      return sr;
>  }
>  
> +static void cf_check sched_res_free(struct rcu_head *head)
> +{
> +    struct sched_resource *sr = container_of(head, struct sched_resource, rcu);
> +
> +    free_cpumask_var(sr->cpus);
> +    if ( sr->sched_unit_idle )
> +        sched_free_unit_mem(sr->sched_unit_idle);
> +    xfree(sr);
> +}
> +
> +static void cpu_schedule_down(unsigned int cpu)
> +{
> +    struct sched_resource *sr;
> +
> +    rcu_read_lock(&sched_res_rculock);
> +
> +    sr = get_sched_res(cpu);
> +
> +    kill_timer(&sr->s_timer);
> +
> +    cpumask_clear_cpu(cpu, &sched_res_mask);
> +    set_sched_res(cpu, NULL);
> +
> +    /* Keep idle unit. */
> +    sr->sched_unit_idle = NULL;
> +    call_rcu(&sr->rcu, sched_res_free);
> +
> +    rcu_read_unlock(&sched_res_rculock);
> +}

Eyeballing suggests these two functions don't change at all; they're solely
being moved up?

Also, for the purpose here, use of RCU to effect the freeing isn't strictly
necessary. It's just that it also doesn't hurt doing it that way, and it
would be more code to directly free when coming from cpu_schedule_up()?

Jan

