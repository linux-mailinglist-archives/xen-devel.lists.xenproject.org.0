Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F867810CE2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 10:03:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653783.1020334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDL8i-0005rO-1m; Wed, 13 Dec 2023 09:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653783.1020334; Wed, 13 Dec 2023 09:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDL8h-0005oP-V4; Wed, 13 Dec 2023 09:02:47 +0000
Received: by outflank-mailman (input) for mailman id 653783;
 Wed, 13 Dec 2023 09:02:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDL8g-0005oG-FH
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 09:02:46 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61317d4c-9996-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 10:02:45 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a22f2a28c16so120065166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 01:02:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 so7-20020a170907390700b00a1f747f762asm6736633ejc.112.2023.12.13.01.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 01:02:44 -0800 (PST)
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
X-Inumbo-ID: 61317d4c-9996-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702458164; x=1703062964; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SLgM7bcuq4V+3ryD30B+GyM8EjFRUazy636Y18jPA/A=;
        b=c8aNNvQPAwkJpl1zXcAu2OZP5R0DwO8XRk9A5Iq0Raw3PXnELX0iYcAWCYt9rxAwSd
         uiPhvm/4tXTs3CfI3jLdHTzrHI1w/7F5Sfyl3MTZeOhekyVIpIT0H7nMK/OGFGyq8DdZ
         iL0C9obuwcoOhGqJ/Nx62WSd5fAMwa7HOnOs4ejNLl4+EQRkqdE890hpaQgijVspAkI+
         7YcVqXtKwYi2A7mCexsi7zF1WYQJ0MU7f5OvMlAqOPc/kbVCTFLzsOvp4rX0/AUiTL6N
         dB9v8t8nykCJYTU/cxCpRlzRRF7LzsT2Eqn/b8w8XIGHGPs2khRjFPOTtQhG/2F2leF8
         /IUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702458164; x=1703062964;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLgM7bcuq4V+3ryD30B+GyM8EjFRUazy636Y18jPA/A=;
        b=JcZOksRlgGijlKxWTspGXgGJoy8BJ8ttm99imIl2dN+UgJv8SzTKpNCSelEe8bITd3
         1OFmRWz57kdBJ5/FY3B6ONvaD61pQWaoWbKGqquu5GYEW4iUtXVIqm3tgcgqd47asLne
         XbSxGWLTRkrCHIw7aENkBelDE84W6oj6Ql0j9eBLbEYLhabOEJ79ZuT3jDVQwxHl45Wz
         LNpkSlEz6i5w8uCoXUR8Imm/X+XI3UYUbFr/T3eds7XOYJMZlwtbpOmPa+2x7GHDHIJz
         +2BgtdtCPZ2WZ6KfMdXayjY4AwYfMCVqscFlRlrEMQEJZSLPjXUiigTBIgjzCl+AnZn3
         rHzw==
X-Gm-Message-State: AOJu0YxfMV9zU5sxn1/jKNzXQzO7LZ+jD7ArQsdn8/UCYwp6HJXUZsee
	bBY9y2r1pXWvgReKN8nu7cnQ
X-Google-Smtp-Source: AGHT+IFwaAWyc93ctiJ3H1VUuAvYYl3Eb14IKvYZZAOWtJgR6HIOX5quWhrQ+1NXOq+Vetzo7tzGJA==
X-Received: by 2002:a17:906:2f81:b0:a08:17de:6409 with SMTP id w1-20020a1709062f8100b00a0817de6409mr1978781eji.7.1702458164676;
        Wed, 13 Dec 2023 01:02:44 -0800 (PST)
Message-ID: <cbce8db0-bda5-4973-a105-7d5b2703b64d@suse.com>
Date: Wed, 13 Dec 2023 10:02:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add me as Mini-OS maintainer
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20231207073012.25730-1-jgross@suse.com>
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
In-Reply-To: <20231207073012.25730-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.12.2023 08:30, Juergen Gross wrote:
> I've been the main contributor to Mini-OS since several years now.
> Add me as a maintainer.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

No matter what ./MAINTAINERS says about the file itself, I think this change
primarily wants approving by you, Samuel, as the only present maintainer.

Jan

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -439,8 +439,8 @@ F:	xen/test/livepatch/*
>  
>  MINI-OS
>  M:	Samuel Thibault <samuel.thibault@ens-lyon.org>
> +M:	Juergen Gross <jgross@suse.com>
>  R:	Wei Liu <wl@xen.org>
> -R:	Juergen Gross <jgross@suse.com>
>  S:	Supported
>  L:	minios-devel@lists.xenproject.org
>  T:	git https://xenbits.xenproject.org/git-http/mini-os.git


