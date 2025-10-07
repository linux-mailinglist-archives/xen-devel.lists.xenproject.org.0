Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2691BC2007
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 17:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139101.1474647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6A3j-00060X-EH; Tue, 07 Oct 2025 15:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139101.1474647; Tue, 07 Oct 2025 15:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6A3j-0005yZ-BX; Tue, 07 Oct 2025 15:57:03 +0000
Received: by outflank-mailman (input) for mailman id 1139101;
 Tue, 07 Oct 2025 15:57:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6A3h-0005yQ-Sg
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 15:57:01 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42b86ff8-a396-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 17:57:01 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b3ee18913c0so1016552566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 08:57:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-637881010ffsm12716855a12.27.2025.10.07.08.56.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 08:56:59 -0700 (PDT)
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
X-Inumbo-ID: 42b86ff8-a396-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759852620; x=1760457420; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xmkb2AHJmzzxTq0PB3GuANi+LkSX0YobDWDYSs5f4TI=;
        b=Pc7k1SbTlwSaASAPuk387QXQfcv35mJAAOTkjs5tNd3iXCyHxuJaRjsNbZormS6GkC
         6C1SMvB9Pc+35SRxhIXxLS0e4Up/CVfzj7F0n3Tt8XKfyhf0Cn7UZddPDUBS1H/vomBg
         NVRUlZ/ETgcbOxGrD97YKNy7GDPTGk6lPR4l+3Er6HpqgyEQp5L/Yw9Y6In5F7qPBsck
         fufdcZ1xh6J/ggxvzPXK3y96buHvGs9udxMDpuG9o7cNjRT14RSV24DDqDBeb91och/l
         366SlBx0LyZpnfBCOGi5qCXvon6W00WKyLo+zHuT8NGwuYCIXwOH5zQXMFHhxB5t8fwF
         0jEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759852620; x=1760457420;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmkb2AHJmzzxTq0PB3GuANi+LkSX0YobDWDYSs5f4TI=;
        b=cs5UMHwvhUVMs+HoqgZtlV4lNOvcMSC1NDET7Fb5yw2FtIy2MSMXI3CzpPndn1OU9c
         7Zh7SK2VeeJhtSSj5FUhIZYF9UReUirmrlWdx5IsGyNFOoLRG5KpJd65D5C4ZKn/xK15
         53pOv7xC6nAR/tBfDHeRbVBGztWpGzIim6KLKu9X8z2J3gSp8iTu120eD/3zF44qcMdR
         siukrQhVygHdAg3fcYRqv+k0OdnUeDSJPH2oC5cCUzVgZs3m3WGbCPCQUVj9sxm6eaab
         yld9FPKd6Spccb01dEH5q495MTvEOaSGqu2h5MJXr88n0ueWBIQTzpAhnt3KkeaokqLG
         cWUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV49gTFnUDnXmlkc+r8Yv/yAJNhqCBoESJUMSyF6fh7uTLpMmnSO1V24+FHv5HRRDdTANPLYFxAAHU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFNWAZP3yCqPy4KADTj4mnGqaqnbcQDwhMlndzQtz4aHDdLWFN
	wb+rqVVWujoI0enWwr5kwcle2WMrjgZB/pRK4TWJoNfHvHfgVpeOocl72qT5iCO0BSP4nzc0OXT
	Bw5E=
X-Gm-Gg: ASbGncuCNwMgm872Pvh3bHomrN8LPc8lxTO00cCK5av0bPK/TlZ7Vd6tFvbgq+SmdBH
	h4nZ7DBKMykFAKLxu8ACRjfD+9SRVv2c2JK/uDJ5CQTQfj9PuEl+QUlzhhaR3+2Zomj0Z7+qzPK
	+rnSNTYblIzeuPevX3iB2QEbV9b2aZ3asEjPtSIBHURTh0eiLJKplOT1mTsx9P40ZamPVo/yVPr
	Fs79olCIdQhAzvUCm2mOoDNqSxHGdlbbZGF7HYqdC0r9NibRommGB3wYIIt3RsCMEMS3ZIVFGri
	VkGsPNxGkTKKVedniE4SQ8hyG+ar9ne3r0yZ6FcbWkPsmjnnhtXqWwmZnutuYC0xXyqxK+pi+zI
	MeKt6/T+4n+qgcsiWlnDd9Y3rPjayxonDrKF+0AqHBdkIO0IxpAQvBCiB3sm3Cdh3NS/CkTxvXI
	oiJ0tqmj0gZKbS8PhRJ79WO9tsKtpnBws=
X-Google-Smtp-Source: AGHT+IEGRVVp7WAAN1uHYzLGM2mSQF6gs2NxoF0s3p9w1JC4Y9oHrMjUlIolnR5HXkpn0cqKsoqedQ==
X-Received: by 2002:a17:907:94c3:b0:b45:8370:eefd with SMTP id a640c23a62f3a-b50a9a6be43mr16781466b.5.1759852620130;
        Tue, 07 Oct 2025 08:57:00 -0700 (PDT)
Message-ID: <b7f428aa-dc5b-4d3a-89d6-4f8abb074105@suse.com>
Date: Tue, 7 Oct 2025 17:57:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/22] x86/boot: Use RSTORSSP to establish SSP
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251003225334.2123667-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2025 00:53, Andrew Cooper wrote:
> Under FRED, SETSSBSY is disallowed, and we want to be setting up FRED prior to
> setting up shadow stacks.  As we still need Supervisor Tokens in IDT mode, we
> need mode-specific logic to establish SSP.
> 
> In FRED mode, write a Restore Token, RSTORSSP it, and discard the resulting
> Previous-SSP token.
> 
> No change outside of FRED mode.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


