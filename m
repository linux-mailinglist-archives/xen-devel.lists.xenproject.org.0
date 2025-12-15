Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0A2CBDD57
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 13:36:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186961.1508386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV7oW-0003GW-Fk; Mon, 15 Dec 2025 12:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186961.1508386; Mon, 15 Dec 2025 12:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV7oW-0003Db-D7; Mon, 15 Dec 2025 12:36:32 +0000
Received: by outflank-mailman (input) for mailman id 1186961;
 Mon, 15 Dec 2025 12:36:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV7oU-0003DV-E9
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 12:36:30 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acfc827d-d9b2-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 13:36:28 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso34223905e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 04:36:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f74b188sm181728595e9.1.2025.12.15.04.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 04:36:26 -0800 (PST)
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
X-Inumbo-ID: acfc827d-d9b2-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765802187; x=1766406987; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B/oOzBNP94ATPgqbCzP8hqLZxp+F1vd9DS5/mPewKHY=;
        b=aHoQDs3KogjATDQEbQsi5zDMyXtvs0ooGkUDBmFOrN78NSfm1yKkrD+cr6NEAVoS/X
         s9XdY5SERELXpVs9NPpg9TPwEbs8+WkHuMYz22Cuj7+i1pyScCwhE+c1uG+w8wAWN3M8
         mlVW6hU5bCRRlAn4ClNlqAfMuZW6strdADROH0v3aUtDw1YT237sCVzMYuSnUQFtUse0
         QvkqLyAyGg8vjWM4DuH7IUoaGEE1+eaLOfG/d8ro7pFm5elaOrwj7VJH5r2CidRTia9u
         Ka9iec99vVLgB7EjiCn/Y3qUTV+llMy4uAeH0VYD1QXfF2DpJF4FbORo2gEXxIL+RxIn
         7uyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765802187; x=1766406987;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/oOzBNP94ATPgqbCzP8hqLZxp+F1vd9DS5/mPewKHY=;
        b=dGv7NqteYut5+O+tEo9794bI2jaVOPyD/5z8/GgnKM35u8iwuyLzOPMsso+Ewt41ET
         yuu2eV8+yZ/9eO43nLlDgDtLMh0uqfCl1JRpZ5dIuxxqfoJIWvSe/mWw/cDrDj0eRdrC
         loX/Tf5m7jLDPdhx3cbYitNGJrlavQW3gXk7+xRjDpr7zDNM40V8qd2LQSUQXo3E0lco
         pF9hvIDeaJCbPQeoqfIhfL9H+BlZ0pteLXVCLWqi/hpGRnRW4QuIzraDX21+Sn9ChFIm
         iUQdglaIZBMXGp7L8uGKzI2dR7jeEtX/2Uj1jP5LAoU11wYHi5dowaKSL/vD74XpHyAA
         hxHg==
X-Forwarded-Encrypted: i=1; AJvYcCUtcUQVjXD+qf5Vao9tOXI1vu18FISa7reKLl1kbfRrsAGyf6QKv2B3/Z521ugv0JKWlYCaKOlodk4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUyyhtrGSioapK2C6fVEfkrIhrZL5eSqF0KyJrS1+ZE9VMQbTp
	245aZRxcMYQaAJ6jNyNRvVGI/wLxIPul5yygLbXaPpruCJLo2/hL11i7ns7Cng3mEA==
X-Gm-Gg: AY/fxX78wnEOeJK/RTkhyQwmU3Nt2cIe0uzOxm62IcATRCYEL0ZHEzTbUfbTSSeT65s
	1wv9dRfFW3oJfk2R28UTy6tN6hKF/OYTa17vis8EJ+YsNVvfSlR4EJVf6UVHtiZT1Q46/T9Ra2I
	w4bvZP91Fk7iWTpQTV5LTO6YZ1t4kMNTbNCeg1kGDlRrFphXbouSmlfj13rceuDtXLUX1oe+xy3
	37kHTU7ZWxIozF6T3c8K9VyJBHHshYmLzDrXc5OpC1qQnci0nnRIY5STqYSXLlkK4WwemDOM9iI
	Kj3eU7X8AlBgdZrrDnqy/Vg1+y2E5Xx3QqOBHaYP9PI2ZqckstZaYp5gkCi/KKIT6wj4Q4+CmZi
	6Aw9DiplcmAV/rfU+HG3DdqoA6lUJFeYN7uF1jgUiUKOkebCufhAcgU3O1FPzHK5sY6ixr6yXna
	JbWcHvvVlINgwhcMlBUjFjAzZfT8MjttF9yV66gixoFN11XykJivnv6Y3hWVwqzcLBfQ2wEaaVO
	bQ=
X-Google-Smtp-Source: AGHT+IFccOlg+ZJ236QvUjEBB6N6Gg28/1v0FtPJNg4q2WpQpJsc9hgdwNu3THcR75GkCVA+LWvynw==
X-Received: by 2002:a05:600c:6208:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-47a8f2c9fa3mr115450485e9.16.1765802187320;
        Mon, 15 Dec 2025 04:36:27 -0800 (PST)
Message-ID: <2e9b0bb4-ca33-4996-9804-5859310d4ae6@suse.com>
Date: Mon, 15 Dec 2025 13:36:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/24] xen/domctl: wrap pci-subset iommu-related domctl
 op with CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
 <20251212040209.1970553-16-Penny.Zheng@amd.com>
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
In-Reply-To: <20251212040209.1970553-16-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2025 05:02, Penny Zheng wrote:
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -333,9 +333,11 @@ struct iommu_ops {
>                           uint32_t flag);
>      int (*reassign_device)(struct domain *s, struct domain *t,
>                             uint8_t devfn, device_t *dev);
> +#ifdef CONFIG_MGMT_HYPERCALLS
>  #ifdef CONFIG_HAS_PCI
>      int (*get_device_group_id)(uint16_t seg, uint8_t bus, uint8_t devfn);
>  #endif /* HAS_PCI */
> +#endif /* MGMT_HYPERCALLS */

I remain concerned of the former two hooks staying around for x86, despite
them now being NULL when !MGMT_HYPERCALLS. Imo, to play safe, they will
want to be guarded (transiently) with

#if defined(CONFIG_MGMT_HYPERCALLS) || defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)

Jan

