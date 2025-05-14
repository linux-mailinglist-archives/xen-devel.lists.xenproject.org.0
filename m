Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FD0AB6C81
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 15:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984321.1370472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFC2e-0001MY-BL; Wed, 14 May 2025 13:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984321.1370472; Wed, 14 May 2025 13:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFC2e-0001Jy-7U; Wed, 14 May 2025 13:21:00 +0000
Received: by outflank-mailman (input) for mailman id 984321;
 Wed, 14 May 2025 13:20:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFC2c-0001Js-Tm
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 13:20:58 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 452c15fd-30c6-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 15:20:57 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5f7ec0e4978so5057790a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 06:20:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9d7016b4sm8809548a12.49.2025.05.14.06.20.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 06:20:56 -0700 (PDT)
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
X-Inumbo-ID: 452c15fd-30c6-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747228857; x=1747833657; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/mFWFbt80HwFSS8XBsPFC4uEs/obwm5wBL/ZDKhx6WA=;
        b=HWV3ouWD8+R6o42zIx6tzbFH0jI5y0/B7ek/wOqgxEJ25QPcB+vk5yeOAR2S6OnhH7
         RMDbJOfqd7j+aDFLChnwuS4DK+mJ9PpoZnBl+smmc4oumA1CyklzSeXSHWmYpMyqDi3F
         W9qmGXdCOka3G+AEYQ2ill4dKMx8XwACPxy1W/2w5LsBwPv8Pj907aE6rK2D2Nv+B818
         ppCy3w460JhRk1xb5uVeINTpY+L+ePVgjrxLZwB9WTwSfi3etUCbK+/8IgUVUsQ0EPmO
         XX+H6AkvyQLjKOZSSMS1k28r7CBZBuRGlB5VjIy2QRGxd59UM2bzWzfh2VJec6ILE7Gw
         teFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747228857; x=1747833657;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mFWFbt80HwFSS8XBsPFC4uEs/obwm5wBL/ZDKhx6WA=;
        b=grZxdSNXvO93yOpmx0a3yX/+cyx/SWO8AJcECJ2FJr0ogDUBY43B4TbSo2rbe+RLfE
         cG+sDz67GiAeZBDIeNu2wIn+2mAd9AjbpcXBaorLjehqwhQqVrxl1VADItEFp5NIAm39
         EjfcUx0gWt5rVdvDHj05dNrKvN75uTtCqOy1Yf9TyLcDZOBzrXjpycCMqk705f9MOAtY
         QKVg/sArkU71YWyZHIwSSka8Fti/5WUJp+ioPemYUDJ5SPGK4d1CdM8ThyPVOGqpFgLW
         HJxdBj6SJkJkMZHt4NSKoEwfrJdNT8rCaw57L0Y+ZBMkvt54j2rSbUiUzGAZjlWixPc/
         UFMw==
X-Gm-Message-State: AOJu0YzkS8wndEdigiXRnVqy60fSQdqpfiS1L28s0Ecgytqp7U7zYjS/
	WnEvOGimMqg5qpVFS544yIt0Cqbruo5N2GmQxIUgE4PP3o93f+3zQ9U+wWFohQ==
X-Gm-Gg: ASbGnctW3255O8bM8UboaBkSexEGy7BH4Tsnd5oBXoEOivROLrjHR8SWs/8JwwVqYlE
	UGYIKtL+epbXneWUpVZu6Y2XUtXPg2GNKd1BG2POM0Nbdef2i3Swv4J7AIR5HvMpGFM6YKopANn
	w5bIjFuytQJo//9CA1GHSrTSXLljYz97wCEZ22+itXqGZMZR+DkXWYgxF9TcZxBL8WnCQnwk2rz
	sGFWa8XMdQ0iiy2wUJB7nqdcMhfjm1Ih6A8mRehCiR/hE42K4PU51uZ0KzgO0Lw/4NB5SvuE3x0
	BRCY2h7W4eVYCiMqUVCSC6cmZqgwMwcUmEYMVKJNEV3Ww3cF8iPhHNk3qzKzX81jy0T78dgJ5+l
	zB3dEbecy3unIiL5ygRU458PansqqZd2GItl78UFQFs0j2L8=
X-Google-Smtp-Source: AGHT+IEf8npOC9j5qFNGmxRUhzlEedfVagFPxEpncaFs2jfte7ehe0nBbOuLACFnpf5A0Tz6lvlzBQ==
X-Received: by 2002:a05:6402:358e:b0:5f8:e6de:fd0f with SMTP id 4fb4d7f45d1cf-5ff988acc0amr2810920a12.15.1747228857187;
        Wed, 14 May 2025 06:20:57 -0700 (PDT)
Message-ID: <be7e2d91-69f5-4168-9d2c-57d3f6dac26f@suse.com>
Date: Wed, 14 May 2025 15:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] x86/HVM: limit cache writeback overhead
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <9274fbb1-c1be-9570-ecfc-8f0ac9a1f42b@suse.com>
 <aCST30l2N9X6AOgr@macbook.lan>
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
In-Reply-To: <aCST30l2N9X6AOgr@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2025 15:00, Roger Pau Monné wrote:
> On Wed, May 03, 2023 at 11:47:18AM +0200, Jan Beulich wrote:
>> There's no need to write back caches on all CPUs upon seeing a WBINVD
>> exit; ones that a vCPU hasn't run on since the last writeback (or since
>> it was started) can't hold data which may need writing back.
> 
> Couldn't you do the same with PV mode, and hence put the cpumask in
> arch_vcpu rather than hvm_vcpu?

We could in principle, but there's no use of flush_all() there right now
(i.e. nothing to "win").

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> With us not running AMD IOMMUs in non-coherent ways, I wonder whether
>> svm_wbinvd_intercept() really needs to do anything (or whether it
>> couldn't check iommu_snoop just like VMX does, knowing that as of
>> c609108b2190 ["x86/shadow: make iommu_snoop usage consistent with
>> HAP's"] that's always set; this would largely serve as grep fodder then,
>> to make sure this code is updated once / when we do away with this
>> global variable, and it would be the penultimate step to being able to
>> fold SVM's and VT-x'es functions).
> 
> On my series I expand cache_flush_permitted() to also account for
> iommu_snoop, I think it's easier to have a single check that signals
> whether cache control is allowed for a domain, rather that having to
> check multiple different conditions.

Right, adjustments here would want making (in whichever series goes in
later).

For both of the responses: I think with patch 1 of this series having
gone in and with in particular Andrew's concern over patch 2 (which
may extend to patch 3), it may make sense for your series to go next.
I shall then re-base, while considering what to do with patches 2 and 3
(they may need dropping in the end).

Jan

