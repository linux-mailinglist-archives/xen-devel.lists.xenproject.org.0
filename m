Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZbcPHgWHImrnZgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 10:21:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EBB64658D
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 10:21:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=emVikud8;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1329184.1593391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPnR-0003iz-KZ; Fri, 05 Jun 2026 08:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329184.1593391; Fri, 05 Jun 2026 08:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPnR-0003gB-H0; Fri, 05 Jun 2026 08:20:53 +0000
Received: by outflank-mailman (input) for mailman id 1329184;
 Fri, 05 Jun 2026 08:20:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wVPnP-0003g5-Vx
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 08:20:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVPnP-00D87V-5W
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 10:20:51 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2286d1-e002-0a2a0a5209dd-0a2a4509e5d8-48
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 10:20:51 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2286e2-2497-0a2a45090019-d155802ef00e-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 10:20:51 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490af320e2aso18921805e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 01:20:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f0a43e9sm23684624f8f.0.2026.06.05.01.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 01:20:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1780647650; x=1781252450; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M9IpzdkwkHfJE5qDuN0Vfq+eW0x5cRaS0RwCFOoxuPE=;
        b=emVikud85IVfOvI/upcBZnmToUcM+QBK4K7uk8NkyUI+u0y9kK8qUyRmu57PgSdtGu
         HdKyZdvd+Wyn+XKEyQfXFDj0NisXeM1dCfIUSB2TtAOLAHy5jGyVkLxGNaQxds15qsih
         73A5gLdArq4T0zrgMRWrzZxRT/tGhr+IKZX15xMnpIFReK6kFUd9SIc97zMpL/xLASXc
         DDB1dorSohWiMv8tDnSVkvC78UZur5uqb0uGvfK6UExjVz5EijEeuQrCe9u0HSY+rj0+
         WslWwzJXXE414QaRouxHeH/cXijd/SZOormo++O7i1LF2ukg/ym1Pwr7gSkvC6YN3BEK
         SynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780647650; x=1781252450;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9IpzdkwkHfJE5qDuN0Vfq+eW0x5cRaS0RwCFOoxuPE=;
        b=axd7GidbubWNBc2BEv5XxKDK+AAp8GUihGpybXTR0XFF9u+fhW/gFJ6eZnpo2coHJI
         Mvf5mwQ2kxdY/MTtH12H/pWGMnfLyQuWMX9f79WT+IAPQt1NI4evHhzvjxZ6Uox/gmLG
         iTc1Co0zHShNgabDhaCbrmqa1OM5ppXDDADvjmAwPW+vaZ0AyFmVCraBrXWBOcWCrAPv
         L7QdSlodrgtlWCt17Ke0kYiI1ay+ZFMzd6XzacyAar+9BZJV4pi9XrQrRcVLSLaCDJfD
         XgwQOA2Uso4WFRck67pVTRIJJ5lqoiAf26+c6BhUnBfp3VfazIX87jqbwlIk3vnFZ33f
         kNcA==
X-Forwarded-Encrypted: i=1; AFNElJ+YpFi1tcrKQQQIhfX2XtkZAxlgLErhm8c+qC8cRFjaBbBBiWfQr3spVfrdvC2Ltk0R0l/ZoAIyS4w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7VEYOA6Z/GLVMlHRISiBf0JY3GsICRUEdq6Vtq9YeBrTfPr9X
	M2EDIfSr8OFkMOyYGnSXN8u/H5nDDMaMm0sU6Bt4ESX9MonnReuyANkZCc8xRetbcg==
X-Gm-Gg: Acq92OFmb1jwxvRwjZSzOm0Nbmx3pDHeutiYCILm2yaSFelIdiRaCut4Z/FOe3zA14B
	/lSUbEfNzZ/D12aYbSHwD3QZMGrRKe5q/IjEnVbo+aV29W94rZzLE45omnwyaH6f/DIBICVX2kc
	FpW/y+y7gZ9tnNNwKcZRjZkp1AAueyZmvyYKA+T109UrbGAHrfDGBvx270b1hozM4SnnzPdmso7
	ASpdi9kgU5WlIMOw591bKGjajCVvEG+Te18Z3dkfmnX/S/jWj+wYcu7gy7RtcTpvBHYwQ+wTmJ9
	Nta/f5MhfzfKl2Hp4ciYxOe57HzlYduJHquwZ+2Uxr9EXSZr6z5gWW9NFM18MuGNJOc7mJtEqvx
	dyHJkHRw7K/Zzmaw4xKNERWkNt+geTKHXPQr8PXEc1OrIG8Pt/7ApybCytLnEEEjO7MQv6v0MkV
	NHZc1+IPMUJOrxfRs7Dn8rNHxmpCg4y/TQGallRckvsQpeYuWac/quYGRodhE1PCIV3nPHesB1b
	pe3G6XStbycMJABoKpKIDAW3zIn8eFnCp5i
X-Received: by 2002:a05:600c:83c3:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-490c25a21a9mr40291635e9.9.1780647650394;
        Fri, 05 Jun 2026 01:20:50 -0700 (PDT)
Message-ID: <f4d1b7a0-2e5e-4a63-ae82-f765d2743334@suse.com>
Date: Fri, 5 Jun 2026 10:20:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vPCI: resolve MISRA R10.1 boolean arithmetic type
 violation
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e23266191a366abe66d8104783d97578aa8734a4.1779428826.git.dmytro_prokopchuk1@epam.com>
 <984c91b8-3d2c-4431-bdf1-4a333ac341d1@suse.com>
 <alpine.DEB.2.22.394.2605261508390.182011@ubuntu-linux-20-04-desktop>
 <62abdafd-a49c-46e0-b529-0646a8d2425a@suse.com>
 <alpine.DEB.2.22.394.2606021840110.550703@ubuntu-linux-20-04-desktop>
 <b443469b-01fe-4196-a79f-811bfb6e17d8@suse.com>
 <aiAj7duOGUAkbB05@macbook.local>
 <616db16e-3c3e-4000-b6ea-d2703f5a848b@suse.com>
 <alpine.DEB.2.22.394.2606031341070.1200252@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2606031341070.1200252@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780647651-88F71A53-401C4413/0/0
X-purgate-type: clean
X-purgate-size: 5431
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7EBB64658D

On 03.06.2026 22:43, Stefano Stabellini wrote:
> On Wed, 3 Jun 2026, Jan Beulich wrote:
>> On 03.06.2026 14:54, Roger Pau Monné wrote:
>>> On Wed, Jun 03, 2026 at 08:04:25AM +0200, Jan Beulich wrote:
>>>> On 03.06.2026 03:41, Stefano Stabellini wrote:
>>>>> On Tue, 2 Jun 2026, Jan Beulich wrote:
>>>>>> On 27.05.2026 00:12, Stefano Stabellini wrote:
>>>>>>> On Fri, 22 May 2026, Jan Beulich wrote:
>>>>>>>> (extending Cc list)
>>>>>>>>
>>>>>>>> On 22.05.2026 08:13, Dmytro Prokopchuk1 wrote:
>>>>>>>>> --- a/xen/drivers/vpci/header.c
>>>>>>>>> +++ b/xen/drivers/vpci/header.c
>>>>>>>>> @@ -586,7 +586,7 @@ static void cf_check bar_write(
>>>>>>>>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>>>>>>>>>              gprintk(XENLOG_WARNING,
>>>>>>>>>                      "%pp: ignored BAR %zu write while mapped\n",
>>>>>>>>> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
>>>>>>>>> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
>>>>>>>>>          return;
>>>>>>>>>      }
>>>>>>>>>  
>>>>>>>>> @@ -647,7 +647,7 @@ static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
>>>>>>>>>          if ( guest_addr != bar->guest_addr )
>>>>>>>>>              gprintk(XENLOG_WARNING,
>>>>>>>>>                      "%pp: ignored guest BAR %zu write while mapped\n",
>>>>>>>>> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
>>>>>>>>> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
>>>>>>>>>          return;
>>>>>>>>>      }
>>>>>>>>>      bar->guest_addr = guest_addr;
>>>>>>>>
>>>>>>>> Well. If I'm not mistaken we had discussed situations like this (long ago).
>>>>>>>> Imo the added verbosity gets in the way of readability. If we absolutely
>>>>>>>> cannot or don't want to deviate such constructs (of which I expect we have
>>>>>>>> more), then we ought to consider alternatives (like changing the variables'
>>>>>>>> types in the case here).
>>>>>>>>
>>>>>>>> As to deviating: rules.rst, according to my reading, says that &, |, ^, or
>>>>>>>> shifts would be okay to use with a bool operand. What's wrong with also
>>>>>>>> permitting this for other operators?
>>>>>>>
>>>>>>> In my opinion, if we are going to treat bool as its own type, it makes
>>>>>>> sense not to silently mix bools into arithmetic with int types. I also
>>>>>>> do not find this patch less readable -- I actually find it more
>>>>>>> readable, since it makes it more obvious that hi is a bool.
>>>>>>
>>>>>> Well, okay, we have different opinions there. This reply of yours applies
>>>>>> to the first paragraph of my earlier reply though, despite its placement.
>>>>>> What about the aspect mentioned in the second paragraph?
>>>>>
>>>>> You mean "then we ought to consider alternatives (like changing the
>>>>> variables' types in the case here)" ?
>>>>
>>>> That's another option, but not what I meant. I simply don't understand why
>>>> some operators are okay to use with booleans while others aren't. Adding
>>>> (for example) booleans can be quite helpful. Take this example from gas
>>>> sources as example:
>>>>
>>>>       if (overlap.bitfield.imm8
>>>> 	  + overlap.bitfield.imm8s
>>>> 	  + overlap.bitfield.imm16
>>>> 	  + overlap.bitfield.imm32
>>>> 	  + overlap.bitfield.imm32s
>>>> 	  + overlap.bitfield.imm64 != 1)
>>>>
>>>> And then see how the added verbosity would hamper readability:
>>>>
>>>>       if ((overlap.bitfield.imm8 ? 1 : 0)
>>>> 	  + (overlap.bitfield.imm8s ? 1 : 0)
>>>> 	  + (overlap.bitfield.imm16 ? 1 : 0)
>>>> 	  + (overlap.bitfield.imm32 ? 1 : 0)
>>>> 	  + (overlap.bitfield.imm32s ? 1 : 0)
>>>> 	  + (overlap.bitfield.imm64 ? 1 : 0) != 1)
>>>>
>>>>> Other alternatives could be OK, but also this patch as-is is OK to me.
>>>>
>>>> I'm not going to veto it (not being a maintainer of the code I really
>>>> can't), but as per above the transformation imo is setting a bad example.
>>>
>>> What about getting the BAR index based on the register value, and
>>> hence avoiding the pointer arithmetic plus the boolean type addition?
>>> I think that's clear and doesn't violate any MISRA rules, it would
>>> obviously not settle the discussion about boolean type abuse as
>>> integers, but would be fine to solve the specific issue in vPCI IMO.
>>
>> For the case here - sure, that should be fine. But I specifically
>> wanted to understand (generally) why we are limiting ourselves, as
>> surely other cases are going to show up.
> 
> My view on this is that booleans should be treated as booleans, and we
> should not rely on implicit conversions to int types. I prefer the
> second form because it makes it clear these are booleans. The added
> verbosity helps me see at a glance that these are booleans and should be
> treated as such. The first form is more dangerous because I might forget
> they are booleans, assume they are int types, and use them in an
> operation that would result in undefined or implementation-specific
> behavior.

Can you give a realistic example of such? Default conversion (to int,
with well-known false => 0, true => 1 values) should take care of most
if not all issues. Oddities I can think of are ++ or -- on boolean
variables (perhaps similarly += etc with the lhs being boolean), but
those we could indeed exclude if so desired.

Jan

