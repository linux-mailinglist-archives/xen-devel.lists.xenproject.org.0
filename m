Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UI/pJ8grcmmadwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 14:53:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FAC6791D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 14:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211047.1522591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viv6z-0006SY-0n; Thu, 22 Jan 2026 13:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211047.1522591; Thu, 22 Jan 2026 13:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viv6y-0006RR-U4; Thu, 22 Jan 2026 13:52:36 +0000
Received: by outflank-mailman (input) for mailman id 1211047;
 Thu, 22 Jan 2026 13:52:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viv6x-0006Qv-19
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 13:52:35 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94d52166-f799-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 14:52:25 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-432d2c96215so832248f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 05:52:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996dad0sm46002480f8f.27.2026.01.22.05.52.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 05:52:23 -0800 (PST)
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
X-Inumbo-ID: 94d52166-f799-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769089944; x=1769694744; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RzZ1gMh2XpKN7+QP8m00bK0rxa+qAEBlf8BXdkoaeag=;
        b=Ldv45Dqge3GgSsbdiLZ5djwEJtpQLtGjImu+WaVp79e5hh0VW02zHamV9+FxqDMiq3
         gyezSchiR4uuc0NsYwU7RqfTVMky5yZwjLV7Z2JaV58/3J1g2HvMoTes3R+xg+mX7pzm
         YxNvGpxHVmHziWq51UMvWta+jyDEq5mRC8iFgKWBLbdqgv7LkeR260NN0Qh5HlWoJHRM
         2AcYsLJ7dDNF/pOIfNk3Oh+56yFWvIZ4sHQnKEPnNqvlfjw+i9C4Pn2SnnaYIIwLWyxo
         AWjZveGoiFCpAVaVoY4l3ekSrl7VmJcLUe8mc8r/jSvw2XeSvEggkGpC0fboq8XqvZ1H
         kR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769089944; x=1769694744;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzZ1gMh2XpKN7+QP8m00bK0rxa+qAEBlf8BXdkoaeag=;
        b=b20i4nTr5JY2Kg+HlqId824lerpaiBsru8L1+B7VmsCIEqhwCPfvpw1f399b16GpWD
         W/tcVjeE9aUF7BCeYoAqEmduayKPSgKGYjhRPFxeyVEabV9uZrugzRz+AUcZI2nNK2Dv
         MdidZMuXxambGoU9C5q4hAnGiuE4GZruU4vUKqZ56a6PRRKRec/BFdqvTEj4sawuO6Oa
         x6Mo6IqoESHl0K5u1s/HKk+cqUQfzrL7YrZkHk/4w51KZiv7EMXsrlIDhjWqLLJoFxpe
         g5BrCet5YOtqFwznmP3FXrpSfJp1dGoHKGvpl8Y7NCwTAjsRW7S0LKoOAftCaltiS7kA
         lmig==
X-Forwarded-Encrypted: i=1; AJvYcCVAk/pa6C5EhVKCUUx9J7zjSj5GxsGsTOd4Mkj2gQAT36RmaYq+j7j700l6SlXxU+jjh7wBddoeD44=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIer+vVBKdoRc9Co+u1VZ8SdZjKqKpafEzU8asN9bLqmoQR6cZ
	XdqIn9Oa5sRTHcrE2D2Aqq12hw/D6aYWwr9VivNSnow5qWdymwewTdfBrnzMOQQmMw==
X-Gm-Gg: AZuq6aLwFCe3xivZ3g0kMWs6I3AHRHdCOFHNQ7sTWHUnKW0YgeCKV+49ZIp1Y+m20k7
	EGywfnjKATp4CDu87mAL8b7WabQWvyCGPwUqMdVJK6Pd5ti1+i8ebZN2dr18E9iueYwvTFurJqS
	YgYIw/QBes1id6Z4A4hYlhOLacDixWy8WSTat2TXzSY3JstagsRsCRWgdcfrjXpipHeCJ863GS5
	UC9nJ5KMXduHOdEnSS5kmeeebW79h8IHTahlpg3zri4vmwT+SlLr4YAk6RPlAGOGJCc0avvZzUU
	Ue89pyOSlxjIBh0VTOyeO0mXHs6dtBPXPk4qbZq2HNzDDNJnGPKrkVE+ur4k+f7xQ1uvw4EkIyr
	Jsk0h/LsMFSCzP/bKpxRccwhY4Ayrp9Cm2c9++qPx72J4xTSf78ZRvqT+75Rteds06pY+DRCkRz
	ZwQVmCa6gNY3sXAkGNb09anOKxz1iUa4g1xmelF5LaTjEOcNpFlInFwPwGST1tApFGbQgxb9ylW
	Zs=
X-Received: by 2002:a5d:588a:0:b0:431:62:d946 with SMTP id ffacd0b85a97d-43569999473mr32504416f8f.23.1769089944119;
        Thu, 22 Jan 2026 05:52:24 -0800 (PST)
Message-ID: <912ff342-f5aa-44fa-8a91-43be4363776e@suse.com>
Date: Thu, 22 Jan 2026 14:52:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] xen/console: handle multiple domains using console_io
 hypercalls
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: grygorii_strashko@epam.com, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2601211733070.7192@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2601211733070.7192@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 13FAC6791D
X-Rspamd-Action: no action

On 22.01.2026 02:34, Stefano Stabellini wrote:
> Allow multiple dom0less domains to use the console_io hypercalls to
> print to the console. Handle them in a similar way to vpl011: only the
> domain which has focus can read from the console. All domains can write
> to the console but the ones without focus have a prefix. In this case
> the prefix is applied by using guest_printk instead of printk or
> console_puts which is what the original code was already doing.
> 
> When switching focus using Ctrl-AAA, discard any unread data in the
> input buffer. Input is read quickly and the user would be aware of it
> being slow or stuck as they use Ctrl-AAA to switch focus domain.
> In that situation, it is to be expected that the unread input is lost.
> 
> The domain writes are buffered when the domain is not in focus. Push out
> the buffer after the domain enters focus on the first guest write.
> 
> Move the vpl011 check first so that if vpl011 is enabled, it will be
> used. In the future, the is_hardware_domain path might also be used by
> other predefined domains so it makes sense to prioritize vpl011 to
> retain the current behavior on ARM.

As indicated elsewhere already, I think this wants moving out of here.
A question is going to be whether the consoled part then also wants
moving ahead (albeit I fear for now I don't really understand the need
for this movement, seeing that the is_hardware_domain() check there
remains as is).

> Locking updates:
> 
> - Guard every mutation of serial_rx_cons/prod with console_lock and
> discard unread input under the lock when switching focus (including when
> returning to Xen) so that cross-domain reads can't see stale data
> 
> - Require is_focus_domain() callers to hold console_lock, and take that
> lock around the entire CONSOLEIO_read loop, re-checking focus after each
> chunk so a focus change simply stops further copies without duplicating
> or leaking input

Shouldn't this then ...

> - Hold cd->pbuf_lock while flushing buffered writes in the focus path
> so the direct-write fast path does not race buffered guests or HVM
> debug output

(What's ->pbuf_lock again?)

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -540,6 +540,11 @@ void console_put_domain(struct domain *d)
>          rcu_unlock_domain(d);
>  }
>  
> +static bool is_focus_domain(struct domain *d)
> +{
> +    return d != NULL && d->domain_id == console_rx - 1;
> +}

... be expressed in a comment here as well (or even an assertion)?

Also please make the function parameter pointer-to-const.

> @@ -599,14 +611,25 @@ static void __serial_rx(char c)
>      if ( !d )
>          return;
>  
> +#ifdef CONFIG_SBSA_VUART_CONSOLE
> +    /* Prioritize vpl011 if enabled for this domain */
> +    if ( d->arch.vpl011.base_addr )
> +    {
> +        /* Deliver input to the emulated UART. */
> +        rc = vpl011_rx_char_xen(d, c);
> +    }
> +    else
> +#endif
>      if ( is_hardware_domain(d) )
>      {
>          /*
>           * Deliver input to the hardware domain buffer, unless it is
>           * already full.
>           */
> +        nrspin_lock_irq(&console_lock);
>          if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
>              serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;
> +        nrspin_unlock_irq(&console_lock);

Hmm, now that there's more context here: The comment looks to still be
correct as per the enclosing if(), but how does that fit with the purpose
of this patch? Isn't it part of the goal to allow input to non-hwdom as
well?

> @@ -742,18 +761,25 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>          if ( copy_from_guest(kbuf, buffer, kcount) )
>              return -EFAULT;
>  
> -        if ( is_hardware_domain(cd) )
> +        spin_lock(&cons->lock);
> +        nrspin_lock_irq(&console_lock);

This double lock (and the need for this specific order) might better be
commented upon, too.

> +        if ( is_focus_domain(cd) )
>          {
> +            if ( cons->idx )
> +            {
> +                console_send(cons->buf, cons->idx, flags);
> +                cons->idx = 0;
> +            }
>              /* Use direct console output as it could be interactive */
> -            nrspin_lock_irq(&console_lock);
>              console_send(kbuf, kcount, flags);
>              nrspin_unlock_irq(&console_lock);
> +            spin_unlock(&cons->lock);

Why is it that this lock can be dropped only here? It's not needed anymore
past the if()'s body?

>          }
>          else
>          {
>              char *kin = kbuf, *kout = kbuf, c;
> -            struct domain_console *cons = cd->console;
>  
> +            nrspin_unlock_irq(&console_lock);
>              /* Strip non-printable characters */

Blank line between these?

> @@ -824,14 +856,16 @@ long do_console_io(
>                  len = SERIAL_RX_SIZE - idx;
>              if ( (rc + len) > count )
>                  len = count - rc;
> +            nrspin_unlock_irq(&console_lock);
>              if ( copy_to_guest_offset(buffer, rc, &serial_rx_ring[idx], len) )
> -            {
> -                rc = -EFAULT;
> -                break;
> -            }
> +                return -EFAULT;
>              rc += len;
> +            nrspin_lock_irq(&console_lock);
> +            if ( !is_focus_domain(current->domain) )
> +                break;
>              serial_rx_cons += len;

The placement of the check between both updates wants commenting upon, imo.
Another blank line or two would also help, I think.

>          }
> +        nrspin_unlock_irq(&console_lock);
>          break;
>      default:
>          rc = -ENOSYS;

Much better locking-wise here than in the earlier version.

Jan

