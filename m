Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EA/yAiZYxWkk9gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 17:00:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DC1338040
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 17:00:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264446.1556000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5n89-0005hf-7J; Thu, 26 Mar 2026 16:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264446.1556000; Thu, 26 Mar 2026 16:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5n89-0005fh-3h; Thu, 26 Mar 2026 16:00:21 +0000
Received: by outflank-mailman (input) for mailman id 1264446;
 Thu, 26 Mar 2026 16:00:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5n87-0005fb-4A
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 16:00:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5n86-00EN5P-GI
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 17:00:18 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c55808-5cb7-0a2a0a5109dd-0a2a450cdb3a-48
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 17:00:18 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c55812-f93d-0a2a450c0019-d1558036d9eb-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 17:00:18 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso10370625e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:00:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487209422b3sm16503695e9.36.2026.03.26.09.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 09:00:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774540818; x=1775145618; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SIjMwhrmXUnvxM6ihNtRA+/qOvvHP3HVBfBVvX5Bah8=;
        b=EzOz8kS4tHayEfV4/FzEvbKisfgLqPz/NnEdzPqDztHcTouge5t2jT12gzbjbIZgG3
         Oa8ZAuLb3DvH+GoVjpxpRC+suSuqsvVHuD2KomjNf+0knmQGdMQy33ncV4Z8tt4AbQwt
         IdG0LSBbUcO9iZGKYDNKwb0RPXdPHLYjdcEsOsjxQUV7w/9vl9eeZrxnW/LfXK2QLD9F
         CWMORgQ7S8DeRDNSRuyNPV6aVtk24tM1plakXPUovecTcccSdEuI5G2EWkUC84HkRktf
         A5+00/u97FICE/rUVxDrkPCqCTx/8gqR9CE0jp7zaJ0NYu75qBoJARNi12ASTDYe2Jw+
         09xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540818; x=1775145618;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIjMwhrmXUnvxM6ihNtRA+/qOvvHP3HVBfBVvX5Bah8=;
        b=b6LkaC3t766+gKOFaOtUQG+9PQQiL6IRncqugmU709NFmG3oA3F4xHMu5cbfDvIgBx
         Nzh00XF0w43rqN9cF6uxB08suuOGhZ09J8xY7m9PbkxY+vwayWcgcIDjHeYgn+ri2awx
         XXqPhhK/Y3UIxnfifeQaCDEtJZ2YVbWmhC02r5TWWU9r4GTVQLnWuRC7xhIpe/Xo9rm0
         eaZEHIfdpg4yKm8xxo1f+6coVHAAbXcpVyY1d1s6rcm1kq9nJn6zQ3eagQSwPAU15hKT
         x32VIrVPrPlZAw7MAdpPLztHO5sRN9uiPxpKqlnsb3SCkVN0BNiXMtORkkTAxqmdmYpZ
         rZ5A==
X-Forwarded-Encrypted: i=1; AJvYcCUtVtxbgc1L6Eith7T6KBvuxeo8kF/I5zg1Df44x3rhmYgW7BYpnCe7G1FetwqJ5M+fr7hK+dqgc9Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrEQe8bPf5LAyB3G8OxZ5UPaXlAZF5PCaA08OsiECJh/ux3mJx
	NtEn3pfI7OWg6/Dld0P8Ha33h9iFCxOVRBDWGvavDf3mnorwiew9fz0faMbOWeysIQ==
X-Gm-Gg: ATEYQzysUsySZil0RGTx7jnhJNXVg7TwVkvcOYU72vXEWrE6c56Uc9w+617pS8tbZij
	3WI7xSz742T/IkGZD301JhSk638t7+CD19OQLXkzGVDd0+uzbGEUGRPxUGZPR4m9gE9Wx2gmDdA
	KEuNmJzP1kZT3v+jS0ohMAOyE2roIPzru7BIDYQ5X3NE5iWsLUvXwX9eOIA8mPNs57dMbKiZbKV
	CWhJklmmoYXsrCROgxY/9eJTRAl2gtJc4ZtJlkyvtZGRDvZPCwxYkR70H+imjliPrj/vaUVKLGA
	ESj6y4W/loZX0cOCgaxIK0J1V5amFpLMwbxKy6OE1MR51VDCBpOThGPdiLGhXN0lCNFUCiv8vOG
	miz9dxu2sAVIjj/kxWZSR79m7YHb+CB5fO5QiyKFWeWwV72jyTmUNq932ESOmt03+cVruxE9Kvk
	jfwT0q6IEPPm3h1jPWmlXU1gQtm9sdDYU5aCo3WkIcR+iiCkcNMFowBK9oopFDOoCkxTMKXcQBf
	kDpk1oGRYCRt3w=
X-Received: by 2002:a05:600c:3490:b0:486:f8e9:add5 with SMTP id 5b1f17b1804b1-48716042c08mr122203105e9.19.1774540817521;
        Thu, 26 Mar 2026 09:00:17 -0700 (PDT)
Message-ID: <b4b67bc1-c7e4-4872-a018-789d7e87dcb2@suse.com>
Date: Thu, 26 Mar 2026 17:00:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] xen/uart: be more careful with changes to the PCI
 command register
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260325145824.31601-1-roger.pau@citrix.com>
 <20260325145824.31601-2-roger.pau@citrix.com>
 <2a00a1d2-7017-4c76-8344-018eb3f30f50@suse.com>
 <acVNMQ_HqRpgkP7i@macbook.local>
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
In-Reply-To: <acVNMQ_HqRpgkP7i@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1774540818-6CABD734-C2999C66/0/0
X-purgate-type: clean
X-purgate-size: 3475
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 70DC1338040
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26.03.2026 16:13, Roger Pau Monné wrote:
> On Thu, Mar 26, 2026 at 01:02:22PM +0100, Jan Beulich wrote:
>> On 25.03.2026 15:58, Roger Pau Monne wrote:
>>> Read the existing PCI command register and only add the required bits to
>>> it, as to avoid clearing bits that might be possibly set by the firmware
>>> already.
>>>
>>> This fixes serial output when booting with `com1=device=amt` on a system
>>> using an "Alder Lake AMT SOL Redirection" PCI device (Vendor ID 0x8086 and
>>> Device ID 0x51e3).  That device has both IO and memory decoding enabled by
>>> the firmware, and disabling memory decoding causes the serial to stop
>>> working (even when the serial register BAR is in the IO space).
>>>
>>> Fixes: f2ff5d6628b3 ("ns16550: enable PCI serial card usage")
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> I'm not convinced Fixes: is appropriate here. There's nothing wrong with that
>> commit, aiui. What's bogus is the device behavior.
> 
> Hm, I would argue that disabling command register bits for devices
> that have those enabled is in general dangerous.  What about device
> RMRR or similar residing in BARs, and Xen disabling memory decoding
> unintentionally while attempting to enable IO decoding?

RMRRs in BARs seems unlikely (as BARs can be moved), but you have a
point in general. Otoh devices are fully under our (later under Dom0's)
control, so we may clear (or set) bits as we see fit to get a device
to function. FTAOD, I'm not outright objecting to the tag, I'm merely
questioning it some.

>>> --- a/xen/drivers/char/ns16550.c
>>> +++ b/xen/drivers/char/ns16550.c
>>> @@ -283,11 +283,17 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
>>>  static void pci_serial_early_init(struct ns16550 *uart)
>>>  {
>>>  #ifdef NS16550_PCI
>>> +    uint16_t cmd = 0;
>>> +
>>> +    if ( uart->ps_bdf_enable )
>>> +        cmd = pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>>> +                                       uart->ps_bdf[2]), PCI_COMMAND);
>>
>> Why is this conditional? While fine for the use at the bottom, ...
> 
> The comment next to the field states:
> 
>     bool ps_bdf_enable;     /* if =1, ps_bdf effective, port on pci card */
> 
> So it didn't seem like further checking was needed and that was the
> sole filed to decide whether ps_bdf is populated or not.
> 
> However, I also found that when using device=amt|pci ps_bdf_enable
> doesn't get set, and hence I'm not sure if that's intended or not.
> Shouldn't ps_bdf_enable get set unconditionally when the serial device
> is a PCI one?

I think this was deliberate, hence why ...

>>>      if ( uart->bar && uart->io_base >= 0x10000 )
>>>      {
>>>          pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>>>                                    uart->ps_bdf[2]),
>>> -                         PCI_COMMAND, PCI_COMMAND_MEMORY);
>>> +                         PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
>>>          return;
>>>      }
>>
>> ... it looks wrong(ish) for this path. Actually, in ns16550_init_postirq()
>> we use
>>     if ( uart->bar || uart->ps_bdf_enable )

... this conditional is now in use.

Jan

>> for example. With the new conditional updated accordingly:
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks for the review, I don't mind adjusting, but I have a further
> question above.
> 
> Roger.


