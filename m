Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2C087EA47
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 14:40:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694710.1083751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmDE1-0004kI-Jv; Mon, 18 Mar 2024 13:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694710.1083751; Mon, 18 Mar 2024 13:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmDE1-0004ht-Fy; Mon, 18 Mar 2024 13:40:25 +0000
Received: by outflank-mailman (input) for mailman id 694710;
 Mon, 18 Mar 2024 13:40:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmDE0-0004hn-Hu
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 13:40:24 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 117cacc7-e52d-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 14:40:22 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-563c595f968so5439252a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 06:40:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n5-20020aa7c685000000b00568d4cf3288sm1532231edq.7.2024.03.18.06.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 06:40:21 -0700 (PDT)
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
X-Inumbo-ID: 117cacc7-e52d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710769222; x=1711374022; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CkhltwH2owqMEQdxw5OamMfonlQX4S1yJYCHEIrOOUA=;
        b=DrAgb7Mg1cFoPwE8/V9Lla+ulNCAvEOuD1k8GqLTjRTHsr88XQgmc5fdp7TjLtdFDw
         q6rCEslT9++aox8CvHmL+/i/0f0VJxzbe8XYevOIqZ3og7bwBo+23PyC+tYBXGCoM3QL
         DcCduh+vHEx4NCc0bHzfp5B31RNn+/MS2bjqwv9ubeJvb1EnK96W1lu/PoMTmxR6n6w6
         LhTdGQFJ3s+pSXabS4xGzuGY51s2mNa2HHphzbQdL8UIt8tx24sgn5/6QbVFx6gCogP0
         hmaNctnBqvkRiBGyuhRtRNX9B8ljAqOmnge6Rtz6P+2gsRK3+Mv28LzLz394/eU62wfF
         6Npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710769222; x=1711374022;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CkhltwH2owqMEQdxw5OamMfonlQX4S1yJYCHEIrOOUA=;
        b=INtCQiauWQ0YEYW1n56au+6r9kKWNLhN0AT49PiEv5FTzyEeJe+t5rIoDwXsQFa3TS
         nTLOjcpTjh9GDQ587LmuCkBzJ+RSvbtD1MngdTICp1VAGGkqfsO+YZhuFc/LSeTPTxLY
         jIj+lj6zbKwQglXsVtMZi0rfyknYNPW4UEwhM5aOYu3LIGIRtJ2Fb6v3Aump/tFfB39Y
         WC9swzSALpFuyREAm8cDToGHcJvFfr8/fuEYxtedLaQgvIO2Nh9LCCkhz6Pwq9DEAQJP
         U0/EZNpP6jfuMfACVnIFAjdnJubX7kocyoT176drLeKHYZ6cwxnMhpy2bKD8BTjoUKOh
         F9Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXrg/NxEhur4LXrHamEeB5GfkT2vyHUgIpTgySJ9FWXVv95lWWqiwTIXKkQ+hmwJEBH/a9rkJqQ/TudL/cH0yj/DtuEhyLoXGPGYmzTaLc=
X-Gm-Message-State: AOJu0Yzmm7dOlwC4G325f2p8e2g63k/tRlsAbYI1BdMRUq3fjWUVlgyp
	M9bXah7eNr9Ag1maIO4Bs3XNWLpJ0e+w8eD9E7eRtKkA5xkPojTyj4syFlQNjw==
X-Google-Smtp-Source: AGHT+IEqHENuRkhFNUXiMITh4f21gNlDo5Ktzad0xyYQv1gBeV9E0ObNOXyMylanQzAv2BErxDJXEw==
X-Received: by 2002:a05:6402:3708:b0:568:c283:f168 with SMTP id ek8-20020a056402370800b00568c283f168mr3818855edb.24.1710769222118;
        Mon, 18 Mar 2024 06:40:22 -0700 (PDT)
Message-ID: <3ab49282-6b67-4ab0-bb65-f04c62bcadcb@suse.com>
Date: Mon, 18 Mar 2024 14:40:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] IOMMU: store name for extra reserved device memory
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20240312162541.384793-1-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20240312162541.384793-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.03.2024 17:25, Marek Marczykowski-Górecki wrote:
> It will be useful for error reporting in a subsequent patch.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

In principle
Acked-by: Jan Beulich <jbeulich@suse.com>
However, ...

> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -682,6 +682,7 @@ struct extra_reserved_range {
>      unsigned long start;
>      unsigned long nr;
>      pci_sbdf_t sbdf;
> +    const char *name;
>  };

... to me "descr" (or the longer "description") would seem more suitable.
Thoughts?

Jan

