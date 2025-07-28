Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4044BB13896
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 12:09:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061192.1426700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugKmq-0002oW-2w; Mon, 28 Jul 2025 10:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061192.1426700; Mon, 28 Jul 2025 10:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugKmq-0002m8-0B; Mon, 28 Jul 2025 10:08:52 +0000
Received: by outflank-mailman (input) for mailman id 1061192;
 Mon, 28 Jul 2025 10:08:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugKmo-0002m2-26
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 10:08:50 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da8cf573-6b9a-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 12:08:48 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so3083530f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 03:08:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e62246f8bsm6147346a91.1.2025.07.28.03.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 03:08:47 -0700 (PDT)
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
X-Inumbo-ID: da8cf573-6b9a-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753697328; x=1754302128; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5fsZmDVONf7cyeR7+uB6vYtTRp9pMRWVp60ASQEMkCc=;
        b=WGSycKuI2j+uLi2SBRKt15J1zmkY/yzhxqJoO78TL+QLhwMU18rZLB9ogxW17l+sbb
         K6G0aAl0TwqpPIKOSslljtsmWsoHSRVxEHRY2HhxIicMPiHbJxmen3NG68HrieYwwHNC
         4VzlaHbsZlWLziehp2pbSylhYJ1EJL+DetLsdacpdd0WgwVoWlcPPr4+2iqUdMy0Lvq7
         ulfWJDe5BFE97Q2TzcxD+8SXfIRgv47qyHEEYmfLVJSeuJ7KR8Wnj7xHWQKBqkwWTp9M
         fhY/Xo+lzxcSDl9fd2GDHJdiKdWv7pwrgC5CKaNXB9rOu1MTYaYVZzajl0reEZiRWbXW
         3dcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753697328; x=1754302128;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fsZmDVONf7cyeR7+uB6vYtTRp9pMRWVp60ASQEMkCc=;
        b=ji+sSHlXfRhvWiPpA9/0fHjYKmj7ri84cko2C15tYn4kzzmlafTOm3qEuF/cYx0OxG
         1oNaq+fFJjUHHRLAfLD7r8sjd2SiQRT+TFcdGUMvyh8lg+IedZkt+dnRcDalJIJSFCmC
         PivY7Gcwhc1lhTpG6Qn4KA0VHvRmDu1+8iWNhFLYloN5zQ3i8jLpItWMvfHZLZwo+b1j
         m0isTyCfXSgJ53CygPtpPFDvo23cQFgTC00ouLvCkLpx6r09aQy7QEZdINzn3gi8G45x
         5ptKp+b3iryFdV0p2tsDSSnnMVd+ORPyjn0FWSXZkVeMxLphyVwcARbHCkrvxG+6qAGL
         tvFg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ2DPVdQcsOjz0fBy0Ep7T8WuELW1XrR2pkwwV8YSIf/lMmo8sS2jK8dUl0P1Mn+R5A9PTxncxy1U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmLxqsO4GI50x7GkpoUMxxH/u72zv3NE/wYaWprD/PolUZQjCB
	W8ctTPInsdZGjlkkaAoWCC1xhDJFkHDZFZaPRJSoYmzXxh8SgPnxDgNpBUXYG7Tg9Q==
X-Gm-Gg: ASbGncsOyLFOvEAtlUYOsVprsLlakCd8xXlAd0jRQ0gA6AbZl9Au1E6t5y8OF38dxXn
	nfI2EIRloRzAUnofZaN3CJLteH2x8vly1V6tmosDhWTFvPWl2n8TNLrl14fneaWqJMCc9SObd0T
	luXY5oiqU/rhUmgqmxxq6WIXvobvOFOxYozs/Pp+Ii/3aCvnwh04qyMHEhmk8FAMb3535QQPNx5
	S+SOAduUtVOSdwEqAQezMzZ9VQJOlwkZuSDpEf+mK0GATJsh1KAuvZ/4PUkLYxdx9WmdLWjy49y
	5Bh4+AAA19hiezvfsuY1TVNbmuHkdBLhMaQvn/i8epSTfuyXFblSzPoaXC5YgYWR///qSdMIdsS
	U2ZVRH75ba1fx6KXImLRc+c3SKtUMhVIjNfl2HvnvMYJ9x7SqQDHnB4JUecmPydTF/CIWevVNJU
	vrl+h2RdjoqW9+y+x3vQ==
X-Google-Smtp-Source: AGHT+IEe13dmpAIevBwGpLKI8baAyVcNj+t6QDxYSQtQigH5Q+YPkTCvUglbFi+lNAwpzxYbVy9g2g==
X-Received: by 2002:a05:6000:2003:b0:3b7:8832:fdcc with SMTP id ffacd0b85a97d-3b78832ff04mr2611265f8f.38.1753697327732;
        Mon, 28 Jul 2025 03:08:47 -0700 (PDT)
Message-ID: <f56a26c1-4371-4155-bb55-e702ba287120@suse.com>
Date: Mon, 28 Jul 2025 12:08:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 01/10] pmu.h: add a BUILD_BUG_ON to ensure it fits
 within one page
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, andriy.sultanov@vates.tech,
 boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org
References: <cover.1753372928.git.edwin.torok@cloud.com>
 <80e7ae8bc1546b004e2b3dcc3f3e57563ff741d2.1753372928.git.edwin.torok@cloud.com>
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
In-Reply-To: <80e7ae8bc1546b004e2b3dcc3f3e57563ff741d2.1753372928.git.edwin.torok@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.07.2025 17:06, Edwin Török wrote:
> Linux already has a similar BUILD_BUG_ON.
> Currently this struct is ~224 bytes on x86-64.
> 
> No functional change.
> 
> Signed-off-by: Edwin Török <edwin.torok@cloud.com>
> ---
>  xen/arch/x86/cpu/vpmu.c  | 1 +
>  xen/include/public/pmu.h | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
> index c28192ea26..7be79c2d00 100644
> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -401,6 +401,7 @@ static int vpmu_arch_initialise(struct vcpu *v)
>      uint8_t vendor = current_cpu_data.x86_vendor;
>      int ret;
>  
> +    BUILD_BUG_ON(sizeof(struct xen_pmu_data) > PAGE_SIZE);
>      BUILD_BUG_ON(sizeof(struct xen_pmu_intel_ctxt) > XENPMU_CTXT_PAD_SZ);
>      BUILD_BUG_ON(sizeof(struct xen_pmu_amd_ctxt) > XENPMU_CTXT_PAD_SZ);
>      BUILD_BUG_ON(sizeof(struct xen_pmu_regs) > XENPMU_REGS_PAD_SZ);

I'm fine with this change, and in isolation it can have my ack.

> --- a/xen/include/public/pmu.h
> +++ b/xen/include/public/pmu.h
> @@ -93,6 +93,9 @@ DEFINE_XEN_GUEST_HANDLE(xen_pmu_params_t);
>   * Architecture-independent fields of xen_pmu_data are WO for the hypervisor
>   * and RO for the guest but some fields in xen_pmu_arch can be writable
>   * by both the hypervisor and the guest (see arch-$arch/pmu.h).
> + *
> + * PAGE_SIZE bytes of memory are allocated.
> + * This struct cannot be larger than PAGE_SIZE.
>   */
>  struct xen_pmu_data {
>      /* Interrupted VCPU */

I'm not happy about this change: PAGE_SIZE is a Xen-internal entity, which
has no specific meaning in the public interface. (The fact that under io/
there are a number of similar references doesn't justify the use here.)

Jan

