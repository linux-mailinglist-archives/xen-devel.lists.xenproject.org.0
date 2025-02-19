Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE607A3C139
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 15:06:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892990.1301924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkki2-0004z6-SZ; Wed, 19 Feb 2025 14:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892990.1301924; Wed, 19 Feb 2025 14:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkki2-0004xe-Pk; Wed, 19 Feb 2025 14:05:54 +0000
Received: by outflank-mailman (input) for mailman id 892990;
 Wed, 19 Feb 2025 14:05:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkki1-0004xY-LP
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 14:05:53 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0f4a404-eeca-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 15:05:52 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5dee1626093so1746089a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 06:05:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e07f390626sm2379692a12.30.2025.02.19.06.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 06:05:51 -0800 (PST)
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
X-Inumbo-ID: a0f4a404-eeca-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739973952; x=1740578752; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0SYzosHLT6MkhwNtlqcGWLK0Z2qzAtwePu5mHAsTSjk=;
        b=RLkoyjt2Y8u44hd+NZIWo2anYCAEMjDV9b4LiRVq+OxQdHcWcNJCM6LPExCKASe7z8
         KvhNHmA6foUxHYnqTtQ7qz0KwRJYTNms7PCePRR3OABxTzeEXBfIUHO4a8BgyBZr5xWu
         TJduqTri7SYYiWr82EDJOZucSjm4syYSbuXMk8WwcO+Ir2sdOpGrnx75x68VKbRQQlhN
         Jc19IvIiHVRfmHIEtKOsZYyE031gOPQBxsLFQ0ylQleWWe9U408+X369yh3tXEEm5XgO
         USnZvjUWi4fjsa9hjq7Z7t0ncoR1JXj6OByZGPl3eHo3/kG00vm2nEJbRKXJwABKr6AB
         BPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739973952; x=1740578752;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SYzosHLT6MkhwNtlqcGWLK0Z2qzAtwePu5mHAsTSjk=;
        b=KLzi2U/Z+dq8nPjBRMPoJt6ipmkagIf0DxCBcCZlVV1sLq8fdwQ6br0rxLVwVUbDMm
         Dmrij4vDjC/dIL4I0LGiJU2YDUHlqIS3Bcvx3/X7nKLSuW3QHZi/VNGqbUFiQ0Cimwxl
         FDduO6KIEA1bd9BAqkYAxmCx/h5BzrUf8cYyE2ow1QgleTtcbASyTZN0txtmHnEwmd10
         OWZFXbQNF8S3rydGYgPtbgfuGUbFZDGYD7ajOuH06sv9R/4QdO4G5CuEGSgpxrXdTUfU
         wMKJd2y06USlLa9QxCEwg1ZetDIM2Vye/0QiN+LXvYf8ICDawuYeaUfK6zCKLIX/YRJO
         cDng==
X-Forwarded-Encrypted: i=1; AJvYcCX5pRFXbDRg35eOsFc7g2m1QJtGrre+eNFteSlc8OZAZtTdCj+y58xMxqbNjlr66gOdEHpaElFmTBI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLSeWwRkRasaP2JgpnHMsPsyjH8jNuulHawdt2/8Iwzp9yig+1
	LKojodpS90+YsG97x1CHWW2aBzwY5TV3HRN8hoJOpYB42TBoqBVimC5Q/Hx1PTx2Rvt+yXcdrQQ
	=
X-Gm-Gg: ASbGncu4iJxcLy37nex+M2UEH0XnIdi6cFChi9+mBD75frudweR01hGfblW/0Ye5n3K
	Rg8PdUj52NweNhG8mmDGzwim+bEstRnf0XeMojsJCalpHywPY1nNpQYAuuwPH/HkGn8oGP3mv+b
	wkJxEFAraQ2KhLJMhhhpHxCUn+s2t5QIhbVLATpxoNUO4iAR9dZRKsJtDOUxxhky0YIKkkYqxmZ
	VZnBMkKOt8PT5mGJdppgJbQa8VxVLSkmg14A+RAaVXDZbnJnne7EzStfoXqxGQs8blF8HdXaXG0
	2Q2m1vwqhXbVQFcmoHJych2HvJAi0hNrtLLJrix57MyMa5YIMuZIoxU2ABzEtIiJHMOxNWuYMz4
	9
X-Google-Smtp-Source: AGHT+IFyT3wfkv/3JfVY+rGXPweisHj85PjtgLC73CZQ3GBTrTYxHz9Si5j1f8zM+3141vH3r+jeqA==
X-Received: by 2002:a05:6402:4402:b0:5e0:2cd5:eb40 with SMTP id 4fb4d7f45d1cf-5e088db2766mr4049903a12.9.1739973951750;
        Wed, 19 Feb 2025 06:05:51 -0800 (PST)
Message-ID: <fd81810c-80de-40c9-8324-9e5bbdaaff11@suse.com>
Date: Wed, 19 Feb 2025 15:05:50 +0100
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
In-Reply-To: <85fa3476-c360-4049-9376-ef342883b864@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2025 14:52, Oleksandr Andrushchenko wrote:
> On 19.02.25 15:18, Jan Beulich wrote:
>> On 19.02.2025 13:39, Oleksandr Andrushchenko wrote:
>>> On 17.02.25 12:20, Jan Beulich wrote:
>>>> On 16.02.2025 11:21, Oleksandr Andrushchenko wrote:
>>>>> @@ -248,8 +249,9 @@ static int cf_check ns16550_tx_ready(struct serial_port *port)
>>>>>        if ( ns16550_ioport_invalid(uart) )
>>>>>            return -EIO;
>>>>>    
>>>>> -    return ( (ns_read_reg(uart, UART_LSR) &
>>>>> -              uart->lsr_mask ) == uart->lsr_mask ) ? uart->fifo_size : 0;
>>>>> +    return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
>>>>> +               ? uart->fifo_size
>>>>> +               : 0;
>>>> Indentation of the ? and : lines is clearly wrong here? What is the tool
>>>> doing?
>>> There are number of options that have influence on this formatting:
>>> AllowShortBlocksOnASingleLine [4]
>>> BreakBeforeTernaryOperators [5]
>>> AlignOperands [6]
>>>
>>> I was not able to tweak these options to have the previous form.
>> Right, sticking to the original form (with just the stray blanks zapped)
>> would of course be best. Yet again - the tool is doing more transformations
>> despite there not being any need. If, however, it does so, then one of my
>> expectations would be that the ? and : are properly indented:
>>
>>      return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
>>             ? uart->fifo_size
>>             : 0;
> This only differs from what the tool is doing by the fact it applies
> the following rule: *IndentWidth: 4*, e.g. it has indented your construct
> by 4 spaces, see [1]. Which, IMO, is acceptable change.

I don't view this as acceptable. It falls in the same class then as

    ns_write_reg(uart,
                 UART_FCR,
                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
                     UART_FCR_TRG14);

that I also commented on in my initial reply.

>> or
>>
>>      return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
>>             ? uart->fifo_size : 0;
>>
>> or
>>
>>      return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask
>>              ? uart->fifo_size
>>              : 0);
>>
>> (not going to list more variants which are all okay).
>>
>> In any event, a fundamental requirement of mine is that such a tool would
>> only apply adjustments when and where style is actively violated. I.e. in
>> the case here:
>>
>>     return ((ns_read_reg(uart, UART_LSR) &
>>              uart->lsr_mask) == uart->lsr_mask) ? uart->fifo_size : 0;
>>
>> That's not overly neat wrapping, but in line with our style. If the other
>> form was demanded going forward, I'd be curious how you'd verbally
>> describe the requirement in ./CODING_STYLE.
> I believe this can be stated around the fact that we need to indent,
> e.g. apply the same rule as for other constructs already in use

Except here the tool didn't merely adjust indentation, but moved tokens
between lines.

>>>>> @@ -275,9 +277,10 @@ static void pci_serial_early_init(struct ns16550 *uart)
>>>>>    #ifdef NS16550_PCI
>>>>>        if ( uart->bar && uart->io_base >= 0x10000 )
>>>>>        {
>>>>> -        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>>>>> -                                  uart->ps_bdf[2]),
>>>>> -                         PCI_COMMAND, PCI_COMMAND_MEMORY);
>>>>> +        pci_conf_write16(
>>>>> +            PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1], uart->ps_bdf[2]),
>>>>> +            PCI_COMMAND,
>>>>> +            PCI_COMMAND_MEMORY);
>>>>>            return;
>>>>>        }
>>>> Hmm, transforming a well-formed block into another well-formed one. No
>>>> gain? (Same again further down.)
>>> No, gain from human point of view
>>> But there is a gain that it is now formatted automatically.
>> See above: I'd first like to see a written, textual description for all these
>> requirements. After all it needs to be possible for a human to write code
>> that the tool then wouldn't try to re-arrange. Which in turn requires that
>> the restrictions / constraints on the layout are spelled out.
> Agree, the existing coding style document will require some extension:
> at least clarifications and addition of the rules not described yet.
>>   I'm not looking
>> forward to pass all my patches through such a tool. I can write style-
>> conforming code pretty well, with - of course - occasional oversights,
> Which the tool will allow not to have for less accurate developers

I fear I don't understand this reply of yours.

>>   right
>> now. And that in multiple projects all with different styles. I expect to be
>> in the position to do so also going forward. This, imo, requires that there
>> be left some room for variations. Which in turn requires that the tool would
>> leave alone anything that is not in conflict with the written down or defacto
>> style.
> Not sure it is possible with any tool at all: it just makes the changes
> without distinguishing what can be skipped or not even if it does not
> violate the rules. It will always seek to improve or "improve" the
> code

Which by now I view as the core problem.

>>>>> @@ -1706,7 +1704,7 @@ static void __init ns16550_parse_port_config(
>>>>>        if ( !parse_namevalue_pairs(str, uart) )
>>>>>            return;
>>>>>    
>>>>> - config_parsed:
>>>>> +config_parsed:
>>>> This is a no-go - ./CODING_STYLE specifically says why this isn't appropriate.
>>> Yes, it can't formatted as we wish. This is controlled with IndentGotoLabels [10]
>>> and is a binary option, which leaves no means to disable it as both true and
>>> false will re-format the code
>>>
>>> true:false:
>>> intf(){vs.intf(){
>>> if(foo()){if(foo()){
>>> label1:label1:
>>> bar();bar();
>>> }}
>>> label2:label2:
>>> return1;return1;
>>> }}
>> If there was some indentation meant to be in that blob, it was all lost,
>> I'm afraid.
> Yes, sorry about that. The sample I was trying to put can be found at [2]

Funny, even with the setting "true" label2 there is unindented. We demand that
all labels be indented, even when - contextually - at function scope. (Nor do
we demand that labels be indented according to their - contextual - scope.)

Jan

