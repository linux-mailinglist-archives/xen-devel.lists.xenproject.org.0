Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPcODxExxWkP8AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 14:13:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E944335C33
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 14:13:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264083.1555818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5kWQ-0005ik-5C; Thu, 26 Mar 2026 13:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264083.1555818; Thu, 26 Mar 2026 13:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5kWQ-0005fg-2S; Thu, 26 Mar 2026 13:13:14 +0000
Received: by outflank-mailman (input) for mailman id 1264083;
 Thu, 26 Mar 2026 13:13:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5kWO-0005fa-Tz
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 13:13:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5kWO-0030gP-9E
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 14:13:12 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c530e3-2eae-0a2a0a5409dd-0a2a4502ca06-24
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 14:13:12 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c530e7-63bb-0a2a45020019-d1558034cc32-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 14:13:11 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-48540d21f7dso10582775e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 06:13:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4871fbdcc65sm17188485e9.13.2026.03.26.06.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 06:13:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1774530791; x=1775135591; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jChPMHIfCy74iW13t1kHRV+MEl7Qtl/7pc2UcsldZLw=;
        b=D5kb26OmtBCV1++S37CRRas6Ozt6fys9AvqcvD8La1IcXm9n72KHaZj+e+hf6AX7+1
         fNpxGz7kfl+wcWVanjXiUSB4WurQFZ7FowQduVkIIVuWut8OxJ0TRwv/G5NEgB0lAVSG
         gdsyJMFeWp21ahIdBEuWGTjoGLj3dbDjdVteY4SJsQjDQRzmhQ9VJyRgqo8yjs8uY1B5
         7EpeYOlL2Ef9UuSmVStHjpBurNnA52D3UCI2sDodbD8rc9g+Fypbc2sMSYOl74mzxpeE
         FSGvB6YsLyjBvHkBK4np2dpigniTApLOBxY3xcU28UkrC7rITwNdHrJqk709ccICOmEN
         jyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774530791; x=1775135591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jChPMHIfCy74iW13t1kHRV+MEl7Qtl/7pc2UcsldZLw=;
        b=aQ6R8dYJmfqisVZIilvxYV/tutWQzTRcy+qm4t1JVpbJHpqgygduDRU0Kx63eYXyAE
         pwyFMwWq7z1HvIouIinRTM/LHopP48fE0paPvn6HQBZfb70G15IEyF7GAX0g53NrOPUB
         Mipe/EorOYHcFqURuZxsZRPFrgnOaeXYsyMKnlKF7wCfxbLvp/ub3FV3rI8cuILc01lX
         DCLCfrGCu96YAg5Jr5ZEbgGPzEaWfeN1vdzEbdjhmEhTkEYEpaQ3Uqo78Yg35xfAZSeq
         IDL4G+PyB/gNd53y28EKsaxepIcZ16pIs+c8F3OK/KWpKcPpccx9l0ZFLSXXxGbpVaiF
         bAQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh96UBu1LVnHHgUFM65CEWbI9+XcvoINgBKUJ7Y9CStLCIeXUkHSe9EN91W6YC0NSz88WHU98b3t0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxgll2sgMEVAQoHf2RRX6MADQ3Yh/jc6ZXiCt6dwGYgf76dVkRH
	n/e+a6Sb3rC44RxdSf9d9cstgVg6K56qpF4/l1alC7QgE/VZsBjaBZin+8SiN+Pp/g==
X-Gm-Gg: ATEYQzxi8pD+B6MLcqkAxN0DwxQ+YXRy+SoUqG/DrfRi1vxbtTqB63z6cDXlKsI+US2
	6XbAwluM3Av5CankO55d2i2aL5bK7wMDQTucG0LYMfmDAICxlgu9Cr/p5Nv4dELsa99wZDMaivN
	k3H5+yB0oWVf+7YrIczmZ+bwen23hs49WQIfP91sbs8rX/3mwDYo1rdEp+qTpXnOo1tIseMn8U7
	d434T8DTGx9uQTsCubbioCn49OQ74Nx6QYW6pSTaSWiHNGIp7zw8Ni+90rQRYq9Na7cRmRulJcr
	wZxNZs7xmkIU4RLHVyt33VabriIE09QrnvYkcaSo+rn0uA1tFT+kHX85gGckXiuskEQhWepGWUP
	WPCNixrJjRWUNAscla53lUOZb1/dqMUueiitbMRGh1ERN4OpIDa1sNdJgydvH4HCp2bkLRDctRg
	lIcfdyptLIN5nojwNpmhJnGJOtIniuKNlRoE5yKUbMsZKn+QNwMGFbWGf/7beGTi1q9E2iNUCkt
	pTJTXKXpku+FOk=
X-Received: by 2002:a05:600c:8b88:b0:487:1c2:6a4c with SMTP id 5b1f17b1804b1-48715fbf6a6mr124172175e9.4.1774530791084;
        Thu, 26 Mar 2026 06:13:11 -0700 (PDT)
Message-ID: <5ae7f228-d0d4-4e4a-8353-e2de59b6fd8b@suse.com>
Date: Thu, 26 Mar 2026 14:13:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/intel: Add recent CPU models model-specific LBRs
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Tu Dinh <ngoc-tu.dinh@vates.tech>
References: <888b0df36c6706de9d7ec1c5c4cc229297699670.1774519884.git.teddy.astie@vates.tech>
 <975b6883-646d-4db4-b931-b21c45d0507b@vates.tech>
 <1e95cf58-0e40-4cfe-8ac9-cd31d97f8330@suse.com>
 <7ccb48df-8255-4e01-9367-f9496fe2ee18@vates.tech>
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
In-Reply-To: <7ccb48df-8255-4e01-9367-f9496fe2ee18@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1774530791-BD69EDB8-93D6725C/0/0
X-purgate-type: clean
X-purgate-size: 3379
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xcp-ng.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:ngoc-tu.dinh@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8E944335C33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26.03.2026 13:54, Teddy Astie wrote:
> Le 26/03/2026 à 12:05, Jan Beulich a écrit :
>> On 26.03.2026 11:35, Tu Dinh wrote:
>>> On 26/03/2026 11:21, Teddy Astie wrote:
>>>> Add all CPU models that supports these MSR as they are defined in February 2026 SDM.
>>>> It uses the same list that span from Skylake to latest CPU models as a part of
>>>>
>>>>       MSRs in the 6th—13th generation Intel® Core™ processors,
>>>>       1st—5th generation Intel® Xeon® Scalable processor families,
>>>>       Intel® Core™ Ultra 7 processors, 8th generation Intel® Core™ i3
>>>>       processors, Intel® Xeon® E processors, Intel® Xeon® 6 P-Core
>>>>       processors, Intel® Xeon® 6 E-Core processors, and Intel® Series 2
>>>>       Core™ Ultra processors
>>>>
>>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>>> ---
>>>> Currently, none of these MSR are exposed on these CPUs, leading to BSOD [1]
>>>> in Windows when it is supposedly trying to debug some program.
>>>>
>>>> I guess [2] is also caused by these missing MSRs.
>>>>
>>>> [1] https://xcp-ng.org/forum/topic/12008/application-on-vm-causing-bsod
>>>> [2] https://lore.kernel.org/xen-devel/ced16fca-3b55-40a1-a7e2-ffadd9707394@vates.tech/
>>>>
>>>>    xen/arch/x86/hvm/vmx/vmx.c | 16 ++++++++++++++++
>>>>    1 file changed, 16 insertions(+)
>>>>
>>>
>>> I don't think CPU models with architectural LBRs should be stuffed
>>> together with the model-specific ones instead of having their own case.
>>
>> I agree. We want to at least determine (or even enforce) how many LBRs
>> are accessible. After all we can't be sure the DEPTH field hasn't been
>> altered before we gained control.
>>
>> Beyond that, because arch-LBR enabling is a significant effort, I guess
>> using the existing machinery for the time being might be okay.
>>
> 
> While Architectural LBR support could be useful on its own, I don't 
> think it would be enough.
> 
> If the guest is started without architectural LBR, the guest could 
> default into using model-specific ones (basing eventually on 
> Family-Model). That can happen if we migrate a guest from a Skylake-era 
> CPU to a Granite Rapids, yet we still need the guest to keep access to 
> model-specific ones, especially if they are stable across these CPU 
> generations.
> 
>>> With that said, short of fully implementing arch LBR, it might make
>>> sense to at least stub out the LER MSRs to allow Windows to read them
>>> without crashing, as certain versions of Windows use LER MSR indexes
>>> without checking the arch LBR CPUID bit.
>>
>> This would be too Windows-centric for my taste.
>>
> 
> A few specific LBR MSR happens to be stable and are identical between 
> architectural and model-specific lists.
> 
>      MSR_IA32_LASTBRANCHFROMIP 0x000001db
>      MSR_IA32_LASTBRANCHTOIP 0x000001dc
>      MSR_IA32_LASTINTFROMIP 0x000001dd
>      MSR_IA32_LASTINTTOIP 0x000001de
> 
> In Xen, we already consider them somewhat "architectural", for instance, 
> traps-setup.c:init_ler always uses MSR_IA32_LASTINTFROMIP unless you are 
> running on a Pentium 4.
> 
> Perhaps for these ones at least, we should always expose them (unless 
> you are a Pentium 4) ? It may be enough to prevent some guests from 
> crashing when trying to access it.

Might be an option, yes.

Jan

