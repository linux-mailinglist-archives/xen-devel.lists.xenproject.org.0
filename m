Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D191A72ADC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 08:55:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928569.1331253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txi5R-0007zy-QN; Thu, 27 Mar 2025 07:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928569.1331253; Thu, 27 Mar 2025 07:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txi5R-0007yX-Mj; Thu, 27 Mar 2025 07:55:37 +0000
Received: by outflank-mailman (input) for mailman id 928569;
 Thu, 27 Mar 2025 07:55:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txi5Q-0007yR-Bf
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 07:55:36 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc3ba603-0ae0-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 08:55:33 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so420488f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 00:55:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9efd61sm19317416f8f.91.2025.03.27.00.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 00:55:32 -0700 (PDT)
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
X-Inumbo-ID: dc3ba603-0ae0-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743062133; x=1743666933; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cKRp77Bs2p9V4ZekVHJ0OZGtiSaK441UfyogmauuG60=;
        b=MujN9E4+kIytWUKTIvJYklClT6qg2A4rMlezEfiMTJgINuj35u6BFsI5r5BG7NogOu
         WAtPxAZpjwRQQ4Lgh7LoK2l2yvuSRuJHRC9UiPk9bRq2x6RY0a9JkC5Wi4XEgfdGipZB
         Y1ubYeUtUsvrOWdiuH7TUtzJjeHTabHPSDGV34UCehzvdiFupfm159a8UvjimmjYyY4A
         pArEHPzjH59grWj3oLrjtvtoRMCgzl4a5gm9zX/ZQsDhqnnZKgPBYbIjH6CqSWUI1xuE
         z9+v+CeWhtU8d0k7aqs+c9pw38CptE+++vnGi1Ts3cLsbvvsvVjfPf3Y5g4zL4P54MWg
         If0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743062133; x=1743666933;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKRp77Bs2p9V4ZekVHJ0OZGtiSaK441UfyogmauuG60=;
        b=Nbmb288YeprVcJ16KYW91x7wbK7s0rfAWwBVlDt2t1s3ICWYHkk6PpExozyyWTFRJn
         LAG9mj6LQUX/PkcwWiHxZIvkeC66bb+xqvr5rCg0wZVWoCL5WfNYRsr43PI76CHIsc8A
         Y8wQVm9RNhd6ibExZe/yR6cYxH20/49UoRPSxvzMStltJzfD0oIey+Fn26oSIEkVJctp
         qiYIXi+m4335424+a2aQ1o392+5sgu0QvP4NYrAa5sSL9tqAhYitKGuSsjW3TE+Du5HM
         l+cMWActl+cXx/d/gwwR9YHTWdcwXHY8hWrfoHGYdkwuJW2o63jIL4dQIYowr9vvn7w2
         +2JA==
X-Forwarded-Encrypted: i=1; AJvYcCXcS0AJlkHkllfaYNb9RWnbLK8LBTCDKA1AkC4+3+fhirYeEBYfkz38758GGNTPJJx1yCp6zQ7FHpw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxeYeXUJNuYPOz4XtNApiJBCiYSAgSC5NWf8/4VjeYG695/Zeu5
	QoRW+jSpacn3vVLZxHj8bfWmDR7bDW2JOxspFqt8DV7wOOq1huMDf1tAquYCFQ==
X-Gm-Gg: ASbGncseyudLAKe0lm5+XYr4XZjiFStuFZmWKHhUREEhDyb21OyThd96Sl/QUfsu1O8
	EZIe/qhDXQgqQP6jAXbect3UDDi371G0UuMHGal17KU0CdNfypd0anx6OHsYZLrp3sR3g4aV95e
	bo9RfWn6mdCWhwV+ei/MvK1CWxDMHVYJcZtZwSxvKvHNKfTgjznqu0kxtMfEmOxmtJcDNXPiwUL
	EhU0zg/5plo0rEORaFW/e8PNHc1HjfSkIL7aKajkC3zUGwuEIftbmvOl6jjS0Mi1Iqr6BvWFBnx
	eAArCmRDDvlwUHNZ8MkNM9tdecsIhPtyCDoU4vhc/w5Q727SzXXMzJj8NlGS1yGUR0U08pGWek/
	ZplaS5H6QgqKM8P+anj5tj9RqXDiSfWbPZAsWhYgP
X-Google-Smtp-Source: AGHT+IE1VH5pLpJjU4AtOfd25fpBlgVH5ljGJT0F0aWTyWx8GhKvdrsJJ3IbAVNyHai3/NCj/w+2Ig==
X-Received: by 2002:a5d:588c:0:b0:390:f6aa:4e7c with SMTP id ffacd0b85a97d-39ad1749184mr2045399f8f.28.1743062132701;
        Thu, 27 Mar 2025 00:55:32 -0700 (PDT)
Message-ID: <b56cd8e5-d17a-46a3-8584-cf69113c145a@suse.com>
Date: Thu, 27 Mar 2025 08:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen: gcov: add support for gcc 14.1
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250327004044.2014048-1-volodymyr_babchuk@epam.com>
 <20250327004044.2014048-2-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250327004044.2014048-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2025 01:40, Volodymyr Babchuk wrote:
> GCC 14.1 has 9 gcov counters and also can call new merge function
> __gcov_merge_ior(), so we need a new stub for it.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

As to the title - what about 14.2.0? Or the soon to appear 14.3.0? I recommend
to say just 14.

> --- a/xen/common/coverage/gcc_4_7.c
> +++ b/xen/common/coverage/gcc_4_7.c
> @@ -28,8 +28,10 @@
>  #define GCOV_COUNTERS 10
>  #elif GCC_VERSION < 100000
>  #define GCOV_COUNTERS 9
> -#else
> +#elif GCC_VERSION < 140100

The situation is a little less clear here because the development window is
fuzzy to cover. Nevertheless with all other conditionals here using only a
major version, with subversion being 0, I think the same should go for 14.
Unless of course there is a good reason to be inconsistent.

With both adjustments:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

