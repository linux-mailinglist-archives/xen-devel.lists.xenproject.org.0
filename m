Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A79E828516
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 12:30:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664558.1034627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNAIf-00006C-Ug; Tue, 09 Jan 2024 11:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664558.1034627; Tue, 09 Jan 2024 11:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNAIf-0008VV-RG; Tue, 09 Jan 2024 11:29:41 +0000
Received: by outflank-mailman (input) for mailman id 664558;
 Tue, 09 Jan 2024 11:29:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RTBC=IT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNAIe-0008VO-KP
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 11:29:40 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f7b09f1-aee2-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 12:29:38 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2cd0f4f306fso32997001fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 03:29:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w2-20020a92d602000000b0035fea0268bcsm539064ilm.28.2024.01.09.03.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 03:29:37 -0800 (PST)
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
X-Inumbo-ID: 5f7b09f1-aee2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704799778; x=1705404578; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ymzh+veCJQyspaR2r8sdrMtgLXSe3iH6pJZkruRUfeo=;
        b=CYV8Shd/nf7fB5s2mCrew9IwFEEyC8C/jbDRk0QqKFkkeiIwY1/x54ziu8R2svXbMO
         0AUmoXIydfc0rdSQS7Z8liWKB2F/0dO+AtQ7onDcxMCDEGl7tIWuDM/PlV+qmVQbg7V/
         KGR8xeS2iIlBtY94QRO6LXbrnv6XbfRjXbHi8iqDghEWOjFv1JREuAWnW3KZgPChaRl9
         jX6KHK+dxfuTnXxgom2TFI5Ru7KBUrTL4rn1WNbcfvoEbf7PyzDmZXeOsL8TzjRofQXo
         uxc8vVrqKNhKEvetTo9tY62xdpDpnBELsvSrekbW2nJP7J7tbAUhdTacPyjkuwwJad5i
         rWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704799778; x=1705404578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ymzh+veCJQyspaR2r8sdrMtgLXSe3iH6pJZkruRUfeo=;
        b=rSc1qob1nTSVlKDDFoaZEaixRK9ounAnrp9Q6oQ+M3dZK/83hGF7vJPHk1ZYUhItLC
         aH2KFWd+46OsqpEaMuPv9tarHgYpmqZUVZbqgkCP9wuvD6qNeuMvM46v2Efr8LV0k0dB
         XbHfqqNwl79fKYG3yriaHIpjhNba/OZm65xfeEDBGkz0mzdfO4Vfq8D37gjpzglgmuzG
         hPeiANasfH2KSJMgqqTgOPrNcS8C9hTwt/Uu/bolhgqCuaKW9NysSaAHY6PdF/VnVIjp
         9h4YO+pDENRfuEVoIRO/GIlaXuMq/sfbWIOKjjYB6Jg/Oi5r+n+Lz0eKtRw2W4auoUYK
         PqVQ==
X-Gm-Message-State: AOJu0Ywubs3mKX26xNsHdB9MZPEIVjeS7zbSmEZkpPiJ4+UBbo8ofsSx
	qVhTmZiIn4qhoZyGJtTAHMSsI4DJdKgc
X-Google-Smtp-Source: AGHT+IFnqXaV0zD259BpMcc0zYc9xV7gJz7zRn3txHksb2SaVP7PRYMtrPTQizA7CnUfKuc5slMpow==
X-Received: by 2002:a2e:9856:0:b0:2cc:f6b5:5193 with SMTP id e22-20020a2e9856000000b002ccf6b55193mr2105799ljj.102.1704799777857;
        Tue, 09 Jan 2024 03:29:37 -0800 (PST)
Message-ID: <1ed01809-a3b5-4075-a2ad-4fac1e46f0b3@suse.com>
Date: Tue, 9 Jan 2024 12:29:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] x86/iommu: introduce a rangeset to perform hwdom
 IOMMU setup
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20231220134346.22430-1-roger.pau@citrix.com>
 <20231220134346.22430-4-roger.pau@citrix.com>
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
In-Reply-To: <20231220134346.22430-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.12.2023 14:43, Roger Pau Monne wrote:
> This change just introduces the boilerplate code in order to use a rangeset
> when setting up the hardware domain IOMMU mappings.  The rangeset is never
> populated in this patch, so it's a non-functional change as far as the mappings
> the domain gets established.
> 
> Note there will be a change for HVM domains (ie: PVH dom0) when the code
> introduced here gets used: the p2m mappings will be established using
> map_mmio_regions() instead of p2m_add_identity_entry(), so that ranges can be
> mapped with a single function call if possible.  Note that the interface of
> map_mmio_regions() doesn't allow creating read-only mappings, but so far there
> are no such mappings created for PVH dom0 in arch_iommu_hwdom_init().
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



