Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJGXMvUk6WmMUwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 21:43:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3238344A454
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 21:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291076.1570396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFdSz-0003uY-RO; Wed, 22 Apr 2026 19:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291076.1570396; Wed, 22 Apr 2026 19:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFdSz-0003t6-Ob; Wed, 22 Apr 2026 19:42:33 +0000
Received: by outflank-mailman (input) for mailman id 1291076;
 Wed, 22 Apr 2026 19:42:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wFdSy-0003t0-S2
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 19:42:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFdSx-008fMw-R0
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 21:42:31 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 69e9245c-2eae-0a2a0a5409dd-0a2a450ce53e-32
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 21:42:31 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <olekstysh@gmail.com>)
 id 69e924a7-62f1-0a2a450c0019-d155802bb91b-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 21:42:31 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-48374014a77so76527205e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 12:42:31 -0700 (PDT)
Received: from [192.168.0.112] ([91.123.151.42])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891df9e50asm209401935e9.0.2026.04.22.12.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 12:42:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776886951; x=1777491751; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DdOI7i9//vMAJ++YhZ6iQpMcPC2SjZ3th+2CW8i/nvU=;
        b=S1ia/3ZzXuBXlr/DH2PdU4SC7LbITSuKyGzwfeJgaz2EunDewIQL0CU+9fb46jxd5z
         f2mBgCD2rNttrTn4Ay73QDL947lq59f60dLHwH3Jml7T7PxZCZEXH9KAEqhDUS17pQXo
         0Q0Abm2TCpnuw4CFuv9gQcoS8gPEXAq9amhqWGMULazhyzfAmTx6vQBnSjgVM78Q3mNK
         G/IQ9woSc16yGtx4lQr5Ufpgk0wDclMl6I5JjuONIu1G4Jnyk+as2tlWMfO5GFUC9+Dj
         YbD09udR9gIutiGHM21K8HLov0ngnvOMShEDWnKOAa25mv5ls/lUr5/jLtmDfTn24xb7
         vCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776886951; x=1777491751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DdOI7i9//vMAJ++YhZ6iQpMcPC2SjZ3th+2CW8i/nvU=;
        b=D4RfTCokDZhgu6+JgbQGDB+t3IdgewhO8Ftr75uWkGJmgFjGgTWXErj51TfA8yPtNz
         ipzxuSELjWxaoTEXZWUIwsWDCCK3OG9KC9x/HXD1AvFk3+3tsuXSWCq8QYci++HFyLZx
         niOaEIio/txGfy0p/sXMJSYn4fX5C3ZKBxVWZxNRrTNo9/+mwq8Mbg6tWistTBBmXsLz
         kbEfLkuGpMuHN6vpz9McV2Dh8zFLujtaOMXJ3BfkuJX5VWm468DjpeB6l1L6jFro43B3
         NM4WxUa/huLRE1SMwd5ap/8DvbPnLFcJSrpITzFyfNeUBkRMN+Edhg12LF+r7UOJiDf6
         VLTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Eie3KbMM9PPEzHLt2QIF8PPepD3m0QQcHpvKZb/qEcsqYS+zzH8kqGbayDovxaA43HS9oNR7PE/U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy75YMQTTfaNuTnLWKR4a8HcV43pimEY6vKcpexFkrU/Y/ka+C4
	Ukg70slsiCJgBXYxG2wQWcKeWOiyo+1O6GxT1siBsbxXAKQGSL5uJDQb
X-Gm-Gg: AeBDiesYtV1JPG3ORsiuzB8EQz0niWccp8KOCpSMMCLhabWIiOhds+n42WDnwamliOz
	WU0HJawy9k7PIq8bCEJYzKv3Utzrexks3HVJoblwrWZY5tmS1bt9IzQSC2z5oK2lk5ucCE51j+C
	UAjInn686zRHmadlIx8g8FcrBiz/goQH1l94FoEjFUiVOHp+ZKWoP01/bzeFJbvWIx0ObydSwub
	LPmffxieGCMSeljthDl1MgFxrzZa/pnowuV7aQrc1+TUQbIpGPVyfWRwJ1nRkSrAYloCNfCdAMe
	cjYXTCEangCaTwF4K5ZXMYlJr6J3LkhTpUP6J15Edruq1b52FbPorQEUTdWj8uyoRElJKXiGijZ
	2OewUejDvc3omegpCPDXr+f3oEe9Wp7TAdCssLidvlbEhrru7+WBWnVlmgJ+rogrl9DWQ8JuI1V
	3d+vBaDjwV1hGJSx5led2uB+JFcw62fgbrM3PhEon/49O2zEg=
X-Received: by 2002:a05:600c:8483:b0:488:7ff6:1f75 with SMTP id 5b1f17b1804b1-488fb782d91mr357959195e9.21.1776886951015;
        Wed, 22 Apr 2026 12:42:31 -0700 (PDT)
Message-ID: <5357f1a2-8585-4e39-adec-962b365c176f@gmail.com>
Date: Wed, 22 Apr 2026 22:42:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] xen/drivers/char/cadence-uart: fix IRQ
 registration failure propagation
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1776850201.git.oleksii_moisieiev@epam.com>
 <fc65ea2c9dcc7c3bc632c8c1a9f14eeb5de6d9b9.1776850201.git.oleksii_moisieiev@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <fc65ea2c9dcc7c3bc632c8c1a9f14eeb5de6d9b9.1776850201.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1776886951-6D56FCF5-86CEAA84/0/0
X-purgate-type: clean
X-purgate-size: 3035
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:xen-devel@lists.xenproject.org,m:bertrand.marquis@arm.com,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3238344A454
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/22/26 12:33, Oleksii Moisieiev wrote:

Hello Oleksii

> In cuart_init_postirq(), two code paths could reach the
> interrupt-enable write to IER without a handler being registered:
> 
> - When no valid IRQ number was provided (uart->irq <= 0), the original
>    positive-condition guard (if uart->irq > 0) skipped the irqaction
>    setup but still fell through to the IER write, enabling the receive
>    data interrupt with no handler installed.
> 
> - When setup_irq() returned an error, only an error message was
>    printed and execution continued to the IER write, arming the
>    receive hardware interrupt line with no handler to service it. On
>    platforms where the GIC receives this asserted line, the result is
>    either repeated spurious-interrupt warnings or an unhandled
>    interrupt fault.
> 
> Restructure cuart_init_postirq() to use early returns in both error
> paths.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> 
> Changes in v3:
> - clear pending error interrupts before setup_irq call for cadence uart
> - change uart->irq <= 0 to uart->irq == 0 since irq is unsigned

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
with NIT (could probably be fixed on commit) ...

> 
>   xen/drivers/char/cadence-uart.c | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/drivers/char/cadence-uart.c b/xen/drivers/char/cadence-uart.c
> index b2f379833f..8961d39de1 100644
> --- a/xen/drivers/char/cadence-uart.c
> +++ b/xen/drivers/char/cadence-uart.c
> @@ -72,19 +72,25 @@ static void __init cuart_init_postirq(struct serial_port *port)
>       struct cuart *uart = port->uart;
>       int rc;
>   
> -    if ( uart->irq > 0 )
> -    {
> -        uart->irqaction.handler = cuart_interrupt;
> -        uart->irqaction.name    = "cadence-uart";
> -        uart->irqaction.dev_id  = port;
> -        if ( (rc = setup_irq(uart->irq, 0, &uart->irqaction)) != 0 )
> -            printk("ERROR: Failed to allocate cadence-uart IRQ %d\n", uart->irq);
> -    }
> +    /* Don't unmask interrupts if no valid irq was provided */
> +    if ( uart->irq == 0 )
> +        return;
> +
> +    uart->irqaction.handler = cuart_interrupt;
> +    uart->irqaction.name    = "cadence-uart";
> +    uart->irqaction.dev_id  = port;
>   
>       /* Clear pending error interrupts */
>       cuart_write(uart, R_UART_RTRIG, 1);
>       cuart_write(uart, R_UART_CISR, ~0);
>   
> +    if ( (rc = setup_irq(uart->irq, 0, &uart->irqaction)) != 0 )
> +    {
> +        printk("ERROR: Failed to allocate cadence-uart IRQ %d\n", uart->irq);

    ... the format specifier should be %u instead of %d since the value 
is unsigned.

> +        /* Do not unmask interrupts if irq handler wasn't set */
> +        return;
> +    }
> +
>       /* Unmask interrupts */
>       cuart_write(uart, R_UART_IDR, ~0);
>       cuart_write(uart, R_UART_IER, UART_SR_INTR_RTRIG);


