Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AE8A6A878
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 15:28:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922177.1326087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGt6-00006J-Nf; Thu, 20 Mar 2025 14:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922177.1326087; Thu, 20 Mar 2025 14:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGt6-0008Vp-Ko; Thu, 20 Mar 2025 14:28:48 +0000
Received: by outflank-mailman (input) for mailman id 922177;
 Thu, 20 Mar 2025 14:28:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvGt5-0008Vj-3M
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 14:28:47 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a19ac0b3-0597-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 15:28:46 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3913d45a148so727050f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 07:28:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f55c99sm50948935e9.24.2025.03.20.07.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 07:28:44 -0700 (PDT)
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
X-Inumbo-ID: a19ac0b3-0597-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742480925; x=1743085725; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cdx2m9LqzoiNWzhkOoBPZfLMpnbrwdRplBZHmpwIuKw=;
        b=TuDyQHUvLG/yCIqRF1ThD0ov/mCkuBiCoKlpwqHPSwjVYV6Fzx3O509RzpiYudTgBw
         LhQZujfC/r7CMAJnp1Cqia/PE0yNaf3xz/DxzOA//SynB3eRS9Ecz5F1Z0QoDfZGOLOA
         DNRDnOlv6czXOE7a70QObhkzsyFNcXzPoS+bMgvGLfzUjEkzku83VdUIwx1cSj7mPJfE
         REpuAhsdfSiek9ECUMC61jLJ0yP1YqP31ymnuN7G3C3Vp9ZduGRuzjaGI0no7a9x7vhU
         N4Vdpr2xMtQa+XOyhpsjuqkSKHTtJhCrjhUg6h2esVC/I4zb875yyWqnz/Kxu5VeBuh4
         6sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742480925; x=1743085725;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdx2m9LqzoiNWzhkOoBPZfLMpnbrwdRplBZHmpwIuKw=;
        b=tN+Rj5IHpjphqMchNe1g8Xf/vSdjFA/QfKN6OxuFLeYpkrsHoxnFYyueaNGFwb3A7+
         f4iBFqqURF6YNBWrnSaKCRgBNaepYCp/B1W6Yn55aniR0iTihkWgYlWmsaHKKlIdlzq4
         l45r9/AhPoG6gWX2D2MkmrL+OMUBdF0zG0tOyZZpq0YF6uBY3++2fJJnoneKbtiqoowI
         8Bo859zXqEA0gchTtXc6S/i6b/gk253COcVrUoh5hyDFDT+SBiX0cbcT140asnuzi+qW
         h9WVbcp776qKqm/aHFtCJ+1in001nA3/VlJLgsH6ra0RRNJ9bxkPP/eW3oPfKaNF00jF
         LFdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVdgVlxiWgSVa12clfuX7sgRFz5LsbAd/mmbwWavtGF/B45+m0q0YKnA+y6RsffaKV2kvYuLA+bYM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrDaHACQmr1v49am4SqSRMB8aed9VzyJAJbYTv0C+GvQeg6Ve7
	qjc/WPE2jGMvXVknnYojhwvTbpYGfyvUG75thk2Du3nwykbCIo6VoRwQl02HKQ==
X-Gm-Gg: ASbGncvInDwRpXQCWzxcH2P5MgD9bfQ/EYSEPkv5fWp+OjrZNPwng1eu+haohow3PbB
	pR7CUU8AM2ZyPRY9vAkymIrrlzUJuhkKyq5F1zSsgB0+xyfO3OWpPodMUVoYVkY8b23Llld2s51
	GM0k/FLx397hiTCtuEt1XIBF2vVwtHkU7TSc+seDL1vnyMQDUXxBsLcmiEkv0potTlmFJzSjiu7
	KYsAqOdKBid3sSXCq9zPvB/j/4v5FwGxF3eLWrTz7sPZB5vJeEdgBFiOowmKYtRYMRPeme7iY6k
	DP7iMcvr/X3N2D9qceOlOCeAk+nPL3599LdslY2zFwDfd/3ZIlGqYTKZnxxB6dc/Bf3t6yAjgOj
	GfrvFjJx/CaUlsK2JfFRI++GBvIiOTQ==
X-Google-Smtp-Source: AGHT+IHK14HVfnDSnobjLaM0iJ7TMWkWHhcx9aD+TUczYLe3vtwcmGQa+QjwOraGWzdhLceByBElQw==
X-Received: by 2002:a5d:5848:0:b0:391:2995:5ef2 with SMTP id ffacd0b85a97d-399795d8beamr2509020f8f.37.1742480925267;
        Thu, 20 Mar 2025 07:28:45 -0700 (PDT)
Message-ID: <487d57c1-fcea-4cac-bf2e-53fab739bbc5@suse.com>
Date: Thu, 20 Mar 2025 15:28:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 2/4] x86:svm: rename svm/nestedhvm.h ->
 svm/nestedsvm.h
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1742465624.git.Sergiy_Kibrik@epam.com>
 <ad1cc03c3544235426b73e3779edb36653f25287.1742465624.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <ad1cc03c3544235426b73e3779edb36653f25287.1742465624.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.03.2025 11:36, Sergiy Kibrik wrote:
> This is private header for SVM code, comment in header and file's changelog
> suggest that intended name was svm/nestedsvm.h, so perhaps a small mistake here.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>  xen/arch/x86/hvm/svm/intr.c                       | 2 +-
>  xen/arch/x86/hvm/svm/{nestedhvm.h => nestedsvm.h} | 0
>  xen/arch/x86/hvm/svm/svm.c                        | 2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename xen/arch/x86/hvm/svm/{nestedhvm.h => nestedsvm.h} (100%)

Yet then, if already we rename it, why not to just svm/nested.h?

Jan

