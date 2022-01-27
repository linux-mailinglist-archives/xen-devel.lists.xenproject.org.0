Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B732F49EAFA
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 20:24:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261714.453370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDANg-0006q0-8e; Thu, 27 Jan 2022 19:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261714.453370; Thu, 27 Jan 2022 19:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDANg-0006mz-5N; Thu, 27 Jan 2022 19:24:28 +0000
Received: by outflank-mailman (input) for mailman id 261714;
 Thu, 27 Jan 2022 19:24:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NFuB=SL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nDANf-0006mt-3r
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 19:24:27 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd4f4f66-7fa6-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 20:24:26 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id x23so7439449lfc.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jan 2022 11:24:25 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v29sm1708667ljv.72.2022.01.27.11.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 11:24:24 -0800 (PST)
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
X-Inumbo-ID: bd4f4f66-7fa6-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HjUKTB0LO38Oq7kA6GWyOqES6oITlEIqKghOGUitPmM=;
        b=If5IjESYuCuDd6wvxK2q2J5tVPPswjhZBJX9HKoDQ4enB/Y531drShAKaVsogMPI98
         R41Xc2dEcoWjMdOjL4mpwPfkIPID0EGelNW63bc6SHpkNHlBdYXM9kdkYQ0vHcwhxYoA
         vvSsPKTO2d1Z/I0kCU8D4t7d+Rjz3gesdUjqLFX1hpzjzIzGeUrNCsrG5rcJi+odWp+W
         TkR+PEBK+G01u/jZVgVoLFc7yuSLwHFOYWX77J8c/rzkxlQKkjp1uQiDf6XIexo40uFQ
         jYZkvfflVn/XXzD8JXIFUF5ZN73C9Vz7XD8vGRuiI6edCqbUwGqPCvIke5dSI/h65i//
         oJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HjUKTB0LO38Oq7kA6GWyOqES6oITlEIqKghOGUitPmM=;
        b=QIeMjgiiwdu5pQaYtzIECJniosR/l7nsQ+skW1onfPmmQ/6iZ3Ndwf4V8hqE5ACVj/
         jBkLy6MCVzZT8+y/J29dpHJGg6AG4AA9rNFSJjENLVqOwpPObp5iAvCgQ39zmY3b2n/k
         QdLN+cK7+ARRw8x2N+BsJGYbYjRijwQshpugO5dfqNBnCw7h+Il1AlqLvlEflhFpTI2z
         yY0LqMQ8uMkOokhzu9xL7FeJclitm6aXRxz/M9NkZRlXxSaU7G/EaOHsx26L9k/JIKey
         9qj7fQjvf3tlZrrV5YDuEH8rEARPFhnXAPMb3I4Nsf9pYRV7M0mgarnGn9Cm5B0YMMf9
         icBA==
X-Gm-Message-State: AOAM531gIWFgM4O9kruA1w7mWE+UVqI1q8ALNyCXyVxK77Ja2Obt8Fw6
	KAxxzofgYV0/hlJKWyE3S2E=
X-Google-Smtp-Source: ABdhPJzFqGceXuqeuVWeqtX4kYiufTB1c5cw1KhmqEwJtl/Tgye5Lh/6zJsJgQyskC2Ypef6jjrMdQ==
X-Received: by 2002:a05:6512:3184:: with SMTP id i4mr3743519lfe.275.1643311465258;
        Thu, 27 Jan 2022 11:24:25 -0800 (PST)
Subject: Re: [PATCH] xen/serial: scif: add support for HSCIF
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
References: <20220127170008.271723-1-volodymyr_babchuk@epam.com>
 <87ee4tgkr3.fsf@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <9b2091c6-8749-98a9-3d57-650d7045c2e5@gmail.com>
Date: Thu, 27 Jan 2022 21:24:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87ee4tgkr3.fsf@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 27.01.22 19:18, Volodymyr Babchuk wrote:

Hi Volodymyr

> Hi Julien, Bertrand,
>
> Sorry, I messed up with your e-mail addresses in the previous
> email. Adding you correctly.
>
> Volodymyr Babchuk <volodymyr_babchuk@epam.com> writes:
>
>> HSCIF is a high-speed variant of Renesas SCIF serial interface. From
>> Xen point of view, they almost the same, only difference is in FIFO
>> size.
>>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> ---
>>   xen/drivers/char/scif-uart.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
>> index ee204a11a4..8f4485bdfc 100644
>> --- a/xen/drivers/char/scif-uart.c
>> +++ b/xen/drivers/char/scif-uart.c
>> @@ -47,6 +47,7 @@ enum port_types
>>   {
>>       SCIF_PORT,
>>       SCIFA_PORT,
>> +    HSCIF_PORT,
>>       NR_PORTS,
>>   };
>>   
>> @@ -88,6 +89,17 @@ static const struct port_params port_params[NR_PORTS] =
>>                           SCASCR_BRIE,
>>           .fifo_size    = 64,
>>       },
>> +    [HSCIF_PORT] =
>> +    {
>> +        .status_reg   = SCIF_SCFSR,
>> +        .tx_fifo_reg  = SCIF_SCFTDR,
>> +        .rx_fifo_reg  = SCIF_SCFRDR,
>> +        .overrun_reg  = SCIF_SCLSR,
>> +        .overrun_mask = SCLSR_ORER,
>> +        .error_mask   = SCFSR_PER | SCFSR_FER | SCFSR_BRK | SCFSR_ER,
>> +        .irq_flags    = SCSCR_RIE | SCSCR_TIE | SCSCR_REIE,
>> +        .fifo_size    = 128,
>> +    },
>>   };
>>   
>>   static void scif_uart_interrupt(int irq, void *data, struct cpu_user_regs *regs)
>> @@ -288,6 +300,7 @@ static const struct dt_device_match scif_uart_dt_match[] __initconst =
>>   {
>>       { .compatible = "renesas,scif",  .data = &port_params[SCIF_PORT] },
>>       { .compatible = "renesas,scifa", .data = &port_params[SCIFA_PORT] },
>> +    { .compatible = "renesas,hscif", .data = &port_params[HSCIF_PORT] },
>>       { /* sentinel */ },
>>   };


nit: I would also update description string at the beginning of that file.

  Driver for SCIF(A) ... ---> Driver for (H)SCIF(A) ...


With or without that change:

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


>
-- 
Regards,

Oleksandr Tyshchenko


