Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHv3CSAP3mnRmQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 11:55:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 064E83F84C7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 11:55:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281554.1564417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCaUD-0008FW-9m; Tue, 14 Apr 2026 09:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281554.1564417; Tue, 14 Apr 2026 09:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCaUD-0008Ci-6v; Tue, 14 Apr 2026 09:55:13 +0000
Received: by outflank-mailman (input) for mailman id 1281554;
 Tue, 14 Apr 2026 09:55:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wCaUB-0008Ca-QH
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 09:55:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCaU7-0068KX-Tv
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 11:55:09 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 69de0ef4-5cb7-0a2a0a5109dd-0a2a4501a27c-44
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 11:55:09 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <olekstysh@gmail.com>)
 id 69de0efd-6fc9-0a2a45010019-d155802fb9bc-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 11:55:09 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-48374014a77so73441905e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 02:55:09 -0700 (PDT)
Received: from [192.168.0.112] ([91.123.151.140])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d681ea59sm120999895e9.14.2026.04.14.02.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2026 02:55:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776160509; x=1776765309; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmNa19N8+QZNP/ohDnpTlbvtv8o+CLutWIXJRtYFcvo=;
        b=W4p1maido8Nj1XFn9sFj3+R8EfEVnz9ZYhI1XeAZy5WIydgMjFWUV3pC7DbaobUdQw
         eSkYSXTnInd5GqT1Mv9izVMJdk88qSUogSEvg4PWYSvXSzFb8k8ZYS5VuxjIRUSswpIW
         ucyzolTgQTNl6FBvoXL4dHBF98I/wTveRcMzas0lriFpPhBOdDmIIjs2NTGiyPQNI2i7
         AexLdwrRZ3GSfVnwZbUkjasyFx66FumbKvZtOY8UY2upl8NQcItRf27esyxLIf3LMsn/
         KASIamArTjWtOmlTZplj7TP9GamA9wdThqifrRwduLDLgE2mHGkn7AHEJmEGLXluW04E
         /+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160509; x=1776765309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmNa19N8+QZNP/ohDnpTlbvtv8o+CLutWIXJRtYFcvo=;
        b=JF6sK/KQ7sKDkpLzI2YvaoaGB+5sUyV3HyrA8QddFilWeVwDT17VwY/DrmTPv//DXW
         FvTERuWdNN7yyZ1+CAY54HMPVMd7io66WM3YsFpNZ1QRvo2VM1yx5b1MBwey8zWX+aRy
         sgxtUfgA3yZ/xWTj9xvpmyoj9HkTBrlzXKMlGSdtqcm3012RdqmnMc8u5ltyhpvIOmZ0
         OUnXDMMKWkBoh/J0Jzl3EjzCOtC5UekasNxJfeChLASkZogfpNBQBt5kzbrFeqG95F3j
         o/wdq8c1HtPPWYQHRP/zwKr3qxjYGzc8bjE/DaznliFBz6wjvlrSw+2Gc44dlOJKk1sA
         oRdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/diQFEGOqnVu/qmO4sCQbc0wOtkA7pwETPYWyekXoN5+8sIEAnsuuR7p2ZO9DA7kBvUwMczMdaX6s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8d21BojJiKZ6a0rpne3p78+coi/EsrqEGJ4eM+k9XyLCZO78X
	OdXlL+N+p1R0jaTjDWMy/FEY2UfPDXcR19CXjn9Dw+J1144kYrev34rC
X-Gm-Gg: AeBDieszcmSi+Pe5QzVzXRUYePhi6FBUmErnFs3lnZ4+Qop3/XREWAQyGyC+x18EK6l
	SWLQPYZTYvcCTDzZmPgkNy153Vd4IJdKsHP63kfRrNcmsG3CPG+6qqzE/RxhErQYK2vbHyKZj+x
	g526mLSVQwKEq9lQCj0uOUwEmIF3uOb5We6ydZbeUTacTMWXI1uU+kjzMSsxRjLo6nEYlT1ADd6
	rwCABiAOGTiMc8pI1TSqTw0O0VW++yEtbhGEfkrl64EN2glainxRnWZTZ5MkngZ5383YUsYU1vd
	A0Xgt5qztG2pauEh+n7KXMlZUx3QcMQs+jkuJdwhvgjdNbXoh9Z5ez8d6ah01+zBevf2iZ2Kmkw
	stlHxl/x+/IEYepqqzh0WkeqU3Efphk4qflx7sVxXUdsJovmJa4rhA16Oxe5lu7Qog5+x3bVwea
	8JPGl8dPQfjkJtggzkg14Q7GDDDlV20NPLwfeQbS0Q8ToJ8Qzb
X-Received: by 2002:a05:600c:3acf:b0:485:35a4:939f with SMTP id 5b1f17b1804b1-488d68a8275mr189524385e9.28.1776160508268;
        Tue, 14 Apr 2026 02:55:08 -0700 (PDT)
Message-ID: <c97f9f2e-f98a-4dfc-9c49-4c0ebd6af9d5@gmail.com>
Date: Tue, 14 Apr 2026 12:55:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/drivers/char/cadence-uart: fix IRQ
 registration failure propagation
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1775742562.git.oleksii_moisieiev@epam.com>
 <f8ad018f3cd8930f7efddb362b889f0afec2408a.1775742562.git.oleksii_moisieiev@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <f8ad018f3cd8930f7efddb362b889f0afec2408a.1775742562.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1776160509-158EC185-A8684F2B/0/0
X-purgate-type: clean
X-purgate-size: 2910
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 064E83F84C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/9/26 16:50, Oleksii Moisieiev wrote:

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
> 
> 
>   xen/drivers/char/cadence-uart.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/drivers/char/cadence-uart.c b/xen/drivers/char/cadence-uart.c
> index b2f379833f..a63dc4adb2 100644
> --- a/xen/drivers/char/cadence-uart.c
> +++ b/xen/drivers/char/cadence-uart.c
> @@ -72,13 +72,18 @@ static void __init cuart_init_postirq(struct serial_port *port)
>       struct cuart *uart = port->uart;
>       int rc;
>   
> -    if ( uart->irq > 0 )
> +    /* Don't unmask interrupts if no valid irq was provided */
> +    if ( uart->irq <= 0 )

But irq field is defined as an unsigned int. By definition, an unsigned 
int can never be less than zero.

> +        return;
> +
> +    uart->irqaction.handler = cuart_interrupt;
> +    uart->irqaction.name    = "cadence-uart";
> +    uart->irqaction.dev_id  = port;
> +    if ( (rc = setup_irq(uart->irq, 0, &uart->irqaction)) != 0 )
>       {
> -        uart->irqaction.handler = cuart_interrupt;
> -        uart->irqaction.name    = "cadence-uart";
> -        uart->irqaction.dev_id  = port;
> -        if ( (rc = setup_irq(uart->irq, 0, &uart->irqaction)) != 0 )
> -            printk("ERROR: Failed to allocate cadence-uart IRQ %d\n", uart->irq);
> +        printk("ERROR: Failed to allocate cadence-uart IRQ %d\n", uart->irq);

NIT: The format specifier should be %u

> +        /* Do not unmask interrupts if irq handler wasn't set */
> +        return;
>       }
>   
>       /* Clear pending error interrupts */


I notice that with this change, the block that clears pending error 
interrupts is now skipped if setup_irq() fails or if no valid IRQ is 
provided. Is this intentional / OK?
In "[PATCH v2 1/4] xen/drivers/char: fix SCIF IRQ registration failure 
propagation", the error status registers are always cleared, even on 
failure.








