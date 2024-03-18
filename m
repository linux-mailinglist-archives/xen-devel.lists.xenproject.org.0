Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2507587E9CE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 14:06:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694680.1083680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmCg4-0003vM-Jw; Mon, 18 Mar 2024 13:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694680.1083680; Mon, 18 Mar 2024 13:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmCg4-0003t5-H5; Mon, 18 Mar 2024 13:05:20 +0000
Received: by outflank-mailman (input) for mailman id 694680;
 Mon, 18 Mar 2024 13:05:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmCg3-0003sx-7S
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 13:05:19 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b11915b-e528-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 14:05:18 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-566e869f631so4836333a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 06:05:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 lc17-20020a170906dff100b00a46bdffd002sm1164722ejc.158.2024.03.18.06.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 06:05:17 -0700 (PDT)
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
X-Inumbo-ID: 2b11915b-e528-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710767117; x=1711371917; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2MKvWL+Y6y7QZUtCQnQugGOSxbO7LN9Yha4cAfbYvIo=;
        b=c9sAT5/N6T/gv8ZJGNG8GchIyc9lvDMw4mbjwWZ5cvusU6BzuPTFhg0iInNIv2kUoY
         ee+P3V0/Q9uwT9Fusjqc9jEH7/mwdxpGQOM65KnO0WJyV1ePEtwTsFpvQOYDaDg+QAjg
         FfUUibJqnDjX1h51u9hC+ACXyvTeTWY2y/sxVYtqZHuu7P1LKONK7qCNeQh2iHznJ4DJ
         U+UiG5PuBq02lsqUR369mBTc5zTC6v15wiW05/Z0CcV3AWXCFwUEckZ1TIufn77dhzJC
         2knYr54pTiX8FO5GJhOISb9d6GHwXI2bXLRdKafRRSqFUHvWqesESmKrd9HmB8aBtZoP
         TiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710767117; x=1711371917;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MKvWL+Y6y7QZUtCQnQugGOSxbO7LN9Yha4cAfbYvIo=;
        b=vanqaWktOr0sdX3RCwQuBgRPDJC0M3axl0QavanMo8G+dimkor92UcT0n5uKUgEuWB
         GkkwN0TRCXtGICFv9pOvF1sMqyMDiSUDETpOyvOfxOh/YtSz9EjmwifJU6VVKLjDErtj
         RT6VslI1PrH9UsjZsUu8z/Tcv6Hsk+Lnf6l6TTNI+nMQT26AgcV2FgdbKVKoEnYb6bG/
         d50ePY74WwNunDfPhnc5FIE/cA7yyRRDJhDHxsdAPLnwupDXMxxnJiwermH9tyKq6Bhe
         X907Uhp9KBaF3u/MkAHY2mXlQ58/4fOirhBz9ahJUttILIJ1DKPCJuFLPvU+ihJYI9Hu
         asSw==
X-Forwarded-Encrypted: i=1; AJvYcCXlmQgxEqs6ehM9ZFdR34obdDaWtUQPZUPDk6W8wN6AdL6L8E5gCxdFHZgDjylslX/2fBtVZolXzl42q5506RNg7QvB/96bu6rza4iYjUY=
X-Gm-Message-State: AOJu0YznfnZdDe5bg1dwAVmhl7ISMBI4VVrFfRTkozj1tq5hi9VIKnt3
	PoDboySCnDeK4aD0O714ZHuXSwoYE+uwWOu5bSn4zOXi3XakD4cBpSBxVy9QBQ==
X-Google-Smtp-Source: AGHT+IEHd5icWl5jCQXO/j2Rpb7yqnUkHfILRbpmPVLQ3/EpDOfBiRP3wBkTv68mkMoV/lFNlqF5hQ==
X-Received: by 2002:a17:907:a0cc:b0:a45:ed7f:265c with SMTP id hw12-20020a170907a0cc00b00a45ed7f265cmr10058792ejc.0.1710767117478;
        Mon, 18 Mar 2024 06:05:17 -0700 (PDT)
Message-ID: <74477362-3022-45c9-bebb-c194a92aa10e@suse.com>
Date: Mon, 18 Mar 2024 14:05:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] amd/iommu: clean up unused guest iommu related
 functions
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <98fef1239e4f0e756daf863a9e4e7bb679baa264.1710518105.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <98fef1239e4f0e756daf863a9e4e7bb679baa264.1710518105.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 16:55, Nicola Vetrini wrote:
> Delete unused functions from 'iommu_guest.c'.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> guest_iommu_add_ptr_log has still one caller, but even that seems
> suspicious.

As said, it should be dropped. You remove ...

> -/* Domain specific initialization */
> -int guest_iommu_init(struct domain* d)
> -{
> -    struct guest_iommu *iommu;
> -    struct domain_iommu *hd = dom_iommu(d);
> -
> -    if ( !is_hvm_domain(d) || !is_iommu_enabled(d) || !iommuv2_enabled ||
> -         !has_viommu(d) )
> -        return 0;
> -
> -    iommu = xzalloc(struct guest_iommu);
> -    if ( !iommu )
> -    {
> -        AMD_IOMMU_DEBUG("Error allocating guest iommu structure.\n");
> -        return 1;
> -    }
> -
> -    guest_iommu_reg_init(iommu);
> -    iommu->mmio_base = ~0ULL;
> -    iommu->domain = d;
> -    hd->arch.amd.g_iommu = iommu;

... the only place setting  to non-NULL. With that the 2nd if() in
guest_iommu_add_ppr_log() is guaranteed to cause an early return, at which
point the function is meaningless to call.

But yeah, we can of course clean that up in a 2nd step. It's not like in
order to make a new attempt we would be very likely to simply revert the
changes to drop all of this code (in which case it being a single commit
would make things easier). It very likely wants re-writing from scratch.
Hence on top of Stefano's R-b:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

