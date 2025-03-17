Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB0DA6575D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 17:07:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917343.1322298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCzy-0007NH-Eu; Mon, 17 Mar 2025 16:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917343.1322298; Mon, 17 Mar 2025 16:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCzy-0007KW-BL; Mon, 17 Mar 2025 16:07:30 +0000
Received: by outflank-mailman (input) for mailman id 917343;
 Mon, 17 Mar 2025 16:07:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuCzx-00073Q-HC
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 16:07:29 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec1d6d30-0349-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 17:07:27 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4394a823036so22152585e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 09:07:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fd301edsm54590525e9.0.2025.03.17.09.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 09:07:26 -0700 (PDT)
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
X-Inumbo-ID: ec1d6d30-0349-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742227647; x=1742832447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lV7Sq7NAj36oN66CO5fLVP/HN7Sqr7xO8FhrN96PFrA=;
        b=b8oGcbCJ0Ua5huVgwqiEJCORktx5/poQMc9evzQ0dMSNT7p7KkC+5oVZiHqEkboMyA
         fasjVWWFO7iV2OjRzRuui1y6TfMa3MYdIVp2SQMhJVpunorEG+4BZdUxQcqJZ+lrEho/
         OdwxUDAEWG5r/MESkyQSIV+zRHNCsF+lpIuRQHv74yrUZ+fkM6i5Jf3eKf3nsaZTXqBX
         NDRGOTcrGllX/I4XtUPIA6m9BxU6xAk18r3O1thr9LXQIHTWIjajK4y3JSPN9DqGciDe
         yMUymFlgexn1Hl4xgGGSU2YsLXr5pRga5BZn7PUMDIaI1s1/4wq1paAu+GxvrdCdH+No
         FJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742227647; x=1742832447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lV7Sq7NAj36oN66CO5fLVP/HN7Sqr7xO8FhrN96PFrA=;
        b=rX601N/NpR+NCYZBhYEdRRiuJCVgT894fotxhcgESh80NEn6eBMvsIGuqxC9qpNNdb
         dJZS2VqrFCwyqzgca3EuTCWd+IjNHaKM5ZQpu/LmsfnH8Pud6S/Lkf/9RdZrtY7B15l7
         kPfSgD03HlAWHKEbzuPIHm1RHdoFGvRZ6Hi6OwdfRtdaWwBZWqAWPxhSb5f2r4a6VrEP
         duDnv5Uv6x9EBb3terIMgsrGOioI9SfMSCSIMVNOY1tbDL80XSwNgf9FyMMZhxs5uUdc
         xvngsNMIQAR7M0Bz5CHyUUbwgJ1Xb2tsI49jwUcr30n7D/46DLDtYxmbrgTFEAn2kb3c
         YnVg==
X-Forwarded-Encrypted: i=1; AJvYcCXIvEYzCWZjr+CfIJZ0wHD2zIqmhZsUSV/SADIVaxOD8Iod6iomngH741ZHzkqF61cDHfMXK6JAwDg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwsbMeEBF2n+vxHEot1vqmRhgrlwWFBftWFZckOBgdL52ko5HxA
	ujU5VZqDoWnHB4GGjpdkqQmAfL+LSHbdMtjr4Kc2yqS/FBsH3M0uTEWa99Golg==
X-Gm-Gg: ASbGncsdOUh7o662s2/KcVH3Q5iGr2UUKvcGgf/6oOgHQJLmgqsqzcrhLYeIpWY1g68
	6W4EPURobQ6ELOhAJ2HAtjKrLR9oMr41t5fAxTjPAHWyDnQnUF9Rv+4wgEMMcS+9btcMHuhocNs
	nQ45ASf2B//omh5EpgdeVHA/CRjPzG4FX6AfxlFEZuzsT6N5hG5wqwoNYiRyPtCnU7O33WMgnyg
	gfFvfXCDzQ8MdB9oGQ3e35YebWuBfNgs2EYPsFA8nhDZFRB2mZ+L5mur+u4F2UF6Z95k4HfjCxs
	PinuUiHhUVRJv3o2F1NQfBHOsyFc51jkgj/HGdYfWguoJ5KN1YjGQiHqRoeuUiVYletLtpnJdyK
	mr/02iwfslInGHfYnTBh8D+JsfDew+w==
X-Google-Smtp-Source: AGHT+IFHc3r56yyXZthju+gzV8snMZwGrwVB8Tij48FHuRj5/xMJaS3pSo2mtk1mKW0UDD90smESvQ==
X-Received: by 2002:a05:600c:3d16:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-43d389718f8mr4205155e9.3.1742227647234;
        Mon, 17 Mar 2025 09:07:27 -0700 (PDT)
Message-ID: <b33592fb-8532-4580-92e0-5b60fa345e2f@suse.com>
Date: Mon, 17 Mar 2025 17:07:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drivers: Change find_iommu_for_device function to
 take pci_sbdf_t, simplify code
To: Andrii Sultanov <sultanovandriy@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1742063500.git.sultanovandriy@gmail.com>
 <47e9f0a75a8bce85af0e53c06c95c25b0a061e3e.1742063500.git.sultanovandriy@gmail.com>
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
In-Reply-To: <47e9f0a75a8bce85af0e53c06c95c25b0a061e3e.1742063500.git.sultanovandriy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.03.2025 11:08, Andrii Sultanov wrote:
> Following a similar change to amd_iommu struct, change the
> find_iommu_for_device function to take pci_sbdf_t as a single parameter.
> This avoids splitting a single argument into two registers in the majority
> of cases.
> 
> Bloat-o-meter reports (on top of the first patch in the series):
> add/remove: 0/0 grow/shrink: 11/13 up/down: 90/-154 (-64)
> Function                                     old     new   delta
> amd_iommu_get_supported_ivhd_type             54      86     +32
> parse_ivrs_table                            3955    3966     +11
> amd_iommu_assign_device                      271     282     +11
> __mon_lengths                               2928    2936      +8
> update_intremap_entry_from_msi_msg           859     864      +5
> iov_supports_xt                              270     275      +5
> amd_setup_hpet_msi                           232     237      +5
> amd_iommu_domain_destroy                      43      48      +5
> find_iommu_for_device                        242     246      +4
> amd_iommu_ioapic_update_ire                  572     575      +3
> allocate_domain_resources                     82      83      +1
> amd_iommu_read_ioapic_from_ire               347     344      -3
> reassign_device                              843     838      -5
> amd_iommu_remove_device                      352     347      -5
> amd_iommu_get_reserved_device_memory         524     519      -5
> amd_iommu_flush_iotlb                        359     354      -5
> amd_iommu_add_device                         844     839      -5
> amd_iommu_setup_domain_device               1478    1472      -6
> build_info                                   752     744      -8
> amd_iommu_detect_one_acpi                    886     876     -10
> register_range_for_device                    297     281     -16
> amd_iommu_msi_msg_update_ire                 472     448     -24
> parse_ivmd_block                            1339    1312     -27
> _hvm_dpci_msi_eoi                            168     133     -35
> 
> Signed-off-by: Andrii Sultanov <sultanovandriy@gmail.com>
> 
> ---
>> This avoids splitting a single argument into two registers
> And adds a few conversions into a pci_sbdf_t... these are addressed further
> in the series. - not part of the commit message in case said commit isn't taken.

What is "said commit" here? Everything done in a patch should be in the
commit message. If parts are later dropped, the commit message would need
refining. With the commit message amended (assuming I guessed correctly
that this is about a few secondary changes done here):
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

