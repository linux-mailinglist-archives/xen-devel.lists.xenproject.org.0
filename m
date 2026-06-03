Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /J+cDfolIGr7xQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:02:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD72637D0C
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:02:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=C41DOI66;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326211.1591645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlEy-0004Qp-M0; Wed, 03 Jun 2026 13:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326211.1591645; Wed, 03 Jun 2026 13:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlEy-0004Oh-It; Wed, 03 Jun 2026 13:02:36 +0000
Received: by outflank-mailman (input) for mailman id 1326211;
 Wed, 03 Jun 2026 13:02:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUlEx-0004NB-6S
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:02:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlEw-007HpS-J2
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:02:34 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2025e8-bab6-0a2a0a5309dd-0a2a4502b0ae-10
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:02:34 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2025ea-af86-0a2a45020019-d155802ad15a-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:02:34 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490ace40f4bso38774345e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:02:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b615fb2bsm62087165e9.5.2026.06.03.06.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 06:02:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1780491754; x=1781096554; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H+7TwDBPevdNUQshNBDA4mQPANAycJyMrO79icl3GT0=;
        b=C41DOI666gyE65ltuytGKcVHIVQ32X8Vp8bONPStSx4MQSODjqqpgn/Z5Pq9d5bH/N
         /Sc7PLw8APxVJW3ZSALN4bToEkdPbhBOZErVEml6QnsI/YfLxzsw/sLR2UIxvEaphX3S
         S6y0WAXuvBvA2RxY+ZXsK20LkFoQAmo2CQ/Dla5xh+gGHz2+LMghekzjl0ERZzthFAhX
         mJkkjpxPfTBx0vbfwkr9JDQmhkNGAg/IOUOJg89fSuLNXw70t59NZNvPTUmYQ43aU3uT
         6LM5bXb7CnSNZR/wTb+Q5ZpMLBHfYglzrrbyNhtgvPwcTnXPpEBHg42JsD5txzQug48u
         gnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491754; x=1781096554;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+7TwDBPevdNUQshNBDA4mQPANAycJyMrO79icl3GT0=;
        b=V8b50IEP/jBE++MqrRHrMUXnlLVvM9PTkYgLyHcOJvQjj3S6O3lzRnA09hB9pWlMve
         sImNpkGOGuBJh0aa3KeBFOHArhODe0k7026zdUIb6ko4U8JBB+xt6aOq3nmjyhJRZ8It
         wfT8WDvhQQvoZmz/cQ47JPQk8Batn1UkllNh5AzWv79PXzO/nYsB0xjPrc+EDNHBDUYt
         4MfsGHY43HLJLv8YV7LeVrqe5R3grc97duqsrqy8SZadmx2FjMJBCV5CXW39gYTaLbvE
         fhuOzHgaUuMoMN5ADyGN5CTW4HUQ75SDvwpVAmgYkb4f5lHyTlbLlQuQ8lYEJ5AK3J3I
         laCA==
X-Forwarded-Encrypted: i=1; AFNElJ8eQIcnaeQO3CC6ZcU1ZOX4GKKHXQGWqAKm5qtC6glquxTgFs0dVSt/hPjX78RbrNpIjSuvwjV1eg8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyo1FafB4PQwjPkx9r8XM3JhV06CM12i6+Z2uRaOCXKbZqlyyR9
	U/0Pmz90TIXZFG6h//3f46PTBPt6FHNgv99uy10bzjRzXtfnmwrY5P7rr7w/49hrWA==
X-Gm-Gg: Acq92OGDMfT5u2cT82fLBOYwb485drXLbKbPNcTUk8gMhZNB/OP6xtRh0fsg4dKTeTF
	RRGe8FC/xMy6JUboUo2Nu4nzoVoxvfrJ+U5WaNrnnB0nH/6NmCK2Y/MtZ1AxzIDDnH0lFA3F5iG
	qvIPaBuhL/sW+owp+7UsrjpFxXBoiBrtvT+ZXnnM0l0uMJVQJunGrJa38nFDXvcVrvaGU6C2yvL
	NkDjsmtUI8PPVHM1fCC5i6l2RDTD59kg1GsMIV/vCE8rpwJA2EZ/WN+bTsP+oym1Esyl2qG8VBJ
	w+G1H0HW0u96SV44iqBLryHVNmUrgclTaNc/D8u9Nzp/6sXRFUutWHt90vse1j4U+EwTCUr16t8
	FJ1un39HdllaOIsHFBXK+4scH8xKGv3v7UDjJ/F3dudzh1PmFSC5PB0xG5tsOULMvaU0C/wyveW
	+PqermRJgQ4J7mScxk2UMbN1rasIJc5dNFqXul+tfOyXTb62BkJepHNdYdls/FLG5kAxAd9C1Gx
	JEJAErtrFj/8HcCaq+2ohRf0w==
X-Received: by 2002:a05:600c:46ce:b0:490:b4e5:ce7e with SMTP id 5b1f17b1804b1-490b5edcbe3mr48133485e9.25.1780491749054;
        Wed, 03 Jun 2026 06:02:29 -0700 (PDT)
Message-ID: <616db16e-3c3e-4000-b6ea-d2703f5a848b@suse.com>
Date: Wed, 3 Jun 2026 15:02:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vPCI: resolve MISRA R10.1 boolean arithmetic type
 violation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
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
In-Reply-To: <aiAj7duOGUAkbB05@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780491754-81772161-E1CCDDDE/0/0
X-purgate-type: clean
X-purgate-size: 4312
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
X-Rspamd-Queue-Id: CDD72637D0C

On 03.06.2026 14:54, Roger Pau Monné wrote:
> On Wed, Jun 03, 2026 at 08:04:25AM +0200, Jan Beulich wrote:
>> On 03.06.2026 03:41, Stefano Stabellini wrote:
>>> On Tue, 2 Jun 2026, Jan Beulich wrote:
>>>> On 27.05.2026 00:12, Stefano Stabellini wrote:
>>>>> On Fri, 22 May 2026, Jan Beulich wrote:
>>>>>> (extending Cc list)
>>>>>>
>>>>>> On 22.05.2026 08:13, Dmytro Prokopchuk1 wrote:
>>>>>>> --- a/xen/drivers/vpci/header.c
>>>>>>> +++ b/xen/drivers/vpci/header.c
>>>>>>> @@ -586,7 +586,7 @@ static void cf_check bar_write(
>>>>>>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>>>>>>>              gprintk(XENLOG_WARNING,
>>>>>>>                      "%pp: ignored BAR %zu write while mapped\n",
>>>>>>> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
>>>>>>> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
>>>>>>>          return;
>>>>>>>      }
>>>>>>>  
>>>>>>> @@ -647,7 +647,7 @@ static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
>>>>>>>          if ( guest_addr != bar->guest_addr )
>>>>>>>              gprintk(XENLOG_WARNING,
>>>>>>>                      "%pp: ignored guest BAR %zu write while mapped\n",
>>>>>>> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
>>>>>>> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
>>>>>>>          return;
>>>>>>>      }
>>>>>>>      bar->guest_addr = guest_addr;
>>>>>>
>>>>>> Well. If I'm not mistaken we had discussed situations like this (long ago).
>>>>>> Imo the added verbosity gets in the way of readability. If we absolutely
>>>>>> cannot or don't want to deviate such constructs (of which I expect we have
>>>>>> more), then we ought to consider alternatives (like changing the variables'
>>>>>> types in the case here).
>>>>>>
>>>>>> As to deviating: rules.rst, according to my reading, says that &, |, ^, or
>>>>>> shifts would be okay to use with a bool operand. What's wrong with also
>>>>>> permitting this for other operators?
>>>>>
>>>>> In my opinion, if we are going to treat bool as its own type, it makes
>>>>> sense not to silently mix bools into arithmetic with int types. I also
>>>>> do not find this patch less readable -- I actually find it more
>>>>> readable, since it makes it more obvious that hi is a bool.
>>>>
>>>> Well, okay, we have different opinions there. This reply of yours applies
>>>> to the first paragraph of my earlier reply though, despite its placement.
>>>> What about the aspect mentioned in the second paragraph?
>>>
>>> You mean "then we ought to consider alternatives (like changing the
>>> variables' types in the case here)" ?
>>
>> That's another option, but not what I meant. I simply don't understand why
>> some operators are okay to use with booleans while others aren't. Adding
>> (for example) booleans can be quite helpful. Take this example from gas
>> sources as example:
>>
>>       if (overlap.bitfield.imm8
>> 	  + overlap.bitfield.imm8s
>> 	  + overlap.bitfield.imm16
>> 	  + overlap.bitfield.imm32
>> 	  + overlap.bitfield.imm32s
>> 	  + overlap.bitfield.imm64 != 1)
>>
>> And then see how the added verbosity would hamper readability:
>>
>>       if ((overlap.bitfield.imm8 ? 1 : 0)
>> 	  + (overlap.bitfield.imm8s ? 1 : 0)
>> 	  + (overlap.bitfield.imm16 ? 1 : 0)
>> 	  + (overlap.bitfield.imm32 ? 1 : 0)
>> 	  + (overlap.bitfield.imm32s ? 1 : 0)
>> 	  + (overlap.bitfield.imm64 ? 1 : 0) != 1)
>>
>>> Other alternatives could be OK, but also this patch as-is is OK to me.
>>
>> I'm not going to veto it (not being a maintainer of the code I really
>> can't), but as per above the transformation imo is setting a bad example.
> 
> What about getting the BAR index based on the register value, and
> hence avoiding the pointer arithmetic plus the boolean type addition?
> I think that's clear and doesn't violate any MISRA rules, it would
> obviously not settle the discussion about boolean type abuse as
> integers, but would be fine to solve the specific issue in vPCI IMO.

For the case here - sure, that should be fine. But I specifically
wanted to understand (generally) why we are limiting ourselves, as
surely other cases are going to show up.

Jan

