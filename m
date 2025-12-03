Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB967C9EA57
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 11:09:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176610.1501065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQjni-00071H-47; Wed, 03 Dec 2025 10:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176610.1501065; Wed, 03 Dec 2025 10:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQjni-0006yi-0z; Wed, 03 Dec 2025 10:09:34 +0000
Received: by outflank-mailman (input) for mailman id 1176610;
 Wed, 03 Dec 2025 10:09:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vQjnf-0006ya-RJ
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 10:09:31 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27c8e1e8-d030-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 11:09:29 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso5056665e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 02:09:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792a7970dbsm37830705e9.3.2025.12.03.02.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 02:09:28 -0800 (PST)
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
X-Inumbo-ID: 27c8e1e8-d030-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764756569; x=1765361369; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6J2dEnsrsETbG54XCAomp9SR0qwFKyS7lrh1SrqgGEs=;
        b=DzapJ5cbs7+Ea1JAwdjqFiYiwU64hYp7LE5RBCofLTcM2gS+Oso0r7PYrNWyzVfxhp
         KbokitNSZVhP4YgRymAhMpxuGq6zA4HEizNVhJVhXNI/hgVldynwTG8oV+i9KnQQbGiz
         ijkPufZPBbkKPJ2LHdj9iC8TX27DDM6Mk/KZwf2zBfk9Ln4uwC+PE53MzIUWQiixYJKu
         6w7RVBbuyo91bD4gBbbqc00kHwM5GlcOZkGK1U4anMDtG08nVM+thBI9lF2V5oZ3w3Nt
         qRgdBHfUtRIWCzCaYOzvxRf3lraSxsugHC8AAs2wt6MbcYIszHfVJoZoN1qzX6diuUqL
         6CnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764756569; x=1765361369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6J2dEnsrsETbG54XCAomp9SR0qwFKyS7lrh1SrqgGEs=;
        b=f3D9ZijwsfJkW62DyCvjeE2mPJjcBEcuwkOgBf5JlBD4SNIWt/TSuzZLQmWtVNxLtn
         8BoVXqCzspIn9Jx42CdSGARNf+7qgjKGuYk7Pn1S/GAxrDMiT/KeF9Zf9TUwzAgPqY2k
         J5dtQPCnuq+rwjcBvQfdAErBPP7TcIRmZ99u0pRt/se5rsrK5k+Mg5q8FyxQUna5qr3t
         1bJYLyOvyHaAiI7HJ5CJJ76iAm636ThZmO/LWXStquDqiRBbnCIYlseQHLpiM2e9tZNc
         kSygn8vToXRD31bvNn1d5WAgd3pJd1OZITqpbYDJhWUD8zMoEc0PCv4UG49Xy+B/dCm+
         FzFw==
X-Forwarded-Encrypted: i=1; AJvYcCV39zV1JkCl6GbTwXOxPGlgSUQ+Y4yC9VWL2yUtIcLNTfxXdzAB0Fd/67W41SgoRm7IzxKpca44yFQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRDf6zDxPtkxVsFeQm1odn4m4ibsvRmgpoyRyiUxNUCFgCHFlz
	sJWi8eju6rXYkhq2tbIEdNS2XjnbRQfasVQzOnVjQ3NrGiBqxaT80Sn2pTbJUzDbVw==
X-Gm-Gg: ASbGncv3t/CSmnP7f6IDVvtilz5hsyzxBpXzH/GjSReoW7lveNpwZVwURoYUnU7M3VO
	F6fNSLMqPUBnDHpJt4uZB/WOKp6z9DXyZmT25VkOlem/2xVM3D9P8CRwt/ydR+NrUOJrUoeGQnj
	rHl1ATpBh19GySjCvPYu9R4Gzur7Zf3L5973bIzsjQ321dgglYlXPWZUQ/LWdC6G2Mfu8tdaQ2G
	FfhUo8sJV0a12wSPJYY6h7eJ6+TtoxA18/hncIPQSaQC7CmtJB7cd6FxMVIMYEGjQ1tDg3IUZDv
	IgrhK0NO37ES+Uo7LT4zSCC5RI/UcA9fCKpPjGxo49VRTjkQ9tFX65wnni1NYdsUUHR7JnCX10R
	w4lhj2/2O7RtnJP1ikd3AbRWVSpdAHORi3/ActAv43iW3XMaAXybvxC36T62tqk0Nyx2k8SjwUQ
	DEqEo9taZC4AjTlzP7Q4dud63jcmdF04kJxA2Zl+LQnHpKJoQLH6Gx+vwqVuLp4tph3m29iBX5u
	s/IWQHhL/qHig==
X-Google-Smtp-Source: AGHT+IFOh6XpTUMYgSzsZkfjIOOouTl9yGoYw1hHHWwQ2bdW2ruHKW0mYEidDFmVZ/Ixyoe+gCdg5Q==
X-Received: by 2002:a05:600c:3145:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-4792aee03eamr18127005e9.2.1764756568863;
        Wed, 03 Dec 2025 02:09:28 -0800 (PST)
Message-ID: <b844a0bc-ee86-42fe-bcf1-f8a33a594c4c@suse.com>
Date: Wed, 3 Dec 2025 11:09:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 4/4] CHANGELOG: Document guest suspend/resume to RAM
 support on Arm
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <cover.1764755558.git.xakep.amatop@gmail.com>
 <ba51b0ca5457566e1dbef2b6d6ff984dbc318895.1764755558.git.xakep.amatop@gmail.com>
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
In-Reply-To: <ba51b0ca5457566e1dbef2b6d6ff984dbc318895.1764755558.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2025 10:57, Mykola Kvach wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -10,6 +10,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  
>  ### Added
>  
> + - On Arm:

Nit: If you look elsewhere in the file, you'll notice that there's no blank line
between the section heading and the first bullet point.

Jan

> +   - Support for guest suspend and resume to/from RAM via vPSCI.
> +     Applies only to non-hardware domain guests.
> +
>  ### Removed
>  
>  ## [4.21.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.21.0) - 2025-11-19


