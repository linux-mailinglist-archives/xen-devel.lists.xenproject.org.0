Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 800E18FFD71
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 09:48:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736316.1142351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUK4-00083K-2m; Fri, 07 Jun 2024 07:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736316.1142351; Fri, 07 Jun 2024 07:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUK4-00081c-01; Fri, 07 Jun 2024 07:47:40 +0000
Received: by outflank-mailman (input) for mailman id 736316;
 Fri, 07 Jun 2024 07:47:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5uW=NJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sFUK2-00081W-MK
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 07:47:38 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34f76dd8-24a2-11ef-b4bb-af5377834399;
 Fri, 07 Jun 2024 09:47:36 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4214f803606so17587045e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2024 00:47:36 -0700 (PDT)
Received: from [172.31.7.231] ([62.48.184.126])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d4a827sm3396101f8f.36.2024.06.07.00.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 00:47:35 -0700 (PDT)
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
X-Inumbo-ID: 34f76dd8-24a2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717746456; x=1718351256; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ja/7CEOTFK4lCt0KPlJsNG1ZbNffzZMI9b9F+6ytaGE=;
        b=gFbvklnmDsSxmWldXQLz0Uzd6VKemBqD84jTuASomfMtRHmTk82FErG3PYkweZ2mPy
         T8Yu0jIelmeVGnRzyCmYM7CErWM+s8CftwXUr830zy4ZHO8+dQPME5h46I9RWmfIFxTy
         qt6q0ln96pWnMBGv1GsvHq2Cbgca28we8X9iUoka8toTpOejyV0V7yGHrmj2Yi2F6Us2
         v+ja/J+h17kRvlaCQiCA9+H/E4z+slrC5Dpc5p7B4Tys6mZGYyJ2DtCCzbg3Q2+FmZgJ
         t2f7HBZjRO8tBBFnjY20sUaINNOJreiFgmnXfhHrmH/+POEN0k/6wdPEQUaQVXMWtNK/
         322A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717746456; x=1718351256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ja/7CEOTFK4lCt0KPlJsNG1ZbNffzZMI9b9F+6ytaGE=;
        b=OCye79as/ELfoTKs2WoSGwBTJnzbCj21E23qPEbjkFISqkwEbiL+Lm0ZQaW9RnsMmx
         ygt+t6KrwTOqrofKobFEgct2PkKPssavAD0A99dIFPw8HHh2EhzbkmuDAcBolhsDDAbw
         mS0ytpPoIV6JBBm6hQHzZyRduhuBNsYLvREJWRGxEGbK/lXkwLgUPS0BFI4/ZXCkHBPr
         sp/LsGKN8A/L0ixcngzVv4Zs6xkZANtkadhG1Yz4j7TvPDQu1ipEMz/9wY9wyNpEOXnC
         zXZhgs4Ad7TF+e6On/lLCxupfVubNUkUCygf24ekanKcxAmmZTqXHZEfvehLmUQ4naoc
         40IA==
X-Forwarded-Encrypted: i=1; AJvYcCWtmtRMR5tTUNnDQSMZoGMXJxXmvh6HVq8X5aP4fYkftjzYm4xoY8P6scYQq8+c286wW1gg3DJzh07Pbieoei/ZeflsebL5rX694149MHE=
X-Gm-Message-State: AOJu0YxLHb9ZelGb+BERknB02EtZQur8VmzPr41IdKcjr+CQ7W0g5qML
	6tp9DqSqXh7D2hW6CjImkyNp2jHm+MlRkD+etlYb0KYXvJ08L1aAbC/LU5dQ3A==
X-Google-Smtp-Source: AGHT+IGXD33tpnMPZMecPt1YDBAcomyWhXDfHKmyD9lUIQDU/XZvqTMfG5lXuRwWL144dZtMoUloCQ==
X-Received: by 2002:a05:600c:47d7:b0:421:5288:63df with SMTP id 5b1f17b1804b1-421649fe377mr14552265e9.11.1717746455904;
        Fri, 07 Jun 2024 00:47:35 -0700 (PDT)
Message-ID: <856e3517-4aef-4e18-85b1-174ebf5c358f@suse.com>
Date: Fri, 7 Jun 2024 09:47:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 04/16] x86: introduce CONFIG_ALTP2M Kconfig option
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <035f63f2b92b963f2585064fa21e09e73157f9d3.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <035f63f2b92b963f2585064fa21e09e73157f9d3.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2024 13:13, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/include/asm/p2m.h
> +++ b/xen/arch/x86/include/asm/p2m.h
> @@ -577,10 +577,10 @@ static inline gfn_t mfn_to_gfn(const struct domain *d, mfn_t mfn)
>          return _gfn(mfn_x(mfn));
>  }
>  
> -#ifdef CONFIG_HVM
>  #define AP2MGET_prepopulate true
>  #define AP2MGET_query false
>  
> +#ifdef CONFIG_ALTP2M
>  /*
>   * Looks up altp2m entry. If the entry is not found it looks up the entry in
>   * hostp2m.

In principle this #ifdef shouldn't need moving. It's just that the
three use sites need taking care of a little differently. E.g. ...

> @@ -589,6 +589,15 @@ static inline gfn_t mfn_to_gfn(const struct domain *d, mfn_t mfn)
>  int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *mfn,
>                                 p2m_type_t *t, p2m_access_t *a,
>                                 bool prepopulate);
> +#else
> +static inline int altp2m_get_effective_entry(struct p2m_domain *ap2m,
> +                                             gfn_t gfn, mfn_t *mfn,
> +                                             p2m_type_t *t, p2m_access_t *a,
> +                                             bool prepopulate)
> +{
> +    ASSERT_UNREACHABLE();
> +    return -EOPNOTSUPP;
> +}

static inline int altp2m_get_effective_entry(struct p2m_domain *ap2m,
                                             gfn_t gfn, mfn_t *mfn,
                                             p2m_type_t *t, p2m_access_t *a)
{
    ASSERT_UNREACHABLE();
    return -EOPNOTSUPP;
}
#define altp2m_get_effective_entry(ap2m, gfn, mfn, t, a, prepopulate) \
        altp2m_get_effective_entry(ap2m, gfn, mfn, t, a)

Misra doesn't like such shadowing, so the inline function may want
naming slightly differently, e.g. _ap2m_get_effective_entry().

> @@ -914,8 +923,14 @@ static inline bool p2m_set_altp2m(struct vcpu *v, unsigned int idx)
>  /* Switch alternate p2m for a single vcpu */
>  bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx);
>  
> +#ifdef CONFIG_ALTP2M
>  /* Check to see if vcpu should be switched to a different p2m. */
>  void p2m_altp2m_check(struct vcpu *v, uint16_t idx);
> +#else
> +static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
> +{
> +}

Btw, no need to put the braces on separate lines for such a stub.

Jan

