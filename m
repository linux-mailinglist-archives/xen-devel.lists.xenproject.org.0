Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEokLfw4xmm7HgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 08:59:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D26340B25
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 08:59:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265156.1556221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w626Q-0003i8-0S; Fri, 27 Mar 2026 07:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265156.1556221; Fri, 27 Mar 2026 07:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w626P-0003fS-Tb; Fri, 27 Mar 2026 07:59:33 +0000
Received: by outflank-mailman (input) for mailman id 1265156;
 Fri, 27 Mar 2026 07:59:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w626O-0003fM-EK
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 07:59:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w626N-005bjX-Qf
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 08:59:31 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c638db-5cb7-0a2a0a5109dd-0a2a450bd1bc-42
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 08:59:31 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c638e3-ef63-0a2a450b0019-d155dd29c813-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 08:59:31 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-439b2965d4bso1350433f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 00:59:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b9192e305sm14201744f8f.8.2026.03.27.00.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 00:59:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1774598371; x=1775203171; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rtolMKUmK47Gbsa7Ihd+aVEhDn0ES4qeTkwpvzesPdY=;
        b=OvW3TW6LNL/sOo/XOPKCFrwr3QQ1IHC2rJTLdZjipbpE2Yf7FZ2u8OGKdxGb/J1etZ
         fdfJGTOqN73Fi+zE0duLQpd7P/vsijej5AOuId5w+SM48O5us5E4VS62xKgGT5T+ldaX
         HcEBBbq4r4Y3BssmkEIVIr3/cPPI/USY+vhN5GxGnrCisz2pc0QdtxMES/Zo36oQK7OR
         YBsg5FVZr1nZecnkCtaKtLQb67crVPQ87xTziiKmZKm8FSC8m0R1y8ADWrSIh6foYQzZ
         n30m2HX3vxEHfHYoNIEPM7ZL4QA6qUdHuAZlgtjT2QvqUXEVU28RhNw6B49Nr6uXLAdD
         Ufug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598371; x=1775203171;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtolMKUmK47Gbsa7Ihd+aVEhDn0ES4qeTkwpvzesPdY=;
        b=VUQ+gKCHZr5TIKmcOWH8O9RTzevMMjyZHZ1tfoKXLOXBL02+dBH0OKLgbHxWjbMcWE
         WH09IQRbUucwpmJtoIBsskRwWRI53NaVgwDQNPysEdQXVv3BdVBxyLRmK0bP4OX+tVt6
         jeD6HsPWRQyawAb6Q1FscNDKVvQXcqtAVEFlPPoskpTf3ISeLKMLWVPO67cwhDyQvWkZ
         Uhih9Gl0St/Vrk7jUiE0PGyiBOja65Uu+eWdcL6odkbx+8kPWa7thhcI7PO9QWgooD0Y
         Ca0av2ujTvS853l2OGYWRHcl1L1DuUDxGoaNI7DTzvX0hnMMIxmu/8+pv5CZst4Cozxd
         ynww==
X-Forwarded-Encrypted: i=1; AJvYcCV17jv8PdPdTjHD2EjIkX2i9f1kN4N9ZO5BCKXh3mzsSnsjlcC9RN35m+scRbDwVePe/Pa2ixUkp/U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGLbaLX1IWNmTHXrA3rBeZgLNg0I2ODP9brGG1VtsP/4ySFdwb
	Z74/hMoGF/uqau0Ij93B6CI+oxUdoHWc3nOG1BFvJeiiPNFsA2j4/eA1pSfNWjMBNQ==
X-Gm-Gg: ATEYQzwTxj987oVhmOTyp9MfIOu51VFGbAjkbDsM/U/1FOKOTq4dohrdfkEtIqCuwD9
	/7trm5H2oP8etrvmjMi1O8LNYAtiuWpdseLteQTGeH39s9by8Q7ErXlDidZcv6JiVok4G4CU0MH
	yiNewSikjK8AKA3jAgg6qmiDnGQAGqENrPV2rzvYnk1ZKgCAUv1yniVNWDa4lRgEJ9aOEs5WLqL
	ewzvp4frWjinO+D/oJqxutrMiqznzK1n4bUY8e403U83+2rKyqdnvCh5tdDWeDf7lrzcJgMHqMi
	BLrmzvRu7SpVShdjsmCu6KoP5QQNc87LIsAPLLff1NdiNdqLZoUkQnCHtBLQp1IXW8NlIpLM3NO
	EUCvjOCoZdkDp6UKMJsDs+giemitg2wKq+InQxp1Zotj/5Z8oELcIpSmOEShZV7f7J64HokKUrI
	ldQteckXUN8RwyKNo1WVGZSsdaFZ9VocgOC8SMzENX6Z7gA0mpQN+sjvu5FfsfLU1gDMmRqCnlb
	nm7V3mzWjDQOIdYCYoQYBBjtg==
X-Received: by 2002:a05:6000:268a:b0:439:fbbc:d593 with SMTP id ffacd0b85a97d-43b9ea49e55mr1971244f8f.27.1774598371034;
        Fri, 27 Mar 2026 00:59:31 -0700 (PDT)
Message-ID: <f671aca0-2782-40cc-9ee5-03916c1a31eb@suse.com>
Date: Fri, 27 Mar 2026 08:59:29 +0100
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
 <b4b67bc1-c7e4-4872-a018-789d7e87dcb2@suse.com>
 <acVmj-agJOAX9hGV@macbook.local>
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
In-Reply-To: <acVmj-agJOAX9hGV@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1774598371-98EBA112-10F9D98D/0/0
X-purgate-type: clean
X-purgate-size: 4171
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 53D26340B25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26.03.2026 18:02, Roger Pau Monné wrote:
> On Thu, Mar 26, 2026 at 05:00:15PM +0100, Jan Beulich wrote:
>> On 26.03.2026 16:13, Roger Pau Monné wrote:
>>> On Thu, Mar 26, 2026 at 01:02:22PM +0100, Jan Beulich wrote:
>>>> On 25.03.2026 15:58, Roger Pau Monne wrote:
>>>>> Read the existing PCI command register and only add the required bits to
>>>>> it, as to avoid clearing bits that might be possibly set by the firmware
>>>>> already.
>>>>>
>>>>> This fixes serial output when booting with `com1=device=amt` on a system
>>>>> using an "Alder Lake AMT SOL Redirection" PCI device (Vendor ID 0x8086 and
>>>>> Device ID 0x51e3).  That device has both IO and memory decoding enabled by
>>>>> the firmware, and disabling memory decoding causes the serial to stop
>>>>> working (even when the serial register BAR is in the IO space).
>>>>>
>>>>> Fixes: f2ff5d6628b3 ("ns16550: enable PCI serial card usage")
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> I'm not convinced Fixes: is appropriate here. There's nothing wrong with that
>>>> commit, aiui. What's bogus is the device behavior.
>>>
>>> Hm, I would argue that disabling command register bits for devices
>>> that have those enabled is in general dangerous.  What about device
>>> RMRR or similar residing in BARs, and Xen disabling memory decoding
>>> unintentionally while attempting to enable IO decoding?
>>
>> RMRRs in BARs seems unlikely (as BARs can be moved), but you have a
>> point in general. Otoh devices are fully under our (later under Dom0's)
>> control, so we may clear (or set) bits as we see fit to get a device
>> to function. FTAOD, I'm not outright objecting to the tag, I'm merely
>> questioning it some.
>>
>>>>> --- a/xen/drivers/char/ns16550.c
>>>>> +++ b/xen/drivers/char/ns16550.c
>>>>> @@ -283,11 +283,17 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
>>>>>  static void pci_serial_early_init(struct ns16550 *uart)
>>>>>  {
>>>>>  #ifdef NS16550_PCI
>>>>> +    uint16_t cmd = 0;
>>>>> +
>>>>> +    if ( uart->ps_bdf_enable )
>>>>> +        cmd = pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>>>>> +                                       uart->ps_bdf[2]), PCI_COMMAND);
>>>>
>>>> Why is this conditional? While fine for the use at the bottom, ...
>>>
>>> The comment next to the field states:
>>>
>>>     bool ps_bdf_enable;     /* if =1, ps_bdf effective, port on pci card */
>>>
>>> So it didn't seem like further checking was needed and that was the
>>> sole filed to decide whether ps_bdf is populated or not.
>>>
>>> However, I also found that when using device=amt|pci ps_bdf_enable
>>> doesn't get set, and hence I'm not sure if that's intended or not.
>>> Shouldn't ps_bdf_enable get set unconditionally when the serial device
>>> is a PCI one?
>>
>> I think this was deliberate, hence why ...
>>
>>>>>      if ( uart->bar && uart->io_base >= 0x10000 )
>>>>>      {
>>>>>          pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>>>>>                                    uart->ps_bdf[2]),
>>>>> -                         PCI_COMMAND, PCI_COMMAND_MEMORY);
>>>>> +                         PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
>>>>>          return;
>>>>>      }
>>>>
>>>> ... it looks wrong(ish) for this path. Actually, in ns16550_init_postirq()
>>>> we use
>>>>     if ( uart->bar || uart->ps_bdf_enable )
>>
>> ... this conditional is now in use.
> 
> Right, but then the logic in pci_serial_early_init() doesn't apply to
> those devices (device=amt|pci) when the BARs are in IO space?
> 
> As uart->ps_bdf_enable == false, and uart->io_base < 0x10000, it will
> return early from the function without attempting to enable the IO
> BAR.  Is this really expected?  It looks like Xen should always make
> sure the respective BARs are enabled if the device is to be used for
> serial output?

I agree. Many of the changes were hacked in just to make someone's
device work, without having general aspects in mind. I expect most if
not all checks of ->ps_bdf_enable want amending by adding ->bar ones.

Jan

