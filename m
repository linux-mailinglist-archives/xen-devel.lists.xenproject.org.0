Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935C4AB6BB8
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 14:47:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984280.1370433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFBVR-0002y4-6t; Wed, 14 May 2025 12:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984280.1370433; Wed, 14 May 2025 12:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFBVR-0002vY-3o; Wed, 14 May 2025 12:46:41 +0000
Received: by outflank-mailman (input) for mailman id 984280;
 Wed, 14 May 2025 12:46:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFBVP-0002vS-Bq
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 12:46:39 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7787b03a-30c1-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 14:46:34 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5fcab0243b5so8832173a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 05:46:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fe81b89783sm4532387a12.77.2025.05.14.05.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 05:46:33 -0700 (PDT)
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
X-Inumbo-ID: 7787b03a-30c1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747226794; x=1747831594; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=39VJnEzZq5zx5B2cbA2O9GgONBerbNrB5HncvGGaEtY=;
        b=KxyXmdtcgd4uIwUVXqSjI32/fz5MUG5pTykTOu1SUVcnIm5yvko65O8TSZmigxDe4x
         jeLKKMXkt8sn+TK3Y+wBJdkl0fV+264u7Wp01IB2WCwuAM7lyQWeUMDSWERKMotBm07g
         UTJJAjggzw2wVV2alPgZ5rQTL8Bk3N+tT9a5bhIUg1Kp7vOiIld6EbPb6g4K/qTHYzQW
         EtlllkiHb7wyzzHCtdx9nrFBIBB/wNtFEYnfUr4ETYeupbq6O3u6fCgiz4J/VtD8LEvE
         ioxakiDc4Q4eGo6zKX0dk+tOAmv/Xx455wDI+ZDXuInQSXwH4z/LEtDFhgtjZqhdXtmB
         u+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747226794; x=1747831594;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39VJnEzZq5zx5B2cbA2O9GgONBerbNrB5HncvGGaEtY=;
        b=h35NIXKbV9luEP8ObihMBvwVcJVTuFfgZ0IDOub2qgywFwb+D/IXyQIS0MIxQn9dTQ
         4clLdD/6fvcBmDzvKu7H+RLBAhffsIZ5n1BB9zixhdA7e4d8DGntYE1XFnDmMTPnKgXl
         I1k85jsepySVWm7gM6TKsDUGxnkm1qt02FF1y7Y0E8b9gUNu+a9qQxa4LmFvALbntmov
         emz6l2ecK44HgdDyIavs6AAXR8csz6FEYsnC6vxJAm1Gfkpz1tbZXuQ3BbPFnI3s6P6O
         YD1dQtJMuXMAWUrbsOAQkt4vbpUF+DzxL+jyqM4Bf/mwr+YDZwejnl+XCz5usDF0/mL6
         g3hw==
X-Gm-Message-State: AOJu0YzjWS5DNzlCsKLfa4d0gnu0stTplG9cE9X6dihNNx80rrbYeM8X
	SjD9ZFhzjNpdlGOpkvx49ElpV5j/8QC6bDoIDKML923xuSwT+MpUyN9sY6b5xw==
X-Gm-Gg: ASbGncvDgRLWhWPmIw7bEakOuLpolK0AhrPAKSaKXQRBr8Y8xGwd4WMzHBXUhLmi84n
	ro2MRFv+3nf3RzoffFnwd32omiBbhSBw9MwBG7gBQgdkDqNHGxbNvwbocNbA0uTwFv+rNeTsnGl
	+NL1G8Ya22yhifrkHG0Mh3tITb0g1MV81J5kSInLtGeuCCie6U5MO4H22S3hMWWBcb+Zaqu2f+z
	TcI+pN7KLCNmuFQU96xd88dQtaQIciJJ36CDUngNVfXXHT7nTMhQ9Sl18gUbu9SRYSkZkGQgg0c
	ntzNVDZt6pv3ooVT+StAhRcUrgCUomkPCLmivjRyQawLplw6ItwS3ZHmH757RA+Xs4TAWlqidQm
	mgB3Ds0E73aXkXIZHqDVgZxaTzyjiai6aGciRCx3hav6Shok=
X-Google-Smtp-Source: AGHT+IHlTMSYyYJ2ZoAcBustTQppqE8+w7jhHLVRWjkZL242Oj8ksgPBVZKg+o8Fhm3WrUc2Tvd4AA==
X-Received: by 2002:a05:6402:1d4c:b0:5fb:1c13:3685 with SMTP id 4fb4d7f45d1cf-5ff98891591mr2672682a12.5.1747226793658;
        Wed, 14 May 2025 05:46:33 -0700 (PDT)
Message-ID: <66603689-429b-4bf6-8792-e4feae346a13@suse.com>
Date: Wed, 14 May 2025 14:46:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] x86/HVM: restrict guest-induced WBINVD to cache
 writeback
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <d55070c0-04c5-70a4-f9f3-3227d42578e6@suse.com>
 <aCNMEadsYoIKLbSp@macbook.lan>
 <80ab4cdf-dbbb-4daa-831e-c6d92f5dcf13@suse.com>
 <aCR-xQlo9LQfeLmb@macbook.lan>
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
In-Reply-To: <aCR-xQlo9LQfeLmb@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2025 13:30, Roger Pau Monné wrote:
> On Tue, May 13, 2025 at 03:54:56PM +0200, Jan Beulich wrote:
>> On 13.05.2025 15:41, Roger Pau Monné wrote:
>>> It's my understanding that the same is possible on native, as the CPU
>>> might speculatively pull lines into the cache.  So there's no reason
>>> for an OS to use wbinvd if wbnoinvd is available?
>>
>> Speculatively pulling data into the cache is possible only when page
>> table entries permit caching. Hence after changing all mappings of a
>> certain page to UC, an OS may have a need to ensure that no data of
>> this page is left in any cache (and it can't be pulled back in
>> speculatively then).
> 
> Is this realistic taking into account the OS is running virtualized?
> 
> At least with Xen there's the direct map, so once context is switched
> back to Xen (for example to execute the wbinvd itself) there's no
> guarantee the CPU won't speculatively populate the cache with entries
> from the direct map.

Well, we've been knowing for a long time that we're not doing things fully
correctly there. Once a guest has changed all mappings of a page it owns,
we ought to make the direct map one follow suit (or simply unmap it from
there).

Jan

