Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B158F9855A5
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 10:40:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803565.1214222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNZ1-0003vd-1o; Wed, 25 Sep 2024 08:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803565.1214222; Wed, 25 Sep 2024 08:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNZ0-0003tU-Tt; Wed, 25 Sep 2024 08:39:58 +0000
Received: by outflank-mailman (input) for mailman id 803565;
 Wed, 25 Sep 2024 08:39:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stNYz-0003tM-NN
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 08:39:57 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be2e0650-7b19-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 10:39:56 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d64b27c45so1159539966b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 01:39:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f65fe3sm186050866b.96.2024.09.25.01.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 01:39:56 -0700 (PDT)
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
X-Inumbo-ID: be2e0650-7b19-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727253596; x=1727858396; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/jSCwVs+d3s83abKDVM9bIb7HBLj2nWDcW5qrIXP/6o=;
        b=dKWLIBSnCTsSXDCi/i+okY5SFMLomrlPaXaEUsT0HFEYPYzPyfjHjxiRv87qmDTfNS
         +E6HzyBfH2MimeW63xjywuExRwxAzOKtWdWFcEj82wAvp6FBxWO/kEaTZ5gVTBJGaFPH
         uRBR5XZF4R0znz2VHxYEenUum9tltvo71SzG5V4nk8kYAGweDtgNJVhb750rvMgziW9D
         zEOMWfuBXFOE7EMEQTFidowBFP6m2yQWciJm4fuHBLiPqc+azW1wSeKPpcMIoJjBmbjL
         oPjPvkXsnBhoROMOYnU1EEi9Fu7szBok+mDCcmZuOleSV2J60C+uUmpNEmyr632EPvuS
         3ZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727253596; x=1727858396;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jSCwVs+d3s83abKDVM9bIb7HBLj2nWDcW5qrIXP/6o=;
        b=tJTf64LPMKACqm7nFmkFpTXYs7/d53IrbUVFZgBBQAKraZy/zg7fKb0Of1nZPzZb/g
         wCWSUXSCy89PjXEBqzhmlcyzyGVdPv0uNvAUvCZNgKDrP9KXAh3CM006wuZRLHtCV/QP
         L3GSFWtgRx27OuoQxTavwiizzr82YRJ54Y8ZB+55tIIKR5KuiXkPDGXicvkfIKyDCNFo
         lmiY7iYhW+BZ/MYKmgPrz4GOoMpkv/5k9wTt4T3lDTRoyolXPJ1pjHa3C6rsTjqaOPef
         OdMJNYtpH5AFya/1ocmGlbL9PBqa83ZdrAV0T8N7x+Nhh5sv0viJwlfftf/cmzD7SDdH
         j3Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXvxU8TWG/2j3CGV9Gv+fofLfpCHQPWDN3s1ArU2yrM+dnTrd6mwCelxhrEPZZ3rh3FxNp79EGB7U8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/SPODhZMvBwT9R9QgHBCBdbED5QLDRRLZE76O0WvV6Da/RVVw
	tSkcrrtwQf0WORThVV/oyvFCOS+1qv3SA5/ccy2ALNaNTRq9njj4orHMtB1o7Q==
X-Google-Smtp-Source: AGHT+IGkHfIjwVB3L8hc/ev10v1fqyYRYmzx/4ZwzgiAQIasMNOMGJ7ZxD362c/dRvaLEDD27OVDKw==
X-Received: by 2002:a17:907:f78c:b0:a8d:5472:b56c with SMTP id a640c23a62f3a-a93a035d7ebmr172957966b.22.1727253596295;
        Wed, 25 Sep 2024 01:39:56 -0700 (PDT)
Message-ID: <6110c7ad-6f05-4fe2-a599-2d99b09f686b@suse.com>
Date: Wed, 25 Sep 2024 10:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] xen/common: move device initialization code to
 common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1727193766.git.oleksii.kurochko@gmail.com>
 <6d85c4336b473cfaf41bb7a568c9629e01d80faf.1727193766.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6d85c4336b473cfaf41bb7a568c9629e01d80faf.1727193766.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2024 18:42, Oleksii Kurochko wrote:
> Remove the device initialization code from `xen/arch/arm/device.c`
> and move it to the common code to avoid duplication and make it accessible
> for both ARM and other architectures.
> device_get_class(), device_init(), _sdevice[] and _edevice[] are wrapped by
> "#ifdef CONFIG_HAS_DEVICE_TREE" for the case if an arch doesn't support
> device tree.
> 
> Remove unnecessary inclusions of <asm/device.h> and <xen/init.h> from
> `xen/arch/arm/device.c` as no code in the file relies on these headers.
> Fix the inclusion order by moving <asm/setup.h> after <xen/*> headers to
> resolve a compilation error:
>    ./include/public/xen.h:968:35: error: unknown type name 'uint64_t'
>     968 | __DEFINE_XEN_GUEST_HANDLE(uint64, uint64_t);
>         |                                   ^~~~~~~~
>    ./include/public/arch-arm.h:191:21: note: in definition of macro '___DEFINE_XEN_GUEST_HANDLE'
>    191 |     typedef union { type *p; uint64_aligned_t q; }              \
>        |                     ^~~~
>    ./include/public/xen.h:968:1: note: in expansion of macro '__DEFINE_XEN_GUEST_HANDLE'
>    968 | __DEFINE_XEN_GUEST_HANDLE(uint64, uint64_t);
> because <asm/setup.h> includes <public/version.h>, which in turn includes
> "xen.h", which requires <xen/types.h> to be processed correctly.
> Additionally, add <xen/device_tree.h> to `device.c` as functions from this
> header are used within the file.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



