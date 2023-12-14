Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FEF8136EC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 17:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654713.1021956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDovl-000892-CH; Thu, 14 Dec 2023 16:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654713.1021956; Thu, 14 Dec 2023 16:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDovl-00087N-8D; Thu, 14 Dec 2023 16:51:25 +0000
Received: by outflank-mailman (input) for mailman id 654713;
 Thu, 14 Dec 2023 16:51:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDovj-00087H-Vm
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 16:51:23 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 023a42b2-9aa1-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 17:51:21 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a1f8510883aso764866966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 08:51:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fb4-20020a1709073a0400b00a1c76114fcesm9625021ejc.218.2023.12.14.08.51.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 08:51:20 -0800 (PST)
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
X-Inumbo-ID: 023a42b2-9aa1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702572681; x=1703177481; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dNYvtmubaofRIkT+8zeBPrH20RsMCKxGj/hy+mbuttg=;
        b=ZCI2dE7DwxM7TGwEH/W98UQl5/kDo5xpUzgcJTZlRpVKIiaMlcaXAkb14lepM1+Wpd
         ZG1265LmepILbDfFZIMfS/ntzWzsyLjuv0S/iY7uw6pb7xPzhDn++hAe+M1WQuUaNkIg
         WXOLdYr/B/oCRdKmfOW3tVV31ygxIuKNLtwQAt4H6J5eztcHeDw5bcfK56QzIwvwzSg1
         lGUwEBt4gIBT4aJ8Qr3Pq4gsBqlmOGhZjThydTMl5CO8WgX/uCMLhdS1AMKKtyXwiBxy
         rXS5MFHMD/5NY+iXmZzJzajCD/+d1dlcQwa61Tn53KcGw9SWZHX58xj0QGzc8Fp2GfLb
         4s4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702572681; x=1703177481;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dNYvtmubaofRIkT+8zeBPrH20RsMCKxGj/hy+mbuttg=;
        b=Smp2+6mZk7cRLc9CN3f5ngBqrSfF4SXQKd4+4bOoWyXwIMmE2ACCCYsVMdlodLLTJA
         ZrT5UjxWCK9+miyKzqPqwNDrSZrBc5olBOG8r7KW+twYpZmDRqRBLa0DDRa+x436tXiN
         tXoFC6AH/xGiHPS0bOrPym5xs/5Wu9r79+rcC5spWNTrwoey8GUh6MsI3GVM9u/O6MLI
         dAGnE/k1aOPOd/2mJjC+LGIwRl1mN/uvIY+zhtaFmVKsrsqNYnuCvujFz8a+C3kNcusg
         shN68U+jObjZv18YZB3/ac9yJNghHJfPEWW2gZImf7JAv9U7cIypkgMegUdqFvYXKWXo
         XPYA==
X-Gm-Message-State: AOJu0YxeXFRFfxI47xSnIGvcRL6BCWjmBXKfMOW1WNL3MkByZA6D5hSW
	Vcjph6ItJWpoVzC5f9Hov6+1
X-Google-Smtp-Source: AGHT+IHAfK/aMq5JTkZTVoxqjTWTGnapFIQ6MDVU7sNkwjPuPuv4iorzyFVh9S/Ja7y7SW5fVICMdQ==
X-Received: by 2002:a17:907:7f1f:b0:a19:d40a:d1fd with SMTP id qf31-20020a1709077f1f00b00a19d40ad1fdmr3436465ejc.201.1702572680909;
        Thu, 14 Dec 2023 08:51:20 -0800 (PST)
Message-ID: <b93417c7-1375-4bf4-ace2-d36bd63c8b0b@suse.com>
Date: Thu, 14 Dec 2023 17:51:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] xen: add SAF deviation for safe cast removal.
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
 <36e996b864853dba26a9c9fb9c9c674e92cc935e.1702555387.git.maria.celeste.cesario@bugseng.com>
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
In-Reply-To: <36e996b864853dba26a9c9fb9c9c674e92cc935e.1702555387.git.maria.celeste.cesario@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 13:07, Simone Ballarin wrote:
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -28,6 +28,14 @@
>          },
>          {
>              "id": "SAF-3-safe",
> +            "analyser": {
> +                "eclair": "MC3R1.R11.8"
> +            },
> +            "name": "MC3R1.R11.8: removal of const qualifier to comply with function signature",
> +            "text": "It is safe to cast away const qualifiers to comply with function signature if the function does not modify the pointee."

I'm not happy with this description, as it invites for all sorts of abuse.
Yet I'm also puzzled that ...

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3413,6 +3413,7 @@ static enum hvm_translation_result __hvm_copy(
>  enum hvm_translation_result hvm_copy_to_guest_phys(
>      paddr_t paddr, const void *buf, unsigned int size, struct vcpu *v)
>  {
> +    /* SAF-3-safe */
>      return __hvm_copy((void *)buf /* HVMCOPY_to_guest doesn't modify */,
>                        paddr, size, v,
>                        HVMCOPY_to_guest | HVMCOPY_phys, 0, NULL);

... this is the only place you then use it. Afaict some of Arm's copy_guest()
callers ought to have a similar issue. If so, an enlarged patch should be
discussed with a larger audience, to see how we collectively think we want to
put this specific kind of deviation.

Jan

