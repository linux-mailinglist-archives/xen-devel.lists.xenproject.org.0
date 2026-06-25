Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PI/tD6gRPWpgwggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 13:31:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEC06C51EC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 13:31:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=cm8ixCmD;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345517.1604366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wciIt-0004iX-KS; Thu, 25 Jun 2026 11:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345517.1604366; Thu, 25 Jun 2026 11:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wciIt-0004gP-Gw; Thu, 25 Jun 2026 11:31:31 +0000
Received: by outflank-mailman (input) for mailman id 1345517;
 Thu, 25 Jun 2026 11:31:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wciIr-0004gJ-VD
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 11:31:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wciIq-0058Nf-P3
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 13:31:28 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d1180-2eae-0a2a0a5409dd-0a2a4508e876-26
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 13:31:28 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d1190-edec-0a2a45080019-d1558032b138-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 13:31:28 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso20420205e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 04:31:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4926494f129sm56477245e9.0.2026.06.25.04.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 04:31:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1782387088; x=1782991888; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OY7r1U0gGAiohaCiuxSYCxoIkrfuEH34le5ntfIu0M8=;
        b=cm8ixCmD3ZV9y45cLsdyTCqIHiw2+PfS+4ROSg7sFl5eIoBrQ36eiFsMquM7Zvf/J4
         qAuWQE1s9t1khu4HE4sBzDpKGpNMe58ujjwZqj5ksgccH36lz27HMoOi3HPU/u6B/eo/
         xl8aSmi1GDC8Rt2IdpyI0TDUcvki+no2CDDCbNBjkSt+0qykWBCWoNRrB5/8PUt0ELNH
         GkmNz82+IolDewuIcu0dBjfPwnz/25m2a33O15PjUbFlehfLGrxJp1IC+VBmox4G7Ovw
         z4b2BY2tgto8rtBUEyCJ2qhZaEM73hDM8k68ytms7yUw7HLhfJNBIgDGQ7mi6zWsfCs6
         wNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782387088; x=1782991888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OY7r1U0gGAiohaCiuxSYCxoIkrfuEH34le5ntfIu0M8=;
        b=UgmZ5IVMORgwCEJs6W3smhAljjWRtNzc/pwsbgfLMcxS9qckTm6DYKoHbQ4ScZ11Hk
         hiKDoKjnEdKmqW32hw7whyW/KrM188y2TzVkXIN0T7JpMLHoj4eSsaY7mguYsJgdM6ZQ
         IOU2y+EDH9xz3diXXVQYm5v+RnDog9Z+Z8yeCNiVg2OC7ptYkBpgijeU8Q6Vszdg75QF
         pvpMNM6FmruukWC8p+s1l1ca3/QWgvoTKSbQHI2UVcK4ffnKAtrzcI3V6W0jDDa2aSkc
         Vpm8lDFGxi/N4UNi12RQzg/Tt8WmVsKyXXZgeJnRbXDSD5UAtYeiw7LgfwgZi+bCMTvj
         JW3A==
X-Forwarded-Encrypted: i=1; AFNElJ9QlAfpobAvosi8itydPi3VrIy4YOvrHWUHizBHm11EBqPEnkJ2ETMPejKOr4BIwLcVMiIURuaQgjc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6WRpscBik+fUrnviClgEV4n7UdbhCGoQc9QBH9+fSdNl0TerV
	rwj6kKX5bsHsaG3PHhLp0um1dSGZSThcHgK8fukGR2+MhB30muf7wov3peOOqTP1Pg==
X-Gm-Gg: AfdE7cnLZyWCzPW3MTZOBoFnnAfDYFXOmI0ZoPehXkj1kVqBFhmC9puXsFzKT5lSRRM
	5cQByeTicF2cUbJJjtX8d+yHDVH/VrV1Ullgatb/JAGPmrgdzWZZZyBsK5WXG5dGpRFO2XRQ1Lz
	+8Rx4Wbyq0rbP66GkhLhy4McvqaDTaHa1vDRTrCPNR3dN4yfBAfftSfFU/194iksVu3ya41xR/8
	sT2HtImUeUuPJ7rDZ0EEctLuhneNs02n0ca/bboGcuR4RkNAkbpoZKyTyVEZMfrLFgeZL7oCRd2
	Fl5a3aLw4rqlAxvJjJJ97kSTfSAsatc4MYmO4A+lofDoJNHBMlDO0jcg4ch4F4LnDIKxco2lGBJ
	6F+DLaI2NunimWQ6BwiuJoou2LoosQpKa1jIcJXHwdau+wYJe5mdHeigUP0y6oXwX+5PZkvPUso
	ogDkAbWgtw6+sDwx7s48dTYOoCIbXKgZetOWnBXVtm2kOk3qqwxwDXsFl/ilB1gUWdYukXHr7L/
	7q+nZ3jYdyPSkc=
X-Received: by 2002:a05:600c:4fd2:b0:492:4948:bfce with SMTP id 5b1f17b1804b1-4926686f634mr26825595e9.16.1782387088092;
        Thu, 25 Jun 2026 04:31:28 -0700 (PDT)
Message-ID: <2b574332-61f6-4a78-9dea-4b0973c8a3f1@suse.com>
Date: Thu, 25 Jun 2026 13:31:26 +0200
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
In-Reply-To: <ajz-GVoEG4toMs3P@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1782387088-A19253FC-F2811ECB/0/0
X-purgate-type: clean
X-purgate-size: 3451
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
X-Rspamd-Queue-Id: 8DEC06C51EC

On 25.06.2026 12:08, Roger Pau Monné wrote:
> On Wed, Jun 24, 2026 at 10:01:36AM +0200, Jan Beulich wrote:
>> On 23.06.2026 17:54, Roger Pau Monné wrote:
>>> On Tue, Jun 23, 2026 at 04:27:12PM +0200, Jan Beulich wrote:
>>>> On 23.06.2026 16:16, Roger Pau Monné wrote:
>>>>> On Tue, Jun 23, 2026 at 03:44:06PM +0200, Jan Beulich wrote:
>>>>>> On 23.06.2026 12:31, Roger Pau Monne wrote:
>>>>>>> +    if ( uart->force_polling )
>>>>>>> +        return;
>>>>>>
>>>>>> As the IRQ was disabled, is this even possible? I.e. should this be some
>>>>>> kind of assertion or alike?
>>>>>
>>>>> Hm, I wasn't setting IRQ_DISABLED before, and hence needed this guard.
>>>>> But now with IRQ_DISABLED being set in ->status do_IRQ() should filter
>>>>> any stray interrupts.  I will attempt to add an ASSERT_UNREACHABLE()
>>>>> here.
>>>>
>>>> Simply ASSERT(!uart->force_polling) should do here? It is not wrong to
>>>> run the code below in release builds in such an event. If we kept getting
>>>> interrupts (perhaps at a high frequency) we'd be in trouble anyway.
>>>
>>> No, I'm afraid I can't do it like that, I can't put an ASSERT there,
>>> because we can still get into ns16550_interrupt() after the interrupt
>>> has been disabled.  In do_IRQ() we have the following loop:
>>>
>>>     while ( desc->status & IRQ_PENDING )
>>>     {
>>>         desc->status &= ~IRQ_PENDING;
>>>         spin_unlock_irq(&desc->lock);
>>>
>>>         tsc_in = tb_init_done ? get_cycles() : 0;
>>>         action->handler(irq, action->dev_id);
>>>         TRACE_TIME(TRC_HW_IRQ_HANDLED, irq, tsc_in, get_cycles());
>>>
>>>         spin_lock_irq(&desc->lock);
>>>     }
>>>
>>> So if the device is generating further interrupts in the window with
>>> IRQs enabled (while we execute the handler), we will keep looping
>>> around this, without taking into account the setting of IRQ_DISABLED.
>>
>> Ah yes.
>>
>>> This is something that we might want to fix, so that the loop is bound
>>> by IRQ_PENDING being set, and IRQ_DISABLED not, ie:
>>>
>>>     while ( (desc->status & (IRQ_PENDING | IRQ_DISABLED)) == IRQ_PENDING )
>>
>> Or perhaps ahead of the loop
>>
>>     desc->status &= ~IRQ_REPLAY;
>>
>>     if ( desc->status & IRQ_DISABLED )
>>         goto out;
>>
>>     desc->status |= IRQ_PENDING;
>>
>>     /*
>>      * Since we set PENDING, if another processor is handling a different
>>      * instance of this same irq, the other processor will take care of it.
>>      */
>>     if ( desc->status & IRQ_INPROGRESS )
>>         goto out;
>>
>>     desc->status |= IRQ_INPROGRESS;
>>
>> thus also having the comment no longer describe only part of the conditional.
> 
> I think this is racy.  An interrupt hitting in the window with
> interrupts enabled ahead of the handler having set IRQ_DISABLED will
> still set IRQ_PENDING, and thus the loop would get executed a further
> time, and the handler called after IRQ_DISABLED having been set.

Hmm, I don't quite agree with how you put it, but I think I see what you mean.
There's one question here, though: If PENDING is set first, and DISABLED only
later, shouldn't that IRQ instance still be handled? If so, ...

> I think we need an extra condition in the loop, I see no way this can
> be solved only by dealing with the concurrent setting of IRQ_PENDING.

... such an extra condition would be wrong. If not, yes, I agree.

Jan

