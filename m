Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEA4A3092C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 11:56:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885338.1295134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thnvA-0003DH-PV; Tue, 11 Feb 2025 10:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885338.1295134; Tue, 11 Feb 2025 10:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thnvA-0003Ba-Mk; Tue, 11 Feb 2025 10:55:16 +0000
Received: by outflank-mailman (input) for mailman id 885338;
 Tue, 11 Feb 2025 10:55:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thnv9-0003BU-Ds
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 10:55:15 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abb1ad99-e866-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 11:55:13 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ab7d601bda0so194731066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 02:55:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7e3e590c6sm83488866b.32.2025.02.11.02.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 02:55:12 -0800 (PST)
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
X-Inumbo-ID: abb1ad99-e866-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739271313; x=1739876113; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3EXyAx5nKuKHbSXTO0KOOzhmubKsj5nRAHnoGjxyWS0=;
        b=dNTo3hfjfzGrqRn/w6C7okH1VPXaIoWoSM1Te5+VUO70XWBbid60AeniGLJuRfjjl5
         dd057WIJS/VGjXuJjDfDmEpCI9AzXQ1zetWEMEig/J+ADwaqP20evFl9dsUHV6eYV/Zl
         TrBdUac2FfqeZOX3oMooVFt8XJppeLtmTHmBRiAzJnM4XxKRLXmh71aL1qH/oAbbeomE
         UuzAmAWUOofxu1yTIcpFh58hcGKXA/Kt2WfC4cxSFxRkpSYUWppR+wiLavHxYLGxS60S
         q4p81sz7uVR1nWd91qyGMOk6FywADjDwkaNy+28Svjo5UBz588Isz/dXRFPPVv2mX3Ff
         P5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739271313; x=1739876113;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EXyAx5nKuKHbSXTO0KOOzhmubKsj5nRAHnoGjxyWS0=;
        b=T3zzzevSB+vmoghAhhcawZweKnhDoSjPq5Ezyq3Ny04/PozsFzFgE/jHF3hD7uEUgJ
         +Xbf7EPkMgxBaQIdZdOXbf9GWR3LZrghEgWa0r0dQdVN+t/yxF4YNh0el1bBOzav8FZk
         w96q0TBoZ2SL0TBmquUSZBnvUZD1HF4Hn90uog4vNnZ9gfQtzgJwZoiWYoXtxWBByzd3
         mK0KA03DVZZyqfttl4iUHsHvyNggr9eO4I67T5e/tTAvuAGOotJwRgwYruzZP4XY8ruM
         aDqeeBoebHuZuE9zCHdM7P4zxHyihp8giRVGLHe82AIxztaPZoAtgdXsoPAoEUTRJNS2
         d/qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcVeuihsppvnyntcdk9BPpPkg9+kT4TEgHBtRNMf7h4u9iPfVsITMALHgg9L7Swk0zh5HW3vVzRaw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyERKYPKjiddfBEw8ojjNoGkkUjEENISjDZSPaUYHJES8N37cC2
	iDig7yM6v/QWK5yJeR8aUodWHgDIw6Um3G5MS9Pfkpxu51r10BBTjUMZkC409Q==
X-Gm-Gg: ASbGncut1rkpmj1vVOCgOnsz6g2/BRBLCkD9/6beTYUisLfB8rRxTAYfkDTppVG3S36
	SZlIZCxzyBTN9AFjUdhJZkouy//YVsOprTxTOrF5ZFgGl/8b/vUYoyYLLt2+Vs1SKvTh51iKWEz
	kvz6mhBrp+D0daBfhkjL/b7/mNDmF6XS4UtTadOmGBLMvm4dX6MmSxsZaPJ9KsBYdXO9RCrnLUK
	491CJq4w+d0FkCoDdGQvBvVQ8jemei6BnOMfXM1A6r6IsX9vyZQlQoVfL4VckBFGMMqlSI0lsTW
	K9WBkCMrz/WOq9UmqN1XR7urMFdwunEfdH4F76OGz13JCCJmTLyXHLARvfbpZHke+z5I5vTCptJ
	k
X-Google-Smtp-Source: AGHT+IEjLm7uyO+1L+LJeXdsQFtfoMvu+i4VahbC/Ul70YIxd6xuKted1hGE/eSHbx8WG9z/kIHbPw==
X-Received: by 2002:a17:907:c04:b0:aa6:9198:75a2 with SMTP id a640c23a62f3a-ab789cbe579mr1708449666b.44.1739271313167;
        Tue, 11 Feb 2025 02:55:13 -0800 (PST)
Message-ID: <3970f17e-6764-45cb-a613-036cfb13271b@suse.com>
Date: Tue, 11 Feb 2025 11:55:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] xen/x86: add CPPC feature flag for AMD
 processors
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Ray.Huang@amd.com, Jason.Andryuk@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-2-Penny.Zheng@amd.com>
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
In-Reply-To: <20250206083255.1296363-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2025 09:32, Penny Zheng wrote:
> Add Collaborative Processor Performance Control feature flag for
> AMD processors.
> 
> amd-cppc is the AMD CPU performance scaling driver that
> introduces a new CPU frequency control mechanism on modern AMD
> APU and CPU series.
> There are two types of hardware implementations: "Full MSR Support"
> and "Shared Memory Support".
> 
> Right now, xen will only implement "Full MSR Support", and this new
> feature flag indicates whether processor has this feature or not.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



