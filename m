Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B02A3C458
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 17:02:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893192.1302117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkmWS-0007zn-CU; Wed, 19 Feb 2025 16:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893192.1302117; Wed, 19 Feb 2025 16:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkmWS-0007xf-9o; Wed, 19 Feb 2025 16:02:04 +0000
Received: by outflank-mailman (input) for mailman id 893192;
 Wed, 19 Feb 2025 16:02:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkmWQ-0007wP-QW
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 16:02:02 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da0f1849-eeda-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 17:02:00 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e050b1491eso1896443a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 08:02:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbe1326bd1sm96287566b.172.2025.02.19.08.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 08:01:59 -0800 (PST)
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
X-Inumbo-ID: da0f1849-eeda-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739980919; x=1740585719; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bC8qXE6n6SZ1/WCTj6zzXOOmGuUNWdwuqbGcJS5lMAU=;
        b=WFO9+XIm/LwDCEKIptkyBniIXrA+/NxEtw03nmpYKDiKO2Pyi96FYCoGSV2mLc62oA
         j6Dc11j+EYFYAQ0BdLIP3nps7iRC1CESwqf3MPKuERmEZw7oJRT63wAznGJTiMiaAa9V
         fF5aeAkDGfFPygFYxYRGUkE5aBZssyRfZc0WWK9CxDoH79rVYL9hD7CUq9LMAwxNA3FP
         FJv/52R4Ev+zNTRWIZlA0z5tESUXbqWZfAhSCN3TougNdx0F+eG+5/nNMZn/Zv5T/kjj
         hDZ+aCQaHjGZWAqLnU81GVeaGbamAMgTxaqz65gZ+A4wJheVIJI8xgfWK7YgMJPYK2tI
         EwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739980919; x=1740585719;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bC8qXE6n6SZ1/WCTj6zzXOOmGuUNWdwuqbGcJS5lMAU=;
        b=veK0IyRjse1KRipC7IM+0lGTbu1PREa3Z/vgyhRM0jury6MuriR5/tLBqDUpWkT8UN
         CqB2dDjOvHFD8E+dRwdPH73wDC0NzbJ57gaT1NWHlnLaAM2TcKxoUEvAoV6X819HNcDC
         MwVsXLCFpxHSFWKhexCGsxMv+5HekckDuw7Ke080U43H2/SOpPvdg7tjKPUBxJAucv2z
         6G5q+ez2qOozfwbmYc3M/Ms6DEze43U9zCZWFCg015PyTm73CUYx2jgccD84oGo+NFA0
         zlqRVbxxPJTJkV47GApyQ3nVWD3P2twhrLKrSJJSmvcAKP4AZdeK2HTc54nbR9c4MSYo
         SbDg==
X-Forwarded-Encrypted: i=1; AJvYcCXDU6KSYFLtQwmtATWn1PLYNnYqELvBAJgntIRf5ZdUx4PXJODmuqZQSjxCerbnaqp2/cegPeiB/nQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLZkI3ynR8uLbswnvU/dR/7e4IzWtJQr+I4QplceZLFW1t6lA3
	GmJAyE8ZMe4H4qFaBfs+myKi8mMWvsB/qqLnORj0o8jQaElZT0SlD8SoO5EbvA==
X-Gm-Gg: ASbGncv8yau+r7sGUrqZOKrA+tBrAw4CSZCcNhDvEl+JzjO+dYl1xJuQOCCQg6QNidZ
	u/zkGKbt0ZxsFxmmqipnF/FNQ8DIZK+ZoFjBut2mVFXPpn2Syq1M/IHtSe2gqIEwkNbheGzMo+f
	4CpuibD+f2And/aufylRvc/+EwwPWqw57NaXe8hJ2PEDAzvUH3AV4r/FcKg28ihMRQvz5Jn3D52
	3IM2VJsxin8Ye8dzXCvUq/qRnzxhtYctjYuw7JXRGg1bar51Q6r3bYoMQVDwAYXWbg9KSePw1wB
	QuBjTo5G4ymOVtltu6IXddrM9GAV3dqis4fTlsIWAd4WsQCxEqxsHztQHylQw5+SuKrl8aaC1pQ
	f
X-Google-Smtp-Source: AGHT+IHo2DNRtf9Jz59RYHNbkGg2N59XKdqUGyA5Z6mDlZeBlgLSZuc7snjSJAmbh8kWz+FxrtkNFg==
X-Received: by 2002:a17:906:1316:b0:abb:d158:2a00 with SMTP id a640c23a62f3a-abbd1582aedmr287848366b.8.1739980919539;
        Wed, 19 Feb 2025 08:01:59 -0800 (PST)
Message-ID: <6b8aa235-5415-4b59-bdd6-3e3a909fbdc4@suse.com>
Date: Wed, 19 Feb 2025 17:01:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] code style: Format ns16550 driver
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: sstabellini@kernel.org, Artem_Mygaiev@epam.com, Luca.Fancellu@arm.com,
 roger.pau@citrix.com, marmarek@invisiblethingslab.com,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 xen-devel@lists.xenproject.org
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <20250216102108.2665222-2-andr2000@gmail.com>
 <5ed54fcf-d4fd-4ec0-8c40-1e50d9b16ae2@suse.com>
 <6f133e51-17b5-4edf-8db3-5c9b91028898@gmail.com>
 <b1b07d0a-06e7-4509-bb21-d5d6ac849252@suse.com>
 <85fa3476-c360-4049-9376-ef342883b864@gmail.com>
 <fd81810c-80de-40c9-8324-9e5bbdaaff11@suse.com>
 <c9404f41-2279-46f3-b21a-be4151d878e0@gmail.com>
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
In-Reply-To: <c9404f41-2279-46f3-b21a-be4151d878e0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2025 16:40, Oleksandr Andrushchenko wrote:
> On 19.02.25 16:05, Jan Beulich wrote:
>> On 19.02.2025 14:52, Oleksandr Andrushchenko wrote:
>>> On 19.02.25 15:18, Jan Beulich wrote:
>>>> On 19.02.2025 13:39, Oleksandr Andrushchenko wrote:
>>>>> On 17.02.25 12:20, Jan Beulich wrote:
>>>>>> On 16.02.2025 11:21, Oleksandr Andrushchenko wrote:
>>>>>>> @@ -248,8 +249,9 @@ static int cf_check ns16550_tx_ready(struct serial_port *port)
>>>>>>>         if ( ns16550_ioport_invalid(uart) )
>>>>>>>             return -EIO;
>>>>>>>     
>>>>>>> -    return ( (ns_read_reg(uart, UART_LSR) &
>>>>>>> -              uart->lsr_mask ) == uart->lsr_mask ) ? uart->fifo_size : 0;
>>>>>>> +    return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
>>>>>>> +               ? uart->fifo_size
>>>>>>> +               : 0;
>>>>>> Indentation of the ? and : lines is clearly wrong here? What is the tool
>>>>>> doing?
>>>>> There are number of options that have influence on this formatting:
>>>>> AllowShortBlocksOnASingleLine [4]
>>>>> BreakBeforeTernaryOperators [5]
>>>>> AlignOperands [6]
>>>>>
>>>>> I was not able to tweak these options to have the previous form.
>>>> Right, sticking to the original form (with just the stray blanks zapped)
>>>> would of course be best. Yet again - the tool is doing more transformations
>>>> despite there not being any need. If, however, it does so, then one of my
>>>> expectations would be that the ? and : are properly indented:
>>>>
>>>>       return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
>>>>              ? uart->fifo_size
>>>>              : 0;
>>> This only differs from what the tool is doing by the fact it applies
>>> the following rule: *IndentWidth: 4*, e.g. it has indented your construct
>>> by 4 spaces, see [1]. Which, IMO, is acceptable change.
>> I don't view this as acceptable. It falls in the same class then as
>>
>>      ns_write_reg(uart,
>>                   UART_FCR,
>>                   UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
>>                       UART_FCR_TRG14);
>>
>> that I also commented on in my initial reply.
> Ok, then how would you have it defined in the coding style as a rule?
> Such a diversity in defining indentation? So, will you have a dedicated
> rule for the ternary?

Well, this feels like you're returning a request I made your way, elsewhere.
Our present, unwritten rule for wrapping lines is to match the earlier
line's indentation (or the start of the expression), plus accounting for any
pending open parentheses, braces, or brackets. Hence why some consider this
form

     ns_write_reg(uart,
                  UART_FCR,
                  (UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
                   UART_FCR_TRG14));

preferable, as some tools (iirc e.g. Andrew indicated his editor does) then
are capable of inferring the intended indentation from the pending open
parentheses.

>>>> That's not overly neat wrapping, but in line with our style. If the other
>>>> form was demanded going forward, I'd be curious how you'd verbally
>>>> describe the requirement in ./CODING_STYLE.
>>> I believe this can be stated around the fact that we need to indent,
>>> e.g. apply the same rule as for other constructs already in use
>> Except here the tool didn't merely adjust indentation, but moved tokens
>> between lines.
> Again, if it moves, but doesn't break the style - then it is going to happen
> only once while applying big-scary-patch.

As to that patch: To some degree I actually like the idea of following Linux
in generally not allowing style-only patches.

>>>>>>> @@ -275,9 +277,10 @@ static void pci_serial_early_init(struct ns16550 *uart)
>>>>>>>     #ifdef NS16550_PCI
>>>>>>>         if ( uart->bar && uart->io_base >= 0x10000 )
>>>>>>>         {
>>>>>>> -        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>>>>>>> -                                  uart->ps_bdf[2]),
>>>>>>> -                         PCI_COMMAND, PCI_COMMAND_MEMORY);
>>>>>>> +        pci_conf_write16(
>>>>>>> +            PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1], uart->ps_bdf[2]),
>>>>>>> +            PCI_COMMAND,
>>>>>>> +            PCI_COMMAND_MEMORY);
>>>>>>>             return;
>>>>>>>         }
>>>>>> Hmm, transforming a well-formed block into another well-formed one. No
>>>>>> gain? (Same again further down.)
>>>>> No, gain from human point of view
>>>>> But there is a gain that it is now formatted automatically.
>>>> See above: I'd first like to see a written, textual description for all these
>>>> requirements. After all it needs to be possible for a human to write code
>>>> that the tool then wouldn't try to re-arrange. Which in turn requires that
>>>> the restrictions / constraints on the layout are spelled out.
>>> Agree, the existing coding style document will require some extension:
>>> at least clarifications and addition of the rules not described yet.
>>>>    I'm not looking
>>>> forward to pass all my patches through such a tool. I can write style-
>>>> conforming code pretty well, with - of course - occasional oversights,
>>> Which the tool will allow not to have for less accurate developers
>> I fear I don't understand this reply of yours.
> I mean that you can write such a well formatted code without any tool.
> But there are others who can't. Then the tool will help others to avoid
> code style violations.

And it'll screw me up (and possibly others too).

Jan

