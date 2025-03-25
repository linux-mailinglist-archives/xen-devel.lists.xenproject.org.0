Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B0FA7068B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 17:17:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926671.1329508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx6xh-0000Pg-Da; Tue, 25 Mar 2025 16:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926671.1329508; Tue, 25 Mar 2025 16:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx6xh-0000OH-AN; Tue, 25 Mar 2025 16:17:09 +0000
Received: by outflank-mailman (input) for mailman id 926671;
 Tue, 25 Mar 2025 16:17:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tx6xf-0000O8-S4
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 16:17:07 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97ebba27-0994-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 17:17:05 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39133f709f5so3136804f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 09:17:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9ef23esm14023550f8f.81.2025.03.25.09.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 09:17:04 -0700 (PDT)
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
X-Inumbo-ID: 97ebba27-0994-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742919425; x=1743524225; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nzom9g4Ka5TevUtw1wU09d/0vW6yFxavyu5lSqFcITk=;
        b=VDOwYuXvSvUoJzdzs1Zbt68UAL4vI9Mo0ZRV9ETB5nekb9VIi8e1b8gUK+dyiPoLnk
         /dHTu9HV8mEUQS3HHVTwVW7JSWMffuZ/YCutW2PZMZO+zlzNBxCb6B62uFzWfng81Os6
         aa3hQ7S38G3Zi/Qz3kyp1UijINOpb5kgbwCAfSi+Du4DNeIZWYD6YOKCT7i1Hjucu1VK
         PpCyxCJRXWpzAMS5slSwTyGNhnie0OY9CL5CmGdkS5LTobZLQit/z33oQ0KVt6/Lfgbz
         cozyYkgcSjCs/aKEdmkqALZUBar1Eu/WGPBf8t4jaNbfC1xle0tfWZj0frQ2FJejnFpD
         tCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742919425; x=1743524225;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nzom9g4Ka5TevUtw1wU09d/0vW6yFxavyu5lSqFcITk=;
        b=az4o5hiUQw0fmRBY6XC2orLxX3MvsgFGpQiMyDC6e8RVQ0Bv/I1QJ08we0hI3hqhj1
         iHFqqBJCicgpYaXJJxUJgUlKcIvp+K7qEB1dQqqHhaAyiLpq2B3N/mGVodnpMSD4B58u
         ILNGkrOL1umXYXJejUOJG9yhaRPxfPv93nZMGK2Hp0hN3X7HpvFsVXCK22Nw0LahZAlV
         1aZu8qPVDNB5ezozxgpGIJBYrN4tIneJf+6abbsbO1StLAy3+sAjqGg4SP+N+xjIQYRD
         qCdHGnAZHzeviApTaQdg4CxRAFXelezQr+ZIDxjMNpmnJjJnmJJqUx2D5UH+4nwfYM5u
         gNcw==
X-Forwarded-Encrypted: i=1; AJvYcCXS5Mtr8gv47ffC4NiH6xGfvUexHCo9Mk4Mu4BUZbmoYUVAhrv0EU+NnRjxg0YFbGTaYIds45qqNag=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz61VMVQjIFo6mWGklSOQz7GMyaEj9fPQt6DSILHjTJr8mj8YSW
	78q8xtYG57L/Hq8sJAl6jqYHI6qVE6uadUDbK7Um2yogyRKULSO3SuK50V1ZFA==
X-Gm-Gg: ASbGnctGdt9NoZOrqo7fsuVgg5orW4nV0/RWCDUYBWfxmrKcfWMeE0BmLmQEIk5CnMP
	Xxc0tb+obonfXOzbsLdaAXdzL0MP0sn+numIkNoinJyfrUVAltR8EslxxZnNdbCOlLUK3jwbPnS
	jyvHsmkI6Yu1TiJ5wTh8C4UR+oUNAgporaHNjIGcbbz8er3IOgcEJ73PcRs6YftMZU17AEh/LTp
	gy05mccQNbd/VxJi8eD83J1RVHUkZrlF2h9+Ze4h5ygBo0vA/A5dWA6IQcIcjldztybD6clzIKr
	vdQsmukyYrKi3rBsCOp3tWNPZ+TkIAfDDYQaKrOXDL8pr0LdVxjQzi6UUfIXWFJpNrm/dsonSp0
	7l/S7LO1EBMLH69TSqMZkQ0C9v1AdEY6OsZcUC8IB
X-Google-Smtp-Source: AGHT+IFAMF5I9YU7m8Jb60Oer9qE9T5DhfVykQZ4NtX7buysg8XRTsEGTIIKCjRzTnfRw1k9AA5epA==
X-Received: by 2002:a5d:5982:0:b0:391:2b11:657 with SMTP id ffacd0b85a97d-3997f92d423mr18749416f8f.38.1742919425210;
        Tue, 25 Mar 2025 09:17:05 -0700 (PDT)
Message-ID: <45640c36-0b7d-4502-bf4d-df1c1d17d528@suse.com>
Date: Tue, 25 Mar 2025 17:17:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] xen/acpi: upload power and performance related
 data from a PVH dom0
To: Penny Zheng <Penny.Zheng@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Ray Huang <Ray.Huang@amd.com>, Jason Andryuk <jason.andryuk@amd.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20250306110824.1506699-1-Penny.Zheng@amd.com>
 <20250306110824.1506699-2-Penny.Zheng@amd.com>
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
In-Reply-To: <20250306110824.1506699-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.03.2025 12:08, Penny Zheng wrote:
> From: Roger Pau Monne <roger.pau@citrix.com>
> 
> When running as a PVH dom0 the ACPI MADT is crafted by Xen in order to
> report the correct numbers of vCPUs that dom0 has, so the host MADT is
> not provided to dom0.  This creates issues when parsing the power and
> performance related data from ACPI dynamic tables, as the ACPI
> Processor UIDs found on the dynamic code are likely to not match the
> ones crafted by Xen in the dom0 MADT.
> 
> Xen would rely on Linux having filled at least the power and
> performance related data of the vCPUs on the system, and would clone
> that information in order to setup the remaining pCPUs on the system
> if dom0 vCPUs < pCPUs.  However when running as PVH dom0 it's likely
> that none of dom0 CPUs will have the power and performance data
> filled, and hence the Xen ACPI Processor driver needs to fetch that
> information by itself.
> 
> In order to do so correctly, introduce a new helper to fetch the _CST
> data without taking into account the system capabilities from the
> CPUID output, as the capabilities reported to dom0 in CPUID might be
> different from the ones on the host.
> 
> Note that the newly introduced code will only fetch the _CST, _PSS,
> _PPC and _PCT from a single CPU, and clone that information for all the
> other Processors.  This won't work on an heterogeneous system with
> Processors having different power and performance related data between
> them.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>  drivers/xen/pcpu.c               |   3 +-
>  drivers/xen/xen-acpi-processor.c | 232 ++++++++++++++++++++++++++++---
>  include/xen/xen.h                |   2 +-
>  3 files changed, 216 insertions(+), 21 deletions(-)

No dependency on another patch is mentioned anywhere (the cover letter
only says the series is based on the very patch here), yet the bulk of
the changes here (to drivers/xen/xen-acpi-processor.c) are meaningless
for a PVH Dom0, because of

config XEN_ACPI_PROCESSOR
	tristate "Xen ACPI processor"
	depends on XEN && XEN_PV_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ

(note the XEN_PV_DOM0 in there). Is the patch here perhaps missing an
adjustment to the above, to use XEN_DOM0 instead?

Jan

