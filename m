Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B629431AA
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 16:08:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768795.1179676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ9zt-0006AZ-83; Wed, 31 Jul 2024 14:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768795.1179676; Wed, 31 Jul 2024 14:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ9zt-00068D-45; Wed, 31 Jul 2024 14:08:09 +0000
Received: by outflank-mailman (input) for mailman id 768795;
 Wed, 31 Jul 2024 14:08:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZ9zr-0005TA-Na
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 14:08:07 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f5a0aa7-4f46-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 16:08:07 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7aabb71bb2so793885966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 07:08:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab23624sm772721566b.20.2024.07.31.07.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 07:08:06 -0700 (PDT)
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
X-Inumbo-ID: 4f5a0aa7-4f46-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722434886; x=1723039686; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dPXSZqJ8yk928aHe6rbbdaBvgu8SQOV2lncKvnzF5ok=;
        b=EtqXWsTrwHZTyjuiXETFKZjCqag4hUbqH0GdiGMc0VU6mpDoXNYUCvbB0Xst5X7oev
         Qd8Aqjijhjczbs77tw09faJn1WyToidsfizVdsT14KmabjLimkKCq3jZXS6hU3Or7i8y
         abqAllh15N4j7kbCBIuqJxoypw2h/oj3g98W79cpeFqQjXr0A8ouEZVy6aVmSo2zBSSq
         jVuCAQHcElLMDm31rLkGVv90JyVuGa0lUqrSMOO90sVhZ3wgVVifN3l+5nSIzyJw7DIS
         26/HezM4oR63ZIsb7Cz6OGJ9U0f9Jwoy1GNC4uU+B0AuuZuc8OAfSM15MXDxs846qPUu
         xeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722434886; x=1723039686;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPXSZqJ8yk928aHe6rbbdaBvgu8SQOV2lncKvnzF5ok=;
        b=lIpk5RJzGyCEu6YyV26vI/Uz2B5HFW1vBxKXOjosmvy1aEboQyjiQi/n4Te9zswsSE
         9m0VnIDc8ZKnyrvwfpkur1KyIodgfbK32dOg0kRC0XXgstRtqe1pYkotiZpdFRxtvjGl
         rRIMkhtvSsRZgNuKo+rl6cXMYtXAJu4cAaJnEQgat8v2qP0Ju5ymhjOEWlcPW2Crqcnv
         hOXgL4Lgu6kU1IAAWMbC/LbCM9HMRK5dlRpCdYuNWOcMu3pbFguMSpYSLS8nBfc/jSyx
         r4y58KaYzTZCgrdgzCHzSWdNq+NRZo5r4/UOCz8knIXeP1MTGPCjTvGeSnh+xw6AbJk8
         qI+w==
X-Gm-Message-State: AOJu0YxNUBg1Dyy6xJcIyKvnFr9sZyODxn4xhxd/nZUeglsG/w7pXvWY
	FgMB/GJTN0zmG0CdV5cdeHVOH6RwPmeeLUsYnqu3VIMrutJhjWYG5VN3OTrYTQ==
X-Google-Smtp-Source: AGHT+IG8057NJb8USd5SRxHAvYz4rr1/OHWdGgZibzAH9kqrkayqrqUvqUKTnMLgzBBzotekNYoxsw==
X-Received: by 2002:a17:907:3faa:b0:a7a:be06:d8e7 with SMTP id a640c23a62f3a-a7d40160a63mr1186298566b.44.1722434886363;
        Wed, 31 Jul 2024 07:08:06 -0700 (PDT)
Message-ID: <8bf194db-c3fe-42fc-b33f-7085602d8f88@suse.com>
Date: Wed, 31 Jul 2024 16:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP 07/14] xen/hvm: Don't skip MSR_READ trace record
To: George Dunlap <gwd@xenproject.org>
References: <20240626133853.4150731-1-george.dunlap@cloud.com>
 <20240626133853.4150731-8-george.dunlap@cloud.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20240626133853.4150731-8-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 15:38, George Dunlap wrote:
> Commit 37f074a3383 ("x86/msr: introduce guest_rdmsr()") introduced a
> function to combine the MSR_READ handling between PV and HVM.
> Unfortunately, by returning directly, it skipped the trace generation,
> leading to gaps in the trace record, as well as xenalyze errors like
> this:
> 
> hvm_generic_postprocess: d2v0 Strange, exit 7c(VMEXIT_MSR) missing a handler
> 
> Replace the `return` with `goto out`.
> 
> Fixes: 37f074a3383 ("x86/msr: introduce guest_rdmsr()")
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Noticed only now that there's a bug fix hidden in this series.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


