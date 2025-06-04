Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CBEACDE40
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 14:43:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005506.1384963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMnTC-00012x-OS; Wed, 04 Jun 2025 12:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005506.1384963; Wed, 04 Jun 2025 12:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMnTC-000119-Lk; Wed, 04 Jun 2025 12:43:50 +0000
Received: by outflank-mailman (input) for mailman id 1005506;
 Wed, 04 Jun 2025 12:43:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMnTC-00010z-3M
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 12:43:50 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fd26a96-4141-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 14:43:49 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so1127258f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 05:43:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e3d4b6dsm8847157a91.45.2025.06.04.05.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 05:43:48 -0700 (PDT)
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
X-Inumbo-ID: 8fd26a96-4141-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749041028; x=1749645828; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=555Hmb33Ir+0XtpJymECE0VBTEfBzKFFNJkE+4GGjdE=;
        b=gpm1NpnVZruP/OF6x5C/Sg/9P1yQ2NgUVfQxLnIZp11F+MxO0ozgU37c7zh97z0bJ6
         sXMXD/63hrRzVyfmRy0TskGE8RM2iDR8aTK9a1q2JFe9RGxzQ5tPye87ywRDIPFgmBQB
         KSwYpST5Q34y3DC/f+J2hgvwKkacgzBK/BS2wD8Y/dgt7fzT9nN+gl+9YCtXTTpRuMrQ
         wWocOdIBX1KP8Ku6c1BnmmSiDnwY1F7UgvKI7tDO34lMGZjRlZ8J/HwjLIojFzvNAGhb
         Fs46VYtCplEot1Kx/9sVIaLUZxIuokJ0FcKmt09bR2HICTISghkuoEI+KNExjvX/lWKD
         HF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749041028; x=1749645828;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=555Hmb33Ir+0XtpJymECE0VBTEfBzKFFNJkE+4GGjdE=;
        b=j4ZHY735M75jro2t+zxx3J+5jqFWsfhvZGVf5rmeFEw5H5F2hHurolAGOm20RS4EHg
         65SoBJl3qqQIvsgqnD/3iW2WiR921mSIvH/pNO3av3iRQ4bNaR46AFG1ivALm6GgmR6u
         yKX0nmknYwW1AmrWAUD9QB0nJKx2ofUw2gyU7Kihign3DS59nwxY1hs9ouTK8kCI8hf4
         5SrfF+tZUvFTwR4mopAG7Aegag2tChqJ7FwZtMw4/JxGd7KhYLzGx6L2rL1c0wrT56SH
         Xsqi0+aYGeC/0f4SiatWhfPbNGoCYVqkw5ZFeI9grpNNTaeYqA72zs7iukCvpYtaNa71
         cU1g==
X-Forwarded-Encrypted: i=1; AJvYcCW9/vOsv8AQFJg8mo61qol6QrioiCsjMZt3DyIrlA3w8UPTYo5FadP/5YBcoRUDDVx3NsZw3HHTltM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbZ7SycX8w5L10Pg3qfbb1g337uPk2o+x1fPGK2ljgFQhNlepG
	lv1UWdw7BUZ9J6RILNKP8Upgt3ShzaQUsUvCL4osfg76F9jIAm7MrDJM9qivTJYYQg==
X-Gm-Gg: ASbGncsLc65ptIoerBULVe4SVwJbkATfOg5e+oNquoeVH59Thn5a4CiBhDT1PU8GJTS
	iOEkNcGbUTRSX5Cc9uo/D3BpnA7OGs+hytPrLfSSqw2zQd0UAA6l6RYIP32IWK79x+rgqoOBe00
	VGAyjUJjYKZ1EnOHOrLchBxwTesINwHO6IWSx0TWCoxD4TYzqNVb8mXpirl/e3ChImirLEyeFvz
	optxym1Jnc7d7fvW9gmVMWHYtZWqIEIAyPmByXBItiYDlE/m8gKA5bvAYpxd5uwyBm8I5B4rsfy
	Ve7oiHwK2B0mST8RJy1ThuXGqWAyGpTJVvV1tYgtVmXY869exmVY/XoXhaM7BjgxbbfOwRnTF0i
	LdFsrQtZX2A/HZX0zI90QehLxQvxbzTcYn6qo
X-Google-Smtp-Source: AGHT+IGp7fmNwXlvYYX4jYZ5yBaRWzspEd1rgOH0yHzz1CcrYZ7UrfSBS2qlWErTB/4FG6O4rUDKoQ==
X-Received: by 2002:a05:6000:3105:b0:3a4:ef00:a7ac with SMTP id ffacd0b85a97d-3a51d974cd2mr2454074f8f.45.1749041028577;
        Wed, 04 Jun 2025 05:43:48 -0700 (PDT)
Message-ID: <8ffbb281-6297-4f78-981b-1f4c6fc1ff29@suse.com>
Date: Wed, 4 Jun 2025 14:43:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/numa: add per-node lock profile objects
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250522084815.825-1-roger.pau@citrix.com>
 <20250522084815.825-2-roger.pau@citrix.com>
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
In-Reply-To: <20250522084815.825-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.05.2025 10:48, Roger Pau Monne wrote:
> Add some basic infrastructure to be able to use lockprofile with per NUMA
> node locks.  This patch just introduces the required types, plus the
> printing of the data for the newly introduced type.  There's no user of
> per NUMA node locks introduced here.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  tools/misc/xenlockprof.c    | 5 +++++
>  xen/common/spinlock.c       | 1 +
>  xen/include/public/sysctl.h | 3 ++-
>  3 files changed, 8 insertions(+), 1 deletion(-)

Just one nit: Nothing here is x86-specific, so the subject prefix may want
adjusting.

Jan

