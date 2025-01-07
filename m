Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD67DA0442A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 16:24:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866527.1277816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBQu-0003O9-1m; Tue, 07 Jan 2025 15:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866527.1277816; Tue, 07 Jan 2025 15:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBQt-0003MW-VL; Tue, 07 Jan 2025 15:23:51 +0000
Received: by outflank-mailman (input) for mailman id 866527;
 Tue, 07 Jan 2025 15:23:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVBQr-0003MQ-S1
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 15:23:49 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6470e6d7-cd0b-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 16:23:48 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so10979709f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 07:23:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1fa2bdfbsm49897332f8f.102.2025.01.07.07.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 07:23:47 -0800 (PST)
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
X-Inumbo-ID: 6470e6d7-cd0b-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736263428; x=1736868228; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZokT/iBgCMJkc/jTDnSOEDz3zuHOtXGi02TGbTzYDU=;
        b=HRn3xFJd2nQh6e1s+3dgNOWoQxZ8Boi+jqOlSORuGZDefV+uNVn0JVm+xouKc5jjIA
         jewnra2nx9F6BuHSSy0ozsfdXqO5bt/a6tmce0Gk9S4pkJqPqpyyebTVFkqPQoSEf2ko
         DaSNlaoHfrU8qufTuAqEbVhwnYdwbDFKD5J1OjX7HGUJvbXBKaO4ZpsSJA1rn9N5vUuO
         IBCQkt7lj2oWNetSAum6g9SLE8yq1pGWo1HuCsDpBFJ1EFxCpoRt9vIPWSgTSmSSNsht
         IAT+rYqAq2+PEUx1fkg6rxKdu1ERwKbl+lGo2D04dx76KlHdJDyFXKH/gzg384tFZMEG
         oVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736263428; x=1736868228;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZokT/iBgCMJkc/jTDnSOEDz3zuHOtXGi02TGbTzYDU=;
        b=p2o1mq6W5vpNoww0l5GiYnAA4TkKIw12Ketzl+2rGQzHeTWGMOup+IWYXJzGwbfkug
         wWcB/+f1ymCBLJydBr+V7NFl5LBzXrYaPeTOT1Y/zLNbgzv+LUb1+iddDfTq4lLfzSg8
         PtmYxBv4PVFCa0eZ1Z4+9h6xASkFSu3tRmCVwCPHmd3xLTWFDTS85v6EPgnK+2Q0rFtd
         YRPn/PVqGbITvypFp4B+WNcWxuoc2WQ/14o0kB9I+mXI+zFlZJ3+GbsX9yjrvEmYkj7J
         socXlBJ3X4qgkKSsFNdcqHVcw2yJ7enjbd5zyyvgtaSdmTp4CoueLnHLDbko5Yo+EjKz
         olMw==
X-Forwarded-Encrypted: i=1; AJvYcCV1+/gQXYq3ZyWT9sSOB29B86I+wYT81iNPvCriIcsaKbH5MCvQ9Q1k0JkFvExN3lar42eze226ru4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZDW3x6uafJ9lOKF5Zn/EGlzirLhbicUrhI1yqd2ZDnEJdXuA5
	0Lq5zFj6nUFIJgxGVK5+MlQ6ZtoXe7/UQLOD80yPjclfEQ+13QFN1wrRIk8IwA==
X-Gm-Gg: ASbGncug+MWtiEI7Y4mNUxrWfvXEXN/yuKW8awowqRpO4TTGjWhDbfNKYEn2LCnEmAU
	P0lTpOkGbwUeQUn9htV/4ifV3/Eudfxmr5+XA00WlTSh4oLe1dv/dO+Bb88o19ylgqV6sS9eOiP
	1QL2a1CYUniZNAl0Z+xQ1R9jgDeYfILBsPbHyGSi2RO0kr1WfV9oU8UYYQvMR4L3CS/yFh3r/k/
	s9p46heBMxpsuHPlTzvdXArX9j2jc4VHKuU/K7Wc0FK6qLRPuG5Nxnt06qd0MML5VKJMuvDZyka
	IYZD0HdSMFwHdNiEt92elikD7ENWEbT99yIZAvtNvw==
X-Google-Smtp-Source: AGHT+IFVB1EEcM3V6Fee7KCK4NIcC3dxDaNK1loma6Vqp1ab2VSJjQXnAp/y8SwgnYcaYpJB85a/QA==
X-Received: by 2002:a05:6000:470a:b0:385:f092:df2 with SMTP id ffacd0b85a97d-38a221faae4mr46071934f8f.34.1736263428086;
        Tue, 07 Jan 2025 07:23:48 -0800 (PST)
Message-ID: <c7ed9380-a4a1-4576-af56-2949d80cfd92@suse.com>
Date: Tue, 7 Jan 2025 16:23:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] xen/events: fix race with
 set_global_virq_handler()
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-2-jgross@suse.com>
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
In-Reply-To: <20250107101711.5980-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.01.2025 11:17, Juergen Gross wrote:
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -979,6 +979,7 @@ void send_global_virq(uint32_t virq)
>  int set_global_virq_handler(struct domain *d, uint32_t virq)
>  {
>      struct domain *old;
> +    int rc = 0;
>  
>      if (virq >= NR_VIRQS)
>          return -EINVAL;
> @@ -992,14 +993,23 @@ int set_global_virq_handler(struct domain *d, uint32_t virq)
>          return -EINVAL;
>  
>      spin_lock(&global_virq_handlers_lock);
> -    old = global_virq_handlers[virq];
> -    global_virq_handlers[virq] = d;
> +
> +    if ( d->is_dying != DOMDYING_alive )
> +    {
> +        old = d;
> +        rc = -EINVAL;
> +    }

While I can see how this eliminates the zombie domain aspect, this doesn't
fully eliminate the race. Doing so would require (also) using the domain's
event lock. Assuming we're okay with the remaining race, imo a code comment
would be needed to state this (including the fact that it's then
unpredictable whether this operation might still succeed for a domain
already having d->is_dying != DOMDYING_alive).

Plus the way you do it the early success path remains; ideally that case
would also fail for an already dying domain.

> +    else
> +    {
> +        old = global_virq_handlers[virq];
> +        global_virq_handlers[virq] = d;
> +    }
>      spin_unlock(&global_virq_handlers_lock);

Nit: Much like you do at the top of your addition, a new blank line at the
bottom would be nice.

Jan

