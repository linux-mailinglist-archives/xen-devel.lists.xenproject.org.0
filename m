Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D81BA50201
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 15:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902360.1310312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpplj-0006Gf-PD; Wed, 05 Mar 2025 14:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902360.1310312; Wed, 05 Mar 2025 14:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpplj-0006Dg-Mb; Wed, 05 Mar 2025 14:30:43 +0000
Received: by outflank-mailman (input) for mailman id 902360;
 Wed, 05 Mar 2025 14:30:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tppli-0006Bu-Qo
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 14:30:42 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69d64585-f9ce-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 15:30:40 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-390df942558so5387576f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 06:30:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4795da5sm21527491f8f.15.2025.03.05.06.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 06:30:39 -0800 (PST)
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
X-Inumbo-ID: 69d64585-f9ce-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741185040; x=1741789840; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b69Q2h+ejXv3VG2Wtcvi1KGHdv5iSQp1vAp4X37G9iw=;
        b=L4Y1sf7HaH+CyVYeTV4JRNTL1ZBg4NZz6bmtvVA/9Qw7l3LdjEb0nqLvQprZ7nZ31R
         o5VnwuurgUPK28poxUxEPjrqClpqw2X9n4sYtj78o0Tt8by0N+6tJj51iYoFG31iDQOj
         79SNztrc50Jn2i9ngaVV+5smo8BIG2Pt8ZldRn9snuRSMAZSpvuKWPCgiooaScWptuS/
         S/ZjIjczNOYdhOahVvjd00W2n+cIZr27jr+rxUwogjm3OeYKjwbZc19M/9WHyAb/WiFf
         lpFqBXdMSHN6qkrRhLm9cBi+8piIWoYJzxkyWl/GqdMSEwfAqwZUjYdDfpQY5XD4/nfS
         SuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741185040; x=1741789840;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b69Q2h+ejXv3VG2Wtcvi1KGHdv5iSQp1vAp4X37G9iw=;
        b=gqIHwx1o/jzSPmIOAts5ltCV23scVuYWvIJAIAsYdNwckAtNCT0n5bmb0eEkqF3u2Z
         D7PMsoPW2ELBaYQ4pX5TAH5fqIBKy5Y6BdIJrJ5D9fzew2MGro+OJCmMdau0yy5Yt3DV
         APvAR26pS2cjJD8tEhWF5xxmNHcsxdTPVD2Lc/AcDVNAYU6FQUT1U16e+vsWZzWdocPe
         tl9ZPu4TdVz+cbSnWYpQngMj+CIZ0rWUOkrcCMdnlsFifN8mg+hUp5ncpEY520l/tJL7
         VVnOaYvVhHPcOzb57UfmKrygDf0EUB0A5tTHzhZQt1Iw00TtyVa5Sa7HYd8tvTSV4bOn
         nyVg==
X-Forwarded-Encrypted: i=1; AJvYcCX1hha7CwiaeDHT5YaDpgKc5ibFz/lFENlddUiFzzD/sIc69yTnG39Z2NfduHgqjpqplyNuMyGgTzk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8JnIQGn3K229F+YfuySNKvTUa57A6mdRxcz/yFlV8gFGAJumJ
	fgbjpigrrWkyezE8WDy6Jd3x7eS9MZkZmuHppX3WhmvgYs+CWYILPOCCMwDoOA==
X-Gm-Gg: ASbGncsqraYZlkJQiG62GUG3H0W3lJTyo8Bj7oHMn/QVnoNYVr0+rmJH907GOJrGfp4
	i+d+I1KlFpXL8ZnFupxIdXMV2Tjop1EaiHl/Ekkp0TFJD/rA1vIOYEg3gIz7oQI/hbJJp2vV7od
	XBt1tWdfK70pYNkf4lYEYJXgt6yyGwhe+CD+5d5+dQnvSx2Q8FcMMuyC5CMkNwCcBxJlqU3zNEf
	+CD1dflkaWRJSogVcW6GOUmI0Rfh3dXVt/OpaLxXI3ACTEPlfbrHwg5RPdS6TtaNVIyRA7/Lcur
	Ks08MbC9fQjp0J9VIESgdwUUpOIEcku3EnanIKLsPiE8BYD6Ezf5nPNNBYosBzlMj8SF9dHlkKV
	5WSB25DxqgZWc438QYtIpi3LWKML1nA==
X-Google-Smtp-Source: AGHT+IFZ1Nx1v/RQBFebxsBlU0njJtAMkKaDBCT8R63R4pvhK6dZJfGuao3Tda3M9vFBcE7SZyqK1w==
X-Received: by 2002:a05:6000:1843:b0:391:12a5:3c95 with SMTP id ffacd0b85a97d-3911f73858fmr2306736f8f.22.1741185040132;
        Wed, 05 Mar 2025 06:30:40 -0800 (PST)
Message-ID: <54225b2d-4fed-458d-9e94-7e6f1ce08d34@suse.com>
Date: Wed, 5 Mar 2025 15:30:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] xen/riscv: make zbb as mandatory
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1740764258.git.oleksii.kurochko@gmail.com>
 <052daeb00fb90416a30f1deebf42c9b6ca5ff348.1740764258.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <052daeb00fb90416a30f1deebf42c9b6ca5ff348.1740764258.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.02.2025 21:07, Oleksii Kurochko wrote:
> According to riscv/booting.txt, it is expected that Zbb should be supported.
> 
> Drop ANDN_INSN() in asm/cmpxchg.h as Zbb is mandatory now so `andn`
> instruction could be used directly.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



