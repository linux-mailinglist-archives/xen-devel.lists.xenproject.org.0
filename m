Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300CED0200D
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 11:03:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197522.1515038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdmrK-0003Xo-1F; Thu, 08 Jan 2026 10:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197522.1515038; Thu, 08 Jan 2026 10:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdmrJ-0003VU-Uf; Thu, 08 Jan 2026 10:03:13 +0000
Received: by outflank-mailman (input) for mailman id 1197522;
 Thu, 08 Jan 2026 10:03:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdmrI-0003VN-7x
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 10:03:12 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c629173-ec79-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 11:03:09 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42fb4eeb482so1621922f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jan 2026 02:03:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dacdcsm15340831f8f.1.2026.01.08.02.03.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 02:03:08 -0800 (PST)
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
X-Inumbo-ID: 3c629173-ec79-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767866589; x=1768471389; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UNuYZwH8h1q2oNnu9s/lOsrMvN1+lGYi2F0HOhczA7A=;
        b=OwQJZO5SU0W0VIQgwBgc20l7jduy/rNYfIUExQgRnhD6d4FYHBKAJPEWd7W2YDs7jv
         msAjZuSIIBPk5QF1TVzwo7DnzxVjbJtzo+O6ADUoibTT3XNvP+QZ0nyvtyBGk6G3SycK
         waRJ/H8ezit5Yah1T6sj3zxa9PYFCgbbM4pyAFXvP7uA0TFaTU8OIUjqCkzXCJA8gQRI
         9REa4LVwmfhvlDAeQ9R5fQt52Isc997ZM7OUKYVFDe/WR8p0BDsY7XOMeZx7p0s7P4cp
         00n6tuRraZefpAnFiRqsSbCmFf+ywKhKZPX0+KqCp9E4RNMt8Iebsat8QUjvFJq9NQVd
         fgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767866589; x=1768471389;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNuYZwH8h1q2oNnu9s/lOsrMvN1+lGYi2F0HOhczA7A=;
        b=Q9/cNd3xaBJgmuXkC9xY4enQ21mx2SrjDz5jFmwbtgaYh6S/3z1nCqAWR7li8oVFIv
         2MrlYgk0k5FQZxkJxQkWJVIH5HejCiDSvEg7zXK+PLuodLWBHjbhx7PQ3GYkKfuR/cuD
         NvWBTwZN6yCVAdFlv9DFLRtOvIMLnTPObsvhaVAjrccyz/miWu53hmruYN27JrcUl3NS
         Oe4WraDlO9QlIyY0waJY5DWv323J+/EjfssuXGn7zFm87Jk7NL9N0wlHkrC0SfBwoMxe
         wnDAc5n+P1X0Zdz3dz548GNznl/gy468tixbQqUNbcXh4gQ7IWBapIrqvxOR0CTd6Wuy
         2JtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB4Mzp2DBvMdgZoEuqfUNZncLUMdQFxOUkQz4s2nm9kZWUDiZzAj2bnzYdUkIp+0bw+3O4duYGGLI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyvv/GpBEeCJlFADlGGk0RXJTw9GDOYTM2sz26jsOpDfgIgL+XV
	ur2ml0FD/OrIjOCb+wUThv5VxV57+CG0XVcoK7NW8/lij11W66YTQkp6r0tdvAyCcQ==
X-Gm-Gg: AY/fxX7dJ1zm2ZGsHzz5mvLjHVmKG5fF0xoYcXgCppJ1/0U5SxIJ0v1r+Yp1/ErzLUu
	10+UdrRY/ScPNrkAuRY22UfoNKbg4MdUpoTrp8lD1fmkDJFOs19ew3qpF1hy0l/pAW+bAFvcD0W
	7FefEMsvSurpypmU39GaREDLUqZC2IIWnRRxYY8YiHs8VjFDTyz1osM2T33G1wuXdk/NltV+cQ4
	RS3ooUgthvTTvdsjTit6pO49ZpQVz6xorJ2Nh6O8Rxh2VT3wPNRlTOCyHoYVkDv0MlgcZtQQsyw
	XDmJd1V2J8xtR6LzEYDZ4z8LTMhI+vwn7GPHjXrmYvPPlCYChaMEalOU06yPeAz4CDf/i4eLneX
	tS6GJckq+VwkgJfZr60fZchwKNDG+tLhXdXfYQiwOHZfQvmjrRA+2/8KUHYpp3ujjwW4sy8Lkxy
	OoYweGiF4sI45fMVOK1SokAWJv9mEEzqYY8Ubsnw1g9FZJKabUzgad9VpkQ6rXCpGUVajrPM/GU
	uY=
X-Google-Smtp-Source: AGHT+IF19+UlFIfLWMBAwdJbzaux+pSkOxVIZ19BXeVovwd6a9WoQqxCrV5qu8mEAzIJ+Oxe2xjiyQ==
X-Received: by 2002:a5d:5f88:0:b0:431:5ac:1ea with SMTP id ffacd0b85a97d-432c375b0d2mr7867102f8f.39.1767866589124;
        Thu, 08 Jan 2026 02:03:09 -0800 (PST)
Message-ID: <8fc2afae-ea14-4221-9fa7-ffb35e34b56c@suse.com>
Date: Thu, 8 Jan 2026 11:03:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] xen/riscv: introduce metadata table to store P2M
 type
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1767803451.git.oleksii.kurochko@gmail.com>
 <6e5008eb873efa97e9e6174165633c50f52294e0.1767803451.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6e5008eb873efa97e9e6174165633c50f52294e0.1767803451.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.01.2026 17:32, Oleksii Kurochko wrote:
> RISC-V's PTE has only two available bits that can be used to store the P2M
> type. This is insufficient to represent all the current RISC-V P2M types.
> Therefore, some P2M types must be stored outside the PTE bits.
> 
> To address this, a metadata table is introduced to store P2M types that
> cannot fit in the PTE itself. Not all P2M types are stored in the
> metadata table—only those that require it.
> 
> The metadata table is linked to the intermediate page table via the
> `struct page_info`'s v.md.metadata field of the corresponding intermediate
> page.
> Such pages are allocated with MEMF_no_owner, which allows us to use
> the v field for the purpose of storing the metadata table.
> 
> To simplify the allocation and linking of intermediate and metadata page
> tables, `p2m_{alloc,free}_table()` functions are implemented.
> 
> These changes impact `p2m_split_superpage()`, since when a superpage is
> split, it is necessary to update the metadata table of the new
> intermediate page table — if the entry being split has its P2M type set
> to `p2m_ext_storage` in its `P2M_TYPES` bits. In addition to updating
> the metadata of the new intermediate page table, the corresponding entry
> in the metadata for the original superpage is invalidated.
> 
> Also, update p2m_{get,set}_type to work with P2M types which don't fit
> into PTE bits.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


