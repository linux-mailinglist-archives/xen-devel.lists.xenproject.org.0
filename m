Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D3A9B7938
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 12:00:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828602.1243542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Stt-0006ay-3J; Thu, 31 Oct 2024 10:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828602.1243542; Thu, 31 Oct 2024 10:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Stt-0006YO-0N; Thu, 31 Oct 2024 10:59:37 +0000
Received: by outflank-mailman (input) for mailman id 828602;
 Thu, 31 Oct 2024 10:59:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6Stq-0006Xh-VZ
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 10:59:34 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3533f127-9777-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 11:59:32 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso8323425e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 03:59:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9ca8eesm52336995e9.43.2024.10.31.03.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 03:59:31 -0700 (PDT)
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
X-Inumbo-ID: 3533f127-9777-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzAiLCJoZWxvIjoibWFpbC13bTEteDMzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM1MzNmMTI3LTk3NzctMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzcyMzcyLjM3MDU5Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730372372; x=1730977172; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=87y4U5te/Z8O4jq7dLR7SHK9bZ6w4rkat3T91hrF7Yc=;
        b=SLhusn4ZLisehV2fO1hD3llSq3wr0pvU8JiwIICin2EsfGV0Fm4wIlEVZvZDcYI37u
         JtJUWHOQXTNEaqDaV9O2gXCgp0hp5YF6worazmMpvRomi5B6eDBY/hMJBBfx7FFFUflC
         puSTG0nWs+klRVSciO6HS+eMJkhGuqFq5d7q4EcknnpJ/Qj/jPyNEliClCpgao+TXpPh
         7loNsSVU9Ioygnz0EtOz0AwYnNTjBv3uyU4zfrRMz7zByX5j+iGMueOmX/KqWUgVwzxr
         WXEN+ly1pTNhiQDQUXyK92HWZQdtkQcH0ZNZ+0w/GHXNA31Quc1TE02VnFh2Zxl94ZbW
         d2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730372372; x=1730977172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87y4U5te/Z8O4jq7dLR7SHK9bZ6w4rkat3T91hrF7Yc=;
        b=wxqWWjZPgN91NoJifFN1ei9alwL3tNoHvLvOdwNdgjO2cFUnbw8ftazmMbopdTeSbu
         XyKYHXlNqE+HZ94ZqqjAMGIYQuSPg8j5lXfkrVMFJ569WBuO3Dm0vIotKBp71FIgRMyb
         HXVgVJupDoXaiA35Jovc69pKUUp9Qfmsl+kTC30fAjzrQNKQA0nqV2YJv+Avxp48t5q/
         GrY0H8VgKEGCy6snCt9Y6M2DzXRoo6Xfb44rhTvjO/mIT1bn+wZETz9UuwH4qKZ5DMm7
         2mV38snakQg/3oor4DRrMOghguyHuuL0MYksQyXMUgsbzNsD0WEuT9PHJgsHSKq9nEQq
         xrug==
X-Forwarded-Encrypted: i=1; AJvYcCVqg4BukDuwb2ZZxDtp50kkjMASeDgyuIvvfJ8awqz4IUQH+jNqeAdy0/JSl+a2D4Q8s549CRCIlCo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxp/LUhdrWkzL1CgIsLrVqHsxcFxmDf7Ojw+PQRWLHufS2g3eMo
	bzI71/J+uqH331oXzUAyx1sRpN2UHwrv0yuz04sEwX9MZYHtTth+BF/XOSq2kQ==
X-Google-Smtp-Source: AGHT+IH3UqaKYwxsxjy3PVic2JOCLPwVMkztnBPulXBeXYUUEbzD1RQI5FxwPHj05t3zWbN6pSud4A==
X-Received: by 2002:a05:600c:3c8c:b0:42b:ac3d:3abc with SMTP id 5b1f17b1804b1-4319ad068f6mr203762995e9.24.1730372371688;
        Thu, 31 Oct 2024 03:59:31 -0700 (PDT)
Message-ID: <6823a222-63ad-4a5a-83d2-70c6f39f38c0@suse.com>
Date: Thu, 31 Oct 2024 11:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] xen: add bitmap to indicate per-domain state changes
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-3-jgross@suse.com>
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
In-Reply-To: <20241023131005.32144-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.10.2024 15:10, Juergen Gross wrote:
> Add a bitmap with one bit per possible domid indicating the respective
> domain has changed its state (created, deleted, dying, crashed,
> shutdown).
> 
> Registering the VIRQ_DOM_EXC event will result in setting the bits for
> all existing domains and resetting all other bits.

That's furthering the "there can be only one consumer" model that also
is used for VIRQ_DOM_EXC itself. I consider the existing model flawed
(nothing keeps a 2nd party with sufficient privilege from invoking
XEN_DOMCTL_set_virq_handler a 2nd time, taking away the notification
from whoever had first requested it), and hence I dislike this being
extended. Conceivably multiple parties may indeed be interested in
this kind of information. At which point resetting state when the vIRQ
is bound is questionable (or the data would need to become per-domain
rather than global, or even yet more fine-grained, albeit
->virq_to_evtchn[] is also per-domain, when considering global vIRQ-s).

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -138,6 +138,22 @@ bool __read_mostly vmtrace_available;
>  
>  bool __read_mostly vpmu_is_available;
>  
> +static DECLARE_BITMAP(dom_state_changed, DOMID_MASK + 1);

While it won't alter the size of the array, I think DOMID_FIRST_RESERVED
would be more logical to use here and ...

> +void domain_reset_states(void)
> +{
> +    struct domain *d;
> +
> +    bitmap_zero(dom_state_changed, DOMID_MASK + 1);

... here.

> +    rcu_read_lock(&domlist_read_lock);
> +
> +    for_each_domain ( d )
> +        set_bit(d->domain_id, dom_state_changed);

d is used only here, so could be pointer-to-const?

> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -1296,6 +1296,8 @@ long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          rc = evtchn_bind_virq(&bind_virq, 0);
>          if ( !rc && __copy_to_guest(arg, &bind_virq, 1) )
>              rc = -EFAULT; /* Cleaning up here would be a mess! */
> +        if ( !rc && bind_virq.virq == VIRQ_DOM_EXC )
> +            domain_reset_states();

evtchn_bind_virq() isn't static, so callers beyond the present ones could
appear without noticing the need for this special casing. Is there a reason
the check can't move into the function? Doing the check in spite of the
copy-out failing is imo still reasonable behavior.

Jan

