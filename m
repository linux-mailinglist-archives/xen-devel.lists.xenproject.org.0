Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC71E903CF7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 15:18:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738391.1145149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH1OX-0000h2-0g; Tue, 11 Jun 2024 13:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738391.1145149; Tue, 11 Jun 2024 13:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH1OW-0000fW-Te; Tue, 11 Jun 2024 13:18:36 +0000
Received: by outflank-mailman (input) for mailman id 738391;
 Tue, 11 Jun 2024 13:18:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBrw=NN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sH1OV-0000eA-PZ
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 13:18:35 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1af8c2f8-27f5-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 15:18:34 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57c923e03caso1145275a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 06:18:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f41f2d977sm1276666b.63.2024.06.11.06.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 06:18:33 -0700 (PDT)
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
X-Inumbo-ID: 1af8c2f8-27f5-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718111914; x=1718716714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gnsPBQ1vM10yGOfinRQ/JgtIP/sICTCtWS64KPKg+9Y=;
        b=FDXcCAnQWrEw0ha5+/5X58db6YhV7UoodEj/u3zhE6kHg4Y0lBOou0D7F4SKr6so6I
         wjH90IzNPOV+ujBoILEXJ46b/KXz4QFS0OJSkhxFrVZHf69757NZVLs8vVqJd9s6asdX
         JAFl/QvqactFwL4wc8s60Fg6pHXJA+soMs+uwkx+PWDJvQ+wS9MFQSaHLRbvlEs4skGt
         runHpEwd6bwOlN6q/Hw+Y1OYJwIpPXnCUm+4rQKdZ+A+iLp0ZmpOL+Ys2Atp8+yloiWC
         EenIgODqVSWfxwfrPsGkbdVa3aEv2ON5tf8ZsOeSY69smpJ51KFrEZovkn+6M+AVuoUA
         DhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718111914; x=1718716714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnsPBQ1vM10yGOfinRQ/JgtIP/sICTCtWS64KPKg+9Y=;
        b=A5wptXRikg6t1ZYWw4g585CIEnGubJKaL9xpPq842N2VB0DZ+NKdy71R5R+ylBD9Si
         KZc+yWPfWhnIwGiqr6dxVjMx5wy7fvqiMfj2Jg596Bs9cM40hbKI68wso+e8MkwRgtmR
         bAesb0XX9nxltifr2K4mOx0+fRss8rSK6jNzlZYjrN7ZeQSHA39PMnZgwDdeTmpF+vsb
         PBzvxkBelxs59hlFwqA6cJIo4qntHZRA8VJooYU5J7xu+NFxn6HVl88vXvHx7WBF5D1s
         i2Yvnz0x7jP8DVVWYJOFrhFK1kB0Hvwadwe/yALcfi56NFno7twtLSBrH3v2r9XHareh
         xSUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1TxPSnILSIt5+EiL52Dj63YTSBB8DytMCsyNfKoHtMO5LoxFh206cIPPnqEuLbgVWRL7IiE1DdfUo3TgS9U6zl/Rst6mRQaVxDn0+z6M=
X-Gm-Message-State: AOJu0YzyGv4xKxdoypXASYG0uC9F7+gvEkkKkS9I0O7k4hKVw1wqPh0o
	+90oXB31kDoXM/5F7enF+u0By6ZWmkE+gttHBXOoI0zW91vBt4ATLE2hQtgmJw==
X-Google-Smtp-Source: AGHT+IHkAhtTh32yhQHhj5vGsJozE8/gQUpcBS5DNqVfciFzfp+hXVyIIGMmylrFoI+QivFuCfsMkA==
X-Received: by 2002:a17:906:eea:b0:a62:fc9d:6fec with SMTP id a640c23a62f3a-a6cd74bf905mr723568266b.34.1718111914024;
        Tue, 11 Jun 2024 06:18:34 -0700 (PDT)
Message-ID: <9de1a9c7-814c-4375-9182-90a2f04806b2@suse.com>
Date: Tue, 11 Jun 2024 15:18:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] x86/irq: handle moving interrupts in
 _assign_irq_vector()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-7-roger.pau@citrix.com>
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
In-Reply-To: <20240610142043.11924-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2024 16:20, Roger Pau Monne wrote:
> Currently there's logic in fixup_irqs() that attempts to prevent
> _assign_irq_vector() from failing, as fixup_irqs() is required to evacuate all
> interrupts from the CPUs not present in the input mask.  The current logic in
> fixup_irqs() is incomplete, as it doesn't deal with interrupts that have
> move_cleanup_count > 0 and a non-empty ->arch.old_cpu_mask field.
> 
> Instead of attempting to fixup the interrupt descriptor in fixup_irqs() so that
> _assign_irq_vector() cannot fail, introduce logic in _assign_irq_vector()
> to deal with interrupts that have either move_{in_progress,cleanup_count} set
> and no remaining online CPUs in ->arch.cpu_mask.
> 
> If _assign_irq_vector() is requested to move an interrupt in the state
> described above, first attempt to see if ->arch.old_cpu_mask contains any valid
> CPUs that could be used as fallback, and if that's the case do move the
> interrupt back to the previous destination.  Note this is easier because the
> vector hasn't been released yet, so there's no need to allocate and setup a new
> vector on the destination.
> 
> Due to the logic in fixup_irqs() that clears offline CPUs from
> ->arch.old_cpu_mask (and releases the old vector if the mask becomes empty) it
> shouldn't be possible to get into _assign_irq_vector() with
> ->arch.move_{in_progress,cleanup_count} set but no online CPUs in
> ->arch.old_cpu_mask.
> 
> However if ->arch.move_{in_progress,cleanup_count} is set and the interrupt has
> also changed affinity, it's possible the members of ->arch.old_cpu_mask are no
> longer part of the affinity set,

I'm having trouble relating this (->arch.old_cpu_mask related) to ...

> move the interrupt to a different CPU part of
> the provided mask

... this (->arch.cpu_mask related).

> and keep the current ->arch.old_{cpu_mask,vector} for the
> pending interrupt movement to be completed.

Right, that's to clean up state from before the initial move. What isn't
clear to me is what's to happen with the state of the intermediate
placement. Description and code changes leave me with the impression that
it's okay to simply abandon, without any cleanup, yet I can't quite figure
why that would be an okay thing to do.

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -544,7 +544,53 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
>      }
>  
>      if ( desc->arch.move_in_progress || desc->arch.move_cleanup_count )
> -        return -EAGAIN;
> +    {
> +        /*
> +         * If the current destination is online refuse to shuffle.  Retry after
> +         * the in-progress movement has finished.
> +         */
> +        if ( cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map) )
> +            return -EAGAIN;
> +
> +        /*
> +         * Due to the logic in fixup_irqs() that clears offlined CPUs from
> +         * ->arch.old_cpu_mask it shouldn't be possible to get here with
> +         * ->arch.move_{in_progress,cleanup_count} set and no online CPUs in
> +         * ->arch.old_cpu_mask.
> +         */
> +        ASSERT(valid_irq_vector(desc->arch.old_vector));
> +        ASSERT(cpumask_intersects(desc->arch.old_cpu_mask, &cpu_online_map));
> +
> +        if ( cpumask_intersects(desc->arch.old_cpu_mask, mask) )
> +        {
> +            /*
> +             * Fallback to the old destination if moving is in progress and the
> +             * current destination is to be offlined.  This is only possible if
> +             * the CPUs in old_cpu_mask intersect with the affinity mask passed
> +             * in the 'mask' parameter.
> +             */
> +            desc->arch.vector = desc->arch.old_vector;
> +            cpumask_and(desc->arch.cpu_mask, desc->arch.old_cpu_mask, mask);
> +
> +            /* Undo any possibly done cleanup. */
> +            for_each_cpu(cpu, desc->arch.cpu_mask)
> +                per_cpu(vector_irq, cpu)[desc->arch.vector] = irq;
> +
> +            /* Cancel the pending move. */
> +            desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
> +            cpumask_clear(desc->arch.old_cpu_mask);
> +            desc->arch.move_in_progress = 0;
> +            desc->arch.move_cleanup_count = 0;
> +
> +            return 0;
> +        }

In how far is this guaranteed to respect the (new) affinity that was set,
presumably having led to the movement in the first place?

> @@ -600,7 +646,17 @@ next:
>          current_vector = vector;
>          current_offset = offset;
>  
> -        if ( valid_irq_vector(old_vector) )
> +        if ( desc->arch.move_in_progress || desc->arch.move_cleanup_count )
> +        {
> +            ASSERT(!cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map));
> +            /*
> +             * Special case when evacuating an interrupt from a CPU to be
> +             * offlined and the interrupt was already in the process of being
> +             * moved.  Leave ->arch.old_{vector,cpu_mask} as-is and just
> +             * replace ->arch.{cpu_mask,vector} with the new destination.
> +             */

And where's the cleaning up of ->arch.old_* going to be taken care of then?

Jan

