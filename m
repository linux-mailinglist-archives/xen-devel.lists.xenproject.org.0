Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9468198C1EA
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 17:45:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808306.1220209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svf3S-00018U-2v; Tue, 01 Oct 2024 15:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808306.1220209; Tue, 01 Oct 2024 15:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svf3R-00015v-Uu; Tue, 01 Oct 2024 15:44:49 +0000
Received: by outflank-mailman (input) for mailman id 808306;
 Tue, 01 Oct 2024 15:44:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svf3Q-00015p-Lc
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 15:44:48 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1673cc4b-800c-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 17:44:47 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c89f3e8a74so2554247a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 08:44:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c882c7d23asm6251050a12.32.2024.10.01.08.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 08:44:46 -0700 (PDT)
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
X-Inumbo-ID: 1673cc4b-800c-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727797487; x=1728402287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tnmCKXbU4lxxNYvMon/HLz6AQJ1irS12uZOKgrfmjwI=;
        b=OAI34R3jGO+rkVwVKn8Z8xFOcRvG5O+jR9zES1IAVvnP7kT9/ZQMJ5f24ljT7HkLLm
         0WDoLC0bt2gOf7axX87lvB3PUMDFaeAAFtCOvWZfGFMrvu4b1em9/+aIZZvnou5S21+N
         Ny8OCDlzp8/mrZuRHPl7bH0y0pB0HKptgTH8FV83gJjbenU9EsUH+12IZ0ww0jTxpvst
         5gnwqNq/NtZ+j2zdSBWlnLSXNpLDYDkBqz2iap4bNW2cN4+NShp6luhX0R9C7/lAGIz+
         YJJHxwKPgM78rHEye6+oyBBfwNDefB5sdZ7zt39a1+lOyTorbEWLaI/hLVFIOssDhbh4
         QP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727797487; x=1728402287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnmCKXbU4lxxNYvMon/HLz6AQJ1irS12uZOKgrfmjwI=;
        b=uOm0FwF4CXGVmGf+P2ZlD6h/ULpSsVVp5Ran28bRcPn6styavwCLwzTcIwNqC2LI+4
         tjwl5xdRMy0sjc4q+Cz/mWSmWPpZ27ROKcAjXYYbVS0/7tTOu3mVFnYzL4TkWla+o6dl
         y+BApMnNKbx1on+6T8mRzfczpF3daN7J1JaaeFVonK9bVK4OjYTxp6zcTlzb9wtyzqe9
         xg6syVJ70nlgDylH/BrWT40qcGjbrOwkgjJ5U8whAxP4bVaE/x6uQDO96FaXJ3UzaJL+
         KQnWPP/AeQHKKqP64M+eTc4X1TZQFDx/I2CbJWQzjKhZurMq9FyaDlpm82Hl1q9pvqzP
         ltTA==
X-Forwarded-Encrypted: i=1; AJvYcCVJTVpy4/EDB4ChUnTE0OVaHmtegG2A5QhbtcO7N8VQjsUZUXF/mVrHYIVUhMD6IAm8b19fYM5XKZY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFNE1cb77cbb23o5DoiwczdlwRTcwECgNKRitx6jxvnTYXixFd
	8glAD+eToWvdp7LmZ0FPOPwSvoK771HPnHHRuJSdjf493c/Fa+hVPIpj0EuU7g==
X-Google-Smtp-Source: AGHT+IE67JLx/MlFiHeNIrB+OK6iNr0pI3M2NFd/ODRtulDhfRAmixvxEb0q+7GXFtpkTuaJK2dlWg==
X-Received: by 2002:a05:6402:1ec5:b0:5c8:aecf:8e93 with SMTP id 4fb4d7f45d1cf-5c8aecf9a9cmr1181738a12.0.1727797487184;
        Tue, 01 Oct 2024 08:44:47 -0700 (PDT)
Message-ID: <c5b75ca4-7fe2-4919-a9b0-0bf56947a247@suse.com>
Date: Tue, 1 Oct 2024 17:44:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/riscv: switch LINK_TO_LOAD() to
 virt_to_maddr()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1727708665.git.oleksii.kurochko@gmail.com>
 <9a462c58f3af0ff5e5d312777cd1552b2a5a930c.1727708665.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <9a462c58f3af0ff5e5d312777cd1552b2a5a930c.1727708665.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2024 17:08, Oleksii Kurochko wrote:
> Except for switching LINK_TO_LOAD() to virt_to_maddr(),
> LINK_TO_LOAD() is dropped, as virt_to_maddr() covers all
> the cases where LINK_TO_LOAD() is used.

Why "Except for ..."? I'm afraid I can'rt make sense of this.

> @@ -225,7 +224,7 @@ void __init setup_fixmap_mappings(void)
>  
>      BUG_ON(pte_is_valid(*pte));
>  
> -    tmp = paddr_to_pte(LINK_TO_LOAD((unsigned long)&xen_fixmap), PTE_TABLE);
> +    tmp = paddr_to_pte(virt_to_maddr(&xen_fixmap), PTE_TABLE);

Just like you don't open-code a cast here, ...

> @@ -312,7 +311,7 @@ void __init remove_identity_mapping(void)
>      pte_t *pgtbl;
>      unsigned int index, xen_index;
>      unsigned long ident_start =
> -        LINK_TO_LOAD(turn_on_mmu) & XEN_PT_LEVEL_MAP_MASK(0);
> +        virt_to_maddr((unsigned long)turn_on_mmu) & XEN_PT_LEVEL_MAP_MASK(0);

... you shouldn't do so here. The virt_to_maddr() wrapper macro does so already.

Jan

