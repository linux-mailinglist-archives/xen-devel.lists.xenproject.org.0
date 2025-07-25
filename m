Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6EEB11873
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:24:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057268.1425214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBqa-000098-Qq; Fri, 25 Jul 2025 06:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057268.1425214; Fri, 25 Jul 2025 06:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBqa-00006L-No; Fri, 25 Jul 2025 06:24:00 +0000
Received: by outflank-mailman (input) for mailman id 1057268;
 Fri, 25 Jul 2025 06:23:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ufBqZ-00006D-Ll
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:23:59 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f21f00a9-691f-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 08:23:57 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aec5a714ae9so236316066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 23:23:57 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2ab:e91f:46e4:60d0:c444?
 (p200300cab711f2abe91f46e460d0c444.dip0.t-ipconnect.de.
 [2003:ca:b711:f2ab:e91f:46e4:60d0:c444])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af47cd656e8sm221958066b.55.2025.07.24.23.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 23:23:56 -0700 (PDT)
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
X-Inumbo-ID: f21f00a9-691f-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753424637; x=1754029437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H2JENWd7Bis38KBRBEUShhy8080Sn0ugtN+AwU3sLqg=;
        b=ghrfVyQ9T3nL/uNFSVESfTVH5xBro32v8LtXwwLd+xdPmBNof1T8+U620eVFM6QSRk
         8e7P4lXYeoJU0t+TH6LbY35yi1cgL4/wvRzyyhZpEgdO9dpvl2m84bwgn3gLGDl2fPgw
         LRl1UdNUauAxfKFstk8FWXQ13bsGONaDNyiYbBxMWQmO7sZ/so9I1wIYTExbhxGtHwA6
         SgAe+SNjDJJvvSXrOM0LugTcgL08h2zrqdAGIy+LZoVePyzcPiNZqV9t97Kw/rbyvzq+
         wkMBV5AD3o7vSXV5NXbdzK90DCyFBS/RCmPWZXEFLvLkZrzgtiH2eToTxm59qd9/ANRJ
         R16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753424637; x=1754029437;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2JENWd7Bis38KBRBEUShhy8080Sn0ugtN+AwU3sLqg=;
        b=X7/ykZElEAKKqjS7izHEqSDNrJDg/JyMDwW3ePrq9EWQi8E3m1VrWoDCluOwb+ie1X
         /e0qGa6WLPco7pAPxy2ma30xmLG285uheiz1tcvJ+Uwh+N3cUutR/6q0BrFlKb7wP11F
         rGUSOGZzQIXVAq9BK30+d2ojaYEbqF2xqbZdtRxsYu92/LNywcDzd94H4jd46gKVcgj4
         y/7NKkL2DUKDFEPDaVLUI8vo42k9NrjYp4udqm3Ppoe3Tr7ek5wiRbzoiOnF3BqVBzn/
         xNKKbxdISHoEPfo2qFWigszek4e9HUHFlV9n8Pk37uMfXcn8sBNg1zEtvla2bxlW3QZq
         sgEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgteR21B1Gv4PttV+548VQeRdaeXMT3k+CA74X3XlvmN8v7kD8xO/zhVSStFfyg+DR1j3uvBMRxVE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoEVirKhKedbEIjDcFbBpyjZ/hZMayiZ59ev0hcRD5yq+EWGrb
	wNwJuOD4kpVECKm2vPptVop0XP/zMrYUMmlwFo80FdcnkXA+xDX+TSO4C5WgTWiFBg==
X-Gm-Gg: ASbGncsLJ+iFdv9tEZyGGuGzfaM/kjB1w4+I4KjjNmMmieUbHV94Z0Z2DtZZznOJeqe
	msiLVo5yQcGwBEjmA+dS8kF6ygTxaGJRlJLMS85lDZGDvRq3vEa0yZzEp6g9vlHyShFVn8nGzfS
	NUv7iKqApt+wMcHED6NoPN46Yc4x6R2iCz2sPnaoS++Pm/qhVApQ2E9W4HJHL1fIP3VukdRh2Dz
	dluC9te7dFKUtB6Pf9E7MmcRYfq3FSQgoEyjsicNjIJjh0HKoDYt7lC8PgkJnn1qyieoyRVm4yg
	BzKei9QNd6BM3Fk5I53ubwt7zQlGErDnr40UVmEaqkQDe+yGM27b53E5eBtlllNQYbwHxB9Qsp0
	y+T5Fq+46olZuwiGL5lOQtqKWRjUV3wCZwsTh1b0nHcZ1zUSCQtXpBMhFLKWRWFqJCCOM1BlOI7
	r5WtvWGh3xFhkLyEbh/nc8fOxZB1/sKDmzMsCX1xfIJPBglsYIKn54MBa2
X-Google-Smtp-Source: AGHT+IG95zWVkPpJ8uaHb2m/8NGpjXLmOpj4oHWUKxLhUrkjiXxa4rzrAAHp6Ojhyb9HA4OyA9KnVQ==
X-Received: by 2002:a17:907:971f:b0:ae0:c976:cc84 with SMTP id a640c23a62f3a-af61cf97fabmr89918566b.24.1753424637032;
        Thu, 24 Jul 2025 23:23:57 -0700 (PDT)
Message-ID: <bf46a1e4-3b4a-4c4a-bed6-faad2cdf4ba0@suse.com>
Date: Fri, 25 Jul 2025 08:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Introduce CONFIG_PLATFORM_OP to disable platform_op
 hypercalls
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250725061530.309953-1-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250725061530.309953-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.07.2025 08:15, Jiqian Chen wrote:
> Jiqian Chen (11):
>   xen: Introduce CONFIG_PLATFORM_OP
>   xen/xsm: Wrap around xsm_platform_op with CONFIG_PLATFORM_OP
>   xen/platform_op: Wrap around XENPF_microcode_update(2)
>   xen/platform_op: Wrap around XENPF_firmware_info
>   xen/platform_op: Wrap around XENPF_efi_runtime_call
>   xen/platform_op: Wrap around XENPF_enter_acpi_sleep
>   xen/platform_op: Wrap around XENPF_set_processor_pminfo
>   xen/xsm: Wrap around xsm_resource_(un)plug_core
>   xen/platform_op: Wrap around XENPF_mem_hotadd
>   xen/platform_op: Wrap around XENPF_core_parking
>   xen/platform_op: Wrap around platform_op hypercall

Except for extreme cases, unlike for e.g. sysctl, I think it is dangerous
to compile this out altogether.

Further, nit: While I let Penny's use of "Wrap around ..." as subjects go
as is, the massive use here makes it necessary to indicate that I don't
consider these as meaningful subjects. They simply don't say what is
actually being done by the patch. One possible meaning could be that you
found line wrapping issues, and correct them step by step.

Jan

