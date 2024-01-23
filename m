Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E877838D8D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 12:36:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670398.1043152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSF50-0001XJ-44; Tue, 23 Jan 2024 11:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670398.1043152; Tue, 23 Jan 2024 11:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSF50-0001Uq-0o; Tue, 23 Jan 2024 11:36:34 +0000
Received: by outflank-mailman (input) for mailman id 670398;
 Tue, 23 Jan 2024 11:36:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSF4z-0001Uk-I2
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 11:36:33 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a79ecd3d-b9e3-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 12:36:31 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cd1a1c5addso49195591fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 03:36:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x8-20020a026f08000000b0046e7ae3fea8sm3655326jab.148.2024.01.23.03.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 03:36:30 -0800 (PST)
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
X-Inumbo-ID: a79ecd3d-b9e3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706009791; x=1706614591; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gR2W2+aUmN73hKzxOAqCNHrTKCX2JPE9i3JZ6u0A0a4=;
        b=BJZy/OgSKMFNNS0EVrY/C92p/+VFcqsI6g2vfN8zDHSWin0pp1msdELlF7WzULVpP1
         T1n3hbpHBrQsOTDi5BXdNJE5eG+bj1xN2zJvy0SEIqAXHU/GDPTJxU3a+PMg8jrr+xJt
         WUI3ZeccK07LS/dBOy4HSvQ1fraMUL6FNQ3GmzFO74qkX4nqxTg5zIKtT27Q+yKOnQ+t
         kSxRZUKTBMAziSiT4GAiNJi5BoDKvdMlVAqJKrA/UVPyUJagbpm7367cee6Rx1F8baX8
         J3CSa8qZooDY3qjdjuMy4i4uVBIOSHdba4mRZo/Cs2lTv8zIHgVjngUQUtH4saB5d4Iz
         tbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706009791; x=1706614591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gR2W2+aUmN73hKzxOAqCNHrTKCX2JPE9i3JZ6u0A0a4=;
        b=vKAvmVew8ZshteeLMesRHKVBz023/sozi0b0c6jq8nWHIGj03EMOvG8AXjEcWuWpaU
         S+Yzsrwljy0OvM6n93SUap9VbgrtZoXeXLzHpPUQizdedF0ClCvDU9KOZbtkG1ZQVwTg
         BLHoyj5HpcdzakVTFvet/Ee76fT5LVip9FkzDHy4bLq3Qx/1+Xs9ZlwKZrTtV6DyM2Hk
         S9dhnB9giEU+LWRWxk/mIm2C8MWRvN/uv+Lk6ZQYcwTTdKcwc9OAsNe+3+f1xJ2d1W5m
         rHvAA2ZNrFpLezgtHax5qTjZTFtCn2eDT5mxFOKGuNNARwuCCgWXguCBdpYXWQ422LJa
         MvKw==
X-Gm-Message-State: AOJu0YzOLV5o2bf4JnBmJ/f5bS4hFyi6MbpwXAWm80RJVnOqLNUc6QRd
	G/PIa8Whn++SQRd7BAlcjl3yfpnRV2iLoc5L6N8gFOvBKivd1gF6hRVp04E2yQ==
X-Google-Smtp-Source: AGHT+IFjcCH211PcePi1YWBKCZpQcCUNJIyOegNwlyFRaK9Ct4H9/P+WocGlQLWpr3pRbTEVTL0Tew==
X-Received: by 2002:a2e:a0d7:0:b0:2cd:b6cd:f258 with SMTP id f23-20020a2ea0d7000000b002cdb6cdf258mr2445371ljm.65.1706009791261;
        Tue, 23 Jan 2024 03:36:31 -0800 (PST)
Message-ID: <0740cab9-be2e-4aae-8b03-e3ec95d0b0ef@suse.com>
Date: Tue, 23 Jan 2024 12:36:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 29/34] xen/riscv: add minimal stuff to page.h to build
 full Xen
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <7aa26bdad9bf923fd57f7a90e41c049cab0cd5bd.1703255175.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7aa26bdad9bf923fd57f7a90e41c049cab0cd5bd.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:13, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in V3:
>  - update the commit message

Once again I find this puzzling, considering there's no commit message
at all.

Jan

