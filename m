Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C499B854685
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 10:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680325.1058413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBwo-0005BU-C3; Wed, 14 Feb 2024 09:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680325.1058413; Wed, 14 Feb 2024 09:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBwo-00059L-8b; Wed, 14 Feb 2024 09:52:58 +0000
Received: by outflank-mailman (input) for mailman id 680325;
 Wed, 14 Feb 2024 09:52:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raBwn-00059F-3K
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 09:52:57 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d38852a1-cb1e-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 10:52:55 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-411f165ef9bso1848125e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 01:52:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cl3-20020a5d5f03000000b0033b7ce8b496sm9409787wrb.108.2024.02.14.01.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 01:52:54 -0800 (PST)
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
X-Inumbo-ID: d38852a1-cb1e-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707904375; x=1708509175; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t+SdJxmD+d33X6aL2leTE53nVcqdhOkniVqz8xJ49Vg=;
        b=UwwEiZ3fWREdlxa3gloatinAG/0fEwBnM7Q42AAsdtD9wSGmAqoDPmruNmFN0Tn0GG
         PV04r1l61MfYyegkqJ4ngbuayL7GjUadZxUBZheG8Fto29rks44nzk7M2/wmhK51m0l6
         A6QEyVPT3gd3xqHBDPDfu2BXAQA5RaxbKaVZuk+C1kjeVee+UYuQX2WsmebIa4T+aMOs
         PLCmi5tPPdH1GDi3hGVtwcVDutCXreUfB+SYTf6h3xLhW8P+gDtTN1UKQiB8UwAjiON4
         5rsq/f48Mi4avOJnRjpx78uRdtBMQIvQztCGR94FENiEP5wQ9IJmbZK6ij26lKozkSDT
         1C9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707904375; x=1708509175;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+SdJxmD+d33X6aL2leTE53nVcqdhOkniVqz8xJ49Vg=;
        b=DnNvgmNNRVzFP/sPMAWO7d+KxJtRU1x2l6VR/R9Fh9dXO/xaNg4EVe9MyYGLJu7qmV
         6mVqBed8R81Wq5mVZ8oB0ol1GaOObvLSji8GKXMXKKRPWvfmU36igsifHN5/Bs/XI7mg
         9W7CtwUxBAWb+fRAnVxZCEwCcPCIuz2bhNFLBz95orfZjupo6os6Aw0PMFVFirZA9anU
         4dKesUyeXY8idcgbpf2vlZcTyBck72yewwGGlTOA0HiaQUmw0ywj8Q1kc2VgfxcVDWi3
         xLjbfuNKQFz5KfrOkF99AkCAAlFpBoYOV3c5tWG0lhOkGFFrWm4/ZGUbxkGVRMy7oXIj
         kjAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN/J2qJPzQzvqazjRChyyr4XBLv0+ROeC9AD0rHCvySfMkKSVXrmnAW+CjQ68Jm52prMiJfehV395kqzju4UjnoYRAX3Nrn/bRxY06baw=
X-Gm-Message-State: AOJu0YySNwTdv4sO2jHaOdpWP313qaUAV64eNueFXwW/QJ/eF31cfyPD
	j937C5C092tjEzqL3LxgrZ4kDlKDWetiexvTbMInYMxYCq6OewRFxJq6Ei0oeQ==
X-Google-Smtp-Source: AGHT+IEjSooyQXKvxKax9gFUr69DJuFtV9lB1d26QbFddkQ3hTT9jkoZqPZSBl8Eb5GYWd62+g4Vzw==
X-Received: by 2002:a5d:5913:0:b0:33b:51a0:4dd3 with SMTP id v19-20020a5d5913000000b0033b51a04dd3mr1407884wrd.17.1707904374925;
        Wed, 14 Feb 2024 01:52:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVkTblXFrYNjf3hQM/EvXuMn/MEOz8xEwKJcBGhyAZv9nCCyts5+xq0m8eAPeEesuvI5gYDjwJwFYtN9wmxF6l044RFGKKowEnsB9VDl691Vav230M3odx/CMMbIb3tNdPbijmLu33/1eVd7tapJ4zzzzyD0Zc9tj2T7Nvo76icKdGQGZ+PG42tfVyZVD9TG7nMEaqqQ7TVDyL9n0=
Message-ID: <16162577-dc0f-4c4b-acd5-9c2519f94c9a@suse.com>
Date: Wed, 14 Feb 2024 10:52:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 30/30] xen/README: add compiler and binutils versions
 for RISC-V64
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <d62dff38ee661f3fb713554d544c966fa889fd83.1707146506.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d62dff38ee661f3fb713554d544c966fa889fd83.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:32, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  Changes in V4:
>   - Update version of GCC (12.2) and GNU Binutils (2.39) to the version
>     which are in Xen's contrainter for RISC-V
> ---
>  Changes in V3:
>   - new patch
> ---
>  README | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/README b/README
> index c8a108449e..9a898125e1 100644
> --- a/README
> +++ b/README
> @@ -48,6 +48,9 @@ provided by your OS distributor:
>        - For ARM 64-bit:
>          - GCC 5.1 or later
>          - GNU Binutils 2.24 or later
> +      - For RISC-V 64-bit:
> +        - GCC 12.2 or later
> +        - GNU Binutils 2.39 or later

And neither gcc 12.1 nor binutils 2.38 are good enough? Once again the
question likely wouldn't have needed raising if there was a non-empty
description ...

Also - Clang pretty certainly supports RISC-V, too. Any information on
a minimally required version there?

Jan

