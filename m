Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89262A3BFB0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 14:19:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892899.1301840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjyZ-0001c6-Nh; Wed, 19 Feb 2025 13:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892899.1301840; Wed, 19 Feb 2025 13:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjyZ-0001Zz-Kg; Wed, 19 Feb 2025 13:18:55 +0000
Received: by outflank-mailman (input) for mailman id 892899;
 Wed, 19 Feb 2025 13:18:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkjyY-0001Zs-P4
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 13:18:54 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1038e7f1-eec4-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 14:18:52 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e05717755bso5078287a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 05:18:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece287d13sm10386002a12.68.2025.02.19.05.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 05:18:51 -0800 (PST)
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
X-Inumbo-ID: 1038e7f1-eec4-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739971132; x=1740575932; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=axaX5SCQsLv5QQj1jrwPXI1dR1nswFKtRDKdXXqgiQ4=;
        b=V/KtdVEuHqayl+7FIdQoC3x4jbd4Ja9X2BawNLOnwTP0m/bc17v2dZ6w6eqpBSeAER
         mJt6+aNxUhxKDw/0wcIJlFkgyZx6f/ewcdk+oxj+r9q94a5rWS50Z+3sNoxNL55/nfY9
         TWdhL1Jk6sHS2NqYTe4ukZsS+EGzHVwRZD9YHnng5m/XPDPr6OkfWIbYolzOUFOjUeO/
         yhFyuG//kMSEo8VqR6OVFzy1wr7luxZmpAaGfrcfYN3IYPfoyeK1JSxcIA5J9UC6JfB4
         KEoDa6CMpxlnw5abh2orvZB4aMld4k3m0wc79xXrfZ1WM/UNNSZnY4iYWZdh/CtScRyD
         ws3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739971132; x=1740575932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axaX5SCQsLv5QQj1jrwPXI1dR1nswFKtRDKdXXqgiQ4=;
        b=p5HYVlCXX9Nx+aU79eQETJ1oHechrovdMGul0pWQ+NUxSZfN2T6JKykvCdZ6khbfjn
         eYAg6nJQgr7Mapd2RPZdkRRNjCOkmHzu4DNmRp3KdkOhdNZhVEBV0OZeUtMjSKNg/7Wn
         Omisiw00PJYjWYarcnT3yzx5Co3NRIr6yluhppE6Dt97jejJA7n411XyaUDqWJ/lD2Tq
         bO5tPeTogBsMXEmwPPqA++jZB9tKxjeiAJ2kzU/6oXdvT5snudCGbFBL4PYj1IZAWo/0
         MPanTLrbm25h107DJo8r0ODtdQNHKnomR25WqrXhsGzHr3CqHcKNii4/GRRMH9Zp49aL
         mUCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX40WFuCcHaSewBeW+j0O6DRShjP5dn68w5Fa7m6oFj5YpDAzwlyLHIlGm2ixdEy5m7SYWFymN8iDo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMjB0lFPPnUCxzi4Rx6jUMwwIkCd9mNOqaqh2lWJADePszWynC
	damUA0O/+4hPxwUOJIq7fLByCLgTn5aZWyyPLget2QwQ0oXYjK+I5J6wFOD60A==
X-Gm-Gg: ASbGncvWNh6Wtt24iA2tNXTGEHBz7WU4UgX15H8OMb+ZkJkfLQaiWB6M9Mkkbku/xAV
	YA9+Y2uPo++rYuUQA7YdhT8S81XY1rXLNkMOgodSzItP4c7eZghJnUqkakQx2lT4Tf9GuQCdeec
	nZ9ZuNB93covEIGbJpG/emiGccqRyU3lDsDOCHfwTQru9XQPZT3fIzZoli+ah1PvWZP3Kh2DLJj
	9lUR2j17jP8CTxXEPx+LsHRvgyrTz87px9XV5Wpxvn+WCu7EMKFhQ4hxizNno7CJv/DsEzkoFzj
	VJg2ZWwIL5LGdSojzHHHlRAPSdqSTSRbrHV7DWznTixBPb4Hbg7Hfth5fmD9MatCeBPO4sTHvB5
	4
X-Google-Smtp-Source: AGHT+IG5HUe+vImsiE6uc30zXbKBpT3Wtj6YCuDECVSkJM6wSSNKfGBT3Y/uLnlYKsj7CwppHjKP9g==
X-Received: by 2002:a05:6402:3506:b0:5e0:8b68:ffae with SMTP id 4fb4d7f45d1cf-5e08b69553cmr2318397a12.17.1739971131949;
        Wed, 19 Feb 2025 05:18:51 -0800 (PST)
Message-ID: <b1b07d0a-06e7-4509-bb21-d5d6ac849252@suse.com>
Date: Wed, 19 Feb 2025 14:18:50 +0100
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
In-Reply-To: <6f133e51-17b5-4edf-8db3-5c9b91028898@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.02.2025 13:39, Oleksandr Andrushchenko wrote:
> On 17.02.25 12:20, Jan Beulich wrote:
>> On 16.02.2025 11:21, Oleksandr Andrushchenko wrote:
>>> @@ -43,12 +43,12 @@
>>>   
>>>   static struct ns16550 {
>>>       int baud, clock_hz, data_bits, parity, stop_bits, fifo_size, irq;
>>> -    u64 io_base;   /* I/O port or memory-mapped I/O address. */
>>> +    u64 io_base; /* I/O port or memory-mapped I/O address. */
>>>       u64 io_size;
>>>       int reg_shift; /* Bits to shift register offset by */
>> Breaking alignment between comments (also in the immediately following hunk),
>> while at the same time ...
> This one...
>>>       int reg_width; /* Size of access to use, the registers
>>>                       * themselves are still bytes */
>> ... not taking care of the comment style violation here?
> This is controlled by ReflowComments option [3]:
> 
>  From the tool point of view the comment is formatted correctly
> I didn't find a way to convert such comments into
> /*
>   * Size of access to use, the registers * themselves are still bytes */ if this is what you mean.

Above you see what I received. I can't really deduce from this what
formatting you suggested. In the case at hand, though, I think it's not
the best idea anyway to put a multi-line comment past a declaration (or
statement).

       /*
        * Size of access to use, the registers
        * themselves are still bytes
        */
       int reg_width;

is what I think would be better in such a case (artificially keeping
this to be multi-line, even if it looks as if it might fit on just one
line then).

>>> @@ -248,8 +249,9 @@ static int cf_check ns16550_tx_ready(struct serial_port *port)
>>>       if ( ns16550_ioport_invalid(uart) )
>>>           return -EIO;
>>>   
>>> -    return ( (ns_read_reg(uart, UART_LSR) &
>>> -              uart->lsr_mask ) == uart->lsr_mask ) ? uart->fifo_size : 0;
>>> +    return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
>>> +               ? uart->fifo_size
>>> +               : 0;
>> Indentation of the ? and : lines is clearly wrong here? What is the tool
>> doing?
> There are number of options that have influence on this formatting:
> AllowShortBlocksOnASingleLine [4]
> BreakBeforeTernaryOperators [5]
> AlignOperands [6]
> 
> I was not able to tweak these options to have the previous form.

Right, sticking to the original form (with just the stray blanks zapped)
would of course be best. Yet again - the tool is doing more transformations
despite there not being any need. If, however, it does so, then one of my
expectations would be that the ? and : are properly indented:

    return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
           ? uart->fifo_size
           : 0;

or

    return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
           ? uart->fifo_size : 0;

or

    return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask
            ? uart->fifo_size
            : 0);

(not going to list more variants which are all okay).

In any event, a fundamental requirement of mine is that such a tool would
only apply adjustments when and where style is actively violated. I.e. in
the case here:

   return ((ns_read_reg(uart, UART_LSR) &
            uart->lsr_mask) == uart->lsr_mask) ? uart->fifo_size : 0;

That's not overly neat wrapping, but in line with our style. If the other
form was demanded going forward, I'd be curious how you'd verbally
describe the requirement in ./CODING_STYLE.

>>> @@ -275,9 +277,10 @@ static void pci_serial_early_init(struct ns16550 *uart)
>>>   #ifdef NS16550_PCI
>>>       if ( uart->bar && uart->io_base >= 0x10000 )
>>>       {
>>> -        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>>> -                                  uart->ps_bdf[2]),
>>> -                         PCI_COMMAND, PCI_COMMAND_MEMORY);
>>> +        pci_conf_write16(
>>> +            PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1], uart->ps_bdf[2]),
>>> +            PCI_COMMAND,
>>> +            PCI_COMMAND_MEMORY);
>>>           return;
>>>       }
>> Hmm, transforming a well-formed block into another well-formed one. No
>> gain? (Same again further down.)
> No, gain from human point of view
> But there is a gain that it is now formatted automatically.

See above: I'd first like to see a written, textual description for all these
requirements. After all it needs to be possible for a human to write code
that the tool then wouldn't try to re-arrange. Which in turn requires that
the restrictions / constraints on the layout are spelled out. I'm not looking
forward to pass all my patches through such a tool. I can write style-
conforming code pretty well, with - of course - occasional oversights, right
now. And that in multiple projects all with different styles. I expect to be
in the position to do so also going forward. This, imo, requires that there
be left some room for variations. Which in turn requires that the tool would
leave alone anything that is not in conflict with the written down or defacto
style.

>>> @@ -335,14 +338,14 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
>>>       else
>>>       {
>>>           /* Baud rate already set: read it out from the divisor latch. */
>>> -        divisor  = ns_read_reg(uart, UART_DLL);
>>> +        divisor = ns_read_reg(uart, UART_DLL);
>>>           divisor |= ns_read_reg(uart, UART_DLM) << 8;
>> An example where tabulation is being broken. There are quite a bit worse
>> ones further down.
> This one will be impossible to implement with clang-format IMO.
> Because there are cases where you want this (like above) and you know why:
> the assignments look prettier here that way. But this doesn't mean
> that in some other places other assignments will look got for you if
> formatted the same way.
> The question here what is the metric (human perception?) in this case
> and how this perception can be be programmed into clang-format
> configuration?

Which imo is a pretty strong argument against using any auto-formatting. At
least up to the point where AI would end up being smart enough to mimic this
human perception.

>>> @@ -350,8 +353,10 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
>>>       ns_write_reg(uart, UART_MCR, UART_MCR_DTR | UART_MCR_RTS);
>>>   
>>>       /* Enable and clear the FIFOs. Set a large trigger threshold. */
>>> -    ns_write_reg(uart, UART_FCR,
>>> -                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
>>> +    ns_write_reg(uart,
>>> +                 UART_FCR,
>>> +                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
>>> +                     UART_FCR_TRG14);
>> What's the underlying indentation rule here? The way it's re-formatted
>> certainly looks odd to me. What we occasionally do in such cases is add
>> parentheses:
>>
>>      ns_write_reg(uart,
>>                   UART_FCR,
>>                   (UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
>>                    UART_FCR_TRG14));
>>
>> Also - does the format they apply demand one argument per line? Else
>> why not
>>
>>      ns_write_reg(uart, UART_FCR,
>>                   (UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
>>                    UART_FCR_TRG14));
>>
>> Plus what's their criteria to choose between this style of function calls
>> and the one in context higher up for calls to pci_conf_write16()?
> This is controlled with AlignAfterOpenBracket [7]
> So this could be:
> *AlignAfterOpenBracket: Align*
> 
> -    ns_write_reg(uart, UART_FCR,
> -                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
> +    ns_write_reg(uart,
> +                 UART_FCR,
> +                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
> +                     UART_FCR_TRG14);

As before indentation is bogus here, ...

> *AlignAfterOpenBracket: |DontAlign*
> 
> -    ns_write_reg(uart, UART_FCR,
> -                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
> +    ns_write_reg(uart,
> +        UART_FCR,
> +        UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);

... and even more so here, ...

> |*AlignAfterOpenBracket: |AlwaysBreak*
> 
> -    ns_write_reg(uart, UART_FCR,
> -                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
> +    ns_write_reg(
> +        uart,
> +        UART_FCR,
> +        UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);

... while this at least matches one of the forms we might presently use.
Yet again - there was nothing wrong with the original layout.

> |*AlignAfterOpenBracket: |BlockIndent*
> 
> -    ns_write_reg(uart, UART_FCR,
> -                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
> +    ns_write_reg(
> +        uart,
> +        UART_FCR,
> +        UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14
> +    );

This clearly moves too far away from our present style.

>>> @@ -1706,7 +1704,7 @@ static void __init ns16550_parse_port_config(
>>>       if ( !parse_namevalue_pairs(str, uart) )
>>>           return;
>>>   
>>> - config_parsed:
>>> +config_parsed:
>> This is a no-go - ./CODING_STYLE specifically says why this isn't appropriate.
> Yes, it can't formatted as we wish. This is controlled with IndentGotoLabels [10]
> and is a binary option, which leaves no means to disable it as both true and
> false will re-format the code
> 
> true:false:
> intf(){vs.intf(){
> if(foo()){if(foo()){
> label1:label1:
> bar();bar();
> }}
> label2:label2:
> return1;return1;
> }}

If there was some indentation meant to be in that blob, it was all lost,
I'm afraid. Still: The name of the control being IndentGotoLabels and it
being of boolean nature as you say, why would it do anything with an
already-indented label?

Jan

