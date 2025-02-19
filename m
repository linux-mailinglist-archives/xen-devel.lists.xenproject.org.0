Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 249DCA3C3D4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 16:40:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893172.1302097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkmBV-00037P-Id; Wed, 19 Feb 2025 15:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893172.1302097; Wed, 19 Feb 2025 15:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkmBV-00035M-Fv; Wed, 19 Feb 2025 15:40:25 +0000
Received: by outflank-mailman (input) for mailman id 893172;
 Wed, 19 Feb 2025 15:40:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVer=VK=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tkmBT-00035G-DY
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 15:40:23 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3653b97-eed7-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 16:40:20 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-54529eeb38aso5408107e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 07:40:20 -0800 (PST)
Received: from [192.168.10.20] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54527244fd7sm1908723e87.12.2025.02.19.07.40.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 07:40:16 -0800 (PST)
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
X-Inumbo-ID: d3653b97-eed7-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739979620; x=1740584420; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nBZ2QplkN2iUFpL2ckcvVaKGz2cgabcY/SEfg8eEHTQ=;
        b=Bbe3hyqeHL5S7A98pcOuTnnmjqytQSk7Isq7fs5epKQojmi91ga3i3D8LWfKRzj2sz
         NWmnJWGhoFBcRZx2g7VxG3D2umK5dlsQLLQK9QHtHAu70oCUY/ewolcQS1i/fdhAsn63
         zUvoywtTkN37IC65wR0jTYZlsQyFnP6cicek73wwWDTHElnEMuepWh/qP5PJQjoVNgdd
         SToqpvf2/4Dbz67K5rVQyYzEvsyBs33qYb6zvOSLLbKjT3Pjzf9gU5aRNivxA+FKIvC1
         d5Dc9rNUOKBKIgYFnue0soHzperst3i8n99LsZCjmNOMIeWYJUv6r8tMGRdkuv/x0bry
         XHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739979620; x=1740584420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nBZ2QplkN2iUFpL2ckcvVaKGz2cgabcY/SEfg8eEHTQ=;
        b=iJ0+f4ECs+V1xkGxlGOMNY5yUuaUhHxL+ctRNA6O4jmXZtGlIf3D1xokYPN+UvK7oV
         /imXiSDtBfxFgLP6HDSUebA16wGkXc7Q/xqJvx05zuq0XPsPkmIRgVCzAjNHyDykf6Kk
         lDo6CZp7Zvm56HC13l7DtI3b6QgeQqO0f1FB6uHywCbpxQRqFSGOJOYhrP0eUjb9ycvH
         R7WfC/YEIDbK0KKDJ5EWexrYUQSWpd8TiMkagPz4VCnd6QUGUC47OhzA/vPrRysIEcE7
         PY9m6XqSYAY5NtIeTEGW8yG9Ohr26pkxpLzL9EfrKx0eEdqwWLCeBYUlL2b/fzDdothy
         OqVg==
X-Forwarded-Encrypted: i=1; AJvYcCXKhqQEssoZQKJu1t0clv+f5mJ99WFRMAtiU/6zTTg/GaJPmZRf4MG1Kso82NzH4aImmDk9Q9AoBzA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGOlkzLRHFRVeIW0BiBFe8JlESKAywsEGueyW0FKZU9a39Qr4q
	nui8p51JcgiX65MBKao5459xnwQFg5Ztk46yEaKM8ceHE2Z7L2Q1
X-Gm-Gg: ASbGncuHc9TWYfsziyXGpRDOsuAMjyWWoV2WVyeHEWOu0bhECriuiKhXycRjQcFX+5p
	zHbvkTY+gRvq4bg/CO4A3O8mrYCVfeUYRA/dwwx2oM0ZNOTp1cBNCkGFewWL0FpmnNVu9PX63qZ
	8MsY78Si+Ky053b2H130PGtx5QPpQeF09xmayDejnqY6+YTCrmz9d4yA25tZ/aBrWjvUdFIJwVA
	nX8GSlXUywSzdZLibgEWYNTXWXKa+JcKb3fQZZ1++pB8DCkMGyDUwr8Ai3lXuiz7hpk1+oe45wx
	L7yfV75G1DMIOj5G
X-Google-Smtp-Source: AGHT+IHG9N879p1H0KL44/zC+58OW6GKFg7PXm5vBKK9YeN0hzzdOlB63C8DNoAXDRKJxgdCjKaxrA==
X-Received: by 2002:a05:6512:3e23:b0:545:3032:6093 with SMTP id 2adb3069b0e04-5462eeda292mr1751904e87.8.1739979618050;
        Wed, 19 Feb 2025 07:40:18 -0800 (PST)
Message-ID: <c9404f41-2279-46f3-b21a-be4151d878e0@gmail.com>
Date: Wed, 19 Feb 2025 17:40:15 +0200
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
Content-Language: en-US
From: Oleksandr Andrushchenko <andr2000@gmail.com>
In-Reply-To: <fd81810c-80de-40c9-8324-9e5bbdaaff11@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19.02.25 16:05, Jan Beulich wrote:
> On 19.02.2025 14:52, Oleksandr Andrushchenko wrote:
>> On 19.02.25 15:18, Jan Beulich wrote:
>>> On 19.02.2025 13:39, Oleksandr Andrushchenko wrote:
>>>> On 17.02.25 12:20, Jan Beulich wrote:
>>>>> On 16.02.2025 11:21, Oleksandr Andrushchenko wrote:
>>>>>> @@ -248,8 +249,9 @@ static int cf_check ns16550_tx_ready(struct serial_port *port)
>>>>>>         if ( ns16550_ioport_invalid(uart) )
>>>>>>             return -EIO;
>>>>>>     
>>>>>> -    return ( (ns_read_reg(uart, UART_LSR) &
>>>>>> -              uart->lsr_mask ) == uart->lsr_mask ) ? uart->fifo_size : 0;
>>>>>> +    return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
>>>>>> +               ? uart->fifo_size
>>>>>> +               : 0;
>>>>> Indentation of the ? and : lines is clearly wrong here? What is the tool
>>>>> doing?
>>>> There are number of options that have influence on this formatting:
>>>> AllowShortBlocksOnASingleLine [4]
>>>> BreakBeforeTernaryOperators [5]
>>>> AlignOperands [6]
>>>>
>>>> I was not able to tweak these options to have the previous form.
>>> Right, sticking to the original form (with just the stray blanks zapped)
>>> would of course be best. Yet again - the tool is doing more transformations
>>> despite there not being any need. If, however, it does so, then one of my
>>> expectations would be that the ? and : are properly indented:
>>>
>>>       return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
>>>              ? uart->fifo_size
>>>              : 0;
>> This only differs from what the tool is doing by the fact it applies
>> the following rule: *IndentWidth: 4*, e.g. it has indented your construct
>> by 4 spaces, see [1]. Which, IMO, is acceptable change.
> I don't view this as acceptable. It falls in the same class then as
>
>      ns_write_reg(uart,
>                   UART_FCR,
>                   UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
>                       UART_FCR_TRG14);
>
> that I also commented on in my initial reply.
Ok, then how would you have it defined in the coding style as a rule?
Such a diversity in defining indentation? So, will you have a dedicated
rule for the ternary?
>
>>> or
>>>
>>>       return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
>>>              ? uart->fifo_size : 0;
>>>
>>> or
>>>
>>>       return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask
>>>               ? uart->fifo_size
>>>               : 0);
>>>
>>> (not going to list more variants which are all okay).
>>>
>>> In any event, a fundamental requirement of mine is that such a tool would
>>> only apply adjustments when and where style is actively violated. I.e. in
>>> the case here:
>>>
>>>      return ((ns_read_reg(uart, UART_LSR) &
>>>               uart->lsr_mask) == uart->lsr_mask) ? uart->fifo_size : 0;
>>>
>>> That's not overly neat wrapping, but in line with our style. If the other
>>> form was demanded going forward, I'd be curious how you'd verbally
>>> describe the requirement in ./CODING_STYLE.
>> I believe this can be stated around the fact that we need to indent,
>> e.g. apply the same rule as for other constructs already in use
> Except here the tool didn't merely adjust indentation, but moved tokens
> between lines.
Again, if it moves, but doesn't break the style - then it is going to happen
only once while applying big-scary-patch.
>
>>>>>> @@ -275,9 +277,10 @@ static void pci_serial_early_init(struct ns16550 *uart)
>>>>>>     #ifdef NS16550_PCI
>>>>>>         if ( uart->bar && uart->io_base >= 0x10000 )
>>>>>>         {
>>>>>> -        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>>>>>> -                                  uart->ps_bdf[2]),
>>>>>> -                         PCI_COMMAND, PCI_COMMAND_MEMORY);
>>>>>> +        pci_conf_write16(
>>>>>> +            PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1], uart->ps_bdf[2]),
>>>>>> +            PCI_COMMAND,
>>>>>> +            PCI_COMMAND_MEMORY);
>>>>>>             return;
>>>>>>         }
>>>>> Hmm, transforming a well-formed block into another well-formed one. No
>>>>> gain? (Same again further down.)
>>>> No, gain from human point of view
>>>> But there is a gain that it is now formatted automatically.
>>> See above: I'd first like to see a written, textual description for all these
>>> requirements. After all it needs to be possible for a human to write code
>>> that the tool then wouldn't try to re-arrange. Which in turn requires that
>>> the restrictions / constraints on the layout are spelled out.
>> Agree, the existing coding style document will require some extension:
>> at least clarifications and addition of the rules not described yet.
>>>    I'm not looking
>>> forward to pass all my patches through such a tool. I can write style-
>>> conforming code pretty well, with - of course - occasional oversights,
>> Which the tool will allow not to have for less accurate developers
> I fear I don't understand this reply of yours.
I mean that you can write such a well formatted code without any tool.
But there are others who can't. Then the tool will help others to avoid
code style violations.
>
>>>    right
>>> now. And that in multiple projects all with different styles. I expect to be
>>> in the position to do so also going forward. This, imo, requires that there
>>> be left some room for variations. Which in turn requires that the tool would
>>> leave alone anything that is not in conflict with the written down or defacto
>>> style.
>> Not sure it is possible with any tool at all: it just makes the changes
>> without distinguishing what can be skipped or not even if it does not
>> violate the rules. It will always seek to improve or "improve" the
>> code
> Which by now I view as the core problem.
It depends. If this is the change made once, then I don't see it as
a lifetime problem.
>
>>>>>> @@ -1706,7 +1704,7 @@ static void __init ns16550_parse_port_config(
>>>>>>         if ( !parse_namevalue_pairs(str, uart) )
>>>>>>             return;
>>>>>>     
>>>>>> - config_parsed:
>>>>>> +config_parsed:
>>>>> This is a no-go - ./CODING_STYLE specifically says why this isn't appropriate.
>>>> Yes, it can't formatted as we wish. This is controlled with IndentGotoLabels [10]
>>>> and is a binary option, which leaves no means to disable it as both true and
>>>> false will re-format the code
>>>>
>>>> true:false:
>>>> intf(){vs.intf(){
>>>> if(foo()){if(foo()){
>>>> label1:label1:
>>>> bar();bar();
>>>> }}
>>>> label2:label2:
>>>> return1;return1;
>>>> }}
>>> If there was some indentation meant to be in that blob, it was all lost,
>>> I'm afraid.
>> Yes, sorry about that. The sample I was trying to put can be found at [2]
> Funny, even with the setting "true" label2 there is unindented. We demand that
> all labels be indented, even when - contextually - at function scope. (Nor do
> we demand that labels be indented according to their - contextual - scope.)
It seems that other projects (coding styles) see the alignment at function
scope differently. From Xen. If it was not implemented before in clang-format
could mean that either no other project use such an exception or there
are not so many projects use clang-format and didn't obviously face such
an issue
>
> Jan
Thank you,
Oleksandr

