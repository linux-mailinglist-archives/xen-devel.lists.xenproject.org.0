Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E26281C66F
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 09:23:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659258.1028780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGao8-0005KQ-Gh; Fri, 22 Dec 2023 08:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659258.1028780; Fri, 22 Dec 2023 08:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGao8-0005HJ-D9; Fri, 22 Dec 2023 08:23:00 +0000
Received: by outflank-mailman (input) for mailman id 659258;
 Fri, 22 Dec 2023 08:22:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r2k+=IB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGao7-0005HD-2r
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 08:22:59 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50069f56-a0a3-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 09:22:58 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40d4103aed7so13791905e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 00:22:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fl25-20020a05600c0b9900b0040b3e26872dsm14065633wmb.8.2023.12.22.00.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Dec 2023 00:22:57 -0800 (PST)
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
X-Inumbo-ID: 50069f56-a0a3-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703233377; x=1703838177; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gpc+Qeppkd8l8XcSuu49p/Em4UUkjkka0UOhR2JQUqI=;
        b=T1jnfme3TSxj2bQCEUgJjklRVe+WixWxJbvewlFbeIKKT30l78JQ7NBBRce8lcBCHn
         N8TyuSjxpLs4h/CnrCDeDT4Cd6fPpG6W3RbEbCkOaLwcoOYAn0WRlGk2MqbMp+5vRKcn
         OuxZKe4ma4KJOmXycIt6Ua52DxVcuqWHZ1x3NOKG64BpzVTQCh8P4XVGzR5VIV5r2VjR
         fRiZMBGw19gxP4vhLqaabzfy0QL8g5gd7x38zACyy7UG4D/5EnZ7k3pKHcowp7YxjN01
         mcSsK6NCz2dIzli8zG4czGLnlZPU7Sybrz3FjkONGcTMvysyNa3RJDr/eYlzoztOEqlM
         4mgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703233377; x=1703838177;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gpc+Qeppkd8l8XcSuu49p/Em4UUkjkka0UOhR2JQUqI=;
        b=kyltcdRe+46jT9qnmg4UBmQDleEYdtoqLGe6+Sz7HNXzdLd//+AduM6i3/jV5Zn9qc
         B4+SVYpDA3pWyF2iesbREz6YL1kWPEhvdmZCLACUOyCctzsuGEtb2tVaZZTOj6l6wQ8x
         ls3AyBOPn5a+InYYCbVy71OVmTvmgPMMrycERZf8hyGcmoU0EKjDduQeYfWYSo7KAa5R
         Q/Kl80iGSrk3wQEpQuiMgIZg5R/Qi97+QJWFXoNb9GKDgY/iP+ijSgv/7pHg4yBx/gRG
         4pS2q8IgI9WJa+GrmRwIsXzKuLiYTO5wTeBvF67dEWj8oJ555AJOjVJZwByEtlPu2+NH
         u/hQ==
X-Gm-Message-State: AOJu0Ywjo/Z+Dea4PK61TYTi0xYDQs4IZJZfVF6RUt3Uu+MjZECh17o5
	5KT9A2mpRRO/Qb8MExOqdchG/VcfYyzu
X-Google-Smtp-Source: AGHT+IFUMvAUxcA8O5J8ZxdpGIX/icOCWXKvkRBV8tcu7oW0eAlqBKl4fFkATsyiszKIITBdf4j78g==
X-Received: by 2002:a05:600c:4503:b0:40c:2e1c:8f87 with SMTP id t3-20020a05600c450300b0040c2e1c8f87mr541899wmo.164.1703233377412;
        Fri, 22 Dec 2023 00:22:57 -0800 (PST)
Message-ID: <03cf5145-2124-4150-9f20-904f08bcabda@suse.com>
Date: Fri, 22 Dec 2023 09:22:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] xen/asm-generic: introduce stub header numa.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
 <08bca9a4158a190a0a953e5bc071a512cfe5f0f8.1703072575.git.oleksii.kurochko@gmail.com>
 <341249d1-217f-4ad2-9455-b1aded4b9b56@xen.org>
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
In-Reply-To: <341249d1-217f-4ad2-9455-b1aded4b9b56@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.12.2023 20:09, Julien Grall wrote:
> On 20/12/2023 14:08, Oleksii Kurochko wrote:
>> <asm/numa.h> is common through some archs so it is moved
>> to asm-generic.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> I think this patch will need to be rebased on top of the lastest staging 
> as this should clash with 51ffb3311895.

No, and I'd like to withdraw my ack here. In this case a stub header isn't
the right choice imo - the !NUMA case should be handled in common code. I
would have submitted the patch I have, if only the first_valid_mfn patch
hadn't been committed already (which I now need to re-base over).

Jan

