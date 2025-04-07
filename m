Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA64A7E295
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 16:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940266.1340097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1nnp-0005hy-NI; Mon, 07 Apr 2025 14:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940266.1340097; Mon, 07 Apr 2025 14:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1nnp-0005gP-KN; Mon, 07 Apr 2025 14:50:21 +0000
Received: by outflank-mailman (input) for mailman id 940266;
 Mon, 07 Apr 2025 14:50:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxXC=WZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u1nno-0005gJ-1j
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 14:50:20 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e43ae38-13bf-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 16:50:16 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-399749152b4so2425678f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 07:50:16 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b6321sm12084818f8f.44.2025.04.07.07.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 07:50:15 -0700 (PDT)
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
X-Inumbo-ID: 9e43ae38-13bf-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744037416; x=1744642216; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LQKnYNO9DqqwE3WE/HJDHtu5sw691PY9g7QSQR+6Ogs=;
        b=TbXM7uU1q8aZsx00USwjgCM/yI/L7FEFKhR5Mmi8QZPWL4LhRE1fe6idY9tImgfql1
         QfS49Lq4WgQNfzanB/ivGLgQu6WsSi/alwts9goT1QdcQgPXCVSMKhxa+ItEKPQYhlBu
         bJIj2FxsisvlKeFCBW5lq0roGLORC9z+mwaXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037416; x=1744642216;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQKnYNO9DqqwE3WE/HJDHtu5sw691PY9g7QSQR+6Ogs=;
        b=cSmQSZVrUmifFlyTRJEyh3lbkzWROmKupC8rFQW5M5bInV88wL5QWF2AXBR26p4pOp
         nDPNkjzB5MLeo5G7V0gB9v1+kFKRGeb29EDVFaMttkuuwCOVcwF+DoIU2sJwc1Ubmsm3
         W5UrGyc2wuBndD1Av3iDpgTRIpW+OTyRy3s3qzMgah2VygJo7ZpoTOzLnYr3+04y+oVo
         dFq011gmwXBCYtddrcv6IYc1FpvUyvL7rPKuN5TdierTKb8pjo+k5Bw32YYX1k8s2tYJ
         4KuIqbp3i/eI1+42dZqV/0btgiG0/tpyfTwJ2+/uzYzrN4Vxcg12s1MziNJOpyEPyMMk
         qtEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDvNSOmPDOhR09vmCRnnbl7JbMTXUWB/yco4yIq/z4xIxPOlhdZ79roXHZr5RTeIRe87m3V7AWRJk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9370mhKbFme/RgjEEv4K1FUIkHWik5MOAxCv9huBedai75cKD
	5NhDPjXPR/QJb1GWksOW3/uWKpXikyaL2E4cLTuy/3qRhnDnY/Dfn3PTML1lIUA=
X-Gm-Gg: ASbGnctLxTyvwsQqPtsc1DqVVfbzawsdfpZmJ9eOtgaw0FfGPwkHzXJhT2aSUHEA3Ir
	Co7ejLxpnCVcgVkr2IIWhxdHapUBV6H2H9Fj3JtQu1c6Q0slhbQy2HfWlCUJi9i+RW8gZ2EvQEf
	j+4HuBBWfxheobbxLcx7NakOk0Yq9qVYhfQU1038W/UCU8xezUKki8BuDV8P80ULsU0I/Wbii9m
	jEHUo2HTCMLkM8/wucWd7v6EYU1kneVkoV1MVXfj/SeoNnrwf/aY58BFamJJI4+tPM2uFw10XSa
	A7DVnshdI7Pmrb2gsrEWnXYhvRddyI0VpgHZrUuZ05FVtvqn74Bc+ydXwzK4Y4NfYMZxzZPbOtP
	HmKN22/DNGw==
X-Google-Smtp-Source: AGHT+IFKJENZ0ZFuShK4V0sEwMlIOR2q7w+55JFXsGQt3VV9UE3tzPLSyo4JMXOAqR19pri62vOOFA==
X-Received: by 2002:a05:6000:40d9:b0:39c:1257:feb9 with SMTP id ffacd0b85a97d-39cba980edamr10495566f8f.57.1744037415908;
        Mon, 07 Apr 2025 07:50:15 -0700 (PDT)
Message-ID: <00df5854-0ef6-459e-9cb7-978a9633fc7a@citrix.com>
Date: Mon, 7 Apr 2025 15:50:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mem-sharing: short-circuit p2m_is_shared() when
 MEM_SHARING=n
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <5a261173-d225-44fc-9078-4030ba11cfd8@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5a261173-d225-44fc-9078-4030ba11cfd8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/04/2025 9:41 am, Jan Beulich wrote:
> Some of the uses of dom_cow aren't easily DCE-able (without extra
> #ifdef-ary), and hence it being constantly NULL when MEM_SHARING=n
> misguides Coverity into thinking that there may be a NULL deref in
>
>         if ( p2m_is_shared(t) )
>             d = dom_cow;
>
>         if ( get_page(page, d) )
>             return page;
>
> (in get_page_from_mfn_and_type()). Help the situation by making
> p2m_is_shared() be compile-time false when MEM_SHARING=n, thus also
> permitting the compiler to DCE some other code.
>
> Note that p2m_is_sharable() isn't used outside of mem_sharing.c, and
> hence P2M_SHARABLE_TYPES can simply be left undefined when
> MEM_SHARING=n.
>
> Coverity ID: 1645573
> Fixes: 79d91e178a1a ("dom_cow is needed for mem-sharing only")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

We'll be swapping this for a different issue, but least "logical and
with 0" is easier to filter.

> ---
> Might be nice to also eliminate p2m_ram_shared (and for MEM_PAGING=n
> also the three paging types) entirely from such builds, to eliminate the
> risk of accidental use. Yet that would apparently also come at the price
> of more #ifdef-ary. Opinions?

Hard to say without seeing how it looks.  I wouldn't worry for now.

>
> --- a/xen/arch/x86/include/asm/p2m.h
> +++ b/xen/arch/x86/include/asm/p2m.h
> @@ -136,11 +136,16 @@ typedef unsigned int p2m_query_t;
>  #endif
>  
>  /* Shared types */
> +#ifdef CONFIG_MEM_SHARING
>  /* XXX: Sharable types could include p2m_ram_ro too, but we would need to
>   * reinit the type correctly after fault */
>  #define P2M_SHARABLE_TYPES (p2m_to_mask(p2m_ram_rw) \
>                              | p2m_to_mask(p2m_ram_logdirty) )
>  #define P2M_SHARED_TYPES   (p2m_to_mask(p2m_ram_shared))
> +#else
> +/* P2M_SHARABLE_TYPES deliberately not provided. */
> +#define P2M_SHARED_TYPES 0

You need P2M_SHARABLE_TYPES too, or p2m_is_sharable() will start
becoming a syntax error.

~Andrew

