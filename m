Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F94AA5009
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 17:21:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973695.1361757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9F3-0007iF-1A; Wed, 30 Apr 2025 15:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973695.1361757; Wed, 30 Apr 2025 15:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9F2-0007g2-Un; Wed, 30 Apr 2025 15:20:56 +0000
Received: by outflank-mailman (input) for mailman id 973695;
 Wed, 30 Apr 2025 15:20:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA9F1-0007fw-Pf
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 15:20:55 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3299102-25d6-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 17:20:50 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5f4ca707e31so12396621a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 08:20:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7035451b3sm8950625a12.50.2025.04.30.08.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 08:20:50 -0700 (PDT)
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
X-Inumbo-ID: b3299102-25d6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746026450; x=1746631250; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=avPt6BmV/ilnauoyCSGHUreWQgspdNcKUUPQ3OCEaP8=;
        b=YZ2oeFan41fjiVSQIVnhRLB+jSJU8e4FYEGHrrnB+g9pYiH9v5QivZP/gmVyyrRP6j
         AYbjUh4AO/LQqQKLf6eS+XqdWXp0TpoiGUDilhI1tTnqvuTXIBO1LngYq3J0QAwAdSl8
         ekogkx1JREo2nHyIjU3p9sr9dpDTP0DpKfcLv1BvJ2UFLaDcQLPsoCYdxcldb55mWL/h
         JO1UT+6Z7Nl9igmZJSHSLUVvoXVKmLpB47+TYlm7L1qCccL+qzhJmg5lm9r7kZFD8h13
         xXN/x2oLWP3k8Htv3z2E2RcIfKV5xqFGixBsW6jblp7uuVID0JF2bQhBCvp8AMDRkrjT
         cEvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026450; x=1746631250;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avPt6BmV/ilnauoyCSGHUreWQgspdNcKUUPQ3OCEaP8=;
        b=jRf36Bsq1cqgXe2bI8JEnvn8uEA0IFaDOgwvqsPcHxMFJ5Pj92xLmQZynt+J8j7zZu
         2qOORZM908VpAVqulvJQPuFTxnZ9Apt0QaDGTXdg2pVP3YPtVHvwUN8/xcX/0TbP4Vn1
         6fUBofK1TxImwbPez4YsyANAPdhuFui+XHPCw+UO3Rpk5zyWCZJfZ5EbFKVMZPeUb/6S
         GitofRF/y687xWJB9FQYDlFY5c9ofQjaLbiQO66wxj58vmEZcmWPUka/4aWPxbzfe8Ym
         N9GB4dWSzOw3t/AKuwPYN2lGe6lNlHa1VJfetsAjGaRsEWPUO5HZ8s53uVE901sK+072
         foyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsai4/iilu+t9HOvjRt1rPi6zmVLLjYtO1t3uov3e/34uDQL06NRwZz++XvE3CWjivjPai8Lu6jag=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMZQTwRN6WdIStgg9cuH9vEK5baGqhRRel+mLPflZThwltE3/r
	aHvtPJ0bkMZ6GYPFrnef44ljf875RkRUkeq0CXMpNL3IA1wGFRH3sT/2jQUFAQ==
X-Gm-Gg: ASbGncuryczDfELOQM7QP16HbuGjbIoPalXktqsfPdsqN87IVsy4RHcUMktjnUdg0Vt
	+z49/BIsJVCDYDMMlUwxEMSPycu63NWf4cUYbYCe7tXpYOgRHWZ20kEyeFSZKjnmCLjd8xoa+Ag
	CTlF2swJmeIoRrO4W5nCRfCk5GOD1E44uL1tpYfEMvxeJm477QEYoDn8RR2H+J+DNa55TlnHUlh
	RWaZpIZ+SaBFHMHnikdu27vwIUvz0mMq9lldf15o9zZqUQP3o+NZEE/ec0jaotocfkV7KWBY+Je
	V3YYpmop0OgrPFgIxXh3ruJ5fFTlpJtLQb/uI4NqhrNrhE+DlQJEfuRZFrzqYrf6eprviSC30vs
	eH+rF2CbrS/EYklMu8Zq9Rpj0VA==
X-Google-Smtp-Source: AGHT+IEDwTGarbKz/D0jb8j91R3n1B3mRF/YtghdkYxWvalqMCiR9cNsk+xnBGpLK10MEk8LpF9R2A==
X-Received: by 2002:a05:6402:1e92:b0:5dc:74fd:abf1 with SMTP id 4fb4d7f45d1cf-5f8aeffe01fmr2487569a12.15.1746026450344;
        Wed, 30 Apr 2025 08:20:50 -0700 (PDT)
Message-ID: <f4e6a0ed-c869-4ecc-a6bf-7ef445ac2db5@suse.com>
Date: Wed, 30 Apr 2025 17:20:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/20] xen: introduce CONFIG_SYSCTL
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
 <20250421073723.3863060-3-Penny.Zheng@amd.com>
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
In-Reply-To: <20250421073723.3863060-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.04.2025 09:37, Penny Zheng wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -581,4 +581,15 @@ config BUDDY_ALLOCATOR_SIZE
>  	  Amount of memory reserved for the buddy allocator to serve Xen heap,
>  	  working alongside the colored one.
>  
> +menu "Supported hypercall interfaces"
> +	visible if EXPERT
> +
> +config SYSCTL
> +	bool "Enable sysctl hypercall"
> +	default y

Oh, and - just to re-iterate what I said earlier in the context of another patch:
Imo you would better introduce the option without prompt (simply "defbool y"),
and make it user selectable only in the final patch. That'll eliminate the need
for transient "#ifdef CONFIG_SYSCTL", i.e. reduce overall code churn.

Jan

