Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACBDA4619D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 15:03:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896649.1305410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnHzt-0004DR-J2; Wed, 26 Feb 2025 14:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896649.1305410; Wed, 26 Feb 2025 14:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnHzt-0004Af-Fd; Wed, 26 Feb 2025 14:02:49 +0000
Received: by outflank-mailman (input) for mailman id 896649;
 Wed, 26 Feb 2025 14:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnHzs-0004AZ-C0
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 14:02:48 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b83b45f-f44a-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 15:02:47 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43aac0390e8so21530605e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 06:02:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8fc9b3sm5708093f8f.97.2025.02.26.06.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 06:02:45 -0800 (PST)
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
X-Inumbo-ID: 5b83b45f-f44a-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740578567; x=1741183367; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WAyU+UOSQCPZPx+y30+bUvjDtOXPSj0hXh/2dltMYac=;
        b=eWM8fAP5WL6zcjZFDs7XCQDtlmrITsx6XWMp+rJgvAoFDZQ2l3qcCsafmu64KmpX2L
         ARnYx/Exm0XHCdiYE9UvT1+9Iu6fjIT5xNkInjAdJrJB/QUU4gPGIJ44sqblw5C9AZnS
         VQhgrkLcihTpGu4+8tunUjLI5O8PcByQKYUVOBFyRQul3p8cDB4a4bIX1nfL71rMmRcH
         FGi4X97M2Jo40SaNYMSvbuHnGp7zmBFAgL9Y+dYvnzg6Q7Ra72tbCuGATeWPT33TJaC2
         8CR11HFDohfryablI6ZQ31fpPOKWGkA5gBoYT+Ll7iSwgZ84ZLjN7eT58Pgy2fhroRFR
         mkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740578567; x=1741183367;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAyU+UOSQCPZPx+y30+bUvjDtOXPSj0hXh/2dltMYac=;
        b=A+BD6tiUpxAyJa5U7MQdDFybnlLQWWTs6kd9R3Vy+SnBSzoSoGgjKt67RKnKYSX2iJ
         2DMVv7p/xikh5+Zx/+d0GrHLNA6vIE/oBiVTjx/bP7xbgIc7OYlNw/vQBttZYB/+aPRc
         AV0s1NFddUMAlDwYLTR7poHPpH0hI68ScWmfAntulE0TcGAiUa/JMfx6ZzYWy8tsRixZ
         kb0k1wJk0JMCpPQJFmy5JWTcXUP8l1h/30s4yHD10kn1BDz8l09ig2zCD2TPIfkSCIpk
         gqZJMVt8V10oZXzDDb/EMLTEXom/fZhlUg1VTatM2/8TCwTyVi0UJFbo7zA0gXMtlhI1
         GCHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQtXQLDHbk++QEQ8m4fkp3MSe4INgHK37txOkupne3d0VDU9WZyweZC/wQ22bj42CKdLvlwGQtZus=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmpMaplImc4wt0pfbuiISejMMsTomL1G2CiJRKtYfPj+RHDDnf
	vmx1kvR2TDFp2N+rgf6NqKejygjqawa2SfCBulXNmPhQjb2Y/mzJt/TK//BEkQ==
X-Gm-Gg: ASbGncu69m1B+6lwJyxzfZKNqNbm8SECDddjrCx5ktxyZDmuKwFCPxJzzwyssXi3vrD
	CiAJQdVMgY+TEzHRcBFutExe9RnDiJZs5s7dt+Co71LQ8OHEY858inF9LPYJ4Dc4zsmDk04jNT5
	cFoDJGbQx9KD7/mUuJjrDv9GX6QKdPYedxh5POpX71Fykgobiud9Dxa3QFmx2bmOa9H9jOXcUE+
	/1QouEJ4FO/DW33yVfHqkwx0V1Js7SQCldCF00fyd0FVrlGJFBUbNCVr+5dfdt6eFQv4yNQY7to
	/F/GTelwn9Elm6vCUG7wdR/YfM7vMm/vCJkuYWrKqVhbFk5y7dexzN3kdegMx6ziS9v+PYYt6nK
	XiBvhvt5W3no=
X-Google-Smtp-Source: AGHT+IF+0O7PDfcNL1pSYxlX1xlMLteoavQk9muHLUFZKSe4twl50ogeSWNzWAkO/M/C8EKQ229iOQ==
X-Received: by 2002:a05:6000:1844:b0:38d:b325:471f with SMTP id ffacd0b85a97d-38f6e9474bdmr20800625f8f.15.1740578566348;
        Wed, 26 Feb 2025 06:02:46 -0800 (PST)
Message-ID: <fde4d70e-d7af-4e51-a871-d4ac19737064@suse.com>
Date: Wed, 26 Feb 2025 15:02:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.02.2025 14:27, Alejandro Vallejo wrote:
> @@ -504,17 +502,16 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>          goto out;
>  
>      spin_lock(&heap_lock);
> -    /* adjust domain outstanding pages; may not go negative */
> -    dom_before = d->outstanding_pages;
> -    dom_after = dom_before - pages;
> -    BUG_ON(dom_before < 0);
> -    dom_claimed = dom_after < 0 ? 0 : dom_after;
> -    d->outstanding_pages = dom_claimed;
> -    /* flag accounting bug if system outstanding_claims would go negative */
> -    sys_before = outstanding_claims;
> -    sys_after = sys_before - (dom_before - dom_claimed);
> -    BUG_ON(sys_after < 0);
> -    outstanding_claims = sys_after;
> +    BUG_ON(outstanding_claims < d->outstanding_pages);
> +    if ( pages > 0 && d->outstanding_pages < pages )

The lhs isn't needed, is it? d->outstanding_pages is an unsigned quantity,
after all. Else dropping the earlier of the two BUG_ON() wouldn't be quite
right.

> +    {
> +        /* `pages` exceeds the domain's outstanding count. Zero it out. */
> +        outstanding_claims -= d->outstanding_pages;
> +        d->outstanding_pages = 0;
> +    } else {

Nit: Braces on their own lines please.

In any event - yes, this reads quite a bit easier after the adjustment.

With the adjustments (happy to make while committing, so long as you agree)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

> +        outstanding_claims -= pages;
> +        d->outstanding_pages -= pages;
> +    }
>      spin_unlock(&heap_lock);
>  
>  out:


