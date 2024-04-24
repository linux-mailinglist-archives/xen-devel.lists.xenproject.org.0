Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE648B0C75
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 16:27:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711480.1111471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzdac-0005vc-Hz; Wed, 24 Apr 2024 14:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711480.1111471; Wed, 24 Apr 2024 14:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzdac-0005ti-EL; Wed, 24 Apr 2024 14:27:14 +0000
Received: by outflank-mailman (input) for mailman id 711480;
 Wed, 24 Apr 2024 14:27:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzdaa-0005ta-Tp
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 14:27:12 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd1aaf48-0246-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 16:27:11 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41ae95468efso9631485e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 07:27:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v14-20020a5d4a4e000000b0034625392416sm17261775wrs.104.2024.04.24.07.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 07:27:10 -0700 (PDT)
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
X-Inumbo-ID: bd1aaf48-0246-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713968831; x=1714573631; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6kqKkudjbHg8iw4mAb88VR24roPWgfiFaURW+EfRzBw=;
        b=EEvhM/xMhDE9jxNUjMNZt7vEDeth22pz0yqzV1PpbZwl+2MYJ4ygI0r//IJUDxJiok
         j6DGGB+738nP+sL/+2Mkx3TI76WWR8vlMPRkcClrY+pagAZWuueUdlIYx8ogWsEGaK5s
         7OkzOAK2sQIcuyELZG8cGI4F9ikpoKmdu2cTBL04xj913beZJ9G3tPcgBUBXXLxvm9W9
         s6+P7vUEYVqPBOLNfJO4tc4CBat3+I1FPLa3RZf7YOIoLgsux5YA+A0QZOFmare27Hpp
         /CsPGpcuDcrzWdXjH/O/WXds9og3Jze0l83I4VkW5fBwxw0qO2u8s03hDazYuhpESp8I
         OLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713968831; x=1714573631;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6kqKkudjbHg8iw4mAb88VR24roPWgfiFaURW+EfRzBw=;
        b=jEwK1zQ2i0sEkr3jzWHdnrMkKJUvFEa0XvV6EImb1E2/yEqkHRjTyHJnwbHfwyaH0n
         9M2SRVR1KXi793yfWHZJBHSfjtTerwuwB6mouuilNuDOtDcFzrFyLK9UnqNqFH95owMF
         GGREbS++AS1fq+Br7JclmbVO6XnZ+iC4ZK+IfOFwdtktcZY87Vc8R6DySIE98Yw+T8N2
         DM8FfwuhxTusq5Yl0r4j3tkzhSk6JUv9vuLNWonIlSik+BOl6Nm+2DzY7aVSWx99QPiy
         LNRUgC3II6VP6a9gjYFo+cDng4YzWPUwSfMiXadjkQN+gzNTa8SB3l2vhKwntpFwQBmC
         nUtg==
X-Forwarded-Encrypted: i=1; AJvYcCV6MXnaenPnixjfbUpqSBBE22tFoEFgqQkykgs4FDT0LGZwWLfWCx1crQqasGeYhG7eHBY8B9QFXaqVWrmosnFeK1Ostv+vT2qgbx+kWrA=
X-Gm-Message-State: AOJu0Yxzo/Cyllf1T1FMrAuWUDv1n8om38veF3Ryy0SDgmODrA07Wkx/
	Ya+2w1csy8RHEwTmJzRBCC7vBJ4KUava+/JQ4p8XLQW25DVSmlvHvRnK1z0EAA==
X-Google-Smtp-Source: AGHT+IH+5OXqlUESN51mQGLgHsnz10m1i6u9CYkId55Jw5dwspnY+aIG/yBCWmwWoDS1q281ahu5IQ==
X-Received: by 2002:a5d:56ce:0:b0:347:ced:c7c7 with SMTP id m14-20020a5d56ce000000b003470cedc7c7mr2878547wrw.9.1713968831091;
        Wed, 24 Apr 2024 07:27:11 -0700 (PDT)
Message-ID: <8cab0372-8c40-4648-bdbe-ff56844f289d@suse.com>
Date: Wed, 24 Apr 2024 16:27:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 1/3] x86/iommu: Disable IOMMU if cx16 isn't
 supported
Content-Language: en-US
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1713433029.git.teddy.astie@vates.tech>
 <4656eab84f7b4b807fc61f54b9ba5c0fc4fae64d.1713433029.git.teddy.astie@vates.tech>
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
In-Reply-To: <4656eab84f7b4b807fc61f54b9ba5c0fc4fae64d.1713433029.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.04.2024 13:57, Teddy Astie wrote:
> All hardware with VT-d/AMD-Vi has CMPXCHG16B support. Check this at
> initialisation time, and remove the effectively-dead logic for the
> non-cx16 case.

As before: What about Xen itself running virtualized, and the underlying
hypervisor surfacing an IOMMU but not CX16? It may be okay to ignore the
IOMMU in such an event, but by not mentioning the case you give the
appearance of not having considered it at all.

> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -305,6 +305,12 @@ static int __init cf_check iov_detect(void)
>      if ( !iommu_enable && !iommu_intremap )
>          return 0;
>  
> +    if ( unlikely(!cpu_has_cx16) )
> +    {
> +        printk("AMD-Vi: CPU doesn't support CMPXCHG16B, disabling\n");
> +        return -ENODEV;
> +    }
> +
>      if ( (init_done ? amd_iommu_init_late()
>                      : amd_iommu_init(false)) != 0 )
>      {

I did previously point out (and that's even visible in patch context here)
that the per-vendor .setup() hooks aren't necessarily the first thing to
run. Please can you make sure you address (verbally or by code) prior to
submitting new versions?

Jan

