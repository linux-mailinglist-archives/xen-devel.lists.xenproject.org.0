Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE717B34451
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 16:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093300.1448827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYPm-0004Fi-AP; Mon, 25 Aug 2025 14:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093300.1448827; Mon, 25 Aug 2025 14:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYPm-0004D8-7p; Mon, 25 Aug 2025 14:43:18 +0000
Received: by outflank-mailman (input) for mailman id 1093300;
 Mon, 25 Aug 2025 14:43:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqYPl-0004D1-4x
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 14:43:17 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4cb00fe-81c1-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 16:43:14 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb7a0442bso735628566b.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 07:43:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe8d03f94asm115181466b.57.2025.08.25.07.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 07:43:14 -0700 (PDT)
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
X-Inumbo-ID: d4cb00fe-81c1-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756132994; x=1756737794; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+EeH+3Go6suIAuKpudbMnOQdWhGJbyxWlc2oQylVT4s=;
        b=MuJrbw9oHNWSzZ6rmyIbHrBg9wnWo2yWjJwvsUDPsaVjjJIGl4J23M27k24WaxqyJ5
         bZe/7pkOKt0Ek4oahiH8rgKAf7fTmWNB1Bym2fjaO00G5yMyBtjGOtWH6wrfMrxnGaNA
         XM08/ZgREB7oayYobudIWLNhCkt88Py49UoXi3IMI4pFu/YzhX1LhsNy87Vj9OU4PvZQ
         jYxxKevwnJySZkjSpeCe64etnotKXOTPLA85Tq6YT4SsTYITcRzJuVWFYxZ75D73bY3P
         hVvJEiNtzeR5Mtz2nghZ7ZtN4Ljr+RkWuWj4ST4BB/LVFUxhWl7amokK82aH+05KBNKo
         +Ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132994; x=1756737794;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EeH+3Go6suIAuKpudbMnOQdWhGJbyxWlc2oQylVT4s=;
        b=MecFSmVXRa9Vco0yfA+GiaN/IdwMN3HelAikVH2QPgWUOggt/AGngjUTOWTxmUNx0D
         R5gZUPp6cSb4gMIvC86rrB2S4pFU/4z+cdzYMNdcG+RqhkiSFucvbrdV4DtpLSFdPG4n
         AZVkSqfoyKxJuVEr7HVSd2tsnulbTfIILrtNtbN9IcMKNmiU7/dom6cWTYNtdK3yI+NZ
         ittmkqksotYkZFNYkdpoFS5iWIMJ+MZrzMIcO+hKtB9Vm3lNjJxdtswSxO1YH99ubykM
         wTln0thsC1axkR9B5Hk52wtYKtW697GM6fuVHIxz9UbXw/B5ceFpm8PICg8O6D/OBW8c
         7kgA==
X-Forwarded-Encrypted: i=1; AJvYcCWjQjRJnKYXUfOedavprm3Qr39sYfbA1XH8gvxfcBQ0A5RlGly1HeRL1w8nFx13AkpIyvFAl6JvD/c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbTRYofM2hdhGzia2DYmtLrJSk8nNSbeTgvPxcv1wzS5BpEIJM
	S13WlmWRijCT9siCVESPc39NvcNaULDSpJpGiZSeSvF4Amsf1rKtm6b65VWvNbdBug==
X-Gm-Gg: ASbGnctkiOuf1CASSROlSFFd4oydNN/NXh2B0PouqdBffzcSIwhKvGcQTYpUtcLzbLR
	cDw4Dt9ttv5/p09Qd13uEXdafj2W0ztg/+YH1VMbvvGXjKmGtAsCsoQ6TeakhPwZeO7Vd3AGEJC
	Y/KiYUdyEF0aAnnN3m7Q69Oz3mRsJhPqXaPH40JGjdQR992+Aq+yShU0OhyabyBK4FpmUPL8fXy
	m8waJalfy9pmuBtpHxpJaaoA362TrdU7DDjQwQHDn6Tc+b9UmGsYgTpceYFz4VjjbO4fyJlIlps
	YuoSbIJP+hYE5jzH3mHyOOoTekKrmnydg1ZIXN+kpP31B742R114taHXh0hq5B0U+yLlnkbtKIl
	lArRsfZjfxcQG6obK4ocqI/Bo2LBZyJuXhJ4djfGPRuoAZpITo7cWXAxff9pka+Rd6SxM9LnT1N
	kwaks8W9o=
X-Google-Smtp-Source: AGHT+IGlcJiym2KX1slQIrlgQmbPuWZOBT87I/8rYrzq7nMepdyb9lDBGPZionCIRhDv15xcAws+GA==
X-Received: by 2002:a17:906:fe05:b0:ad5:777d:83d8 with SMTP id a640c23a62f3a-afe29447253mr1103055766b.29.1756132994305;
        Mon, 25 Aug 2025 07:43:14 -0700 (PDT)
Message-ID: <f6e4561d-a554-4ac1-afad-c4b010e1832b@suse.com>
Date: Mon, 25 Aug 2025 16:43:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/13] xen/cpufreq: add missing default: case for x86
 vendor
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-5-Penny.Zheng@amd.com>
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
In-Reply-To: <20250822105218.3601273-5-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2025 12:52, Penny Zheng wrote:
> Since we are missing default case for x86 vendor, there is possibility (i.e.
> new vendor introduced) that we will return successfully while missing the
> whole cpufreq driver initialization process.
> Move "ret = -ENOENTRY" forward to cover default case for x86 vendor, and
> add error log

Requested-by: Jan Beulich <jbeulich@suse.com>
(or Suggested-by: if you like that better)

> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

