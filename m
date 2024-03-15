Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB9687CE1C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 14:31:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693864.1082484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl7ep-000778-Uf; Fri, 15 Mar 2024 13:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693864.1082484; Fri, 15 Mar 2024 13:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl7ep-00074g-S1; Fri, 15 Mar 2024 13:31:35 +0000
Received: by outflank-mailman (input) for mailman id 693864;
 Fri, 15 Mar 2024 13:31:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rl7ep-00074a-5P
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 13:31:35 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57365d46-e2d0-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 14:31:34 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-568a5114881so1960127a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 06:31:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d10-20020a170907272a00b00a45ff890df0sm1725305ejl.35.2024.03.15.06.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 06:31:33 -0700 (PDT)
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
X-Inumbo-ID: 57365d46-e2d0-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710509493; x=1711114293; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=snZXQnNFl4bDuth7n216ZDoL9SPL+HjiFq4UARJH/S4=;
        b=Sd2YvBg+CQiVvV08/8BLEI2JCIy8jygTYYvoGNkPXUpInGSqiblJjBEK3gyed9Seib
         WQqpZ7aYKDO213SD93l4yzLaaV/58SRF70M1AV7GGKt+LY8XUsd0pEuxODzxU8fmd78T
         gW81ZYhogkZ6ViF9Uafpp/TpuRGd08vPrVwpVZqe/dCvhQ/OTILsQZNhyhQMShr81HwL
         5t/MqgCDPjATsXlBrzD+E/ei+KSuExhj3tKrwYQU/+IasJMdhI+DhMHXSIBr50Ecvr1Z
         +F97pWmQHxEPk/waPFgK3QV0b9w+xmyuYEW1PjPusOuc7c+EAnflyF6fcuqzTGj8MzlU
         3utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710509493; x=1711114293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=snZXQnNFl4bDuth7n216ZDoL9SPL+HjiFq4UARJH/S4=;
        b=HbG7TD1Vm5DCYwtOBIrF5HWzxxlhMXuEP5+uL6FgATP7QJdiHnvWIOyKBi+e3t7DH8
         37x+EdB2AiDlXLXXirNBvVg4+3IQTb3jUlU3c5j7Vf/yvG6gsERRMyDOdbwMOwLyd1Fr
         SBSDyP6IGrHwQSXHqKMzpn3o7G8vJJdLHRhdV56lZYfHBciu8urzqXPKU1tqGOOET/Xi
         UIwlJNlSeDCCoFaMC1bD+Krd0kQDy2nJts9NN6Bcvppl1VLKyCL/7y0TaV2FeV4bRnU8
         Fh96Iej0anFFCV6GQIdkBHGf8UBU3LVDOXX56nA1rCygkBMhLtjJrKgCxEfcCS2oppHZ
         d5HA==
X-Forwarded-Encrypted: i=1; AJvYcCV404UeNhuTYYRO5yTgV57rIlXlyQ/WJilECvGe2l7SXbdeOaQDaMJr6cXbVYybZM1zwyogECXTp/DeyX9bdP6RTwXIv7/vibuVXsc8CA4=
X-Gm-Message-State: AOJu0Yz0NCW8GQQz41VmxKWeH3QNL/REynQ7pfcM+x025FB94RGn92ZI
	0JdQM993b1YmiqVsdjN8nYfQadpYGASNxZgZqMJPoIhB6ohJRbTZ5a1I30EIPQ==
X-Google-Smtp-Source: AGHT+IGHX2sgIvhXOo5aL1yrfBpF8Z7HWMVCnvT30znhvhQDKOvgpa71IOsLA0754gGpjPM/GB8gEw==
X-Received: by 2002:a17:906:a291:b0:a46:7e08:37e8 with SMTP id i17-20020a170906a29100b00a467e0837e8mr1869130ejz.53.1710509493460;
        Fri, 15 Mar 2024 06:31:33 -0700 (PDT)
Message-ID: <8f3275b9-ef64-4f49-8d81-fe32b217f74e@suse.com>
Date: Fri, 15 Mar 2024 14:31:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] amd/iommu: clean up unused guest iommu related
 functions
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <324c939125677032af2c1d2e5fb628849415d68e.1710501265.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <324c939125677032af2c1d2e5fb628849415d68e.1710501265.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 12:16, Nicola Vetrini wrote:
> Delete unused functions from 'iommu_guest.c'.
> 
> The 'cmd' parameter of amd_iommu_send_guest_cmd is passed
> to a function that expects arrays of size 4, therefore
> specifying explicitly the size also in amd_iommu_send_guest_cmd
> allows not to accidentally pass a bigger array.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> All current users of amd_iommu_send_guest pass an array of size 4,
> hence this is fixing a potential issue noticed by the analyzer for MISRA C
> Rule 17.5, not an actual bug.
> 
> guest_iommu_add_ptr_log has still one caller, but even that seems
> suspicious. I left it in and uniformed its parameter type at the
> moment, so that whether it should be kept can be sorted out later.
> If that caller indeed should be removed as well, then
> no function in the file is actually reachable as far as I can tell.

Afaict this wants removing too.

But what I'm more puzzled by: You remove all callers of
amd_iommu_send_guest_cmd(), yet still ...

> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -346,12 +346,8 @@ void cf_check amd_iommu_crash_shutdown(void);
>  
>  /* guest iommu support */
>  #ifdef CONFIG_HVM
> -void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[]);
> -void guest_iommu_add_ppr_log(struct domain *d, u32 entry[]);
> -void guest_iommu_add_event_log(struct domain *d, u32 entry[]);
> -int guest_iommu_init(struct domain* d);
> -void guest_iommu_destroy(struct domain *d);
> -int guest_iommu_set_base(struct domain *d, uint64_t base);
> +void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, uint32_t cmd[4]);

... retain the function.

Jan

