Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0389A96410D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 12:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785635.1195115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjcAr-0001O8-8r; Thu, 29 Aug 2024 10:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785635.1195115; Thu, 29 Aug 2024 10:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjcAr-0001M5-5p; Thu, 29 Aug 2024 10:14:41 +0000
Received: by outflank-mailman (input) for mailman id 785635;
 Thu, 29 Aug 2024 10:14:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zolI=P4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjcAq-0001Lz-DY
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 10:14:40 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f9e97a6-65ef-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 12:14:38 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f3e071eb64so5654441fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 03:14:38 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89892223dbsm58517266b.202.2024.08.29.03.14.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 03:14:36 -0700 (PDT)
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
X-Inumbo-ID: 7f9e97a6-65ef-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724926478; x=1725531278; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nSvw49VZtnVp2/3l5caroRkHs18mkUqTFKbF+KUpyGI=;
        b=YJMu7CrIwf0SMWK1i6JOdoCCELl6YM2jJIEd7w3y2Gs5nS+SKkrGCXeDH0oNzlqi2o
         FeVV/h9sCKlezw3Fhj+c5qMb8bec9w1ffFdvhFqEUYpI2yUr8LMiD7RaTsNxxGQLMYTA
         kilt8QD+9mFoWnChJiG7xEQ52Npsxk0lp1d40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926478; x=1725531278;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSvw49VZtnVp2/3l5caroRkHs18mkUqTFKbF+KUpyGI=;
        b=wII+V9aBLzNJt74WG2ZrwqabBoPuP1DPS3lOJocBi/fuylXqSTFVNRe8DihMqK4BR3
         cMsluN1JHRvnQ0MUuV/nhK+uzwQYqUcezeDuCqkVcjPO1b8ok9ZYsS8N9EwD0UNSUZGw
         M2ZfKe3E9wyV/JCFaV1OlfcsbTYqSh7h8h3TGO6CuVUZa6HVQga8D2IuMIhy6gvi4Rg6
         3HSqtaA65Xx4plXeleLEyXD3xwZJFt+5RzlJiajUEtrZvrnQmEu2zJV0GrjNFJS58+ES
         /1hk0mUjclSHj+Q/zy6XWlwCYPE9vK6Qc7eYN7oq6nIvqE8Ns3yVcKRFU5D/4BqOo85z
         GUkw==
X-Forwarded-Encrypted: i=1; AJvYcCUdN9sWesHh+qPH8MoqOLZrgwv/4mfN8/AmZ467lIvjR/YgCxZ+T8OtQ686Q8YBg+esAF5Y13cTDn8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjRPBwpCUUrMWfUZ8Nv7UIftYonFOIB1AbQW9W9GaOgMCfORIb
	ZDJTLNqMzdWXzfjoIo9vP33HXv7/CbjajncKytPH+bCyfMX+4MHLo/GUzRCszzI=
X-Google-Smtp-Source: AGHT+IGmdPQS3s5uaSwuPSFaUVcfTRzZg+SyfUjfY7lYELFnu6/rvH34kOBhnArSYUNKpoKlDlt17Q==
X-Received: by 2002:a05:651c:1541:b0:2f5:d04:4a7f with SMTP id 38308e7fff4ca-2f6106d8e2amr23721381fa.20.1724926477203;
        Thu, 29 Aug 2024 03:14:37 -0700 (PDT)
Message-ID: <40ee3e13-7725-4266-9fcb-6b6d14f31e54@citrix.com>
Date: Thu, 29 Aug 2024 11:14:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] x86/intel: optional build of PSR support
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
References: <20240829090559.149249-1-Sergiy_Kibrik@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240829090559.149249-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/08/2024 10:05 am, Sergiy Kibrik wrote:
> Platform Shared Resource feature is available for certain Intel's CPUs only,
> hence can be put under CONFIG_INTEL build option.

AMD implement PSR too, and even some extensions over what Intel implement.

Furthermore it is likely that the eventual automotive system will want
to make use of it to reduce interference between criticial and
non-critical VMs.

What is currently true is "Xen's implementation of PSR only supports
Intel CPUs right now".

But - I think it is wrong to tie this to CONFIG_INTEL.

Perhaps CONFIG_PSR which is selected by CONFIG_INTEL for now, which can
eventually become user selectable option?

>
> When !INTEL then PSR-related sysctls XEN_SYSCTL_psr_cmt_op &
> XEN_SYSCTL_psr_alloc are off as well.
>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Jan Beulich <jbeulich@suse.com>
> ---
> v2 patch here:
> https://lore.kernel.org/xen-devel/20240801084453.1163506-1-Sergiy_Kibrik@epam.com/
>
> changes in v3:
>  - drop stubs for psr_domain_{init,free} & psr_ctxt_switch_to() and guard these
>    routines at call sites

Why?  That's error prone and contrary to how other subsystems work.

> diff --git a/xen/arch/x86/include/asm/psr.h b/xen/arch/x86/include/asm/psr.h
> index 51df78794c..d42c7f1580 100644
> --- a/xen/arch/x86/include/asm/psr.h
> +++ b/xen/arch/x86/include/asm/psr.h
> @@ -67,10 +67,17 @@ enum psr_type {
>  
>  extern struct psr_cmt *psr_cmt;
>  
> +#ifdef CONFIG_INTEL
>  static inline bool psr_cmt_enabled(void)
>  {
>      return !!psr_cmt;
>  }
> +#else
> +static inline bool psr_cmt_enabled(void)
> +{
> +    return false;
> +}

This would be better as simply:

static inline bool psr_cmt_enabled(void)
{
    return IS_ENABLED(CONFIG_blah) ? !!psr_cmt : false;
}

or if the worst comes to the worst,

static inline bool psr_cmt_enabled(void)
{
#ifdef CONFIG_blah
    return !!psr_cmt;
#else
    return false;
#endif
}

Both cases leave you with only a single function declaration, which
helps grep/tags/cscope-ability.

~Andrew

