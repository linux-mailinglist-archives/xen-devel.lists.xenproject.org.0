Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAC3B1B192
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 11:58:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070253.1433959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujERH-0006qM-3I; Tue, 05 Aug 2025 09:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070253.1433959; Tue, 05 Aug 2025 09:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujERH-0006na-0V; Tue, 05 Aug 2025 09:58:35 +0000
Received: by outflank-mailman (input) for mailman id 1070253;
 Tue, 05 Aug 2025 09:58:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujERF-0006nU-7d
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 09:58:33 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be8d30a9-71e2-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 11:58:32 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-af934d7c932so582164166b.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 02:58:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a078a11sm892226266b.7.2025.08.05.02.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 02:58:31 -0700 (PDT)
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
X-Inumbo-ID: be8d30a9-71e2-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754387912; x=1754992712; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bFmMS+yUv8L/ynG0NcGXlcHupF4SHptUfZfnvFPWvGM=;
        b=dSJQ3nSM0C3CKpfiFYYsEq6Xnc0BmqRLJCeavRBKPP9O4LLkWggLg49OAldMowiO9I
         dk/cA96cLmdq72/fqBqgTVOotns3XG7mGOEjDA/njuXG8yngPXwtw/w+ciDje7zjc7YL
         nOBMiVudTQevu3RZqvA4ayYjv4Ep/waHqgxP3KfUL5D8ErC08ff2wpRnh7Raii+TUNbc
         R/czL2hgmNedJ+y1TpFk5Q/9sf6vu2SoT6eKe26hjDTIKALrz+BCvavX9AtQfFjZGN+W
         B9/ru3CFXz0JnxevSQWt1/HuDxIjaHJ9HKeR4SrS0VeA2VgwyOMyo+4u62PPg5clH/mQ
         fYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754387912; x=1754992712;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFmMS+yUv8L/ynG0NcGXlcHupF4SHptUfZfnvFPWvGM=;
        b=gvvnjSHlFtnHTEOSvMGdjOk7Igd+7pnJElsxmjolDxaas810qVqk1/ivW6KIKK54Ms
         CVEPi/eejvG+t9TFg8glFee4HB1M9mWU5OGVMydw++VdmrkAGJ+wWsIIul/pXJ3CdiLn
         0EgMpgwNPoz9EHlBNTBzBKIuU1NGb8SIg+tFI8ZqvcWTN3o38JcewCbJfFtSr3IZL5rZ
         ruurf9t9Mb3HwKU8oXViUkTXOjiMquMhXYuKQiSx8rQ4SULyBCp+d7jUUBFDXj2ex0+7
         i32v6OXlgTziz8jAPvuCx8+FqkTjxbl/2iJG8nnu6not1eeV9vbeMgZghtmURVo/qXtN
         KB6A==
X-Forwarded-Encrypted: i=1; AJvYcCX3h+sZjYbZvXInNDaYynZVM6Nxl9+p9CcEqRoUS94/9IejWIMXhv569kCZQ7361MsW63HLW2FbcXM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCaCvV65dwGFQlNEJXKAr5KN9FTPJ4ZfH7z41se151pDb6pAYZ
	zLA0pXcNZDLq//ghoZjcx+ZRJDy3XeSNAnuQkGBTwLprYR++pySS7DFmbTQdPCdfpw==
X-Gm-Gg: ASbGncvatYGLkywTLUA8imZoRIyPVGJZylmSRrg8lYUtJd2X3gMeqGjmSu+uU0VfOFD
	4kYJ9OwII8V7sCMl7Ov4BetSkQA+XmH1fTw0YPHqSYoMsiuMiSg8zO0dKpk0LnEmV/ZmOsMRDGe
	OrpFI/zElHTCP+gMbJk4QyaJgKqagd1f1Jg+Ka8X+S2ozuZLrC4jKHmFd+fBKFX/OV1XxjLJ0q7
	MI5ZdWozpxgLaa8MWVEDWyXCwhl9vxfPR4kPmSx52uqac8zyzc+JgXlwZxCnuzuRgfEpe6+isdi
	lp8gU4fxb5QA243MthKxp3RNh+RKnwpuv2xdzrIqi2961bfTYGrQBcpQJ+bOk2UOEM+Bq9+Sh32
	Li8rEatZ1NN8+ViadJtZ9Pylt1vi2ldlvWaAecPzg8uSvDvf5laSw1NmmA3+XWkLR2yC9uHawIB
	PIMJmfogk=
X-Google-Smtp-Source: AGHT+IHupIrEWsBNGQcRhV+jfIGYt0WzCfM7AE2IoLjnHLFRf3ef/4RmguEBGYdgiKduc91l9kXRzQ==
X-Received: by 2002:a17:906:c149:b0:ae6:e0a7:234c with SMTP id a640c23a62f3a-af940156652mr1299570066b.33.1754387911734;
        Tue, 05 Aug 2025 02:58:31 -0700 (PDT)
Message-ID: <22e33697-b1a0-47a6-9294-9b7dc8e567a4@suse.com>
Date: Tue, 5 Aug 2025 11:58:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/25] xen/x86: complement PG_log_dirty wrapping
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
 <20250803094738.3625269-4-Penny.Zheng@amd.com>
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
In-Reply-To: <20250803094738.3625269-4-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.08.2025 11:47, Penny Zheng wrote:
> --- a/xen/include/hypercall-defs.c
> +++ b/xen/include/hypercall-defs.c
> @@ -198,7 +198,9 @@ dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
>  sysctl(xen_sysctl_t *u_sysctl)
>  #endif
>  domctl(xen_domctl_t *u_domctl)
> +#if PG_log_dirty
>  paging_domctl_cont(xen_domctl_t *u_domctl)
> +#endif
>  #ifndef CONFIG_PV_SHIM_EXCLUSIVE
>  platform_op(xen_platform_op_t *u_xenpf_op)
>  #endif
> @@ -294,6 +296,8 @@ dm_op                              compat   do       compat   do       do
>  hypfs_op                           do       do       do       do       do
>  #endif
>  mca                                do       do       -        -        -
> +#if PG_log_dirty
>  paging_domctl_cont                 do       do       do       do       -
> +#endif

While putting together my pair of patches, I figured that using PG_log_dirty
here is wrong. asm/paging.h isn't (and cannot easily be) included, and hence
the compiler will consider PG_log_dirty uniformly 0, no matter what .config
holds.

Jan

