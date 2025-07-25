Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C276DB11868
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057203.1425164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBnO-0005Fg-3M; Fri, 25 Jul 2025 06:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057203.1425164; Fri, 25 Jul 2025 06:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBnO-0005EN-01; Fri, 25 Jul 2025 06:20:42 +0000
Received: by outflank-mailman (input) for mailman id 1057203;
 Fri, 25 Jul 2025 06:20:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ufBk7-0007jJ-Dg
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:17:19 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03c58bb1-691f-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 08:17:17 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso1186582f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 23:17:17 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2ab:e91f:46e4:60d0:c444?
 (p200300cab711f2abe91f46e460d0c444.dip0.t-ipconnect.de.
 [2003:ca:b711:f2ab:e91f:46e4:60d0:c444])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fcad29dsm4039908f8f.49.2025.07.24.23.17.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 23:17:16 -0700 (PDT)
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
X-Inumbo-ID: 03c58bb1-691f-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753424237; x=1754029037; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UOH947+s13FvvyoaYc5KqvMY/o70eMDPzdZDg3I+QUA=;
        b=bQNGP3UHrSim1s35wyn3WIEukbVl8E9CAqNG6sBz6W90FnMKfp/6hHgBTlNG3ZAPG3
         f1sHAwLJshrk1VCFarPhJTKh3elyuNo5VTpWJFvS5b7ht/sFmUYY8kxm3GchUAGx+LB1
         eG1qrbi1HTB4RvWI+AG0glrMSt/xPYeI8LxNmtt6dxxoQn5Ed7EmQ3O6ORq5iVxYW6bR
         aEmmfXLXlyNZ2an5I3V9WCxMYiSdtGqgWoNtr1EwV5s/JWjZWHUaYl5NScQ65b8DjcwO
         pPpzRuQGU9CQ5sgagCZdbdRAH4VG4qTYdgzdMlEHWEWqL2e70eL/9IZdfW+TGUyUl+XE
         J3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753424237; x=1754029037;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOH947+s13FvvyoaYc5KqvMY/o70eMDPzdZDg3I+QUA=;
        b=dBG2qXP7Uh9aQQZYHH4S2uqW7oIPhEuWlF9ITcnTTxBlkvnjz0P98t9nSJJWwTptaf
         pgjNJpopfVuWKp7dZPczelFTYsySv+IEdJcZF8Pu/fzH0vUn+09YpPZocfQZipnX8RC5
         eobFgaXkiw+c5kZp8IN3F6zVydhy83zijk0aXZ75rkbQ5zpjKuioBGtWoCFHVyUErSV2
         aEWLrqxe4jT3uUdQQJ7OP3Cy+HNBy3OG3Y6E/OQ/oZgdFyju8EyL2LpYL0MsMQNrsvtY
         Z/arXfqov0lvnxr/zaW4Z+kqfD0lGeiGbrhgrhv+xcGWTL75NnhiPrDxeI+NnglIT/qD
         K9ng==
X-Forwarded-Encrypted: i=1; AJvYcCWlL0AS1AjxSdmqjzl9L+bn8INjkL2d/dQX1itrMttIOr1icfxp2r5gtIFlysnd2Z/nVy79xEx8Q5U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4E4uNz8RMpMKHNqMy1ZD4tBbuCrOOdJmS04AvDVtbX6aTuA7E
	5hty4lV/UGuQK5XCiYWnv4tczULBsSsLEz2xBtxW9AAZOkVUEVFu2ggAyujO0pdpug==
X-Gm-Gg: ASbGncvL+aOiBnxOgfo89T2XWU+FX6xnS7fMlHPxM3iHCqG0JtpJvZtO+W66uQRwMBA
	9zGEV2BIOtJK2Vc/xDAml0KrDBrGe6vuPk5amgPTs4lBSbPOoVIJ8ftcfNb1BuFPrViGGHZrY4L
	jg26qYEEvt0xyRsHAotSwvNTPrTqmmVSfmLX9ACzPYxRyM3Dx6XCL0HVMPOt2VHyyMg48E6uP+Z
	CzT6/3JSOb9XW+9MdVFEBZVInFat09gGTZ1BpicxEencDm13Vfpoj7lcwHEorF/gNIcnTCtIvaF
	16m7MzEySGv91Pr7BthGWgUfNXxb+lxeNa4TPoh9JqjbZa0DiXmgcPOiFEaz3AF/HTSPb+ah2dR
	RBPK688CxXC46ylArnwIm1HC21psmriT7QH8jxHKw3SaX+uW/9ZljIClyhmj88/WgHuc902+wCh
	0uzY506uIucMNSM0/3tm6RTO/YB/SOrGP95x9I9FmihpibWo5sNhmOWfH3
X-Google-Smtp-Source: AGHT+IEX0ceojmfBGemXd2StRBM0Uz7Y6QzJyfpb7h+nOL0rs4J33T/w9qGKXRpMBRIp9mDeZN9m2Q==
X-Received: by 2002:a05:6000:1a88:b0:3b4:6577:eed5 with SMTP id ffacd0b85a97d-3b7767159afmr465833f8f.12.1753424237204;
        Thu, 24 Jul 2025 23:17:17 -0700 (PDT)
Message-ID: <f750b696-59fc-4e61-a266-406957b390bd@suse.com>
Date: Fri, 25 Jul 2025 08:17:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] xen/cache-col: Fix initialisation of domain colouring
 information
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Carlo Nonato <carlo.nonato@minervasys.tech>,
 Marco Solieri <marco.solieri@minervasys.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250724162306.2978741-1-andrew.cooper3@citrix.com>
 <20250724162306.2978741-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250724162306.2978741-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2025 18:23, Andrew Cooper wrote:
> Right now, domains start with no colouring information and depend on a
> XEN_DOMCTL_set_llc_colors(nr=0) hypercall in order to get default colours.
> 
> This in turn forces the toolstack to make a hypercall for all VMs even those
> without colouring configured, and to ignore errors if Xen doesn't have
> colouring active.
> 
> Introduce domain_llc_coloring_init(), replacing domain_set_default_colors(),
> and call it during the trivial initialisation in domain_create().  Leave two
> comments explaining the positioning.
> 
> The -EEXISTs condition in domain_set_llc_colors() needs adjusting as a
> consequence, but that's easy enough to keep working as before.
> 
> Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
preferably with ...

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -878,6 +878,12 @@ struct domain *domain_create(domid_t domid,
>      rwlock_init(&d->pci_lock);
>  #endif
>  
> +    /*
> +     * Doesn't allocate memory itself, but does set up data relevant for
> +     * memory allocations.
> +     */
> +    domain_llc_coloring_init(d);

... the word "default" added to the comment here.

Jan

