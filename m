Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 130A2965C7A
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 11:13:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786292.1195864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjxgu-0007fD-EG; Fri, 30 Aug 2024 09:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786292.1195864; Fri, 30 Aug 2024 09:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjxgu-0007cw-Bd; Fri, 30 Aug 2024 09:13:12 +0000
Received: by outflank-mailman (input) for mailman id 786292;
 Fri, 30 Aug 2024 09:13:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q2fe=P5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjxgs-0007cJ-QH
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 09:13:10 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13b0363f-66b0-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 11:13:10 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f4f8742138so17365711fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 02:13:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c74184sm1783644a12.32.2024.08.30.02.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 02:13:09 -0700 (PDT)
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
X-Inumbo-ID: 13b0363f-66b0-11ef-a0b1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725009190; x=1725613990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4VfOdxQlpk+nPeowB6qgdL8IIZ32TUp2YJ0/WXOo4m0=;
        b=Ek2edgMr3ltEfCjwHcuWKgJr7P9TqVAwvkpQsj9svwPCmufNxzp2iP4PN5HZ7BcRfr
         CIqqoy2XSboRy3ILyDvbbp01FB9dOZ5rc6I0mwbVlYSYMhZ5alXFR/heqbdMbgawAv83
         EO9i/xhjmErbKm3i5gDZx8T5whoPmZDIQFtjTvBN08oSJkSOiYWt3k95/haTX/qKZ+gR
         50F0VGDFJxyRnvIIaU/TxQ6URkhRh4RbejcA6FnFAOEVBgiUpv26FZKlPX1xLd6RA+g0
         0X4i7j+ZgadulLUk++5+8POvGjUC2bb1EnGysle1FuiME0Dp2UDQNr+fx5sit6drj43e
         ayLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725009190; x=1725613990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VfOdxQlpk+nPeowB6qgdL8IIZ32TUp2YJ0/WXOo4m0=;
        b=SqkGOzWVwNktKncnaCWONwPNaBBL9gPfTC+l9lEEgg3uvQE0XyEeXWn9XWIjLZ+4Kt
         KIMJyXfi2QAY7bx01PG1y3iWPHSlq/1x3Wn+mpZJW+hz474sWNACu94Ke2gKCAndvuCY
         OUo9MXpHU5YQBGj8BDBmlQbKd8cdh8kTfoX/d4YuQj7XhSoBlJ7ljRmSn4kR9cKCTCLh
         Dw+GFJBKxz65TbEfpedd6OLvZQKGWSmVQCzxRwGRW3gZiehbF8Du3wWkafzV+MDYHETq
         Li+ewvNg6fVd6esGS/N2O5zXBnlH45/Cx202D6MaBMbAAOQutpw5amah0MaEz8afhJhd
         E7bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlgypCjEhBxsq1Yez8ZmRMB2s76D+RRWb1w8TZjc49mSuTh3mcsFlcLdPkdxuwPahipixukKaJTD0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7QpWRXwaylyT5vHX3QNPMqdEOl8I6o9oKUMnv2FvruuCazkBQ
	lKbfCeid6hY6syH0NgpHrBkOmLnn6xhjLu1NkdgCKc8lrStgPC51biXBJC0CGg==
X-Google-Smtp-Source: AGHT+IEQJu/wD/PSmszB1acXotfZMfRC9JQ9I7aOn/MAdegZSwVdV1c1P8FoLdvIUG73dnCBJ3Pe9A==
X-Received: by 2002:a2e:a589:0:b0:2f5:abe:b6bd with SMTP id 38308e7fff4ca-2f6108a7ad5mr39152521fa.42.1725009189596;
        Fri, 30 Aug 2024 02:13:09 -0700 (PDT)
Message-ID: <c94074c4-863a-4c26-b4da-e02c19703059@suse.com>
Date: Fri, 30 Aug 2024 11:13:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen: make VMAP support in MMU system only
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Penny Zheng <penny.zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Chen <wei.chen@arm.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240830090821.23105-1-ayan.kumar.halder@amd.com>
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
In-Reply-To: <20240830090821.23105-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.08.2024 11:08, Ayan Kumar Halder wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> Introduce CONFIG_HAS_VMAP which is selected by the architectures that
> use MMU. vm_init() does not do anything if CONFIG_HAS_VMAP is not
> enabled.
> 
> HAS_VMAP is widely used in ALTERNATIVE feature to remap a range of
> memory with new memory attributes. Since this is highly dependent on
> virtual address translation, we choose to make HAS_VMAP selected by
> MMU. And ALTERNATIVE depends on HAS_VMAP.
> 
> At the moment, the users of HARDEN_BRANCH_PREDICTOR requires to use the
> vmap() to update the exceptions vectors. While it might be possible to
> rework the code, it is believed that speculative attackes would be
> difficult to exploit on non-MMU because the software is tightly
> controlled. So for now make HARDEN_BRANCH_PREDICTOR to depend on the
> MMU.
> 
> Also took the opportunity to remove "#ifdef VMAP_VIRT_START .. endif"
> from vmap.c. Instead vmap.c is compiled when HAS_VMAP is enabled. Thus,
> HAS_VMAP is now enabled from x86, ppc and riscv architectures as all of
> them use MMU and has VMAP_VIRT_START defined.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



