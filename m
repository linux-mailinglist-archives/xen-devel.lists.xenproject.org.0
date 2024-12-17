Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151509F4F3D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 16:20:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859332.1271461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNZMc-0000Ro-VZ; Tue, 17 Dec 2024 15:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859332.1271461; Tue, 17 Dec 2024 15:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNZMc-0000QC-Rj; Tue, 17 Dec 2024 15:19:58 +0000
Received: by outflank-mailman (input) for mailman id 859332;
 Tue, 17 Dec 2024 15:19:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNZMa-0000Q6-S8
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 15:19:56 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ec1baab-bc8a-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 16:19:55 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso1909044f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 07:19:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80120bcsm11740695f8f.5.2024.12.17.07.19.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 07:19:54 -0800 (PST)
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
X-Inumbo-ID: 5ec1baab-bc8a-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734448795; x=1735053595; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NqnofJog/FYFBbWrp/1Y91hZaZwiLXYKdRCKViG3dGo=;
        b=CPzA6QK/flx/jyt42Yaf47LM2r21bpIdE3pFPwHFitcbZ2Mfx8mZtEL5915EG/o6yU
         WQyeOBU6LTJDdnLekHfRoiuGMd0O9HVZcWrPW6JeEmKRL6dqLSyjYi7GPz5ruZ9gDsbx
         7tBxwGcu8SioCK5lnrriZNxLvc3ip0GcAFj+KDwKxN3R0rNOtG1apZuh/xI0L+7KNiad
         gwrP5GUpfSk7H/7jd+E5kRHl2OFYUIJTwBrFLm52cFSUo2CfvxCZm/0KArAJIwusvpoB
         TBnDcIDGyFy8XWurxjV78TKuFWjBbiR6Hiu0ENjwf29nKxC1e6vGvNZ4/RALFXQ+CUXU
         I8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734448795; x=1735053595;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqnofJog/FYFBbWrp/1Y91hZaZwiLXYKdRCKViG3dGo=;
        b=MYP6THufgOc/gEf3Ht0SBw8ZCOASLBEi5mMxxaq+CfIQiLOeKw9syAn5vzrYLqUcp6
         xq9eshoKNOExJH8+qSevYQB44hxNXJJv3wAYK0RO5tMkdOLaL4iqyCnzkRB8RDrJMysk
         gvZR4ZvX7PeebQkCUcPtNvMHRmx1nZm3A8fsxetjVaEcUnghcq6TP/zhc/JfmefKmB35
         b9naLAT4k0ejWb/jZE6FUK9z9B0OFlJoh+5FkIYeQNLByLESKTicQDwvqMlCVNcJldrv
         Aq9tLZYyAVS3R02bWn1eLgeJNhgTB3Pq/IINr25ThiaQ5b42lUZTRrEdANMR5E6xV+1n
         xKqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxsWM/P/E+Yz0hD1cRolelIsmKtGJVESiR7XIrXyj7JduTVV+bqK5F1ttiQIWoUj225ZnQ7ae2RQ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdjeLoCOObpr+2YJYfdox/G6d5LBs+u46L5DI6I9mWfr0g1k10
	gBSyUA5kezCRii6T4e3cLjZFDVE0P5M5+FK+aE27k64sOFDzjhtDjbK5AKHs6A==
X-Gm-Gg: ASbGncv7LE8RvHLA6XsYMM6JeYcHitsaOKJKT0kJqbAMfSNjWUAgUf7tuuB5CNnhwHU
	w+wLWzPuNLqerJAceebrQDS/tYST7ZBLDd0blEQ9/vWdlfVL+8I/ToCG/I03YwT2OUd2NNobUir
	nd9f8U33IwWwT5HNrQSUyfF4OQwdW+9bZbetAgzuqaQ2K1rZjr/JxwsibpxszWKsQ2Muf599RnU
	JlZiMeRntI3n2tGQWYprYci/bwcbvzY2dKUVyR5RP4VdGN61RJ7s+J/rQiIGvdzNJoC7TD3xg/k
	9Gmozq6t7KY50a7J7Mi6SDgOt+KohxDCULawDVT3Ug==
X-Google-Smtp-Source: AGHT+IFnbL5uExR/+8OImpsVwxPmpXezt/oPgBnVmOereBXluR+RTCkgaAe3X/VPj1FfFfMuM8Nssg==
X-Received: by 2002:a05:6000:4b12:b0:385:edb7:69ba with SMTP id ffacd0b85a97d-38880ac5f25mr15629992f8f.1.1734448794830;
        Tue, 17 Dec 2024 07:19:54 -0800 (PST)
Message-ID: <ce327545-c23b-4272-a290-ce950b4c27f5@suse.com>
Date: Tue, 17 Dec 2024 16:19:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] xen: add bitmap to indicate per-domain state
 changes
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241217142218.24129-1-jgross@suse.com>
 <20241217142218.24129-3-jgross@suse.com>
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
In-Reply-To: <20241217142218.24129-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2024 15:22, Juergen Gross wrote:
> Add a bitmap with one bit per possible domid indicating the respective
> domain has changed its state (created, deleted, dying, crashed,
> shutdown).
> 
> Registering the VIRQ_DOM_EXC event will result in setting the bits for
> all existing domains and resetting all other bits.
> 
> As the usage of this bitmap is tightly coupled with the VIRQ_DOM_EXC
> event, it is meant to be used only by a single consumer in the system,
> just like the VIRQ_DOM_EXC event.

I'm sorry, but I need to come back to this. I thought I had got convinced
that only a single entity in the system can bind this vIRQ. Yet upon
checking I can't seem to find what would guarantee this. In particular
binding a vIRQ doesn't involve any XSM check. Hence an unprivileged entity
could, on the assumption that the interested privileged entity (xenstore)
is already up and running, bind and unbind this vIRQ, just to have the
global map freed. What am I overlooking (which would likely want stating
here)?

> V5:
> - domain_init_states() may be called only if evtchn_bind_virq() has been
>   called validly (Jan Beulich)

I now recall why I had first suggested the placement later in the handling:
You're now doing the allocation with yet another lock held. It's likely not
the end of the world, but ...

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
> +    else
> +    {
> +        dom_state_changed = xvzalloc_array(unsigned long,
> +                                           BITS_TO_LONGS(DOMID_FIRST_RESERVED));

... already this alone wasn't nice, and could be avoided (by doing the
allocation prior to acquiring the lock, which of course complicates the
logic some).

What's perhaps less desirable is that ...

> @@ -494,6 +495,15 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
>          goto out;
>      }
>  
> +    if ( virq == VIRQ_DOM_EXC )
> +    {
> +        rc = domain_init_states();
> +        if ( rc )
> +            goto out;
> +
> +        deinit_if_err = true;
> +    }
> +
>      port = rc = evtchn_get_port(d, port);
>      if ( rc < 0 )
>      {

... the placement here additionally introduces lock nesting when really
the two locks shouldn't have any relationship.

How about giving domain_init_states() a boolean parameter, such that it
can be called twice, with the first invocation moved back up where it
was, and the second one put ...

> @@ -527,6 +537,9 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
>   out:
>      write_unlock(&d->event_lock);
>  
> +    if ( rc && deinit_if_err )
> +        domain_deinit_states();
> +
>      return rc;
>  }

... down here, not doing any allocation at all (only the clearing), and
hence eliminating the need to deal with its failure? (Alternatively
there could of course be a split into an init and a reset function.)

There of course is the chance of races with such an approach. I'd like
to note though that with the placement of the call in the hunk above
there's a minor race, too (against ...

> @@ -730,6 +743,9 @@ int evtchn_close(struct domain *d1, int port1, bool guest)
>          struct vcpu *v;
>          unsigned long flags;
>  
> +        if ( chn1->u.virq == VIRQ_DOM_EXC )
> +            domain_deinit_states();

... this and the same remote vCPU then immediately binding the vIRQ
again). Hence yet another alternative would appear to be to drop the
new global lock and use d->event_lock for synchronization instead
(provided - see above - that only a single entity can actually set up
all of this). That would pretty much want to have the allocation kept
with the lock already held (which isn't nice, but as said is perhaps
tolerable), but would at least eliminate the undesirable lock nesting.

Re-use of the domain's event lock is at least somewhat justified by
the bit array being tied to VIRQ_DOM_EXEC.

Thoughts?

Jan

