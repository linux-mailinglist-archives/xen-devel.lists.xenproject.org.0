Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCj7GEZ3ymnk9AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 15:14:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D4F35BC0E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 15:14:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267631.1557090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7CRl-0002gz-UA; Mon, 30 Mar 2026 13:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267631.1557090; Mon, 30 Mar 2026 13:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7CRl-0002el-RC; Mon, 30 Mar 2026 13:14:25 +0000
Received: by outflank-mailman (input) for mailman id 1267631;
 Mon, 30 Mar 2026 13:14:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7CRk-0002ea-Et
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 13:14:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7CRj-008IG3-NF
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 15:14:23 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca771f-bab6-0a2a0a5309dd-0a2a4506891c-48
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 15:14:23 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca772f-3034-0a2a45060019-d155dd2bacc4-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 15:14:23 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43b983bb07eso2243242f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 06:14:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf21ebef9sm19935817f8f.13.2026.03.30.06.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 06:14:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1774876463; x=1775481263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSqrni6DqIrxEPhZ9hSWrm/UDd1g4U0+JQ1ZYvAYX74=;
        b=KTD7azAMLDLZo9x51BjNNs4rvDZAaIcEqSjnuAbKz1gr5sXGGrIDNmvLxmvrzamLKV
         D06wgboMEuBu8AhK+hLY5OS6GSNeVY/XCWzYNpeINXWfySOOtexKyccdly/dgw3QdOCD
         6FksTRB8NZfBVR9b5X2io+f3FC5S2A/GOkACaFbF9sVNt/jrdzP+zG3AA4nwftG5uUHf
         hQjaOZVr0p4BIX10Pf6pMxo73bXlXBPi0S3JlLRHXVAnBzBA7XIoUKcqyY/xJW47lL7e
         cH1bLydmtr2h6das+2L0w4VHzcbXUKHk8kPrbchRm9dfRG0bnSUs3dLBJ0EQvEksGvQW
         l27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774876463; x=1775481263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSqrni6DqIrxEPhZ9hSWrm/UDd1g4U0+JQ1ZYvAYX74=;
        b=fgddIWStW1B5sd05ZM/vCJWbu2RizmcNjVRqGqeCWoFVOccjDI7aj13K9x0ou44eao
         EEq0jxL+bt09Q5uEeH+Zfc9VnPj2GylhdSNVTAhpFeAk4jJRq+51xuCWeLc8vYwYPvXM
         vzI9NjiAm6v4VtaflivnZYql+1ZrV4XSTEY7llG0WlJ2Wy6WcIKh9n1zdQqnFvxF64rN
         OM424B0qM9HOPqs0DG6a+v973Hl8Y+bdIgfwDSdf2u/nP6DxTotfxKLxVg9r6Ns4dAzK
         iRkmidhH6lPaGuxj7E6QB63GtJOuNogo/YFoG/Zp0G78GmAR8y8A8QdQQtrRD9hohRGR
         qzzg==
X-Forwarded-Encrypted: i=1; AJvYcCU+7pD5/kdX/L9reESWXDOz/qqc3D+7N1HrEyN9P1UjILSSc7oSAgQcJlDIdMU2F9LqdIs/am6WsAE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/SFsaOhVtFfjf1dP9SVtpUqlN0vBMODfCj/L/nPPTiBdKa5qe
	LKKufjy3+I/8thdWhUQe6oQKCO5bmPzzJeq7cooan4CwPU1oOR9Uz0JmKm2DeXaqLA==
X-Gm-Gg: ATEYQzybZhm35CbdFMsdrTQqwNCGrqQM+t9OQH/JCHa6Q2SMtnF4YdOr6gb3HgAaHlP
	YhvOmFBSq4MU5C+Hb/u4DwKfIiruZa8yPuosonebyycOyj+e/aG3Is/gDCqYDdREJ+3JpU/uFk/
	r4kdam1ZDQsdu+/UAzYcB4DR6Cdzcg1tzuEUvZ+osCitfPbht7AbKJL33KEfKE3Uy8Kyqmxo1IW
	knrze7hUgVJ/qM/h39fqbLZNT6KVFsTndwY8fy7rc7wQruThFfhvMdQ5WNGOnDM3ejnyg3Yxa+m
	+y0cn9wX1DrqR+elpZzn1A5hTb5Ayp3s6VUMaQnZyz7RldYKSSxVFdN0v61ybuj3kyfWvr60mfy
	LBG5PsWRKxsCqAM4xdBWMAw6ordJHk+1tukkQCDHIgBiSeWVy/b+6ZrHaneBIweqq3Yzv2IP8LE
	7gLqR3lb5pwMXNEIh7X62282dUCR+tr3JnboYUz07T9m0qsqrTfgwACqrmpAX3pc5sTKxXhIZwL
	BxXVPyWDFQYMFw=
X-Received: by 2002:a5d:64e6:0:b0:43b:3d54:3154 with SMTP id ffacd0b85a97d-43b9e9d5e5emr19167376f8f.7.1774876458988;
        Mon, 30 Mar 2026 06:14:18 -0700 (PDT)
Message-ID: <df084abe-f005-450c-ba45-4ee79427c4e5@suse.com>
Date: Mon, 30 Mar 2026 15:14:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen: introduce shared_info_to_gfn()
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, alejandro.garciavallejo@amd.com
References: <20260327075025.3008606-1-Penny.Zheng@amd.com>
 <20260327075025.3008606-3-Penny.Zheng@amd.com>
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
In-Reply-To: <20260327075025.3008606-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1774876463-797881C2-61ECCD93/0/0
X-purgate-type: clean
X-purgate-size: 1561
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Penny.Zheng@amd.com,m:ray.huang@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
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
X-Rspamd-Queue-Id: C9D4F35BC0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27.03.2026 08:50, Penny Zheng wrote:
> On ARM, mfn_to_gfn() is a simple identity macro that actually does not return
> the correct GFN for domains other than direct-map ones, so getdomaininfo() is
> returning the wrong shared_info_frame on ARM.
> 
> Introduce a common shared_info_to_gfn(d) macro to output correct GFN for both
> ARM and x86 in getdomaininfo():
> - ARM: uses page_get_xenheap_gfn() to read the stored GFN
> - x86: simply wraps the existing mfn_to_gfn() solution which consults the M2P
>        table
> 
> Suggested-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> Signed-off-by: Penny Zheng <penny.zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
preferably with ...

> --- a/xen/arch/x86/include/asm/p2m.h
> +++ b/xen/arch/x86/include/asm/p2m.h
> @@ -582,6 +582,9 @@ static inline gfn_t mfn_to_gfn(const struct domain *d, mfn_t mfn)
>          return _gfn(mfn_x(mfn));
>  }
>  
> +#define shared_info_to_gfn(d) \
> +    mfn_to_gfn((d), _mfn(virt_to_mfn((d)->shared_info)))

... the excess parentheses removed from the first argument. (Can be
adjusted while committing if no other need for a v2 arises.)

It also looks as if this change was independent of patch 1. As indicated
before, such information would be useful to supply right away, as it
allows this patch to go in ahead of patch 1 (if acks arrive here but not
there).

Btw, shouldn't there be a Fixes: tag? If so, and if this then was to be
backported, it being (in)dependent of patch 1 would become yet more
relevant.

Jan

