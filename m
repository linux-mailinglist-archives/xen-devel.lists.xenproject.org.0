Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 666C29E9C23
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 17:52:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851741.1265766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgzV-0004RK-Ef; Mon, 09 Dec 2024 16:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851741.1265766; Mon, 09 Dec 2024 16:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgzV-0004PQ-BY; Mon, 09 Dec 2024 16:52:13 +0000
Received: by outflank-mailman (input) for mailman id 851741;
 Mon, 09 Dec 2024 16:52:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKgzT-0004PI-H0
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 16:52:11 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee023b09-b64d-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 17:52:09 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3862df95f92so2366383f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 08:52:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21627260937sm45821495ad.103.2024.12.09.08.52.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 08:52:08 -0800 (PST)
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
X-Inumbo-ID: ee023b09-b64d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733763129; x=1734367929; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Oe7SIAzJ7RU6DukID+TlaLefZM63Iz7E9Xmln4k3LXc=;
        b=UBV1GmmWYQYVB6xSbeFivlnM3c9tIRve4yZDlVsTGDmCet61lHDqH/L2R3LT7uByeF
         U1BNRQgWNfAsPOHzJK20HNSs/4JCxg9st6Nc/mKLHIPd5WII5DyXbRAb31WdRXvFO5VT
         DQILlkIn1k/cXrLGCBPLnHgJgEUj4VerF/MycLgGNcKawOwY+laV+9fLDpA6kKAioGo4
         OGTn92YH940DAmXypY6W8g2FNI5UqSGPE6wFzF+Ve6ZlgIFLxmmaiDAbZ3udrsId3H29
         jSwxbBpSxTHvnkuD8KXil8HtLo8oD+TWBacqR2dd9nyJqgscJq0MbjtLNDR53oaf/jqK
         iRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733763129; x=1734367929;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oe7SIAzJ7RU6DukID+TlaLefZM63Iz7E9Xmln4k3LXc=;
        b=bqV48R6Apa0X3NqQOu8UqhGn4BS8AJDuGcRbVmpmDI5u9KPJt2bYTx/0KvbLEoJXLD
         NJ/Zto/TDk1h4b9LdEurw31OLL6s90uoPzJ9lbx5DPhfOge5ww4e4H5brimgl0Qi2ZZH
         vaGbGxBpr3fUW/RiaXFZoNmwdOSJr0QQtrHGUJP8gfMANwr2ls8fhYZHX/azdvL3ovK4
         J3LX36+4RXzaX/RF21fWqsfqXu2U3AeHQ7Q2ck8fOpuNfUPbZ7Lm5KwwncYtIiaWfOfK
         ibsB3wHTdijJAquvrZ5lJE0ldfKSPANagXkbtviaOfsTgOwiuU+O7RS5gzlY5nX+mAts
         6oog==
X-Forwarded-Encrypted: i=1; AJvYcCUOrAY3ZcHW1NThUvWj6W+yoykWlO8J4fpZ+MBr/8WwCUA/HiTKGcbl+Nz1zT6Z4KtmKd7guzBeyZM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQbxrjQL4i17kSILNk6T7GgfVA5kXxekm+YsVO18PzhUF7dfiz
	gISwkXX65jg5KQaHrqIS8jaHQdPGHfD6fO9dc7p86MK7nBX83nLyiPYH1ZoPDA==
X-Gm-Gg: ASbGncv8dLi4OPhDEchh1Vx9j0NP7k+UyzmAdz2eJ+Zfk0KOY15nEQrs5oOqZagfydL
	Bl3UwGRUotYJv4G55122EPFQb5tNxKux+PNTe+SGi/95RgHUCb+tvqfDUGNfnjCwINRLBx/zJ/2
	2h9Cb8ucw7srCslmYuxfbU8NWYbbugGn/FiUwm1/WS1BnMrVFC7/VPw83T5vQFV5zteU0f3aB+S
	zPE5uoU/JBch2GzKLqtEKBjX4/jyJLJFUpBF6/pc8OSkBh2tsdXNLgnS0VjlhRHyz2cMUouhksX
	U0Fg6N+S9Blb8VUDrbD8IErf4J6JgaxNMmI=
X-Google-Smtp-Source: AGHT+IGOubpyw9dAdIj8DXacrzzYXTafP+GlDAuI7a4WoomOhRf/3i7Stzg9gzQ4lpbvhjMzSlsmQA==
X-Received: by 2002:a5d:64cb:0:b0:386:3cfa:62ad with SMTP id ffacd0b85a97d-3863cfa63acmr4611378f8f.1.1733763128911;
        Mon, 09 Dec 2024 08:52:08 -0800 (PST)
Message-ID: <8acde5e5-7972-4f7a-ae31-92c3f323669c@suse.com>
Date: Mon, 9 Dec 2024 17:52:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] xen: add bitmap to indicate per-domain state
 changes
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241206130221.17773-1-jgross@suse.com>
 <20241206130221.17773-5-jgross@suse.com>
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
In-Reply-To: <20241206130221.17773-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 14:02, Juergen Gross wrote:
> Add a bitmap with one bit per possible domid indicating the respective
> domain has changed its state (created, deleted, dying, crashed,
> shutdown).
> 
> Registering the VIRQ_DOM_EXC event will result in setting the bits for
> all existing domains and resetting all other bits.
> 
> Resetting a bit will be done in a future patch.
> 
> This information is needed for Xenstore to keep track of all domains.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

What I'm still missing is at least mention of the global-ness of all of
this, and why that's deemed okay for now.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -138,6 +138,60 @@ bool __read_mostly vmtrace_available;
>  
>  bool __read_mostly vpmu_is_available;
>  
> +static DEFINE_SPINLOCK(dom_state_changed_lock);
> +static unsigned long *dom_state_changed;
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
> +    else
> +    {
> +        dom_state_changed = xzalloc_array(unsigned long,
> +                                          BITS_TO_LONGS(DOMID_FIRST_RESERVED));

New code wants to use xvmalloc() et al.

> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -485,20 +485,27 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
>      if ( (v = domain_vcpu(d, vcpu)) == NULL )
>          return -ENOENT;
>  
> +    if ( virq == VIRQ_DOM_EXC )
> +    {
> +        rc = domain_init_states();
> +        if ( rc )
> +            goto out;
> +    }
> +
>      write_lock(&d->event_lock);
>  
>      if ( read_atomic(&v->virq_to_evtchn[virq]) )
>      {
>          rc = -EEXIST;
>          gdprintk(XENLOG_WARNING, "EVTCHNOP failure: error %d\n", rc);
> -        goto out;
> +        goto unlock;
>      }
>  
>      port = rc = evtchn_get_port(d, port);
>      if ( rc < 0 )
>      {
>          gdprintk(XENLOG_WARNING, "EVTCHNOP failure: error %d\n", rc);
> -        goto out;
> +        goto unlock;
>      }
>  
>      rc = 0;
> @@ -524,9 +531,13 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
>       */
>      write_atomic(&v->virq_to_evtchn[virq], port);
>  
> - out:
> + unlock:
>      write_unlock(&d->event_lock);
>  
> + out:
> +    if ( rc )
> +        domain_deinit_states();
> +
>      return rc;
>  }

Renaming the prior label (and hence needing to fiddle with existing goto-s)
feels a little fragile. How about keeping "out" as is and introducing "deinit"
or some such?

Jan

