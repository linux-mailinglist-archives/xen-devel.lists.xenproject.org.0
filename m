Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMuzEuQUgmmZPAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 16:31:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE12DB4DE
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 16:31:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219332.1528214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnIMc-0000Ui-Vb; Tue, 03 Feb 2026 15:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219332.1528214; Tue, 03 Feb 2026 15:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnIMc-0000SG-SY; Tue, 03 Feb 2026 15:30:50 +0000
Received: by outflank-mailman (input) for mailman id 1219332;
 Tue, 03 Feb 2026 15:30:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnIMb-0000SA-LZ
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 15:30:49 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d428a12-0115-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 16:30:42 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4806b43beb6so42312435e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 07:30:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48305129419sm65703295e9.6.2026.02.03.07.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 07:30:41 -0800 (PST)
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
X-Inumbo-ID: 4d428a12-0115-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770132642; x=1770737442; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CjL/uXYvrrj2UB/EVk1KJUIPlCl9MwOSChFNACjBjfM=;
        b=AGMthqpBFMREo6UAbAauN73xm/M11JEEOD7Fqir2INqMckObHFStJWsw1E17XUc3B3
         ANBjcCKD60iDwuCflcKNfd35vn9aZ5vptxrQDG8hj4mBy4jJlkoUmoNKDl32X/9WfSq3
         73cDtUW7CuF4YFd77UW3BQBcH7YH48afctNibg3qHk5Nm3btn3+8OJkS7Jnwrd7CkcxQ
         G12GhFAjDujlGu9CF/v6GhMn295LbBtlduV8rRv0k+Y6a+hOpFi8WBOwRu+FrAROtH/M
         iOqRh291gAawTYI+JWfyNs7N7CRpnoNcjIEECC6vHYlzu8fPnCQ+mHA7GJ19X4ApCag6
         KWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770132642; x=1770737442;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjL/uXYvrrj2UB/EVk1KJUIPlCl9MwOSChFNACjBjfM=;
        b=H1pkbA+q0+34tuQYs2c1OiO1GzIN+/Fzip4jjxDUjWJ0wRLFL+Pm57QGAkUG6bS3Rn
         2L083AQuRGjUstzLofpMidqbOMGMWDAEKpRLFvCZoOGiuFgxhKRUL15s7EU2HzDyGh02
         CeHe27fB1ClMdwKpBKQ66CyrMCAiy9yykyVnvbe31WpLlj9wvZ0KtN42l2ZQyIYRJ3Fj
         Eb3KrbyE5eKH5+2TPgGWhp55Ew+UO783IUAaeB7hah0NOrvEtzE+4ahqYZEuH4dZOj5W
         MZwFv6qekVBXPNyCeVL42pL0X4VjKi4myDIuDwnF6mu7VHkaPLdWOh+ynQkqpYE6T7Ci
         o8Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXNLcCbmFwg/q7fR1PehIz9d/TZZMhoOVOS8LMKYEwxThwp66HRHnryb3lwVM1qRPVgiCvnY8b3fK8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7z+c4icHw00mK/+V1vM78neRc1ke5dcgR7fGZS5IWBzp2QqRQ
	CSiFx/8qvkUnsclb9JBCdocaujcGMip7PdsS4j2iow8bdjYO7tqAaSG+UrnouV2xhg==
X-Gm-Gg: AZuq6aKfdyO7h57w75D55n8XtwDdEYHmEjOztJ0lH9mR9R7P9dPsdFBh97SBZgRR8Qh
	yO2MCNPmDLDApZRz8QfZEPOVchk6PxwnWfHX/LG6zfoSmUN0eAiulahSYgr43am9pFvmEqL9R4I
	tExPrXcU33fU2xPypdT5dWFiGS4VqtcVrstTL0oKweXoLLKisbOMITtSU+pPpdFAa7YF3eVKdWS
	6fY/iFEClzESs6zBXJeVtDQAJ4NBpKsqGOvBSBA3V7sCJEl/rh5dcZ91Q43jtjJqcW7kzmYvYv9
	GZXIjHUduHnwpgQo1A/6G5MSQvoA0hHM/ztrjGNo3djAf7lXTewajpdCdmrEXq5UGDkTOE2bgzX
	V8zp9A5HMrphSOfgkYIdA8/3CdcqA4eln0xFX0fXlDnrlAB1+V23juRG5Cj39vsLOnPu5F2qlp9
	zmO3rastYkAxHcxoOYnNDD8hsYxymQHUBty909QXbW9Ab9EUNqMOFzxHQQ6vSr29hu/kOs7Bj92
	0IjzT85EbRkvw==
X-Received: by 2002:a05:600c:1e02:b0:47e:e87f:4bba with SMTP id 5b1f17b1804b1-4830e986031mr76045e9.29.1770132642249;
        Tue, 03 Feb 2026 07:30:42 -0800 (PST)
Message-ID: <0fc9a80a-8621-4ce4-b2f9-c102e975b05b@suse.com>
Date: Tue, 3 Feb 2026 16:30:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] xen/console: handle multiple domains using
 console_io hypercalls
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: grygorii_strashko@epam.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com,
 jason.andryuk@amd.com, victorm.lira@amd.com, andrew.cooper3@citrix.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2601291404410.2238666@ubuntu-linux-20-04-desktop>
 <20260129220858.2371938-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20260129220858.2371938-1-stefano.stabellini@amd.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9CE12DB4DE
X-Rspamd-Action: no action

On 29.01.2026 23:08, Stefano Stabellini wrote:
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -518,11 +518,16 @@ static unsigned int __read_mostly console_rx = 0;
>  struct domain *console_get_domain(void)
>  {
>      struct domain *d;
> +    unsigned int rx;
>  
> -    if ( console_rx == 0 )
> +    nrspin_lock(&console_lock);
> +    rx = console_rx;
> +    nrspin_unlock(&console_lock);

Did you test this in a debug build, and it didn't blow up? The console lock
is an IRQ-safe one, so I'd expect check_lock() to complain that you do not
disable IRQs here. At the same time I don't think you can rely on IRQs being
off upon entry into the function.

Anyway - is locking here really needed? Wouldn't suitable use of ACCESS_ONCE()
(also elsewhere) do? (Such a switchover likely could be a separate, prereq
patch.)

Further, if already you add locking on the read sides, what about ...

> @@ -540,6 +545,12 @@ void console_put_domain(struct domain *d)
>          rcu_unlock_domain(d);
>  }
>  
> +static bool is_focus_domain(const struct domain *d)
> +{
> +    ASSERT(rspin_is_locked(&console_lock));
> +    return d != NULL && d->domain_id == console_rx - 1;
> +}
> +
>  static void console_switch_input(void)
>  {
>      unsigned int next_rx = console_rx;

... this read?

> @@ -555,7 +566,10 @@ static void console_switch_input(void)
>  
>          if ( next_rx++ >= max_console_rx )
>          {
> +            nrspin_lock_irq(&console_lock);

As indicated earlier, you can't know IRQ state in anything down the call
tree from serial_rx().

> @@ -742,17 +765,36 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>          if ( copy_from_guest(kbuf, buffer, kcount) )
>              return -EFAULT;
>  
> -        if ( is_hardware_domain(cd) )
> +        /*
> +         * Take both cons->lock and console_lock:
> +         * - cons->lock protects cons->buf and cons->idx
> +         * - console_lock protects console_send() and is_focus_domain()
> +         *   checks
> +         *
> +         * The order must be respected. guest_printk() takes the
> +         * console_lock so it is important that cons->lock is taken
> +         * first.
> +         */
> +        spin_lock(&cons->lock);
> +        nrspin_lock_irq(&console_lock);

While guest_printk() does matter here, it taking (down the call tree)
console_lock isn't alone relevant. It being called with cons->lock held
is, .

> @@ -816,22 +857,39 @@ long do_console_io(
>              break;
>  
>          rc = 0;
> +        nrspin_lock_irq(&console_lock);
> +        if ( !is_focus_domain(current->domain) )
> +            count = 0;
>          while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
>          {
>              idx = SERIAL_RX_MASK(serial_rx_cons);
>              len = serial_rx_prod - serial_rx_cons;
> +            nrspin_unlock_irq(&console_lock);

Can we please have blank lines on both sides of this?

>              if ( (idx + len) > SERIAL_RX_SIZE )
>                  len = SERIAL_RX_SIZE - idx;
>              if ( (rc + len) > count )
>                  len = count - rc;
>              if ( copy_to_guest_offset(buffer, rc, &serial_rx_ring[idx], len) )

Have I perhaps talked you into moving the unlock too early? serial_rx_ring[]
accesses look like they need to be with the lock still held. Or, to avoid
calling copy_to_guest_offset() with the lock held, a local copy would need
making.

Jan

