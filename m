Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KM7kM10HemlE1gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 13:55:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B4A1A8D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 13:55:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215657.1525794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl55B-0001yO-F5; Wed, 28 Jan 2026 12:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215657.1525794; Wed, 28 Jan 2026 12:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl55B-0001vS-CA; Wed, 28 Jan 2026 12:55:41 +0000
Received: by outflank-mailman (input) for mailman id 1215657;
 Wed, 28 Jan 2026 12:55:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3VuQ=AB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vl55A-0001vK-69
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 12:55:40 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0f1f4e4-fc48-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 13:55:31 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4327790c4e9so4458443f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 04:55:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1354205sm6995055f8f.41.2026.01.28.04.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 04:55:30 -0800 (PST)
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
X-Inumbo-ID: a0f1f4e4-fc48-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769604931; x=1770209731; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h74UoF0SijPHnORtEHxcuIiFSQ9TsSqqGD9YLiB94jM=;
        b=M+ye61hsOg3jR8dH1JbzuRxrj3PTPpQpmJSoAwJiq9ZorhgFaSAKMX+OUyoc7jsCyw
         7nY4bEiVA/Q+/rn8Lwq2pIJAuIye/cffwbU+rzzRdww4brddomvTxFj4wblvwyWrozvA
         S5lZPEGKZ7u8Z+wo39TXvULWkNbExkvLMuOjXGI5BnKXHLzwlCl7NFRuhDPb6BeH6LQe
         3zHRNbnxpEdZhS+y2y1lf/w8kTWyO76UNfSgkQTWiFSRzdsgeOiXKGmT0C+ZkBsHUSoC
         NoOXL5MpC4S7d3j/MBMfXJ9R0lG9aAVmWDv76/norotVis728rEKTO7NFFkH6hwttJRe
         S+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769604931; x=1770209731;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h74UoF0SijPHnORtEHxcuIiFSQ9TsSqqGD9YLiB94jM=;
        b=RLnKCyxsH2ChHXOQQtvha1A0OpN8E4Q/nBetvPxvMIuxUruXDHrdQoq3c5fSPGC2is
         zzkPBIm8l5vs2MkZsdtVt1plsoGhloCkFiTg4qSyFar8Cv2G88YKn0geZMO0SjUVuPUc
         jBjIHa/6sNQ1p7XDMdWtGAnIIam4J3D0rTx+IhuAGvM/jaVEqEFiPRTe1N2SLOkCTkpJ
         DOBa8jP0jyFEVYEICJHyLDwKbgWx2sg9ybdwYLVe2aQfntu2xS0vxGu2TjeEZJxTa5of
         g1Fg19VCyn01n1+YZuhXOkxdC89+usqMozs+nrlMUEhptOrGEvRzDjKeufPDXYgoGx0y
         HySQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWoUemjsR/KKeCSsA1uOJFFqwmLS0xI2WQt5ytY2tiLjp1USSc1FquaLu0BJ8qg5v4+hW149jAOTE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyW/CTvH6pCrG3qeZdkvJG5oovjvyvarq+/al992/7W0qjiyurK
	N7f8/x4ttUV2UotDF5T8x3vJDDsWUQvFOEaDz1p2ZGqXFXHjz+SR1vsSh2RYm5J3HA==
X-Gm-Gg: AZuq6aJw/RXXn7z8I5bZRHvZr8uXl//zJ/8mfNbYJP+1zm7sxyCw6d+mBpdPEVE8qoV
	sYJCIHDraay3i5b8fpLrNqqUztxSuTHXTfmRvN0LboMROX1LFR3nlkA9ZWv/ET9TPflepJqtwbH
	mHUbj7r9JWB9HxEzx9Kop2T9B7v+XwxVB9lCXYeaohjLEZ0Fl3ErZvRwGMRtpfd7a2cuO3+4By6
	b/1IOHFiV0U/i5MO+QTPRVySXdfT8dw+TlH7K4sxd0yXaAKgyW3m4iwqJDUPhwSueE6RMyAYCiJ
	2/IeOGHzDgiklwqCCoCtn50ZFRGx1Hv6CXItr2oqOtXILTRXWpq0cdAMJGyDzLcMUZ0T/IL3+BE
	LQWM8FS1O9Nn2++V6EHfnlWqPmg11FrG9glEeRz3qezPknleQLL7lk2j5wmB8IAAMPk7lS7BA1X
	EJYYPhGslEVEZTeDwBxT9BrLVw+tRSI6hPfr9JLugwsZoRWsSvNV57Rbg46ODO1BT7yqLLLAQu2
	YI=
X-Received: by 2002:a05:6000:40cd:b0:435:91b8:e01b with SMTP id ffacd0b85a97d-435dd1cd103mr7866643f8f.45.1769604931153;
        Wed, 28 Jan 2026 04:55:31 -0800 (PST)
Message-ID: <ebc50459-b6f8-4827-b326-edda5f0f67d7@suse.com>
Date: Wed, 28 Jan 2026 13:55:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] xen/console: handle multiple domains using
 console_io hypercalls
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: grygorii_strashko@epam.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com,
 jason.andryuk@amd.com, victorm.lira@amd.com, andrew.cooper3@citrix.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <alpine.DEB.2.22.394.2601221704110.7192@ubuntu-linux-20-04-desktop>
 <20260123010640.1194863-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20260123010640.1194863-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E34B4A1A8D
X-Rspamd-Action: no action

On 23.01.2026 02:06, Stefano Stabellini wrote:
> @@ -555,8 +561,11 @@ static void console_switch_input(void)
>  
>          if ( next_rx++ >= max_console_rx )
>          {
> -            console_rx = 0;
>              printk("*** Serial input to Xen");
> +            nrspin_lock_irq(&console_lock);
> +            console_rx = 0;
> +            serial_rx_cons = serial_rx_prod;
> +            nrspin_unlock_irq(&console_lock);
>              break;
>          }
>  
> @@ -575,8 +584,12 @@ static void console_switch_input(void)
>  
>              rcu_unlock_domain(d);
>  
> -            console_rx = next_rx;
>              printk("*** Serial input to DOM%u", domid);
> +            nrspin_lock_irq(&console_lock);
> +            console_rx = next_rx;
> +            /* Don't let the next dom read the previous dom's unread data. */
> +            serial_rx_cons = serial_rx_prod;
> +            nrspin_unlock_irq(&console_lock);
>              break;
>          }

As in both cases you're also moving console_rx updates into the locked
region, what about readers of the variable, first and foremost
console_get_domain()? Else why the movement?

Also I think that the printk()s would better be last, indicating the
completion of the switching.

> @@ -605,8 +618,10 @@ static void __serial_rx(char c)
>           * Deliver input to the hardware domain buffer, unless it is
>           * already full.
>           */

This comment goes stale with the buffer being used for whichever is the
focus domain in do_console_io().

> +        nrspin_lock_irq(&console_lock);
>          if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
>              serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;
> +        nrspin_unlock_irq(&console_lock);

I don't think you can unconditionally enable interrupts here, as this may
be running in the context of an IRQ handler.

> @@ -742,17 +758,36 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>          if ( copy_from_guest(kbuf, buffer, kcount) )
>              return -EFAULT;
>  
> -        if ( is_hardware_domain(cd) )
> +        /*
> +         * Take both cons->lock and console_lock:
> +         * - cons->lock protects cons->buf and cons->idx
> +         * - console_lock protects console_send and is_focus_domain
> +         *   checks
> +         *
> +         * The order must be respected. guest_printk takes the
> +         * console_lock so it is important that cons->lock is taken
> +         * first.
> +         */
> +        spin_lock(&cons->lock);
> +        nrspin_lock_irq(&console_lock);
> +        if ( is_focus_domain(cd) )

Why would any of the domains possibly being permitted to be "focus" suddenly
gain direct access here? Full access in do_console_io() is still prevented by
the XSM check there, afaict. Cc-ing Daniel, as it's not quite clear to me
whether to introduce another XSM check here, whether to check ->is_console
directly, or yet something else.

>          {
> +            if ( cons->idx )
> +            {
> +                console_send(cons->buf, cons->idx, flags);
> +                cons->idx = 0;
> +            }
> +            spin_unlock(&cons->lock);
> +
>              /* Use direct console output as it could be interactive */
> -            nrspin_lock_irq(&console_lock);
>              console_send(kbuf, kcount, flags);
>              nrspin_unlock_irq(&console_lock);
>          }
>          else
>          {
>              char *kin = kbuf, *kout = kbuf, c;
> -            struct domain_console *cons = cd->console;
> +
> +            nrspin_unlock_irq(&console_lock);
>  
>              /* Strip non-printable characters */
>              do
> @@ -765,7 +800,6 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>              } while ( --kcount > 0 );
>  
>              *kout = '\0';
> -            spin_lock(&cons->lock);
>              kcount = kin - kbuf;
>              if ( c != '\n' &&
>                   (cons->idx + (kout - kbuf) < (ARRAY_SIZE(cons->buf) - 1)) )
> @@ -815,6 +849,13 @@ long do_console_io(
>          if ( count > INT_MAX )
>              break;
>  
> +        nrspin_lock_irq(&console_lock);
> +        if ( !is_focus_domain(current->domain) )
> +        {
> +            nrspin_unlock_irq(&console_lock);
> +            return 0;
> +        }

To avoid the extra unlock-and-return, how about simply setting "count" to 0,
leveraging ...

>          rc = 0;
>          while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )

... the rhs check here?

> @@ -824,14 +865,28 @@ long do_console_io(
>                  len = SERIAL_RX_SIZE - idx;
>              if ( (rc + len) > count )
>                  len = count - rc;
> +            nrspin_unlock_irq(&console_lock);

This can be moved up a few lines, as none of the local variable manipulations
needs guarding.

>              if ( copy_to_guest_offset(buffer, rc, &serial_rx_ring[idx], len) )
> -            {
> -                rc = -EFAULT;
> -                break;
> -            }
> +                return -EFAULT;
>              rc += len;
> +
> +            /*
> +             * First get console_lock again, then check is_focus_domain.
> +             * It is possible that we switched focus domain during
> +             * copy_to_guest_offset. In that case, serial_rx_cons and

Please can you append () to the function name, to identify it as a function,
as opposed to ...

> +             * serial_rx_prod have been reset so it would be wrong to
> +             * update serial_rx_cons here. Get out of the loop instead.

... the two variables referenced here?

Jan

