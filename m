Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOdOLkZH/GkkNwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:03:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 485264E474C
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:03:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302257.1576235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKthN-0000hb-5w; Thu, 07 May 2026 08:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302257.1576235; Thu, 07 May 2026 08:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKthN-0000fE-2A; Thu, 07 May 2026 08:03:09 +0000
Received: by outflank-mailman (input) for mailman id 1302257;
 Thu, 07 May 2026 08:03:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKthM-0000et-1l
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 08:03:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKthL-0018Is-EQ
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:03:07 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fc4738-bab6-0a2a0a5309dd-0a2a4505d798-34
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:03:07 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fc473b-aaa8-0a2a45050019-d1558031c540-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:03:07 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so3013785e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 01:03:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45052483166sm17668275f8f.7.2026.05.07.01.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 01:03:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1778140987; x=1778745787; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fxkRZ+aMdP0cnIKmyoGVUurcdK1pUfdLgrXpy2w3TOI=;
        b=WM2B1NBChLyyCpoI/yAPFHadD1dbiTYMFoJmj7Z5Mr4Zus6Ai3266GVpry4YOf9FLH
         xODq2o45JkTAhGezQuk70UHhQy5sEmu5llUcyKv5BH8pVEX1oppJ4ER8rwfy/pV04bsB
         wn8+MrBTW3ZpdvmyHVAHUfP41+WSSiOLd6K4MMmlYvhre/4jKYHlQ4CtxKDGe4IO+IyW
         snhNueX8CNxcluuiDfO1hlwlEz6/qLSKWzaNsurxcHFgGDp14/4gXpoeUmVPAPg0aIbf
         L74SHEpVUZMrvgAXlBihpBmFO+DcTSWnX6+8G3fr8mfqmuQ8KqWEksNib2Rs3svpMbKm
         iO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778140987; x=1778745787;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxkRZ+aMdP0cnIKmyoGVUurcdK1pUfdLgrXpy2w3TOI=;
        b=FWxnpmAZszR0MdLGthUTs7GSkprJxYoAiTsvlt8C4CBvBLIXW1AiU3c9mHWbXyWbZ8
         Q0z6+awdFA7G8zqcZtWABk4mMnBzh7Yue7RO7RS2xZ6dW6KvA4iX3W/EKCaqCd4Tt7Nw
         Ej+0EYUidwjY8m5Sc4arzqdQTUFt13PyqUwQI9/ZCV4TjoGfqEcLDiTQ3SQlryOhBF6z
         oXcRRVZyIjy6L+yBHPCiId8ZWpbIwTBG7hx6OJyBi9zR/EQGHxmcL03g/+KXXVuu6pXW
         65pK5+HyulkbTRNShufgzwhBVUG1yS2LOcPo9uIitDdxNUaOhxLnUIyODJ6hMaGllNdm
         +Evw==
X-Forwarded-Encrypted: i=1; AFNElJ/SPrcrVBOm7O+E1XwYcR7EJg+75+R6IIHhHeNvwLKXa5PlCOFPjT9m/Ymmec/VZbQ2isZnDnzFUak=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWzzX95se3mwvDHCn1Zn67M/8Tv2ZDCzswUiehUrZBvASqUGua
	lYBlStAnUV135NflcJ+UXemk2hQi1sPjTGSeehD/Nr/OOafimLWwje1jhWEbpbH0UQ==
X-Gm-Gg: AeBDietlibaR0Ll6SnDo6ur+FJmCwO4EZkzkgJV3hll+ghumvpDKkToKz7Vy6TSgzBx
	l1nFP/30laLUyCJjyaN5hKD7Yv+toU41UV4BrasB8/B6uEiKK6vR8tVflYj8YTymGX6YkIERqdE
	pUB+bUM7S6utBuEqgiBvPPj3egbvhkmOpyswP88dCAmyEl26NnAI8cWDy3IOFqua+CO7cG99uRY
	IQTSEqpQzFCIut0Xpi/B2Ebz5/EJNOJYJBNhtAK66Lq+IF9OzIXbYkgIZwtc7Chyq1n3/iY5kBn
	5b603nZbRbARiU3BEzRCBNBOm6NlcYeKGZoy78v6K2yhFLEJo/O8A1YcjI7PGuGaKYnkvYeRzEv
	DE6JkILYofSFR8pxOgd0FKw/rTQ/E/X4j+EO8gIJJXmHhphe/DlL/7VI7yJRVxiru/DpvfsAf39
	GDlAnIeaok3QpaPSLbEEFyGBvkTUe5FshCr3+GgVPzWczkxUKZzxeXvPUJCbZo8+IVk/tj8vTg8
	5+fUN9KKKsCh5nI9EYuCtJOuk3wfAY8zvFz
X-Received: by 2002:a05:600c:1d11:b0:48a:7f90:2231 with SMTP id 5b1f17b1804b1-48e51f364f3mr116908795e9.19.1778140986516;
        Thu, 07 May 2026 01:03:06 -0700 (PDT)
Message-ID: <b5d9ea51-5fef-4bae-b124-f4dbde93dbdc@suse.com>
Date: Thu, 7 May 2026 10:03:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] iommu/amd-vi: do not zero IOMMU MMIO region
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260506165157.68567-1-roger.pau@citrix.com>
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
In-Reply-To: <20260506165157.68567-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1778140987-E2193443-DA7567B0/0/0
X-purgate-type: clean
X-purgate-size: 2141
X-Rspamd-Queue-Id: 485264E474C
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

On 06.05.2026 18:51, Roger Pau Monne wrote:
> Attempting to memset the whole IOMMU MMIO region to zero is dangerous to
> say the least.  We don't know what registers might be there, nor which
> values might be safe for those registers.  On a forthcoming platform doing
> the zeroing of the MMIO region does put the IOMMU in a broken state, which
> is not recoverable by the IOMMU initialization procedure in Xen.
> 
> Instead just zero the control register, which mimics the current behavior
> with regards to how the control register is handled, and ensures the IOMU
> setup is done with the unit disabled.  This approach will need revisiting
> in order to support Preboot DMA Protection.
> 
> Fold map_iommu_mmio_region() into its only caller, as the function body is
> just an ioremap() call after the removal of the memset().
> 
> Fixes: 0700c962ac2d ("Add AMD IOMMU support into hypervisor")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

While you got Andrew's R-b, I don't view that as enough to commit it. My
prior concern towards ...

> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -42,18 +42,6 @@ static bool iommu_has_ht_flag(struct amd_iommu *iommu, u8 mask)
>      return iommu->ht_flags & mask;
>  }
>  
> -static int __init map_iommu_mmio_region(struct amd_iommu *iommu)
> -{
> -    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
> -                               IOMMU_MMIO_REGION_LENGTH);
> -    if ( !iommu->mmio_base )
> -        return -ENOMEM;
> -
> -    memset(iommu->mmio_base, 0, IOMMU_MMIO_REGION_LENGTH);
> -
> -    return 0;
> -}

... this part of the change wasn't addressed, neither verbally nor by an
adjustment to the description of what was committed. As previously stated,
blindly memset()-ing the entire area may not be the best of all options,
but the downsides of not doing this need to somehow be addressed. As
indicated, once they run out of bits in the main control register, they
likely will add a 2nd one. That'll then also need clearing, yet we have
no code to do so anymore.

Jan

