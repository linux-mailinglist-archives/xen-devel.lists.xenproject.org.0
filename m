Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C7BADA988
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 09:36:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016792.1393722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR4Ne-0000jJ-GR; Mon, 16 Jun 2025 07:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016792.1393722; Mon, 16 Jun 2025 07:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR4Ne-0000go-DH; Mon, 16 Jun 2025 07:35:46 +0000
Received: by outflank-mailman (input) for mailman id 1016792;
 Mon, 16 Jun 2025 07:35:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uR4Nd-0000gi-K7
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 07:35:45 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 828f4775-4a84-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 09:35:43 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-60780d74bbaso7514267a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 00:35:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adfbfe03b0csm295507666b.121.2025.06.16.00.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 00:35:35 -0700 (PDT)
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
X-Inumbo-ID: 828f4775-4a84-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750059343; x=1750664143; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KgpIFXhOjQrAaVZ03e/X9OuEuTN4xN5zksV4vQsJo/g=;
        b=JyNLIiH/MM9S5WeTaCJyTL4vFjdsqn+E181gG+dz0/KkL1ELhy9aCDegdAyMZJ2ZSh
         1bgtwM+vd7rfycnKIGHf8OR7AQW76ZWMDPA3dvKdzMuWmPsyR0h3GDrRPy495pC8WFSL
         chVVJBevJ0hYVSo4dsKTY97UgYvXSDIJKesPNKYaZvNnG7iQVMdpEqa+nYIvbzRq/Kca
         biX6ee7QjuheAwnub2iZ1J+CGCJ671Jj/3H7Dw3iwNlZuZmO+Bl/px0Ho3a4t4thF9aZ
         eTQlr5ikxc8cWtpFItQEF0FgR+w48fW/V9k06Bkvw2s4nmmz7Ik+wvYkT+tOf8+kJjqd
         Nywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059343; x=1750664143;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgpIFXhOjQrAaVZ03e/X9OuEuTN4xN5zksV4vQsJo/g=;
        b=M1gX1XRM3mKiHISS3sI5UA0gRRK3IdfTwQLwHrHK9PwadbXY6etUiT+WweHNZcXsIu
         1U4MIFr06Gg9buQuGdgnD5f29vDZ2B4qnGL8TMU7J0QMexpwuqfSl4YoN4SJtvn17Q3w
         6IOWNzpzL00ejPu/xFeZKfGRqnHMSSqjA0NIvc1++XE5F4lCZJ+A8hcZt4XzAQTRP8Cg
         rkl7vBzcaALT3PmlnOHsrAC1JFkPuTUQPg0KgVoXy+IgOiyeawSuqVWuo+xMK4ryt3YK
         am2Zf9aYhVti/I977VGhugUuDcqQj8TvXixgCi25rRrC05hE2is50/6PZapIwjHzQH9v
         mu3w==
X-Forwarded-Encrypted: i=1; AJvYcCVi//RgpDibZbi/RLXitCzEzr1awFQw8A7699KEJZ2vgydmAEmWwtg7i5clUJNJg12gOT6GCrEvA98=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQHDPohJySVLhmIJJQjc0dIY8250siyQeoTgnb14yyqENFCCV6
	ruGTQVqCN1S+oOBVHH9poIAo9wft9t6/x6ziXdDD/XS7/sTXTA1Qt7afDk9lcwLPYg==
X-Gm-Gg: ASbGncu00SlFrllZ5A81Ln2P+fhhOPx04N8TwHj0XYCyJiJfKYNDq5RpmrThDSWH5ax
	bx5KNKVLOlwHVjx5Vi7y8HMBklwcBTZ+wI7kK4Jd2J+EIqwDFAZvpCgzHWC+bs7+V/PC6aS4qjX
	zxIJ2+YbipoOoKU4leQd/kCI7k9E6+LrxD0Q4Tbx+nezdHOb0eTUKhJXsjnJcBe1TNdbWn0OKlw
	tyzaQ6QKxDHG/cXGVErKrC8FSiNbhR7iJYAUZjarmr482Qz6mU0SWOE1n1DIlHuq/pOu++I8A/V
	eMXd4JoiVjQpcgL5dgLJiNgyfI1e7k/0e28/qKiHpKXHyN+3VVEGG8DeFQFGBReLUSJ294luueI
	p/VH0L6yCINMwrcJwGjz2m1e4R2c824ZvAl7GiH5MEVmDb84=
X-Google-Smtp-Source: AGHT+IFVVX4/32PLwF5Tme9MJZUF562d94YZCxXWEa443tlDT5ZW9/6ddlsgZxYa/kKB60brN806AQ==
X-Received: by 2002:a17:907:3d04:b0:acb:37ae:619c with SMTP id a640c23a62f3a-adf9e1d9404mr801302566b.15.1750059335649;
        Mon, 16 Jun 2025 00:35:35 -0700 (PDT)
Message-ID: <51d57968-0060-4c53-9c7e-3cabd84c0a4a@suse.com>
Date: Mon, 16 Jun 2025 09:35:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix P2M root page tables invalidation
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250616065648.17517-1-michal.orzel@amd.com>
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
In-Reply-To: <20250616065648.17517-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.06.2025 08:56, Michal Orzel wrote:
> Fix the condition part of the for loop in p2m_invalidate_root() that
> uses P2M_ROOT_LEVEL instead of P2M_ROOT_PAGES. The goal here is to
> invalidate all root page tables (that can be concatenated), so the loop
> must iterate through all these pages. Root level can be 0 or 1, whereas
> there can be 1,2,8,16 root pages. The issue may lead to some pages
> not being invalidated and therefore the guest access won't be trapped.
> We use it to track pages accessed by guest for set/way emulation provided
> no IOMMU, IOMMU not enabled for the domain or P2M not shared with IOMMU.

IOW no security concerns?

> Fixes: 2148a125b73b ("xen/arm: Track page accessed between batch of Set/Way operations")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Credit Oleksii with a Reported-by?

Jan

