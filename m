Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D139F49E2
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 12:31:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858849.1271078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNVmx-00016c-IJ; Tue, 17 Dec 2024 11:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858849.1271078; Tue, 17 Dec 2024 11:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNVmx-000140-Et; Tue, 17 Dec 2024 11:30:55 +0000
Received: by outflank-mailman (input) for mailman id 858849;
 Tue, 17 Dec 2024 11:30:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNVmv-00013u-Lr
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 11:30:53 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f53d63b-bc6a-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 12:30:52 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361a50e337so36154895e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 03:30:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362557c462sm170346595e9.14.2024.12.17.03.30.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 03:30:51 -0800 (PST)
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
X-Inumbo-ID: 5f53d63b-bc6a-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734435052; x=1735039852; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d/mfsXunNSQNnIFYCopWatrMCH0ZKlN89edcoZT2Zvk=;
        b=Ng7CXuuB2rzn7/Zvv9rSEAKTftsH1vmwTMmmnFxmGPk0nCkUTmyolc20Cbew/Gh4yZ
         sBAStHigotFwGCZpDUqqAMpvutZBHu+ZF0dNbrFBewa0qoKLHtbvtdTKRTCaVh4l+89z
         cyEnmy+bkmcoQCvOlsg6ohIJd6g8Jfy3aH0l4IK4smTXTYcCI0DTZEpLDJV3P49B5cWh
         U/rs22Jy+RBsCdJBOLj1MPrKMWYwnewDYIFa6Ov+YZx8fRRr/9PwqRGQ9DTANVJ5hes7
         0JxfgYyf8wp4vpY6gNQ0wNBi48pJszGawfFDsnrzwGQPLWQ4ASPqmF/dB9kC1cFTIHGd
         ecvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734435052; x=1735039852;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/mfsXunNSQNnIFYCopWatrMCH0ZKlN89edcoZT2Zvk=;
        b=kyiGYKr8pm/x43ATK53g2WI41XaMLy1e6AO63/LhtjKCSDnZSPcWN8ONBkEbjHsnek
         nlfiCdeS62v1yeRvlgab/vG6gUiXygxylwEa/NzOZmJee4AG+/pfQeIpDJ7tdDT9cmqS
         QU7K3Ov2UAAOPWmoq92C/lGEy6VtEYcJUTXaXW2BXCcLunKXoylV+3Oi3q99wiiADIXR
         wzaebUhgj8ip1z6av6cdtZcjckfmm+fjMZQI6Ebtf05kxsIwWVgORDgvvcsnz7CRYPcn
         +RdHRzSRpkMxJ2XVGfdtVmUkAbk8tLRGgUCJzbPa95ihGTAGAI4vWHSJdNSXDRFJKnxX
         wEJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3kfqNktkoOiOvAE3VjsQHTIrldm5VYXNmAtiCuj5e2cmU7zYOzT/skHjl6mvzoHV58IswQCkS4u4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvGnCkyjc++1tFZWVSLQpzwumjJnQQE/Ng913cLy+ZbicmjWS/
	/1bWvz9imRvwtnXSOke6OP/JE5dqCUvxdw7AepnGlcktRQYwB9sFPfPcULMzYQ==
X-Gm-Gg: ASbGncudXpzX0K2pXgnd/a0Do00G5hM/+hTRrqvBceQJM/uqIOR7YuM/JCWHVgOn+AR
	aOgaRots0W5xom9D31Gvb5NxQc8LpO/qbVqixy6EhGAtW0gWu2RcQDmFlYkFJL8k9Kor+zVnr6c
	vQp5WNX+zipLmR7LtMRUA+bf8JaCGuBjG+QaJ5LlUWkPXpHa+AmsB9WlcWE9fGMgjLBTLdPO9+/
	DgtZaN8/vZcIEvjLjuaK9qYaR6U9OPa59nx+a6HgGgwkj0nhIqk2D23l5DJcA84NPOPB4GEpDrQ
	8NTIgWMg7TNY/4Vd3mBSbtazxFdF+7N0W9A5Aqlg9Q==
X-Google-Smtp-Source: AGHT+IGFDi+qd2TrOWa1FyvulV6K+W6cOkNysDTgD+eF3tJ9xGun1j1fdddt4SddzCRowGGjsgaYqg==
X-Received: by 2002:a05:6000:1acf:b0:386:33e8:20f4 with SMTP id ffacd0b85a97d-3888e0c189dmr14466882f8f.59.1734435051819;
        Tue, 17 Dec 2024 03:30:51 -0800 (PST)
Message-ID: <c2b9fb7a-cb45-4914-9d74-5933317737d3@suse.com>
Date: Tue, 17 Dec 2024 12:30:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] xen: add bitmap to indicate per-domain state
 changes
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241217111247.2204-1-jgross@suse.com>
 <20241217111247.2204-3-jgross@suse.com>
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
In-Reply-To: <20241217111247.2204-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2024 12:12, Juergen Gross wrote:
> V4:
> - add __read_mostly (Jan Beulich)
> - use __set_biz() (Jan Beulich)
> - fix error handling in evtchn_bind_virq() (Jan Beulich)

I'm sorry, I should have spotted a 2nd issue already when reviewing v3 (or
even an earlier version).

> @@ -138,6 +139,60 @@ bool __read_mostly vmtrace_available;
>  
>  bool __read_mostly vpmu_is_available;
>  
> +static DEFINE_SPINLOCK(dom_state_changed_lock);
> +static unsigned long *__read_mostly dom_state_changed;
> +
> +int domain_init_states(void)
> +{
> +    const struct domain *d;
> +    int rc = -ENOMEM;
> +
> +    spin_lock(&dom_state_changed_lock);
> +
> +    if ( dom_state_changed )
> +        bitmap_zero(dom_state_changed, DOMID_FIRST_RESERVED);

This needs to not happen when ...

> @@ -485,11 +486,21 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
>      if ( (v = domain_vcpu(d, vcpu)) == NULL )
>          return -ENOENT;
>  
> +    if ( virq == VIRQ_DOM_EXC )
> +    {
> +        rc = domain_init_states();
> +        if ( rc )
> +            return rc;
> +
> +        deinit_if_err = true;
> +    }
> +
>      write_lock(&d->event_lock);
>  
>      if ( read_atomic(&v->virq_to_evtchn[virq]) )
>      {
>          rc = -EEXIST;
> +        deinit_if_err = false;
>          gdprintk(XENLOG_WARNING, "EVTCHNOP failure: error %d\n", rc);
>          goto out;
>      }

... we take this error path. Which I think calls for moving the
domain_init_states() invocation ...

> @@ -527,6 +538,9 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
>   out:
>      write_unlock(&d->event_lock);
>  
> +    if ( rc && deinit_if_err )
> +        domain_deinit_states();
> +
>      return rc;
>  }

... somewhere here. It really doesn't need doing early, as the caller
may assume the bitmap was set up only when this hypercall returns
successfully.

Jan

