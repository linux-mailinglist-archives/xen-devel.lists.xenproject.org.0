Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C366AB6BC0
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 14:49:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984287.1370442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFBYB-0003VA-JS; Wed, 14 May 2025 12:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984287.1370442; Wed, 14 May 2025 12:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFBYB-0003SL-GJ; Wed, 14 May 2025 12:49:31 +0000
Received: by outflank-mailman (input) for mailman id 984287;
 Wed, 14 May 2025 12:49:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFBY9-0003Rz-Ht
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 12:49:29 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df4c0dcd-30c1-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 14:49:28 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5fbf007ea38so11148489a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 05:49:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197ca2b4sm921532466b.160.2025.05.14.05.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 05:49:27 -0700 (PDT)
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
X-Inumbo-ID: df4c0dcd-30c1-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747226968; x=1747831768; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GFKRJMuYPqJDDAMbiCEkqUZfsCK1lahX934dXOGYlzA=;
        b=DmzVT/KNIvg35XiyTmtxbVV1mWV9e4N+MaKv0COt8SBuHmpKlzXy8cR9EwtfBhDKFL
         lmHBF9IwJRK69xpbq3Snd8yig6WLqqlCyJIjNdcybnHTLX3tnHwVlP5Axq5IZ4lhvBmE
         d7Mvc7zmFK1R+THDKj0S8l85C+fFx8FxqlgMNCVSEi9PA9q+5UIouCLBC9fh/Rdn25hW
         iQLzDJ8mcBUIaxxXONGnsg6SXGzbnltUW32d52cmkTeQAIekamFvhvEymuWylC4rq821
         WE9Wkxo6onOVFKt+9CaIX4oSBzLLe5JjDRb1EmV0gTsf64yRagYmtgGnuQePjLeiDOrf
         IGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747226968; x=1747831768;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFKRJMuYPqJDDAMbiCEkqUZfsCK1lahX934dXOGYlzA=;
        b=Zoq5ZO2Fqle5F4KDzgi7q5VA923mXBR982iX2e+3r6AbUnX6ubdeuvU46OoOZT1gWM
         CCMkJObKgH/d6cabroyDEoy2vkCQkRqbvJMRj/UX0tvNtayF+CiAwjP+4Xfa2vVQM6Bw
         443QODwtWXAirhOsvLJjrq1Xhd4m/pVXC2E7zxKS+IcA6SxlR9aNdS13I1vAFHjHotTV
         /K2YYViL3DCRzvXV9mLEpzo4r+RP3dOLPXH+ft1vSrREdXwyUN+YFuwNVCIAZM5Wy6wI
         b/eEkrrHKn2BvoEkhB7pOv2ZyCsOJzhY2raE6gL6LEmpNyeHCfB1M0kqZemgeN+3bcV6
         JK4Q==
X-Gm-Message-State: AOJu0YwEseL6mOMa4B9FSB/n4RG2Z6Ofhfv5hn3TVpzMpSQQ7k8YfIb0
	Nf6QcNvND3PzjtSS5qBlWjehsc95S1RK7L7zmQvhdWxGEqV+zYeZ1ArL1S3vprftv/LyyNZMO4Q
	=
X-Gm-Gg: ASbGncvWFCzRSdQVSPrmEReOtG1lynKhjyGRvtvQiGOZivINjW6EGfXr5l59eSJzUyF
	pkXUoBABBxZ1j+DZSxCRN9pEjkbcagSw8YgyEdFUs0leovXi95LqY2/+pUHRjqH6RQiciF7/Ks5
	6NMdQxDMnqLxpaobW7TrjF1sLxBnqBEfmWMK7ilf7d0y1lWt4H/tsohoUf52E9x+WgKroluQtLG
	mFxpA+jdwBYC3adq1e8X4c3aTWpNR46ObieRc+ZpINGoMbCBSlBi6vJoN7kZvPEr9N+OU+OJAd5
	XNo2nm28R9IUz10c4Lz6MZdojyb1h4/jJFnGJNgsectdcmGXJUUUPw1iG9/W3B1s2JuDnn5JHxC
	SZYla79pnicEIQqrtOBf0Fhm7Qt64BnHbJbxw
X-Google-Smtp-Source: AGHT+IEUyJ3ZfwCZz4AgHlX3975sReeOpIIrMfJvXaIQHFXP9s03auWO0qgnbYDA6PQi7U1tPTW1pQ==
X-Received: by 2002:a17:907:97c9:b0:ad1:766a:9441 with SMTP id a640c23a62f3a-ad4f71a9f6dmr349111966b.23.1747226967923;
        Wed, 14 May 2025 05:49:27 -0700 (PDT)
Message-ID: <e37ee94a-cb29-47fe-a9d0-a2a6a01dcfb4@suse.com>
Date: Wed, 14 May 2025 14:49:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] VT-d: restrict iommu_flush_all() to cache
 writeback
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <bf99949c-0e09-13a5-3ad9-a6c26377bdbf@suse.com>
 <aCSBGhD2DwS3K3C-@macbook.lan>
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
In-Reply-To: <aCSBGhD2DwS3K3C-@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2025 13:40, Roger Pau Monné wrote:
> On Wed, May 03, 2023 at 11:46:11AM +0200, Jan Beulich wrote:
>> We don't need to invalidate caches here; all we're after is that earlier
>> writes have made it to main memory (and aiui even that just in case).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> This, aiui, being an analogue to uses of iommu_sync_cache() (just not
>> range restricted), I wonder whether it shouldn't be conditional upon
>> iommu_non_coherent. Then again I'm vaguely under the impression that
>> we had been here before, possibly even as far as questioning the need
>> for this call altogether.
> 
> I think yes, it would better be only done for iommu_non_coherent.  Yet
> in that case I wonder why we need this wide flush.  In principle all
> accesses should already have their own write-back calls if the IOMMU
> is non-coherent?
> 
> There's maybe the call from vtd_crash_shutdown() which I guess could
> trigger in the middle of some interaction with the IOMMU, but at that
> point do we really care to flush anyway if Xen is going to crash?
> 
> Otherwise it seems fine to switch to write-back.

In which case why don't we do it in two steps: This patch, and then one
removing the call altogether. Just in case the latter one turns out wrong
for whatever reason.

Jan

