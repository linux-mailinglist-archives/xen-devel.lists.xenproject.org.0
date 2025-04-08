Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CCFA80DDD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 16:27:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942331.1341521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29ud-00021K-Db; Tue, 08 Apr 2025 14:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942331.1341521; Tue, 08 Apr 2025 14:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29ud-0001yx-Az; Tue, 08 Apr 2025 14:26:51 +0000
Received: by outflank-mailman (input) for mailman id 942331;
 Tue, 08 Apr 2025 14:26:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u29uc-0001yr-2J
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 14:26:50 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 818ce164-1485-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 16:26:48 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so38265085e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 07:26:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d75335591sm8810644f8f.1.2025.04.08.07.26.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 07:26:47 -0700 (PDT)
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
X-Inumbo-ID: 818ce164-1485-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744122408; x=1744727208; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rnBKD8RK7eu/Yn8RWFHukx3u9fbeKjcdKGfkXlI1r0s=;
        b=EAVHGYNodS/Jz/brz9bMDAeBSugW9iuHW7LlDBqifYy63tm/8R8SeLPCiU4TzjYP5+
         Q8kKNpSSSvslPmWJR7yjmy5mOTlaHbUBHXZmQIua53sSTfMWzK7yzANGm0bHFxik1dgv
         9oxW1IzOUywwXTmBsOLgI5Wj2TuQ/rIb8Wm3ty6vatzh7voDhB3+Rojc34tAl3q2kvXx
         jz6jq65XHhwBBTN867lzCkPmUxohsCw9efHuQeFkwd9OUU3Hx/+pvDCzOKZkhCGviSCs
         TObJPAwh5gg/rajwyJuQmeg7Btp+ic5vNvGI2Tto5h9RTvBtejFpGIG0X9h22G4f1rlD
         ZuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122408; x=1744727208;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnBKD8RK7eu/Yn8RWFHukx3u9fbeKjcdKGfkXlI1r0s=;
        b=p9QZMfoDP3L0S0GL/BJdTDICnBaJbxedhFybW8MvJ3vbN9Ivtn1I64XqXt2eIhLLH4
         3TjnhDwmQI28vvfeLomRcSFnAnM2b7gOX9oNfpDSElJsKur+d6BqQn5A7+4XFIZAck09
         9lWEury+lm4tkuoaaBEFYd4VAWIPdVEJLoEORC5hiHA2yiHHl9y5jFMBf2caeZmbtzrY
         jDeROIjW/O9ie/A9FhxqtYWPMwE5K7kBmk+2WLnAzm1npv66D93Ji/XTn8G3IxtUspU3
         qzfq2OguWMczrwIT2TD8GJLVqwg4mqesxzz3p+dl+A8OYs4QOZoSKaM8bvKkaXCxXvVY
         Xt5w==
X-Forwarded-Encrypted: i=1; AJvYcCURLHDesRbt+WakobrETC60P+6clsHu1gpb00XZnoyFjvjI+CTi+qiOcbX2Au6vivolyt0hEt7DyWw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxsz9y5gHzZGubRWyPLrMk05NohpMb2OaJVlmpWxSh+g4XcV8+R
	BN9jcAEISPzMB3nmZtubWdzwu1wTi2L+AF3fskrg3O3XK3OgquWsbA8/Pov9Rw==
X-Gm-Gg: ASbGncvX9fWukcMtu7SZwBaGx7KA3OgdIyCgFRWtvAbXucy6RjF9pB0HBamgcf8GNmb
	QA3SNycNE36rgbUDoXPUaFzfpHecudnQYpQ2a+ZoTAihW5Ss1oHs+pYG1of5R/STXHF8zUrRvN7
	FZCeFyTdaRVx4p3VKeuxUj5KwiJy2mexF353KP7frZeZ+RdKwkrWzPesiW/jUogOdgGS3c95IlG
	neUBXM3dy8V7kMjA61RdQM4E/1duW6nDO+8aixzNje1bTOaMusfFg15PWVRyozIHQr+zjo/407o
	K9+xB6AZHN6fF4d/n0ZmS/MZGV4f8md0NTSXcJY5pwdkNzLiriwIs9AS9O+XpRnk6EXBV3MwRL7
	nECuruDtMfzszVnLtGPZzWHlu6U9fow==
X-Google-Smtp-Source: AGHT+IHHPL7MWmlSAyWpBy6kN0IOi9g1Wfflj88417GEPGcJ5wvnzIv0Nj2jnXJPZrlVtrid8gXnAA==
X-Received: by 2002:a05:600c:5814:b0:43d:cc9:b09d with SMTP id 5b1f17b1804b1-43ee0b1a288mr75175955e9.20.1744122408053;
        Tue, 08 Apr 2025 07:26:48 -0700 (PDT)
Message-ID: <32a01662-3f34-4670-b38f-7d660acd3d2c@suse.com>
Date: Tue, 8 Apr 2025 16:26:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] xen/domain: introduce domid_alloc()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250331230508.440198-1-dmukhin@ford.com>
 <20250331230508.440198-3-dmukhin@ford.com>
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
In-Reply-To: <20250331230508.440198-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 01:05, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Move domain ID allocation during domain creation to a dedicated
> function domid_alloc().
> 
> Allocation algorithm:
> - If an explicit domain ID is provided, verify its availability and
>   use it if ID is unused;
> - Otherwise, perform an exhaustive search for the first available ID
>   within the [0..DOMID_FIRST_RESERVED) range, excluding hardware_domid.
> 
> This minimizes the use of max_init_domid in the code and, thus, is a
> prerequisite change for enabling console input rotation across domains
> with console input permission on x86 platforms (which currently is
> limited to dom0, PV shim and Xen).

By removing the updating of max_init_domid you do - afaict - break the
remaining use site(s) of the variable.

> @@ -1003,6 +1004,12 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>  
>      image = &bi->mods[idx];
>  
> +    rc = domid_alloc(get_initial_domain_id());
> +    if ( rc < 0 )
> +        panic("Cannot use domain ID %d (rc = %d)\n",
> +              get_initial_domain_id(), rc);
> +    domid = rc;
> +
>      if ( opt_dom0_pvh )
>      {
>          dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |

Why does this need to move up, ...

> @@ -1017,7 +1024,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>  
>      /* Create initial domain.  Not d0 for pvshim. */
> -    domid = get_initial_domain_id();

... disconnecting the logic from the comment that is relevant there, ...

>      d = domain_create(domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);

... and not so much here?

> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -37,6 +37,9 @@ void arch_get_domain_info(const struct domain *d,
>  
>  domid_t get_initial_domain_id(void);
>  
> +#define DOMID_AUTO               (-1)
> +int domid_alloc(int hint);

Imo it would be better to use e.g. DOMID_INVALID as the "give me whatever
is available" indicator, allowing the function parameter to properly be
domid_t.

But first of all - can we please take a step back and re-evaluate whether
all of this re-arrangement that you're doing (not just in the patch here)
is really needed? It seems to me that it must be possible to do whatever
you ultimately want to do without re-writing quite a few pretty central
pieces that have been serving us fine for a long time. That is, rather
than make our code fit your desires, make your plans fit within the code
base we have.

Jan

