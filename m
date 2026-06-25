Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S3X6Iyw8PWpSzwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 16:33:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBE56C6AC9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 16:33:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Zko7r+yG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345678.1604471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcl7m-0006RX-No; Thu, 25 Jun 2026 14:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345678.1604471; Thu, 25 Jun 2026 14:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcl7m-0006Or-KQ; Thu, 25 Jun 2026 14:32:14 +0000
Received: by outflank-mailman (input) for mailman id 1345678;
 Thu, 25 Jun 2026 14:32:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcl7l-0006Ol-I8
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 14:32:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcl7k-0038W0-5C
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 16:32:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d3be4-bab6-0a2a0a5309dd-0a2a4503e610-16
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 16:32:11 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d3beb-ec1a-0a2a45030019-d1558034dc11-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 16:32:11 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49258ac7294so14309565e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 07:32:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1ee01c6csm16755030f8f.14.2026.06.25.07.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 07:32:10 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782397931; x=1783002731; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/liUJLF7TlYWbOabsKpGvAzaswY3tOi0vTFxHzDXPdY=;
        b=Zko7r+yGmw4LxndaMGmpsCGmK692D83V1eC8x8QDSbwy3lggDVvFWTWQdUamHf9r4X
         Ot7LMXskgZbW1k2YI5pIBO0iGPRjZ8KUOUxsnfClDwhieF4IY0xomdlE1NAvF333H1fu
         01k5E87d73/8UOh4/FJ/XtRSOFpc9ScTzON0klAr+8vS7zLKZGZgSgdkCQRoazocTKTo
         aJR+VwXbYgmVhEwqEd2ZLDWZH5nKJwcDnEA+Am+UUBpV8Jbr8HxAMaj1dC3/faoGU/Ib
         TCKQ+iQEQvvZAH9goJGt2HWz7FzrRwxIY0h9QydZ/9vcK4p61hewO1oPstA/PiTKqhWS
         Wtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782397931; x=1783002731;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/liUJLF7TlYWbOabsKpGvAzaswY3tOi0vTFxHzDXPdY=;
        b=lNDcrKEew2Kuu2xcHCDf7eJGHlieC/nukrVdfTvC+DISQfQ4TZEn5AV3vnZTtQzuND
         8DVn8G+gZ1wWrzdybCMsA9AklaeGA0Y/tGmZHM5zkm8os7gvpEeRseAPDPLSohGWz32k
         64TvopQeXP9aCjoSt/gyOCDjqRuxXJF5037mH5cS8Tj7N/EoKo++uONaiTB10XZFLBz/
         WnKCpD+Q6kgIwBrD24eyv7ENuTXtka66AL8s1P4taOJMzOJffxnuINcbY1kKMDvc7EsI
         +Yby6FxA5ScyYL3n7OSe9xXJ6RlNTlOt7gLPRjqnv3U95abHqPLEF5f5p09oRIcJVjLg
         6Vpw==
X-Forwarded-Encrypted: i=1; AFNElJ93dt8fsbL1vnSJC7iKbYItltLEUI3QzEesHpoDihqMPSWe12kQSu+zUh2TfvZpdopgODduQbEqlRs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzpf/Wgk5y1kg8KcrBDbQhfg765Pc2cQQfcJgqmGuSH5dHf+ot6
	Fx461OwB4+IK1OwnKnW1x2d18pxjrI8dwGvUkBWZ5DrLS8r+bPANRzyUYp2vm/aDLA==
X-Gm-Gg: AfdE7cmZwxtUOtmb3n5a5oSXYk1JuwDmRSDaw9uzyVqMWesoC0PtdyRm5RtK4cBgybi
	G8zxQQSmz4Uwza59/1vPWl91iL5Jc2Z9UWZtx/HQW6bLlIgdXrK2bZTGTq+6YxCoMmZc0BNqMTu
	wp2w78LgrDGSuA4LAywv7T/DMo9zlp0YtECta8bXGz4a/PynfnJeiHQq3o4tMLjgcWLGLvSfqMC
	EXS0uNNBSesz7H/JSv3ZfOizGqPQtvARfN8Ib4wVc5sVbyxvpSvqdalOUNObTx1AeF6FENyYYOd
	Ol45BoIibm1K7F4yaSs8YWsAFKK6kSOuWFIJzwPkl+0P7FT0NG9jwPJqpBl+Ma/wTLH15yM040T
	l/awzmT0+BIq3I0xVaOBhQWxZyHaKJtLhABxTRqN26Y1M/Ne5Fk5QTeQqirOjUicPrhymu73t20
	sXpa8giJ6hBbduzeq6zPNeN8dwaNYf00HOv8WTOnKGW7LSpbn01pfrw0gjX2Ddkb9Gve/J/SFY0
	eCJ+RttbHwmOy0=
X-Received: by 2002:a05:600d:844e:10b0:488:b187:3c with SMTP id 5b1f17b1804b1-49266869597mr30917225e9.14.1782397930992;
        Thu, 25 Jun 2026 07:32:10 -0700 (PDT)
Message-ID: <9db0885e-0257-40ec-bbf9-b242cd953e3a@suse.com>
Date: Thu, 25 Jun 2026 16:32:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] char/ns16550: bound execution time of
 ns16550_interrupt()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260623103145.76383-1-roger.pau@citrix.com>
 <06c8caab-4722-4b02-991f-bdc4a4ac0ea6@suse.com>
 <ajqVNtt02XMUGk-X@macbook.local>
 <cdf9f154-896d-4faa-8c76-ca15cf5e706e@suse.com>
 <ajqsQr-bhf4SGf8Q@macbook.local>
 <d7920786-7424-4634-80f0-994ea2857d1c@suse.com>
 <ajz-GVoEG4toMs3P@macbook.local>
 <2b574332-61f6-4a78-9dea-4b0973c8a3f1@suse.com>
 <aj0oEQ6_g94Rg83D@macbook.local>
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
In-Reply-To: <aj0oEQ6_g94Rg83D@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1782397931-059355D1-871AF04E/0/0
X-purgate-type: clean
X-purgate-size: 4981
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBBE56C6AC9

On 25.06.2026 15:07, Roger Pau Monné wrote:
> On Thu, Jun 25, 2026 at 01:31:26PM +0200, Jan Beulich wrote:
>> On 25.06.2026 12:08, Roger Pau Monné wrote:
>>> On Wed, Jun 24, 2026 at 10:01:36AM +0200, Jan Beulich wrote:
>>>> On 23.06.2026 17:54, Roger Pau Monné wrote:
>>>>> On Tue, Jun 23, 2026 at 04:27:12PM +0200, Jan Beulich wrote:
>>>>>> On 23.06.2026 16:16, Roger Pau Monné wrote:
>>>>>>> On Tue, Jun 23, 2026 at 03:44:06PM +0200, Jan Beulich wrote:
>>>>>>>> On 23.06.2026 12:31, Roger Pau Monne wrote:
>>>>>>>>> +    if ( uart->force_polling )
>>>>>>>>> +        return;
>>>>>>>>
>>>>>>>> As the IRQ was disabled, is this even possible? I.e. should this be some
>>>>>>>> kind of assertion or alike?
>>>>>>>
>>>>>>> Hm, I wasn't setting IRQ_DISABLED before, and hence needed this guard.
>>>>>>> But now with IRQ_DISABLED being set in ->status do_IRQ() should filter
>>>>>>> any stray interrupts.  I will attempt to add an ASSERT_UNREACHABLE()
>>>>>>> here.
>>>>>>
>>>>>> Simply ASSERT(!uart->force_polling) should do here? It is not wrong to
>>>>>> run the code below in release builds in such an event. If we kept getting
>>>>>> interrupts (perhaps at a high frequency) we'd be in trouble anyway.
>>>>>
>>>>> No, I'm afraid I can't do it like that, I can't put an ASSERT there,
>>>>> because we can still get into ns16550_interrupt() after the interrupt
>>>>> has been disabled.  In do_IRQ() we have the following loop:
>>>>>
>>>>>     while ( desc->status & IRQ_PENDING )
>>>>>     {
>>>>>         desc->status &= ~IRQ_PENDING;
>>>>>         spin_unlock_irq(&desc->lock);
>>>>>
>>>>>         tsc_in = tb_init_done ? get_cycles() : 0;
>>>>>         action->handler(irq, action->dev_id);
>>>>>         TRACE_TIME(TRC_HW_IRQ_HANDLED, irq, tsc_in, get_cycles());
>>>>>
>>>>>         spin_lock_irq(&desc->lock);
>>>>>     }
>>>>>
>>>>> So if the device is generating further interrupts in the window with
>>>>> IRQs enabled (while we execute the handler), we will keep looping
>>>>> around this, without taking into account the setting of IRQ_DISABLED.
>>>>
>>>> Ah yes.
>>>>
>>>>> This is something that we might want to fix, so that the loop is bound
>>>>> by IRQ_PENDING being set, and IRQ_DISABLED not, ie:
>>>>>
>>>>>     while ( (desc->status & (IRQ_PENDING | IRQ_DISABLED)) == IRQ_PENDING )
>>>>
>>>> Or perhaps ahead of the loop
>>>>
>>>>     desc->status &= ~IRQ_REPLAY;
>>>>
>>>>     if ( desc->status & IRQ_DISABLED )
>>>>         goto out;
>>>>
>>>>     desc->status |= IRQ_PENDING;
>>>>
>>>>     /*
>>>>      * Since we set PENDING, if another processor is handling a different
>>>>      * instance of this same irq, the other processor will take care of it.
>>>>      */
>>>>     if ( desc->status & IRQ_INPROGRESS )
>>>>         goto out;
>>>>
>>>>     desc->status |= IRQ_INPROGRESS;
>>>>
>>>> thus also having the comment no longer describe only part of the conditional.
>>>
>>> I think this is racy.  An interrupt hitting in the window with
>>> interrupts enabled ahead of the handler having set IRQ_DISABLED will
>>> still set IRQ_PENDING, and thus the loop would get executed a further
>>> time, and the handler called after IRQ_DISABLED having been set.
>>
>> Hmm, I don't quite agree with how you put it, but I think I see what you mean.
>> There's one question here, though: If PENDING is set first, and DISABLED only
>> later, shouldn't that IRQ instance still be handled? If so, ...
>>
>>> I think we need an extra condition in the loop, I see no way this can
>>> be solved only by dealing with the concurrent setting of IRQ_PENDING.
>>
>> ... such an extra condition would be wrong. If not, yes, I agree.
> 
> But PENDING is always set, regardless of whether the IRQ is disabled,
> the normal flow in do_IRQ() is:
> 
>     desc->status |= IRQ_PENDING;
> 
>     /*
>      * Since we set PENDING, if another processor is handling a different
>      * instance of this same irq, the other processor will take care of it.
>      */
>     if ( desc->status & (IRQ_DISABLED | IRQ_INPROGRESS) )
>         goto out;

Well, see the adjusted flow I did suggest earlier (still in context above).

> I think it's valid to have both PENDING and DISABLED set with the
> current logic.  In fact, the code in ack_edge_ioapic_irq() relies on
> having both PENDING and DISABLED set to mask the source, as the
> ->disable hook for edge triggered IO-APIC pins is a no-op.

Yet this can be of use for a corner case only anyway, as we set PENDING only
after having called ->ack(). That is, after setting PENDING _another_ IRQ
has to fire. Which is possible, but likely can be dealt with differently.

> We could likely change all this to be more straight forward, but as
> with the serial interrupt handling I would rather not do that change
> during a code freeze.

I definitely agree here. So perhaps indeed best to go with what you did
proposed.

Jan

