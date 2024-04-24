Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465AB8B01C8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 08:29:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711137.1110867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzW89-0005FT-3W; Wed, 24 Apr 2024 06:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711137.1110867; Wed, 24 Apr 2024 06:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzW89-0005DD-0m; Wed, 24 Apr 2024 06:29:21 +0000
Received: by outflank-mailman (input) for mailman id 711137;
 Wed, 24 Apr 2024 06:29:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzW88-0005D6-1P
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 06:29:20 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9e92e69-0203-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 08:29:17 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3465921600dso5766343f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 23:29:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x12-20020adfdd8c000000b00349f139dbe4sm16304867wrl.91.2024.04.23.23.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 23:29:17 -0700 (PDT)
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
X-Inumbo-ID: f9e92e69-0203-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713940157; x=1714544957; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tiRHu2idPnTBZhObf1Gp7e2XFf8Rx7ML7+yk732qZFQ=;
        b=Atgu7z8J2ToBgNZo+7Z8aT/+nekCazDUKn9A8rIHcKmA720zyLfjF1/M1xOMKwdJ0m
         FOhjpcwgAUXAW2yM8/HJgMqu0Cml8Cv94Hy9vwHA2+tUBA7Tft+nAOHzf3kueRVQudR6
         WJgCRpHktQLxyIHpQ7aZDs8vIfTZr3zCh0+IdUGjq116yzK1TYbxJlF5BqJbfpwJFMSH
         chVvhOJBT/3kIneCubs03gB9Rbrj6lCusEF3A9UzkYJslVZ4nFo4IAtbvsxL3fPMuy/o
         qYf6SVGsFPQaQ4qidcEeG182xISaaIQyLbaKyiQsm+vjvYop1CnokKZVzIkNhzNLph1G
         HaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713940157; x=1714544957;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tiRHu2idPnTBZhObf1Gp7e2XFf8Rx7ML7+yk732qZFQ=;
        b=w6AHL0lwgH7Qj1iw89UIdUrU55ykHqkqy8bqWqMRMuRreqi87Av+2JPBRD07VnmW4G
         3zUhOhYxIVUItfo7nJMsX+UOu4sFVvk737rcgHn4C4LBXJlD8VyC0wzR5btBlOm+3Ou5
         jRN6U9wGakOreR0VtqrCloKxrM+r1AP22fnW7co5JXDcrQ5jxkfxcz+k2ji+/h9BaoAU
         cqEmVKqfp7pBOQSY35Ihx8xZ14mzxb0eEfScwZYGksMRIce70dysJQGXKJvA3Etu/3xN
         PnlM84O6dze5GKJgwH4uod/VkbupCKNgnyJJYMo89JfeyN/Yv0y9OF9HbIacalfh5WES
         n9aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPAyT202qnQJug2q1wlOxFOGqvKLv16Gb4ZQkMaYd72qRCL3qiA1HxmZKzga7pI3FAVFiJXSrrSCTBuTi04b1axlnrz4iaUrd3dkGA6B8=
X-Gm-Message-State: AOJu0YwmswVwyiON4xH8wA42m/YdnUWGjmemdea3Nd/YazkloYTnFM6R
	GEwTy6rult5ndGmdzirB32AjQWciHvzGYdnU3bOJ2N72w4SzRDbsLua3VpYWwA==
X-Google-Smtp-Source: AGHT+IEvVxU0XXnHCr0IqYZrltBBR8eq3b0TpNDmfMVoMCbFi574Ycv+T98yDhcnOdU2VgEzyeEG9g==
X-Received: by 2002:adf:ed84:0:b0:34a:7066:d2c6 with SMTP id c4-20020adfed84000000b0034a7066d2c6mr863255wro.50.1713940157219;
        Tue, 23 Apr 2024 23:29:17 -0700 (PDT)
Message-ID: <e99fdcb3-92e4-4325-9b65-3a51dad4cfa8@suse.com>
Date: Wed, 24 Apr 2024 08:29:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] Remaining patches for dynamic node programming
 using overlay dtbo
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20240424033449.168398-1-xin.wang2@amd.com>
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
In-Reply-To: <20240424033449.168398-1-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2024 05:34, Henry Wang wrote:
> Hi all,
> 
> This is the remaining series for the full functional "dynamic node
> programming using overlay dtbo" feature. The first part [1] has
> already been merged.
> 
> Quoting from the original series, the first part has already made
> Xen aware of new device tree node which means updating the dt_host
> with overlay node information, and in this series, the goal is to
> map IRQ and IOMMU during runtime, where we will do the actual IOMMU
> and IRQ mapping to a running domain and will call unmap_mmio_regions()
> to remove the mapping.
> 
> Also, documentation of the "dynamic node programming using overlay dtbo"
> feature is added.
> 
> Patch 1 is a fix of [1] which is noticed during my local test, details
> please see the commit message.
> 
> Gitlab CI for this series can be found in [2].
> 
> [1] https://lore.kernel.org/xen-devel/20230906011631.30310-1-vikram.garhwal@amd.com/
> [2] https://gitlab.com/xen-project/people/henryw/xen/-/pipelines/1265297506
> 
> Henry Wang (1):
>   xen/commom/dt-overlay: Fix missing lock when remove the device
> 
> Vikram Garhwal (14):
>   xen/arm/gic: Enable interrupt assignment to running VM
>   xen/arm: Always enable IOMMU
>   tools/libs/light: Always enable IOMMU
>   tools/libs/light: Increase nr_spi to 160
>   rangeset: Move struct range and struct rangeset to headerfile
>   xen/overlay: Enable device tree overlay assignment to running domains
>   tools: Add domain_id and expert mode for overlay operations
>   tools/libs/light: Modify dtbo to domU linux dtbo format
>   tools/xl: Share overlay with domU
>   tools/helpers: Add get_overlay
>   get_overlay: remove domU overlay
>   xl/overlay: add remove operation to xenstore
>   add a domU script to fetch overlays and applying them to linux
>   docs: add device tree overlay documentation

For all the replies I sent, Vikram's addresses - Xilinx or AMD - bounced.
What's the value of Cc-ing dead addresses?

Jan

