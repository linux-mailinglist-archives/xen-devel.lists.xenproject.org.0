Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2F494BF18
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 16:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774307.1184778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3kt-0006hp-9O; Thu, 08 Aug 2024 14:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774307.1184778; Thu, 08 Aug 2024 14:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3kt-0006gA-5a; Thu, 08 Aug 2024 14:04:39 +0000
Received: by outflank-mailman (input) for mailman id 774307;
 Thu, 08 Aug 2024 14:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sc3kr-0006g4-KD
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 14:04:37 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24959d70-558f-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 16:04:35 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2f149845fbaso11381071fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 07:04:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2bf841asm658654a12.5.2024.08.08.07.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 07:04:34 -0700 (PDT)
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
X-Inumbo-ID: 24959d70-558f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723125875; x=1723730675; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F3Hiwn83/hPkHG9ZCiIgmFLjceHba451PSwmIJ/BWag=;
        b=O/x9OopAdvPa6rO/EnNcjP6u/xt2rLaI+tWEDAh1rP30MgWDzeBUt5VA8V6SPRQXaS
         X7y43rw6Emga58TmTTh2cUuGadD8Zmaf/hQTkeTyPmGLJ9u4VxBcpm0kOTDc+EH5bjuj
         8UHRSoDBCfASpjdjc9b7IAunnoUDHWvxXlA75iqEdYQx3UqPhzk0e6da3IqS9W7Z1wc/
         Ubnl7Ft/v7qDdOg2o6RgtzRa2YhESgCMacXSvdviPVpbB1Y5A76gWZMcDWm5BVGuD1iI
         SL/cofxC4VMO6Sf7+apjdsJZ4KpsjmZBRe8UOqr88cMpPhH6C4zraoClik+gv0i9jDWm
         xYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723125875; x=1723730675;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3Hiwn83/hPkHG9ZCiIgmFLjceHba451PSwmIJ/BWag=;
        b=WAbHDfXCClcy9Sv9hVZyGeVyeAn6NSWMqt6ngqbg1VXiccJXefPTzPAEn+icRPjfJj
         xwgWAIqDP0+nu1oqXaObTZHZx5s865mmTH/ASsJYSdaylGvGSagND16oWBDvlu8yvcet
         9ilQk3C+clTp8/YC30UZRp9gA0C8Wi4azZ+nr+Pvo1IiHz4zC44i2IznaSbsUrgjIEMb
         uhTT9k9PQeW7gcIimNiSsfJTDa43coiHbHdvm3pT1ohLPvZVIpPvUyGTolR3ioHztLP1
         cadc1uc4nRb6BdN4fccc2W+KuWtHuMGJw0U7FwAR3Y4M+CA1VMiFrmNkziS4itdglqB1
         /DvQ==
X-Gm-Message-State: AOJu0YzokAuQVEw4dYBeKaB1Ie2tDGJxTJPeoKK6TRBMjnhZtHaeXrY7
	R4XT5ITTwG9NwQglaTMJ4DCjbwG63zjpqOJ/6vKF/9bCUbVos3qXmlF0tVvNVA==
X-Google-Smtp-Source: AGHT+IG44mFLqcGbvRUJdVwV24iQGHsI8hYShcqkZ2Qx7qzDu0NWYYwQh8ytUSWeGg3NNXaWEmkIqg==
X-Received: by 2002:a05:6512:3350:b0:52e:f950:31f3 with SMTP id 2adb3069b0e04-530e585b975mr1247762e87.35.1723125874543;
        Thu, 08 Aug 2024 07:04:34 -0700 (PDT)
Message-ID: <2e0eac09-4065-4f1c-ba09-70cf9ff9e834@suse.com>
Date: Thu, 8 Aug 2024 16:04:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86: Fix early output messages in case of EFI
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-3-alejandro.vallejo@cloud.com>
 <7f1e17dd-d105-4f6c-87d3-69f3dca4ab82@suse.com>
 <CACHz=ZjYdBcB_S1tpXpuRQDKGAKY=SrgTEy8_0Wyq_q+bOBfHg@mail.gmail.com>
 <bd4c8ef5-a6bb-42ae-9b69-c3d14eeac55e@suse.com>
 <CACHz=ZgRK2DMHmiAVsBo1WJVBxbnTka3-CcpgopKB-6gWs5ZSw@mail.gmail.com>
 <57e01574-2e06-4dd3-bf7f-91b5a19477b1@suse.com>
 <CACHz=Zi56VX7VE9ESRhm-3YJCqKV9z3yZKY+nWrz827e0t+rnw@mail.gmail.com>
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
In-Reply-To: <CACHz=Zi56VX7VE9ESRhm-3YJCqKV9z3yZKY+nWrz827e0t+rnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2024 15:17, Frediano Ziglio wrote:
> The computation of %esi is correct after the additional "add" command,
> in the sense it will point to the current base (under 4GB) however
> then you will use syms_esi(foo) thinking "if %esi is correct then also
> syms_esi is correct" and it isn't.
> So either you need to add another offset to make syms_esi(foo) correct
> having %esi not pointing to the base or assuming that syms_esi(foo)
> would need fixing.
> Potentially the first option would be better, you just need to
> remember to correct %esi after rolling back relocations.

Right, the preferred goal is to have sym_esi() working right, so you
wouldn't need to touch all of them. The number of direct uses of %esi
is, I think, far smaller.

Jan

