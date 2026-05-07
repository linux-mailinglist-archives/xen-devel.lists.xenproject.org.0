Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEOoCKpS/GlOOAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:51:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 862634E5271
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302308.1576261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuS4-0000sS-0Z; Thu, 07 May 2026 08:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302308.1576261; Thu, 07 May 2026 08:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuS3-0000qZ-TS; Thu, 07 May 2026 08:51:23 +0000
Received: by outflank-mailman (input) for mailman id 1302308;
 Thu, 07 May 2026 08:51:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKuS1-0000qT-P6
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 08:51:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKuRz-00ADcd-ES
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:51:21 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fc5282-e002-0a2a0a5209dd-0a2a4508d9ee-36
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:51:20 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fc5288-63b5-0a2a45080019-d155dd31a44a-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:51:20 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43d734223e4so366890f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 01:51:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45052a488d8sm18428341f8f.12.2026.05.07.01.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 01:51:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1778143880; x=1778748680; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hq4JQ5PGD4eD+MHXHGGnfQl0Efe/vA1XLl8sUvu40RU=;
        b=eInfzRR6NYj2SNkvQt1jUIwuWR8zgzNwVY3wJaYZhkFfqMNAGMWtxa+WivWHD/GAtj
         pk5z8swq5FKKisgYOKtdRYWImdX/LJF95svLBFP1eIWWuM+sCQcKm0yJI8taLJ+C+BY4
         DuH9KaXN1UtWn0cq0FTlVo01ArNjQPJ/QfM93q5Fh3goIuK6cnFQm7IG7qlq4FRAe02W
         IMUJ25eBJWiPgurs9nDJKVHBsrQ4tVAU+cz5ky9Ie4vNIBwXmWDlXmn/X9JS1WAWbDee
         J6KJBCW2V8Grllk46V6Ak4EAfpiNHqP0EJCnJe7eu5ktaBSBJE3Bc8Z13AeVkjun22Fy
         17uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143880; x=1778748680;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hq4JQ5PGD4eD+MHXHGGnfQl0Efe/vA1XLl8sUvu40RU=;
        b=gRH12Y2JmIbrQ4vT6qOQh/SfsAj+UO0MmwoyGnoEY6IQyYnKlpYM7HW0E3g2POFUz4
         KOBxZSm3J/ilEwKODfen0jkbCIb0HEXUN4Gf9kU9TnTPkO3HSim73wlzlvGL9FCHwllc
         peTFAXmhK/O1EU0gyUhWjdxquCfoqZX+cRGXJ7GTON9nd7kw+43e0lQlS5k3ZuGcALUr
         ZgstsG5EjWlLf9EqykxVdujzN93rjC7IiCJ4W67YUh5BgO4gptqtaGPvLrhr0jIs526h
         FkI6Wva7453GAzdgaJElGrvOuWA8JRpwtuaq6G4K30c2ki+6KjNC8WdwrBjgBSiy2QQg
         ecog==
X-Forwarded-Encrypted: i=1; AFNElJ+eX2wSDx9/+ujRE11z5+ytNgPXj8y4YO7ir3ayNgKUct3XD+vQws4pWH7uvr7C87oq2xRi8YSZCks=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2x2FvgHilkz+Coh+km4F3/v8ck7sM3b7plwF1WgNd9Wf24PTn
	hwjbWDkuylpXfHAkxqJfWVOc6CRNXVVXLeJV1TnBkSPj6dYx8bbrQ2e7bS2k8ntJFA==
X-Gm-Gg: AeBDievR0i7ETGRGX9VgklJSX6hg883nznFR/DsNjB+E4XC1RmyA8KTWpwCOOiizNZO
	32R3/4LYKSsiLXdzSAHBTy/63Z5GJuLE8R7RiqQHmSKqup6eJ6A8lcAogS3oPsYf3ov14p3xTQK
	b8tobziMvFd0Xy8zLeAMRT2GV0FwnWeQrQbk/3i60uu51erCwIeAhn0MAOYNaSqEDDur2qf8LwY
	rvUgeBQiAndR4OsVHhES2URn6z1+370vrs1aNnS4RhNKqjTMjAmT7RcTzLyaWkVw5QK4CkxkZic
	fYEnmSSW6w+wd3R8uaC6/RQMviwjK//LZDJ0bgsAevFVSxHf+fQwAsOs7GCOlrtE96mhew4qyCy
	FAHg/cuPJIrwk8tM2vtsz+pEvHvv/kJirK0YRzwpqOpPe58BdLsz+/fA0v/GNGIndOFdKpFS/I7
	eZKgzk6F+6uEhQeqrbj++WvQVBb3olmk+sKV0cKKbpCnb4syCUq3RWFLgAKpyS6mkDgFjxp3uLp
	FJcD4S5bFl6DnESyRCqv1l5qQ==
X-Received: by 2002:a05:6000:2304:b0:449:cd74:7432 with SMTP id ffacd0b85a97d-452e9ca040bmr2988220f8f.15.1778143879904;
        Thu, 07 May 2026 01:51:19 -0700 (PDT)
Message-ID: <b0d460d6-5828-41d5-9168-394fb54f80bf@suse.com>
Date: Thu, 7 May 2026 10:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] iommu/amd-vi: do not zero IOMMU MMIO region
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260506165157.68567-1-roger.pau@citrix.com>
 <b5d9ea51-5fef-4bae-b124-f4dbde93dbdc@suse.com>
 <afxRZtm-L1ZA8jF1@macbook.local>
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
In-Reply-To: <afxRZtm-L1ZA8jF1@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1778143880-B7370DB1-A52AA58B/0/0
X-purgate-type: clean
X-purgate-size: 3546
X-Rspamd-Queue-Id: 862634E5271
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 07.05.2026 10:46, Roger Pau Monné wrote:
> On Thu, May 07, 2026 at 10:03:05AM +0200, Jan Beulich wrote:
>> On 06.05.2026 18:51, Roger Pau Monne wrote:
>>> Attempting to memset the whole IOMMU MMIO region to zero is dangerous to
>>> say the least.  We don't know what registers might be there, nor which
>>> values might be safe for those registers.  On a forthcoming platform doing
>>> the zeroing of the MMIO region does put the IOMMU in a broken state, which
>>> is not recoverable by the IOMMU initialization procedure in Xen.
>>>
>>> Instead just zero the control register, which mimics the current behavior
>>> with regards to how the control register is handled, and ensures the IOMU
>>> setup is done with the unit disabled.  This approach will need revisiting
>>> in order to support Preboot DMA Protection.
>>>
>>> Fold map_iommu_mmio_region() into its only caller, as the function body is
>>> just an ioremap() call after the removal of the memset().
>>>
>>> Fixes: 0700c962ac2d ("Add AMD IOMMU support into hypervisor")
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> While you got Andrew's R-b, I don't view that as enough to commit it. My
>> prior concern towards ...
>>
>>> --- a/xen/drivers/passthrough/amd/iommu_init.c
>>> +++ b/xen/drivers/passthrough/amd/iommu_init.c
>>> @@ -42,18 +42,6 @@ static bool iommu_has_ht_flag(struct amd_iommu *iommu, u8 mask)
>>>      return iommu->ht_flags & mask;
>>>  }
>>>  
>>> -static int __init map_iommu_mmio_region(struct amd_iommu *iommu)
>>> -{
>>> -    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
>>> -                               IOMMU_MMIO_REGION_LENGTH);
>>> -    if ( !iommu->mmio_base )
>>> -        return -ENOMEM;
>>> -
>>> -    memset(iommu->mmio_base, 0, IOMMU_MMIO_REGION_LENGTH);
>>> -
>>> -    return 0;
>>> -}
>>
>> ... this part of the change wasn't addressed, neither verbally nor by an
>> adjustment to the description of what was committed. As previously stated,
>> blindly memset()-ing the entire area may not be the best of all options,
>> but the downsides of not doing this need to somehow be addressed. As
>> indicated, once they run out of bits in the main control register, they
>> likely will add a 2nd one. That'll then also need clearing, yet we have
>> no code to do so anymore.
> 
> I could introduce an opt-in command line option that forces the
> zeroing of the MMIO region (to have the option to resort to the
> previous behavior),

But we don't want to fully go back to this. We'd need a form that zeroes
what may be zeroed, without causing the issue you're trying to address.

> but I was (wrongly) under the impression that we
> have agreement the proposed approach was the least bad of the ones
> available, sorry.
> 
> Note how VT-d also doesn't zero the IOMMU registers MMIO page either,
> neither does it seems to zero the Global Command Register either,
> which I'm not saying it's correct, but is at least a (possibly wrong)
> precedent.  I don't think there's much we can do with the handling of
> enabled bits in possibly registers not know/handled by Xen.  Like on
> VT-d, we possibly need to rely on the firmware to handle the IOMMU in
> a half-sane configuration, with no enabled features on registers Xen
> doesn't know about.

As indicated before, for firmware we can likely rely on that. Pre-boot
non-firmware environments and especially Xen being kexec-ed (or being
run past something which was kexec-ed) may be of more concern.

Jan

