Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C78B53197
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 13:59:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120092.1465177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwfwv-0003EX-SC; Thu, 11 Sep 2025 11:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120092.1465177; Thu, 11 Sep 2025 11:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwfwv-0003Cp-Pa; Thu, 11 Sep 2025 11:58:49 +0000
Received: by outflank-mailman (input) for mailman id 1120092;
 Thu, 11 Sep 2025 11:58:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwfwv-0003Cj-30
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 11:58:49 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aca06238-8f06-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 13:58:47 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b042eb09948so128806166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 04:58:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b33478e4sm114444966b.96.2025.09.11.04.58.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 04:58:46 -0700 (PDT)
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
X-Inumbo-ID: aca06238-8f06-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757591927; x=1758196727; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ypJXWGy4zGKZEm6L6+M44/YFGkPLMs03nR2P4e+tGzU=;
        b=CmClvW6HNeUoMvTt1nTA/Hl+ZbXrJTd3mySiFm6OQCPkwMwiB3XboieLUMsv1T6Si5
         quGnWcwzJdqYurfcVYbObzg5+AAN+xCd6zSQ3f0pwaXFFYCXtARt5U+IpaILTat1l2Aa
         HFWEsP5MsXPzg/pBkRYDkkPXfYeRCs4c1Tv0fClMrEe/vTsQAnOjoKEtkImaxYhxV1YE
         jwvqOVTcLQ6yi/XLX6ju3ChImbyxNZ3BqnslFKQPpEGn1VfiFa10MCWmjfnJAnUK+PfA
         wF35WW3jgRCW5OOdEk9qUn2BQnAMzFLKsdWxLTb08eGu3hgL2y4fol/NTPhtxqBFdvPF
         mcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757591927; x=1758196727;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypJXWGy4zGKZEm6L6+M44/YFGkPLMs03nR2P4e+tGzU=;
        b=BWwlDV3Nn9zeKhxDlJSKy/JjKT+oqj/7l3spi+AnClng+lfBdV9O5IjNw4ALOh4xYF
         N3ZO6KFwfLyVuNzh8Crg+RC26sgCGOCfrcD/r4oqCBqscDGp2Iug5dtVwLKq1v5MrZf2
         WIA+j7vhQR2FCj3oANRw8tZmM5k9d/VwISi0CD/of3gYmVvuwgFOTsxH3Pt0tHVsusCV
         DFpM2/eqYXkXV/ttQHocTXHhfxlpQsEwqyHUPVVre5r5xQETweuimfmB/nHkIlSq9Qbu
         8H4S6uasQafQPtUjuOzmfMt0h2nL6G+aN9+pjYtNZ+AfziR4KfahjQaIk4i3XaS2vXAl
         sflg==
X-Forwarded-Encrypted: i=1; AJvYcCWkBbAlaqFAIg+rE/P3KQgqDN6mbMpqRx7O5bjY1KPWaKnSnbHUd2O92Wt4bMs2ywh7+JVgRlv7fD8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdykQxCzNOnL+OC2PiIjqhTyvcNZxBLrUCZp8m4b/eDyJDYfQb
	WEtPiQzobG+3jCx8thVS5mGypLMdexdSkscjuBVMwNGAaIRIe7c66L8oCaNvIzFjeQ==
X-Gm-Gg: ASbGncsMwb37yubMX7PQalH0+QRgSUHrgq0Fpwmb4rPZcGhrxYnhF4Pj3sWb+5ZKuk/
	e8TGshgbTMwDyubarB5JBGLQV3cZGU9NTKtYUVifUML8Rl+jo30TrOJX9PXvzNxxhw4GSy6kSxI
	deDiE/de66uGze5G9WFXGqCppKwL78NA8X1hZTI7D/5cX5bUWQWHdMU65L9dl5zvUhsu/k0g00h
	kCmU+dp71cZRMMPamrvYsTow1N4J4Tv6+yzn8zOaKVzBh3gVroJSYADGQc9Oibn8mtQaN76I4Qb
	+GthLtO0HtmCC447KIWYObsIWmp/s5k4U++W7NIlNosmnEeTsyredVpGXkmHHyG+DOl8urhOrxo
	ai8s9Et65K24XvR+lti3Pi49rOPZvbBZmqQnscRDBhIeD1D7BATXXwMYYHw+PvNcyIuodaxKlMp
	JWWqwYoKPYgJgM/Ozquw==
X-Google-Smtp-Source: AGHT+IFCDzCthNPJUSi2K9wmpOK9kYw8IA/ZAdccooK858tHScEc6r6kKI4Z2o9VyagOar30EN2oBQ==
X-Received: by 2002:a17:907:e98b:b0:afe:d62a:f038 with SMTP id a640c23a62f3a-b04b13fe73bmr1673487666b.8.1757591927225;
        Thu, 11 Sep 2025 04:58:47 -0700 (PDT)
Message-ID: <0af66ec5-a53e-4f09-96bd-3cedb7419006@suse.com>
Date: Thu, 11 Sep 2025 13:58:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/26] xen/domctl: wrap iommu-related domctl op with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-21-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-21-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> Function iommu_do_domctl() is the main entry for all iommu-related domctl-op,
> and shall be wrapped with CONFIG_MGMT_HYPERCALLS.
> Tracking its calling chain, the following functions shall all be wrapped
> with CONFIG_MGMT_HYPERCALLS:
> - iommu_do_pci_domctl
>   - iommu_get_device_group
>     - amd_iommu_group_id/intel_iommu_group_id
>   - device_assigned
>   - assign_device
>     - intel_iommu_assign_device/amd_iommu_assign_device
>   - deassign_device
>     - reassign_device_ownership/reassign_device
> - iommu_do_dt_domctl
>   - iommu_deassign_dt_device
>     - arm_smmu_reassign_dev/arm_smmu_reassign_dev
>     - ipmmu_reassign_dev
>       - ipmmu_deassign_dev
>         - ipmmu_detach_dev
>   - dt_find_node_by_gpath
> Wrap XEN_DOMCTL_assign_device{test_assign_device,deassign_device,
> get_device_group}-case transiently with CONFIG_MGMT_HYPERCALLS,
> and it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the whole
> domctl.c in the last.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Apart from all of the above another aspect becomes apparent here: Some code is
called at boot time only once management hypercalls are compiled out. Such
code should then move to .init.text, so we may need to gain something like
__init_or_mgmt. Imo that would want dealing with right here, but I can imagine
opinions to differ on this.

Furthermore, while looking around, I noticed that there's dt_overlay_sysctl(),
entirely unguarded despite the earlier sysctl series. Yet if that work (and
Misra checking) assumed OVERLAY_DTB=n, then there's iommu_remove_dt_device()
which is only used when OVERLAY_DTB=y.

Jan

