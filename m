Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8FAD087A8
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 11:16:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198509.1515428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ve9X3-0001Vg-C4; Fri, 09 Jan 2026 10:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198509.1515428; Fri, 09 Jan 2026 10:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ve9X3-0001SZ-7C; Fri, 09 Jan 2026 10:15:49 +0000
Received: by outflank-mailman (input) for mailman id 1198509;
 Fri, 09 Jan 2026 10:15:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ve9X1-0001ST-LG
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 10:15:47 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29b9bb4b-ed44-11f0-b15e-2bf370ae4941;
 Fri, 09 Jan 2026 11:15:46 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47bdbc90dcaso29996405e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jan 2026 02:15:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f69e13bsm199378305e9.7.2026.01.09.02.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 02:15:45 -0800 (PST)
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
X-Inumbo-ID: 29b9bb4b-ed44-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767953746; x=1768558546; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fVA1rSjWi6G/rtKUq1UxoQ/RhvkAp5WPuA1D7/JzIaE=;
        b=ICY9NjVDAUt7Ysx1bRwBhWViKkjJ7MphJbt1ftDGz+xtCD6bpjXIPgmOKjbhUs2Kou
         VNxpAQN+Pati+4ioRNuZkl2uT89V7VJ7a5ydo6h3tiSm2Y4Vl0T4PSAOZCOqJdAMCODB
         r47d+Vqi1cACN/CcAZW4Mv77R6EhCnilKtOi+eVBjtFn0GOr/TdS3Kx2raJ/YyI252nz
         DZ/Wmqt24xcUOmMTh0vV5B+6XZKtbd5ex/pqPs6spjwkfVJsvR3d8D4S6/QQmqpAl1eK
         eSX43+gZbC22bhCP4o7PcC2z/wjtpCVGTeTQD72BmIriDpzryVXgGWK/cNYRrVSqLJEs
         zw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767953746; x=1768558546;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVA1rSjWi6G/rtKUq1UxoQ/RhvkAp5WPuA1D7/JzIaE=;
        b=qOHJahVols6AY1mkWDjqfs/rOBVYiDSHS6IxMJnWx5LwUvUybtwgW4Oa+y3ztbU8tc
         6piZpZl1xO2E6kB6EF4FyNDCLrTp6Xj/Gpx0iUiu13GJIGYFBi2rbTXRMBPFyRuxplvl
         CREGqtbpiR+0k5907OTkH893LV2I4C508IAmPi8tTUFwICdzu2+LFQa4JqgesVQVOGMq
         Q0PgZKThBPEC0WqSDCsG7iRez0tzRNfAOklaq9jDrPKuKkcnNA1cGfCuItnztxymlrLy
         6jGp6RZifndh5ZDxxw0XQROom+Xm4BUQMpKx5zP6mHcsZn1F/D2Z0Zwh7StU0HOHUwgt
         QMwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtKfrZO4AFi+H4R00545mLrvPHw849Pdx+mGOgIMBk0nUCbu0Pa3myAGccnDMDlwxV+iSDJqTdRbw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFVmKIMNyz+KoqsN0u6wnFvcpyNTvC/HkYzTUUMx/+C1LK+Y+Z
	ziArpbN5/C1Rd1QmxlgQkzxFSV2Df6GT90l+7My+s+lsO5IzBFFhjgZcYdAPgUimpg==
X-Gm-Gg: AY/fxX6IDAzb0Iy5hz33vxqotxMa+sScKfWLwLpKkaht4VISLBBAN8v7TCNXVqOK6Zx
	wp3eOarZgIvD4ni4StkXQb8oz73Ovz+zJ9WiNX/VS96QwBDWXEFlG7RiLtwahp+fEwqQ1UhI/SX
	Mbw74Q6mncnjkcpN8K7IZ5OFPY+EQH1H1ioEgm8v9JzG7XXS6a0TQTOYrMOiuQ/rIQIGhp/JUuV
	JXMnUkHsOAUhQ3VXaVDC9sCAVQisDw/lVcV3AYMXJF9tap7JKJaICdoCEgdgzFFt/sD7UObJwy8
	YypRFf9dZPAfMKm1h9EA6vIRQs3XAFVT6iwlfu+71dU0p943PioXzzt0JRD6IOxbBIklXjlrqer
	AOhge0eWkivZPCdT4uj67viu/KoI5WE9Omr0QFVsvg+ftvwF30k4OG0S8eeuvc0iquLzLn919xZ
	99pK/Nrue1jJAV07QCTIRkxY7WL3qejZIQIqarNkVe6+d+84T1We0ArpclCBuypk0mvOa0rfpnw
	fY=
X-Google-Smtp-Source: AGHT+IGDC8CwfQT98zCZ9dybrpHU6ESX1vFIzYFnEyuxySWQjOlcUqBAx3ihqos2dn9/mJZlK8SXRw==
X-Received: by 2002:a05:600c:468e:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-47d84b1862cmr114836235e9.13.1767953745690;
        Fri, 09 Jan 2026 02:15:45 -0800 (PST)
Message-ID: <6b4c352b-f4fd-4b81-84ac-41b7d3e04f92@suse.com>
Date: Fri, 9 Jan 2026 11:15:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xen/mm: limit in-place scrubbing
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260108175536.82153-1-roger.pau@citrix.com>
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
In-Reply-To: <20260108175536.82153-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2026 18:55, Roger Pau Monne wrote:
> In XenServer we have seen the watchdog occasionally triggering during
> domain creation if 1GB pages are scrubbed in-place during physmap
> population.

That's pretty extreme - writing to 1Gb of memory can't really take over 5s,
can it? Is there lock contention involved? Or is this when very many CPUs
try to do the same in parallel?

Jan

>  The following series attempt to mitigate this by limiting
> the in-place scrubbing during allocation to 2M pages, but it has some
> drawbacks, see the post-commit remarks in patch 2.
> 
> I'm hopping someone might have a better idea, or we converge we can't do
> better than this for the time being.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (2):
>   xen/mm: add a NUMA node parameter to scrub_free_pages()
>   xen/mm: limit non-scrubbed allocations to a specific order
> 
>  xen/arch/arm/domain.c   |  2 +-
>  xen/arch/x86/domain.c   |  2 +-
>  xen/common/memory.c     | 12 +++++++++
>  xen/common/page_alloc.c | 54 +++++++++++++++++++++++++++++++++++++----
>  xen/include/xen/mm.h    | 12 ++++++++-
>  5 files changed, 74 insertions(+), 8 deletions(-)
> 


