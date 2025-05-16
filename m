Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E87A7AB9655
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 09:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986343.1371909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFp3o-00088L-Sm; Fri, 16 May 2025 07:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986343.1371909; Fri, 16 May 2025 07:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFp3o-00085t-PW; Fri, 16 May 2025 07:00:48 +0000
Received: by outflank-mailman (input) for mailman id 986343;
 Fri, 16 May 2025 07:00:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFp3n-00085n-6U
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 07:00:47 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d839c0f-3223-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 09:00:46 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ad23db02350so333165966b.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 00:00:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04b08bsm104613566b.13.2025.05.16.00.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 00:00:45 -0700 (PDT)
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
X-Inumbo-ID: 7d839c0f-3223-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747378845; x=1747983645; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T/Tv9B5GhecA35qF0zqlg0woin4T7hWRvPEm3cJfOQY=;
        b=RGFDusls9F6bJpc7m6Gg2uFQDOgOdwtBdtJjWZQ20kB8ykM6pBDCW7FNJBSfbhfq+a
         BIcHMWtQcHedMid0b59+A7lfY6ACaVwC7wRo3d5PdpK4EMMXsG/aNAYYjLXKcBrPFpD1
         hB1r0mZoga0oeRuPoGtE8LnaxcwSvCzL803Dv6OY84g0nVuFdpToe1ZJUAMe8Ag3K6v4
         wxVzJvQlh4wZpEcma/rItNbJn91FZ4TSWJRTQjpEsm2G4ATx4mzQZwZqdXzw9v0BUKD8
         mnqpeeCH+Kwl8cUOZFGTSEyYk4tTmKqP1FYT0S7XtsSJDegar71RL3rax0Gcubz5Rcq5
         KoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747378845; x=1747983645;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/Tv9B5GhecA35qF0zqlg0woin4T7hWRvPEm3cJfOQY=;
        b=wcejfPW2yxZj5w2zsexvIYBoOv3zlxv3gFYVE91XB5e5yb1Li/zXkwXlo18qtnpfda
         IKk24nekDY9xQ7miYYGhA3+Uw/YtekvZpJfvtYpapsUfjyd85gtWwyaoehfIGcf0L21+
         q4+wjqycPNNaCqMNH9GB3aiDvhCqXcNYKkASyflWHEKYCVthR2Uhpv1+5DSipsmfrubj
         0FuRlfKs3dKygH0ez+eeckQAGrZYV/yI5knzbmp2vACSvUKOoux6JOeeNSMroOE+zOft
         yFtgCEx7jIDfYS59eLOdSwQLqrs4xj8D2whJ0Mk6WNyvhd4L8pYln074H+y6f8EnkGLr
         +fKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxSQZ2YjTeLQAwdySh9k3GhVlErQo6NxC/LL+e9Cu7XJdggCP/c4SZnWUFZxB4oXYyj3YTY1YQQy0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUW8cNsBOqk1Rf7l+6pMftNbvf2ocYOK3zDp8QW6X7e1SyCUZ6
	1YQ+1d9ppx3CPtAoeo6OKg1LVsS7Rn+ZN6I4aLuDOxaB5TQ6alKOfVAwy8TryEJehZ65jsNjYAg
	lQkc=
X-Gm-Gg: ASbGncseCrefrWgIGBzZ/ua9ggMT7R9jTKwclMcy5xcLOFcCiWJvMNd1aD/T/4dbkFc
	e3kJfeZL6kk03JXt6PlBCygiyX8teDOScl03ylh2c+IrLB0m5dBvBh7+8oQuUMPrYS7+BW1Skym
	fcHY0oeaidSaFs8/p8dt83D5t7ntjPn6HZaFEyITClPDciZ1duHDF9HWAzTNijQBZoz2znyMVeQ
	2oLvEAOMnaMOvw3DFk/XIySOLCzTsJel4dyXx8NGCiOCg8qvhAHP1OcDMoeTKTq7v1h6bMzhgIh
	3SQUwTCRX5jFztYE9vn5NeZxkMgy57aod4W+L8GGdRaryJeXjd/tXKkS3ObSRf23ExK8dpOLVCa
	YBKd3ZPwgrXr/BXJNloM7rdXWS+Y9nRLfRgPa
X-Google-Smtp-Source: AGHT+IEfMcATbyC8N5V8tAl79JlqcWUFJNlOMkTT0Sdq4guNUqgAT22I01qYOiXYrBKvFQ8OQbGkPw==
X-Received: by 2002:a17:907:1c0a:b0:ad2:38e3:2919 with SMTP id a640c23a62f3a-ad52d45c75cmr233992866b.7.1747378845272;
        Fri, 16 May 2025 00:00:45 -0700 (PDT)
Message-ID: <91058f6f-0b87-4958-aa09-749df4de3a9f@suse.com>
Date: Fri, 16 May 2025 09:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] x86/mtrr: use memory_type_changed() in
 hvm_set_mem_pinned_cacheattr()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-6-roger.pau@citrix.com>
 <853ffc16-f14b-44fa-9e71-4fae8377fa95@suse.com>
 <aCXAanKycwXOiLJ0@macbook.lan>
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
In-Reply-To: <aCXAanKycwXOiLJ0@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.05.2025 12:22, Roger Pau Monné wrote:
> On Mon, May 12, 2025 at 05:04:56PM +0200, Jan Beulich wrote:
>> On 06.05.2025 10:31, Roger Pau Monne wrote:
>>> The current logic partially open-codes memory_type_changed(), but doesn't
>>> check whether the type change or the cache flush is actually needed.
>>> Instead switch to using memory_type_changed(), at possibly a higher expense
>>> cost of not exclusively issuing cache flushes when limiting cacheability.
>>>
>>> However using memory_type_changed() has the benefit of limiting
>>> recalculations and cache flushes to strictly only when it's meaningful due
>>> to the guest configuration, like having devices or IO regions assigned.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Hmm, I'm not convinced this is a win. This operation isn't normally used on
>> a running guest, aiui.
>>
>> What's more, this heavily conflicts with a patch posted (again) over 2 years
>> ago [1]. Unless there's something severely wrong with that (and unless your
>> patch would make that old one unnecessary), I'm again of the opinion that
>> that one should go in first. It is becoming increasingly noticeable that it's
>> unhelpful if posted patches aren't being looked at.
> 
> I'm happy for your change to go in first, but I think that
> memory_type_changed() should be adjusted to contain the extra checks
> that you add in your patch, and then hvm_set_mem_pinned_cacheattr()
> should be switched to use memory_type_changed() rather than
> open-coding it.

Maybe, but see my other reply to your patch.

>  For once it would miss the adjustment done to
> memory_type_changed() to only flush the cache when there's a
> meaningful change to the p2m (iow: p2m_memory_type_changed() is not a
> no-op).

That could also be mirrored here, if there were (remaining) reasons to avoid
use of memory_type_changed() for this function.

Jan

