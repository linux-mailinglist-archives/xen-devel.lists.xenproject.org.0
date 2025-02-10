Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BC6A2E9D8
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:46:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884657.1294407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRJM-0004n3-N8; Mon, 10 Feb 2025 10:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884657.1294407; Mon, 10 Feb 2025 10:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRJM-0004jv-KI; Mon, 10 Feb 2025 10:46:44 +0000
Received: by outflank-mailman (input) for mailman id 884657;
 Mon, 10 Feb 2025 10:46:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thRJL-0004jl-FX
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:46:43 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4df568fe-e79c-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 11:46:38 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5de56ff9851so4311581a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 02:46:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7c4da47f5sm165118966b.70.2025.02.10.02.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 02:46:37 -0800 (PST)
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
X-Inumbo-ID: 4df568fe-e79c-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739184398; x=1739789198; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/3ott46GpvIF19DIYjKo3Ff2jaP2RKRP4ZJv03x4488=;
        b=er5kSrGdfIgehuU+U/nP1MA8yJ05uf+MXgm8rpVDbcIyso3WygNnNNtVpJ4cK/nOxA
         B2wa8tkFyWHyK3WiFe7Dbfq1Qfdxgot7BEmwNWWrIQOgR5FGCHQ2/LP+TrzgihCZbdnH
         97yeQzNHi/FJUR68WQdP/vI0G6QW6TS4i1mRBs+5l0XXcJ0SDED4pfojpiHHR4MJk8uF
         0mzXlIZhNrHbDXOHCo5WQSA2ZAA4e2qfk+0g3W65ADWrwVcnlZX0VErh6dZ8dS+NgcPn
         vUMaV2MtjwLPJ/4wKtUP1u1trQ60/Fhm/NnPZ5+d6rrIrGdC/HgssF7IBRVezf/AzQX0
         PiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184398; x=1739789198;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3ott46GpvIF19DIYjKo3Ff2jaP2RKRP4ZJv03x4488=;
        b=OYuDEdPka8nGQc7FXDkNfJbfi6vw6gomsOllDp+CDtVLWKIeyJCU0eY7V9fD4Ej9Qk
         rYSSvtBB+sXJ/e1OrAyiDEzq09D7bv18L22F/zw2xrcl8NWMBy1/uBYMkPQ8KmzOAOLp
         2kmYXH2beQlxQFJyyAnEO3ZBe/CRcOceuKx9kyjOKiCKmDhOrT43BXSdihKMJZMjcyJX
         vdxLj0UbhRMPulUhDVzVSTB2IFHpJ32OeKidr/4VxqQAWGFEvZRcfwAxnjH4TTLgCjDL
         FJBdrWOEYknAsMdJcruG/e4Dxbz1LBhhhuvcTEF+F4FykkJ4KKbFz9eKfwjU/YCHI8zo
         siCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXwyZyObrfVTFUcfCOz2YNmcbaxIYCnICDea5Tigl0PxOdylcD9GUfCXLHJv30GMy1tQHbGp0/Mv8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrMn1wf+zAxm9uwNAyItflVSjBJAFJmfy/6U6ZsLjhT5bNa9ek
	CskzLpCJFvjDOmKeI5EuN9vmECMCkoVjjMcnfHr9+iZFt1oJPEILyqgMQf/ZOw==
X-Gm-Gg: ASbGncvXq0Xc5T3frkY5QTYw+fr2bZomNKB4ExE4vSUKeJ6Qmjcl9BQZyT+zdx9GGWR
	Iubgabqt7/6cFl6HEJUL0W2edmPscO8SSuifMZoj0IAIM9DR/P6qu+rIFFXZzI8ELZDu7J9R6NG
	DsryCE5xdTroINHTubgkwMEH2mBt2joOOMGrfJglNEUS/Cg3tEoJCIGZ6YeMHwXz9mOWLxfnzcz
	9fniQsSD+XDavWefVUAyxlJFrtqxpvni9j1KPifH5mtmZC5i8TnuTCEADsbV/e4fSoZtANyOnw4
	mGBfOmRPjloC0y3MzIJraHop0PKSl5uGof/Pa1WWHf/x7DYNZkoDOXcAECFZgepwaJKHSgvHFBG
	4
X-Google-Smtp-Source: AGHT+IG0Bdgz5dVexOZHLCSrg2IsrtkaLbWsyD0ZsuCdJRYc0knu5DTRL83xjP6T7n8vTXYLAFs+wg==
X-Received: by 2002:a17:907:6d23:b0:ab7:5fcd:d4de with SMTP id a640c23a62f3a-ab789c50af4mr1383394166b.50.1739184397824;
        Mon, 10 Feb 2025 02:46:37 -0800 (PST)
Message-ID: <f8f72da9-797e-44e5-93c2-cadb9fd1aae4@suse.com>
Date: Mon, 10 Feb 2025 11:46:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/8] iommu/arm: Add iommu_dt_xlate()
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
 <02afc1bce09dd22865c7e2bad6cad9a804fca64b.1739182214.git.mykyta_poturai@epam.com>
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
In-Reply-To: <02afc1bce09dd22865c7e2bad6cad9a804fca64b.1739182214.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.02.2025 11:30, Mykyta Poturai wrote:
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -238,6 +238,14 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>   */
>  int iommu_remove_dt_device(struct dt_device_node *np);
>  
> +/*
> + * Status code indicating that DT device cannot be added to the IOMMU
> + * or removed from it because the IOMMU is disabled or the device is not
> + * connected to it.
> + */
> +
> +#define DT_NO_IOMMU    1

While an improvement, it still isn't clear whose "status code" this is.
The #define is effectively hanging in the air, from all I can tell. And
from it not being a normal error code it is pretty clear that it better
would have only very narrow use.

Also can you please omit an interspersing blank line when the comment
is specifically tied to a definition or declaration?

Jan

