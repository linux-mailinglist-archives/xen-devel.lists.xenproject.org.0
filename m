Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 499D4B3B363
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 08:30:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100601.1453961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urscM-00072x-Tw; Fri, 29 Aug 2025 06:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100601.1453961; Fri, 29 Aug 2025 06:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urscM-0006zq-QL; Fri, 29 Aug 2025 06:29:46 +0000
Received: by outflank-mailman (input) for mailman id 1100601;
 Fri, 29 Aug 2025 06:29:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OeP6=3J=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1urscL-0006zk-0y
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 06:29:45 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c4d8889-84a1-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 08:29:42 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-55f4410f7c9so2098497e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 23:29:42 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f676dbb91sm389582e87.24.2025.08.28.23.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 23:29:41 -0700 (PDT)
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
X-Inumbo-ID: 8c4d8889-84a1-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756448982; x=1757053782; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kMcCZQ6c8ymlBTBy+VwpEVk0KKPxGqG9B3ghzAq7FEM=;
        b=IwOQkBBGBKQ8hJx9RURke0mjFvc5vLZGhnJryx0cIvI5fOdKyX0HObkxYIcYwuD6AK
         G3lzFj38FoTdX6jHeAGp9DeR2noPiq+SNFmbiKuLT78rBSM2Qpnn/sZhNE2IDz5p0LUT
         BUFeOmz76Y1d5WQEaIU5HSidIDYN9Tzb+usADGJJWsG4eQoD27ue5irfZ5mXdNpRNA9C
         tHNNiLpWb21hsdlYvC2JWqvZbx9Iwawyu/WuSOYNyMXV8ZdzZbXU/Tde6Ed8dBvGmc4W
         XYD1lotUbuUntOzBxKg4uFlxMAfSsB/J8/kRAX4M9cUXJGN4Fz9Axws4tZUwKkiwYgKl
         qipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756448982; x=1757053782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMcCZQ6c8ymlBTBy+VwpEVk0KKPxGqG9B3ghzAq7FEM=;
        b=Psh5MsBXJRO0KDzYMbsfc23ixOBsASzMhHGBBlNj1WKy0HI3FDrh8Y7+EEgSnxFKNl
         ky1tEOWASOyY9Pdjbc9ZLngOyBkvdQcdEMWoY5E4qUjKq6z+Kgo1EccxkRw8xzhj5jWv
         BXl5BNUlsYep570vHMNiuE2uPhSbdt9G/niKRpa/GBZhm/515jlfESMKHRkeBOYsBL0r
         oKeYaNsWDzGYmrQ0RfnlOZCSSZ2TKPhAa9/2NLes+9Wu6bAvPVxxQKrMhQH7AVbH86vH
         aOyPgCDvWBk9wnvHSwXyB+xBOScpYfrVFEVV9R9xJw+LiR4XIBWgaxcv6HSQ9jB0U12p
         SlGQ==
X-Gm-Message-State: AOJu0Yy0tiZtscYh2lgwW3PWxiLGqvAkLw9+MqiHpbbqd1SRzm4VRoES
	lxDYexq4L5ZyohlVxSVsd1UCoCgF3hRY9/cEu4UOhBYvcEQY13VK9dCa
X-Gm-Gg: ASbGncuepXvhlHoWKxLYKEtxy+v2RlKj3CflyQ+c96b7scqPhOAuwj/refoiD+JkFq3
	EnIL2nuj5mR/DNvKMvPKspJqr7nk5md81d1XlqhFtg9GmdNtbWo67w0b+I6Pc93gVLRaDd82cpG
	HREDPTmCUhHTXNtqvMpQbDgad1IDtf1xWRqZgDw0AZlAHUX2yDFwf2nhWRBVHMU/myOdZOPgj1v
	0rt5N43mT+TI+PiWHvOkU6SM9yxUwSJ2ohGumZNZWhUJCOeka9IiaCM4wQCWWrnSOYyNkra2LGA
	F476wEIflEmvMQu6vA3xt6yy3Mn9IcGe6x1SVzIi+w6aaWZALz8xT0hJ15WtMvLrkNqy0oJVxaz
	I9aFwzEKcSlMLf7rpraxIIHBFCBTkE4gKmgu4cyeEO8VARFc=
X-Google-Smtp-Source: AGHT+IEJFVdEAlxEqP7rIULQaNI4ss9DnnyGsnvHE47nJ8lz+ylG9RIzrBB+ytK3YyhCEbYYcEDkdA==
X-Received: by 2002:a05:6512:404b:b0:55f:501e:7bf7 with SMTP id 2adb3069b0e04-55f501e7df8mr3638562e87.57.1756448981731;
        Thu, 28 Aug 2025 23:29:41 -0700 (PDT)
Message-ID: <a564f8fd-2084-42c4-8d49-41be24c864f8@gmail.com>
Date: Fri, 29 Aug 2025 09:29:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/char: implement suspend/resume calls for SCIF
 driver
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>
References: <e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com>
 <60c0b456-bfda-430d-a1e9-f64c9a49ac54@gmail.com>
 <CAGeoDV9ov_SfbOFVGZ25a=-g9tjus6Wg2-8cXQaJDWk3_QOg1Q@mail.gmail.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <CAGeoDV9ov_SfbOFVGZ25a=-g9tjus6Wg2-8cXQaJDWk3_QOg1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 29.08.25 00:36, Mykola Kvach wrote:
> Hi Oleksandr,


Hello Mykola

> 
> Thank you for your review.
> 
> On Tue, Aug 26, 2025 at 6:51 PM Oleksandr Tyshchenko
> <olekstysh@gmail.com> wrote:
>>
>>
>>
>> On 07.08.25 08:16, Mykola Kvach wrote:
>>
>>
>> Hello Mykola,
>>
>> In general patch looks good to me, just one question below ...
>>
>>> From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>>
>>> Implement suspend and resume callbacks for the SCIF UART driver,
>>> enabled when CONFIG_SYSTEM_SUSPEND is set. This allows proper
>>> handling of UART state across system suspend/resume cycles.
>>>
>>> Tested on Renesas R-Car H3 Starter Kit.
>>>
>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>> ---
>>> In patch v5, there are no changes at all;
>>> it was done just to trigger a review.
>>
>> I think, you could ping on V4.
>>
>>
>>>
>>> In patch v4, enhance commit message, no functional changes
>>>
>>> In patch v2, I just added a CONFIG_SYSTEM_SUSPEND check around
>>> the suspend/resume functions in the SCIF driver.
>>> ---
>>>    xen/drivers/char/scif-uart.c | 40 ++++++++++++++++++++++++++++++++++--
>>>    1 file changed, 38 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
>>> index 757793ca45..888821a3b8 100644
>>> --- a/xen/drivers/char/scif-uart.c
>>> +++ b/xen/drivers/char/scif-uart.c
>>> @@ -139,9 +139,8 @@ static void scif_uart_interrupt(int irq, void *data)
>>>        }
>>>    }
>>>
>>> -static void __init scif_uart_init_preirq(struct serial_port *port)
>>> +static void scif_uart_disable(struct scif_uart *uart)
>>>    {
>>> -    struct scif_uart *uart = port->uart;
>>>        const struct port_params *params = uart->params;
>>>
>>>        /*
>>> @@ -155,6 +154,14 @@ static void __init scif_uart_init_preirq(struct serial_port *port)
>>>
>>>        /* Reset TX/RX FIFOs */
>>>        scif_writew(uart, SCIF_SCFCR, SCFCR_RFRST | SCFCR_TFRST);
>>> +}
>>> +
>>> +static void scif_uart_init_preirq(struct serial_port *port)
>>> +{
>>> +    struct scif_uart *uart = port->uart;
>>> +    const struct port_params *params = uart->params;
>>> +
>>> +    scif_uart_disable(uart);
>>>
>>>        /* Clear all errors and flags */
>>>        scif_readw(uart, params->status_reg);
>>> @@ -271,6 +278,31 @@ static void scif_uart_stop_tx(struct serial_port *port)
>>>        scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) & ~SCSCR_TIE);
>>>    }
>>>
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +
>>> +static void scif_uart_suspend(struct serial_port *port)
>>> +{
>>> +    struct scif_uart *uart = port->uart;
>>> +
>>> +    scif_uart_stop_tx(port);
>>
>>    ... I wonder, whether the call above (that disables Transmit
>> interrupt) is really needed as the call below disables all interrupts
>> anyway?
> 
> I have checked the relevant documentation and did not find any requirement
> to clear TIE before disabling the rest of the SCSCR bits, according to the
> R-Car Series, 3rd Generation User’s Manual: Hardware, Rev. 0.52.
> 
> However, based on how the serial subsystem works, I believe this call is
> justified.
> 
> Disabling TX IRQs before fully stopping the serial prevents new data
> from being added to the FIFO by the IRQ handler during suspend (see
> serial_tx_interrupt). This ensures the FIFO is flushed (loop inside
> scif_uart_disable) and no further transmissions occur.
> 
> If a flush handler were implemented for this driver, we could avoid
> calling scif_uart_stop_tx and remove the loop inside scif_uart_disable,
> as the flush handler would ensure the FIFO is empty after any invocation
> of serial_tx_interrupt.


thanks for the investigation, the explanation is ok to me.

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

> 
>>
>>
>>> +    scif_uart_disable(uart);
>>> +}
>>
>> [snip]
> 
> Best regards,
> Mykola


