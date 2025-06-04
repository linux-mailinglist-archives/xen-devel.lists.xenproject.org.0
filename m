Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 318C1ACE105
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 17:12:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005658.1385074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMpnD-00081C-AZ; Wed, 04 Jun 2025 15:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005658.1385074; Wed, 04 Jun 2025 15:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMpnD-0007yL-7S; Wed, 04 Jun 2025 15:12:39 +0000
Received: by outflank-mailman (input) for mailman id 1005658;
 Wed, 04 Jun 2025 15:12:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMpnC-0007yF-30
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 15:12:38 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 596f3ba9-4156-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 17:12:37 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-32a63ff3bdfso57358121fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 08:12:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cd8cfbsm105170005ad.118.2025.06.04.08.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 08:07:30 -0700 (PDT)
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
X-Inumbo-ID: 596f3ba9-4156-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749049957; x=1749654757; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ppKDDd1KM/CBZpIQdCr6Cpu3wQ0r5qJV36tW1pEJnz0=;
        b=UUWZrx+bRmsoEaJ82S+gFWGYVenh6VZdZQpK6dzpWtbPVxhn5KkXgeiqQRHwzqInlj
         iAjrs+J33CzM3vE+M6zfy+YymEJxKVpkllmOpUcxHPyEaYDG3bxxZj0UEabhKFzlKm7O
         07tq7P2SJpz+PCAWHJlfTofJzW4a4EX3Ptn0tJG1eWuz5gV8ny/F01ycbloYib/LVy33
         9icJiKb29OdVtCfuWaWRiyXKrJGBLuyt3Rll0HIlPa3wEie0nezemsT4692eV55iyhif
         SevVCy83bftb4yXnE5Exe4sS9CTN5O0zWzb7G5EiYepfD+uEelFMIx3CbVqINs0lu0mW
         RJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749049957; x=1749654757;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppKDDd1KM/CBZpIQdCr6Cpu3wQ0r5qJV36tW1pEJnz0=;
        b=VnoOuDaX4zd+BJOBgiZ28ZHLRL/OZWk/v5DpU34/yg4Uh6rOiiParu2RD4soE1aLLP
         H4oqo/wdOns4yrw9uG0r1+FBzaOb5USFm6j+M0gocJJLc87eQK3Yu0Vm351RVTI0vg1G
         +Xgv8RBu9Cgu1KgCnh3e/m4sUxBF0oVObB4HNNpdNXI2ayjTWcbmYDowqlPFFWT1RYou
         g8Hc2z5Vhgx4OeT7JcSMwH+Uj8swWxX3RKEpUTZ48tUZRpfGn/08UcB9GY+nYplwjZAo
         AE8LmPnaA+ngCRAqqNotk8U+4SxTs5wnMvkHI05Re6/TCwbSI0A0DANErMP6hqhHkxmu
         fkzw==
X-Forwarded-Encrypted: i=1; AJvYcCVT5Kqs4ZGDwmroWm6obOhRqhoW523gs4joxCsXeFCJzELBNTpCgyLGohps/GTq3Hw6cNy9Ya6BIuE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhsRrKKjkKRRB0eeoLnocA0U3gnFn7zcWLjUT+7i8Lk6PQ4u6/
	poF2WXw0Ln47q5N9ZAWmaJAMikquFteiEXaFa0PAE+Jy31YQMBxFZc0Rj8REZ9TQp35Fw2S6czt
	eUTg=
X-Gm-Gg: ASbGncsFETGnRtOliDpy4w6ws1DIYJGDEvSO+uvhcQVlUznsPPud1hSIgkIeT0wvQoH
	iMMkkwQgW3v3WaXp+VMidgGxlh696M/4crNwLJ4aQ0MWM7I29nzG20LuZxmzWZOrKvvXRfkO/sh
	9UaPN2DpdcFdcse5xEfxR+v8KiiBuUvZFskJiELiefjfH1n8I9dgGCSzw1AFkml3W8tqhJ0waQQ
	MzB2NLpVZnDVQ1PodYW8H0J//I8/LW9fuDu+dbXhDBoUUxq8mweadpwnhw8RijMMEg7lh66Nraj
	UBmLlqMKDK5VVSA3oLThOQ9/h0pRBJrXNPm03SvV5c0e2wpPxsrJXZwlX5/4PSIWyi7BDivZISH
	vnOLC9rUUSt8HqMhqec/G7TEA4bZ1QoVgvygIepnQQuTcOPU=
X-Google-Smtp-Source: AGHT+IF/LtX1ICFsoFXnH9qbJjrhUWgHzmL7wfiW5XIrMaAA7X1uTuUx6gkqxzvECP4BgyJzdjEGQw==
X-Received: by 2002:a05:6000:420a:b0:3a4:f893:3f03 with SMTP id ffacd0b85a97d-3a51d967c96mr2506343f8f.45.1749049650919;
        Wed, 04 Jun 2025 08:07:30 -0700 (PDT)
Message-ID: <8bd7442c-cd63-4933-b05d-f939462614ba@suse.com>
Date: Wed, 4 Jun 2025 17:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/numa: introduce per-NUMA node flush locks
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250522084815.825-1-roger.pau@citrix.com>
 <20250522084815.825-3-roger.pau@citrix.com>
 <d3856421-59ce-4cd1-9fc5-ad330bf760ca@suse.com>
 <aEBgJExBUtjviPJZ@macbook.local>
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
In-Reply-To: <aEBgJExBUtjviPJZ@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.06.2025 17:03, Roger Pau Monné wrote:
> Thanks, given the feedback I think you consider this an improvement
> worth pursuing then?

Given the numbers you provided - yes.

Jan

