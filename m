Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GD5eLeD7+mnjUwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:29:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2830F4D7DE4
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301283.1575574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKXco-0007Eq-7b; Wed, 06 May 2026 08:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301283.1575574; Wed, 06 May 2026 08:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKXco-0007By-4L; Wed, 06 May 2026 08:28:58 +0000
Received: by outflank-mailman (input) for mailman id 1301283;
 Wed, 06 May 2026 08:28:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKXcm-0007Br-77
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 08:28:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKXcl-008tlS-JQ
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 10:28:55 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fafbc0-2eae-0a2a0a5409dd-0a2a450b8a6c-32
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:28:55 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fafbc6-212f-0a2a450b0019-d155dd29e916-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:28:54 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-44509921fbcso3137171f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 01:28:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45054b03d59sm9776015f8f.20.2026.05.06.01.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 01:28:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1778056134; x=1778660934; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vo0og7pXeo+RDukF/jhl58f2Jn79Awb6dVMaa1IMfdI=;
        b=OkdDaiCLdXauKelBa5/mTS/2CCea1JwR4v2uEm2prZ+aBAHQZUKaBKioXhFoJU4cJv
         otRdwdO1ykGrgBFpODDHbflme4r3NKFTtRRjZ9/N5igp6WqPJlvO3JbgzqVjorBTKZZF
         gR4abNQpSsPk8P+V1z0+fO0L70BtEVAPb4yEoBPXgz2wQO3QRGPlTDCrkgkZa7Gw6WLo
         YnOqqASdNdAmYIZ1MnWuDiL5fSKaFi9Yxx2HEckL7EtSVsgYp0PkrsyPEvA8QxyD+cc5
         I9j/zHIQSne5QRDPJyLV57jlqPjt0UVAWd8NYdo7wPeUJBYSPX86szVcdK8GA1fevzm8
         rJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778056134; x=1778660934;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vo0og7pXeo+RDukF/jhl58f2Jn79Awb6dVMaa1IMfdI=;
        b=pEi7+V3EK76vcilPQQqisLQMJaIp9hLByjGTX9l3jPpXWIoaen3eqMKD+uFNoDXr8o
         NvPmBJDUAPDjPGqiY0WxxVIueqAEW9hwWJDwWTFKI255+6T3CdIfJearM3T0a7/fBnk2
         aE0MFr4TFQrd9E4o9Kajlx8VeS5VGDz2QRblrvo82mU4QRcmhCYTF2QVj4aILRf6KSJY
         LLlkJKgD5ymFUXWqFJ/YwDzw08oRslDrRNRASudjT7hLSezimjMd+vNBvPpGDIdH8m2H
         7MLYuaDEea/vPkOOTDkiOoQQf/qNn+KfsJ1DRM5WjqoIQYuN/yvpWGgo9ZyOZ6slVg38
         vQQA==
X-Forwarded-Encrypted: i=1; AFNElJ/Kmcj+/rVtpsMmhLjhGov8rjsp+9UzVhtZ/VgjgsCDL11GHd1k+QvCC0Wun1vg0NOHB9OePSaQXDE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkzbUe3mL5KvVPRp2YPoyC+nqV+HoK873ni8K96NtUFxbPsh6j
	oYrcw3qDUmnr45uUc/2miZRYenEMDqte8TykvZqY/orG9PxTng1pJsrcEpWL6hYRcA==
X-Gm-Gg: AeBDieu4Bgu554ghhb956AAqEs0s8c05ybCNsfeLaMMSXiWEVCJexnjkfevC+tMGsDB
	EgZ2ua3W4Hfb6V9EevCCu5ekEKYxEDgemar7kLChhHPMCTrLC4y3X/FH91SJJGUfXwRtjkUKo49
	57xRcQ7wQpuOnUhsZ756hSL7NkVijDdItmmBplG275wto4WDsHCSTHL3A3QE/ghc8021BwU+0hi
	GqsCT/zvHhe+4pSng3q+qQgjdeKqcSMrP1eVaVhGN5EGfWCZ66893h9CJP8DIVeHAsYs30j7HN6
	NzQjLlqpoXGDv7tF2aOeyofkj9HUQglhUXxlwYUjZDUZQU9Nbgq9Y6JKq8JAnaNS7txadP8qYeg
	w2K0jkPizZgYjbY+du0MAVepK9F6FUpJ0Q1BH4upVL9zRJD3HDKZZKeKetBDnz57bMq1ICjetER
	RPhi8plTbZsMv8HguzvclXewGv7VXIUOdqEmSFwhIxVEgQQvNNc5qPDQHeqll1LyH6Ch3c/5Ufz
	EZQkhUcd1Vuh+Jjpa8HFHQAMQ==
X-Received: by 2002:a05:6000:1acd:b0:44a:75e2:5590 with SMTP id ffacd0b85a97d-4515d6bbf6cmr3759349f8f.35.1778056134505;
        Wed, 06 May 2026 01:28:54 -0700 (PDT)
Message-ID: <0035d666-2ad3-44d8-a2a8-e612dfd10503@suse.com>
Date: Wed, 6 May 2026 10:28:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iommu/amd-vi: do not zero IOMMU MMIO region
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260506073719.40075-1-roger.pau@citrix.com>
 <20260506073719.40075-3-roger.pau@citrix.com>
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
In-Reply-To: <20260506073719.40075-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1778056134-7E16DF3B-D0636BED/0/0
X-purgate-type: clean
X-purgate-size: 1067
X-Rspamd-Queue-Id: 2830F4D7DE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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

On 06.05.2026 09:37, Roger Pau Monne wrote:
> @@ -1381,6 +1372,11 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
>      if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
>          return -ERANGE;
>  
> +    /* Read current control register and forcefully disable the IOMMU. */
> +    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
> +    disable_iommu(iommu, true);

Don't you also need to pre-fill iommu->features? And with that field's use in
disable_iommu(), won't we be at risk of leaving stuff enabled which we are
entirely unaware of? Even if we fully cleared the control register (which
would eliminate the need to fetch features), down the road a 2nd control
register could appear. Has it become clear which register(s) or bit(s) it
really is that are causing the observed issue? IOW is there truly something
we may not clear? Or is it maybe that memset() really isn't suitable for use
against MMIO, especially after having switched to use of REP MOVSB when ERMS
is available?

Jan

