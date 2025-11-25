Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D88A8C85BC1
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 16:19:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172030.1497103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNuon-0005R4-Bq; Tue, 25 Nov 2025 15:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172030.1497103; Tue, 25 Nov 2025 15:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNuon-0005OI-7u; Tue, 25 Nov 2025 15:19:01 +0000
Received: by outflank-mailman (input) for mailman id 1172030;
 Tue, 25 Nov 2025 15:18:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNuol-0005OB-LU
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 15:18:59 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10796704-ca12-11f0-9d18-b5c5bf9af7f9;
 Tue, 25 Nov 2025 16:18:58 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477632d9326so34165185e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 07:18:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479052cfae0sm17654475e9.8.2025.11.25.07.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 07:18:57 -0800 (PST)
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
X-Inumbo-ID: 10796704-ca12-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764083938; x=1764688738; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j8DnPuPRWuF47udyl8iF/eaeM0cBaAUVmHXO+9wc5jI=;
        b=VTyY7x3krd3cttXtdR4f6cpoqG5B5iQPOiGQYZ1S2E8ojrAml5AbgfT6MmiboF86pY
         iVyLiQB18M0fQIdJxDxBBAuCOOjk5BGzJ8wH1UsaXXI5sOqRAgLI8ANJUD3VN0kvQ8D/
         tQllrf6RxYFgt8pDznqZ39CXH++tLg0vTByo4bVdYj0qQSKi883tw1a0czJlP3Lg7Dqq
         tPlDf+a5PlxQKxywpoDA16XvS365GDSVLKizOfowehnadQdBqb6oUjpeaYcBkF0w3A0F
         FUZUelPzY4mzMdmfGo9k9Uy+EuG/YMM3+k3NKphf9varOFZNukx9cqBCgcZUsUR0vmaH
         wX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764083938; x=1764688738;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8DnPuPRWuF47udyl8iF/eaeM0cBaAUVmHXO+9wc5jI=;
        b=XlxzvZQNgfSjbOT/LJ3xC5x/TxTjwRJjKS/zSMBYHb5UR32y4X4ZkZyzdtzwNJReCn
         49SVs4RUaNgXxmYYtZCFBcUHE7B++yz16oGESRaaM34Us9XCW+ucyXh+qyvjHc2PDOU/
         2uI6W0FHTLgNhD6ngRnXFu+Scw+7wa5/G4jwuduHGoJvJwTsh4Xp1bbn8nHd9DQQuymO
         PFJb4Ako58Yqx+7faH6b8ZoxnbDK8iW7Rd5jEKH9xBR17RWoNatPIutNdfftzPzTn/XC
         OUJXiACT7fyGAR0jwJYN2U5FTC89GiCWHECB5Yrtz+XsVSd8+Hp8s4I4Mge6rD9kJZzD
         b7zg==
X-Forwarded-Encrypted: i=1; AJvYcCWpKVGGoRQIEhWWsdTJxnG0QrTu/CWIFELPDNtTIYiTq43ksakArfyNXgL88GcXM2F4wp4nMUUxXRY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJp9jj9VLTvTVn5LOrTbCXpp/dJkpQjX9P5U6ZzbOeyrU3lajd
	0acoD+ZX+07aeywBFrK7v9lReRSEDO+qGeStro7bY5fFCssIkd3o3bCSxZnQiVP/Dw==
X-Gm-Gg: ASbGncvUQhdnrZe/5mvxeURzw5+VzqTvAiRKSF+Ut4bpA7fMZLvCJuBeMC1bsXlbq8M
	k30pjU6Wrg1R3fM/0E454vDn46DJakyEsYvkPPfO4j/nhosWwCB/PWOGYDJybRpn6a9kcDcDHRY
	Gx8AURPP7sIU3mQrm9fTuO6c2cK5KjRXRsXQS3m2qg6rwKJr+Iwk5IWVZky60ziK1WYCgEZX8V4
	WiLzxwopOxD6oShkIu5qhIgfzV55UruneLJFNZ1p/YvmpO75CnTSZQvgLVBIuF4AnJD0lE4Iy3P
	Tq4ePL1n7qkRP+75l9TZo4fo1mkWPCAdvOCtbpROPMhjoLuOgQ03dHmViaMk7cb20SF1nyHkB9g
	MWVswVdPc6Aiq6VZKMMq7JaDIfNJTj8D8sXWkmOIiYHbX1Fv7pK2AL3WM36CdA+i8i6eKDPVXiO
	6LkK6Gc8p5o18dSzafkBc/nG3y0SGlullA5EAfwTmtFwhwpBVBNKjc+MokARTk
X-Google-Smtp-Source: AGHT+IFtV5dImqwXyIHt/ABFZkCNQR/+CSFvyklzHF+eRSMemkqTRoREec6ardNeipvYy6xNmcY1Fw==
X-Received: by 2002:a05:600c:1d1d:b0:477:7a87:48d1 with SMTP id 5b1f17b1804b1-477c01ff5bbmr189193295e9.30.1764083937857;
        Tue, 25 Nov 2025 07:18:57 -0800 (PST)
Message-ID: <f3952047-44bc-4b5f-a1cc-ba127cd84de8@suse.com>
Date: Tue, 25 Nov 2025 16:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/24] xen/domctl: wrap domain_kill() with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-9-Penny.Zheng@amd.com>
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
In-Reply-To: <20251121105801.1251262-9-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 11:57, Penny Zheng wrote:
> Function domain_kill() is responsible for killing domain and relinquish
> domain-held resources. and it is only invoked under
> XEN_DOMCTL_destroydomain-case. So it shall be wrapped with
> CONFIG_MGMT_HYPERCALLS.
> Tracking its calling chain, the following functions could also be wrapped with
> CONFIG_MGMT_HYPERCALLS:
> - domain_relinquish_resource
>   - pci_release_device
>   - paging_teardown
>     - p2m_pod_empty_cache
>   - relinquish_memory
>   - pit_deinit
>   - iommu_release_dt_devices
>   - tee_relinquish_resources
>     - ffa_relinquish_resources/optee_relinquish_resources
>   - relinquish_p2m_mapping
>   - p2m_clear_root_pages
> Otherwise all these functions will become unreachable codes when
> MGMT_HYPERCALLS=n, and hence violating Misra rule 2.1.
> The reason why {arch_}domain_teardown() is not wrapped is that it is also used
> on the failure path of domain_create(). And the exclusion of
> paging_final_teardown() is blocked by domain_destroy(), which will be
> triggered when d->refcnt equals zero.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


