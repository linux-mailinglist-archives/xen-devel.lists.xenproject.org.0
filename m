Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F4B83916F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 15:33:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670507.1043331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSHpT-0001K7-5f; Tue, 23 Jan 2024 14:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670507.1043331; Tue, 23 Jan 2024 14:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSHpT-0001H9-2g; Tue, 23 Jan 2024 14:32:43 +0000
Received: by outflank-mailman (input) for mailman id 670507;
 Tue, 23 Jan 2024 14:32:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSHpR-0001F1-P1
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 14:32:41 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4376576d-b9fc-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 15:32:41 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cf13c259f3so6287871fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 06:32:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t2-20020a02b182000000b0046ee05df6a7sm1406554jah.16.2024.01.23.06.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 06:32:30 -0800 (PST)
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
X-Inumbo-ID: 4376576d-b9fc-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706020360; x=1706625160; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kvWJCvJuGAeg8lqD+WdXSInkBlSfSl/Dljpdds/q3Ps=;
        b=VaLVQYh7ON8fXAjqmB+AX++ZvTsGjE8SN4rsucamjRuWHjG3tqBvE4JqZZCmsYk1Zd
         QRXnnARTSYJZl74J2Aq9NxQuCiXSCqzQXYNzZn/4uZrAwJj+7enZVSTKqMyDQEAPJpSI
         FiFyallf3hRxVABDhqUfYIoxlEy+K/KZdyeX5M7xoy8hv6CpLTMw1lQjMQgGVrsrExkK
         XRRA+UigmcLbZbiJGkBiooWsGzW/d0lXR5irRIl+IygIWKoGTpKNhxGPeqkdQB34USTh
         rNJudNfotY/NicPzuRCSSE2IhbKgTLVPfonVH9AIS7FH3cuCnRDk3CwGaF43WyoEYtZ5
         227g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706020360; x=1706625160;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kvWJCvJuGAeg8lqD+WdXSInkBlSfSl/Dljpdds/q3Ps=;
        b=B5TA22xnqlIW01PipAIZzNEnXo5JfT8FOEOhWfmUqnT5btN2tbEiaQQZOFBy7pakqK
         N8uCggbcvdbPoNaZbPetdmciLC/MhDJa54S4LTG7WeC1Aa+X77GsZfBSrlglumNl3P1G
         hJojLh0UiYCmoMcU/tQpO+CWAsM4KgAab2YD+7qcz70AlU3c2+Xw2jjiaVa0N72e7WBy
         a6pTwKinPdQEMFx7CTPJBSE+CHKxBz2laZBM7nxDQm8S+KqR4+ddpMcJIOeUnJK5mx9F
         yQ9L3feEcsxlVCBuTOKnQmFlO8J+7bMmbv+MxDO1n7vb7iU4zgrj1D/l6hOg89ShDDkS
         +vyQ==
X-Gm-Message-State: AOJu0YykI1F/6iqhbpFtqS+vQEVmK1jyserwJ/gaA6unk0KfCj0NqOVv
	YHlzMRWkHm5EaxgylqyP4pFl50bag101cypYWbSW2SwiejrkUoupLhFaj8594Q==
X-Google-Smtp-Source: AGHT+IFmMiWx+6FFGwumuyGs3B/Ce+Ou2pi3pOGIN6c/rKKE2h57nNyaxbnslP3yjVP1Qu2UGBoPfw==
X-Received: by 2002:a05:651c:1422:b0:2cd:633c:55d6 with SMTP id u34-20020a05651c142200b002cd633c55d6mr1500731lje.25.1706020360574;
        Tue, 23 Jan 2024 06:32:40 -0800 (PST)
Message-ID: <715e40c9-1776-4677-9565-dac1565a2aa8@suse.com>
Date: Tue, 23 Jan 2024 15:32:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12.2 01/15] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <20240115194309.45683-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20240115194309.45683-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2024 20:43, Stewart Hildebrand wrote:
> @@ -2888,6 +2888,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>  {
>      int irq, pirq, ret;
>  
> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));

If either lock is sufficient to hold here, ...

> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -123,7 +123,9 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
>  
>      case MAP_PIRQ_TYPE_MSI:
>      case MAP_PIRQ_TYPE_MULTI_MSI:
> +        pcidevs_lock();
>          ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
> +        pcidevs_unlock();
>          break;

... why is it the global lock that's being acquired here?

Jan

