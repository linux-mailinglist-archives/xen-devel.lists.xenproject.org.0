Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EA5CB8716
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 10:24:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185269.1507501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTzO4-0001ji-0A; Fri, 12 Dec 2025 09:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185269.1507501; Fri, 12 Dec 2025 09:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTzO3-0001hZ-TZ; Fri, 12 Dec 2025 09:24:31 +0000
Received: by outflank-mailman (input) for mailman id 1185269;
 Fri, 12 Dec 2025 09:24:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTzO2-0001hT-Gm
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 09:24:30 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b9246eb-d73c-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 10:24:28 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso7468405e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 01:24:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a906fae81sm5151455e9.2.2025.12.12.01.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Dec 2025 01:24:27 -0800 (PST)
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
X-Inumbo-ID: 5b9246eb-d73c-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765531468; x=1766136268; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MNBSMiP4wnU7GtU8DXqTAJdFHX+OfSGNVckZFn44WxY=;
        b=FrkN1tscWjm4RcybTWkmBXos7GOLGdz+HZSm6yCX2mFptbPjHq/Z6A6LF10nAF4DYn
         vNLSwKXrgYbvf4hQFnJL1sue1qlw0fA7zUXslLkCOxYPna2F0t3ldRfyhWWEGxqIVLZC
         PVse49vJR5XUpHFgJ+YV2rOvkK+OiikNL03391jY0DH9j3ejgXE2nG8IMUdFS/OzzBGi
         e0R6VY4SmLz4bf5tC+YAF35ypuGQEl2td9jt6UByvXT9WJExkS96JAAbe4MfHhydbqb/
         w4ENhMa7oPKqSl8gHGD8NGBqAdOoJMV7PJEKaB8Zpw1+x2SHrpyacBdG1GHbOupjmUyx
         JyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765531468; x=1766136268;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNBSMiP4wnU7GtU8DXqTAJdFHX+OfSGNVckZFn44WxY=;
        b=OhzAGabAkktDRLlBjhvCNRItwB7SwVKZG9GZupB63jujU9hLzXci1nGxlSYpRNJwUj
         Td3ySY7Gdd7+zjfJmYUYBzP+cYH+o3MpfV0pUdHklDj5e1huZ3VSwZgZxnK/ZJgYX402
         iEczKOsu2FEvvxegSbvI1a1n6mpUb4mKL5mA1UFJZR7H5NyjlZmPFVB7kyXrud/Zup1O
         rhA2G62daie7FD0gEP14e39QTe2aQrqTNU93eehsYDAluxmQEzhD2xwlaBhUBiFjpqKa
         NG8GdN9/zPqW+4ck6XJoJd9TYpuNwyu+v859W6hj25EJGA10qcdewuHQ9rHE9cBZ76DV
         z6Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXyuOsuKtcjBYGc83x0T4dlci1c5qBOQsPfPTuHl8d9kmhwx33WE8dZsHmw6dg64OAFlJOQJxKtmJQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXQqQQ3xJtNFLKX2wfsZFiVaffowy3zpIBKNiTXNQOg/n5zQTn
	+zRLcN5sj/xxSM35mRwa+XI5gcy9akBa7AqD06g7aG31XajlbFpN8MsJY5QNLLTd8Q==
X-Gm-Gg: AY/fxX7MYDe8TaDuJO/rzxK5gZzGXmAEig2RL0H7/6pae4Fa6uW58hXJEvnRVvoUDxT
	zyBO1LdLm5dF+P6p3qdtsPkDrpa54p1ku+StkXok2zyIvkibCUxEehlysWhXGnFWt9Cn8fzKGPs
	N26x5uQ+thp/ufvVGEGr+v44Xo9cIZbB5vFWUq3fIm9NUyYf3e7mc78ja1nGKdJIcvw9aQcCxK0
	dZ6+SUOD+/vp8AaVFiJuq7JSWpU9IbVy4Je2+Ky4wx4hvLiWNgKAeSAX6xpfNoGocphDRDpybXi
	i0r7PlLWxeQSEm5YeoLgR4kL8a4c5KIwsuDpmzwRMqZD51RWC6K3Ud1VAxXd3GdeKcaCPxgZ9bo
	kVxp8obZr4mFDQ9afTAWuZ5E/xq2JFp/F8jQKEMvtYPG0fw0Qzc1ZwLuN2HUbqJ2poOrtzqSkan
	1TBYeH2KDlOSoNCM4ARfdUOKvivIhd7sjYs6/CxZnSUjTSi9Bem5VIErH5N+Kez7e+N7JJqkwmi
	6o=
X-Google-Smtp-Source: AGHT+IEgzk77lFO2Ly6hkNahzjPJrK+14Hvmb9omTBa1ZS32sPDAlYC7vOg3/xSF6sM48zk5nuGpyQ==
X-Received: by 2002:a05:600c:1994:b0:477:952d:fc00 with SMTP id 5b1f17b1804b1-47a8f8c0a28mr11649975e9.12.1765531467787;
        Fri, 12 Dec 2025 01:24:27 -0800 (PST)
Message-ID: <c40b079e-cbeb-431a-9c1d-9425d75258fa@suse.com>
Date: Fri, 12 Dec 2025 10:24:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/24] xen/domctl: wrap device-tree-subset
 iommu-related domctl op with CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
 <20251212040209.1970553-17-Penny.Zheng@amd.com>
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
In-Reply-To: <20251212040209.1970553-17-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2025 05:02, Penny Zheng wrote:
> Function iommu_do_dt_domctl() is the main entry for all device-tree-subset
> iommu-related domctl-op, and shall be wrapped with CONFIG_MGMT_HYPERCALLS.
> Tracking its calling chain, the following functions shall all be wrapped
> with CONFIG_MGMT_HYPERCALLS:
> - make PCI_PASSTHROUGH depend on MGMT_HYPERCALLS
> - iommu_do_dt_domctl
>   - xsm_assign_dtdevice
>   - xsm_deassign_dtdevice
>   - iommu_deassign_dt_device
>     - arm_smmu_reassign_dev
>       - arm_smmu_deassign_dev
>         - arm_smmu_detach_dev
>           - arm_smmu_domain_remove_master
>     - ipmmu_reassign_device
>       - ipmmu_deassign_device
>         - ipmmu_detach_device
>   - iommu_remove_dt_device
>     - iommu_dt_device_is_assigned_locked
>   - dt_find_node_by_gpath
> Otherwise all the functions will become unreachable when MGMT_HYPERCALLS=n,
> and hence violating Misra rule 2.1
> Move codes closer to avoid scattering #ifdef
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


