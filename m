Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0D1D1D7E8
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 10:25:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202741.1518183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfx7N-0000gn-MZ; Wed, 14 Jan 2026 09:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202741.1518183; Wed, 14 Jan 2026 09:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfx7N-0000e4-JL; Wed, 14 Jan 2026 09:24:45 +0000
Received: by outflank-mailman (input) for mailman id 1202741;
 Wed, 14 Jan 2026 09:24:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfx7M-0000dy-3p
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 09:24:44 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dae42532-f12a-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 10:24:41 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43277900fb4so265271f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 01:24:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ff1e9sm50986089f8f.41.2026.01.14.01.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 01:24:40 -0800 (PST)
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
X-Inumbo-ID: dae42532-f12a-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768382681; x=1768987481; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EZahWFUg6rXWmaezAq8NXtXsslHE1pS9uJhUP7H5wzI=;
        b=BT1xDh4dE6hkmRF7i+diP2ON1kuO1kkdCAjUOJWHOPKPjvP4PJCYrMkH15bRChK3L3
         /egoexFdJ3hjQcOZYAcESep7mNi/WPycnExrYhyWkhxooX7SjA6Uo7Vp61o9v6OB5Cji
         ZvGsNIfl7OIpkBYBSKHLGXUq7FKB2yWSeszeMk9cXjR3PfFGZhMyaP1lsyafmpE+Bwhh
         1OgwuQJ7tZfQUDrd/NdTW3ERQ4XqW8i45d9PSyu8+qrs3dMWUzfuYf8aswXi9iJSBB2H
         hNj0g084WANgwNlA1SyZHI2tDR4UpgYE4mzaeOX0POphR+SJk8qnfZd2GDdSihieTKN2
         o2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768382681; x=1768987481;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZahWFUg6rXWmaezAq8NXtXsslHE1pS9uJhUP7H5wzI=;
        b=IfJcTY8Be8O3ghjI1cpRUUnpkoC5EAyDQZqDch0AUaWhmnzbdwgbdVNTTvgtiETpgl
         5SIKjZirzm2YKe788p8V18k0D/zJT9MBAh6eUMJbpUi1UwSV2Cr/ffIhtL77KHW62x6o
         +KDnZonL0XI0+nIK5zONhVwIAOIbu2j72cAURI7ZzCCGA8i6WYrF8PJcHIPAw+rx61ba
         slEHGxpUGK9FFHl0XoSacQqBuVk89FZkD0Tnn7Nsf8eNi+VqUspjMcsWu0g+FhnYQneg
         ouzkPtruDSCzpuOlsTljpX6235YvKUyPyQfqwh6BDrJIuT84ta6cbdt1EhenuotYKaGD
         s2EA==
X-Forwarded-Encrypted: i=1; AJvYcCVsQE77NgOQfJYKXCsYt2EPH3jG9AMCR/kwh28hEdBltgu6p35ezRyHEJtI1stXFH2Y7KVRBF5Akdc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywd9l2ylF9EV9yEL54VfSvOYs0kQKJAv/07J1905EvFeWDFQRLd
	gvNWg/7X07scctLF+8bvnYj7/ARB6imiHOMCuRC9r8VAHhOuDdYmgXA247/fHuJGpg==
X-Gm-Gg: AY/fxX5RIMVA+qjiGLka/JeywnRd34UTHyBWN3cPBcxxLocadH0Gn5zdjup7wIa3RSC
	5EkjI0RFH/nW22LBMzoWHIYePT7ZATtQxy11mA3AZfU2F6/5NVnaovsERnmPs5XMdWERO8Gi/9G
	a2hHOPdyz5PRdDB4gG6YFKv46aytMF0Y0trmkD3bOm+UGdiL/23i9p0QJWK7YirKQ8lqOSbW/br
	OpOco/IpTk1NrG1IpyoB3r5LBTX53u27pS40dJpuBfjlOo3gQkq6srGjgwxh/0VJ0zfl3Eox5TB
	FPSiJXjyaNqDXhrfGzPVqV0S7Muyo3t5YnIU9Ui9sQI0ulUwLqQ3iMdqeecC6BXx9+nhnXf2Gwk
	dOorWMa0s/sc2qarTKIdgNf89gm71lEq+F1yDHNmm1RYh/lxasDO1/HjkSX05kyKZbshyEdhu40
	7R3CN+59/KrHhx3/XjYiHeOAsMJ9qzGHMXpXV5LiuBNdpRVFjVkZ98dh2ewn9xfuJ7jrQoZ7XFp
	uzVrYH392BKpw==
X-Received: by 2002:a05:6000:40cc:b0:431:c06:bc82 with SMTP id ffacd0b85a97d-43423e7cf42mr8203734f8f.12.1768382680749;
        Wed, 14 Jan 2026 01:24:40 -0800 (PST)
Message-ID: <664b6639-732d-4e43-8323-47333b0d8e4c@suse.com>
Date: Wed, 14 Jan 2026 10:24:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] xenpm: Add get-intel-temp subcommand
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <7dfa012b734f3c769da88f0f1c989d07b724bdaa.1768235932.git.teddy.astie@vates.tech>
 <7ae6ca6f93e81cb0b5a71db90913dc3f67e6b763.1768235932.git.teddy.astie@vates.tech>
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
In-Reply-To: <7ae6ca6f93e81cb0b5a71db90913dc3f67e6b763.1768235932.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2026 17:47, Teddy Astie wrote:
> @@ -1354,6 +1358,115 @@ void enable_turbo_mode(int argc, char *argv[])
>                  errno, strerror(errno));
>  }
>  
> +static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, int *temp)
> +{
> +    xc_resource_entry_t entries[] = {
> +        { .idx = package ? MSR_PACKAGE_THERM_STATUS : MSR_IA32_THERM_STATUS },
> +        { .idx = MSR_TEMPERATURE_TARGET },
> +    };
> +    struct xc_resource_op ops = {
> +        .cpu = cpu,
> +        .entries = entries,
> +        .nr_entries = ARRAY_SIZE(entries),
> +    };
> +    int tjmax;
> +
> +    int ret = xc_resource_op(xch, 1, &ops);
> +
> +    switch ( ret )
> +    {
> +    case -1:
> +        /* xc_resource_op returns -1 in out of memory scenarios */
> +        return -ENOMEM;

Assuming xc_resource_op() is well-behaved in this regard, why not return errno
here? Or yet better stick to -1, leaving it to the caller to consume errno? And
then ...

> +    case 0:
> +        /* This CPU isn't online or can't query this MSR */
> +        return -ENODATA;

... set errno here and return -1? With this normalized here, ...

> +    case 1:
> +    {
> +        /*
> +         * The CPU doesn't support MSR_TEMPERATURE_TARGET, we assume it's 100
> +         * which is correct aside a few selected Atom CPUs. Check Linux
> +         * kernel's coretemp.c for more information.
> +         */
> +        static bool has_reported_once = false;
> +
> +        if ( !has_reported_once )
> +        {
> +            fprintf(stderr, "MSR_TEMPERATURE_TARGET is not supported, assume "
> +                            "tjmax = 100, readings may be incorrect.\n");
> +            has_reported_once = true;
> +        }
> +
> +        tjmax = 100;
> +        break;
> +    }
> +
> +    case 2:
> +        tjmax = (entries[1].val >> 16) & 0xff;
> +        break;
> +
> +    default:
> +        if ( ret > 0 )
> +        {
> +            fprintf(stderr, "Got unexpected xc_resource_op return value: %d",
> +                    ret);
> +            return -EINVAL;
> +        }
> +        return ret;
> +    }
> +
> +    *temp = tjmax - ((entries[0].val >> 16) & 0xff);
> +    return 0;
> +}
> +
> +static void get_intel_temp(int argc, char *argv[])
> +{
> +    int temp = -1, cpu = -1;
> +    unsigned int socket;
> +    bool has_data = false;
> +
> +    if ( argc > 0 )
> +        parse_cpuid(argv[0], &cpu);
> +
> +    if ( cpu != -1 )
> +    {
> +        if ( !fetch_dts_temp(xc_handle, cpu, false, &temp) )
> +            printf("CPU%d: %d°C\n", cpu, temp);
> +        else
> +            printf("No data\n");

... you can then use perror() here (and perhaps elsewhere). Right now the
distinct non-zero return values of fetch_dts_temp() are of no interest to
any of the callers.

Jan

