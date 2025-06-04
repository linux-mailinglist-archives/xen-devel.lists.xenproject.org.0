Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F1CACDAE8
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 11:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005295.1384783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMkLB-0003Ql-JV; Wed, 04 Jun 2025 09:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005295.1384783; Wed, 04 Jun 2025 09:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMkLB-0003On-GX; Wed, 04 Jun 2025 09:23:21 +0000
Received: by outflank-mailman (input) for mailman id 1005295;
 Wed, 04 Jun 2025 09:23:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMkLA-0003Od-7p
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 09:23:20 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cea549a-4125-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 11:23:18 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ad8826c05f2so1165049666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 02:23:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada6ad6a76csm1058215966b.165.2025.06.04.02.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 02:23:17 -0700 (PDT)
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
X-Inumbo-ID: 8cea549a-4125-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749028998; x=1749633798; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EgfiYkJxwVWx4NLZmNd8AFdJxqOQUYFs+rGR5lOtfT4=;
        b=Lrz9rR/Vqc80MiyEMVEGEwWYHaxY56PVqeXquHOvfHFhtzJzIpvMTnfYbNIVbW0/aL
         5c593oqSbUk6yEy5SncFMCBRywE1t3zYvrCAMbMVkZAAtT3CEzlzJMH55QkUAtvg7/iH
         41qEmWTbsdnxy33gmf5idGJgvjnrsj8z1wSxPDjo2wZJoBDOt1kxhKMeT3qmk+MYBHSg
         pmpDLl05Fhr/cgfon0VYeRystZe2NHqE3QKpziqxpPygrJHz8iKgGsM2++UPvL/7IR55
         XbxpvX/+mW2ePWwYeZUVyihZzfAaWJtAEtjrKgs/9ATito8YKw6w6XnQLYB4wXO032av
         HZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028998; x=1749633798;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgfiYkJxwVWx4NLZmNd8AFdJxqOQUYFs+rGR5lOtfT4=;
        b=ANqrc7HyT5MX58myvo+gA6Wxrlb7REDBZLfFCXBRVJ8/rt7DYHUQ+zqql61JdkDESG
         Nq/SigP7fLJ8HHTVZ75GrjxT56OusGW+1NxBaTmU6uK+8n7v/sXqjnwKHtn2GqQx6cDD
         xVdt9YRkV5VJX1m2oFNlB9Z4QmrCaT58CY+lj4qqGWQsiQVAqU6XH3GUXL4Q/BjDyQ3c
         hXTyZdWssFF8W9MqByV8ypHnZ72VVxStBwt6pxMv9Gh/nWQFSsQ9UFCEQwJjdUi/2xmK
         qfPxyj3+6/q+yxhfh9nUZPKuLcGxrphstLUhE+rrClMhxTslfs9IKE/V6b4QwnyjKsrM
         sbnA==
X-Forwarded-Encrypted: i=1; AJvYcCV5ZM9QJ3YfwcYWJ867VSO8i7ama4oNXwAIQjSyF6tHic5KGbwkt6dpywev304DuvHcWdIfEi1KKIY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysW8DMnUxUpWwKBt9VaPKf3M9hH4wEx2DJjoqmi5iOdILGWqiV
	3xpXYsT1sQaoLz2sOvKxgHLMPHNSYqOygwy788dLpAseOsH6qVuZSmNHB4+vtrEYRg==
X-Gm-Gg: ASbGncsGJkIhbeJZB1NjpPs2JS4WLmBg/fNfYiXz40SWbuyuiL9FP0NvCUA86ZHkUBq
	bFYSYbtNCPgamXa1APzBdAlxNSHeqP1YADQg8+quFMnNBEHVbtohYGSZI/bCXA8GZz8IMbzO+/P
	fZqOZjHSj9DDA4vk9gf1MEQfqq+PTQhtjEc86oBgrm2GKEP/iMPyhFHE+z+o77eV2jVlqTq5gMC
	+PKPTgeErLg0UwSAcAhs9lAIAcRQEYmOCAHO+6XpLTr8Lx/vKOG/tRXIz+3gcse8LlpSzQgwE+M
	P2BL5KBDw6g+vt+hJf54pVdnYcvUOxguclylgPVL/z4YSeIuW4YmGfBRsET/oMOQ4UiVh1LJ03x
	KM/H7nvlJ8lsnJGi3MpWsEZ7DE+59LdcqmHW0EpkdxfTK/DI=
X-Google-Smtp-Source: AGHT+IGgpWIoPNCUsFR/msoovt5w3sOf6uBMWPPPOVA5E4ZqrSYfRtQgo0KU4rEOaHeww8YweebFfA==
X-Received: by 2002:a17:907:608e:b0:ad5:bbcb:e3f2 with SMTP id a640c23a62f3a-addf8f770f3mr173429166b.39.1749028997693;
        Wed, 04 Jun 2025 02:23:17 -0700 (PDT)
Message-ID: <874fe8cd-2fc3-4007-9616-4709b2f080a0@suse.com>
Date: Wed, 4 Jun 2025 11:23:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/vpci: Use $(CC) instead of $(HOSTCC)
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250604072128.16628-1-michal.orzel@amd.com>
 <d8fc3301-30b9-48bd-9832-b4fc18828a0c@suse.com>
 <aEAMYRN5rfQh3sbI@macbook.local>
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
In-Reply-To: <aEAMYRN5rfQh3sbI@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.06.2025 11:05, Roger Pau Monné wrote:
> On Wed, Jun 04, 2025 at 10:07:46AM +0200, Jan Beulich wrote:
>> On 04.06.2025 09:21, Michal Orzel wrote:
>>> When cross-compiling, HOSTCC can be different than CC.
>>
>> I'm sorry for being pedantic, but the two can also be different for other
>> reasons (and I'd like to avoid this becoming a bad precedent, then getting
>> copied elsewhere). Both may target the same architecture. Hence I'd like
>> to suggest ...
> 
> Would you be fine with:
> 
> "Depending on the build environment, HOSTCC can be different than CC.
> With ..."
> 
> And the s/cannot/will not/ adjustment below?

Yeah, that would be good enough for now.

Jan

> If so, I don't have any further objections:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks, Roger.


