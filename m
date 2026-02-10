Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMEtIntXi2lRUAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:06:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EE911CEC3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:06:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226594.1533101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqFT-0000Sn-Lo; Tue, 10 Feb 2026 16:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226594.1533101; Tue, 10 Feb 2026 16:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqFT-0000QL-Ir; Tue, 10 Feb 2026 16:05:59 +0000
Received: by outflank-mailman (input) for mailman id 1226594;
 Tue, 10 Feb 2026 16:05:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpqFR-0000Q7-Eo
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 16:05:57 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d34cfee-069a-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 17:05:48 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43626796202so841214f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 08:05:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296b20fasm34510723f8f.6.2026.02.10.08.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 08:05:47 -0800 (PST)
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
X-Inumbo-ID: 5d34cfee-069a-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770739548; x=1771344348; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kOda+iZgXgWFWM8jr1bazux9sl4/PGydZmej3NFNQgs=;
        b=IxLzNS3YmLQoIJCdMHvV930ucrssWrQS0aru7PJzbbU5xTx7ikxQSVOkXKs2Xl9nxw
         tz9ek5ogY3wgJETKRKhkou84A4QLSdzahQQP+1EOXc1FbiF7St3MfCckUqLQvw81pCqM
         260aqCETTa1CYqaC7rPadrStxQe53gh6H/Nv65VcV0svon1+SwbIkxqOSwuTTBjpx6pV
         rFRafDkQ/1/AQ3Hh6PLs3F89j7+lrxlDRxXqTXaq4mNDSgMwYbW6hzNgwvL9yRn2Ot7m
         ET1hFnoYk4L3uS/dGOyjtYgej1EdkIUjFQc8b6+ahwGOK7pWCSF3KRwV45ku3buWEEUG
         UnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770739548; x=1771344348;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOda+iZgXgWFWM8jr1bazux9sl4/PGydZmej3NFNQgs=;
        b=aUnRSOgBBm2Gi0o2Rz5XUubeBAu2euHoY1FCEub9ees88vX/8ZExFAUsrO3+1qhHt+
         AQKbT2DHYRCHVpihGtZ8jRvKzb6i4lWEMSn+sCeOBg+skR9bLL5TANMJtgY+BMNG1pQy
         NqBTbu/wyODz+vkM44xIWqRLEUIHmG34XYiI3fd5s1/pJ9aRA1Z9gzxWwlyLmTE4MOuC
         Vmqpo6Mp7Llg+A3fVXkdQd2n0OUWp+9SkL1HwQSsFziKYUHc/HOvbFweHjfgTZnq+Jty
         KsRa6p9txMIa4MddwSRc6fL5knyD1t5CJvy0WKWyq9P5m0VTP9eIt0e1uEcnmIqMFN0n
         AR6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIc0BWYMQ2NqYz50ESU6mDBID4z1h2CVs0aZN9Z/buOfh9/pOufk8ehT1Pd6dk/yMCapr/hl+BJpE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDLer5BcRro7+gOjg0U6AO0CTLjyxVdL/KrSSor4GLvv7xZoJ3
	c68BGC6/nm3b7lOcmE8143qEurSGE4POEAN9Brp/S4y/pfI8oPrhWWxiE64T/Ywrbw==
X-Gm-Gg: AZuq6aJ186UE4qj9g4yHtfF181ffAxe2TwQeFZonvAulxSSlh4OIiC5Xp5fKa5ZfnHI
	VgcGkKKRDDBO2xcmnS4CyAvMmyewofgkW8BZavqFAHMzZ3YeXJxFiE8wdz1fqSbgvNVVo/nos1p
	OjGLVVqST7qAtqapBceB7UGpFqC8NO6ATYuUHOw4v6eEHE+p3BUiFQiIanzGGA1q0lU2TDAn2tX
	yWH9+6XJhQnI+OenikTGdalfLsmSIie9jfshU3tRE/fNj1T9T8y5/5K7AIePlWsiUBnIB9jVKEX
	7oJ9S274duvgCwt9hAgA6Z62vVICuKCNujQ78VA4fe/yPuz6kP08cvEAdXXsKQze+ThoS3raPg3
	bBuA//66uhf/lEXZWOxpQvzQ2pZSODza8JUPWPh2QEhfFFKBy5wd0Y5/8Xa/iE/lGJiLYSGfWmi
	okS5MfXjwvq1JRYnlU2TMqXvwbHr9qPgVFs/TQ8BfbBmynEXEpTbxsHmQG4IBXBj8mQJL1lbKKB
	o0Pmzdzu7HjMVE=
X-Received: by 2002:a05:6000:2386:b0:433:2f55:7cab with SMTP id ffacd0b85a97d-4362934bff8mr23271162f8f.37.1770739547775;
        Tue, 10 Feb 2026 08:05:47 -0800 (PST)
Message-ID: <de176675-0676-4e96-adb3-1b07aae6f5f8@suse.com>
Date: Tue, 10 Feb 2026 17:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/5] xen/console: handle multiple domains using
 console_io hypercalls
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: grygorii_strashko@epam.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com,
 jason.andryuk@amd.com, victorm.lira@amd.com, andrew.cooper3@citrix.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
 <20260204233712.3396752-4-stefano.stabellini@amd.com>
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
In-Reply-To: <20260204233712.3396752-4-stefano.stabellini@amd.com>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E9EE911CEC3
X-Rspamd-Action: no action

On 05.02.2026 00:37, Stefano Stabellini wrote:
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -541,6 +541,12 @@ void console_put_domain(struct domain *d)
>          rcu_unlock_domain(d);
>  }
>  
> +static bool is_focus_domain(const struct domain *d)
> +{
> +    ASSERT(rspin_is_locked(&console_lock));
> +    return d != NULL && d->domain_id == console_rx - 1;
> +}

Just as a remark: You using only nrspin_*() further down and in patch 3,
using rspin_is_locked() here is slightly irritating. It looks to be
technically correct, but maybe a comment is warranted nevertheless?

> @@ -559,6 +565,7 @@ static void console_switch_input(void)
>          {
>              nrspin_lock_irqsave(&console_lock, flags);
>              ACCESS_ONCE(console_rx) = 0;
> +            serial_rx_cons = serial_rx_prod;

I think you want to have the same comment here as you put ...

> @@ -581,6 +588,8 @@ static void console_switch_input(void)
>  
>              nrspin_lock_irqsave(&console_lock, flags);
>              ACCESS_ONCE(console_rx) = next_rx;
> +            /* Don't let the next dom read the previous dom's unread data. */
> +            serial_rx_cons = serial_rx_prod;

... here.

> @@ -610,7 +619,7 @@ static void __serial_rx(char c)
>          unsigned long flags;
>  
>          /*
> -         * Deliver input to the hardware domain buffer, unless it is
> +         * Deliver input to the focus domain buffer, unless it is
>           * already full.
>           */
>          nrspin_lock_irqsave(&console_lock, flags);

The conditional ahead of this comment isn't changed here yet, so changing the
comment is premature. (I'm pretty sure I said so before.)

Jan

