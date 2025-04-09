Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12398A81DA1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 08:58:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943520.1342243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PO7-00042a-Ny; Wed, 09 Apr 2025 06:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943520.1342243; Wed, 09 Apr 2025 06:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PO7-00040l-Jn; Wed, 09 Apr 2025 06:58:19 +0000
Received: by outflank-mailman (input) for mailman id 943520;
 Wed, 09 Apr 2025 06:58:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2PO6-00040L-8a
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 06:58:18 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe3cdee3-150f-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 08:58:08 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so49723245e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 23:58:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2075fc99sm10043395e9.29.2025.04.08.23.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 23:58:07 -0700 (PDT)
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
X-Inumbo-ID: fe3cdee3-150f-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744181888; x=1744786688; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TSoyB05TL8WuycFnakL5CCjT6Fv6bYixSt7QB1XJSis=;
        b=aN0X6l6m1QOPpk+zBBDDKrC5+nF3189wC2j2SfpUod48qXugUj4oZiW5UKwmSIpDJc
         SU05rJKBitbWr0wNm0KhBBQ2/yJIPt/ZA5Cw3qpLxMnuToC+Vr/UFHw228waLeAtsw6G
         zO9gw2UF5iiDRcub5uysKSH2VfdpWrUuV0jRMIR5gHHZvwQ5Yr+SBQrHwjXBFlTh5IPt
         Is6kMEvSvyji9lN9ec5PMyHFAbxT31NS7iQ7ZJcg1Cu+tUJ9z3kLKkSEN9tluShbXLbt
         kDhVK22dLE6HoKEBfXiANJcXY3jr4amkA74dxEKUPGJ5LeGd2oKToTXXBuN8cZKxq1gX
         2eEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181888; x=1744786688;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSoyB05TL8WuycFnakL5CCjT6Fv6bYixSt7QB1XJSis=;
        b=F0kavGPFrLRz6Fy/rUo/iqSovn268cLntNuZ8EbYCAv4GRmvHFq3mzPjpvN6nziFXK
         DPi0uqo1B7uJAcTThGlCrYYJL1eWb47cCSSHKPqP5kpDQYbI6ArY8WqABCNJL1wN0tio
         Wn6hX8J0FNG2ISoAcHDEjqPubBjbZZok+RpbDYYXCCaXgbOiGeHILkQi2vSOdP5F1/cf
         ZECDzl2fofSLUK0oCZwZb2PYTQIaLpKmWF3W+w5xmHZdqMlXXieOzrZd+dsGSBJ4xFwY
         hrgAToFQr8Z+rCrZPWJHeO7HBwADcExocS+v4ytlWPvBBq4qvKziRSFxbcx9qmVB62QE
         +Gag==
X-Forwarded-Encrypted: i=1; AJvYcCWrkU9qSy2OcsCYmyVmYen+cPBH93K92mGOKyM0B4s7WZWSFMZcc3uEzrriQs1PJigLim8d/vqyR90=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtruKkCNdvKT2Fp/35jMxg3Gkaf6b94u7r18a+UZ0MG1YRhY1t
	HA03N4FVFLq3F+rYOcxuEHqRGuNAdmv/6AVQEu+SieSczA/XAbJ3pcByrp9lBw==
X-Gm-Gg: ASbGnct9Ili/Q9hi99nd4bjWDlfue8t1MzrrbkSl6Z39RA6ddIS86NcrZGTqXbzu1vF
	n9l6Kc/Qb+QZN0JxfpDTWleGwjkbXcS7GTLzltmnNcXfiufoxM9CtZv4zLDaj0323Dh6pIxsli+
	4GjSuZrP/g3nlxq/tdjsgmZJteQHJSWQHNHi+GTqgAHiRL8DjsqGpikjltSE5Maj+vDO3J++reA
	nj18d2MltWF2VxGv51idY9G7eyccSLCksPZ7/IKhs/qExrAbAEPEYAP5T4QPhVGnSA+GZiygs4p
	MkQeBBPlbAGBEoBo2pHssmOw9PCPL5WaB013c67LkCLFBE01ydqEFmhw4Pq2gCEsTHZB0cP4Pk4
	gkPHZ71Iv8oiNKinJHpKKqzAzjH0dVoIyPhBv
X-Google-Smtp-Source: AGHT+IE1lcXtXm4BXdVngqc6cQlfsOXVJ2Wyk/5GCVtHaG/TR9askv1tIRtxHGk2pyo/69x0Dlnn+w==
X-Received: by 2002:a05:6000:186c:b0:390:f699:8c27 with SMTP id ffacd0b85a97d-39d87aa0c65mr1482256f8f.12.1744181887849;
        Tue, 08 Apr 2025 23:58:07 -0700 (PDT)
Message-ID: <4e5c77f3-c6ff-45f6-b517-39a88a76ad04@suse.com>
Date: Wed, 9 Apr 2025 08:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] xen/domain: introduce domid_alloc()
To: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250331230508.440198-1-dmukhin@ford.com>
 <20250331230508.440198-3-dmukhin@ford.com>
 <32a01662-3f34-4670-b38f-7d660acd3d2c@suse.com>
 <Y8GhEKf3_4HeHTMCpwHkIF1k7ESinA0tL_jlCQsxKamzi8wEc7vSK3DtzXb22qF6xzFbS2yDtP0EGUqvCBVcHn9ggIxwKcES4sdyOpVAoos=@proton.me>
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
In-Reply-To: <Y8GhEKf3_4HeHTMCpwHkIF1k7ESinA0tL_jlCQsxKamzi8wEc7vSK3DtzXb22qF6xzFbS2yDtP0EGUqvCBVcHn9ggIxwKcES4sdyOpVAoos=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.04.2025 03:44, Denis Mukhin wrote:
> On Tuesday, April 8th, 2025 at 7:26 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 01.04.2025 01:05, dmkhn@proton.me wrote:
>>
>>> From: Denis Mukhin dmukhin@ford.com
>>>
>>> Move domain ID allocation during domain creation to a dedicated
>>> function domid_alloc().
>>>
>>> Allocation algorithm:
>>> - If an explicit domain ID is provided, verify its availability and
>>> use it if ID is unused;
>>> - Otherwise, perform an exhaustive search for the first available ID
>>> within the [0..DOMID_FIRST_RESERVED) range, excluding hardware_domid.
>>>
>>> This minimizes the use of max_init_domid in the code and, thus, is a
>>> prerequisite change for enabling console input rotation across domains
>>> with console input permission on x86 platforms (which currently is
>>> limited to dom0, PV shim and Xen).
>>
>>
>> By removing the updating of max_init_domid you do - afaict - break the
>> remaining use site(s) of the variable.
> 
> Unfortunately, this patch should go together with the next patch in
> this series:
>   xen/domain: introduce domid_top()
> 
> I mentioned dependency in the cover letter.

No, that would still break bisectability. Also such dependencies would
better be mentioned in both the cover letter and the patch(es).

Going back to the cover letter, all I find is "Patch 3 depends on patch
2." That's the natural thing in a series.

Jan

