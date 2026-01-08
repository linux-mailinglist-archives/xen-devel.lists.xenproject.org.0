Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A09D01FC2
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 10:59:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197500.1515018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdmn5-0001M9-7N; Thu, 08 Jan 2026 09:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197500.1515018; Thu, 08 Jan 2026 09:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdmn5-0001Kh-4d; Thu, 08 Jan 2026 09:58:51 +0000
Received: by outflank-mailman (input) for mailman id 1197500;
 Thu, 08 Jan 2026 09:58:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdmn4-0001KW-I0
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 09:58:50 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0bd8d67-ec78-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 10:58:48 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso32144125e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jan 2026 01:58:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e19bfsm15350612f8f.18.2026.01.08.01.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 01:58:47 -0800 (PST)
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
X-Inumbo-ID: a0bd8d67-ec78-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767866328; x=1768471128; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kipGxDhK+7m0yJSSlSzqufQNYHallH725i1cxTFrfOk=;
        b=bERl+6+RDvTW1t6xwdiv8wcnX3Iz1FsX7ieeN9354ARDk0sKGwwZdU+BlEftc88YLQ
         cC/B8R9RsHOK4jCWPCwurk/2wV02TKt66KCvpTrkwG1+2SIqcmTWW4M+Y2/y4NdevSdD
         SN4sSpH2sNpizo8Kk2HxprJEH6ClAqZHS4wnh45IxRqwTLBRwY/b2adx+NJ9/coM7b4D
         bn5BqU24r0LuQ0lMMRJUmH3YFEFB/BRvfew2BfQvthzZxX6FeeU5EWIMaQxq2UTwGw/K
         Bnr6zLzHjQTp/v0CC6SKlV7s+KxNP3XYsUtqVuFfsTR5CuA0qskn/qrQho6Nj9cKH54R
         u/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767866328; x=1768471128;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kipGxDhK+7m0yJSSlSzqufQNYHallH725i1cxTFrfOk=;
        b=cPdU49Qc1DB3O2MBBUpDvenup1yZsGrAyKZVhtKmJYQxcfALaJPEhs9EnusfeYkk3T
         BTpgpLyFZ9cMqdaOjCqfb/P1Z2u0EnQ8fKC+N4cRgPN+EoTA6utxxbhQmFrTAtorJbnc
         TZcKJG0Lf/Pw3yZlsylqKkrr7HcX+nMkclAzZ7HYhaY49794iebaIBjBUVOP8wJjdxaQ
         almVpDre4KtdXdpVlGYQrlYx2y8qgE1g/SdozyX4X5vQrpL136YL6PL5ZWLkWtfQsR5d
         aa60ZjEtOCP4j9OfHXUPtiNiLY14kITUmbac52dDLKr5OVjOGeIEaiBU0pnKJ2Z+1wIr
         gA0g==
X-Forwarded-Encrypted: i=1; AJvYcCWvh80ryw137m7PfXaSUydeTWVB0zWf0YqQyShgK4UGewxNI36iRf+KxlS8M7jXJXX8x6C8Hv+7yXQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxd/2GJgCz+1FYw1IbEt+xX9PV1wyVMWK08Jz6qlCN4plsRC0tZ
	eNVQ+MDENqGExrFUp1UuBDb4dpNgCDdC5AYjcVNk4RdDgdDro0TJNCSwGr+xRREzyw==
X-Gm-Gg: AY/fxX6C+BmOBKDXUOZ3uAmPZ3iAuCnY7RtgAYPBvnx1MUnTeEBRsGctuUV8b9PJxTF
	JE988i7gyyuolAHO0m43qGub8F9YXMlDZJrpk6QkxUnXjl98OJazK4I9NhS9x6VQG8gtAkyH69y
	SJAUpjS69+94TWNPtIwr0K8kpmysDmP1RHtQAksPTi867HqGOD3hEVlQ50Cx2g/DFwKukzh4tmN
	Rbb1zjgI5c2ByacoVakRFsHFa2z/MLS6tmOUa8Pr6ekVRRKCsctpoUBTSKbmYJY55lEHKzHjL6T
	xp5eY7ShkYBkYCEFALXYmdJivlIz8RzU2OjCEXxp13P5yN08mX36qL8MSPPKRC6dCc99ovA8h7a
	GJC/iHqih88AmxxVThktNS44odXv7+EZTOiEt4nJHJSdBDW8Oynf9Mtiw1vBjx2vBQjrRDBYEXs
	KfK+pfmBzt5hrk6iDjcbZ5pVGcwXWiCq+ZkbfPfM2IkiX9JeuNIJq+s2tHtTS15grDHSDUDtxOy
	24=
X-Google-Smtp-Source: AGHT+IHn/+51v/BzMLL2SOPkQmk+LUGGpF8jEe7crtpFGfWaIZINsl2wgrzkSiLuGvO7CxJIt48gAg==
X-Received: by 2002:a05:600c:c0c7:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-47d84b33bd7mr62400565e9.22.1767866328107;
        Thu, 08 Jan 2026 01:58:48 -0800 (PST)
Message-ID: <b9c0a9dc-27e0-49eb-add7-492274ff2ada@suse.com>
Date: Thu, 8 Jan 2026 10:58:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/3] xen/riscv: add support of page lookup by GFN
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1767803451.git.oleksii.kurochko@gmail.com>
 <b82d2ada57475e226cbe23cb626bf4549dc6aad6.1767803451.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b82d2ada57475e226cbe23cb626bf4549dc6aad6.1767803451.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.01.2026 17:32, Oleksii Kurochko wrote:
> Introduce helper functions for safely querying the P2M (physical-to-machine)
> mapping:
>  - add p2m_read_lock(), p2m_read_unlock(), and p2m_is_locked() for managing
>    P2M lock state.
>  - Implement p2m_get_entry() to retrieve mapping details for a given GFN,
>    including MFN, page order, and validity.
>  - Introduce p2m_get_page_from_gfn() to convert a GFN into a page_info
>    pointer, acquiring a reference to the page if valid.
>  - Introduce get_page().
> 
> Implementations are based on Arm's functions with some minor modifications:
> - p2m_get_entry():
>   - Reverse traversal of page tables, as RISC-V uses the opposite level
>     numbering compared to Arm.
>   - Removed the return of p2m_access_t from p2m_get_entry() since
>     mem_access_settings is not introduced for RISC-V.
>   - Updated BUILD_BUG_ON() to check using the level 0 mask, which corresponds
>     to Arm's THIRD_MASK.
>   - Replaced open-coded bit shifts with the BIT() macro.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


