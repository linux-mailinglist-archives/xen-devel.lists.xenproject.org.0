Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E12CB13C7A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 16:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061602.1427206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugOXU-0007XW-K8; Mon, 28 Jul 2025 14:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061602.1427206; Mon, 28 Jul 2025 14:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugOXU-0007Ut-HJ; Mon, 28 Jul 2025 14:09:16 +0000
Received: by outflank-mailman (input) for mailman id 1061602;
 Mon, 28 Jul 2025 14:09:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugOXT-0007T4-9H
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 14:09:15 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 704ab6ac-6bbc-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 16:09:13 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b78310b296so962620f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 07:09:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011bc0b00sm29478555ad.69.2025.07.28.07.09.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 07:09:11 -0700 (PDT)
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
X-Inumbo-ID: 704ab6ac-6bbc-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753711752; x=1754316552; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AAg4oiCrpu39oH9OfzOlBSa3If3xpnbscOkDRd7amYs=;
        b=LiEYhU8iE+cMaLskLLFfseaT3HTpBX2dljWFQa6DG6h8fOF7sWD0tPIlrtDGxTxfL6
         fpSh32RjIqahYBxmdjbXthTEl9Gahp71S9Pt3NEbx/HbbcIM0iyUn1H0LctVqOLfyJLN
         NQlebBtTdwx0y3LQNf7ucUh91kw8nA8Vgh9VE+5ca4ZN7o8OVkA9lvATyGXc5wHNgdSF
         UeO+B0dS7XBmibDFgKgI3PGDvI57s/TrVjYy9hrcvDz1eZkaYoUvR1s5lUeY44gaoczX
         GOjker3eMuQ54CC/KAGghV5I4vHRbm1KdgVPxAjRgEwVjfcSaC5FuaM/RKg+zV/weTBj
         lhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753711752; x=1754316552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAg4oiCrpu39oH9OfzOlBSa3If3xpnbscOkDRd7amYs=;
        b=KOmA4WV5jjX0qXMZAb9yxLtROSN0byrlxuPbVdWvseqTVfJ9v8JJEl5LBRPDrCA/RQ
         FJ5c+QMIJAeVTukK0/0hup3nuCRdDgEkgYOFo5aAXmcY9uPN0qXUZ4T2rywsp/zNpYtT
         qsZPMfvrGMjWFKI4D0NwtmVljaQm9q+Sfqs4MtgZ6nJydNh+H5NXccsLi5O2+tcCOjEM
         eWaUlZ8rzMQFYfWfSrQSivB39SHIB3im6oH8Bsm4Y0kqABCKlAAlyJeJ+DQrBx94XlaY
         taN5I4W0PY3WhlEyM16H9/Q+M/+DbVnQk7096+fGrOQ036M6sMjG5xbg9qgo/V4PrCxT
         L6RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVyZlGxpoiz+F/6J7xBtcoNXk88g82BZrdNzi/yI6X3N6lEVO4gaqpH6ves78YuwgptXOBMYIrHSw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5t89YSFLMY8V5d7rxqufsZSbIKwFuJVng88bky7BCHVx1DNxL
	R+COYNjrUdsGlRpt5EhL8GdMlGN4Wgsov5oXQmUA4FkEtKzxKqqYV29aPXfGU9lwQQ==
X-Gm-Gg: ASbGncvHMORZ0VNC5ypcMUnzLYCqI/nkCR323HKxHA7o24FwGF2l/ILgHyq8QFe2O/5
	HuvI88BbjwWrOouWg3LdGA2T+f9JMCdBCCFOjddDC9gC3RgVibVT3znCTi2zr5EOX0tJYz/vMWM
	5u1XNsGYTryT+a9lKZEuVpMPS3RRx6dlWeQe9zL7U0Hwi7rX5je+Tn5iqqVxxX92e2CggLvPFbD
	u9y1Dl18xrvY7I2pcB9vVXLy5wqF9MD3E/xG91xb0Om8WadOrNKMSaXg6g4o8bee5W9z0FkUQl1
	PG26gjPwJs0p6Xm2+cgcBujW3A+nv12swEG/t2rnuksoyF7mPb6/ebL7SdvKXa1dmW0vAWMzEg6
	etjXcrJJgN/4AhOLF27Xd8TFHJY951Cpmqu+q7SYh6Luy4ZLlVyyWEblphW7PtiNXuf8WsFakGv
	fW7cJZn/LMX9kdtO1XbA==
X-Google-Smtp-Source: AGHT+IHs1NdI1c4z38jNb8C0WYllNQYiNUVSDKmIlC4EyGk+Nw+c1EDHISVQXDr7qsvpcBXbsBSWLg==
X-Received: by 2002:a05:6000:2401:b0:3b7:8851:659 with SMTP id ffacd0b85a97d-3b7885110dbmr2255168f8f.19.1753711752185;
        Mon, 28 Jul 2025 07:09:12 -0700 (PDT)
Message-ID: <7705ed0a-7fbe-4e0e-8752-2acd0a76583e@suse.com>
Date: Mon, 28 Jul 2025 16:09:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 1/2] mm: provide a way to do very early page table
 allocations
To: Juergen Gross <jgross@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20250708063738.18994-1-jgross@suse.com>
 <20250708063738.18994-2-jgross@suse.com>
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
In-Reply-To: <20250708063738.18994-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2025 08:37, Juergen Gross wrote:
> Add a small pool of statically allocated memory pages to be handed out
> for very early page table allocations.
> 
> This will make it possible to do virtual allocations e.g. for mapping
> the shared info page.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/mm.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/mm.c b/arch/x86/mm.c
> index bdff38fd..3f5c7ea7 100644
> --- a/arch/x86/mm.c
> +++ b/arch/x86/mm.c
> @@ -640,12 +640,17 @@ void change_readonly(bool readonly)
>   * return a valid PTE for a given virtual address. If PTE does not exist,
>   * allocate page-table pages.
>   */
> +#define N_PTS 4

Wouldn't it be prudent to have a comment here mentioning how this number
was derived, i.e. what's known to be covered? (To map the shared info
page I expect you really only need 3? Hence without a comment things may
remain unclear.)

> +static char early_pt[PAGE_SIZE * N_PTS] __attribute__((aligned(PAGE_SIZE)));

Maybe better early_pt[N_PTS][PAGE_SIZE], simplifying the allocation
code below a little?

> +static unsigned long n_early_pt = N_PTS;

unsigned int would do, I expect? With the suggestion above this could
then also use ARRAY_SIZE(), at which point there would be no real need
for N_PTS anymore.

>  static int need_pgt_func(unsigned long va, unsigned int lvl, bool is_leaf,
>                           pgentry_t *pte, void *par)
>  {
>      pgentry_t **result = par;
>      unsigned long pt_mfn;
>      unsigned long pt_pfn;
> +    unsigned long pt_addr;
>      unsigned int idx;
>  
>      if ( !is_leaf )
> @@ -664,7 +669,16 @@ static int need_pgt_func(unsigned long va, unsigned int lvl, bool is_leaf,
>      }
>  
>      pt_mfn = virt_to_mfn(pte);
> -    pt_pfn = virt_to_pfn(alloc_page());
> +    if ( n_early_pt )
> +    {
> +        n_early_pt--;
> +        pt_addr = (unsigned long)&early_pt[n_early_pt * PAGE_SIZE];
> +    }
> +    else
> +    {
> +        pt_addr = alloc_page();
> +    }

The failure pattern when one fails to increase early_pt[] is likely going
to be problematic. Wouldn't it be better to check for failure here?

Jan

