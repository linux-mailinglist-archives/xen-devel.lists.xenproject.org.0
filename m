Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5387855CCC
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 09:46:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681406.1060166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raXNY-0007uh-9t; Thu, 15 Feb 2024 08:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681406.1060166; Thu, 15 Feb 2024 08:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raXNY-0007sS-6p; Thu, 15 Feb 2024 08:46:00 +0000
Received: by outflank-mailman (input) for mailman id 681406;
 Thu, 15 Feb 2024 08:45:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raXNW-0007sM-QP
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 08:45:58 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a28a0528-cbde-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 09:45:56 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-411fc50e4e9so4697785e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 00:45:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s7-20020a5d69c7000000b0033cf453f2bbsm1051894wrw.35.2024.02.15.00.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 00:45:55 -0800 (PST)
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
X-Inumbo-ID: a28a0528-cbde-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707986756; x=1708591556; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCoAMOp9fEFTVJ/m8pBXny7hymQmiLKidoko2xjvH6g=;
        b=F7ZLH9Peg41Pdc28H/kdVSPy8Ru7nk4NYJ+pL0lqlbnDUy2oYrnOH3JTnzyaqeieWl
         +TDRTKNK5H29Y0LG3WBUxl7+ncPeS6cLHBEPTlzT8wfN4sVqKqvQ/kwLqJn8BBURlR/l
         jkkbErpri8uflBeOmmZofUEZ6DNrF8+/5ylP5regLppypwK4yb/J199v7GBDC5DAMztt
         JIaHassuIiTFgYEqAWlYcYTXpaxWPJCT6bMnF3SBPkxsPs3eiC9qcxfG5MWNu1WGvZ34
         N2xvAzoGHFJcJiGR/iEzjaxSrlrTZ94BbDcMLcdzCTDOK9VQebSCMS0H98e9fWL1QoIN
         sDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707986756; x=1708591556;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZCoAMOp9fEFTVJ/m8pBXny7hymQmiLKidoko2xjvH6g=;
        b=F9s+2EsaCayssT9Ns34MloRPYpq447TiT+S09pwpFQN205Lz+Htujzq5Tj19k1OA9N
         LHk9ozKMI118tnRxm+5+2d2Q8nS3XPvDoLwti8IEliF6v35fViTNd06F5OF7z3t86sk4
         a+Up6VjfU22lbNo59nO/grPJEt2AQQZd61oHdebT8DAjuwnYlYMBYXs7u9QcLbvkd8hz
         PQgxoBlJMBNoJXCXatKLr/bt/OsHmedqvPdQuNY9bsXBpX3dfiLw91eFn0qEcXcCKvu0
         n0cKuGBgKcGQPhn6L0JObnhJMrH2fuOO9J/MV/xBrRdgaRiUFskPbvCQMfbLqmR7j/Ha
         7Tmg==
X-Gm-Message-State: AOJu0YzHwD/2lboWJxMCS9T/BNZncKLE3qCQPA6ARW9TN2R047LEE9iz
	izef8+Y1ot5OUmWRnLoYlDLF0VTxxsp8yLxkrkD4X/V1gKAYShTrm+E9XadVYmASgpzPFZQaBzk
	=
X-Google-Smtp-Source: AGHT+IENqY9eMdOvS9qPBmPFYGfhQKZ0mvrIkIPsWF76XX13onNr2wfhId11Xw/KBFkS9sPv7NxRgw==
X-Received: by 2002:a05:600c:4706:b0:410:27e7:4c5 with SMTP id v6-20020a05600c470600b0041027e704c5mr1040756wmo.29.1707986756104;
        Thu, 15 Feb 2024 00:45:56 -0800 (PST)
Message-ID: <5d8f8dac-f2df-4760-8130-dec97e486578@suse.com>
Date: Thu, 15 Feb 2024 09:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] serial: fake IRQ-regs context in poll handlers
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
 <893be03d-22cc-4b8c-8a54-6479961c5aa2@suse.com>
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
In-Reply-To: <893be03d-22cc-4b8c-8a54-6479961c5aa2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 14:27, Jan Beulich wrote:
> In preparation of dropping the register parameters from
> serial_[rt]x_interrupt() and in turn from IRQ handler functions,
> register state needs making available another way for the few key
> handlers which need it. Fake IRQ-like state.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The use of guest_cpu_user_regs() in dbc_uart_poll() is inconsistent with
> other console poll functions we have, and it's unclear whether that's
> actually generally correct.

It occurs to me that due to this behavior, ...

> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -1164,6 +1164,7 @@ static void cf_check dbc_uart_poll(void
>      struct dbc_uart *uart = port->uart;
>      struct dbc *dbc = &uart->dbc;
>      unsigned long flags = 0;
> +    struct cpu_user_regs *old_regs;
>  
>      if ( spin_trylock_irqsave(&port->tx_lock, flags) )
>      {
> @@ -1175,10 +1176,15 @@ static void cf_check dbc_uart_poll(void
>          spin_unlock_irqrestore(&port->tx_lock, flags);
>      }
>  
> +    /* Mimic interrupt context. */
> +    old_regs = set_irq_regs(guest_cpu_user_regs());
> +
>      while ( dbc_work_ring_size(&dbc->dbc_iwork) )
>          serial_rx_interrupt(port, guest_cpu_user_regs());
>  
>      serial_tx_interrupt(port, guest_cpu_user_regs());
> +
> +    set_irq_regs(old_regs);
>      set_timer(&uart->timer, NOW() + MICROSECS(DBC_POLL_INTERVAL));
>  }
>  
> 

... this ought to be unnecessary, considering what dump_registers()
is changed to in patch 2.

Jan

