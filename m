Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8471C0067A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 12:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148972.1480779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBsIL-0000dH-CG; Thu, 23 Oct 2025 10:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148972.1480779; Thu, 23 Oct 2025 10:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBsIL-0000bq-9R; Thu, 23 Oct 2025 10:11:45 +0000
Received: by outflank-mailman (input) for mailman id 1148972;
 Thu, 23 Oct 2025 10:11:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBsIJ-0000bR-AY
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 10:11:43 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abfe1fbd-aff8-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 12:11:42 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-475c696ab23so3405105e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 03:11:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897e763csm3248114f8f.6.2025.10.23.03.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 03:11:41 -0700 (PDT)
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
X-Inumbo-ID: abfe1fbd-aff8-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761214302; x=1761819102; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m8TRGbWHynltFqZ6ZIi0CGiF+grBouisrLonxmtCvpk=;
        b=GFX1LR/7zV9UJ+Jm7debCCpulXspKMSmAMQAZ3MAg85sFUNgUkIKqUakUABpxS23Hc
         FDQ1v+TFC0IEkASr7Jtpi5Vh9vQ1yM33QWT8WLGjfrIAs4INedSfoHql/HbruvpkIuhS
         +NEy1iohKkU82d1o56vjMN8oEKhjnjNKHKZtm4KJ+/N31uD0qaEBdQJdiOZGOo/bZPi6
         0wbc1cCQNSnKd5UP1FRhKvNlYxxfziPZ+OiLoXnEBpwQVWC+CpQG8jiT0CYSgNtC8y58
         YPALH/7qGPzI2a0uHzxzRqzobAD0HZEddjRUhZRvCwufTuhZmN+yYXlGohkSSqGz1djy
         5/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761214302; x=1761819102;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8TRGbWHynltFqZ6ZIi0CGiF+grBouisrLonxmtCvpk=;
        b=C1Nvm6Er1qzfq1inQZixj06CGvDlzx2alH2pBrp7rrAig7lqszljSokdQ1Tk+rT8km
         vcVOAS+fKViN1bckJddUGmPgaNnq8dvPnooXY/GRwgfaEgxAj0ns/wae1Z617jZCqJJj
         56h+dik8FyPc1pMEDX1MlBpK0RYBX6015yh246GX6e88uZTbZhoKPw8htEDZ4PUu3zbi
         DHqNygNBNt6akzGUPe/LWnX5VURR+rCXnRl57nM/ir745m9xYN9SAmnhT8tEWUw1kurv
         xBagshV8UEjwhjwlJvmG60YLSr3kA6+1IuLgmmO5wg3JbFB30r8Q5dlSaFgqeA/RFhp+
         RRaw==
X-Gm-Message-State: AOJu0YwqobrZIAkFy8T0XI5aR7jIjf83+JFVO+9JPzfXrD+KZ3vr9U9c
	efjM43C+idG0l5y2+xla5BC5TzZuejvOSmLQ35ZTcK8NFK99twHSREH1bNomsf2E0A==
X-Gm-Gg: ASbGncvltrr4+9VeLBttGxrd/wmpCKSIa4ZD84zReB4B4V5f0TSdGv7B3fg/7hNeNCa
	EIVJRElGXDGMszrMawyMRO1wbgH+EHyli3LM5WO/kGz8gywRU4B40F/KuE+q52BVu0g7ZBwAKTf
	koh/2Hc9F1ADW8ersU6j1dggiCX7hucjiRf6GCBoH47fc64EZ0/FnF9mnywNuA7jPOQZAMt9O9G
	PMWPsLgtlIyJZ9Aixqn09xhqJv0VLYrvuxtoP/pYq6Mnk5wxsMkdTciQ/UnVeSPIkshP5QGUE8M
	hcOsP/yWNNeYEfUnij2v1EmepcXr/Y1TmAmVmYv9p6CQq4uWbZVjGyJaMFHDj9rHt0IB+hKLHJk
	fTAxoOo22QO6n8wizDIcjGd0+w0LQV0Y3Cx4UfXhhA56IsptWJjFyomdi2H/UVYHXdWJUaF0+MO
	sFRaslic9k1DyplhPUFF4LkrW4kedF1tRzfxbzQNdleafkTMWJpOdB/c6aah49
X-Google-Smtp-Source: AGHT+IGXKqTPngiCJhQvWLhOfJ41W0c2WAgCv268+ce8QsOZnnwFoO3y9L/FJ8llXTeiz9VrzRJEjw==
X-Received: by 2002:a05:600c:37c7:b0:46d:3a07:73cd with SMTP id 5b1f17b1804b1-4711790c31emr143642915e9.23.1761214301673;
        Thu, 23 Oct 2025 03:11:41 -0700 (PDT)
Message-ID: <3d58ba00-dc27-428f-972a-0c54815b6bc2@suse.com>
Date: Thu, 23 Oct 2025 12:11:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] vtd: Drop "iommu_inclusive_mapping" command-line
 option
To: Teddy Astie <teddy.astie@vates.tech>
References: <cover.1761209564.git.teddy.astie@vates.tech>
 <d12854b783c603aec99bbb9209b3b4be1769e5bd.1761209564.git.teddy.astie@vates.tech>
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
In-Reply-To: <d12854b783c603aec99bbb9209b3b4be1769e5bd.1761209564.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.10.2025 11:12, Teddy Astie wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -50,6 +50,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - On x86:
>     - GNTTABOP_cache_flush: it's unused on x86 and the implementation is
>       broken.
> +   - Intel-specific iommu_inclusive_mapping=<boolean> option: super-seeded
> +     by dom0-iommu=map-inclusive since Xen 4.16.
>  
>   - Support of qemu-traditional has been removed.

This is the kind of change that isn't very useful to post during the freeze period.
The change to this file will need re-basing anyway after branching, when in fact it
may then still (wrongly) apply cleanly.

Jan

