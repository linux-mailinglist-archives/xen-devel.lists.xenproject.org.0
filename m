Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEBA973AA6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795762.1205253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so2H7-00037n-Dt; Tue, 10 Sep 2024 14:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795762.1205253; Tue, 10 Sep 2024 14:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so2H7-000352-B3; Tue, 10 Sep 2024 14:55:25 +0000
Received: by outflank-mailman (input) for mailman id 795762;
 Tue, 10 Sep 2024 14:55:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so2H5-00034w-UO
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:55:23 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4bd260f-6f84-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 16:55:23 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so1036421e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 07:55:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c624efsm491451066b.114.2024.09.10.07.55.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:55:21 -0700 (PDT)
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
X-Inumbo-ID: b4bd260f-6f84-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725980122; x=1726584922; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lM9ppPUZpmZcqyhWzBs/85BslGanuu20I06h7Dd+Lcs=;
        b=TAlwhkk5/kRV/YE7E7G7sKTPpknSpSHctsN8ZuTFq1WlFkGzRctjJqrtUWU/MxqRHr
         84OC5cKjsQzm+cULn0z53myaLwm1ygLxkhsQ8lgsnpKT7Q4xS9XItgaqRnqaYjooT9Ub
         T+a248E2ahntmIssBzuIQQrvCpKlmmkXSIkw+o6IBuu9y0NIe73eMxvhD83zmp2E/TxD
         9yAeYvKc4b/Y09vOsDfwXiR/jIpjJT4fXW133csQzkUeKO8JAYXHol/AN9MerX2p3NM6
         55/B8NNvGrH8QmV1G93cLccYuPulQSe5ctX5GJ4Qcwhu4mGT6bFPTGW+vERfKuYpdSiS
         wt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725980122; x=1726584922;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lM9ppPUZpmZcqyhWzBs/85BslGanuu20I06h7Dd+Lcs=;
        b=Jj2dsJCZKBF3o32JCFDp39JOMG6X8e6aarYbrTLzFyBxpws+PfGmoKl7q+74nqShZQ
         /U2L4lqeMyb1+i/6WoxfRKkKwVDl1+ZqXycNduO0k/plqx3J7osKfjiyUFIGMkVd3k0U
         Nt2D3KSE4f+oKZIrZouTXqycNAV22kgkptF9v+/fQTyZmLebuuzB2DRwekIOaFDEKXp+
         Amz5e9u/K1P1SOcuFg0HmiLtT5O3Y4tnnOCKQmQoWWXvgpG2p2XZhgpRUpF/W5WI6g1s
         GicIRCEBOo4AJ+DfSp2N1s+pm9GDm0k51GlaHC3w6Nu6gZCffZzz+jpgcGxQaj0MFc9B
         BAtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9NeVnBwG9FTlcj4y6Hpkrd0FSobZEM+GLzIuCRezp7RKrGn3NPqwYF++Ae9yH2NkriILxjmqCWnk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yze8dDx4vUjrEEd3v30O2RRsMqJyG3yukhjJxOMEGTEaTlEyeU1
	MknVnGuQIXE47kOfHoFq8sbypGdleAO+dxl0sgYcMx7kTpyABRXikd5dZeGpaQ==
X-Google-Smtp-Source: AGHT+IELRKstnVpMI/rvzIJgYJSPZyPfE3foH0JOYEVNXstI+4kKWgKhjes/ffxpvX/5hbZekIM5oA==
X-Received: by 2002:a05:6512:2202:b0:530:ae0a:ab7a with SMTP id 2adb3069b0e04-536587abf19mr7374125e87.17.1725980122208;
        Tue, 10 Sep 2024 07:55:22 -0700 (PDT)
Message-ID: <96062540-8265-4d50-a7d1-767fa608e8ea@suse.com>
Date: Tue, 10 Sep 2024 16:55:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 06/12] x86/mm: address violations of MISRA C Rule 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1725958416.git.federico.serafini@bugseng.com>
 <0773f4b5678ee340af201b454e37178e750cbd8d.1725958416.git.federico.serafini@bugseng.com>
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
In-Reply-To: <0773f4b5678ee340af201b454e37178e750cbd8d.1725958416.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 12:08, Federico Serafini wrote:
> Address violations of MISRA C:2012 Rule 16.3:
> "An unconditional `break' statement shall terminate every
> switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/arch/x86/mm/guest_walk.c     | 1 +
>  xen/arch/x86/mm/hap/hap.c        | 2 +-
>  xen/arch/x86/mm/hap/nested_hap.c | 1 +
>  xen/arch/x86/mm/paging.c         | 2 +-
>  4 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/guest_walk.c b/xen/arch/x86/mm/guest_walk.c
> index fe7393334f..bc032d697c 100644
> --- a/xen/arch/x86/mm/guest_walk.c
> +++ b/xen/arch/x86/mm/guest_walk.c
> @@ -497,6 +497,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
>              paging_mark_dirty(d, gw->l4mfn);
>              hvmemul_write_cache(v, l4gpa, &gw->l4e, sizeof(gw->l4e));
>          }
> +        break;
>  #endif
>      }

This wants inserting after the #endif, I think. If you agree, I'm happy to
adjust while committing. With the adjustment:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

