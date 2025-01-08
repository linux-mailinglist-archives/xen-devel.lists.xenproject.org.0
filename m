Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CD1A05457
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 08:18:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866874.1278237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVQJ0-0000Cu-1j; Wed, 08 Jan 2025 07:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866874.1278237; Wed, 08 Jan 2025 07:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVQIz-00009Y-VF; Wed, 08 Jan 2025 07:16:41 +0000
Received: by outflank-mailman (input) for mailman id 866874;
 Wed, 08 Jan 2025 07:16:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVQIy-00009O-2t
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 07:16:40 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ff6a07f-cd90-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 08:16:38 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso162380975e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 23:16:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a88d0d608sm306785f8f.36.2025.01.07.23.16.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 23:16:37 -0800 (PST)
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
X-Inumbo-ID: 7ff6a07f-cd90-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736320597; x=1736925397; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/ke2hpKYf/kZRfjJaCYG3J/nDiww96DRBbNoB21XHoo=;
        b=a9mVyVnmzR0cbSMeBfNUBftlNtC1M9zUGJoPCW3Tywg/80Yj6JDTwan2YYirSC28cH
         ThTuDDM7oCBM4q9pDzhBd79LFRUm6LHnbbayHIV6IH2zVvnwy2zLpk4eTGNXzACHlAaT
         tJiB9JrJzgCKvxsLJsNn619JWaY5lcw0y7YWCXS5YXIbChWwHUdoqH4XW4zFIC0iUXQ7
         vGJI0uLHBzbkkLee5UnYT63xsrF4MMpC9o+YD5rewo+CYNKpc66RC3pQZrJHumHEFADs
         LpmK53qVokkUYKPLlJFZwxaNh9TACJjbd9jPednWqh0f0LiaprXV23qaEOOBqjDH8Nzl
         pRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736320597; x=1736925397;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ke2hpKYf/kZRfjJaCYG3J/nDiww96DRBbNoB21XHoo=;
        b=tQLYx93Cs+Vu8JupH/q4SLeBW3I78Rcm2w5cQLbFtus7WWuj6AJqxeGUd7OKBGueAE
         XsQ0TBIkt/Djt8O507YF6K/FLZ94b6y2bcpJdjXe8F9pfLjtlbY0bV50FlVGaIIJl8f2
         N6AYkR3tHOjehU2zZQAWKFQCYCKylNsAPI3r7tGOH+e3FQyA7bym9E6oT5hCGwvIOa0F
         g4MobDXxClYjKDu22FU+/5zpHORwp7fR4IoGvpR8gCHCHs7CnoDKxEz6ILBjCaIRMMNp
         7zymUnAgXm1FzMxuVmDl06MWSdCwcHVVqfBF7DGxUUSDAyOpKjkQKaM0bcUDWj3/rURS
         uBkA==
X-Forwarded-Encrypted: i=1; AJvYcCWvXhXEO9qkD7uDU1rCeeRSoKkTpo7FML2tEBdzMHdxGAqTrMeNUsR/SrgWBlPj7qJj0P4Mt2XyfEo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEkgTXTp9U/rz8vOY25cywjxyDxZeKRSyFoHwwhLN2k89U/PSJ
	IsGBBRHIVbiEwdCohFtFytNx/HpNTiJmhbqRL7NmgIKs+PAmCOh3Nd2mkz7mXQ==
X-Gm-Gg: ASbGncu/l9c4MIl6Tfa8Ufz0G033JWQrkfgeaI2yUyqrDfipu0pUnz+jMbafQX9vNUL
	RPwgDGYQvN67M+ZBfRtSHQBqKUoecFIxn5r/mAsUvV202LmaD496u+jk51ZJp5RfK/L/JSoOGF9
	pY4jyXdGyJ98eyRpDNL9atl1dSejwq24qt/7Pe8JjAFh30M+/hOkOl2R/8t+gaCy/Pb1em7BH9J
	vkK3Jyu7b0mT0Fjeys6nDRLuIdz7zvCqn1SsDMKIMDoOe4sHALKcFkvPUETXVr8lC6dCT7M4sdB
	TMudT3FgDXKXzLdZFg8rhHpyAyXsL/sct6Eh6VvmQA==
X-Google-Smtp-Source: AGHT+IFQ5YlQVV92ZCiB3mWMzlPX97SK2YS2fBNCh8YBBF5pmqkyNXQVfGXHeipjqWd8eDUWd6KXFg==
X-Received: by 2002:a05:6000:470b:b0:386:37f5:99e7 with SMTP id ffacd0b85a97d-38a872f51a3mr1085079f8f.33.1736320597321;
        Tue, 07 Jan 2025 23:16:37 -0800 (PST)
Message-ID: <b182555c-555e-4efc-94a0-5f383f7d8689@suse.com>
Date: Wed, 8 Jan 2025 08:16:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86: Add Support for Paging-Write Feature
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1735837806.git.w1benny@gmail.com>
 <31a1ff2d5d1e17bb73231e008f1e47c501bb3ce8.1735837806.git.w1benny@gmail.com>
 <d6eb70a7-5895-4471-95b3-609f133fa457@suse.com>
 <CAKBKdXjJm5194Wa=gy=DikiUEsevrB2Xn-idr+vgfgJMBrfZ-w@mail.gmail.com>
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
In-Reply-To: <CAKBKdXjJm5194Wa=gy=DikiUEsevrB2Xn-idr+vgfgJMBrfZ-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.01.2025 18:18, Petr Beneš wrote:
> On Tue, Jan 7, 2025 at 5:46 PM Jan Beulich <jbeulich@suse.com> wrote:
>> Hmm ... Instead of you touching the bit in every one of the case blocks,
>> I was expecting you to clear the bit ahead of the switch(), accepting a
>> double update in the p2m_access_r_pw case.
> 
> I did consider it, but ultimately didn't like the double-update.
> Similarly, the switch-case above does also set each bit in the
> "case-s" individually. But I understand it's more justified there.

Right - it's setting them to all different combinations each time.

> However, if you insist, I'll fix it.

Please do; it helps readability quite a bit in this case, imo.

Jan

