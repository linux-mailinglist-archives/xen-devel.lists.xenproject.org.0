Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A787CA40D4D
	for <lists+xen-devel@lfdr.de>; Sun, 23 Feb 2025 08:53:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894869.1303536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tm6nx-0006MA-N3; Sun, 23 Feb 2025 07:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894869.1303536; Sun, 23 Feb 2025 07:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tm6nx-0006Ki-KD; Sun, 23 Feb 2025 07:53:37 +0000
Received: by outflank-mailman (input) for mailman id 894869;
 Sun, 23 Feb 2025 07:53:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=omsT=VO=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tm6nv-0006Kc-Ue
 for xen-devel@lists.xenproject.org; Sun, 23 Feb 2025 07:53:35 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47887f43-f1bb-11ef-9896-31a8f345e629;
 Sun, 23 Feb 2025 08:53:33 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-545fed4642aso3409869e87.0
 for <xen-devel@lists.xenproject.org>; Sat, 22 Feb 2025 23:53:33 -0800 (PST)
Received: from [192.168.10.20] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452e9932a6sm2620296e87.197.2025.02.22.23.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Feb 2025 23:53:31 -0800 (PST)
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
X-Inumbo-ID: 47887f43-f1bb-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740297213; x=1740902013; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jfmuHK1H9If2qcdgGnsOl5Qgl/Kcdr2H8/0d1jixcO4=;
        b=GC4MycmS//54JN7hPS80DeGLk4eslUs1EFw2fTeh76jLjlNiypf3fxDK+G9lMiZJgL
         k+BR0Bn364l27HRHxcfl63P1ZVltymfNVs2g/1kvcKxdAFo+eKRGvqxo3LUZ7RRlKF2G
         2F39ZpskgIC34vwL92qR/yP2zRkTapZQaSB1cq32ApngBRnB1OrNzRS7kzt/2SBRfvMN
         gbG2niPSwr71fM4qQwQFoRW1STIG90KdtHExZJtICO/xYcT1yh9cuFwvkR9qXySopExD
         TVM0dYBaNLhzyT3OpAjwQrdGU5nsmeoM7RGscPV7vsBq8SdfyLqEtNBtNLHAOFvGUvWP
         ltIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740297213; x=1740902013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jfmuHK1H9If2qcdgGnsOl5Qgl/Kcdr2H8/0d1jixcO4=;
        b=H+tFtfvdg5HXD2OZC6In8CVSxp+1Ky7rMn5QWucxbBJxgBoIQKYMtW7ULLtGHEMJTW
         hsZ/5NZoXin7ECimlo6kZtGcuiAHxV8fPqEUSMZ/S10DHUqa6ysvnSJnfBWRfmBGTz45
         Ew5KyTJZLok82uzeEwbG10IRGwhfGl2cRsiH7TQK+HbMRxgu73H2HnTj0CS30BZ7E4C4
         S/p3/O1q72MHxUQqKo/yENzDMgPmY+iI2302zHEah3lH9UFkwupeWrEw0qyK34vpPmq+
         jfLIoA+DrP9rj889/QZD0/Q9KZUKBBYoStOFF/BFEOnbImekjJKJnvgWCKbc0Gq+9+He
         20yA==
X-Forwarded-Encrypted: i=1; AJvYcCXgW4h2Cj2i30Rj4BrMV+MvJGZC1UOUEJ56yD4nEfNxBantdtZqeWaxo2zENTmIvDBFAvGAPJJl2w0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiHoo8ststDBwpzZzlJ2DBCvNj1SrHHB6HpejTYzMsm9rAQ1sS
	+jcBl+p9/E/tSxC9W0R/foQArpixvf6U4IS/ppaUX5cp7O2lXYCr
X-Gm-Gg: ASbGncuyhU4Qp0U8RwDwEx3QKqQbs9yYNjF0VqHm5QH11YFTz9GVHTv6ea0CoQw/9lC
	oxoAEKmCtkduChexvTDNbobXA2kWa1zaW1FiBru9/9/dfUbD6ouQ0CxJGUXae15iEoPzQsckdJu
	XNqvNcDJWa7Ot4q1IylQ0ntjQZgZAZSNlxrVp5tq5RLsQ3LGAd07NqKHzCYwxRycUtKwF+tWsFH
	Me9Ie6UckKXhNNwk/1BFQ/VcMf5QtkbMU9QEdo8mN5IcLs766Pm7kjxhjKRGoigwZ+V8siq98La
	r7RvjEbbXPa7iKQqJ8Geabbf3fE=
X-Google-Smtp-Source: AGHT+IHv/hdgMywHetGXVE1How74EJNyaD2QjgCxYt3uqhw0kP13XFoqsfgqqLlXl//FQTR29rlSTQ==
X-Received: by 2002:a05:6512:238a:b0:545:ea9:1a1e with SMTP id 2adb3069b0e04-54838ef5c21mr3524626e87.26.1740297212445;
        Sat, 22 Feb 2025 23:53:32 -0800 (PST)
Message-ID: <51e5994f-722a-499d-884e-9f299d091c99@gmail.com>
Date: Sun, 23 Feb 2025 09:53:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <85fa3476-c360-4049-9376-ef342883b864@gmail.com>
 <fd81810c-80de-40c9-8324-9e5bbdaaff11@suse.com>
 <c9404f41-2279-46f3-b21a-be4151d878e0@gmail.com>
 <6b8aa235-5415-4b59-bdd6-3e3a909fbdc4@suse.com>
Content-Language: en-US
From: Oleksandr Andrushchenko <andr2000@gmail.com>
In-Reply-To: <6b8aa235-5415-4b59-bdd6-3e3a909fbdc4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello, Jan!

On 19.02.25 18:01, Jan Beulich wrote:
> On 19.02.2025 16:40, Oleksandr Andrushchenko wrote:
>> On 19.02.25 16:05, Jan Beulich wrote:
>>> On 19.02.2025 14:52, Oleksandr Andrushchenko wrote:
>>>> On 19.02.25 15:18, Jan Beulich wrote:
>>>>> On 19.02.2025 13:39, Oleksandr Andrushchenko wrote:
>>>>>> On 17.02.25 12:20, Jan Beulich wrote:
>>>>>>> On 16.02.2025 11:21, Oleksandr Andrushchenko wrote:
>>>>>>>> @@ -248,8 +249,9 @@ static int cf_check ns16550_tx_ready(struct serial_port *port)
>>>>>>>>          if ( ns16550_ioport_invalid(uart) )
>>>>>>>>              return -EIO;
>>>>>>>>      
>>>>>>>> -    return ( (ns_read_reg(uart, UART_LSR) &
>>>>>>>> -              uart->lsr_mask ) == uart->lsr_mask ) ? uart->fifo_size : 0;
>>>>>>>> +    return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
>>>>>>>> +               ? uart->fifo_size
>>>>>>>> +               : 0;
>>>>>>> Indentation of the ? and : lines is clearly wrong here? What is the tool
>>>>>>> doing?
>>>>>> There are number of options that have influence on this formatting:
>>>>>> AllowShortBlocksOnASingleLine [4]
>>>>>> BreakBeforeTernaryOperators [5]
>>>>>> AlignOperands [6]
>>>>>>
>>>>>> I was not able to tweak these options to have the previous form.
>>>>> Right, sticking to the original form (with just the stray blanks zapped)
>>>>> would of course be best. Yet again - the tool is doing more transformations
>>>>> despite there not being any need. If, however, it does so, then one of my
>>>>> expectations would be that the ? and : are properly indented:
>>>>>
>>>>>        return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
>>>>>               ? uart->fifo_size
>>>>>               : 0;
>>>> This only differs from what the tool is doing by the fact it applies
>>>> the following rule: *IndentWidth: 4*, e.g. it has indented your construct
>>>> by 4 spaces, see [1]. Which, IMO, is acceptable change.
>>> I don't view this as acceptable. It falls in the same class then as
>>>
>>>       ns_write_reg(uart,
>>>                    UART_FCR,
>>>                    UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
>>>                        UART_FCR_TRG14);
>>>
>>> that I also commented on in my initial reply.
>> Ok, then how would you have it defined in the coding style as a rule?
>> Such a diversity in defining indentation? So, will you have a dedicated
>> rule for the ternary?
> Well, this feels like you're returning a request I made your way, elsewhere.
> Our present, unwritten rule for wrapping lines is to match the earlier
> line's indentation (or the start of the expression), plus accounting for any
> pending open parentheses, braces, or brackets. Hence why some consider this
> form
>
>       ns_write_reg(uart,
>                    UART_FCR,
>                    (UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
>                     UART_FCR_TRG14));
>
> preferable, as some tools (iirc e.g. Andrew indicated his editor does) then
> are capable of inferring the intended indentation from the pending open
> parentheses.
I do understand that the tool needs to do the job and be able to fit
any coding style exists and not vice versa. But this is only in an
ideal world which doesn't exist yet: those tools are also developed by
an open source community and they also have some limited bandwidth.
I mean that bot Xen and some magic tool might need to co-exist and
accept each other. Or just decide not to use any.
>>>>> That's not overly neat wrapping, but in line with our style. If the other
>>>>> form was demanded going forward, I'd be curious how you'd verbally
>>>>> describe the requirement in ./CODING_STYLE.
>>>> I believe this can be stated around the fact that we need to indent,
>>>> e.g. apply the same rule as for other constructs already in use
>>> Except here the tool didn't merely adjust indentation, but moved tokens
>>> between lines.
>> Again, if it moves, but doesn't break the style - then it is going to happen
>> only once while applying big-scary-patch.
> As to that patch: To some degree I actually like the idea of following Linux
> in generally not allowing style-only patches.
Well, yes. I can suggest that if we decide to provide a series of
style-only patches that we commit those with a fake authorship,
e.g. "Author: clang-format@xenproject.org"
>
>>>>>>>> @@ -275,9 +277,10 @@ static void pci_serial_early_init(struct ns16550 *uart)
>>>>>>>>      #ifdef NS16550_PCI
>>>>>>>>          if ( uart->bar && uart->io_base >= 0x10000 )
>>>>>>>>          {
>>>>>>>> -        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>>>>>>>> -                                  uart->ps_bdf[2]),
>>>>>>>> -                         PCI_COMMAND, PCI_COMMAND_MEMORY);
>>>>>>>> +        pci_conf_write16(
>>>>>>>> +            PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1], uart->ps_bdf[2]),
>>>>>>>> +            PCI_COMMAND,
>>>>>>>> +            PCI_COMMAND_MEMORY);
>>>>>>>>              return;
>>>>>>>>          }
>>>>>>> Hmm, transforming a well-formed block into another well-formed one. No
>>>>>>> gain? (Same again further down.)
>>>>>> No, gain from human point of view
>>>>>> But there is a gain that it is now formatted automatically.
>>>>> See above: I'd first like to see a written, textual description for all these
>>>>> requirements. After all it needs to be possible for a human to write code
>>>>> that the tool then wouldn't try to re-arrange. Which in turn requires that
>>>>> the restrictions / constraints on the layout are spelled out.
>>>> Agree, the existing coding style document will require some extension:
>>>> at least clarifications and addition of the rules not described yet.
>>>>>     I'm not looking
>>>>> forward to pass all my patches through such a tool. I can write style-
>>>>> conforming code pretty well, with - of course - occasional oversights,
>>>> Which the tool will allow not to have for less accurate developers
>>> I fear I don't understand this reply of yours.
>> I mean that you can write such a well formatted code without any tool.
>> But there are others who can't. Then the tool will help others to avoid
>> code style violations.
> And it'll screw me up (and possibly others too).
>
> Jan
Thank you,
Oleksandr

