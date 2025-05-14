Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5CEAB62D5
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 08:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983768.1369943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF5P5-0008Tc-3x; Wed, 14 May 2025 06:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983768.1369943; Wed, 14 May 2025 06:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF5P5-0008RO-0l; Wed, 14 May 2025 06:15:43 +0000
Received: by outflank-mailman (input) for mailman id 983768;
 Wed, 14 May 2025 06:15:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uF5P3-0008RG-FF
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 06:15:41 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d92bcfe8-308a-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 08:15:36 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ad24ee085a8so501608466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 23:15:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21933beabsm883188666b.43.2025.05.13.23.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 23:15:34 -0700 (PDT)
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
X-Inumbo-ID: d92bcfe8-308a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747203335; x=1747808135; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AUr3IAkqH2n8JoYNsGUM+Y9zOCesBzE+S64DV/gGzCQ=;
        b=awVKpgHcBR7q9uzZSFzKQdkCAl2HNx9Awn3T/mNORpLdnp4QnVt1hqNa+ABRa/ct/W
         VoFTbhQXRbM0QN2t0MgUw5VYZCsygWILxmhQFtRSA9IvJKM5xtHVhAoJ46T8l//bINwH
         6WeGymXFB8XaOVyu0+XulFs07CvOCVdVXc0HkCy0xrXIKcns60rw3h7UWJWbUomvxc2V
         lL4Rt/VYOTL7w4aaQozZoJdUlz2+h/BOCnhj+WUyp7PgGtLC088L7IwKGCUMbCnq3Ji+
         clEAVYgzEYcoDtBTFbCJTvuEzNfk1cGyeKIn0Mi8uon0Gv9u7IKIbIgTtzugaZpLDt1T
         XhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747203335; x=1747808135;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUr3IAkqH2n8JoYNsGUM+Y9zOCesBzE+S64DV/gGzCQ=;
        b=hZEQa2VCcafzXYEQkOXMDL4CHxzhwqNi1r0/PT8D7KT16cyx71DdQOjSBm+4A0VK4j
         uGjUCE28wCq08M4klhrmrB9VjqnRzydlxQFmOPXmfjSmcjQ5ViTeV22xEVs6G4VcF3tt
         4BDmGRSILGOcS7egjqAcpWsYwxzWVE1iDHOretu5w6FJRLCErwjrYNtE6ma5nQZGEfnH
         v6PxalSIXAEWo+mAnnvUc1xjiLY2AnNKR8Wh0KCrozFmsHNTu9Z2a/0OJTZUcUMlocXo
         FaKT4Co35fzM+NJvvIp7MrvlDruChY0ulf8ZTeviYWV3eNrKMKuX6fYtma0by0L+8sWJ
         lsAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgteFhj2gavUGHz6/4ley4JXV1dVWWIgOCiZPNuUwASuf9pR0Fz2RWKxJetJEk1/nllxEJJawGEcg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQjdHdd3jFHNXvYTQjJach9EY3A0cgKB5PFW9UBwvx4/HLqVC+
	vq0GcnshyupdspTykA14Rkh+/GYbIbU6L+BNafvnMXQ5pgHTPMImhPD5cfTs+A==
X-Gm-Gg: ASbGnctXe+3JcSvA+iR7DY9wRmgzWdxw+l/N+ZlWqQoAmmXDILu3Xydfmn8UChP9asQ
	hiDZr6TAhoVLw9CSxPVZJqKuYYWT14T2DRcwUz/x9bCGKoa0zRbshenMMhUkKaNAoaKczAktU6x
	hkLl5q/gt3f/InEImIMHxKIchKZHh9uPjjUaSxb51qT97V/qd5Y7TomtZJQryD1hpU1eZjtYd7N
	8nfK+cGvMSsKwe1PKUe3wDvsp7SBsjo+U1YuO9qdKNP/3omnxFUXuZSnjb58v9HNc+Y2e8U7+D1
	bUcPb8BrHDHjv9mOfGUIyVC5Pls58y5Pz9FvxSYY4Mtt0HR5opwbbRrkTDKN9BQjcJtFvaJ5zH+
	DHnQWOEupn6HDJTZzEgc1sefJHpDmaAcrJJp8
X-Google-Smtp-Source: AGHT+IHLQq3kc+NEd4Ac1DoWeP/ZnV0cKzqrDzTgHdPRN/ckr5Y2IVIinBlCpu0FALUGCojQnViaKw==
X-Received: by 2002:a17:907:7f28:b0:acb:7105:61a5 with SMTP id a640c23a62f3a-ad4f723fff4mr191893166b.32.1747203335114;
        Tue, 13 May 2025 23:15:35 -0700 (PDT)
Message-ID: <9f50ac6d-2679-4dc9-8677-0146d5b25f66@suse.com>
Date: Wed, 14 May 2025 08:15:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] rangeset: introduce rangeset_subtract
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250508132040.532898-1-stewart.hildebrand@amd.com>
 <20250508132040.532898-5-stewart.hildebrand@amd.com>
 <46dfb68b-7e94-40a8-9900-883ac899346e@suse.com>
 <914a4bc2-aa18-478f-b175-b89b56beaf3b@amd.com>
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
In-Reply-To: <914a4bc2-aa18-478f-b175-b89b56beaf3b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2025 19:01, Stewart Hildebrand wrote:
> On 5/13/25 11:39, Jan Beulich wrote:
>> On 08.05.2025 15:20, Stewart Hildebrand wrote:
>>> --- a/xen/common/rangeset.c
>>> +++ b/xen/common/rangeset.c
>>> @@ -397,6 +397,18 @@ int rangeset_merge(struct rangeset *r1, struct rangeset *r2)
>>>      return rangeset_report_ranges(r2, 0, ~0UL, merge, r1);
>>>  }
>>>  
>>> +static int cf_check subtract(unsigned long s, unsigned long e, void *data)
>>> +{
>>> +    struct rangeset *r = data;
>>> +
>>> +    return rangeset_remove_range(r, s, e);
>>> +}
>>> +
>>> +int rangeset_subtract(struct rangeset *r1, struct rangeset *r2)
>>> +{
>>> +    return rangeset_report_ranges(r2, 0, ~0UL, subtract, r1);
>>> +}
>>
>> I understand this was committed already, but I don't understand why: This
>> introduces a Misra rule 2.1 violation aiui. The rule isn't tagged as clean
>> yet, but it was accepted and hence I thought we would strive towards not
>> introducing new violations. What's the deal?
> 
> The very next patch (also committed) makes use of the function, so the
> series as a whole did not introduce a violation. Our code review
> guidelines still say to organize new independent helper functions into
> logically separate patches [0]. To be clear, and for future reference,
> would your expectation be to squash the introduction of the helper
> function into the patch where it's used?

Well, it's not so much my than Misra's expectation. With a small helper
like the one here folding certainly wouldn't have caused much of a
headache, yet I agree things can be different when the helper is quite
a bit larger; some re-arrangements may be necessary to make in such a
situation. And yes, imo ...

> Perhaps we ought to finally
> update the code review guidelines...
> 
> [0] https://xenbits.xenproject.org/governance/code-review-guide.html

... the guidelines better wouldn't be in conflict with Misra requirements.

Jan

