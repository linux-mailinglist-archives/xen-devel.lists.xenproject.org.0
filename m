Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F689AD6FAD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 14:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012950.1391488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPgeN-0006i2-TU; Thu, 12 Jun 2025 12:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012950.1391488; Thu, 12 Jun 2025 12:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPgeN-0006fp-QN; Thu, 12 Jun 2025 12:03:19 +0000
Received: by outflank-mailman (input) for mailman id 1012950;
 Thu, 12 Jun 2025 12:03:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPgeM-0006fe-Jl
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 12:03:18 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3923b8f6-4785-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 14:03:16 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so544028f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 05:03:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2364e71d0e0sm12092495ad.241.2025.06.12.05.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 05:03:15 -0700 (PDT)
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
X-Inumbo-ID: 3923b8f6-4785-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749729796; x=1750334596; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/HPRT47sa0BC/JSNfhp1oo02hX3npktkJyUI/nd+AMs=;
        b=cXLEZ3VGC65y39nJaotgVbf/AxhGvgqMGVULK5bCAbKysDorBGfu2w7gIeBFg07ibi
         Gdc5/5EMCOFPOtDJQulDQO8cn9uLJCCFefzw6sAKJ+rgKKsbjO90/xEHdWy72YaYOgOK
         BaId/04mYlNa2/kdy0R4f+QD38utvLqRN9+SYfSDxyXLJolMU0lBDn3Rf0WZCpGaLWqM
         BgHGpgt/CbXCiRhcRmp1jhL0vncIFnnPwR+iHl6zp2SvVluToDu/d37DL/KxAj2DjxCR
         ifffv9vxsYvBRhgBsukTBuK0852l1a9fALVIQIp/8Efh68+zA6z5hFrwfLqGSlBQ2wOH
         Igyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749729796; x=1750334596;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HPRT47sa0BC/JSNfhp1oo02hX3npktkJyUI/nd+AMs=;
        b=F2Mi8bdkk43fZLHuUMjgF1mHDDv+sNOgwVhDHK2zWbRGmOF2L+BSNhSPMlafWAP3+h
         YR558BKZZW/yuMypmj4Gb03aehjJNLsxRApDucuCTPPR2DcbibTUD5YkQJTSev+qPsDF
         rOdEuw/ngLDFKqClPYg1cE9Uw9worEvAQRUilBcd45NA07pj5vAfyi8Yk6sEl/zjJPnC
         P2WvfxEl3exqImoYLD/zwCN5RFz+2v5yKH01sTvWCHSHxyZ3lSFtoC9vfnTWWIdeZ5kW
         BfTaoFwZvr1FWMrNx0RI5whYseNMOqrDTWmoHruPrHDJ2YobKzkHVnR3IAovLkw6sKwZ
         KH5w==
X-Forwarded-Encrypted: i=1; AJvYcCXO36bIS1ixrXEFFsIWljyHG29z+RY2Dx+JrV7dq6j3+ekdQPQ+bWIy9ww47PmIB8Uv4BEFwvaWD+8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzz4+/UHa+qVtVuUyVFZiX6iVhSBtIj7px1azS2hYd20H45nmGv
	1VrVGFbNvl2VzfLXCo6wn//VLN097DWlU1ZvJkDcUL6Kzn8xEfJZUt7Qarf5KnqfIA==
X-Gm-Gg: ASbGncuIO+ZoP62Jy1DWFkRwS/Eo3NXuxLtFrPMlPna4xX5W9Rq76Wxe3wNFxw2zF/S
	oDtQyiIrPZc54CrNRjZ5/n/sX0+D5Ae2XATfA0UwFexKrvXdg2+IEvKYVvx50sHTAnCtz7akoZm
	Dw3PbCoA7Z3fxQq48zwTBeS8zuEFM8wBb0dPyv0LgxWSrnDSS4oTNURwv62g6SqOUpaux60h8gD
	2kV+YwGTSWmJIgV2mxYicuCMR32CJPmBYymRF61vrvstuTfOb7/fsQCw3+qLb9FnsoeruJW/l4Y
	WYSa2epsWJw1Gy8FOtd8xW8HHX4Rs9zheK/GZGdxjq68MU4T2MilIsn1WmsarPPPY32HHFSEQMS
	29tL1LabPbVnnWH8IlPzVo7mjEzLCsu1YvbYbGR5Hmz2Bt2M=
X-Google-Smtp-Source: AGHT+IF6Y0PsbuJ37jhEenRuoacjKhySlnxuigS+87dKehiQLPVNZZrAz+QI9D/YbcMla/qMe4LApg==
X-Received: by 2002:a5d:64c3:0:b0:3a4:d994:be7d with SMTP id ffacd0b85a97d-3a56130a6a1mr2105412f8f.23.1749729795839;
        Thu, 12 Jun 2025 05:03:15 -0700 (PDT)
Message-ID: <62236850-5c20-429c-befb-6cb12692598e@suse.com>
Date: Thu, 12 Jun 2025 14:03:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] pdx: provide a unified set of unit functions
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-5-roger.pau@citrix.com>
 <84080c88-b68f-4ab3-8b69-a3e45e9c74d9@suse.com>
 <aEqxOmmdn_1eeGdg@macbook.local>
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
In-Reply-To: <aEqxOmmdn_1eeGdg@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.06.2025 12:51, Roger Pau Monné wrote:
> On Thu, Jun 12, 2025 at 10:36:36AM +0200, Jan Beulich wrote:
>> On 11.06.2025 19:16, Roger Pau Monne wrote:
>>> @@ -80,6 +81,39 @@ unsigned long get_max_pfn(unsigned long top_pfn)
>>>      return pdx_to_pfn(pdx - 1) + 1;
>>>  }
>>>  
>>> +#ifndef CONFIG_PDX_NONE
>>> +
>>> +#ifdef CONFIG_X86
>>> +# include <asm/e820.h>
>>> +# define MAX_PFN_RANGES E820MAX
>>> +#elif defined(CONFIG_HAS_DEVICE_TREE)
>>> +# include <xen/bootfdt.h>
>>> +# define MAX_PFN_RANGES NR_MEM_BANKS
>>> +#else
>>> +# error "Missing architecture maximum number of RAM ranges"
>>> +#endif
>>> +
>>> +/* Generic PFN compression helpers. */
>>> +static struct pfn_range {
>>> +    unsigned long base, size;
>>> +} ranges[MAX_PFN_RANGES] __initdata;
>>> +static unsigned int __initdata nr;
>>
>> One other remark / nit: For my taste, "nr" isn't a suitable name for a static.
>> It's too short, and hence the risk is too high that some function would add a
>> local aliasing this one.
> 
> Is nr_ranges enough to avoid aliasing?

Yes, at least as far as I'm concerned.

Jan

