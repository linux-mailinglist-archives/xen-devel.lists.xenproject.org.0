Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A79A83C7B9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 17:17:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671625.1045064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT2Pq-0005i2-41; Thu, 25 Jan 2024 16:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671625.1045064; Thu, 25 Jan 2024 16:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT2Pq-0005fP-0j; Thu, 25 Jan 2024 16:17:22 +0000
Received: by outflank-mailman (input) for mailman id 671625;
 Thu, 25 Jan 2024 16:17:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rT2Po-0005e1-Ai
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 16:17:20 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35eb3cad-bb9d-11ee-98f5-efadbce2ee36;
 Thu, 25 Jan 2024 17:17:18 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2cf3a0b2355so6780251fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 08:17:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h9-20020a0566380f0900b0046e3bcd98eesm4673182jas.172.2024.01.25.08.17.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 08:17:17 -0800 (PST)
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
X-Inumbo-ID: 35eb3cad-bb9d-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706199438; x=1706804238; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NkaWoOXuQsLCXKe2CZtneDrD9FozKeNnFxnTxr7pM6M=;
        b=Dg/2oRvILcXojzCNaFI0yPE9B+d50GcyZZNbeQDJHkC48827B8YC+w/AN1rCsAfwW6
         9oWtMc5Lf7S7asKANHe/nizMEVLDXPrt1FDikx9RYiYLocu16e72h8zJmXXBUBDGwpPs
         amyVVncA0hnoUvjxFIe+FWe+UwMzBVT5CEBCj2Vd0xYJQ2hkR45Qbhzq/B+m38AqWmu7
         Wln/NNVkAxS3+M6vIIGMRqdmD8jPTGTO+go30CBc+gnlxlA32DmiS8aoizUWBQqZzz8x
         RsCJkdywxwEPORTxI25bqDJ3hT2jt+af9CWTrs4q8oMerBI31eXL16fDCj+SOR8oCB/o
         Ghrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706199438; x=1706804238;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NkaWoOXuQsLCXKe2CZtneDrD9FozKeNnFxnTxr7pM6M=;
        b=XTWSSeL7Rj//bkaVEjs2kltvDrPiBq0lH0GqthTEno76CPN8HUY03D1E7ONiiAUiCz
         JSWPaEoiTubfaArZlfnQn2YkBHsIIynFAAGGIBHo+i2POYoYTtrzdlExk7582AOTrzF0
         7hgp1f8Wsg/NzZ4xGM2CxjyoOIZxQ/p1jrd0XJQXAD4josT564uM4B1BiQcZ6XN9ZjBJ
         HXpwVLyy0WtyjrPFDqx2yumpzUZKsyYN0XzowZDUj6lxpi5UbWgq5OBs3au25Z0+HQEK
         I26hQtaf0q7CzTu1nU3Nm6Wxcvhc7i0luo++6hF5DgKuz2hyyEis4x6f7jyWwIXYzquZ
         vdcw==
X-Gm-Message-State: AOJu0YzXBri31S5KV+FCCyKEtX4TJ/c1PYbj3ug6tD9Td16wO15ZE6TI
	rBtsaeXKTddHw7XpdOO629uX8ymRq09xKvnPmvbV3CSHFeNp9H0DGqVmSEpKzQ==
X-Google-Smtp-Source: AGHT+IFWw0VCcq32QzPxdochEblVROzkwVYSrq5tY03HKgqhMrTvZNsPlsFeWDX6pyaTsa8veh0vLQ==
X-Received: by 2002:a2e:3217:0:b0:2cd:98e3:42b3 with SMTP id y23-20020a2e3217000000b002cd98e342b3mr686908ljy.24.1706199438061;
        Thu, 25 Jan 2024 08:17:18 -0800 (PST)
Message-ID: <6fc809af-9662-47fd-b91e-533fd75d0473@suse.com>
Date: Thu, 25 Jan 2024 17:17:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 02/27] x86/setup: Move vm_init() before acpi
 calls
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 David Woodhouse <dwmw2@amazon.com>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-3-eliasely@amazon.com>
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
In-Reply-To: <20240116192611.41112-3-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2024 20:25, Elias El Yandouzi wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> After the direct map removal, pages from the boot allocator are not
> going to be mapped in the direct map. Although we have map_domain_page,
> they are ephemeral and are less helpful for mappings that are more than a
> page, so we want a mechanism to globally map a range of pages, which is
> what vmap is for. Therefore, we bring vm_init into early boot stage.
> 
> To allow vmap to be initialised and used in early boot, we need to
> modify vmap to receive pages from the boot allocator during early boot
> stage.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: David Woodhouse <dwmw2@amazon.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -748,6 +748,8 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
>  
>      setup_mm();
>  
> +    vm_init();
> +
>      /* Parse the ACPI tables for possible boot-time configuration */
>      acpi_boot_table_init();
>  
> @@ -759,8 +761,6 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
>       */
>      system_state = SYS_STATE_boot;
>  
> -    vm_init();
> -
>      if ( acpi_disabled )
>      {
>          printk("Booting using Device Tree\n");

... with this change the title claiming x86 isn't quite right. Hopefully
Arm folks will spot the need for an ack there nevertheless.

Jan

