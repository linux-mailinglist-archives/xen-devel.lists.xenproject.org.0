Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NUYMIAJ+2mbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:27:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EB14D898E
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301399.1575682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYXI-0004Zb-3a; Wed, 06 May 2026 09:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301399.1575682; Wed, 06 May 2026 09:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYXI-0004Wn-0n; Wed, 06 May 2026 09:27:20 +0000
Received: by outflank-mailman (input) for mailman id 1301399;
 Wed, 06 May 2026 09:27:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKYXG-0004WP-Ke
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:27:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKYXG-008BSD-1T
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:27:18 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb0969-e002-0a2a0a5209dd-0a2a4509e890-32
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:27:17 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb0975-2497-0a2a45090019-d155802be853-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:27:17 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488ff90d6c7so58591255e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 02:27:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e530c5c89sm12408585e9.13.2026.05.06.02.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 02:27:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1778059637; x=1778664437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t6MioergbvV9Lj3spGhq0jlNnllO4Gf3MbTVU2pA/ZE=;
        b=YVC/maTHkgCFk0wRDn0lW+H2RE1+n9r+BCnj7LRE2lKOGWDvL/XmUNC/h8Z7bmbUjN
         KgCNX4yh+wFEhCEk745uvm0D+tXlQj9sjqgTYcTS9AJCA020vzkwlxgrI0P6GfdhW9RO
         xPmSDu3V0f3LUj5wkFuH6fG565bbGuuw+8mIejLcSJoLX9MoP6Cp+f/t5KP80yX/pWy3
         zEWY7EAjerdTImmjbOidm9lLkASCmakcxLtHvvBUB9wyYgX+msaYnL0qN2YbPMMF7NEN
         FSN+NmiDgvNmj/aGI2/pJoajmmJoktKxdqRo38V+yiD9i/cQ3mrQSrZPR3x49tPMECBr
         othw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778059637; x=1778664437;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6MioergbvV9Lj3spGhq0jlNnllO4Gf3MbTVU2pA/ZE=;
        b=p+qWImVbXimgOCCnxup2fZYsTS6oMrtgSfqreBQ6ntBtBCpm9uSKP7ol+BD7bFOEQe
         rtsfh98kTYOl4BqVuSHI8LQQPj9yDIfGgSDU3roIpq0tKjHECaJhkW7MzU/mCx+Fd1Sf
         +U5yNJWH+84gBKfJtWOY7QMfFFx4T7WWEyx5CzOMGXZONujRoi+Ww++LvjZcmzXF+AXw
         faZbMUTze/Ja4SgBGST3aobMmYcXVFzrlhvlpk/JP6WjHYY9Z50UT0apy4ntK6H7i1dw
         GbuT6k8WUM91JFPrybRZTf2ylFK1RFL7ey/GvCZwHH2XoqKkyiOzQianyr3SlC6SqKQk
         EpwA==
X-Forwarded-Encrypted: i=1; AFNElJ8gNV5enJTXHmEE1nbwgdoEebBrFz8nrYgMMH7acKmHYiMLTH1o5NQaASv2U4L+fyBM88WCNmvJOj0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4zFaIwdS41SGlqyrTEl0MJcrlIIXA8yYZA5qpWxr6nId1jaut
	WJhQ4VnuQcISTD97nvnHFSbVHDEwAIJn2cnKXEJykQbA1EoGD5d1+EQs0Db3ZTwR2Q==
X-Gm-Gg: AeBDievcstNQn2Wa32BHrCrvsvdNZ7obI5tKuiA5uUMlb4D3Ni/L7RP7WeIF+9PPhyb
	yNV/l2VBDDzH4bj4VyWWE5C+ZE6hLKZWwkJKNX2fhQ9XrV12IW2yLn96AczSk3Ee8dezlA+C77A
	ucgG2zgqbFwOBXZy3ye5Ugs3xF7NWbm2MUO4KNk5mM6IZbf5rhk4xf/u2dhXqZnQ+fkyrO3Ve3F
	299MUtvV4thWurmuV7Yc8P0Gzm3dzBW7WG6yUkMaKx9cshUdkIzzczRAYR9Moy62xzKUmQm2FoT
	s3JWdw3gA4kW2WLtlFgXuFDE9JxA0Fzx6WwDjlxpURJppmerE6e7SojiAOFidIBm83WJLTtzzZd
	WfRdw4coQ+fAytuOX0zd+Liitd0ntfi1FYHrBvxtLq7Ae3ERgT0YzcXGtsRm0aWD1qNH0UCWGVm
	3AuVCAQv7qc6jGxK93eOOEDLESJ9cANEeydcbXIXUvE8QC3keFqEW/5IA008QdUHvp6ZQkXSCUT
	bB4ieTkt8Z20BLeNZ4ZurKBVw==
X-Received: by 2002:a05:600c:a305:b0:48d:361:4df6 with SMTP id 5b1f17b1804b1-48e51e19680mr31228675e9.9.1778059637254;
        Wed, 06 May 2026 02:27:17 -0700 (PDT)
Message-ID: <266af4e3-fbb7-4e2e-a4ae-933c20867b44@suse.com>
Date: Wed, 6 May 2026 11:27:15 +0200
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
 <1d771706-35b1-4d6c-bcd8-a3bccfa825f3@suse.com>
 <b1fb3f1b-9f83-4007-9854-6cc6d698876b@citrix.com>
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
In-Reply-To: <b1fb3f1b-9f83-4007-9854-6cc6d698876b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1778059637-41B68A53-A2277708/0/0
X-purgate-type: clean
X-purgate-size: 3029
X-Rspamd-Queue-Id: 36EB14D898E
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

On 06.05.2026 11:02, Andrew Cooper wrote:
> On 06/05/2026 9:32 am, Jan Beulich wrote:
>> On 06.05.2026 10:20, Andrew Cooper wrote:
>>> On 06/05/2026 8:37 am, Roger Pau Monne wrote:
>>>> @@ -1367,11 +1355,14 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
>>>>  {
>>>>      int rc = alloc_ivrs_mappings(iommu->sbdf.seg);
>>>>  
>>>> -    if ( !rc )
>>>> -        rc = map_iommu_mmio_region(iommu);
>>>>      if ( rc )
>>>>          return rc;
>>>>  
>>>> +    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
>>>> +                               IOMMU_MMIO_REGION_LENGTH);
>>>> +    if ( !iommu->mmio_base )
>>>> +        return -ENOMEM;
>>>> +
>>>>      get_iommu_features(iommu);
>>>>  
>>>>      /*
>>>> @@ -1381,6 +1372,11 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
>>>>      if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
>>>>          return -ERANGE;
>>>>  
>>>> +    /* Read current control register and forcefully disable the IOMMU. */
>>>> +    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
>>>> +    disable_iommu(iommu, true);
>>>> +    iommu->ctrl.raw = 0;
>>>> +
>>>>      return 0;
>>>>  } 
>>> These two things are unrelated at want splitting into separate patches
>>> at a minimum.  The removal of memset() critically needs backporting.
>>>
>>> As for disabling the IOMMU, I'm not certain it's wise.
>>>
>>> Linux can already "bring up" an already-live IOMMU and Xen needs to gain
>>> this ability in due course.  This is mainly for supporting PreBoot DMA
>>> Protection, but also for things like the kexec environment.
>> While I agree we would better support this, as per my reply to Roger: How
>> is that going to work if the IOMMU has features enabled we may not even
>> be aware of? We'd still need to blindly clear everything we can't drive
>> ourselves.
> 
> Zeroing 16k of unknown MMIO is completely unreasonable.  It is not RAM,
> and 0 is not a safe thing to write into an unknown register.

From a very general perspective I agree. However, when adding new registers
(or new bits in existing ones), having them default to 0 (and hence making
0 be a valid value) is common practice.

> But to the AMD IOMMU specifically, the spec makes it clear that there
> are registers configured by firmware that we are expected to leave alone.

Well, okay. For firmware settings I think we can assume these would indeed
be settings, not enables of any features which would typically require
driving by an OS. Yet that still leaves the question (along the lines of
what I had raised before) of how we'd deal with being invoked with unknown
to us features enabled. We need to disable them, yet how do you suggest
doing that without blindly clearing most (if not all) registers? The only
clean way of doing that would look to be a "soft reset" command to the
IOMMU (of course not to be issued via the command queue). I'm unaware of
anything like this, though.

Jan

