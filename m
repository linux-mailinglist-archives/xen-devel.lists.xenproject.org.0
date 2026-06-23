Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xwaeBreNOmpT/wcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 15:44:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B216B78E5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 15:44:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="GAzu/iFK";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344290.1603388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc1QA-0002bL-8k; Tue, 23 Jun 2026 13:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344290.1603388; Tue, 23 Jun 2026 13:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc1QA-0002Yt-65; Tue, 23 Jun 2026 13:44:10 +0000
Received: by outflank-mailman (input) for mailman id 1344290;
 Tue, 23 Jun 2026 13:44:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wc1Q8-0002Yn-R5
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 13:44:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc1Q8-00DqQS-7g
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 15:44:08 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a8d7f-e002-0a2a0a5209dd-0a2a450ca6a4-44
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 15:44:08 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a8da7-94a4-0a2a450c0019-d155802eb46b-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 15:44:08 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso80532785e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 06:44:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49245711032sm357904215e9.0.2026.06.23.06.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 06:44:07 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782222247; x=1782827047; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ifw6QiNsSRsBl1TEnQfwJU2LTBI5TLAHyq6mJ2VqelY=;
        b=GAzu/iFKKzY9V4NghU1MuJX6uv6Uk/KxwzqEbRl66c4fRO9sVPPag4DCo3mWkXaFLC
         xI4hLKJkrUKyMOaaDZ9VXVfDEwALUS/oiHgtgwyeY7BkAcg9zprP3sE2ZqhBQpxn+gHg
         o6sh3we2mQVe+/ZF1utaVWOpzERRdBPKQKGJW+WmDr3Lxu/3Xayz4c8+MMq/UKboTBNS
         Ax+5t8thvvq19skL1QGTWyxvzAVQzjWW2Ivo9/7H09L07ihV7R7XKnn3StMeD8pfFu4m
         fIqf3cO5M/l6GGe4BmD9SSFDt5YCKKPuu+51YE5twsoX49TL48TWRpA1pYriKAkFK1zF
         zZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782222247; x=1782827047;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ifw6QiNsSRsBl1TEnQfwJU2LTBI5TLAHyq6mJ2VqelY=;
        b=IWb9cgDTNqJ/UDOoY8hfM5ZkVvDSBc1NQTwNjeKtS43bm2eGfKVGfMwTke4Jtw9cf/
         jOccRP9J70YMV5sdBwZWZkzTJlrNn3LiHDynMYmi4n0FlY7Vhf6Z9aDAx2CG1SnFPDoh
         NhZFxRkrfcvtaYGa7EVDSThgnAhrh+8LpCMzHMyhQQ3q7EKNafXDsHsfdVvlrBi+1bvA
         hRmvmsxqnkUJRekVaOQukDQsG7hLBZNPhQrA/o9gi2bdtbmILZ1hXOw2ShXUycLiYmlH
         9uKV95krd/aCQndKRJ98oOCOTnHuMuf+ueZ4qo5xnigTopm5LW3FAoioY39Wlw5vfoLw
         U5hQ==
X-Forwarded-Encrypted: i=1; AFNElJ92YLsm5v60zqZLvjB5TZbU2FUV3463GRAJA2bJHz8rsyBcG82McmaZjTX9fniLDb5NcAEw96IJnr4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0BDNOLvfXpdtkbYsAJLi7cxsYfGllHz2JRMWEqVkK9Lm2ky0D
	72n65Vi4x3qvQcMpiso3Rg4PlM+LE+puVJEbiilhQuKWGuXonqTsHUkjerftQe0l3Q==
X-Gm-Gg: AfdE7cl6N5/k0k/DFhYa83xktYsBq92R/xL+QDul0zbm6DBGWUnncKeQeDZlr5+DPf7
	KRCyM9iIuX6N2adeV2GjVF1oYg02a//0PTO7626sYuAMiRGzPtPEzhCRRjQvyDNLwjzNVKjoSQw
	3FYiDAMLjjo1Cp7nZdRuthldty+CQl+z93l2JTTKHROTaCjFvcRUho3hWoei/KxGSQQv0OT0VXD
	HNNvBt2A6sH/yxXKlVpb4KFqhQIH+TDcPDhNmoUBnR/DfNxs1B3BrKkCKYsk0gBY+iGTTbsM6C1
	lJcMaD346XwbGgaVEYxq8qtxdFUjeNhP/ANKgvt/y0j9JP2lEFfcLFzoMDYuvhrsXKT5IKvRqLx
	G8R4dRog9hWdKPxH8FnJYp5o4c3fm8shNjlMJD1j8pmQnVLyJYZ/iHC30qR8DD+8G7w039k829w
	5uJxH0IwBZam0gCt+j4h4OeDAy22waQDZ3zu8hI6Wn1EnnRjrbIaOd/XL/pcnAp0i9x69bnvG2p
	jmy
X-Received: by 2002:a05:600c:6091:b0:492:418b:b5e1 with SMTP id 5b1f17b1804b1-4925b392676mr39007765e9.37.1782222247509;
        Tue, 23 Jun 2026 06:44:07 -0700 (PDT)
Message-ID: <06c8caab-4722-4b02-991f-bdc4a4ac0ea6@suse.com>
Date: Tue, 23 Jun 2026 15:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] char/ns16550: bound execution time of
 ns16550_interrupt()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260623103145.76383-1-roger.pau@citrix.com>
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
In-Reply-To: <20260623103145.76383-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1782222248-04FD8ABF-4D3B49B5/0/0
X-purgate-type: clean
X-purgate-size: 3834
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70B216B78E5

On 23.06.2026 12:31, Roger Pau Monne wrote:
> The current logic in ns16550_interrupt() will loop until the device sets
> the NOINT in IIR.  At least on the Lenovo ThinkSystem SR630 V4 the flow
> control of the serial-over-lan emulated UART seems to be broken, as it
> doesn't set the NOINT bit consistently.  The Transmitter Holding Register
> Empty in LSR also seems to not be properly signaled, as even with it set
> writes to the transmit register take ~6ms.  This leads to the watchdog
> triggering very easily on such system.
> 
> Introduce an upper bound on the execution time of ns16550_interrupt(), this
> is currently set as 4x the polling interval, which is calculated as the
> time to fill RX FIFO and/or empty TX FIFO.  The current maximum is 5ms.
> Once the timeout triggers the interrupt is disabled and the uart is
> switched to polling mode.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> There's a possible alternative approach to solve this by moving the actual
> interrupt processing to a softirq tasklet and disabling the interrupt
> source until the processing is done, likely unifying the logic with the
> timer task.  However that's a bigger change, and too risky for 4.22 at this
> point.

+1

> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -62,6 +62,7 @@ static struct ns16550 {
>  #endif
>      unsigned int timeout_ms;
>      bool intr_works;
> +    bool force_polling;
>      bool dw_usr_bsy;
>  #ifdef NS16550_PCI
>      /* PCI card parameters. */
> @@ -190,12 +191,41 @@ static void cf_check ns16550_interrupt(int irq, void *dev_id)
>  {
>      struct serial_port *port = dev_id;
>      struct ns16550 *uart = port->uart;
> +    /* Set quite arbitrarily as 4x the time to drain the TX or fill RX FIFOs. */

Nit: I'd drop the latter of the two "the".

> +    const s_time_t timeout = NOW() + min(MILLISECS(uart->timeout_ms * 4),
> +                                         MILLISECS(5));

MILLISECS(min(uart->timeout_ms * 4, 5U)) ?

> +    if ( uart->force_polling )
> +        return;

As the IRQ was disabled, is this even possible? I.e. should this be some
kind of assertion or alike?

>      uart->intr_works = 1;
>  
>      while ( !(ns_read_reg(uart, UART_IIR) & UART_IIR_NOINT) )
>      {
>          u8 lsr = ns_read_reg(uart, UART_LSR);
> +        s_time_t now = NOW();
> +
> +        /* Break out of the loop if spending too much time. */
> +        if ( now > timeout )
> +        {
> +            struct irq_desc *desc = irq_to_desc(irq);
> +
> +            /* Disable the interrupt source - it's never shared. */
> +            spin_lock_irq(&desc->lock);

This needs to be spin_lock_irqsave() - we may not rely on IRQs being on
when we make it here. However, ...

> +            desc->status |= IRQ_DISABLED;
> +            if ( desc->handler->disable )
> +                desc->handler->disable(desc);
> +            spin_unlock_irq(&desc->lock);

... all of this open-coding is quite bad anyway. We should probably add
a helper for this in IRQ handling code.

> +            /* Disable interrupt generation on the device and arm the timer. */
> +            uart->force_polling = true;
> +            ns_write_reg(uart, UART_IER, 0);
> +            set_timer(&uart->timer, now + MILLISECS(uart->timeout_ms));
> +            printk(XENLOG_WARNING
> +                   "uart interrupt taking too long, switched to polling\n");

Probably it is indeed best to keep this simple, but: A single instance of
this taking e.g. just over 5ms (perhaps with a low baud rate) may not be
indicative of an actual issue. To alleviate this as least some, perhaps
besides capping at 5ms we should also make sure that the timeout used isn't
below ->timeout_ms?

Jan

