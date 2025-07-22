Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52253B0D940
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052563.1421283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBwt-00079T-3G; Tue, 22 Jul 2025 12:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052563.1421283; Tue, 22 Jul 2025 12:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBwt-00077l-0h; Tue, 22 Jul 2025 12:18:23 +0000
Received: by outflank-mailman (input) for mailman id 1052563;
 Tue, 22 Jul 2025 12:18:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueBwr-00077f-A2
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:18:21 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f472326f-66f5-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 14:18:20 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so38715195e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 05:18:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb1575f0sm7419145b3a.75.2025.07.22.05.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 05:18:19 -0700 (PDT)
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
X-Inumbo-ID: f472326f-66f5-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753186700; x=1753791500; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L2bM/RDLNxHgMAVzuIqYFd0r4cnQCI+iiUD0acNonUU=;
        b=Y6cC5Fhsi3d372S2s893XkRwn3Ob0B1t9I/THk5+WOiWc7y36/I+dAfSIibYbnnfh3
         n5xcQF7X3FlSEOOI3i5L2EOR6gMQ/ElGyUJ0E8tIa29GLS8Pdi/HpzKifm9P2MLvPTeB
         xwynnkN/3SyxwKgKZdvpPsqmxj0JgI3lJ1kv+FPlc+Cqj7J50rHOboAvuLY+Aequrezq
         dkx+OLNnV9vRg4cD5g1P45+LC3+ibWo+UN63jYzI4ohGCxM7nqOB2ST+owEIyLz2RObw
         EIiYmPs+wiwZ0tqbbBtKmlyrBq0PdSCB7Cex3SvvEQQ4JoIjkaYnVIWYsWxM18wuoc4O
         BOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753186700; x=1753791500;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2bM/RDLNxHgMAVzuIqYFd0r4cnQCI+iiUD0acNonUU=;
        b=Kii7Qz1kjQNpPn2MGWlz9XbUH0h9TQgmWyouiVtt9iFXGomeEKXnOPC2wG/zPJfIos
         U+dYc0JZkmNv9+YLXMfS6sobDdTOhE1F1QQ53xhtOpp+T0fG90UToW6KUnjhA3b4yE7w
         Di5SpZpn7qTRcwjI6k5JG/V8N18gWetuIZiCnnj0elZ3RLlyTE3Ya2YJ5g9aVM88EiIN
         k7Cw24f/svqLoM+4NJ1qFQVhuW/wJgNeSYB+Bmx0HaJlfx60XZKZPSBnGVAAS+cIQaCO
         ouPBwGXPCguFavNQ/NQLKTw3fD5Lmco3Bu3xJCzsvdm/t4bwWwvJpCUR0aJylhcYHVj0
         u48w==
X-Forwarded-Encrypted: i=1; AJvYcCVrW7RM0yS9Hrwg2ELpzSTEhdTsufNlMjanyIxCzbhhRfIMMfcoBo+rxNTVQL/X63shQctNh+2zDqM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVCkKLS2vSQBNaoXoJJ1GL7PihihPpnYexR5iukAk5/XyeyYFZ
	vTL7DiRyynRfi3Cp2YgWTSo12x7pXy94mUAutr9QiTZ5nES6kYiFF8q0oj3DHMX2tg==
X-Gm-Gg: ASbGncscXwxlIBHkeRhI4PUJX+ME2Gc/KGSDUC5kYQOQl6ni43HcvvbvpR/KkPwJBJd
	kFD6D8OPGWzruhS6uB4zCmrbYLr337eozhinbXUChJeIWfOMEWv8pEPAxvXk6vkJ5eanxQO7tXZ
	ne9ziTLspgqiwATkD2UPhAOHsWp9XCECdnDuAwdQbLFW7bidQYEn1S/jHL+ghbuv4WO3EeiYFtP
	usC/SZscAmJ6t7VPTTxpjZoIGtr2mHbJinFtCCLhyVqze1QwYG0Y/RFdQtsZuU0pYz4lHOAPcVk
	Uqotk90ecmlY+454I1C/4SnVOI6qf4DVtRpXH66Ywy6l0l8QeBVx5YjpfSt3w6l6UfzCMq0QbEC
	0euSC4zZ6Cs4Tm8W5Op1KpU2RCX9QolFHvUP/p2/4x+5FRSxRki4jaEmfjCkyhLMoO9+IwLYArP
	foPqcljlw=
X-Google-Smtp-Source: AGHT+IHszDdqW5MHQPxRTw9orWSKsu5zPTuZE1nFJyAuCc2YqwZEXUHBF8XQ5hfPTfhw0g3Ejxr+jw==
X-Received: by 2002:a05:6000:1ac5:b0:3b6:938:86b7 with SMTP id ffacd0b85a97d-3b60e513724mr20973351f8f.35.1753186699672;
        Tue, 22 Jul 2025 05:18:19 -0700 (PDT)
Message-ID: <e18e45f6-cffd-4bd9-9091-d2e5e979ffb1@suse.com>
Date: Tue, 22 Jul 2025 14:18:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] dom0less: Reinitialise all variables on each loop
 iteration
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
 <20250722115955.57167-10-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20250722115955.57167-10-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2025 13:59, Alejandro Vallejo wrote:
> Reduce the scope of every variable so they are reinitialised. "iommu",
> for instance, isn't being cleared, so the wrong flags may make it to
> domains that should not have them.

Yet "for instance" isn't quite right, is it? "iommu" is the only one where
the (re)init was misplaced. The other two ...

> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -826,14 +826,14 @@ static int __init construct_domU(struct kernel_info *kinfo,
>  void __init create_domUs(void)
>  {
>      struct dt_device_node *node;
> -    const char *dom0less_iommu;
> -    bool iommu = false;
> -    const struct dt_device_node *cpupool_node,
> -                                *chosen = dt_find_node_by_path("/chosen");
> +    const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
>  
>      BUG_ON(chosen == NULL);
>      dt_for_each_child_node(chosen, node)
>      {
> +        const char *dom0less_iommu;
> +        bool iommu = false;
> +        const struct dt_device_node *cpupool_node;

... had no initializer, and also don't gain any. So they must both be
set inside the loop. (Irrespective, the scope reduction is a good thing
imo.)

Jan

