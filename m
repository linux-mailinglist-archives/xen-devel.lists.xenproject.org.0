Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACB4CD5A7C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 11:48:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192038.1511404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXdSS-0005M8-G2; Mon, 22 Dec 2025 10:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192038.1511404; Mon, 22 Dec 2025 10:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXdSS-0005JI-BF; Mon, 22 Dec 2025 10:48:08 +0000
Received: by outflank-mailman (input) for mailman id 1192038;
 Mon, 22 Dec 2025 10:48:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vXdSQ-0005JC-Iw
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 10:48:06 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b185ca1f-df23-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 11:48:04 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42fed090e5fso1773604f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 02:48:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea830f3sm21291633f8f.22.2025.12.22.02.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 02:48:03 -0800 (PST)
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
X-Inumbo-ID: b185ca1f-df23-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766400484; x=1767005284; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MOVdg3KxuxJI/OvC5S/Ed6qCE+9UNJsSXye+vlru8hM=;
        b=a4EOcRAycBdZDE03Ruw3U77jWOL0dr7pzquk6LubU7EKe+ZWiLlUZmMI6A8IGj2J+F
         ehOlOMiM2b8da/sgpJe8X5PAq2JB5g2T2nFwA10MBKaStrTB8HmdeL9UB07dYTOagDpr
         L8NHAdGNtcN1Fn5D/1dh9KHMLGBqndKNjYoBsD/ebks79qeOdHfk84RwyRhWqEBXsEfb
         0Xwpovu283fXEA7mH3tk5BvRiuROPMPjvEIr2EGmYtQ3TM36LgJB/VwQwT+bYbgcKcjd
         KMvqqRNLuHPn7yG6L/2wt5bv/k9X0A9mj8m8sg0oeiW0gfYQkJ6eSFfcV+/V2RFWMcUg
         0Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766400484; x=1767005284;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOVdg3KxuxJI/OvC5S/Ed6qCE+9UNJsSXye+vlru8hM=;
        b=HmUOKSAwWdAIcMMPYRVQtz5vm/FY7bQBfleyIk0qnn9j38i9z8jng5ovVt5dylPbAl
         HQAeozXj6BGiR7eHTbXjpIM2Ob/VR2b9Eox7CsK7D9pdMUaIvfLAgec+8rzgk5a1pkhQ
         q/nhxzGYDdbAS3xKJ0zYHZqkAulKpq35DSYhX0ka4ak558/Kw4VYM6SQQoU18Z99Y1uO
         QHP43pzKuX8t1xFkRVeWf5Q781y8VNiiKPysFfIwV9i6IjKGPbGPj/PjQOLMLASMDXPW
         wq7r1iydE85AHeVqP6hY7a82DgzDaEnt6lGTCmawQAoRqwJMV/+xBXMy3cXTxuv6gjjY
         yHrw==
X-Forwarded-Encrypted: i=1; AJvYcCUD/vyN10FPK3c+vCVsVRPkDD1PSGy5ICrTjwMyVYtHHI6Uio44hoA2AWmwa9NI6qKkAgbm+3vizw4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmpcAVFLH0cfF7qa/4r289TDIzppId28SbjB6UGl0ezp2RRqnT
	vIbgGqwkKIUataQ9Wgsi++bCpqWoSyrvRmsqqOOLbtMz77Y1J5RwcOAtUh+Bh93jfA==
X-Gm-Gg: AY/fxX47dfqEfKCZypmnv8fgOgi7YqZde+AJh5Dzyq02lbDeefX5yqoVcv/rce4YydY
	CK7NtS6uRwH6HtgzAGT9l2DyL+62/vf9Cyb/djkOfPEDvWVyplFnuaqdqlB3t6thdRgTbOTiBVT
	b0zLBsJAKfH0tQxRT4uNqJF2jObkFAZGdg7eO8Kd2BcFVynfPV/Pk0WnGrBLzYC77BpnhAl2H2H
	vlqBNs6zFS+WFdXXoS9yWMysNfgnXvTnAxM+RccHBZVT19PjyWVjA0aPwmy9geoz+T9D9eiJZ1r
	rOVe3YhDkzTpy3NPfN4QcTZDcx6DX4z3sAof0cOcvkf0bQKkTPuOAAYxdDKbBKKtf+1V+UmszDX
	EyWedR0jtgceWVMFaYzq1tujHmYRFzML92LDNqVclG5GIqcHwvMq/iv0+45moExPWP8tf9koh1o
	XgWKrXar6bO1LopvL42rbHW+9dJqca+ZRq9vI1HmBXTMPcYTRsBs/AGqNS+Ho1CZD1NTxfU+n9I
	lo=
X-Google-Smtp-Source: AGHT+IHNFthoYXKM4NMIFzPuKqwhRKt8wIxmoxGhWc2sX1cIX8m0ce7Kw/d+f1l9wWiYIA0rQP9T3g==
X-Received: by 2002:a05:6000:22c3:b0:430:fdc8:8bc9 with SMTP id ffacd0b85a97d-4324e4f92d8mr11692798f8f.40.1766400483874;
        Mon, 22 Dec 2025 02:48:03 -0800 (PST)
Message-ID: <1b34443f-03df-47c9-805a-6267d1e237c3@suse.com>
Date: Mon, 22 Dec 2025 11:48:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] xenpm: Add get-intel-temp subcommand
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1766158766.git.teddy.astie@vates.tech>
 <417d27567b9ef00d10335de089eaabe8e8e76102.1766158766.git.teddy.astie@vates.tech>
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
In-Reply-To: <417d27567b9ef00d10335de089eaabe8e8e76102.1766158766.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2025 16:42, Teddy Astie wrote:
> @@ -1354,6 +1358,113 @@ void enable_turbo_mode(int argc, char *argv[])
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
> +    case 0:
> +        /* This CPU isn't online or can't query this MSR */
> +        return -ENODATA;
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
> +    case 2:
> +    {
> +        tjmax = (entries[1].val >> 16) & 0xff;
> +        break;
> +    }

No need for figure braces here; you don't have ones either in cases further up
where there are no new local variables. Instead a blank line between non-fall-
through case blocks may be nice.

Jan

