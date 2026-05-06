Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMmGHwv9+mnjUwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:34:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D914D7EC6
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:34:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301290.1575583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKXhl-0000JR-OL; Wed, 06 May 2026 08:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301290.1575583; Wed, 06 May 2026 08:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKXhl-0000H6-LO; Wed, 06 May 2026 08:34:05 +0000
Received: by outflank-mailman (input) for mailman id 1301290;
 Wed, 06 May 2026 08:34:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKXhk-0000H0-UH
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 08:34:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKXhj-00GuST-Pi
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 10:34:03 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fafcee-2eae-0a2a0a5409dd-0a2a4506dcc6-42
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:34:03 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fafc83-7371-0a2a45060019-d155dd2de40e-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:32:03 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-44c4cc7c1cfso2830886f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 01:32:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4511d8cd160sm6179909f8f.8.2026.05.06.01.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 01:32:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1778056323; x=1778661123; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E89KF/g4khFhqhXrogqnh2huhO/VJomAF3gUXy1Cm0o=;
        b=Eh0tKt+YoNNlLFh9on+j9zSaiZzFLwyUhy/LelLgfOhM3+E4JFQW20zb7LnwbDwrMU
         Qc5gBDCOtXVd6ubsq0MI2jl7IxsgaqUjsDbvZ8ki7JEgp63IK0vGAYHpDk0pyhUR9D37
         qmYZkug+w3iZNQTg23KLn8c1GfqQk4oHKkc8q8UfVB4xG8HePwpBm7HoLLrU5Bc7feDB
         UkS1T43+GJoAZh0TL9k8cJJLlsksWgvqHd/smeOQA9XFv5X922zdqFVf977yal8JSPJ5
         8aZVLThZlnIxaKWo7cPy+3HEQh8fHP0imllNlNOYpkVlRzWmfyoPF4/qnChdwKLv9N5c
         KW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778056323; x=1778661123;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E89KF/g4khFhqhXrogqnh2huhO/VJomAF3gUXy1Cm0o=;
        b=jAHDsVnfjQ9OzwyPNtvppI9bsQBYAVy4s0V41PY1adowDIZXtaBin7VD370vM4kqUJ
         R6ni7gxKwUDhOoF+x37pO9hkB1+4pS/gL2vNNQ84+7a0qxDVyYJapqeM+LTLJpjuFurD
         bp4UZDD8COm+rblczYvjnUPzM0nJERLDu9AZOGjgWfAqZRyFRLyXWbT1qE2DBP8tki21
         2c+KUL0P/x2HFbuTjvGwiCyESi/tnee4rBGhGTns5hCuXmWAcsoDEBJeF7R3zCXVK21o
         gC6p8vvSexmCkXTnS/ADCir0q9m2uDG5sF0cplMDhacIT+DCZ/k+Ks2kf48XRzqgnOqF
         7/SA==
X-Forwarded-Encrypted: i=1; AFNElJ/BM/AFdN4KBc65VpmOl+q5Dyc/UJMlaHz7SP0IsA/QAm4zZmMf77oOEF5PmcuZxJJlmgmFpJ1I5nE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYycpwbiL/irK0Eor4INPQFmGDvuTqyQs8ByazAmvdR8YHcNOy
	EmYi+Q0TNvcpowV5otH4RDTJ+wJs1gCznMshVy+ziGUYAAK+pmBB9ONqELOabNwJjA==
X-Gm-Gg: AeBDievkUBxYXqyHQnKZXGdYIRAqaaC/gNaiI9NkoGbVCDn13Eq0QEXHzqoX2ag/4WN
	yzzTDnuhAi/HabVj/U1UrYJ8FFRhqBclLnT1ZBBzp10F7FdWBTL6OAPYUD5N2Qzteh2edTZGoOE
	c6ED3gG8xOLrcL90RC+YHa8xjWPczpQVY2dSWU71FJ7juim2EFObDySa1VLWjKNJnMPl9AfP3Fg
	dClnQhaS2Pk7BiUg/Ia18yFL1fUCBNOw+CRf+sbzDdnq1eRtrtJlIOR33lzGIwSB1YnYxPQ7vCA
	QROQTC4+Ug2qpg3h7l6kkyxWRdTtLE0dpGj0YPhVXxdJqJQ84fWAbOzCTcSHGe8WvZKpuwPyXnT
	WSFlq/5fj8jyP+gN1exOJWVH8lFWPv/rC0K8b6SDHULoYhNxPqdTKtLLRjtOERDeoHiKfw6+uAN
	1LuRi8Ze2szwvBEh53nsXLs0luK0LvSKLeKIY/605QiNO/+qoGVE8uW2GuK+OYjiRwAxIGgLKMu
	OUv/D/2TfFGCJn80lIPb8/HPA==
X-Received: by 2002:a5d:64e7:0:b0:445:ed7f:ce84 with SMTP id ffacd0b85a97d-4515b524043mr3805248f8f.10.1778056322999;
        Wed, 06 May 2026 01:32:02 -0700 (PDT)
Message-ID: <1d771706-35b1-4d6c-bcd8-a3bccfa825f3@suse.com>
Date: Wed, 6 May 2026 10:32:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iommu/amd-vi: do not zero IOMMU MMIO region
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>, Roger Pau Monne
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260506073719.40075-1-roger.pau@citrix.com>
 <20260506073719.40075-3-roger.pau@citrix.com>
 <41ec5134-b117-47ee-8e59-682ac1e4a69f@citrix.com>
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
In-Reply-To: <41ec5134-b117-47ee-8e59-682ac1e4a69f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1778056323-CE777D75-FC790A96/13/0
X-purgate-type: clean
X-purgate-size: 1745
X-Rspamd-Queue-Id: E1D914D7EC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
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

On 06.05.2026 10:20, Andrew Cooper wrote:
> On 06/05/2026 8:37 am, Roger Pau Monne wrote:
>> @@ -1367,11 +1355,14 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
>>  {
>>      int rc = alloc_ivrs_mappings(iommu->sbdf.seg);
>>  
>> -    if ( !rc )
>> -        rc = map_iommu_mmio_region(iommu);
>>      if ( rc )
>>          return rc;
>>  
>> +    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
>> +                               IOMMU_MMIO_REGION_LENGTH);
>> +    if ( !iommu->mmio_base )
>> +        return -ENOMEM;
>> +
>>      get_iommu_features(iommu);
>>  
>>      /*
>> @@ -1381,6 +1372,11 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
>>      if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
>>          return -ERANGE;
>>  
>> +    /* Read current control register and forcefully disable the IOMMU. */
>> +    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
>> +    disable_iommu(iommu, true);
>> +    iommu->ctrl.raw = 0;
>> +
>>      return 0;
>>  } 
> 
> These two things are unrelated at want splitting into separate patches
> at a minimum.  The removal of memset() critically needs backporting.
> 
> As for disabling the IOMMU, I'm not certain it's wise.
> 
> Linux can already "bring up" an already-live IOMMU and Xen needs to gain
> this ability in due course.  This is mainly for supporting PreBoot DMA
> Protection, but also for things like the kexec environment.

While I agree we would better support this, as per my reply to Roger: How
is that going to work if the IOMMU has features enabled we may not even
be aware of? We'd still need to blindly clear everything we can't drive
ourselves.

Jan

