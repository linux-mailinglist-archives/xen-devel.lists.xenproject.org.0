Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915A9AA6C0A
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 09:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974468.1362318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAlBB-0004LV-S8; Fri, 02 May 2025 07:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974468.1362318; Fri, 02 May 2025 07:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAlBB-0004KL-Ni; Fri, 02 May 2025 07:51:29 +0000
Received: by outflank-mailman (input) for mailman id 974468;
 Fri, 02 May 2025 07:51:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uAlBA-0004Ji-BE
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 07:51:28 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 400dc7c2-272a-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 09:51:26 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5f4ca707e31so2676985a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 May 2025 00:51:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a1e60sm9697366b.47.2025.05.02.00.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 00:51:25 -0700 (PDT)
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
X-Inumbo-ID: 400dc7c2-272a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746172286; x=1746777086; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yEJP/3Pi6fsvkA0BQbpjsUSe/tiiQFJ8vRw9VfEK1lM=;
        b=D7nYQDjaae+gWARMFZXNt/7ed1MU3e2EhxCzGO+wQMvrVN0pMTtDNCB0zpF7eiv5je
         RWjFoaHsQWFhFj+f77vc8fTBuUe4n1q+JHucLhMXZRP6IlT6iyjySM5o7odlxHBveLxf
         ufsG8QF0nhrbaNZESgrqMLWebj6c5pCnTm7sQZa8pHgghq4Ut4OGAb+QWKljfXlZ7sTy
         tOQyjUI3knoNuofbgo5l1zt9nDRPKUPc1dF9dTygec2H8qt5QYlJkvJlN1dEAWow8LVc
         1eAqXIAgg7kqCzetmX2jEKrsn46h6bYFvMkpnbmEsB7iLjaS8VRB7uCsy/qWVbkQj+7A
         ZOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746172286; x=1746777086;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEJP/3Pi6fsvkA0BQbpjsUSe/tiiQFJ8vRw9VfEK1lM=;
        b=EdJrSRxZdIshqjyT5qlKZzda8HEUmYhvIiFs4fYpK57YmDNb5AcaodOdzdtUN1QYBH
         9NnMhdFlJCZbD2FMaasH4I1CNZIjFm4u3yN0frEi0orvPCReE9fvkxLgt2wZ0EMcR24P
         6JJAu59qySsWB5L0qwkcMexbUr7u2OoUF4Vu5E2eVDibqFH670iBPSBOC5Ap2u/C252j
         1pJRn54uOkSUYdMbx1XHomWt7/Z9WRo7oYE+qvgan1tH9YLIh8oeXkyt8rHYoA0RN09E
         wV4S5aaMSGOuUpX087Gn2utstB+Poq79iqM8X99+zy0X3t94b5WK1OAEy/QUQ/UamSWa
         u3oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN6kJNdiaFbXRS2YerIjpXBNjBBWqXSl2xKeyi9C5eHsSWcsLL38xWuT6G32IgiXCg4iHheM8Fr7E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyozK3asWWudW/cXs4uMXcOChIqpes9wes2IJDG/Q0aJIBkpiQh
	SOszYQ9kWwiOBKR5U7r5IHcvPaUBNIY+xuUTcLYcJ3VMj4crArh/VZqie+t+3VWNe1adoxhf/DE
	=
X-Gm-Gg: ASbGncukZJQn8vw+vUDxwg7sTyJLqiiNR2LEklOtlxwy1NPwT/5EbTADnnTTFozD6kk
	xmVtQjdoquUC5LvmoRpPMzUMLs6GczTNOsC6GIFicSfTtqIrIhKyJr4HjLgLsVJ5Vqb8C/YyMMk
	oS+W+uE0wY0+Sz+x5JF/HowjrOtVTFzl7wD5aWclPxmq5f9TEyLYAuHPPCGMsCARMbvujiGQTKn
	mjNXJY47TepH2wHZsowEqg2HfSXSQ5582yCGJXOjiapYgmAa/F3KfMvbMblvHCt4mNoIE3B4s6p
	XgAn7F1ks1Tj5mDcVVqBZtO+UHxzC55Y9xizpl5aqPIKlYyD51EA/ScE9tzZGWgWvwuBxy0yAoh
	OgjVwuZIfj+YNYtPuWjr67HFQxw==
X-Google-Smtp-Source: AGHT+IGmtpwygMA7VlA/AWgHncpo9LfoAd01s28p88tuKvs0g124S/1i9Ru4X/CM+yOFZ2/lv+wtMQ==
X-Received: by 2002:a17:907:3991:b0:ac8:1126:ac15 with SMTP id a640c23a62f3a-ad17af8f27amr183370466b.41.1746172286103;
        Fri, 02 May 2025 00:51:26 -0700 (PDT)
Message-ID: <ef14eb13-a26b-4773-abfa-0828a813a397@suse.com>
Date: Fri, 2 May 2025 09:51:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/thunk: Don't opencode TSX instructions in
 clear_bhb_tsx()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250501181655.711704-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250501181655.711704-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.05.2025 20:16, Andrew Cooper wrote:
> The new toolchain baseline understands the RTM instructions.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



