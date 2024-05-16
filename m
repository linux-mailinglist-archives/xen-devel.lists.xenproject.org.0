Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E448C721D
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 09:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722847.1127195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7VgJ-0008T6-HW; Thu, 16 May 2024 07:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722847.1127195; Thu, 16 May 2024 07:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7VgJ-0008RD-EE; Thu, 16 May 2024 07:37:39 +0000
Received: by outflank-mailman (input) for mailman id 722847;
 Thu, 16 May 2024 07:37:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7VgI-0008R7-F8
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 07:37:38 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ab10a1c-1357-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 09:37:37 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52192578b95so519270e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 00:37:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574fdb36a35sm1485104a12.17.2024.05.16.00.37.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 00:37:36 -0700 (PDT)
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
X-Inumbo-ID: 2ab10a1c-1357-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715845057; x=1716449857; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRrzT3j6noehZdxpl39UjpRiiFrlamncfeu4/Bf4T7s=;
        b=CacvMaCf3cZQGbFQH7ZzEGydTd/1ZC/FaMBuIcK4JSHytyCDddJ4huDv3ho3ymROoq
         2P4VMTJHHg29yJ9CBQNvnqkL2nshzry0cnZUbuETA3FyyHjBlGbVv2I+0ITG0h0PdFeo
         WWS6oAcrP5URf70fyw285J8qekTdlh3GVKqbL+9xC6KA0L+gz9H+qer4Ab87rMjEW8KM
         yn9HYqWcc+2Fss1JfyRa9uUUA0YCQQyn8Z2oBdA9oSbFdA8lZyF0KrOH574y6EmSsPhn
         XDxMRqSpsbCtt0zjpEkANfw9TydxpOkMJPInUpWbtWILg/qRMYInysT4I8ma48fjwB1S
         LhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715845057; x=1716449857;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xRrzT3j6noehZdxpl39UjpRiiFrlamncfeu4/Bf4T7s=;
        b=HgZgyALK+AZBvrn0Zt74gBxLdsZU3wf3KVMLlxAi1Z722sAUYvFypEiwrWx7tDQN9l
         tRkBrjIQCFXuviuN/Yb73wDUa7dS/ke9nT8KfpqaPLtQgnDQwFg/jRr4Z6AxzGrMVOGr
         1AeZ9RLq0vA2WQMh/qNm6WUHL9522UmjKSFZ4qOM+Oz4TWvLDNww2Dsqspz4i1ZHfqVE
         fUm6YIz20K4ujG7is00NAVYuWoI/ppKhHLRb2qPXvt/9wbpMCbxHaYYWd9SVnd87OKhC
         xRHtVp/OkhL0MKADGfVcRf87Ox2mrldwRfG2srWHUpPH3BAa9wIZD/u9WN/hKZjmITvF
         RnrQ==
X-Gm-Message-State: AOJu0YySCxlXrsFe0drxKZoMFNwf5iCabkXLZtBP8l7VEx8NExCCDLNm
	pQvh2MhX3OZKbgpWiwI82ViC1dxLHpoWB6+2ZW3S6XN6P6s3xOsK/CGXqHPpDQ==
X-Google-Smtp-Source: AGHT+IFoFlwUS/wE8TL76Cs1xUFfqKJYTFmDZ4VMN0u5ZvHgBd7616VFX2j0mX366ohukzrnqNVJKg==
X-Received: by 2002:a05:6512:1247:b0:51e:e703:c878 with SMTP id 2adb3069b0e04-5220fa71de0mr16168959e87.14.1715845056723;
        Thu, 16 May 2024 00:37:36 -0700 (PDT)
Message-ID: <3104deae-0d27-438e-83ea-035a7786fd4a@suse.com>
Date: Thu, 16 May 2024 09:37:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 14/15] iommu/vt-d: guard vmx_pi_hooks_* calls with
 cpu_has_vmx
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <73072e5b2ec40ad28d4bcfb9bb0870f3838bb726.1715761386.git.Sergiy_Kibrik@epam.com>
 <alpine.DEB.2.22.394.2405151751530.2544314@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405151751530.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 02:54, Stefano Stabellini wrote:
> On Wed, 15 May 2024, Sergiy Kibrik wrote:
>> VMX posted interrupts support can now be excluded from x86 build along with
>> VMX code itself, but still we may want to keep the possibility to use
>> VT-d IOMMU driver in non-HVM setups.
>> So we guard vmx_pi_hooks_{assign/deassign} with some checks for such a case.
>>
>> No functional change intended here.
>>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> I know that Andrew was keep on having a separate Kconfig option for
> VT-D, separate from VMX. But still, couldn't we make the VT-D Kconfig
> option depending on CONFIG_VMX?
> 
> To me, VT-D should require VMX, without VMX it should not be possible to
> enable VT-D.
> 
> This comment goes in the same direction of my previous comment regarding
> the vpmu: we are trying to make things more configurable and flexible
> and that's good, but we don't necessary need to make all possible
> combination work. VT-D without VMX is another one of those combination
> that I would only enable after a customer asks.

Well. Imo again the configuration should be permitted. VMX and INTEL_IOMMU
ought to be default to INTEL, but permit being turned on/off in all cases.
(That's btw part of the reason why I continue to be unhappy with it being
INTEL where really INTEL_CPU was meant. If what is INTEL now would be
INTEL_CPU, INTEL could be an umbrella option for all three, or two if we
were to tie VMX to INTEL_CPU.)

Jan

