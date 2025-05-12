Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3552CAB3BF6
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 17:24:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981732.1368139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEV0h-0001vL-AC; Mon, 12 May 2025 15:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981732.1368139; Mon, 12 May 2025 15:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEV0h-0001tR-7W; Mon, 12 May 2025 15:24:07 +0000
Received: by outflank-mailman (input) for mailman id 981732;
 Mon, 12 May 2025 15:24:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEV0f-0001tL-Ul
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 15:24:05 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23099059-2f45-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 17:24:03 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ad21c5d9db2so555994366b.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 08:24:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fe7fb0ac1asm1852705a12.7.2025.05.12.08.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 08:24:02 -0700 (PDT)
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
X-Inumbo-ID: 23099059-2f45-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747063443; x=1747668243; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3QTd3xrVP/KI7ZiDMztUI9sKFVgx/mAQLfFiF91k6SA=;
        b=KfhwRmZOfVb3KQzOZNVkfsvdecac8PO+7B704HA/jBss17R+g3QYhWnmOggpvZ1orl
         f0zG0xr9CFgC0U3OUnYkdhFdGU4+3RM0CcktC/50TPG/nsdZ0k1h1c/IHv3geOQy1R3i
         LGe2g4rx64/0dhKHcie9KSJF7boIs+g7TGmMluitXq5cALFrPfZXYjXahDwL+MErGvSN
         xGeGXuqBrqjMlyJ/m/fWmxdinG3K2AQbi2ZPdMeedlrr2ZxaW2iDi+dxm+wOKIbnLioS
         hToNCm6ZxNbztkHSS0gYEtfaI6j9Hwn/UqW6Ad9Eg8VXCQxMS2i2HKr3ELYPRPNAL7IW
         mJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747063443; x=1747668243;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QTd3xrVP/KI7ZiDMztUI9sKFVgx/mAQLfFiF91k6SA=;
        b=u1imaZo3P8J1HKq6wpQFz+gHY3mDCFd8TG14YQS5tDpqWbxIEcAbLfekfMeCUZrOSB
         KweckdINRqO6ir7LPgGXjfCJdYM9GoijyZ6iSR8x8ro1e7LpHYTR1LltQ8LaSuvTTDfc
         aBPejOqrzKqVg8lC0RU9Xof32dOwbiBE4VL7e/+8S+1+7s+PoD6a0/DC0rm27YNLebj4
         Qao9d2Lnc02a79JLtIVvu6NfhQdBREdJY7vk56yi4toYSzGSsRhfeGQ0hSPi4DlKCkHh
         WeFaEJHSeCWaNw5mbHhGmLerdYESv9tpbXUhEGPyjiJxSYK1MQOdT6VNIAYB0brieW7W
         p+Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWilhZdkYv9Sf+HQQoyrzboohFM7a3chSYOXUsDPEJVPOSpnwVzEPQyZUb/kxlKaAONMSSwDQhsiVk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMSFPdo8DTArjgVBVOEihP3EpNJI+kdzS1q6jPApj+dWG5NU0g
	glF817yachymOpyinoU6kpiuCUpMlxixNxjBeXFyfxpengk2VtKrSmXRqpRZZQ==
X-Gm-Gg: ASbGnctWBl+paOhXlsOKtynwn6hyNymOJxztgb8PIMsrD34dkbJ/MbmbTK/VSlars+4
	gNb3yj/BIbTxFA8zpeAl2mXvohI3FfRDt91VlV2CYZcQvi+rYxMB83xhQRZ+VQrLEcMTtZLG0PF
	pYWFhHSMIaCGd6jWySaBfUJdKRG/sdQtLgYW7/2V2NCLpL4nCnsDgLv6mY+DxjWi7bNRAFmU0ro
	1PPNaf3sSqYrtDpSXRQ+R2SGtTb2tf9E+PVXRn+hjw5c56Sf5TjNE3Hzyv0U3xe3C/iJAFe5F4V
	vNkWGUxImOVcmIh77Kma5jintP4/WT42+0yogEvv6v/5WsNScHrveVu4ECEt0gcaETLxJHg7UYK
	fo9xbnPu1Nw4YFdHyqa4YP9lucx/mnOmvTnRC
X-Google-Smtp-Source: AGHT+IFgXJglUc30cMkXqqpT1tGlPTXMgOLjq79RpYURz07MLDp+7EaNgn39pCdmXToT+a7HM1K/xg==
X-Received: by 2002:a17:907:9723:b0:ad2:40ee:5e26 with SMTP id a640c23a62f3a-ad240ee6004mr714275666b.4.1747063443150;
        Mon, 12 May 2025 08:24:03 -0700 (PDT)
Message-ID: <b9a2b6fb-af34-443e-93b6-a5e827259a4b@suse.com>
Date: Mon, 12 May 2025 17:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] xen: introduce flag when a domain requires cache
 control
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-9-roger.pau@citrix.com>
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
In-Reply-To: <20250506083148.34963-9-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 10:31, Roger Pau Monne wrote:
> Such flag is added to the domain create hypercall, and a matching option is
> added to xl and libxl to set the flag: `cache_control`.  When the flag is
> set, the domain is allowed the usage of cache control operations.  If the
> flag is not explicitly set, libxl will set it if the domain has any `iomem`
> or `ioports` ranges assigned.
> 
> Modify cache_flush_permitted() helper so that it's return value is no
> longer based on the IO resources assigned to the domain, but rather whether
> the domain has been explicitly allowed control over the cache, or if it has
> IOMMU support and there's a single IOMMU in the system that doesn't allow
> forcing snooping behind the guest back.  As a result of this, the return of
> cache_flush_permitted() is constant for the lifetime of a domain, based on
> the domain creation flags and the capabilities of the IOMMU if enabled
> for the domain.

This then further emphasizes the remark made for patch 7.

Jan

