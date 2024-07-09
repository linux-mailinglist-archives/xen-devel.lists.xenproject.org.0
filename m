Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE9892B0E2
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 09:12:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755898.1164414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR51H-0007cE-Gq; Tue, 09 Jul 2024 07:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755898.1164414; Tue, 09 Jul 2024 07:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR51H-0007aP-E2; Tue, 09 Jul 2024 07:12:11 +0000
Received: by outflank-mailman (input) for mailman id 755898;
 Tue, 09 Jul 2024 07:12:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sR51G-0007aJ-Dy
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 07:12:10 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8db9c3c5-3dc2-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 09:12:08 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3678aa359b7so3588493f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 00:12:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ca34e94493sm1137991a91.33.2024.07.09.00.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 00:12:07 -0700 (PDT)
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
X-Inumbo-ID: 8db9c3c5-3dc2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720509128; x=1721113928; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w7VhF5t5zSQZ3MxiMI90gy4vwELFzEWqV6BtXSXK6zo=;
        b=VSgmgB/3V1aRnhoHg9+VnkZyRm5DHcVW9PCDo2w2ibbNEiPYxJkQQlxkaXXUe/tzst
         iqOth90V4pySbwnBysrSV/eeus6K1U2Lk8vF9hv6+H4RZ16rAo8ALPB273wuwJmgQAis
         yXgaCd55Xs6iWC1qHdxaoxRGJevjlEgczhrAGfCe2Nvb2f6dwXnq11Zfs60ERlo9T08c
         eHFT17suvCXE8SFCO6Tutq3TGCG8kykQ0XxgDQzAzsFE5BcB0t+uisR8pLJhOPxN9IJs
         lTrVV3RCyKw6A45BmTpxCitifE8BE5j2ls9MEhWlbLFUcPSqmgX05Z+E1MdQA/J/sc6P
         4jHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720509128; x=1721113928;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7VhF5t5zSQZ3MxiMI90gy4vwELFzEWqV6BtXSXK6zo=;
        b=CEePFpqMfzcw8eOI7W84r3Vwqxj9TPI3ySjzeFd87caMcXpMBJfwjeVpKVtYPt1O6Y
         s/cXAQzmv6pVNJtFWgdPBpQJ0nTz96o0zK0LqjPB8T7VJcGAlv3F4Ug5aYm/1Rwyot9T
         fso4SPGO+BNYxBICyxVPhJpUkcVPCR0hbyrxuT14EuuNzydJSf3ZgT8s77T97D4HLJ3j
         boU40X9MGBk0JDcxtPu143NLg9OxNyF/hLFpYyGFQQztO0teFoFV3RrcgNX24j+jXqiW
         1JF7i6mqR5dB8/Rbl2WTgZ1Aamkt7yJA7lNBer679k5AAdSZK35oY5dSC5zbYhVVvErz
         7K0g==
X-Forwarded-Encrypted: i=1; AJvYcCVKUh+npwi4xv61teztVbtSlGYjcv3NKaj2SVa8SU3u6rIgPG07ohrVQVPkk871+Ma+Ae6LMP6KOHEeF+1rnEmUj9NKA+/HZbV1ArHAvOc=
X-Gm-Message-State: AOJu0YwWfabJQOnUTZk+/spTvM2Q8hVp3JmUsIgjHDV51B+CxOwaMqVB
	Nkz5YUghsfW1cD1RKQSP+Ic8TrAezr/Np6aWiAy3mCVpCz5iPOEECZ028l3X2A==
X-Google-Smtp-Source: AGHT+IGLl6qCmRyuJ2U5Gl7CXq1eDR5nrMzz7WJs5rNR4Tfg4rd+u50KKWtH/PEdsPmq2iNKPJGprA==
X-Received: by 2002:a5d:548b:0:b0:362:23d5:3928 with SMTP id ffacd0b85a97d-367d2b534c3mr1072182f8f.17.1720509127787;
        Tue, 09 Jul 2024 00:12:07 -0700 (PDT)
Message-ID: <1d3476db-019f-4e5e-ad5f-381fe1e5b1c6@suse.com>
Date: Tue, 9 Jul 2024 09:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 01/14] x86: introduce AMD-V and Intel VT-x Kconfig
 options
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <f6bfed3cd9e9fff25cbe0c5e16d8d88541be212f.1720501197.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <f6bfed3cd9e9fff25cbe0c5e16d8d88541be212f.1720501197.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 07:45, Sergiy Kibrik wrote:
> From: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Introduce two new Kconfig options, SVM and VMX, to allow code
> specific to each virtualization technology to be separated and, when not
> required, stripped.
> CONFIG_SVM will be used to enable virtual machine extensions on platforms that
> implement the AMD Virtualization Technology (AMD-V).
> CONFIG_VMX will be used to enable virtual machine extensions on platforms that
> implement the Intel Virtualization Technology (Intel VT-x).
> 
> Both features depend on HVM support.
> 
> Since, at this point, disabling any of them would cause Xen to not compile,
> the options are enabled by default if HVM and are not selectable by the user.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
> changes in v3:
>  - tag added

And then removed again in v4? My prior ack stands, but - as before - conditional
upon us being certain that we want to go with the ambiguous ...

> changes in v2:
>  - simplify kconfig expression to def_bool HVM
>  - keep file list in Makefile in alphabetical order
> changes in v1:
>  - change kconfig option name AMD_SVM/INTEL_VMX -> SVM/VMX

... result of this change (firmly ambiguous for SVM, latently for VMX).

Jan

