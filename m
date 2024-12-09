Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 753999E9B76
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 17:21:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851661.1265706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgVQ-0004jL-Sw; Mon, 09 Dec 2024 16:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851661.1265706; Mon, 09 Dec 2024 16:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgVQ-0004hq-Q9; Mon, 09 Dec 2024 16:21:08 +0000
Received: by outflank-mailman (input) for mailman id 851661;
 Mon, 09 Dec 2024 16:21:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKgVP-0004gL-8D
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 16:21:07 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9768ef09-b649-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 17:21:06 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3862d161947so2252314f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 08:21:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725d36e66e1sm4243570b3a.178.2024.12.09.08.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 08:21:05 -0800 (PST)
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
X-Inumbo-ID: 9768ef09-b649-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733761266; x=1734366066; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pV39+Nn0PrJDNwThF+d37xy4owZWnGgFZSc46IgfvXk=;
        b=AYb+wYl7SGdh3ZXyZvl+J35Yu6yN20ch+0NGhvc7zdAqHBoIULDqO2CM7v1/Bggw4i
         Ps9RkziQWltwyoMrqOBdcSYC+dpFajP3oxlY+n0g6bin5Pvb5fv622TEhZlggFgBKmiA
         GWdDNSDe25HmhF82mrkA0mhLKRcTfXpoFU77PcIoGNU4xaBaa91BmIOBRQtNLECuVAYZ
         hWD3W/yGPc+USU7aYZN6c3KGEt2/ocJ2zaKJjzYZH1qVy3ZmyhmXZov3hqafhtOxTbFV
         naiGD+6pngb4zB0021CXG779iCpKD1M4THFr1ka4XbUQvHzpivBLf/u12SfFfbiI7cP1
         WhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733761266; x=1734366066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pV39+Nn0PrJDNwThF+d37xy4owZWnGgFZSc46IgfvXk=;
        b=idP8wvsBwV1t+dF6PhFS2aKMoYYUKEtjSP2Pikr5Rx6EW7Kn1453bnSDCpwfRHjpMl
         uxBW8GJR1rBAl8tlmTlhhLtpxSdVqqI8YYw7gc3totBHosUlZp8vuIVK3rUmoUOolWwu
         1+x9c/D12+blWrJY+KaUFeSuqTB7ukSSVBxnWXZW5MTUKnkgFvGl4Kg7WzBYWhQcZ6kR
         3WwoN04luL0c0p1vmFFYMmUn8VFepGNpKf60yIpgYPzEalW0B4mYRm/IT/NVRur+3yLJ
         cdfmx5OxkYiRq8Fo3EpMjhVDwcm6cNZqFK753yKOK4SATPAGxSdGh5qXe9a1kwwj8COB
         hWvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/xDNelviCmGCUDAqfLop88UrWN2hHJiHT0l1vntZx6EmuXW0EHMZMAAFuosZpxbtKRSndHWefT/o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZkkdgNVv+yulDH7McjWGVxoCbAsH6tF0wObGH/HyREo/03MYn
	jgWsv1KHjG/cYaSh/RypHaM7Rey65Hni9gL0afX6r0KD4XKdxnbXVN/G8hItmQ==
X-Gm-Gg: ASbGncv9y1a/yJQEQNT7bi6pDBTLr+VF1LvEceDGzUW0JZBXkhCbbyYELbfM9Ri5TJL
	PjnFWYc1KNzrTOl7I4ZCalItvf87LEh/16jDnqB2nDTf3+l7ocD/1HbQYYdc/unvHYjzTl0/vxo
	5/YKlG/cV4LCsYtvhNeQLiFqQMIIFEPX1cEhVKUWSBzXCpdCTZoT/uVJqx6WcXViX5QT27Gu4mT
	+OJI1QgqvdERpCF3xD7XL+iKDKy/QNAdiRoHxQFQsa8dXytjekbCVOi0NOzFoKTlrtJjDkmKSoo
	hNFZs7Hw4GMXrjKI8OAxfnpBwHY916zkfho=
X-Google-Smtp-Source: AGHT+IG8sF0iHWglgZnU1gFjK5UvEcXKXgLHlC06cCopVW+xjaGA3xCBGO//gxXz/lFckclIKciv9g==
X-Received: by 2002:a05:6000:4007:b0:382:4d54:2cde with SMTP id ffacd0b85a97d-3862b3cea94mr11557373f8f.37.1733761265621;
        Mon, 09 Dec 2024 08:21:05 -0800 (PST)
Message-ID: <0edad037-f6df-4a9a-ba3f-73ea2405604d@suse.com>
Date: Mon, 9 Dec 2024 17:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] x86/xstate: Map/unmap xsave area in
 {compress,expand}_xsave_states()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-9-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241105143310.28301-9-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.11.2024 15:33, Alejandro Vallejo wrote:
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v2:
>   * No change
> ---
>  xen/arch/x86/xstate.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
> index 401bdad2eb0d..6db7ec2ea6a9 100644
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -177,7 +177,7 @@ static void setup_xstate_comp(uint16_t *comp_offsets,
>   */
>  void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
>  {
> -    const struct xsave_struct *xstate = v->arch.xsave_area;
> +    const struct xsave_struct *xstate = VCPU_MAP_XSAVE_AREA(v);
>      const void *src;
>      uint16_t comp_offsets[sizeof(xfeature_mask)*8];
>      u64 xstate_bv = xstate->xsave_hdr.xstate_bv;
> @@ -228,6 +228,8 @@ void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
>  
>          valid &= ~feature;
>      }
> +
> +    VCPU_UNMAP_XSAVE_AREA(v, xstate);
>  }

In the middle of these two hunks there's an early return.

> @@ -242,7 +244,7 @@ void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
>   */
>  void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
>  {
> -    struct xsave_struct *xstate = v->arch.xsave_area;
> +    struct xsave_struct *xstate = VCPU_MAP_XSAVE_AREA(v);
>      void *dest;
>      uint16_t comp_offsets[sizeof(xfeature_mask)*8];
>      u64 xstate_bv, valid;
> @@ -294,6 +296,8 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
>  
>          valid &= ~feature;
>      }
> +
> +    VCPU_UNMAP_XSAVE_AREA(v, xstate);
>  }

Same here.

Jan

