Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5655087BEE9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 15:31:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693295.1081200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkm6j-0004tE-02; Thu, 14 Mar 2024 14:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693295.1081200; Thu, 14 Mar 2024 14:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkm6i-0004qs-Td; Thu, 14 Mar 2024 14:30:56 +0000
Received: by outflank-mailman (input) for mailman id 693295;
 Thu, 14 Mar 2024 14:30:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkm6h-0004qj-63
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 14:30:55 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76222929-e20f-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 15:30:53 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-568a42133d8so648648a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 07:30:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a4-20020a170906368400b00a44936527b5sm761937ejc.99.2024.03.14.07.30.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 07:30:52 -0700 (PDT)
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
X-Inumbo-ID: 76222929-e20f-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710426652; x=1711031452; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCT1wZkB8l4x4i4dYUX7Zb52JDKuaiCmBD63nWQOknw=;
        b=PnSVz6ZL1Zq+FwqtOu6oV4YBJfGfyzWz5cm/Bgo1O5++Z9xrbe9JFRXavMXpzth4nD
         MySAnU5RSiz4A0NIJMLSlTTRELi97c8bfmVks36jQ/Ctr1vT1IZoEm2vBj+YVWn0eHQJ
         nkEpljuuWuOf+kYzPxopkX8kBfkNXVbZNpbKoOtLspLJ8DmAtNDy1almpSjuXdzHEAvc
         HA3ePc8PpgZrWkPyabigp/yUiFgl1jBSIZBxjFQaGg9w2yxsa/cKgfVlgIYEVgkdqdw3
         Sj2SpszCxowKG7Ng+6sRaPXE3n4FwshZG1kUFCl2mIn5tDLlQFxEpaP0jil+zTm8Diud
         CtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426652; x=1711031452;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DCT1wZkB8l4x4i4dYUX7Zb52JDKuaiCmBD63nWQOknw=;
        b=Kgj/zyK6hrZuI87TQIaMcRd9gGp+f6HNe8I49+JPFaSmvuaD7ZC+9jRWtztGE519mX
         R7eYlCOqrXsOjLDQhE3I1pye6les9uVr2ZtPxF3P+O0/aHvslOCreAQII8O4OsB5X6x6
         yHGCkMtdzPqRoi8q+LEm4KusUTHzkyhEyq8g/3llG2v3xfF+7p8Os3W5ikDv4aoFfGB2
         WmwJccLk4jKt+7amMosC8zse8vS51wqTlGi/+kyJxSMn3cSr6zstG9ASjLj9Zog6nNqk
         CNDFikhk0lzrb9lxOb5WShH7HP4Nysrz4/NqGhp97VSyg1K1qz8bV9/KlVdoiu/1Xq2V
         ErRw==
X-Forwarded-Encrypted: i=1; AJvYcCVUUuma5gPMk7Dfqz8Q2lQibFif5m/zMCbwpaBPxHaqhdt3M3404CcuHbqj5oEr5d3VixuHgbHxl5g98KzX+bp3yGRC9/rATmjCeDjdUT4=
X-Gm-Message-State: AOJu0Yxty/hzZbVIGvHj5Rg/sR9sq9Iki0hfNJSubWPD6v4lCE6coFok
	xFgoHsawtwI1bGLdOxQr9V+vzPUpNBroeVdxFhRNwXR6idxz/8cnxMCWys1Tvw==
X-Google-Smtp-Source: AGHT+IGf65dEOO2zzR5oTanXDAp4VQjbwxFowMHlsGcYKPQEd0EgRlMFe2Vyxh+f+37ca8Zax1U0kw==
X-Received: by 2002:a17:906:40ca:b0:a45:2e21:c776 with SMTP id a10-20020a17090640ca00b00a452e21c776mr1335826ejk.3.1710426652575;
        Thu, 14 Mar 2024 07:30:52 -0700 (PDT)
Message-ID: <ba0552cc-10eb-460d-89a1-ffc43fe75542@suse.com>
Date: Thu, 14 Mar 2024 15:30:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] xen: Swap find_first_set_bit() for ffsl() - 1
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
 <20240313172716.2325427-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240313172716.2325427-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 18:27, Andrew Cooper wrote:
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -641,7 +641,7 @@ struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
>      if ( contig_mask )
>      {
>          /* See pt-contig-markers.h for a description of the marker scheme. */
> -        unsigned int i, shift = find_first_set_bit(contig_mask);
> +        unsigned int i, shift = ffsl(contig_mask) - 1;

The need for subtracting 1 is why personally I dislike ffs() / ffsl() (and
why I think find_first_set_bit() and __ffs() (but no __ffsl()) were
introduced).

But what I first of all would like to have clarification on is what your
(perhaps just abstract at this point) plans are wrt ffz() / ffzl().
Potential side-by-side uses would be odd now, and would continue to be odd
if the difference in bit labeling was retained. Since we're switching to
a consolidated set of basic helpers, such an anomaly would better not
survive imo.

Jan

