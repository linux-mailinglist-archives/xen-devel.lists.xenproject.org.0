Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLg4O+Ehg2nWhwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 11:39:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50248E4AB8
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 11:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220392.1529101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnaHw-0002gE-HP; Wed, 04 Feb 2026 10:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220392.1529101; Wed, 04 Feb 2026 10:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnaHw-0002db-Eg; Wed, 04 Feb 2026 10:39:12 +0000
Received: by outflank-mailman (input) for mailman id 1220392;
 Wed, 04 Feb 2026 10:39:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnaHv-0002dV-QH
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 10:39:11 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd5aa55c-01b5-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 11:39:10 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-480142406b3so49759485e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 02:39:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43618058473sm5777876f8f.22.2026.02.04.02.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 02:39:09 -0800 (PST)
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
X-Inumbo-ID: bd5aa55c-01b5-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770201550; x=1770806350; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AJqpjliRtFftIMnFF6amx1fe2LrK+P6Eavl0AwdjdSI=;
        b=BvdZkVcHyyyz01/QfqnfSGMrGXe7B/HqhMsGc9WjH+rHrsxaQpKZ3Ba6g1h8RDj7YM
         5VH4N5+vPCYK1GlEuIQPaf4CL6O5A9w3cc/YWyEfP+eNEFQc3+FW1RtGtjSiONJgcYpu
         3GncEREmROxFcWaB+iyUrALOgM8HTppedGwRna5Bs8KtjlDp2HBZtFZ7ESymHZfeQwQ3
         atQmRdVf8ZVnSqUJWtjsgwvC11P7KL3gni0Gd5kj6vHWRCu/8CM93SvLm+WWJtsBX/EA
         +xXs2OAE08y00eWJYZKZdAn+JwsYBKCyDyyvIRGz22P9ePoFpn2/UlORqQVpi9he5Ri9
         Znrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770201550; x=1770806350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJqpjliRtFftIMnFF6amx1fe2LrK+P6Eavl0AwdjdSI=;
        b=Hs2T2oRw6TVHeTbO8ERGxG7ZDYb4PLTXO+jiSEiiyn+qin2Y+HCDow5wk4wAWZXG4f
         VwcyQT/5P+cUcJcr3R8BNjnFovBndChw9inc3fJdJiSI+IPnhtnbfTLy9/MDry7dWgR1
         MpTX5ZYfITHAWRlWmPAQhN8QQwaSRHNPMVkIiAURfs3+L/U1mW1FFa7P43e9J3JRyukR
         k/8GnS83etgGAHIRAXqXB9CbzupDcEScgJiRNqPrBbiLe5d6o1WZA+txlKTgY4/AvziG
         OfdHAUlHclD2smC4pkCm+LJmPT7nKf6/i2duyeq6pHX+LUyAXSCZXvj/QhUcrET8UaBc
         gVZA==
X-Forwarded-Encrypted: i=1; AJvYcCUF0Ub9JE+SWOcSZVjeX9sJixPo69EZJd31D14Jf0B7o4W+fzaHcQ8VLW5j4FraXru8eZmOQumdVVA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzLrh0MvPOTKqI82SuOyjtnYzxQUU6s8PB2uNcu2kQwakQmqUk
	ugOPQFJhsJNMwycxd2ZFzajTZSQt/Gc3EYY23PTFRYlAylz/ewchkcwxZpFswmwE8Q==
X-Gm-Gg: AZuq6aLgrK/8ecctVR7OALmPRC/+ngH1ZEULCnTtSA+usx776KpOAZsv4tv/OxCNPmQ
	/+UAEvMtw1VKjbHtc/qwTtx8o67YVEAXQ05rv/sPYnL+ZP7L5KopWLlm5aPFiEdtALqQDhM5kUa
	KomMvG8q7m8/ki6msHS8Grec3G7ZQTn8nQPLU5hxXtdGnNF9CeIkOK+M84lE9tmTB+jGszOidVw
	95Rexg0reyfqBhD7pqSupMzGh/zEfHePWeBQ6mU7fcJCozCKWh0ZtjlKpDtAPRO0J7CWs3hE+JC
	F69FJdEp/umCDzmTTd1Q8aTmkY2qAV+ujMUGDcVMF2JgIpLzcM7AjA7LEpE3zXJ4/AV+3GVjQBF
	QGsnUdNmXOaLiUiV7MBxML36NFOSOoFz6BaIbpx1WsGFK4wu7IOamkB0p861xIEqeO//2/8+jbE
	1cz/PoZdBQdJLj5/jF9lcmqLphPWj3v92EzVVfbGVKmB/DRdaeNibh+P9f2qHUOWa0EgspQNGfY
	j8=
X-Received: by 2002:a05:600c:8712:b0:480:4be7:4f53 with SMTP id 5b1f17b1804b1-4830e99333amr42246105e9.31.1770201549777;
        Wed, 04 Feb 2026 02:39:09 -0800 (PST)
Message-ID: <bddacebe-e84b-4ba0-959e-be078d613d03@suse.com>
Date: Wed, 4 Feb 2026 11:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/16] xen/riscv: implement reprogram_timer() via SBI
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <732635f43fb80daec332f78d4442b56bf5dfda98.1769099885.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <732635f43fb80daec332f78d4442b56bf5dfda98.1769099885.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 50248E4AB8
X-Rspamd-Action: no action

On 22.01.2026 17:47, Oleksii Kurochko wrote:
> @@ -40,6 +43,46 @@ static void __init preinit_dt_xen_time(void)
>      cpu_khz = rate / 1000;
>  }
>  
> +int reprogram_timer(s_time_t timeout)
> +{
> +    uint64_t deadline, now;
> +    int rc;
> +
> +    if ( timeout == 0 )
> +    {
> +        /* Disable timers */
> +        csr_clear(CSR_SIE, BIT(IRQ_S_TIMER, UL));

For here and below: Is it guaranteed that the SIE bit is writable? The privileged
spec looks to have provisions for the case that it isn't (together with the
corresponding SIP bit).

As to the comment - why plural here, when ...

> +        return 1;
> +    }
> +
> +    deadline = ns_to_ticks(timeout) + boot_clock_cycles;
> +    now = get_cycles();
> +    if ( deadline <= now )
> +        return 0;
> +
> +    /* Enable timer */
> +    csr_set(CSR_SIE, BIT(IRQ_S_TIMER, UL));

... it's singular here? Also in both cases, isn't it the timer interrupt you
enable, not the timer itself?

> +    /*
> +     * TODO: When the SSTC extension is supported, it would be preferable to
> +     *       use the supervisor timer registers directly here for better
> +     *       performance, since an SBI call and context switch would no longer
> +     *       be required.

I think you mean a mode switch here, not a context one?

Jan

> +     *       This would also reduce reliance on a specific SBI implementation.
> +     *       For example, it is not ideal to panic() if sbi_set_timer() returns
> +     *       a non-zero value. Currently it can return 0 or -ENOSUPP, and
> +     *       without SSTC we still need an implementation because only the
> +     *       M-mode timer is available, and it can only be programmed in
> +     *       M-mode.
> +     */
> +    if ( (rc = sbi_set_timer(deadline)) )
> +        panic("%s: timer wasn't set because: %d\n", __func__, rc);
> +
> +    return 1;
> +}
> +
>  void __init preinit_xen_time(void)
>  {
>      if ( acpi_disabled )


