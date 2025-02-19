Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB93AA3C097
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 14:53:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892962.1301904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkkVV-0001x6-HN; Wed, 19 Feb 2025 13:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892962.1301904; Wed, 19 Feb 2025 13:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkkVV-0001v7-Ct; Wed, 19 Feb 2025 13:52:57 +0000
Received: by outflank-mailman (input) for mailman id 892962;
 Wed, 19 Feb 2025 13:52:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVer=VK=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tkkVT-0001uv-CA
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 13:52:55 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d101c5be-eec8-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 14:52:54 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-546237cd3cbso3403714e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 05:52:53 -0800 (PST)
Received: from [192.168.10.20] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545287271b7sm1827471e87.123.2025.02.19.05.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 05:52:52 -0800 (PST)
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
X-Inumbo-ID: d101c5be-eec8-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739973173; x=1740577973; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5tcbPHKxVBBB64V0JRSLnKE+CSlqJmAgpIqr7YCU1mc=;
        b=nO+2ShE/7so7ZJD6Yu/XFY22A35hioxyp9hVLqeIIKizPuZsreDYAoCbh5EaaQl0WD
         hFQRnkm7ZbEEfALPrPQUO3xYsfEJPZfIiLM+TWm53bnxJ1VFoUWwSHAW+8MZFt78BBeH
         /+9BwYEbW0wpoO/oZCik4r8OZwOaiQ9BX6Xr0/ly2dmaIeNedqJjJoLpSPCH9GqaB1gG
         U+4+SVSF/pUO0SO2ZIwpKYOApH90GGq5sxHNGT4VYTqHGpfL6LZVyotTHwY1NajTNBFD
         KpHg/JQJA3Xk4JDa9RJEv7Q5Vdtg1hv9hhfX2UKFe8ng5JU6mLIIWwUgwnwOuiLF8UPq
         lSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739973173; x=1740577973;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5tcbPHKxVBBB64V0JRSLnKE+CSlqJmAgpIqr7YCU1mc=;
        b=R5Qo5XlirRIlvkOxtcrDCTceEPZeshqqYbiiMxPNf5Mzy8PXEN7cob4OxMOOXVc7pQ
         2KGm+CUt/qJACZ5jpKrHN/hZ/tK7bGjEVMzNKSjF+PpS6fFbTi2u1tcaYMuHS+HIPo4H
         MR7Vz7wTLtKxxsB+Z1zI6J7dAZ3yIk1Mih3XBoMqsvQcB83ocYh6n3nR/ASi2LzAKJeh
         N9vdnupBKXAQOfHr+h+Xyl4pr628lQ13OrQ4rcFtAwbWw7R/36XjEkD2OiEtxBsxeVD1
         CUUHsmkoSeA4NuqgG0AW4b96twQ5BPXTkFTA2aM4S14th6j/mTSzLnyTg22lTGesy56k
         TVKw==
X-Forwarded-Encrypted: i=1; AJvYcCVyYmPbwT/UsZja04HLzLQ0ojkYc7WCSUvXTPjm7kuylnQ8lWfpcDx5rQ+eOyAbNv5xD3BQRY2mNbo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx38dba3R06YlmzUJJuFSK1XiD9OeVyElxZGh8rfj6K5Lqannu+
	lzr0GpApB397glKnCJkgle9sjYWxLElpsJrF1CQ3SSA34nf3anLp
X-Gm-Gg: ASbGncuF4usq9HRArSrZ8XEgdvIOfLlDNn7uHSHuuIaM00EfZdzj2gUyOYFQD6qf0gM
	qeznk6dz9jvdvjoiqHnSDy2kJvl7LRaFtknqCBOCf5TiJeKt8j+MrvAqdosXJX5K9nzQ38L/GRa
	D8lbKDdH30ERer8oTd+HUgyzeoQVxcxzdOvKYkcGdIB/7p6E4L3wMmSJ/2qFrkxB4QtqXMaByIU
	jPkZEF7GXedVJP+mtP2F5Jj79ZEN6WS4QmuFzuqziIAXfFrJIbXxS63N9BOqlxkZ/NpV2P7njon
	5CsLjmDlcjvTBfpk
X-Google-Smtp-Source: AGHT+IG10ZAcPrr0b3AUrF9hhKYRX64Kz2lYR4zAOanisCkpZA8QjX2v29wfM/u07+NSnx/XLynEeA==
X-Received: by 2002:a05:6512:2823:b0:545:842:fd32 with SMTP id 2adb3069b0e04-5452fe4646emr6560691e87.19.1739973173130;
        Wed, 19 Feb 2025 05:52:53 -0800 (PST)
Message-ID: <85fa3476-c360-4049-9376-ef342883b864@gmail.com>
Date: Wed, 19 Feb 2025 15:52:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 1/2] code style: Format ns16550 driver
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, Artem_Mygaiev@epam.com, Luca.Fancellu@arm.com,
 roger.pau@citrix.com, marmarek@invisiblethingslab.com,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 xen-devel@lists.xenproject.org
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <20250216102108.2665222-2-andr2000@gmail.com>
 <5ed54fcf-d4fd-4ec0-8c40-1e50d9b16ae2@suse.com>
 <6f133e51-17b5-4edf-8db3-5c9b91028898@gmail.com>
 <b1b07d0a-06e7-4509-bb21-d5d6ac849252@suse.com>
Content-Language: en-US
In-Reply-To: <b1b07d0a-06e7-4509-bb21-d5d6ac849252@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, Jan!

On 19.02.25 15:18, Jan Beulich wrote:
> On 19.02.2025 13:39, Oleksandr Andrushchenko wrote:
>> On 17.02.25 12:20, Jan Beulich wrote:
>>> On 16.02.2025 11:21, Oleksandr Andrushchenko wrote:
>>>> @@ -43,12 +43,12 @@
>>>>    
>>>>    static struct ns16550 {
>>>>        int baud, clock_hz, data_bits, parity, stop_bits, fifo_size, irq;
>>>> -    u64 io_base;   /* I/O port or memory-mapped I/O address. */
>>>> +    u64 io_base; /* I/O port or memory-mapped I/O address. */
>>>>        u64 io_size;
>>>>        int reg_shift; /* Bits to shift register offset by */
>>> Breaking alignment between comments (also in the immediately following hunk),
>>> while at the same time ...
>> This one...
>>>>        int reg_width; /* Size of access to use, the registers
>>>>                        * themselves are still bytes */
>>> ... not taking care of the comment style violation here?
>> This is controlled by ReflowComments option [3]:
>>
>>   From the tool point of view the comment is formatted correctly
>> I didn't find a way to convert such comments into
>> /*
>>    * Size of access to use, the registers * themselves are still bytes */ if this is what you mean.
> Above you see what I received. I can't really deduce from this what
> formatting you suggested. In the case at hand, though, I think it's not
> the best idea anyway to put a multi-line comment past a declaration (or
> statement).
Sorry, for the formatting
>         /*
>          * Size of access to use, the registers
>          * themselves are still bytes
>          */
This is what I was trying to send
>         int reg_width;
>
> is what I think would be better in such a case (artificially keeping
> this to be multi-line, even if it looks as if it might fit on just one
> line then).
>
>>>> @@ -248,8 +249,9 @@ static int cf_check ns16550_tx_ready(struct serial_port *port)
>>>>        if ( ns16550_ioport_invalid(uart) )
>>>>            return -EIO;
>>>>    
>>>> -    return ( (ns_read_reg(uart, UART_LSR) &
>>>> -              uart->lsr_mask ) == uart->lsr_mask ) ? uart->fifo_size : 0;
>>>> +    return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
>>>> +               ? uart->fifo_size
>>>> +               : 0;
>>> Indentation of the ? and : lines is clearly wrong here? What is the tool
>>> doing?
>> There are number of options that have influence on this formatting:
>> AllowShortBlocksOnASingleLine [4]
>> BreakBeforeTernaryOperators [5]
>> AlignOperands [6]
>>
>> I was not able to tweak these options to have the previous form.
> Right, sticking to the original form (with just the stray blanks zapped)
> would of course be best. Yet again - the tool is doing more transformations
> despite there not being any need. If, however, it does so, then one of my
> expectations would be that the ? and : are properly indented:
>
>      return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
>             ? uart->fifo_size
>             : 0;
This only differs from what the tool is doing by the fact it applies
the following rule: *IndentWidth: 4*, e.g. it has indented your construct
by 4 spaces, see [1]. Which, IMO, is acceptable change.

> or
>
>      return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
>             ? uart->fifo_size : 0;
>
> or
>
>      return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask
>              ? uart->fifo_size
>              : 0);
>
> (not going to list more variants which are all okay).
>
> In any event, a fundamental requirement of mine is that such a tool would
> only apply adjustments when and where style is actively violated. I.e. in
> the case here:
>
>     return ((ns_read_reg(uart, UART_LSR) &
>              uart->lsr_mask) == uart->lsr_mask) ? uart->fifo_size : 0;
>
> That's not overly neat wrapping, but in line with our style. If the other
> form was demanded going forward, I'd be curious how you'd verbally
> describe the requirement in ./CODING_STYLE.
I believe this can be stated around the fact that we need to indent,
e.g. apply the same rule as for other constructs already in use
>
>>>> @@ -275,9 +277,10 @@ static void pci_serial_early_init(struct ns16550 *uart)
>>>>    #ifdef NS16550_PCI
>>>>        if ( uart->bar && uart->io_base >= 0x10000 )
>>>>        {
>>>> -        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>>>> -                                  uart->ps_bdf[2]),
>>>> -                         PCI_COMMAND, PCI_COMMAND_MEMORY);
>>>> +        pci_conf_write16(
>>>> +            PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1], uart->ps_bdf[2]),
>>>> +            PCI_COMMAND,
>>>> +            PCI_COMMAND_MEMORY);
>>>>            return;
>>>>        }
>>> Hmm, transforming a well-formed block into another well-formed one. No
>>> gain? (Same again further down.)
>> No, gain from human point of view
>> But there is a gain that it is now formatted automatically.
> See above: I'd first like to see a written, textual description for all these
> requirements. After all it needs to be possible for a human to write code
> that the tool then wouldn't try to re-arrange. Which in turn requires that
> the restrictions / constraints on the layout are spelled out.
Agree, the existing coding style document will require some extension:
at least clarifications and addition of the rules not described yet.
>   I'm not looking
> forward to pass all my patches through such a tool. I can write style-
> conforming code pretty well, with - of course - occasional oversights,
Which the tool will allow not to have for less accurate developers
>   right
> now. And that in multiple projects all with different styles. I expect to be
> in the position to do so also going forward. This, imo, requires that there
> be left some room for variations. Which in turn requires that the tool would
> leave alone anything that is not in conflict with the written down or defacto
> style.
Not sure it is possible with any tool at all: it just makes the changes
without distinguishing what can be skipped or not even if it does not
violate the rules. It will always seek to improve or "improve" the
code
>
>>>> @@ -335,14 +338,14 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
>>>>        else
>>>>        {
>>>>            /* Baud rate already set: read it out from the divisor latch. */
>>>> -        divisor  = ns_read_reg(uart, UART_DLL);
>>>> +        divisor = ns_read_reg(uart, UART_DLL);
>>>>            divisor |= ns_read_reg(uart, UART_DLM) << 8;
>>> An example where tabulation is being broken. There are quite a bit worse
>>> ones further down.
>> This one will be impossible to implement with clang-format IMO.
>> Because there are cases where you want this (like above) and you know why:
>> the assignments look prettier here that way. But this doesn't mean
>> that in some other places other assignments will look got for you if
>> formatted the same way.
>> The question here what is the metric (human perception?) in this case
>> and how this perception can be be programmed into clang-format
>> configuration?
> Which imo is a pretty strong argument against using any auto-formatting. At
> least up to the point where AI would end up being smart enough to mimic this
> human perception.
Well, you already have the answer: only human or AI? Obviously, this
cannot be done with any of the tools, IMO
>
>>>> @@ -350,8 +353,10 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
>>>>        ns_write_reg(uart, UART_MCR, UART_MCR_DTR | UART_MCR_RTS);
>>>>    
>>>>        /* Enable and clear the FIFOs. Set a large trigger threshold. */
>>>> -    ns_write_reg(uart, UART_FCR,
>>>> -                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
>>>> +    ns_write_reg(uart,
>>>> +                 UART_FCR,
>>>> +                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
>>>> +                     UART_FCR_TRG14);
>>> What's the underlying indentation rule here? The way it's re-formatted
>>> certainly looks odd to me. What we occasionally do in such cases is add
>>> parentheses:
>>>
>>>       ns_write_reg(uart,
>>>                    UART_FCR,
>>>                    (UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
>>>                     UART_FCR_TRG14));
>>>
>>> Also - does the format they apply demand one argument per line? Else
>>> why not
>>>
>>>       ns_write_reg(uart, UART_FCR,
>>>                    (UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
>>>                     UART_FCR_TRG14));
>>>
>>> Plus what's their criteria to choose between this style of function calls
>>> and the one in context higher up for calls to pci_conf_write16()?
>> This is controlled with AlignAfterOpenBracket [7]
>> So this could be:
>> *AlignAfterOpenBracket: Align*
>>
>> -    ns_write_reg(uart, UART_FCR,
>> -                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
>> +    ns_write_reg(uart,
>> +                 UART_FCR,
>> +                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
>> +                     UART_FCR_TRG14);
> As before indentation is bogus here, ...
>
>> *AlignAfterOpenBracket: |DontAlign*
>>
>> -    ns_write_reg(uart, UART_FCR,
>> -                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
>> +    ns_write_reg(uart,
>> +        UART_FCR,
>> +        UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
> ... and even more so here, ...
>
>> |*AlignAfterOpenBracket: |AlwaysBreak*
>>
>> -    ns_write_reg(uart, UART_FCR,
>> -                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
>> +    ns_write_reg(
>> +        uart,
>> +        UART_FCR,
>> +        UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
> ... while this at least matches one of the forms we might presently use.
> Yet again - there was nothing wrong with the original layout.
So, we can stick with this option setting: AlignAfterOpenBracket: AlwaysBreak
>
>> |*AlignAfterOpenBracket: |BlockIndent*
>>
>> -    ns_write_reg(uart, UART_FCR,
>> -                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
>> +    ns_write_reg(
>> +        uart,
>> +        UART_FCR,
>> +        UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14
>> +    );
> This clearly moves too far away from our present style.
>
>>>> @@ -1706,7 +1704,7 @@ static void __init ns16550_parse_port_config(
>>>>        if ( !parse_namevalue_pairs(str, uart) )
>>>>            return;
>>>>    
>>>> - config_parsed:
>>>> +config_parsed:
>>> This is a no-go - ./CODING_STYLE specifically says why this isn't appropriate.
>> Yes, it can't formatted as we wish. This is controlled with IndentGotoLabels [10]
>> and is a binary option, which leaves no means to disable it as both true and
>> false will re-format the code
>>
>> true:false:
>> intf(){vs.intf(){
>> if(foo()){if(foo()){
>> label1:label1:
>> bar();bar();
>> }}
>> label2:label2:
>> return1;return1;
>> }}
> If there was some indentation meant to be in that blob, it was all lost,
> I'm afraid.
Yes, sorry about that. The sample I was trying to put can be found at [2]
>   Still: The name of the control being IndentGotoLabels and it
> being of boolean nature as you say, why would it do anything with an
> already-indented label?
Not really: unfortunately it is not an enum which would have "Leave" option
both true and false values *will* apply formatting, but different
>
> Jan
Thank you,
Oleksandr
[1] https://clang.llvm.org/docs/ClangFormatStyleOptions.html#indentwidth
[2] https://clang.llvm.org/docs/ClangFormatStyleOptions.html#indentgotolabels

