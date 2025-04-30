Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DE2AA4EE7
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 16:42:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973644.1361717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA8dg-0000L1-Pv; Wed, 30 Apr 2025 14:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973644.1361717; Wed, 30 Apr 2025 14:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA8dg-0000Iz-NE; Wed, 30 Apr 2025 14:42:20 +0000
Received: by outflank-mailman (input) for mailman id 973644;
 Wed, 30 Apr 2025 14:42:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA8de-0000Ir-Hh
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 14:42:18 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50218721-25d1-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 16:42:17 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ace98258d4dso720481366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 07:42:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e4e7260sm925731666b.49.2025.04.30.07.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 07:42:16 -0700 (PDT)
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
X-Inumbo-ID: 50218721-25d1-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746024137; x=1746628937; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s82G59Meh2Es8PA9sIlovDL0m2tXB2aU2UzJ7xaUsZQ=;
        b=UJZi8dup3Bqe5MaYQVdbyuB5ZAGtvluB34HjcnAAGBsZMjl/nfNHVhYYfwI8osyKjX
         ufJ15cyFKq+7+lPEKThNQ5Lp05xrmcEMaZAI1Hctxgn3MFwvHC/naqq5AGHT7s+AjeUJ
         ZZHsi1FooI1FuJz1YOew4+RwdcH8rfcYSpS77y8354Qyidf9RKbp9ChdmDlolloiHXQF
         xQlOTXZdVaX4l8XAkgPRb9uGNvl9k51U8JyBHd3TMDHr5Cb/nxOMrkVgP53b2IpLdPhF
         G6iMnWmFLCRPrOC2Jew91yH0pIEFOscDfq3k3qdGrTCBftWD7AD6gHsWeAIIBOcc5sDe
         NrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746024137; x=1746628937;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s82G59Meh2Es8PA9sIlovDL0m2tXB2aU2UzJ7xaUsZQ=;
        b=M8zmsTvoeVjG2tICpHAg9ooTZzXC+bf7+v+UkJToNK7edO4zbu7QUvlgfSjE3ut/2L
         C3jvOwnG2byCBGnvW26Jwt3v0Fb5EKiLQsrHTaHnHDFDLPyoRlStf+N0SnyqHUgdT4+X
         5cWkjn+PA5UxO8N00wmJWPKI0k5DHUHBNaO5kiCOxG2vZ5XpwCJOCl/Z+E9/f9YamXFu
         uBHyP9jfUivn6TX7ZPtLN/ix6BZkMGb7a5q83UDGEa+yYdET2N1Tl6P5kiY79upVmdQK
         RJiop5dlSoUmuABWhxQbbMnUauyYSRN7NUOH/sPIi/0hAQnsX/f0rYa9q3Hi+5VVpyTf
         E9fA==
X-Forwarded-Encrypted: i=1; AJvYcCXcpFVIZQjDWvdRAo/wpeoSLgIL8vFG6tCEQveLFZTedNZQPJtoLFRGVNgD9buE/5fs+fkvDGBENvg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUdr7C4QE2wUsSyVHQq2T2vxuJdx+IeC2ds5B4mbBMLgayYhlD
	OJoAQ4KFXrHuWOn3Q42AqxAwzqrEf3qs8cwDHUZMwaTjtJPiQlxicGkJpQQLcA==
X-Gm-Gg: ASbGncsW5SW7O+7jijPOFR8b26D8MejHw6GvrZ1Z0GspF56ez1Wf2JmnYxeKpZgmEcR
	66VwSYyXE+bT+XaYhbsTgYrQtNW8B9dsLZDr9/8NE7IVUuXwq/LOrx68CJX8u2HHwb6XD2kc0Tt
	aUHo2SeNN9Bcbq4Dl58K0ZWcbAK3yirj6WV6i7qRuqgmFIBWPkw3MYU4u2RdwNYGsbWg4fB7RDh
	reXkM0G8MTQainKGXfP4LPIovDeXaApXWcXpeIclBsZbtDNJkqhQmG6swHrtod2ntm5e2tZyWoU
	oc60uDG/Q2E/LVMbyf5j1+0IHbCbM9cTlojxoi33gSB3Xs4k3yUb0IXOLMI2ZYW+kBeMw20j4hg
	6426Chn3g0uTNYmRKBZc3SkONxA==
X-Google-Smtp-Source: AGHT+IHpQgVDIp0mFKTcOwSDFUhto1V27Ewb/VL5y74G/viYEauQPKYZBD1AboerHZPJSa1HtHH6Uw==
X-Received: by 2002:a17:907:97cd:b0:ac1:f003:be08 with SMTP id a640c23a62f3a-acedc56c265mr363203566b.12.1746024136734;
        Wed, 30 Apr 2025 07:42:16 -0700 (PDT)
Message-ID: <0bc47af9-ea09-40ba-8a81-933a10b58435@suse.com>
Date: Wed, 30 Apr 2025 16:42:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/15] tools/xenpm: remove px_cap dependency check for
 average frequency
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-15-Penny.Zheng@amd.com>
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
In-Reply-To: <20250414074056.3696888-15-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 09:40, Penny Zheng wrote:
> In `xenpm start` command, the monitor of average frequency shall
> not depend on the existence of legacy P-states, so removing "px_cap"
> dependancy check.

Well, yes, I agree there. But can you explain to me what the file scope
"avgfreq" is good for? Shouldn't we go farther and tidy things more
thoroughly? Much like show_cpufreq_by_cpuid(), we could call
get_avgfreq_by_cpuid() right before printing. (It escapes me altogether
why start_gather_func() would pre-fill the array. Unlike cxstat_start[]
and pxstat_start[] that's not incrementally or differentially used data.)

Doing that would make yet more obvious that the px_cap part of the
condition was bogus presumably from the very start. (I'm further inclined
to say that this change should also have a Fixes: tag.)

Jan

