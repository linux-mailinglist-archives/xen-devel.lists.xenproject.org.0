Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C398D8897BD
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 10:20:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697623.1088549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rogVC-0004tW-U3; Mon, 25 Mar 2024 09:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697623.1088549; Mon, 25 Mar 2024 09:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rogVC-0004rz-Qy; Mon, 25 Mar 2024 09:20:22 +0000
Received: by outflank-mailman (input) for mailman id 697623;
 Mon, 25 Mar 2024 09:20:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rogVB-0004qD-8q
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 09:20:21 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5e1889d-ea88-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 10:20:18 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a466a1f9ea0so246617466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 02:20:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h27-20020a0564020e9b00b0056bf6287f32sm2652302eda.26.2024.03.25.02.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 02:20:18 -0700 (PDT)
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
X-Inumbo-ID: e5e1889d-ea88-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711358418; x=1711963218; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DdaEKuCAKwKYemJzNlkYhpxFzcP0nn/dPemydzn2UIg=;
        b=EZ2DkPNJo6ZPpyXQCj18r18ct2Io4mf3grwzKtNJV7sEmsIFFvILNtAAwWnIznDpaV
         7wauTMF7eMnlr6ewLMmVkSRc7UHhZzZEFd+ElBZGv/xEa7+0sCmQldY0GeA0xm2FAu7F
         XhFvTUDvC1G1FCn9zCsQF7vlJIIbPIIlz/8NDpYMvXtzoEMZdeXIIctn372tOewAdSZR
         GzNsYtxamdtZqL9VGyu7pf1kKFRIyliojXTdXU66IdDcEuRB/vlBGwVAINaQoYJOiix9
         rdXKkxcnok1O6/FynSP3T2Ly6mxPHqyApMiPThWiJXkD4rMmnKavqEAR3u2qYjLyq9i8
         OA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711358418; x=1711963218;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DdaEKuCAKwKYemJzNlkYhpxFzcP0nn/dPemydzn2UIg=;
        b=PSBdMJZMuiStpugf4oIYaLO6SpBdLGchRfHs6ihfhJ4/Y0nv93HgYc+x1Uc6/Mg+C2
         tXYk6OkpL3F3+X9Sm3e3FtPHo5CUxYJl8hYmdUa29glrKklDrUchHxMykbf/xHqOkg4B
         85696H+IVIyBMho202n49fJTMOFshCMENAguxMP+SkjuFrGnj8SPR3r3swS1jxFQaGnh
         E+qK/yqJ3reyRZWDkgdMshi1gknTsB9kboZOnUukjRaIF4Z8EfUi81rYUB47Ndgfqvj8
         Ejj2efreom+oK7+3vUtCxrv3y7PVAaWmc/3Vbz6vXDAWpOgInrpxmsuewkqJZWFTheb0
         iATw==
X-Forwarded-Encrypted: i=1; AJvYcCVo0tNJrTTQ8GdHhiq5cy85ekvgBgBZyFrRaqANJ41zU/7OGVO/tuYly2asnH+jO6PTUd6RzVbTDFnxUhpTlgzDE05E9pMFpyHPEdDzuGI=
X-Gm-Message-State: AOJu0YxfBU4+EjvVye+PbCp81RKgtJSb0K9LPyp4uQhlu+2sw/SjbbwH
	PGj7JSwGA1A/ObHOGt6VIAbLZe+q40mWKqw0NIpMeH05ahl0wyywDPLlLpNSmQ==
X-Google-Smtp-Source: AGHT+IEU58a/4Bfyh+fZiFmk6y/g2F4EHzj6x1ygaCbR+9dYJNmsHMaQjSYKd2vspBPQFESX7qDHLw==
X-Received: by 2002:a50:bb6b:0:b0:56b:d92f:32c6 with SMTP id y98-20020a50bb6b000000b0056bd92f32c6mr5456644ede.5.1711358418408;
        Mon, 25 Mar 2024 02:20:18 -0700 (PDT)
Message-ID: <5dcd688f-dbd5-4335-aa84-cd4ed3e177a4@suse.com>
Date: Mon, 25 Mar 2024 10:20:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 04/11] xentrace: address violation of MISRA C Rule
 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <06c112784c54fcd87792bb96515ecdf91b2109c3.1711118582.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <06c112784c54fcd87792bb96515ecdf91b2109c3.1711118582.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2024 17:01, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



