Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D40914561
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 10:52:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746305.1153312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfRI-0008JK-S6; Mon, 24 Jun 2024 08:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746305.1153312; Mon, 24 Jun 2024 08:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfRI-0008Hb-PO; Mon, 24 Jun 2024 08:52:40 +0000
Received: by outflank-mailman (input) for mailman id 746305;
 Mon, 24 Jun 2024 08:52:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLfRG-0008HP-Tw
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 08:52:38 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b8fdd05-3207-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 10:52:38 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ec002caeb3so52218141fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 01:52:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70662adcf3dsm4272802b3a.54.2024.06.24.01.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 01:52:37 -0700 (PDT)
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
X-Inumbo-ID: 1b8fdd05-3207-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719219158; x=1719823958; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kNbPHfaG9z9iBWickqMzV1VuxOuq4Or2qExg/W00VFg=;
        b=EJq4fTYUrtiSbLxoeTNdh7RxmLVC8dAvqZKUhnEOWf15QKSiRI6eoG/pMK/Z+DMece
         kgAA1uJ+PBin40vBxydsOzQjJkqnfeCyDplaQWrG12nidxeZqQwJIE+NJyr7n+CgZWXJ
         q+uG0+VTHLCbQBs8N6PVt6O/gQnbElcSHfYubSIfWJGT4fNNYtKcz/VfWotE5Y/FYVPt
         OGosiXg+Qe+JlnmLthxxRQypNjeLQArW3AJHqn3TgAMM735F7apyVC0ZNDolru6OQYkS
         TJz4Sl83Dt8karhA3bHp/cNrxbHM0blPV4jHJuA9vxtOCFfWlkIo+7VHa4jEnW4ykGld
         auPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719219158; x=1719823958;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNbPHfaG9z9iBWickqMzV1VuxOuq4Or2qExg/W00VFg=;
        b=Ftgkt9zCAlYuwsP3UvwfjkfQZrnf3HhWdfI2ZW/9SqR6si2M/p4JpVPOo4GMQdsCjR
         UbBPPSVP1X2fnU03QDSNNQhfN/KYSlKjcd9n5S9eBFpGQ7iLtWabc0XzR0gcDXsRbVrH
         ZO0QOg7pZg3Ubs2ZSC8e0QnHhG05myFbxgED765Jw1ViOrY3BoQFOOFIk1EN5DPumHyd
         skV86KUyzH/jgnvmj6aYIhrXUTtwqLWMgKO4mm8kk6Jc16c5HIYH2Q7zN7eC9pfHbfU/
         C6mj2uJuJxzVnQWYrEhoNyBu1bU5xq0jpvrbRhE0Xz9YN9uHqcLo58zsLrOQBKrFp6e+
         nzVw==
X-Forwarded-Encrypted: i=1; AJvYcCXVow1nq9BS4ZjBa8B9FPQCkF09hGY3eXLnP5OEyv7dk1ZcfysMppkOvnyMWWB0mm/WmNvjijaPLR/NHDuqhszGKRjYdFP79Rt93dDHMCI=
X-Gm-Message-State: AOJu0YxEFmG3CBxdaIw3fUOUf7IiR37RA46rM9j13MHVoer3mVURD6SK
	kA1Ix3dJNAvBnj2s+Yq9Z4W8KJGZXIF2r3DrP0eJV0ZqLTW95AKbU6OXpNU67w==
X-Google-Smtp-Source: AGHT+IHcNQ5FEKF6wIoFzM8zL+N6mRkMpbuEPZMXZ7uqpburqZBgirvdQXyHcqwf7VWyVNj2DIy0Ig==
X-Received: by 2002:a2e:9bca:0:b0:2eb:e634:fee6 with SMTP id 38308e7fff4ca-2ec5797a56emr33205001fa.18.1719219157643;
        Mon, 24 Jun 2024 01:52:37 -0700 (PDT)
Message-ID: <0ca31fc8-fb11-4a13-99c4-2cc77fdf0886@suse.com>
Date: Mon, 24 Jun 2024 10:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v3 3/4] x86/shadow: Rework
 trace_shadow_emulate_other() as sh_trace_gfn_va()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240621180658.92831-1-andrew.cooper3@citrix.com>
 <20240621180658.92831-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240621180658.92831-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.06.2024 20:06, Andrew Cooper wrote:
> sh_trace_gfn_va() is very similar to sh_trace_gl1e_va(), and a rather shorter
> name than trace_shadow_emulate_other().
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



