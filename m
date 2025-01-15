Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10523A11A79
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 08:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872178.1283132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXxWG-0004S4-Pf; Wed, 15 Jan 2025 07:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872178.1283132; Wed, 15 Jan 2025 07:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXxWG-0004Qb-Ms; Wed, 15 Jan 2025 07:08:52 +0000
Received: by outflank-mailman (input) for mailman id 872178;
 Wed, 15 Jan 2025 07:08:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCnP=UH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXxWF-0004QS-1N
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 07:08:51 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91d8ad6c-d30f-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 08:08:49 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361c705434so44979095e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 23:08:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74d8e06sm12673145e9.31.2025.01.14.23.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 23:08:48 -0800 (PST)
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
X-Inumbo-ID: 91d8ad6c-d30f-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736924929; x=1737529729; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2Tjzwy0ANnVvnzMWfqKM9EbGCl+dzTJ3aQNsD/tdEVc=;
        b=BoQgh+gKh1jXWnP8jCxqNKUwAEmmvc4QW0gtfMj9RIJqpQdT4aL3JI8Za/ZzqIyUqx
         Dwcq7+26cFJ4yLSu7l+UgjHNctNPExpOlJsDYuXK+q9v4IP7Zfx1KRzhLlsUAYwimxHO
         gl8bywHxmi60sHeLrwajmERLVllOPhnVcAXlJ+mbxQYIW4TFjcblX5NUnL7e2tzfaUH/
         aaS+TmPaS6cjReNnGPYA8uDEjFRIL5ZbPThJ/aBUg0GxPmmmzA+60yiLw1rdcIY0n2N+
         +vXcgbH75raciRn+Ydjz5yAdaT1QPPkHzaF3aEVzwcW7e4iAzK+OlL/CwfzjONb4MS6U
         Sc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736924929; x=1737529729;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Tjzwy0ANnVvnzMWfqKM9EbGCl+dzTJ3aQNsD/tdEVc=;
        b=uMzdcM9DfJy1iDSWKba1RCCMP4XF/tGJbs4vrJGJm9UATtfdZ1Sc7WUK4pGeklbbLb
         Lrvk6mruUExdUhgUHwVDCXDPd2zus2zfnkk/ZokzJLdgtE5TLsJJtJoP2Vtg6s1iLaEh
         gZ7Prl/tE0Ldf8nDJ3IJV6V+9aduHuTL+zP5BITEfQXShJecnYdJhVSM/eRnozHXEdnD
         Sonmrbcibo/koFVWQm/qWxVDb6ZWPTJ5PY1/fHChPu+QTVHx13p35G2DovRicUbk+Y41
         fbn+rAGOxSz4M7FcGqCdbDkZ48DcEOMnTUY1fzO8WP4jvyDPbaWYkzYaJSw2H6WV610B
         ABVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzflVXeuSH87VcMZieAv+LE1zfIV65JR5uQ5wFOu6BrVx/HvVT25Y1Ln53kNGnxC9pzLCeZrRUpfA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyd48qGCa8wIytPNUeugmi/Rg/VbqPcWR7LvydaWf3cutMzvuSC
	LtH51TS0b15K+S+12oX9KN4/JZi/fiTO3yTvzQkWchN60bP/3VKEG1C+vm8xZg==
X-Gm-Gg: ASbGnctpk+jSKSjFsHq9GxI7+Re/FoQ2oVnfXzAMh+qZJK011EGpt6GBp+B7SdcPsHv
	ZjYoopNYyckQQIw646S/xI3KIxoJu8QUVtmV1giOaj86RjxfLTFnntJIflB9+Wb36alGpWCZ4DW
	9Ld65XvPcKPeYSFTPGjuwl+M4y50wCov6IiU1DhNiuMW35qB2jCHs+E3f4Rh4lSpnvHVCY2GoQ2
	Wo3Hrf644umRr3LpJ2+BIcvHl9uDmW94mbrpHVdKnpUvzZRLKTyTGZlE6GIO86bmsCWn0pmWzup
	9LD4S9Rp/KWkZqDbOvx99hrXBQWTsplekdSYjcIoOg==
X-Google-Smtp-Source: AGHT+IE9qgl3Nva7YXiZkdebfXUXVUgZn8LDkXRWosJClnf+ToYOM6H+2yoxWWhK5MNKuza5lw7/Hg==
X-Received: by 2002:a05:600c:4684:b0:434:f917:2b11 with SMTP id 5b1f17b1804b1-436e26e50c9mr213670185e9.21.1736924928794;
        Tue, 14 Jan 2025 23:08:48 -0800 (PST)
Message-ID: <94a5ec6a-c216-4aaa-9870-317132b7fb93@suse.com>
Date: Wed, 15 Jan 2025 08:08:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/11] xen/x86: introduce new sub-hypercall to get CPPC
 data
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Andryuk, Jason" <Jason.Andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-3-Penny.Zheng@amd.com>
 <95183589-1a83-4c99-ade4-d37873b85e0a@suse.com>
 <IA1PR12MB84679A0D60CD4219E9C1A01FE1192@IA1PR12MB8467.namprd12.prod.outlook.com>
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
In-Reply-To: <IA1PR12MB84679A0D60CD4219E9C1A01FE1192@IA1PR12MB8467.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2025 06:33, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, January 9, 2025 5:46 PM
>>
>> On 03.12.2024 09:11, Penny Zheng wrote:
>>> In order to provide backward compatibility with existing governors
>>> that represent performance as frequencies, like ondemand, the _CPC
>>> table can optionally provide processor frequency range values, Lowest
>>> frequency and Norminal frequency, to let OS use Lowest Frequency/
>>> Performance and Nominal Frequency/Performance as anchor points to
>>> create linear mapping of CPPC abstract performance to CPU frequency.
>>>
>>> As Xen is uncapable of parsing the ACPI dynamic table, this commit
>>> introduces a new sub-hypercall to get required CPPC data from
>>> dom0 kernel.
>>
>> "get" as used both here and in the title is, to me, something an entity does actively.
>> Xen is entirely passive here, though. (Reading the title I was first assuming this is
>> about a sub-op to get certain data out of
>> Xen.)
> 
> How about "a new sub-hypercall to pass/deliver CPPC to Xen"? or any better suggestions?

That or "propagate" or "report" (and perhaps there are yet more alternatives).

Jan

