Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 248AD816AA5
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:12:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655788.1023580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAbo-0003sZ-BJ; Mon, 18 Dec 2023 10:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655788.1023580; Mon, 18 Dec 2023 10:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAbo-0003qu-8E; Mon, 18 Dec 2023 10:12:24 +0000
Received: by outflank-mailman (input) for mailman id 655788;
 Mon, 18 Dec 2023 10:12:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFAbm-0003qi-JX
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:12:22 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee189039-9d8d-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 11:12:20 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3365424df34so1781156f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 02:12:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v18-20020a5d5912000000b003365e7f35f4sm6165150wrd.46.2023.12.18.02.12.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 02:12:20 -0800 (PST)
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
X-Inumbo-ID: ee189039-9d8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702894340; x=1703499140; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=prDamPmLWsLHEbHCY7T2NRUW+DQt+u2BWyu9eE/IYRc=;
        b=A1TUAoTAyJD81VgxrRk1wjyegPJ7NJ4gAelca3Gwju59VUR3tgBjhPKsEQ3O91Ra1p
         TZ9kDTgTKxjHUEXUn+F9skbtltbl42atRNg3i6zzD2vj3YsaRmq26HUexAjLmsrYkz2g
         It3QMevLloUmhvRON3LnZj/I3ZjhYQfTXwQ1qwj0uL6iij/DZNM96QKkQdYUlN62lv5p
         xF78aSCnP9k0WoBl7C8VLB9iw741oQC20E00PTtciKN1TTPMt9YuLYR8ri7LISuogMvj
         Wc2RKT+q0QcgjCY0JOJg5OL6chg73PsVbvdmHS9qxf4o9hr3dPCrHGdMA1NxwS9mvonG
         luRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702894340; x=1703499140;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=prDamPmLWsLHEbHCY7T2NRUW+DQt+u2BWyu9eE/IYRc=;
        b=KyAh1V3kp2c4T1om5TM5nMp1lqbRE+63xHqV8dhFERbRmbeXB/plfrB599cbLZ4USj
         +cB17TtzDYIPFq6A+luCKxtBRAxOMe3zURgIm0x8yX8EQokh4/WdiEPA+gDdYbBLMyk9
         /xlsTurUVUstZPhwlzBIkI/mCPv13tRsndZ4n0wDb/NX8ZoMquY9mFBHqXPer9Gud0QX
         ZHdaHhyRAQIsamNS2Uyz9uU0trafiu6BZjDcdtbg/hT53Ek56emtC4KOVmMZ+aUKP7FX
         0y1D+IZHRDrnDPB4s1ojDQO89hR05ehsobxOWd+0/BfV8heMuQ9Sd8sp/viQZR8urFRm
         hk1Q==
X-Gm-Message-State: AOJu0Yw3s/SuUy0LQ7jb/bT3Dj/vbsh9mO8JPDryuc6ltgf8yVBIEy/+
	ZnpWcBqtafgSS6vefMtjD5TJ
X-Google-Smtp-Source: AGHT+IG/6nGLhFTel3NudfciZM6sg6LlmC1u1N8BXZoZ8KMRM7MftrMxwPSl2z0JuAKVG5zvEfXDtA==
X-Received: by 2002:a5d:63d2:0:b0:336:5a95:8f4 with SMTP id c18-20020a5d63d2000000b003365a9508f4mr2698964wrw.37.1702894340239;
        Mon, 18 Dec 2023 02:12:20 -0800 (PST)
Message-ID: <ef529ee1-7ae4-4a0b-b089-e26feb3b2743@suse.com>
Date: Mon, 18 Dec 2023 11:12:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/39] xen/riscv: introduce asm/irq.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <e9fc98cad562dad495ac1eb87b98be77cda72524.1700761381.git.oleksii.kurochko@gmail.com>
 <479cd511-c01b-4460-bafc-2d3943956914@suse.com>
 <d50405f2181396931941874f24c5018800cc5b44.camel@gmail.com>
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
In-Reply-To: <d50405f2181396931941874f24c5018800cc5b44.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2023 11:04, Oleksii wrote:
> On Thu, 2023-12-14 at 15:09 +0100, Jan Beulich wrote:
>> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in V2:
>>> 	- add ifdef CONFIG_HAS_DEVICE_TREE for things that
>>> shouldn't be
>>>       in case !CONFIG_HAS_DEVICE_TREE
>>
>> Is there going to be a RISC-V build without this enabled (selected)?
>> If
>> not, I'd recommend against such pointless #ifdef-ary.
> For this stage (Xen RISC-V full build), CONFIG_HAS_DEVICE_TREE will not
> be selected, but it will be in the near future.

And from then on it'll always be selected, or only conditionally? In the
former case it would still feel odd if #ifdef-s were introduced.

Jan

