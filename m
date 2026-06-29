Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xmc2GIdLQmr84AkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 12:40:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF43C6D8FE0
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 12:40:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=QYJlcBbS;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347454.1605305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we9P4-0002Ro-Kx; Mon, 29 Jun 2026 10:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347454.1605305; Mon, 29 Jun 2026 10:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we9P4-0002QB-IJ; Mon, 29 Jun 2026 10:39:50 +0000
Received: by outflank-mailman (input) for mailman id 1347454;
 Mon, 29 Jun 2026 10:39:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1we9P2-0002Q5-Gd
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 10:39:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we9P1-00CN6o-84
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 12:39:47 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a424b64-bab6-0a2a0a5309dd-0a2a450388a2-44
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 12:39:47 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a424b72-ec1a-0a2a45030019-d155dd36c0f5-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 12:39:47 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-46cbe01d4b6so1819500f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 03:39:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-474e31a7d82sm507363f8f.1.2026.06.29.03.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 03:39:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1782729586; x=1783334386; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qCG+J/5y/jWvV2pZcb/t8YCvrsqe/XiX8UyOgsf2u9Q=;
        b=QYJlcBbSf4+TCmwTgI7YKhkt1JKLoyzT4puSIDbVt13fIWmzcybkbrfujvdxiQmkes
         h18v7zRkNLLnHR6TrN9qs6y3S34aLpxBGt8Mzj0xXKnZPoidqjmK5cQq1EuGo9J6mLl8
         BAewNthbL11QfN8SIZNQGJZCOScRJlRpXXJ4Ffv3Gtr3EJ7T+etXxbmO4/pkHUPy4/9F
         NUDF0x2w59uWAzV9FeR+yI1UtdxGbOzkeEkK9rxjcyTcuQCafu2qmnSX7IaruEkYh8tU
         0l4WHFUTOu+IblAIg8BATDJS/cItW9DhsxN7S+5noF90829FkORD2Xz/YlNfpjrWpe41
         fjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729586; x=1783334386;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCG+J/5y/jWvV2pZcb/t8YCvrsqe/XiX8UyOgsf2u9Q=;
        b=UNHK3Nkj1yJaGbieneBpHKSf6E1vQp2bPgHkQBg6z6+iZhWUEsNzbdxAzP6vajXxai
         twPVG8BIzBHsQ0wvGNkOH9apoHm7/AQtGfsR0PeYO0/AvM7koMuqGH9CrI3X3vCS3S/o
         ksmTzKfe33zSK0Dt24xqbGsGu650HxLk3vXqxKN8F9gnKGO7ZEZ2gkDJziv6eCgiKD8p
         +2LjxhmP5JaqC95grSCSx5QvDswcTZAAiVeBJ3kKYR8UEdr951DQ2J4ANtfpojBBHt2I
         YwPXOWP6xwoyjiukCCjuIiNKIFDLx6Qes7MZIvk5mkNwQ5PyZh+PamwnhplvyVtpFdNh
         3reA==
X-Forwarded-Encrypted: i=1; AHgh+RrmzWueM15suIUXOdJYhlQVgkn7OLf5f5UXqDDrhyAsOhuOKvos9ay11o3VapaKmM2lIqvBByz1W+c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHZYqHW5SXbfWjjQ7RK7zp2q1cJYcKiGRTYmmjZh8sit9SxgaK
	lK8eWTlJNnhDqAJVO5hNdWTxAngl3e9ov1QeIqlnEBBOOos/wgqWLPesDsswg3ncLQ==
X-Gm-Gg: AfdE7cll9/nCzKBiwAwtyJiGeGO7wcrnTe8dPtio5aaoDBTcg5diZNttSd9mNqtcni5
	QKt+noqHkSmWMsxzQNSnjmbGPGYcpJ3/guehGNEHngVz7o24m8jzbHIvD8rK3ajJY1ZaLPufoxJ
	I0dSBgb296SUormdcD4aKKSEryBI4ghz5JDjOoDIDXrAxB3Xl9PheyxeY+WLYtv1m7toZrtHbEV
	dAZxtVU4y8Pt5dkTaMamae1t7/RoVIm/FVzIPpB2r/CP5YQz6rriaYibgRbau5Ub9gbEVCPuD3v
	EMhaGUmA/HVg8WBTPYX4UF/FmRR5UF5+alXHWigP4MYp9csZqRkuW/zzq7cy+lxIyjGh7WJW/Db
	4UGHVPDGxoCbwaKruGOTBgxv/8x/Pn6LCzjBptfz2l25ANVojVqGCcDMruos32JDfE01CqwfyP2
	woqpW/R3Bxn2ib0V0rX/73/L//EndhVXq4+VjadArGQvB59vMRYOAvB7CfNyC/wgEoXxF8yNzR7
	F91GB2vA3/ovPU=
X-Received: by 2002:a05:6000:2f83:b0:472:76ad:b329 with SMTP id ffacd0b85a97d-47276adb46amr8097242f8f.6.1782729586492;
        Mon, 29 Jun 2026 03:39:46 -0700 (PDT)
Message-ID: <f8251836-4b7a-4fab-9f1c-e95d4444b989@suse.com>
Date: Mon, 29 Jun 2026 12:39:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 4/4] char/ns16550: bound execution time of
 ns16550_interrupt()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260629094531.55555-1-roger.pau@citrix.com>
 <20260629094531.55555-5-roger.pau@citrix.com>
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
In-Reply-To: <20260629094531.55555-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782729587-073285D1-AD6BC93D/0/0
X-purgate-type: clean
X-purgate-size: 1510
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: DF43C6D8FE0

On 29.06.2026 11:45, Roger Pau Monne wrote:
> --- a/xen/common/irq.c
> +++ b/xen/common/irq.c
> @@ -54,3 +54,15 @@ unsigned int cf_check irq_startup_none(struct irq_desc *desc)
>  {
>      return 0;
>  }
> +
> +void disable_irq(unsigned int irq)
> +{
> +    struct irq_desc *desc = irq_to_desc(irq);
> +    unsigned long flags;
> +
> +    spin_lock_irqsave(&desc->lock, flags);
> +    desc->status |= IRQ_DISABLED;
> +    if ( desc->handler->disable )
> +        desc->handler->disable(desc);

I'd like to point out that __pirq_guest_unbind() has this the other way around:
Call ->disable(), then set flag. Similarly move_native_irq() only calls the
hook with the flag clear. Whereas fixup_irqs() doesn't care about the flag at
all. Also considering the wording "disable" vs "disabled", I think setting the
flag afterwards is better.

> @@ -190,12 +191,38 @@ static void cf_check ns16550_interrupt(int irq, void *dev_id)
>  {
>      struct serial_port *port = dev_id;
>      struct ns16550 *uart = port->uart;
> +    /*
> +     * Set quite arbitrarily as 4x the time to drain the TX or fill RX FIFOs,
> +     * set the upper bound as 5ms or the timeout_ms value, whatever is higher.
> +     */
> +    const unsigned int delta = min(uart->timeout_ms * 4,
> +                                   max(5u, uart->timeout_ms));

You may want to also update the description accordingly.

Preferably with respective adjustments:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

