Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8718BC822
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 09:12:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717248.1119263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3sVn-000114-Il; Mon, 06 May 2024 07:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717248.1119263; Mon, 06 May 2024 07:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3sVn-0000yk-G4; Mon, 06 May 2024 07:11:47 +0000
Received: by outflank-mailman (input) for mailman id 717248;
 Mon, 06 May 2024 07:11:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3sVl-0000ye-NW
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 07:11:45 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e50fec72-0b77-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 09:11:44 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2e34e85ebf4so5038441fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 00:11:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c35cd00b0041bf45c0665sm18690774wmq.15.2024.05.06.00.11.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 00:11:43 -0700 (PDT)
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
X-Inumbo-ID: e50fec72-0b77-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714979504; x=1715584304; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7/gYtPmo8Zt50VkQkmr9V5PyAFFkrgi1XLQy4kWdE0=;
        b=B4BLMBVAIjSdqaTCuNLOcN0QT6JrewBKjI8NKO6vIPvyJwBpPW9wqsa84q3JsqNST4
         CFBovl7NZ8uE/I0q9zPL71sD4TGHM2nK0Ot4ClnI7NHKCfXGD1UQe+Oc4R9cuytuMZLQ
         hrYaAePoeY2rK+5OG4wW+Ia+WNtXj5dk07bxrIDsEAFEgl5qbmS1eCRyYd9z383Mvhy2
         1yDi+VT9gRRk9O+CcRBsv47xrVsrgfYNE7rFLlToUc4UtezqcqneeMHxa9RQvlRysLkk
         aHAG2TvdDz0/A/Tm72tOx0IlW1fc/PCWk0ickMzRWKr0oOaEjUDjsP6vhOEZLw7G4OE2
         GXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714979504; x=1715584304;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7/gYtPmo8Zt50VkQkmr9V5PyAFFkrgi1XLQy4kWdE0=;
        b=If3mUB8zZ57ZtiXKL3cscwcaiI/oEUcUlbljaHHhaVGW82VIYtiH9reMg5AxRSxxP7
         L89B6nR9WH3FtnKe3kPr+KMIEQX/LWzsfejvq7Rct0mCttAddrAlmO56pZzGH7QwisTG
         bMkzdofYUUw34zuKIWeN1fcKk04E1lb+IPDhAPDSsnVu+q+Zb8WMC1XO31/ppUneu42+
         /Y8Lq43HnTE9uU6VavtbkZRRLbFqAXrH0UoJdq9dFbkYfDbrirL3cX2u/4HQFa+kXJOB
         QY8DRV77RFcQz2xEonRyXlOpgv+irh+m9Pgm3BLLv9y4z5z/M/ayJ4KTMWBDmipGziF/
         pdNA==
X-Forwarded-Encrypted: i=1; AJvYcCUrxguKE+9Bsxp1Rfi76OzzQszRCzvh0hH715tYHQdn+Tjf18vf9xCWUPleVXxrEyTNf3sNbJE56NWisNXq+lW2t0NLdUD0gMipKdok1Vc=
X-Gm-Message-State: AOJu0Yyw6Cxy6El6E0zAnruH5SrjkVt3ul6hyraueWhh7KHMrCuhXvC/
	rChfxemubS1N9kggQeNj5urLkFsERSGq6BwKFNdA8oM2ayKtX6FduI6FD6lorw==
X-Google-Smtp-Source: AGHT+IFbBmoOdv+4VkzeQmjUmBEO14EpVLCzIZxMLHZRsCBBiK5Yw8BL7UOt80ewzpJuswnSB4erwQ==
X-Received: by 2002:a2e:812:0:b0:2e3:6ef5:d567 with SMTP id 18-20020a2e0812000000b002e36ef5d567mr805813lji.30.1714979504204;
        Mon, 06 May 2024 00:11:44 -0700 (PDT)
Message-ID: <8c0bc745-05f5-4839-b920-7830e2c55688@suse.com>
Date: Mon, 6 May 2024 09:11:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.19 release status tracking list [ May ]
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: committers@xenproject.org, community.manager@xenproject.org,
 Kelly Choi <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org
References: <32e2d9dddfaa80e8edfaa5a7207c4e7fb7862a45.camel@gmail.com>
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
In-Reply-To: <32e2d9dddfaa80e8edfaa5a7207c4e7fb7862a45.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.05.2024 18:54, Oleksii wrote:
> *** x86 ***:
>   * [PATCH 0/4] iommu/x86: fixes/improvements for unity range checks [
> https://lore.kernel.org/xen-devel/20240201170159.66330-1-roger.pau@citrix.com/
> ]:
>     - almost patch series have been merged already except the patch:
>         [PATCH 4/4] iommu/x86: make unity range checking more strict
> 
>   * [PATCH 0/8] x86: support AVX10.1 [
> https://lore.kernel.org/xen-devel/298db76f-d0ee-4d47-931f-1baa1a7546cf@suse.com/
> ]:
>     - two patches of patch series are waitng to merged/reviewed:
>       [PATCH 1/4] amd-vi: fix IVMD memory type checks
>       [PATCH 4/4] iommu/x86: make unity range checking more strict 

This sub-item doesn't really fit the topic, and seems to rather belong
to the earlier one? Where (correctly) 1/4 isn't listed anymore, for
having gone in. As to 4/4 - Roger, I'm not sure I can conclude what the
plan here was: Are you meaning to submit an updated version, or did we
rather settle on not further pursuing this?

>   * APX support?

I think you should drop this now. I'm throttling further work on the insn
emulator, as long as I have so many other patches there pending review.

>   * [PATCH v6 0/4] x86/pvh: Support relocating dom0 kernel [
> https://patchew.org/Xen/20240327215102.136001-1-jason.andryuk@amd.com/
> ]

There had been a v7, and all of that plus a follow-on adjustment have gone
in.

> *** common ***:
>   * annotate entry points with type and size" series:
>     The bulk of this has gone in, but there'll want to be follow-ups.

I think these follow-ups now want tracking on a per-arch basis (x86 and
Arm, with PPC and RISC-V filly done).

>   * [PATCH v2 (resend) 00/27] Remove the directmap [
> https://lore.kernel.org/xen-devel/20240116192611.41112-1-eliasely@amazon.com/
> ]
>     - 7/27 were merged.

Hmm, no, I don't think that one was. Other were, yes.

>   * [PATCH v6 0/7] MSI-X support with qemu in stubdomain, and other
> related changes:
>     - new patch version was sent

1/7 was committed.

>   * [PATCH v3 0/4] xenwatchdogd bugfixes and enhancements [
> https://lore.kernel.org/xen-devel/20240411182023.56309-1-leigh@solinno.co.uk/
> ]:
>     new patch series were sent.

Was there anything left from that series?

Jan

