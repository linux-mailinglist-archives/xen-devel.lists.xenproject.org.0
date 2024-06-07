Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B180C8FFD78
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 09:50:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736321.1142360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUMe-0001Il-FH; Fri, 07 Jun 2024 07:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736321.1142360; Fri, 07 Jun 2024 07:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUMe-0001HF-CP; Fri, 07 Jun 2024 07:50:20 +0000
Received: by outflank-mailman (input) for mailman id 736321;
 Fri, 07 Jun 2024 07:50:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5uW=NJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sFUMd-0001H9-4q
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 07:50:19 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95416989-24a2-11ef-90a2-e314d9c70b13;
 Fri, 07 Jun 2024 09:50:18 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2e6f2534e41so19241521fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2024 00:50:18 -0700 (PDT)
Received: from [172.31.7.231] ([62.48.184.126])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b059332073sm7806866d6.139.2024.06.07.00.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 00:50:17 -0700 (PDT)
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
X-Inumbo-ID: 95416989-24a2-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717746617; x=1718351417; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DrDl9r2juB5/Cc4BIkYP0HSQSjdb3MfmhRmurpYfPjs=;
        b=OxSCSF/zbhG05ewOsJG6My+MgQA1xB5jorl/rnCfnfZpbkolBDBQXcs22NYOUa19L6
         i/ps8ScAr2r6EFkZgSaIAUuZNLUPzJ496afl8XsLRZJNzpBwgs2d8QnnmtZ8WcGnTglm
         WPssN6hBEGcLxW8KZ+R8r72kH23sWbSHUhFJ0F8XcZQD8IUHjTHQwsU09ob5isVK6Ba8
         2FyNjhm68EHpVjt+sIsebcrhCJG1+a8pKwmIy3+m/RcoGPvuI3FAclugKYRnCI5zT36m
         v8DdTGjANjEdOs1SzBFDrkyutaw4DNiByHk2IcX+nzghVMyAvZtYfcEphv8GREhjXlxe
         Jz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717746617; x=1718351417;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DrDl9r2juB5/Cc4BIkYP0HSQSjdb3MfmhRmurpYfPjs=;
        b=HBTj6Z+V24ir1+mhISWw14WYG0WsF4H1nRD3nZJhSkQJkQHmI8q2lV9kXIBkl++PN/
         qZRs5+ZgOcQLsPULZiuFdoVNJWvIYvP+TGratgeWxYyfol4bI8ZmDjmWQ6m/pRBKTIYY
         GUL9Kd+wL62UBVabsbERadiG9W4kKRZV/QLKwh5XjNEQ6t4KCrFgsdWujUPpJwxt0nwZ
         oq7NAnddpBAPnbq64io6oeeqkDdDNGyxxaH3ZzbHv4XRuKAtpbIc8Ju9fZj19DuBtGLW
         rbPTCTccrcsFMXIavkdsGtsmOFsLdCVOJKuseMErB6Jewj7amCDRYQQkNY9bg8biC7er
         ugqw==
X-Forwarded-Encrypted: i=1; AJvYcCV4qFzequZHVGdyHro2s1pPSmKqBcceKP2jB9bE9/XtRZTakJCsGRTntgv1aj7rRo1X7+Ffulz55rd23UtC5zf04LR2KPazuiGh7Hf5BU8=
X-Gm-Message-State: AOJu0Yxp0jjGwsinfzK/hCx98s/qeWLWBzE/6Hon8Yl4MC7l6R9u/yIi
	TNFe2/VW7MiB/Y+aWNKll2GsAsnOOv9WW9aqZsSNw21UQU0IZmH+U+Ulh3Lr1A==
X-Google-Smtp-Source: AGHT+IGJALksAjdu5Qmye3Qx7jEI0fbwBAYxVozMgj8/0+4ww2eivWlgKuZJc05pemeYGqHvZWmlqw==
X-Received: by 2002:a19:9118:0:b0:520:9775:5d4b with SMTP id 2adb3069b0e04-52bb9f5d9cemr1123511e87.13.1717746617456;
        Fri, 07 Jun 2024 00:50:17 -0700 (PDT)
Message-ID: <c72ef6c8-6e5a-4533-a049-7636f6387e4b@suse.com>
Date: Fri, 7 Jun 2024 09:50:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 02/16] x86/altp2m: check if altp2m active when
 giving away p2midx
From: Jan Beulich <jbeulich@suse.com>
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <9306d31184b8e714c3a10ccc6a2b2c6a80777ddb.1717410850.git.Sergiy_Kibrik@epam.com>
 <7493c91c-070b-4828-a7f9-15d618d49ce5@suse.com>
Content-Language: en-US
In-Reply-To: <7493c91c-070b-4828-a7f9-15d618d49ce5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.06.2024 09:25, Jan Beulich wrote:
> On 03.06.2024 13:09, Sergiy Kibrik wrote:
>> @@ -38,9 +34,13 @@ static inline bool altp2m_active(const struct domain *d)
>>  }
>>  
>>  /* Only declaration is needed. DCE will optimise it out when linking. */
>> -uint16_t altp2m_vcpu_idx(const struct vcpu *v);
>>  void altp2m_vcpu_disable_ve(struct vcpu *v);
>>  
>>  #endif
>>  
>> +static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
>> +{
>> +    return altp2m_active(v->domain) ? vcpu_altp2m(v).p2midx : 0;
>> +}
> 
> While perhaps okay this way as a first step,

Hmm, or maybe not. 0 is a valid index, and hence could be misleading
at call sites.

Jan

> my general expectation
> would be that with ALTP2M=n there also wouldn't be any p2midx field
> in the respective struct. Which in turn will mean that this code
> would need re-doing again, and perhaps again splitting between an
> inline one and a decl-only one. With that I wonder whether that split
> wouldn't better be retained right away.
> 
> Jan


