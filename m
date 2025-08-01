Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FB6B18072
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 12:54:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067130.1432087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhnOt-0006N1-Ij; Fri, 01 Aug 2025 10:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067130.1432087; Fri, 01 Aug 2025 10:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhnOt-0006Ky-FB; Fri, 01 Aug 2025 10:54:11 +0000
Received: by outflank-mailman (input) for mailman id 1067130;
 Fri, 01 Aug 2025 10:54:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhnOr-0006Ks-Rd
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 10:54:09 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0f6045f-6ec5-11f0-b896-0df219b8e170;
 Fri, 01 Aug 2025 12:53:54 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b792b0b829so657103f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 Aug 2025 03:53:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8976faesm40101985ad.90.2025.08.01.03.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 03:53:52 -0700 (PDT)
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
X-Inumbo-ID: d0f6045f-6ec5-11f0-b896-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754045633; x=1754650433; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dzw0jvoYpBumudTdyTSssK3nPxuNuukPGO7ijvXwNjM=;
        b=SsGWirhacVbDOcEavzyjkV/xT0gTKbBB7GsuBQHXs2YJcQ5+iyUrW12E5+52dAXxk7
         VxHDFFsHmV5gIwSu0EkQmKVNKFS/2uII00aN9jmH+KLZFlGk39VgAT2y8O5mNuFTFMMF
         /OBJePBqQl6oF7K8NcsWYneffzHgpzqsPOnvpiqgFFJpbEmxrOGhJLkUMCKtjnGNfgaH
         fQGEDXKXp/OPycaoc7ZsVa1+zjqnSewmyUS884549h3Wpx/bFyJFXddmpOIiGK2fZVYz
         EdcxcXVUud1JjKI4Req4R0kmXqVmmkGDhakP/2CqwWEiCEXDVzM8hZFmhJZno+EIqh1K
         7S4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754045633; x=1754650433;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dzw0jvoYpBumudTdyTSssK3nPxuNuukPGO7ijvXwNjM=;
        b=Dd71xPfNmNpeh9kzU3+Eshl10cQKsLUkVRx6aqP+/SjbY12adtrQrMIeIQ8fVIh382
         llyDCF+x3KK0As2ql5Bo4ksDsAmFUS6S6t2WamHs5mSdPhqN9Xskpy36ZOVO4nMA7KW8
         ItJArGiLY+rDfwLjytsl3ZjKJJ67c4LYr2wsw75QUphEZeHICziHRZpjsTnaVM3t+6vD
         LKpM+qHreVDLZmzSoQ115hcaKW52DS8a1ouN9ppWWULsA4HjFMTnhT0760HB7vHTUNal
         N/DvU6JL0go8cH7LPiE7GpBLvaiDhe1eDZEvHfcq420jxTN8MaiSVsNCFS8yGdX/lp57
         JkrA==
X-Forwarded-Encrypted: i=1; AJvYcCVmjtcIni4g8rbsQpOSr1k099ITtKJmlVNuWjaolIAeUhoYKXlk28o3G9xHHeO06xhMlz08EWvkCTg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWgc9sTpSDJ4FxfdD66PxvXJvh7wL6LgvxJCvW9NbCGJTvlu/f
	FZKSoe14lJvCmTlzvYmMtu/fMxLO0we5xvWZOeaj2O9d9Yi33MGhDbF3d4xoGAftmA==
X-Gm-Gg: ASbGncuZ08IGJUE46CvuP9yJV411FkByZlFqbZscvZJ0MZ1+TemppmBh3+lniHvR3ZK
	d9gJYy4BgSxmSKT7MkS1skS/gBvWT5Elb3XLn5Tj5rU9kalP6hg8wkIlp0u8WmCHIlrwcqAvaXE
	Vz2EyO+m6YTSIjQUDFQzIwkbJWn7ZPXM3PvKE0BPZ3yJAAf5q2kqMDNp6Pa/kv7DwuvLMUERGq3
	yImkycBhD1XFP34AwT7jSjumQ3JGzpOVNEm8yeP8u+6CyxNeUyS8BptJbxS7J1bmOhEikF83o3i
	iqL49h2aBxdCof+JF51BydjszwVe8lalltEFBqUdCBpjfJSyeMAXPH0qsq+H98a9SN+4shmn4eJ
	tJ1SZEkxsk4wLZUS8jgP6l0mwsrXzxLSY44XT2UVsTXWHsXlXIU3wsDFkPS/tgL10BiKtKKOpSm
	x+Khc4BaE=
X-Google-Smtp-Source: AGHT+IFoGClV3mYZ7SNTCb5HDE+z5tHV2CswugLxr/m7879iPjphg/wGuUVKjALoojmKH+RBoxUx+w==
X-Received: by 2002:a05:6000:2584:b0:3b7:5cd3:fc44 with SMTP id ffacd0b85a97d-3b794fc2bd5mr8303471f8f.4.1754045633448;
        Fri, 01 Aug 2025 03:53:53 -0700 (PDT)
Message-ID: <4475f575-91df-4f9d-ad05-41a4864baa11@suse.com>
Date: Fri, 1 Aug 2025 12:53:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] misra: allow discarding 'noreturn' during conversions
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c68de6862ee6d3d6f33eee4db278096c833c17e0.1754043159.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <c68de6862ee6d3d6f33eee4db278096c833c17e0.1754043159.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.08.2025 12:48, Dmytro Prokopchuk1 wrote:
> The conversion from a function pointer with the 'noreturn' attribute
> ('void noreturn (*)(...)') to a function pointer type ('void (*)(...)'
> causes type incompatibility according to MISRA C Rule 11.1, which
> forbids conversions between incompatible function pointer types.

This wider deviation ...

> The violation occurs at the call site:
>     smp_call_function(halt_this_cpu, NULL, 0);
> where 'halt_this_cpu' with type 'void noreturn (*)(void *)' is passed to
> 'smp_call_function' expecting function pointer of type 'void (*)(void *)'.
> 
> The 'noreturn' attribute does not change the function calling convention
> or parameter handling at runtime, making the conversion safe.
> 
> Configure ECLAIR to treat implicit conversions that lose the "noreturn"
> attribute on a function 'void (*)(void*)' as safe.

... wants connecting to this more narrow Eclair configuration. That's what
I meant when I said "description also suitably adjusted". For example, the
last sentence above could start "For now, configure Eclair to just treat
...". Can adjust when committing, assuming an ack for the .ecl change
appears.

> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com> # docs

