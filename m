Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D717682D527
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 09:41:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667208.1038243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPIWa-0008Hu-It; Mon, 15 Jan 2024 08:40:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667208.1038243; Mon, 15 Jan 2024 08:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPIWa-0008F5-Ek; Mon, 15 Jan 2024 08:40:52 +0000
Received: by outflank-mailman (input) for mailman id 667208;
 Mon, 15 Jan 2024 08:40:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPIWY-0008En-Vw
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 08:40:51 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8454c31-b381-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 09:40:49 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3373a30af67so7602178f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 00:40:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k20-20020a05600c1c9400b0040e54f15d3dsm18874249wms.31.2024.01.15.00.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 00:40:48 -0800 (PST)
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
X-Inumbo-ID: c8454c31-b381-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705308048; x=1705912848; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6QYpGqzwgqtT7SMPfxn3FeVOClAMt3sOK/qR9eQ9SI8=;
        b=GOC/TGCwuJ9LBqp7RJnkc61+yFWwRp8uFWnM1PDsN6sBdKk5P4qku7uFcMyndEbUeW
         hwGnZrCTJk2Y24M7F9oKJ7OlnzEsoMqmoU6H0gVz0raj0ZLW/MiQCfdRw5ierj4gpiM7
         4lS1Jj/4DtmlcOoZjSBrBL5Y4QkrG2sTKALHoGwOQ1KfbS5VHR9WtFMpw6l3fgn9JvEN
         lbezQzpD42o151lWZomA1PqDXCOrPTGCF3tNc6EnwvmN9jL+vdX6CaY5z8mpZ6hyjhrd
         oSKJ8kfMkoNAE7jVv0Lm7ZzBTsiFEVZR5PwRrgyLMstT+8NWFupd+3GslK/6jirBYUdT
         z9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705308048; x=1705912848;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6QYpGqzwgqtT7SMPfxn3FeVOClAMt3sOK/qR9eQ9SI8=;
        b=PXyZ3Te2x9MkOc+8Ivl6Oa48t+JxE5ElDzq89Jz22MLJ1bOfz0JJn+Y5CTn8MzryR0
         ItUraYOrApZQeOiLABYixQRPygBhPhRQ18VZ67yzKRQ+q/iHojsA07TrVI+1SFdXVDjG
         deC0Voh17m0Ha+5OvvgPlK71f5VzDNejHnojZHCko/pyD0br1gjC3h5gFRYVlLtqksoW
         nXE8M27NMAZ0SQjHkUs+TWG49yinLIeeORsuLs07cyt2+GPwtGpHuh1KWO3gTKRT2C1O
         OjbnREin+4cpNCpJMqGk2wAQgPDjJfn3ZRV9wrkkqjurIeYWT9hjpqQiO8NOZxtGwo1N
         Dauw==
X-Gm-Message-State: AOJu0YyPBlBtgaQc8ohXCUXZP3lHBE+pO8sok2rzR4yd3cbFbLP4o/Fx
	ry9EfqUgEdfYmY+rsNVfk04r39wGqW1A
X-Google-Smtp-Source: AGHT+IHoWrka2zHvPJJj4GaaYa7lgbvFhLZfPzIC79Elr7pOd4vk+oTSKRmN1V1Rmv5+FZzXjxXv1w==
X-Received: by 2002:a05:600c:54ef:b0:40e:55aa:3bc8 with SMTP id jb15-20020a05600c54ef00b0040e55aa3bc8mr1728598wmb.169.1705308048323;
        Mon, 15 Jan 2024 00:40:48 -0800 (PST)
Message-ID: <e37230c1-1ced-41af-adac-cad5fc2cb0e8@suse.com>
Date: Mon, 15 Jan 2024 09:40:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] serial: drop serial_[rt]x_interrupt()'s regs
 parameter
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
 <05b1284a-988c-4f91-9cde-4751332aaa96@suse.com>
 <485553fc-b91f-4a35-b01f-8bbd5964276b@citrix.com>
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
In-Reply-To: <485553fc-b91f-4a35-b01f-8bbd5964276b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.01.2024 19:07, Andrew Cooper wrote:
> On 11/01/2024 7:34 am, Jan Beulich wrote:
>> In the the polling functions (ab)using set_irq_regs() is necessary
>> to balance the change.
> 
> I have to admit that I don't know what "balance the change" is supposed
> to refer to in this context.

Maybe just a lack of proper English on my part. What I'm trying to say is
that the removal of the function parameter comes with the need to make
the pointer available via set_irq_regs() (which is, in a way at least, an
abuse of the function).

>> --- a/xen/drivers/char/ehci-dbgp.c
>> +++ b/xen/drivers/char/ehci-dbgp.c
>> @@ -1268,11 +1269,16 @@ static void cf_check _ehci_dbgp_poll(str
>>          spin_unlock_irqrestore(&port->tx_lock, flags);
>>      }
>>  
>> +    /* Mimic interrupt context. */
>> +    old_regs = set_irq_regs(regs);
>> +
>>      if ( dbgp->in.chunk )
>> -        serial_rx_interrupt(port, regs);
>> +        serial_rx_interrupt(port);
>>  
>>      if ( empty )
>> -        serial_tx_interrupt(port, regs);
>> +        serial_tx_interrupt(port);
>> +
>> +    set_irq_regs(old_regs);
> 
> Looking at this logic, it has occured to me that patch 2 probably ought
> to have ASSERT(!local_irqs_enabled()) in set_irq_regs().  While the main
> arch irq dispatch can reasonably have it as an implicit expectation,
> uses like this could do with the check.

Why would IRQs need to be off for set_irq_regs()? It's all a matter of
proper nesting, and any IRQ (nested into here or nested inside another
IRQ) would properly save/restore the outer context's pointer
(irrespective of what kind of context that actually is).

Note also how __ns16550_poll() doesn't itself disable interrupts.
While apparently not the case right now, I'm also of the opinion that
IRQs could in principle be turned back on transiently while handling
BUGFRAME_run_fn (and perhaps also BUGFRAME_warn).

> This construct is very nasty.  What actually needs it?
> 
> If it's only handle_keypress(), isn't there a latent issue between patch
> 3 and 5, given that patch 3 uses set_irq_regs() before this patch sets
> it up?

I think you're right - looks like I need to re-order (or fold, in case
there would then be a build issue).

> Might it be better to do this in the main handling of BUGFRAME_run_fn,
> rather than at a few select users?  We're already abusing
> BUGFRAME_run_fn to set up an IRQ-like context for these poll functions.

Hmm. It would then look at least a little less abusive, I suppose. Otoh
the handler function being passed registers is quite natural imo, for
being exception (not interrupt) related. Or are you suggesting to "pass"
registers both ways (i.e. keep the handler function parameter while
additionally also using set_irq_regs())? That would feel a little odd,
for being redundant.

Also I've never viewed use of BUGFRAME_run_fn here as having the purpose
of setting up an IRQ-like context. I've always understood it as merely a
means to get at a meaningful struct cpu_user_regs instance (i.e. covering
the case of running in idle vCPU context; see below). Much like
BUGFRAME_warn imo has only this as a purpose of involving generation of
an exception.

> I suppose a different question is what it would take to get rid of
> this.  Is it something a bit more cleanup would solve, or is there some
> more fundamental untangling required?

Well, what exactly is "this" here? Something needs to set the pointer,
even if I add a patch to switch handle_keypress() itself to not take a
regs parameter anymore.

>> --- a/xen/drivers/char/xhci-dbc.c
>> +++ b/xen/drivers/char/xhci-dbc.c
>> @@ -1175,10 +1176,15 @@ static void cf_check dbc_uart_poll(void
>>          spin_unlock_irqrestore(&port->tx_lock, flags);
>>      }
>>  
>> +    /* Mimic interrupt context. */
>> +    old_regs = set_irq_regs(guest_cpu_user_regs());
> 
> This is not a bug in your patch, but...
> 
> The use of guest_cpu_user_regs() here is different to all the other poll
> functions.  Is this actually correct?

I think it is okay-ish right now, but indeed I meant to have a post-
commit-message remark about this. In particular, ...

> If we're really in interrupt context and then we fake up a poll like
> this, then we don't have a total order of frames recorded in the
> irq_regs pointer.  I can't see a specific issue, but it also doesn't
> feel as if it is something we should allow.

... I don't see any ordering constraint. dbc_uart_poll() is a timer
handler, so will never itself run in interrupt context. And any IRQ
would cleanly nest. Nevertheless register state will likely not be
very meaningful when the timer ends up running in the context of an
idle vCPU. Marek, what's the background of you having done this
differently to other poll handlers?

Jan

