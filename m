Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEyUKvDJ1GmHxgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 11:10:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5143ABC2B
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 11:10:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274561.1560654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA2RO-0003xj-Qu; Tue, 07 Apr 2026 09:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274561.1560654; Tue, 07 Apr 2026 09:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA2RO-0003uh-Na; Tue, 07 Apr 2026 09:09:46 +0000
Received: by outflank-mailman (input) for mailman id 1274561;
 Tue, 07 Apr 2026 09:09:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wA2RM-0003ub-I8
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 09:09:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA2RL-00BJMI-U7
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 11:09:43 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d4c9d5-e002-0a2a0a5209dd-0a2a4507be92-18
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 11:09:43 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d4c9d7-ba2d-0a2a45070019-d1558034dc0f-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 11:09:43 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-488ba6366a7so10390635e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 02:09:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488be75215dsm39155605e9.6.2026.04.07.02.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 02:09:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1775552983; x=1776157783; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jwf/zAXtwrN0eKv07Lzpp60Eil4P8Gd1L8PTDcCJXgk=;
        b=enOlXbPxpcKRTN0uP8XSOjEPBa6/tYNX2fFR5/+dLffaT1TImnRVZ2iNShOEPb0N4w
         EA/xAAA5cqg0ADte1iCmy9b2/ST+4ktGGSxXbXx38H3tYcGw/nULh+sSlAEUL2WCHefs
         NOoS5StXoaPgNK3Cy4fFQvRjhWlb7l2KDnIl23BkT/f467CHiuTJ4zOMYKmH/i0+7Jqv
         ZOfTP607MZdN6242Jx63dwghDMD0r2Dy783qJpg7JdxqQLBydigg8vE6oXMxB3srH2Ta
         56I4JYKrunE9MMFIaoOcavvdfObQp/YYwCH6PtRmfBgaqNtNhZ+RaW/cksBufiLsCPmP
         i9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775552983; x=1776157783;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jwf/zAXtwrN0eKv07Lzpp60Eil4P8Gd1L8PTDcCJXgk=;
        b=EmQ7gkRQdDjayHMKSGBjaZsvW5l941NNNyPnAel3Od/g26UrenIWG4ZKtELaZbTYm/
         AJF2zmX7r2ptLPBNbqSa+AH6l+6NQEY0LOx2EClxerv5tCML5qwiUyiUx0XBzHhpZWM6
         k9sYIfhUW9T3GmfYTRid0Un6XOxcIzAMqe2BHsHWFKBj/EiofW2l634a1vj7Pc3/S08Y
         owb75a6go22tl4mTUgSmRIXm/HceIu6JrHZkzBSnYpaW8AxqFf6Vw2Cff5pSE/eD+PsP
         k5hwatYfb7zEHOFqAyuONqa+F7pLkSfC1h0qgtN9JBZ2TgHmSBLYwB5D58t+XcuF9UMC
         yXEA==
X-Forwarded-Encrypted: i=1; AJvYcCXeio0ObdHm09PzW+SUVUeKatEY0E0vzxo9wl4W6FAb1ML9LuNOSjFgLMLN2IotRzPNYvLSE3nuNwY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwG8F2cMbsR6ze6G4EPQ5UKg/O6xzDVe51B3bDjDUXQKedA123V
	DqxVAYL3/QadHjlcQeLbtvlVUfmC5K9eeUXrYkV1qPrzHS5y+SY9tVs+P3nyTBuYlQ==
X-Gm-Gg: AeBDiesd9PvAziHWttks4WEmvZgCZjGiApU5uAYOs5tlF5SDOD8KQDl1LnPVjxPd3OO
	Eu40cwXeFDm8mm/pfOahWyo8cVN+A6f2ZLmP4cF1W9UM0c/CImns9B639SROMozZ0rn0jO4Qy3W
	0vRJUAa6bRLIEn6zzwzP2UOFzXfzsllfCEVRDRgioX5CZJmzz3iFk1ot+9EvkHRcit4j9r0H+iy
	wiHh6itF0B5srybjZ/mCOSXP1yLpNgQgbFjDJpDkreBnO7vL7f26xkygEozBDdr5OrZe/DeU6/J
	mZ8F6ndUj1hsuJEV6GEZzP11tIF70aH7e2Hj6J5AL4C7TX78U0niyA6ujDXRhLFpMheE8rzk9bh
	Ycy6fEIxnxxP9iI9/4k0reA2nx8LZcKxOIlY5IlGC9pJwnR5dHCM1jR4ScnXFr6woD/nplxAhAi
	6ZvGCiIKum9zNvAkN3Xf7cAguvEAQD1Zk37Fq51GtpI1bTNuWIBodvyRpBhaTpWQdUGj2UPPs6d
	QgzX2+VsKbVNnI=
X-Received: by 2002:a05:600c:6cf:b0:488:a82f:bb95 with SMTP id 5b1f17b1804b1-488a82fbd0fmr78912275e9.29.1775552982905;
        Tue, 07 Apr 2026 02:09:42 -0700 (PDT)
Message-ID: <d0e8afc6-ba85-466d-be65-685b0731741a@suse.com>
Date: Tue, 7 Apr 2026 11:09:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] xen/riscv: add definition of guest RAM banks
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <8278256f3d270b456d19cb9891b89b88a46548a5.1774281309.git.oleksii.kurochko@gmail.com>
 <1a3a316e-f0ea-4514-95d6-9813d6d5ca76@suse.com>
 <691be850-9145-4bbf-a897-d10a0193b730@gmail.com>
 <dfd2a666-f3a5-4d88-b034-438f8fbb85ba@suse.com>
 <2bae9e12-8f71-4ff0-b077-bfb4215e5e14@gmail.com>
 <ffd3a7cd-8c47-4a9b-864a-26a053b5b7d2@suse.com>
 <bc5a9826-c1ff-43b2-a3d1-1a4862301aea@gmail.com>
 <0e37083a-42ab-4c99-83fc-b77f519394b9@suse.com>
 <912263a2-8dff-414e-bea4-64428ce2ec36@gmail.com>
 <4a1f7cfb-df74-4083-a681-f79911da10e1@suse.com>
 <538d86ca-2a87-4d22-bdd6-ecee3f89cead@gmail.com>
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
In-Reply-To: <538d86ca-2a87-4d22-bdd6-ecee3f89cead@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1775552983-1039741E-746A4110/0/0
X-purgate-type: clean
X-purgate-size: 4245
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1F5143ABC2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07.04.2026 10:54, Oleksii Kurochko wrote:
> 
> 
> On 4/7/26 8:23 AM, Jan Beulich wrote:
>> On 06.04.2026 17:43, Oleksii Kurochko wrote:
>>>
>>>
>>> On 4/1/26 5:10 PM, Jan Beulich wrote:
>>>> On 01.04.2026 16:53, Oleksii Kurochko wrote:
>>>>>
>>>>>
>>>>> On 4/1/26 4:22 PM, Jan Beulich wrote:
>>>>>> On 01.04.2026 15:57, Oleksii Kurochko wrote:
>>>>>>> On 4/1/26 8:17 AM, Jan Beulich wrote:
>>>>>>>> On 31.03.2026 18:14, Oleksii Kurochko wrote:
>>>>>>>>> On 3/30/26 5:51 PM, Jan Beulich wrote:
>>>>>>>>>> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>>>>>>>>>>> The dom0less solution uses defined RAM banks as compile-time constants,
>>>>>>>>>>> so introduce macros to describe guest RAM banks.
>>>>>>>>>>>
>>>>>>>>>>> The reason for 2 banks is that there is typically always a use case for
>>>>>>>>>>> low memory under 4 GB, but the bank under 4 GB ends up being small because
>>>>>>>>>>> there are other things under 4 GB it can conflict with (interrupt
>>>>>>>>>>> controller, PCI BARs, etc.).
>>>>>>>>>> Fixed layouts like the one you suggest come with (potentially severe)
>>>>>>>>>> downsides. For example, what if more than 2Gb of MMIO space are needed
>>>>>>>>>> for non-64-bit BARs?
>>>>>>>>> It looks where usually RAM on RISC-V boards start, so I expect that 2gb
>>>>>>>>> before RAM start is enough for MMIO space.
>>>>>>>> Likely in the common case. Board designers aren't constrained by this,
>>>>>>>> though (aiui). Whereas you set in stone a single, fixed layout.
>>>>>>>>
>>>>>>>> Arm maintainers - since a similar fixed layout is used there iirc,
>>>>>>>> could you chime in here, please?
>>>>>>>>
>>>>>>>>> Answering your question it will be an issue or it will also use some
>>>>>>>>> space before banks, no?
>>>>>>>> I fear I don't understand what you're trying to tell me.
>>>>>>> I meant that there is also some space between banks and pretty big which
>>>>>>> could be used for MMIO which could be used for non-64-bit BARs.
>>>>>> I don't follow: Bank 0 extends to 4G. There's no space above it, below
>>>>>> bank 1, which could be use for non-64-bit BARs.
>>>>>
>>>>> So we have two banks:
>>>>> bank[0] -> [0x80000000, 0x100000000)
>>>>> bank[1] -> [0x0200000000, 10000000000)
>>>>>
>>>>> So i think we have some space between them [0x100000000, 0x0200000000)
>>>>> -> 4gb to be used for non-64-bit BARs.
>>>>
>>>> But a non-64-bit BAR need to be assigned an address below 0x100000000?
>>>
>>> Right, I had in mind that RV32 uses for guest Sv32x4 which could
>>> translate 34-bit GPA into 34-bit MPA and automatically applied that to
>>> 32-bit BAR...
>>>
>>> I can keep first 4gb for MMIO purpose and start bank[0] at 4gb as 34 MPA
>>> address space is more then enough to cover reserved 2gb of bank[0] after
>>> 4gb.
>>
>> Yet having no memory below 4G won't work for guests wanting to run in bare
>> mode? Don't guests even start up in bare mode (and hence 32-bit ones need
>> to have some of their memory below 4G in all cases)?
> 
> I thought about such use case but decided that no one will want to run 
> guest in bare mode and that is why we have:
>      if ( max_gstage_mode.mode == HGATP_MODE_OFF )
>          panic("Xen expects that G-stage won't be Bare mode\n");

How does HGATP matter here? We're talking of guest physical address space
layout, and hence it's SATP which matters.

> Probably it is wrong assumption and we really want to support Bare mode 
> for guest too. Let me know if I have to drop the panic above...
> 
> Then it isn't clear what will be the best layout for the current 
> limitation that guest RAM should be compile-time constant for dom0less 
> solution.
> It looks to me that giving 2gb reserved for MMIO and 2gb for guest RAM 
> is fair enough.
> As an option 3gb for MMIO and 1gb for guest RAM will be enough as only 
> Bare model will have such small amount of RAM, for other modes part of 
> bank[1] could be used.

All of which only supports my take that you don't want to make guest
memory layout an ABI property. Using compile-time determined banks for
now may be okay(ish), but in the longer run things will want determining
dynamically (or specifying via per-guest config).

Jan

