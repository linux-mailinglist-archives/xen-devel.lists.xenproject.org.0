Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF71E9E98B5
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 15:25:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851407.1265481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKeg7-0007xX-M6; Mon, 09 Dec 2024 14:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851407.1265481; Mon, 09 Dec 2024 14:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKeg7-0007vt-JA; Mon, 09 Dec 2024 14:24:03 +0000
Received: by outflank-mailman (input) for mailman id 851407;
 Mon, 09 Dec 2024 14:24:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKeg5-0007vn-NU
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 14:24:01 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3af2fac6-b639-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 15:23:59 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-385f07cd1a4so3047007f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 06:23:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef68b5272bsm6411984a91.37.2024.12.09.06.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 06:23:58 -0800 (PST)
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
X-Inumbo-ID: 3af2fac6-b639-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733754239; x=1734359039; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F5DZ+ock8zHt0R+/SU2irDxJUMssKf6St5OzoYVDPVk=;
        b=BXBReDfu9LKVsThRXbn3r/1lR5wBQOMEeGxl675aaDmfzLuXU5TNPnYaDb4V4hAyDf
         axVlg0WhrzBXl872/tNHTGEjqb/+FgCMSQ5P+j3USrknGwhPXgqavh7g07/LSWW+4nA2
         6svCFb4CvU66hrIemrNhVvzrMCaPp69V0V+WWq3t4y3KOBsqP2QmLdnNCL5x569/l6zl
         Wwje/qPQuWSewPcMc1NpmozHgVfbKOr0bdqjFSuCaccN1fcA2kQ0vfluHf4kAkGgQQjF
         ZoPRvN97+zQdA/kcvw+pslgEdzN55rCcbO+aWXnKssLcPTsPTpzYkAKp5CIs6WKL5hsa
         vuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754239; x=1734359039;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5DZ+ock8zHt0R+/SU2irDxJUMssKf6St5OzoYVDPVk=;
        b=YF664JljtgzLIxVgSZmzxVoMOpJHVvQb+E/DmamUIKwpMXMR8nmF9CGQJjQbZBt0SP
         D7mwQ7T20RtjbSk8/JNMfB0OEBp+h9TZj8rs0GkIK6LEYlr7093tSisenFYsx03RLxAM
         5NrzlVjkIhk6EgnoHAyFiFJ0ez+0LuGEeN72tz3GyXjsxmfWjxr/ZtB0mlS7V9+fRdCr
         zn9R/hGIZdk5yI8z+8dg0ZiD/2ErGHrknyc3vhfj6TZapoQkF6GMbOK/PZr8nOGVv9Xb
         9SWfgpRXYtWqKcalgbU8XNju9rnuITm+N+Mxu/5Vb3+EfV0INsY+suPNmNe9L8zly/+0
         iJbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMKMae3cQQ64MX9vjBuWO5WPkCLKbupPs/So84pmw6xuXd2X7/H1DBUlBicz8eP4DqW3H0IDUWgeQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbEN0ZF6xiEjvDUf3lNgNes4VaMJA1vOoU1G47FlIsRTIElobf
	mGt0Ocm9r7EWUorGdGZUoXt6TutwJMYCDijLpxYXCO4nG3ImpFA/f8DuCJi3Yw==
X-Gm-Gg: ASbGncv0DU9DLFIgZE7mWBvbKHqsV9TnQd4hgWDLLZ8+LwAXUdZriuQtAabp6bhC6Pw
	MDkO1XqiZBG3E2PRr4XuTwPpdlRkQmWl6nLg3aP5shKDyVn6pnzAGNqTPIq+9nSYhut0+ut+Ba9
	fsLqzSEECUfLdnhuo3lgeqIJrBf0leL6sjSR7tEpcRTbBBA1WCqbOEDf8gichusckjOFsT9NjMh
	2FKfadyjSbO7VvP1yogp9FE8MVWii16DUdcOqor3yC6cvk0HuARTuQw72SgYpjhqZ7P3ci/8KwR
	4WoaDfvPctF+l4HsIK/vA5TsA+oz5YO75QI=
X-Google-Smtp-Source: AGHT+IFppX50DV3BX7AecFmAA3NQDPtgFoSAx4oYg7nfJGxX92yUf54O3S30R2z//I0xxqcooS0mfw==
X-Received: by 2002:a05:6000:3cc:b0:385:fc8c:24b6 with SMTP id ffacd0b85a97d-3862b382d9amr10978658f8f.27.1733754238842;
        Mon, 09 Dec 2024 06:23:58 -0800 (PST)
Message-ID: <0640888f-3b9d-4f5c-9797-856374f16155@suse.com>
Date: Mon, 9 Dec 2024 15:23:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] xen/riscv: add destroy_xen_mappings() to remove
 mappings in Xen page tables
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
 <eed2acbf660cadbfb267e7854e9f67eb382cc966.1732709650.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <eed2acbf660cadbfb267e7854e9f67eb382cc966.1732709650.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2024 13:50, Oleksii Kurochko wrote:
> Introduce the destroy_xen_mappings() function, which removes page
> mappings in Xen's page tables between a start address s and an end
> address e.
> The function ensures that both s and e are page-aligned
> and verifies that the start address is less than or equal to the end
> address before calling pt_update() to invalidate the mappings.
> The pt_update() function is called with INVALID_MFN and PTE_VALID=0
> in the flags, which tell pt_update() to remove mapping. No additional
> ASSERT() is required to check these arguments, as they are hardcoded in
> the call to pt_update() within destroy_xen_mappings().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

However, ...

> --- a/xen/arch/riscv/pt.c
> +++ b/xen/arch/riscv/pt.c
> @@ -421,6 +421,14 @@ int map_pages_to_xen(unsigned long virt,
>      return pt_update(virt, mfn, nr_mfns, flags);
>  }
>  
> +int destroy_xen_mappings(unsigned long s, unsigned long e)
> +{
> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
> +    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
> +    ASSERT(s <= e);
> +    return pt_update(s, INVALID_MFN, PFN_DOWN(e - s), 0);
> +}

... I'm unconvinced the constraints need to be this strict. You could,
for example, very well just avoiding to call pt_update() when s > e
(or really when s >= e). Thoughts?

Jan

