Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E4B8D2DDE
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 09:13:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731482.1136989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDUk-0000eR-Pz; Wed, 29 May 2024 07:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731482.1136989; Wed, 29 May 2024 07:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDUk-0000bH-MV; Wed, 29 May 2024 07:13:10 +0000
Received: by outflank-mailman (input) for mailman id 731482;
 Wed, 29 May 2024 07:13:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuQ4=NA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCDUj-0000b7-Fh
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 07:13:09 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e52a47fd-1d8a-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 09:13:06 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a5a89787ea4so178230066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 00:13:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc4ff24sm692535466b.130.2024.05.29.00.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 00:13:06 -0700 (PDT)
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
X-Inumbo-ID: e52a47fd-1d8a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716966787; x=1717571587; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ym8+Kx4FdFlFPWRKcWibUZmDuugOnBJ9TD8u5uTPtag=;
        b=fDCDaogex7N1vuLQAgjdPuvKoDoOSfg2a7U57kL6fJ+Yq7YRIhlcvlVGaDmbAUze3a
         T59ZuVCL3R51i71PZ0Shl7qp0yJ+CuNTRX3jgiAM+coyMqexw4pt6aATFNWiQYOfYP1q
         1DC5BBLaP3sqjv54cGiKWulKx7ZQptlTpuX0OMcsbjAjLHOUFFqxmh/cFN0EF3BTiivH
         UERI9KYlGsgeObAPLYj6tozT6CRWHx0/tZR0AZzgkGNw7MSk/fGU+KsQ2nQpFphmJwKu
         Wu2pl9+6IYUSKKbRHweisu1SNc08KKgD+AdrW80fP/21QZOWSXgV67YKs1h8bi9Is0HO
         JuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716966787; x=1717571587;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ym8+Kx4FdFlFPWRKcWibUZmDuugOnBJ9TD8u5uTPtag=;
        b=ilL/f4c6ueL1gWgH2xvMrXYOmE6VSTq7Jf4qo9n/NIopgHqz6dvi+ng+IB6++viCEZ
         hBpA/VC/YHM0vlaDSOApTzwWEtdSQh7g1KVgpiDh6C0KpWvKpGUVk4uqdtX70rs5iB0G
         TZKM2u1CVQXjyWEZz7BSWuDCrHb6zF6Ov/b0YckVTNMkgjW8yeQj7s9zYcQZesVsYqx1
         V1OTn3aqBiz5NI6/ioWY9WgGxtD1OetZXDm1e3/V1+mB/6EMdxkWqHTdKZqHZU39ZU/H
         PCiIAzDEiDEAwcSI3hakf2Jn8JWua+PJ/NTWUNVyMO3mNdDs1Rzvo1ILWN4U63BOUzzk
         ctiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZY4zsTPYWIl8erDzCGi0fr3edFBhg3JQ1W7aNdo0PDKrufcq//i3zRo+jk8i5eq/mdiFjDlPTUUrWU6z5rNvM2TOMJO0ShjpZJNBzGMk=
X-Gm-Message-State: AOJu0YxJegdJKpTLHpDPGerg9QZxRYtxJRi/eQv+xquIHVp2oLy7OFxL
	FMc+yuIBiDtL0mir7rVQ6AwBgvp/3LgD2FnRse+dS01nxp7QH1vgmy20XR4ycA==
X-Google-Smtp-Source: AGHT+IEif6jGTfTkRxmBNVRO7V3ZOrM6H7KDujrAx/g/YW86O7/9C8M3wTJ/VYJT1S+j3OmCOm6DmQ==
X-Received: by 2002:a17:906:2482:b0:a59:9e01:e788 with SMTP id a640c23a62f3a-a62646d6280mr900924266b.34.1716966786871;
        Wed, 29 May 2024 00:13:06 -0700 (PDT)
Message-ID: <7ba8686b-8d59-4107-b807-0e8397fc0e25@suse.com>
Date: Wed, 29 May 2024 09:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.19 0.5/13] xen: Introduce CONFIG_SELF_TESTS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240528142238.1340228-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240528142238.1340228-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.05.2024 16:22, Andrew Cooper wrote:
> ... and move x86's stub_selftest() under this new option.
> 
> There is value in having these tests included in release builds too.
> 
> It will shortly be used to gate the bitops unit tests on all architectures.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> I've gone with SELF_TESTS rather than BOOT_TESTS, because already in bitops
> we've got compile time tests (which aren't strictly boot time), and the
> livepatching testing wants to be included here and is definitely not boot
> time.

I second this consideration, fwiw.

Jan

