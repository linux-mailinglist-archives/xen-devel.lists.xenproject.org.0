Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 805039F2E15
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 11:22:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857650.1269870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8Dv-0003f6-2h; Mon, 16 Dec 2024 10:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857650.1269870; Mon, 16 Dec 2024 10:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8Du-0003cl-WE; Mon, 16 Dec 2024 10:21:11 +0000
Received: by outflank-mailman (input) for mailman id 857650;
 Mon, 16 Dec 2024 10:21:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tN8Dt-0003cc-IQ
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 10:21:09 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7565b830-bb97-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 11:21:05 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-436202dd730so27462795e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 02:21:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362559ec08sm136229865e9.22.2024.12.16.02.21.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 02:21:04 -0800 (PST)
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
X-Inumbo-ID: 7565b830-bb97-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734344465; x=1734949265; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SPUpQ3AANBoIUV/uT+3rcfFFLjpUmp27Gb7Kq7AbkTU=;
        b=Szln7NFyFC1Sa19+CWdPwDLVY0Y5DH2UKUI8sy6mm+UbFeIRtC4vjZ1Dks5dTHHrZM
         qMtcATVoNRE+aunfq/3GBF/tM5eYSPu4NfKgc4CJLwaiUQBpHOEsREQqtc9+tniI4sX8
         lC9CZw1YaDxEfAQwGX+2r+nOZPABPtdyLoFB7k0+2PUV2kcIw54+V+63r96NyL3ta9mj
         o1fiInqtGoswJ7IosHzCcuiU0TXl6t6KtYxCxmthGsesBMldP6rrtTdrJdm4KOia8aOl
         7PezaJIkooJ4X3aH+iBjYQma0OpBJzo0LDeoCEhxF6HkR4RYIQpin6imQts1d1q8logn
         zkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734344465; x=1734949265;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPUpQ3AANBoIUV/uT+3rcfFFLjpUmp27Gb7Kq7AbkTU=;
        b=fdW8bqZr1yIcZroesB4F7yOIlL/iqWj9t84iitpYu021WN5pbgCfz80d/gB4V5ykmd
         yhgcc/mFby6TfMW305ngc7KYVTPrEBqTT97hHWgfKODUIM29/XpIdTC+twvgqCMU2EuY
         0qqFgAs792JY1hvsAPXmafcOhZuQ1BLoIoFEUNcJUfvYtpgxloQYkC2Ksw54K2TClrko
         oAOSmx5lE6US/oaBvDepOcaqgp65r6VbEZPrIQCnvFtEw6rOZnq4R38Gbi0FFx8qVJ2/
         LH+d2nIcRa0aVpiH+lyVlNTtQTuohlinjDnrduGzcLEURCuhbLqBCgFKZBceYStcopnu
         l+zw==
X-Forwarded-Encrypted: i=1; AJvYcCVp4a1LoWeXoETu52+UaqzVpcYyYaL6Z7OFO9HAjAeD7x78NR4Wh2nzchVh1bdxYIv95Aa9E6h6MJM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxW9q+Y/N9FARsLKFwxEBc1aR5vaT/xDWaK9gpcGMY3KfJeb5av
	6ejQFaJacdSqG0KOygrJjOtuE98knNSrtqFLMAzaNOh4SIKYingO7LYCs6av1A==
X-Gm-Gg: ASbGncueY6aV6t2j32uWkeGRUKcWTUxmq1HzlSHHP3awzu0K16+0CI+2S8yNvcND9Vc
	vfONFfrMkrB/s6+OFOcZa7ydXc8RQRuhQxkGS+pZiqhV03kQ1PV7LEjj3vmdBhdWH3a8j9DMO2o
	k9ioTGMmW/sQVyvGulLCMCYsraZEtMpSGALoPtSLR2OAQyISqt6i4VZvx7THpjmqZWcR+6gVZin
	YVUuiK5+3zH5PHQaxOSD5q1lv509TIzMm5AoqtCFYd7xLD5bhazCxHzG95dGw+BMLXsbHBZz/Fq
	hZ4bHIssRO68lBFLIPWsQJdPGPZP9HfB49R8lrgA5w==
X-Google-Smtp-Source: AGHT+IHw87OegXSV2JNn4ULvXYDfEO2vjSDEdpDk2ZGL6Sqbw5zBbzA1JBTVjdtxClv5Q4GS2lh04w==
X-Received: by 2002:a05:600c:5248:b0:434:f3d8:62d0 with SMTP id 5b1f17b1804b1-4362aa34e58mr120872315e9.3.1734344465029;
        Mon, 16 Dec 2024 02:21:05 -0800 (PST)
Message-ID: <50258f9a-89e6-4a62-8ed5-63a3bfa668c8@suse.com>
Date: Mon, 16 Dec 2024 11:21:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] xen: add bitmap to indicate per-domain state
 changes
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241213162421.16782-1-jgross@suse.com>
 <20241213162421.16782-5-jgross@suse.com>
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
In-Reply-To: <20241213162421.16782-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.12.2024 17:24, Juergen Gross wrote:
> @@ -138,6 +139,60 @@ bool __read_mostly vmtrace_available;
>  
>  bool __read_mostly vpmu_is_available;
>  
> +static DEFINE_SPINLOCK(dom_state_changed_lock);
> +static unsigned long *dom_state_changed;

__read_mostly?

> +int domain_init_states(void)
> +{
> +    const struct domain *d;
> +    int rc = -ENOMEM;
> +
> +    spin_lock(&dom_state_changed_lock);
> +
> +    if ( dom_state_changed )
> +        bitmap_zero(dom_state_changed, DOMID_FIRST_RESERVED);
> +    else
> +    {
> +        dom_state_changed = xvzalloc_array(unsigned long,
> +                                           BITS_TO_LONGS(DOMID_FIRST_RESERVED));
> +        if ( !dom_state_changed )
> +            goto unlock;
> +    }
> +
> +    rcu_read_lock(&domlist_read_lock);
> +
> +    for_each_domain ( d )
> +        set_bit(d->domain_id, dom_state_changed);

Use the cheaper __set_bit() here?

> +static void domain_changed_state(const struct domain *d)
> +{
> +    spin_lock(&dom_state_changed_lock);
> +
> +    if ( dom_state_changed )
> +        set_bit(d->domain_id, dom_state_changed);

And perhaps even here, considering everything's under lock now?

> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -485,6 +485,13 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
>      if ( (v = domain_vcpu(d, vcpu)) == NULL )
>          return -ENOENT;
>  
> +    if ( virq == VIRQ_DOM_EXC )
> +    {
> +        rc = domain_init_states();
> +        if ( rc )
> +            goto deinit;
> +    }

This is tied to VIRQ_DOM_EXC. How come ...

> @@ -527,6 +534,10 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
>   out:
>      write_unlock(&d->event_lock);
>  
> + deinit:
> +    if ( rc )
> +        domain_deinit_states();
> +
>      return rc;
>  }

... de-init happens upon any error, regardless of vIRQ? Even checking
the virq isn't sufficient, as we also need to gracefully deal with the
-EEXIST path.

Jan

