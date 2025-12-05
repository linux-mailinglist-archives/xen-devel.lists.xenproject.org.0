Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33529CA710D
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 11:05:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178598.1502348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRSgA-0000Yh-0u; Fri, 05 Dec 2025 10:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178598.1502348; Fri, 05 Dec 2025 10:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRSg9-0000Va-Tr; Fri, 05 Dec 2025 10:04:45 +0000
Received: by outflank-mailman (input) for mailman id 1178598;
 Fri, 05 Dec 2025 10:04:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vRSg8-0000VU-D6
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 10:04:44 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1d87144-d1c1-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 11:04:43 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-42e29739ff1so831518f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Dec 2025 02:04:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe8a7bsm7860382f8f.4.2025.12.05.02.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 02:04:42 -0800 (PST)
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
X-Inumbo-ID: d1d87144-d1c1-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764929082; x=1765533882; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iBQnP8xcieGIPUKoxaA09ieaCWnBABipBnTgPxfgydI=;
        b=T4X7npmdCTKZBdR9tAzxPg7en6KeLRpy85/OlB2xRJh66j0lgg1YXLoUWmj6nta8MG
         4LkdIT+k/wVuQxpV7YIVhqGEdFTX3Qoz7nN8AIH7SxqvF/tz6KClIXf2RhDj6wQBbx9s
         nY7wwUPW8KDY4jTL2Z2qVAs1aKh9i642/zZzPXgHxJMiG+r/MQC+fvfbG7lT1icdtcHX
         dFZs/P2kpMYoixCyRRZifYhs4+ivn6knbskOuT3sj/ehcnxOt30IULRpUEWlhpdss1ko
         5Rnark3whmasF5A6cB9Xg1rzzENTJnBr5dVBsca8UFom7VHQQOnImoL8LBfIWpzjv77F
         FXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764929082; x=1765533882;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBQnP8xcieGIPUKoxaA09ieaCWnBABipBnTgPxfgydI=;
        b=gilPMP6UuoEvK7ePz5HlaudXi5+X0fTpO5UgO1dUBh6tkc49nF6FehT/Ix55Qffwnu
         AE9yXp9nnLJcGaVlzdQ9z8FFXXtBF8Ck3etaDEuPlu/GiFcllhn3kgk7Jmy1M5goRdp5
         fGVCKocyNnivfygYuqjuYFcfIkjLcjU0CefUBx3enj9DzavzjlP4l2Dd/p1rTCAXyus7
         bG/GZh0pyZEsfoVm6b8u+yvYAjejRCbVn0GwC0UQAI/lem0Umo687MP3XKG2OngeGIso
         roi1nUXrz9oHSzd2qwNBUy165vFzVDvTQevOiOejNB4ieWuTRcXPszW34BaihHeZAS85
         EWJg==
X-Forwarded-Encrypted: i=1; AJvYcCUoBiO3rEAOegqZIuMU2rVh14bErLnTXQCm2BLN3cGhqzLc2iQpgFzhh6h/DCjIIYSZiqEcvBJqNLM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXI2n6FyJVePu23gWkNJlW3DLva10cmFOslkwlzg3RO7IhgMSH
	OPiCfyX+JRCQ97pIkD0YAgqVuuaKQVxl1kftIQThUI1wR9RWkXtJ4khYmnur1HOhQg==
X-Gm-Gg: ASbGncuuvFi853rMPLIAFGkeuMpsXcvHycvW5xmCk3xFbjPQ18XHDinKQnhIBFkfnyn
	kke+TLHMOpClvOu6RserPrGZzeCtFDuckZDRZfo6sJ9rc6V7LefEgTMJ2R8yaams227oo41LskN
	+FpTMRofYU5dAI8ykgD+OKVAP1Znhq5WTemnkJ9A83G24qJN1xRYGFuJo9SNvg0jJp8xiRTlHIB
	Lr1Nkzc1QDF8dddP23Aub/ReRt4XOF6jZZ/I7TvnbToQJYEcXlwG2lxZHWzXuMO1Pf10i+aHVbw
	NlWPx6VOI5B8M6A3e8Mqfp/sXxdQJap+V1io0oLji3frrkpHf7Nu0fdmVhL2ulj0CgxnkLYo9Au
	cFP4dsmEMpEFS22bSUXeXLDy7X2AjVOe2iyTn5AplHHAwbg4efDieOqmTej3zs17DCFoGFkEAy6
	fiTVxtiBxRrnD8YeuPyKG7TKDwlaf0DzQmIKppTVRN3jyZiHPlhX2bYv8G3nKuQ6tnBYEbHwGFN
	p4=
X-Google-Smtp-Source: AGHT+IEynt2Q+8Q4NPCAEhNauQSBxVPjAMuxsa1WL3rR851PPwmPjYsnBZnIFFPr44zlDgm/pDnUbg==
X-Received: by 2002:a05:6000:4009:b0:428:3d14:7378 with SMTP id ffacd0b85a97d-42f7887dd3bmr8029877f8f.24.1764929082349;
        Fri, 05 Dec 2025 02:04:42 -0800 (PST)
Message-ID: <6922a720-cf38-4904-91d7-5bf2ee6abdee@suse.com>
Date: Fri, 5 Dec 2025 11:04:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: be more strict with XENMAPSPACE_gmfn source
 types
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251205093151.56207-1-roger.pau@citrix.com>
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
In-Reply-To: <20251205093151.56207-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2025 10:31, Roger Pau Monne wrote:
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -2007,11 +2007,15 @@ int xenmem_add_to_physmap_one(
>      {
>          gmfn = idx;
>          mfn = get_gfn_unshare(d, gmfn, &p2mt);
> -        /* If the page is still shared, exit early */
> -        if ( p2m_is_shared(p2mt) )
> +        /*
> +         * The entry at the destination gfn will be created as type p2m_ram_rw.
> +         * Only allow moving source gfns with p2m_ram_rw type to avoid
> +         * unexpected p2m type changes as a result of the operation.
> +         */
> +        if ( p2mt != p2m_ram_rw )

As asked before - what about p2m_log_dirty? Imo that needs permitting here
as well. Making it become p2m_ram_rw is "natural", as long as the (new) GFN
is suitably marked dirty (which p2m_add_page() looks to be doing).

>          {
>              put_gfn(d, gmfn);
> -            return -ENOMEM;
> +            return -EACCES;

Since we tried to unshare, imo ENOMEM should continue to be returned for
p2m_is_shared().

With both changes:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

