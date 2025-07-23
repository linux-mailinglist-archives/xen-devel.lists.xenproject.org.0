Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B66A1B0EA60
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 08:12:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053249.1421974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueShj-0007Ds-S1; Wed, 23 Jul 2025 06:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053249.1421974; Wed, 23 Jul 2025 06:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueShj-0007Bl-Od; Wed, 23 Jul 2025 06:11:51 +0000
Received: by outflank-mailman (input) for mailman id 1053249;
 Wed, 23 Jul 2025 06:11:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueShj-0007Bf-7I
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 06:11:51 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e96022c5-678b-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 08:11:46 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so3320973f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 23:11:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2ff89341sm8053632a12.52.2025.07.22.23.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 23:11:45 -0700 (PDT)
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
X-Inumbo-ID: e96022c5-678b-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753251106; x=1753855906; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iuZoJYNEzyWfHBs4wAhBuGarmpDLWjEeFp5Fab4C3PA=;
        b=KHL+SOIte3sbWUteDppsMMAOvUbfJXrs4lzukElDycDU7Fo523rapL4lYVjpau84r4
         2tX20iP3Um1HldEFzqdaNtjb4GZg+VvmuzicWVj/7LkpFWoCrdUXYfRsagBRcpKLlDu3
         TB+plO2JQZouo4ppXsn0nymSmFNoVi1CZPuJ9RBvKkv7LxbQRntwqjxMAfVDenhZn42M
         SOin8pymGI0myxeAyStNc/BF8X7z+DrOZhJZ7qKMNW58v05A3rPYW/M5/ZC+n9QHpIr8
         TKmJRGeWX1f2GmiEyx5CWtc8UV218gSVTHAitKyQwba2u+gO52I5+2gkEQxjjMQ4rH6v
         YXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753251106; x=1753855906;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuZoJYNEzyWfHBs4wAhBuGarmpDLWjEeFp5Fab4C3PA=;
        b=J9uGkipR8wul2w1gdEdfodfmPwg/mZvM5N8FA5ACd63uH5WaVon2dFDf+J3UWYJK09
         ksxaq5uusY7n7Epl2wcxkcEqTxQtIUjkdZQMT6GmaZfK79Wbp/pTi9rdwt1n70cNctcG
         gj/8XW1l1o9G0t/n7MEBHhMYJfuW5zTTpO5rQ6MddWfVXOPw1jrqcXSOOUKSAW4xr6GX
         hd4B6UtK3jd5cpz5FNzAWIArinXt3xpoNLeffxz99Lsw3LNsJvrHYLb92TAIAJkIMuiT
         1L/qi9evrd1nMFEbhJwu06BI9W4nQhlGXw0rV/vJ3hoZaht1rnq9NHlY9HHLOf/zcP9S
         7E2g==
X-Forwarded-Encrypted: i=1; AJvYcCVaG1r4OlFmYglJy4UYQZC648yR/E4jvF7qmZacBilMcEgpZ2vI7xc8iequTdteGE47sHmetQkeoxc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweGTpDxdYT4bHFAuqXjLnOi6GdgRQhISlVYAJNipTVdNTxkyy6
	whcEisKBpHYEv6Y7vDEyAAQ2U9zjRyRyppIQJ9FdNkssjOtMV8gypPer3SnoYWGsNg==
X-Gm-Gg: ASbGncvSa4MeI+nTxta9dqI+Zfx2DFXw8kvHXxz78XpmBvb+mwXAS86wZx3k0BgDSps
	R2VTc/oFq5W1G/P/1W+AgGN/FU/le2AEDC/xHyo4sYnonszPrw8TjHFjrQhJcLZpsI7STKk5sxg
	ooyBG0K26j/jMA4Uqujt9W6/9E5zFFsZIBvz0cR4uqNoVjNM99aE+wQJ3eEHSlA0Lk8PX6tPz8v
	XfUQbVQLehf5FrSoLyw8LTC/4uBaFNqICXHs0npfiE59KCRqc29KB3Eud1p6Agry5uHSQnSr2AG
	ixi/erpiVYI5Cl78KueZ71lziN10fLNeueR5AnTIWy6HATqWDonXgwpn+Qie19brMuMdAGsJrv4
	6CiSHblpGAiIlfYZVZmW46A41XAPlsY5ZSepzaJbysFCFZcDJhQisyOBAz0hCX1UqjjAWbS4iXD
	XHjwWDgPk=
X-Google-Smtp-Source: AGHT+IHYLYdafNBfDvS1QDCBe41MTEAJy1sDPvGB8RFyaCsrsEiEpzw6yNijFyAuRjOMuDib/NwunA==
X-Received: by 2002:a05:6000:420e:b0:3b6:d6c:a740 with SMTP id ffacd0b85a97d-3b768f12c2fmr1340989f8f.54.1753251105671;
        Tue, 22 Jul 2025 23:11:45 -0700 (PDT)
Message-ID: <d6b192be-6362-46c2-a7f8-4d461b313e7b@suse.com>
Date: Wed, 23 Jul 2025 08:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/arm: fix arm_iommu_map_page after f9f6b22abf1d
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250722225127.81390-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20250722225127.81390-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 00:51, Stewart Hildebrand wrote:
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1274,8 +1274,14 @@ map_grant_ref(
>          }
>  
>          /*
> -         * We're not translated, so we know that dfns and mfns are
> -         * the same things, so the IOMMU entry is always 1-to-1.
> +         * Grant mappings can be used for DMA requests. The dev_bus_addr
> +         * returned by the hypercall is the MFN (not the GFN). For
> +         * device protected by an IOMMU, Xen needs to add a 1:1 mapping
> +         * in the domain p2m to allow DMA request to work. This is only
> +         * valid when the domain is directed mapped.

While true for Arm, the concept of "direct mapped" doesn't really exist on
x86 (and only the PV case could make it here, which is sufficiently
different anyway). If you really think the comment here needs adjustment,
please make sure it remains correct for all architectures.

Jan

> +         * We're not translated, so we know that dfns and mfns are the
> +         * same things, so the IOMMU entry is always 1-to-1.
>           */
>          if ( !(op->flags & GNTMAP_readonly) && node.cnt.wr == 1 )
>              kind = IOMMUF_readable | IOMMUF_writable;

