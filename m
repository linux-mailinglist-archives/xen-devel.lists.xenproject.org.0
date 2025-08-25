Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10DAB33E1B
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 13:32:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093023.1448610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqVR5-0004Cz-Lp; Mon, 25 Aug 2025 11:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093023.1448610; Mon, 25 Aug 2025 11:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqVR5-0004Am-IP; Mon, 25 Aug 2025 11:32:27 +0000
Received: by outflank-mailman (input) for mailman id 1093023;
 Mon, 25 Aug 2025 11:32:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqVR4-0004Ag-AL
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 11:32:26 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b8ab767-81a7-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 13:32:24 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-afcb731ca8eso672146866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 04:32:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe74f5672esm281066866b.59.2025.08.25.04.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 04:32:23 -0700 (PDT)
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
X-Inumbo-ID: 2b8ab767-81a7-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756121543; x=1756726343; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dy8sev0VqG6oWNs9lVAThVXzWNFsVRxxgPVBYijMH68=;
        b=TG84VT0xA/FlbbYCK8cv9M1upXSg0oWhaM80JBl9FtvHH62PFRbivszQlIHrEhzZ6f
         7dvsxoYbU1B9CzilLf48SNpZGLEdrcxD+sZDcq/RWQKsjZOeVcx/RqxGSdrywmym1Ur+
         Yxf8YYxUpw8fzZXuLckjvBj80/XVxajz+Lw+wZQZNGU7okiDzi9PhECTX5QiDb9RYGPS
         QZWmOKKD0UXpnsD4tyFmsrgIt4a/L+TH/lyWmLALB0ViCC6wdAEY7q5C40/QuhNMAWmL
         43xrcHYPkPHLiytgdy44PL06TJPscxCSbpbaWzJU0aMzmgfa4QaYieddGCPMKjFxBuiT
         Pkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756121543; x=1756726343;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dy8sev0VqG6oWNs9lVAThVXzWNFsVRxxgPVBYijMH68=;
        b=CNkPRy9Ayo9PrbJeVQfWTjzVu8FBI52P9Bg1q6oQdu4g4qtTKcZEqr22ZxyhoTXt0w
         gS08gSPoSbI+4/y1iMbVcfRraFMilDq8KJBpNw06lrQHkhhvVVX4zKpJqlVcbGqQ9uUh
         MlsU1RSmTZgCYXajBr8yEJ5xaIs8BEtMyHtll8KdOW0lI4d/sbL1YTmDYg4t8dN8JVHk
         QUyrJACWb2bo4vx5dBou823Kx+LWKVaiE1lwk0Nb9jNT6UMwH/RTYNF8SFeZ0XAlDzjv
         yZgqAVJYHdZGy3m891z9kQVdnkZbifoRV64MWfIStpfwzpaAtapAmvr5ZIqiQuit+KHK
         OZvw==
X-Forwarded-Encrypted: i=1; AJvYcCW+LuNC5Dv0wftX4K5ME095rRfTGhU9BwukxmjZJEunlQ+Q5zovvrdBHIl9i+WPuj4DMhdd12A1htc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAo57uaMmO8rnzhDmWfIlpYqje7GeINndtt3+TPLfnYYPzb7iG
	WfP1zfyUStBULuzfo7i8vKee8imUmcPZPtGrM/63qZzcARbUK+TZfq2wd9PwVa1+LA==
X-Gm-Gg: ASbGncsgH+A/yT69YqBYtpaZ2t2i6JaWQuxO2GjwvMd5vDBuHmrr6tbNIQKwZUlvEr1
	I+PVL7fuPjpfzgMVrDCBxgLL/QWzjqski6zIO9LJRL9185htkMRuKm4G3lkc8irJ3KyMaiJLNfW
	Aq+P9dLJWQOFlCEQMHWBktuUc6McgwOciJ5uvxYIEyh+GpPb3IYPWJPnoFEOoYpqamaV9rZmkUb
	vF7hYJz6xV6yqassLEDOmx4XbFEjHtthyHWmHUU4u2wupg/lpJtuuRscyk/3a/9eEn9YFIB5ZDz
	gp+WJYFHBJIRNU75lJxXVhmMvTQAvPLTGOaKJ79nFeRDzYPIiL+nM1SRWdfF+BP8Qmc9NjDp0cm
	9m1kT0/oTUUh37WBFIok+kf3va7u1z5jzMQk9v4TOzDVpyCUQv75A51BQv8858oX/97e30gvd/d
	8ZYIn2+jo=
X-Google-Smtp-Source: AGHT+IFMcRTzPpv5hPuYysRywvvfCgUpdxSMtiuwkyghCIvMFIv042+Rc2XmMKo4ce3ts5qYa+af+A==
X-Received: by 2002:a17:907:97cd:b0:ad8:9b5d:2c1e with SMTP id a640c23a62f3a-afe28ff9049mr1026359266b.29.1756121543360;
        Mon, 25 Aug 2025 04:32:23 -0700 (PDT)
Message-ID: <e2c4944d-d089-490c-879d-b6baec5e4cae@suse.com>
Date: Mon, 25 Aug 2025 13:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] vpci/msix: move MSI-X hole punching as a result of
 memory decoding enable
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: stewart.hildebrand@amd.com, Jiqian.Chen@amd.com,
 xen-devel@lists.xenproject.org
References: <20250814160358.95543-1-roger.pau@citrix.com>
 <20250814160358.95543-5-roger.pau@citrix.com>
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
In-Reply-To: <20250814160358.95543-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2025 18:03, Roger Pau Monne wrote:
> Deferring the p2m unpopulate of the MSI-X table region to after the BAR are
> mapped in the p2m is not needed.

For my own understanding: This is because we would never actively map such a
region; we always subtract it out of what is going to be mapped. If so ...

>  The aim of vpci_make_msix_hole() is to
> cope with the BAR containing the MSI-X table being positioned over a
> reserved e820 region, by making sure the MSI-X table region is
> unpopulated on the p2m. Note that reserved e820 regions are identity mapped
> in the hardware domain p2m by default.
> 
> Doing it before or after the BAR p2m changes are done is irrelevant, hence
> do it ahead of the p2m changes, as that's simpler.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

