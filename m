Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D858C73B9
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 11:23:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722933.1127332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7XKr-0008IE-5u; Thu, 16 May 2024 09:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722933.1127332; Thu, 16 May 2024 09:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7XKr-0008Gh-3C; Thu, 16 May 2024 09:23:37 +0000
Received: by outflank-mailman (input) for mailman id 722933;
 Thu, 16 May 2024 09:23:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7XKp-0008Gb-Q1
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 09:23:35 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7e9de29-1365-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 11:23:34 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5238b5c080cso671455e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 02:23:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574bcede889sm6954042a12.92.2024.05.16.02.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 02:23:33 -0700 (PDT)
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
X-Inumbo-ID: f7e9de29-1365-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715851414; x=1716456214; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d9Unq06GS3W7hSL9K5ZoogCfkJuM3N5NCg/yz3EDx2k=;
        b=J0JR/5HprA+1vSdZXmDQu+6AV/uL7WdEPM1qVwgRfKLY6IXz2ABBLvDSjSJ+XKBeQF
         /wcsYSDW1T79a6/KHT0dVbX3B2OrdG/4S7dHuGq/3jKQg3VW1T/FMvI3KtIEujlqJZh+
         miqI9bbQJp0Ud8+v8QlRQLliGqNyI+3gl3prtWyS65mjiVhhiwC97Ty1P8QqegNlxeKh
         290Ic+w1l+OavudOzt7WIltFGUYNd3Lt60ENoiyc9z+lCEiCfbBUHXAPQHTluom2W+cQ
         7rAELVY95hjPvFU/XOfNtYy37Do+N1iyctC8xdbGaU15qttwzXIYQ/S7dcb/OJ6E2Mfv
         oSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715851414; x=1716456214;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d9Unq06GS3W7hSL9K5ZoogCfkJuM3N5NCg/yz3EDx2k=;
        b=BqD2PrbmYfcMGPsN6pbV0ukgz8qAItmYYeRaJ5Hm/vU5r/WK52R86FdeOuTJ7zfOiX
         p2rtaCExSzW84+B5MPNqLZghneF8tbHK5LFGQlI0p9oti0V2W64KF+km2+EQOdU1Zxg5
         Z87XqlVW7nhkwdpaXO2shiI/Y3Enz/xxoiSCBBk+8ohqRk7F3JrmGc8S6cLLs+JeMjTv
         9AmBzcQJpLJESJyd+F8BYmvMhJKaF3RWw+AA+N8EJu/skOlD7e8YRcKN+z4c3JlSbiF4
         5s/IE7xDtTc/IXOubK/JOqLo4+9dTyigkiXfc6DF92cMGHsGSQ+v+gxGYhNbXNxWBeLl
         Ynxw==
X-Forwarded-Encrypted: i=1; AJvYcCX0THigcoOM8C83Wu9QS71RCq5qh3PJ9+7faLGVwucNY/ItWH7TefUKU/8Kv6h1QQQKFeCg7SQTiAbxe+uGiQ5lghg3/BtLpkcFOWJrkzg=
X-Gm-Message-State: AOJu0Yy4oAwrLPP2EsnskLr/IbAlm8xwKu2MsNLN/uneMp0KINBuuPRs
	/VNHhEx4Zohu6j8lNQnGoPN/SPAbmYkM8/0EZlo3G3tt1s72N8SX5ct8+l2DIg==
X-Google-Smtp-Source: AGHT+IHqhH3tWmRkdQKnimlbiPtAbxk/0IoZ/FQ90eDPqkqnlPgUf15BdlmNwpYPP/F5s/c6VYxGpg==
X-Received: by 2002:a05:6512:1310:b0:516:cc06:fa03 with SMTP id 2adb3069b0e04-5221006ccdemr14170268e87.56.1715851413935;
        Thu, 16 May 2024 02:23:33 -0700 (PDT)
Message-ID: <806a2978-19fb-4d31-ab6a-35ea7317c8de@suse.com>
Date: Thu, 16 May 2024 11:23:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/5] vpci: add initial support for virtual PCI bus
 topology
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240514143400.152280-1-stewart.hildebrand@amd.com>
 <20240514143400.152280-3-stewart.hildebrand@amd.com>
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
In-Reply-To: <20240514143400.152280-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.05.2024 16:33, Stewart Hildebrand wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Assign SBDF to the PCI devices being passed through with bus 0.
> The resulting topology is where PCIe devices reside on the bus 0 of the
> root complex itself (embedded endpoints).
> This implementation is limited to 32 devices which are allowed on
> a single PCI bus.
> 
> Please note, that at the moment only function 0 of a multifunction
> device can be passed through.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

I'm largely okay, so
Acked-by: Jan Beulich <jbeulich@suse.com>

Still my wariness remains towards the multi-function bit (it being set is
at least misleading when the device then has no further functions), and I
also remain not fully convinced by the earlier reply towards phantom
functions. While those indeed don't have any config space, is their setting
up in the IOMMU tables actually handled correctly for this virtual SBDF
case? It may well be (as the virtual coordinates _should_ indeed not matter
at all), but that's not entirely obvious.

Jan

