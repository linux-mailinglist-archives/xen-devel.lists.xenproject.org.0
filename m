Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E9193EF84
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 10:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766402.1176877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYLTa-0004mm-Qo; Mon, 29 Jul 2024 08:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766402.1176877; Mon, 29 Jul 2024 08:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYLTa-0004lH-OC; Mon, 29 Jul 2024 08:11:26 +0000
Received: by outflank-mailman (input) for mailman id 766402;
 Mon, 29 Jul 2024 08:11:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYLTZ-0004l5-HS
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 08:11:25 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 258641ce-4d82-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 10:11:24 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52f025ab3a7so4878140e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 01:11:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad4acbfsm470389266b.100.2024.07.29.01.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 01:11:23 -0700 (PDT)
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
X-Inumbo-ID: 258641ce-4d82-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722240684; x=1722845484; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jm8EN2VlOFASS22rImLfY2MQQP23ALZJZHzo2Qio+NI=;
        b=XssHEiOj8FQ7cQ8mcfyI1P1N81ylYQgSQ+dDoF4pnneQl2ofpljkyugbuTfVoo8CfX
         GtS/Lo30+9nfkCADuM4Cy5D2+8c7/DERjkWPBPcJtXIsy/9VP8e4yg+Eims8oHM3Y5qu
         oVWhgwg/XJAz+cPGxgHSvCdIQbqlm0fhr3Ro3eI/yZAqnoslsIx2TmBA7Scva+8QwpVZ
         mrGkXU0ghcOY7kqiFwPGp2IMIW0JL5Gm20kNIrUakjdG5TDpjLzWervYFrzCpHlxijpy
         n96RF5r54xEHEO2YFKxbheqqPCcTQN6BMo+9zH/GGSyNyumzyHl38xFR6wnj3exSM2My
         mQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722240684; x=1722845484;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jm8EN2VlOFASS22rImLfY2MQQP23ALZJZHzo2Qio+NI=;
        b=mSaUdKCneEIJZjdgmNTO/nNrgJMJUk3HrocIUGFOI3zeyvoObZqNoagmDmz1p7M0Se
         +JuyyEaCwIUpssKByoNTChqWnB3Tu/to+L7hTlbWdR/fDtG2h+9M9XDiEzMw68atOdTw
         a1DZ0pGwJQYgQ8YXSFwySWmer9D3gwccSqB/rdMmUobURBRyPV2YX36EOz0SOGibmKtx
         6FEojRCYlHaVBXV34+w69qv512X2V5M1k1EVnhluJ6rZuYIeCq7S4GWO/DAciow8w0m7
         5Vo9L/UBXP6SWXllaK/elVJN7ccqbyvsjHZGRoKptxIunUCMZf27bq3Pht6bvxVGJoAc
         KStA==
X-Forwarded-Encrypted: i=1; AJvYcCXTLEZjM983hZ7QV0lkL2a/EaL7NHDousjRKghc39HfSp3ICWahopPiVbhyBjGShVNwc7esI6iRQ14=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzrc7nc54E55ppyHwbKom/hYy3IHE9n+hiUKABY6jVf0GmdQthq
	7bdS7nH69+hufyhHKJpcRA5m9L8X8dLtpPhHPHlrxxeze4s7tWFKZQF9SHwyUw==
X-Google-Smtp-Source: AGHT+IHYLQUrDHEIDkXSFj2zlZda8Ppsit0yqwz3sW5EzjVHEDsg9c82O/dlD9T8MD5+N5abTtJHQA==
X-Received: by 2002:a05:6512:1249:b0:52f:c14e:2533 with SMTP id 2adb3069b0e04-5309b2dfe13mr4876387e87.48.1722240683749;
        Mon, 29 Jul 2024 01:11:23 -0700 (PDT)
Message-ID: <f2450b46-3542-4e1c-b7d7-8735b1839791@suse.com>
Date: Mon, 29 Jul 2024 10:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.19] CHANGELOG.md: Finalize changes in 4.19 release
 cycle
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <0c93b49ac00fa92721035b4f9eb2ae76175fe886.1722237887.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0c93b49ac00fa92721035b4f9eb2ae76175fe886.1722237887.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2024 09:31, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Since no-one else cared to reply so far, I will (I tried to avoid doing so,
because - I'm sorry for that - feedback is mostly negative, in part following
what I said for some 4.18 entries last time already, iirc):

> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -15,6 +15,17 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - Reduce IOMMU setup time for hardware domain.
>     - Allow HVM/PVH domains to map foreign pages.
>     - Declare PVH dom0 supported with caveats.
> + - On Arm:
> +   - Reworking the logic so all the MMU-off code is now self-contained for
> +     secondary boot CPUs on arm64.

This is an implementation detail aiui nothing people using Xen would actually
stumble across or notice. Imo such doesn't belong here. Same goes for the
entire PPC part of this hunk further down.

> +   - Code symbol annotations and MISRA compliance improvements.

This isn't Arm-specific, is it?

> +   - Addressing issues of the static shared memory feature.

Along the lines of the above, I don't think individual features' bug fixes
want/need mentioning here.

> @@ -23,6 +34,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     using a standalone library implementation.
>   - xenalyze no longer requires `--svm-mode` when analyzing traces
>     generated on AMD CPUs
> + - CI updates:
> +   - Minimum fixes to rebuild the containers, following the HEREDOC problems.
> +   - Rebuild containers to have testing with up-to-date LTS distros.
> +   - Few build system checks, and strip the obsolete contents of
> +     the build containers.

This again doesn't concern people using Xen, does it?

> @@ -31,6 +47,14 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - Add a new 9pfs backend running as a daemon in dom0. First user is
>     Xenstore-stubdom now being able to support full Xenstore trace capability.
>   - libxl support for backendtype=tap with tapback.
> + - On Arm:
> +   - FF-A notification support.
> +   - Introduction of dynamic node programming using overlay dtbo.

This is fine to have. I wonder though if the per-arch sections wouldn't
better sit next to each other (all at the top or all at the bottom).

> + - On PPC:
> +   - Basic exception handler implementation.
> + - On RISCV:
> +   - Identity mapping implementation.
> +   - Introduction of architecture-specific headers.

These again don't concern people using Xen, do they?

Jan

