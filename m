Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKrmOIv8cGmgbAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 17:19:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 523E559C98
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 17:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210002.1521861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viav6-0001hL-Tk; Wed, 21 Jan 2026 16:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210002.1521861; Wed, 21 Jan 2026 16:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viav6-0001ft-R1; Wed, 21 Jan 2026 16:19:00 +0000
Received: by outflank-mailman (input) for mailman id 1210002;
 Wed, 21 Jan 2026 16:18:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viav5-0001fn-32
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 16:18:59 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3614264-f6e4-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 17:18:57 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so343695e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 08:18:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f4b2755absm484644635e9.15.2026.01.21.08.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 08:18:56 -0800 (PST)
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
X-Inumbo-ID: e3614264-f6e4-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769012337; x=1769617137; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OP0CG/u1l6e0yIA6ogjxbsWgPalv04WrU/mmRvS/0xk=;
        b=HOassdZrXbr/fxhYneBYM89f+vx0c36SFMSpLcS8fFNoBqIZAAKWvlk50LOK519lFM
         R8oPvrTU4qi23lifMhZKaRk20d6fwVfAKQ8fZF35/ki0yW6Ln3Em+aI0ZTubDR2U98V/
         aFwZZdBMxqp1QOkqEUj8XmdX33gr0GVKuaQ0HNytzpt3vGj9vskwO2S0CIeQWXyGeJTU
         gpwghAJvcpDS6yAAUG9mn9+5o7baOCpO/EfZn8IaHAFiBHlBPkqp6EFWlakAPZgF25b5
         nzrmuJ8F4ZDSZydooRLhdZUw57g3Mtf5Xmb23PzGPjWbbuqbBnPXTjpmj174nEBXdFQN
         uvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769012337; x=1769617137;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OP0CG/u1l6e0yIA6ogjxbsWgPalv04WrU/mmRvS/0xk=;
        b=WjOB8hWu5xq40PMEsmrN/WBdxh3gAKXZSQHYjkXaWB/Jc7NMLHdxkgGxjZ3Wpa0XIs
         KPODZMLLp/F7tVJGyBtQPCOD5X3sDeFF3CUMqcW9ReudYUPujYD1CEiLl0Ty2pCnHQD6
         FsI/0CCvBC27T12F63MtQW98m+rTTbEHN1BswTTy0z4naBK+Y0iXNkulOSQGEXU1Xc3M
         hteocSDShPqV5uGypR9O3IECJEPXBMxQP9qHWGoIuH7ZQBvUYruRdc/11QS/hhRahjI4
         mN0W0U5yla1AFAmF34Lanbz8q6H1uBfipLNFjPfai3iDHzxRNvl9fXZZqnJEwp6DWXgz
         oVaw==
X-Forwarded-Encrypted: i=1; AJvYcCXWi8/sGcreypb0Sw1LZ4yEI6IOl7pxcovSYxubBgyrz2jQ2kGOtca1wlY2xth+bz+0IAht+RXkNHs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyElLl9P4jt7PgYI3xENq2bXrsEZq85Bt6RDisWavB/yC1EYB1b
	1UoSG0aC0sl/BUEkik2A6Y7+4/HWFijHAOHYpX4yjv6gKfJACTO57FdnGIxw/xApCQ==
X-Gm-Gg: AZuq6aLPM+Fqsn7Ubt1r+BBaqtn/jxvWttNRKC60/0b+2wFADzulMBsTMDBbPVyCLKr
	d8nXP9bh3ONQfc80oIVaOq32nP24Z/VgaXExYfnoI9ivIPCbzOM+12egXd3uN0+bcwJyHPocqgX
	8eVBddYhwKzYLxlPXbONzEVa8zoXzljlbGRvwKA5Dj+ejHWhJqTNFmqqYzxKZUC/10pSTJLbAlP
	dJ52DG5GruaI078zwsqIPsOQ3PnidWwXRgRd8eyNjr3qX8CRr0lHngEi7BovoBmZDFm1KCVlApw
	4Dk/bzUz2TSvOufXMzc6C7fCN9CzeRLk1PiXeIzoxcUDdQYeWhiifJJd5+5h2GnNBQp4hCgCbku
	Dk9sL8kOGo4VT6r3J3Bnah1C3k7NwO2vpZCEj4G0n0q6Mm/2g/FS7gmVjox0aASTCMkZ1Rhs96B
	B+ad+fakdRIsULanJoFINtroQRYy1l/qwfbfAA7TtvQkAPUaTtRHBNVQDKlct8Gc7VbCvO1hV8m
	Qw=
X-Received: by 2002:a05:600c:1991:b0:47d:6140:3284 with SMTP id 5b1f17b1804b1-4801e34b5a7mr217830685e9.37.1769012337137;
        Wed, 21 Jan 2026 08:18:57 -0800 (PST)
Message-ID: <873867dc-79d8-4ed3-94f7-1c7823db7957@suse.com>
Date: Wed, 21 Jan 2026 17:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/console: handle multiple domains using console_io
 hypercalls
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: grygorii_strashko@epam.com, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2601131638350.6279@ubuntu-linux-20-04-desktop>
 <63c35c5e-577b-4346-b600-03808306177f@suse.com>
 <alpine.DEB.2.22.394.2601191522450.7192@ubuntu-linux-20-04-desktop>
 <32d0a9a2-89df-4e20-8f7a-0f069cbff11f@suse.com>
 <alpine.DEB.2.22.394.2601201601070.7192@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2601201601070.7192@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 523E559C98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.01.2026 01:07, Stefano Stabellini wrote:
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -521,6 +521,8 @@ struct domain *console_get_domain(void)
>  {
>      struct domain *d;
>  
> +    nrspin_lock_irq(&console_lock);
> +
>      if ( console_rx == 0 )
>              return NULL;
>  
> @@ -540,6 +542,8 @@ void console_put_domain(struct domain *d)
>  {
>      if ( d )
>          rcu_unlock_domain(d);
> +
> +    nrspin_unlock_irq(&console_lock);
>  }

Hmm, I'd much prefer if we could avoid this. The functions aren't even
static, and new uses could easily appear. Such a locking model, even
disabling IRQs, feels pretty dangerous. (If it was to be kept, prominent
comments would need adding imo. However, for now I'm not going to make
any effort to verify this is actually safe, on the assumption that this
will go away again.)

> @@ -596,8 +604,19 @@ static void __serial_rx(char c)
>  
>      d = console_get_domain();
>      if ( !d )
> +    {
> +        console_put_domain(d);
>          return;
> +    }
>  
> +#ifdef CONFIG_SBSA_VUART_CONSOLE
> +    /* Prioritize vpl011 if enabled for this domain */
> +    if ( d->arch.vpl011.base_addr )
> +    {
> +        /* Deliver input to the emulated UART. */
> +        rc = vpl011_rx_char_xen(d, c);
> +    } else

Nit: Style.

> +#endif
>      if ( is_hardware_domain(d) || IS_ENABLED(CONFIG_DOM0LESS_BOOT) )
>      {
>          /*
> @@ -613,11 +632,6 @@ static void __serial_rx(char c)
>           */
>          send_guest_domain_virq(d, VIRQ_CONSOLE);
>      }
> -#ifdef CONFIG_SBSA_VUART_CONSOLE
> -    else
> -        /* Deliver input to the emulated UART. */
> -        rc = vpl011_rx_char_xen(d, c);
> -#endif

I don't understand this movement, and iirc it also wasn't there in v3.
There's no explanation in the description, unless I'm overlooking the
crucial few words.

> @@ -741,17 +756,23 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>          if ( copy_from_guest(kbuf, buffer, kcount) )
>              return -EFAULT;
>  
> -        if ( is_hardware_domain(cd) )
> +        input = console_get_domain();
> +        if ( input && cd == input )
>          {
> +            if ( cd->pbuf_idx )
> +            {
> +                console_send(cd->pbuf, cd->pbuf_idx, flags);
> +                cd->pbuf_idx = 0;
> +            }
>              /* Use direct console output as it could be interactive */
> -            nrspin_lock_irq(&console_lock);
>              console_send(kbuf, kcount, flags);
> -            nrspin_unlock_irq(&console_lock);
> +            console_put_domain(input);
>          }
>          else
>          {
>              char *kin = kbuf, *kout = kbuf, c;
>  
> +            console_put_domain(input);
>              /* Strip non-printable characters */
>              do
>              {

The folding of locking into console_{get,put}_domain() again results in overly
long windows where the "put" is still outstanding. As said before, the current
domain can't go away behind your back.

> @@ -813,6 +835,13 @@ long do_console_io(
>          if ( count > INT_MAX )
>              break;
>  
> +        d = console_get_domain();
> +        if ( d != current->domain )
> +        {
> +            console_put_domain(d);
> +            return 0;
> +        }
> +
>          rc = 0;
>          while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
>          {
> @@ -822,14 +851,23 @@ long do_console_io(
>                  len = SERIAL_RX_SIZE - idx;
>              if ( (rc + len) > count )
>                  len = count - rc;
> +
> +            console_put_domain(d);
>              if ( copy_to_guest_offset(buffer, rc, &serial_rx_ring[idx], len) )
>              {
>                  rc = -EFAULT;
>                  break;
>              }
> +            d = console_get_domain();
> +            if ( d != current->domain )
> +            {
> +                console_put_domain(d);
> +                break;
> +            }
>              rc += len;
>              serial_rx_cons += len;
>          }
> +        console_put_domain(d);
>          break;

This is pretty horrible, don't you agree? Demonstrated by the fact that you
look to have encoded a double put: The 2nd to last one conflicts with the
one right after the loop. Whereas the earlier "break" has no reference at
all, but still takes the path with the "put" right after the loop. At the
same time it also looks wrong to simply drop that last "put".

Jan

