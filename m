Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOcVJ/3mimndOgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 09:06:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC4F118200
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 09:06:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226104.1532638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpikv-0003of-Fc; Tue, 10 Feb 2026 08:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226104.1532638; Tue, 10 Feb 2026 08:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpikv-0003mv-CW; Tue, 10 Feb 2026 08:05:57 +0000
Received: by outflank-mailman (input) for mailman id 1226104;
 Tue, 10 Feb 2026 08:05:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpiku-0003mp-Kc
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 08:05:56 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51ed9ff3-0657-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 09:05:53 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so16891325e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 00:05:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4376bd5a074sm14886098f8f.11.2026.02.10.00.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 00:05:52 -0800 (PST)
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
X-Inumbo-ID: 51ed9ff3-0657-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770710753; x=1771315553; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MoELWRxTo+0VyFkl3O25tmfBjCXfSjyNW+/IfwJUA8w=;
        b=JDDOhzHLVA2Nsl/hPkAL0xywwjVwBHc7GFwg5GdAS48Ty02kK56P0rgyxbLC5n1feP
         8U45CAWmVOwl9+6gIspGx59JtjSCZqMQRqCsMAWUXGAawhrnuSjPyrDPfvh/INNnz0Gc
         0I/uNw5xvTX9hac/ePdzOqARqXVG/1v1fHU854aGIizuD8QBUoKWGiUVosQSMLX90PH5
         VKa9Kz1s5Vx9TArbizreO3IeDY0o388v4xHyI3Z+vmEQtUrpMtUbGJkt1bZhbC5Xr4bm
         s6WUa9xQv1ysjoUHj23RX0R9m3v3LbO/jRj0FJxg4uJSy3H8kyw4UCcpQ7JSs+Mkxw0/
         zr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770710753; x=1771315553;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoELWRxTo+0VyFkl3O25tmfBjCXfSjyNW+/IfwJUA8w=;
        b=LOPgzI9+i1evV0lO0NitMG+X7NLXBTKhmaNwmkAaB6vHNX7DNTjlHvdmQ3yjc2EATp
         w/qkrlIAwzwXBJgwx3QxnRZzLeUy+RceBI7Ie9/k668ObIpT9dtF+m1SfmtL3pFAwcvJ
         exP+BE4B5ijO7Fs2kFwm4CY2lk7yTChOmFKkMdwjS1Spp600PjHbfixzN0OGwlQrPW5u
         omE7KevTPyStdwrxtn2LR6++mFhZxI8D51YN62ofe1uUfoy0DEmyEI8LyVT5f59KCEC6
         i54y49d+iUt4fPZfqu/m/BOmEQqGYq633FN4ZJG9Rv4JH6DBhdkjMHwoWLRvzD4NoB4m
         Us8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHkoPza1sGpA+TeW4d9kI1qy9u9HYnJaCElATiBWG1mG/NuLjH2v2n/siQmT5rEhhtZXs3y6/nXt0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykoiBVqma8XFw7b1zxMNPerNg+6B28sAmwq6S/GAz6kXpa6SqY
	d9dovdvz3iUHN96b1DtQZJQny7sKIn5fZPUNzklNtORzUP1hlkj8ILEQXApREaRWyQ==
X-Gm-Gg: AZuq6aLWRvs1ua0Lq2L01Z2Fp1msKsTyTBTqibzS/4VR2TjU3kIsJz105TcpdWPN7v5
	HrZX7v3i8AatPDtmo2jCPeDieJrguuknBlimc/mu4dL5RS73tYXbS/msuR3gKKKatIM6P2BETgk
	DXCqJPvkemj0EM2VUGFycCZyqfb+jt3riiaM1ZN50o+lhqo8+CYp1Ie4DM2tJEa8/Khiq9jfeRJ
	+RUFYyJxWjXMBPrKyt3E6X8401qmoiyxzAco26MmEJTf9tZ6lGQfGr0TRe+P8I/lfs8VtG9cU5J
	p+8qxlj/FsvtuIGYZD7bAgryV1v7fW8f5XkorZrGH9lRtPOEwmvQ+Kfvszl0kD0Smlx1wg3KuxT
	jKz0nWLGsVz4G52uJ9v7UwIm3WQCbkVlk4+x2/mgJP0Vg3GRzGBaG3dqbggwVOwpCcyLnN+yyPn
	Lel8GD10/Li8AGtRfcoq8UCAqFtOw3HG6RaUbIKyrbsaw/2cKKr3qkUarXLzo1nAZaZmGpjYfcd
	aHwMWn1Ix1uLcAYOOPgPQzLXQ==
X-Received: by 2002:a05:600c:3b14:b0:47e:e72b:1fce with SMTP id 5b1f17b1804b1-483209d0f27mr170830795e9.37.1770710752603;
        Tue, 10 Feb 2026 00:05:52 -0800 (PST)
Message-ID: <6fc9864f-cd99-4649-a44d-520303571375@suse.com>
Date: Tue, 10 Feb 2026 09:05:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/cpufreq: Add Kconfig option for CPU frequency
 scaling
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, jason.andryuk@amd.com,
 alejandro.garciavallejo@amd.com, xen-devel@lists.xenproject.org
References: <20260206233005.417233-1-stefano.stabellini@amd.com>
 <42c248e7-9747-4281-9fca-1b9950a06bf8@suse.com>
 <alpine.DEB.2.22.394.2602091804541.1134401@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2602091804541.1134401@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0DC4F118200
X-Rspamd-Action: no action

On 10.02.2026 03:04, Stefano Stabellini wrote:
> On Mon, 9 Feb 2026, Jan Beulich wrote:
>> On 07.02.2026 00:30, Stefano Stabellini wrote:> --- a/xen/common/Kconfig
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -1255,9 +1255,14 @@ static always_inline bool is_iommu_enabled(const struct domain *d)
>>>  extern bool sched_smt_power_savings;
>>>  extern bool sched_disable_smt_switching;
>>>  
>>> -extern enum cpufreq_controller {
>>> +enum cpufreq_controller {
>>>      FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
>>> -} cpufreq_controller;
>>
>> This enum would better ...
>>
>>> +};
>>> +#ifdef CONFIG_CPUFREQ
>>> +extern enum cpufreq_controller cpufreq_controller;
>>
>> ... stay inside here, then also making the split of type and var decl unnecessary.
>>
>> The two affected platform-ops likely want compiling out, too.
>  
> I am not sure I understood your suggestion. If this is what you are
> thinking about, it doesn't seem like an improvement.
> 
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1255,13 +1255,15 @@ static always_inline bool is_iommu_enabled(const struct domain *d)
>  extern bool sched_smt_power_savings;
>  extern bool sched_disable_smt_switching;
>  
> +#ifdef CONFIG_CPUFREQ
>  enum cpufreq_controller {
>      FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
>  };
> -#ifdef CONFIG_CPUFREQ
>  extern enum cpufreq_controller cpufreq_controller;
>  #else
> -#define cpufreq_controller FREQCTL_none
> +#define FREQCTL_none        0
> +#define FREQCTL_dom0_kernel 1
> +#define cpufreq_controller  FREQCTL_none
>  #endif

No. FREQCTL_* shouldn't need to be visible at all when CPUFREQ=n. Hence
the reference to the two platform-ops, where one (and cpufreq_controller)
is used. If those uses are also suitably compiled out, the #define-s
above shouldn't be necessary. That said, use of IS_ENABLED() there would
of course require the arrangement to stay as you had it originally.

Jan

