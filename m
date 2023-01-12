Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2173A6671B1
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 13:08:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476088.738069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwNi-0002dJ-BE; Thu, 12 Jan 2023 12:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476088.738069; Thu, 12 Jan 2023 12:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwNi-0002a1-7p; Thu, 12 Jan 2023 12:08:30 +0000
Received: by outflank-mailman (input) for mailman id 476088;
 Thu, 12 Jan 2023 12:08:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QgwW=5J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pFwNh-0002Zv-4F
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 12:08:29 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d12ba190-9271-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 13:08:25 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id fy8so44115270ejc.13
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jan 2023 04:08:26 -0800 (PST)
Received: from [192.168.1.93] (adsl-211.37.6.0.tellas.gr. [37.6.0.211])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a1709060cca00b0082ddfb47d06sm7427522ejh.148.2023.01.12.04.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:08:25 -0800 (PST)
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
X-Inumbo-ID: d12ba190-9271-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dQ/h6xcmzcLV5jX9O2I0F3PYbgosWBKyzY9vBX4euzQ=;
        b=kIQbBXRXu0p9rtejlpcD05ymGsIxcsAVrjkx9gRyyBS3RNJYy5/MsvoK9dqndUZmmm
         H6guLqKPcVlWcMuaxYytJ3X87wEx+zRZeWECG2asHYCcDC8FcIn5zYomB1BOxsrrZ/J4
         sF/jedHBGGrgrngwTsShuU4XJAitsXsZcoZ4dAmUQP8ruy5tVrWAmlfCN5UJIJ4SU36F
         +pI2xmfzzXjF7Lo71pZ3pb8gt2sanGEY6kjSaZJ55/UJfKlwaE/7Ks+Q1c2RY7hAa3PK
         ssHbdSOn9M5Ymtkf835Gp2luUPW9GwdW/Md2qNuVGf/6SqveA8/yIU3bZQLfb3RWczIx
         Fuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dQ/h6xcmzcLV5jX9O2I0F3PYbgosWBKyzY9vBX4euzQ=;
        b=1kxrURk1wsOfFgBCJu8/bGYJ9abcQHYoDo3f5v2hoL6RL0u7cBFTFZE24PxtyzDHtr
         vOF6ZuJR8LKQCP/L47iCfqKaXzYHYvTXyjuE6d4VY0435DXUo7cWe6bKvXEBawh4Iob/
         U9IdumW9CUAUhAwMciE4wTen+Edoc6cuU/dSTKtmU3pR3wYoySa/PxaY4dzGsv3qV6aj
         4rzHFdiqjweORQK1sKEgVQWVF7a/8YCUlqCeegx8wre01vN7rM9vRr2GnC6Q+1U0izsA
         2QY2KodWpndSvQe9YRqPpcc6RcTmDfGZIAV0/rmva3clO3H8CXFUZgnncR6byCcHz6KG
         6Wxg==
X-Gm-Message-State: AFqh2kpTxgv1mK4kr/AC6vh+jxD42W6xnLbVLbx5Tu6wToIBJQoZD3Ak
	mEl4v8jLgdgBQ/s86IWwP8E=
X-Google-Smtp-Source: AMrXdXu/Y+NMALFUqB45iP4PU654NuTeJLKkkMGbN6QCYNxiNZC+hDq4JkXolsbxopWeBm+xARE79w==
X-Received: by 2002:a17:906:b0cd:b0:7ac:a2f5:cd0a with SMTP id bk13-20020a170906b0cd00b007aca2f5cd0amr61492535ejb.44.1673525306079;
        Thu, 12 Jan 2023 04:08:26 -0800 (PST)
Message-ID: <d55b5784-5ebd-d799-9a81-33e2901f4025@gmail.com>
Date: Thu, 12 Jan 2023 14:08:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/8] x86/acpi: separate AMD-Vi and VT-d specific
 functions
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-5-burzalodowa@gmail.com>
 <b73afacf-a23a-7e51-9bd3-b90b3eb484bd@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <b73afacf-a23a-7e51-9bd3-b90b3eb484bd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/12/23 13:37, Jan Beulich wrote:
> On 04.01.2023 09:44, Xenia Ragiadakou wrote:
>> The functions acpi_dmar_init() and acpi_dmar_zap/reinstate() are
>> VT-d specific while the function acpi_ivrs_init() is AMD-Vi specific.
>> To eliminate dead code, they need to be guarded under CONFIG_INTEL_IOMMU
>> and CONFIG_AMD_IOMMU, respectively.
>>
>> Instead of adding #ifdef guards around the function calls, implement them
>> as empty static inline functions.
>>
>> Take the opportunity to move the declarations of acpi_dmar_zap/reinstate() to
>> the arch specific header.
>>
>> No functional change intended.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> While I'm not opposed to ack the change in this form, I have a question
> first:
> 
>> --- a/xen/arch/x86/include/asm/acpi.h
>> +++ b/xen/arch/x86/include/asm/acpi.h
>> @@ -140,8 +140,22 @@ extern u32 pmtmr_ioport;
>>   extern unsigned int pmtmr_width;
>>   
>>   void acpi_iommu_init(void);
>> +
>> +#ifdef CONFIG_INTEL_IOMMU
>>   int acpi_dmar_init(void);
>> +void acpi_dmar_zap(void);
>> +void acpi_dmar_reinstate(void);
>> +#else
>> +static inline int acpi_dmar_init(void) { return -ENODEV; }
>> +static inline void acpi_dmar_zap(void) {}
>> +static inline void acpi_dmar_reinstate(void) {}
>> +#endif
> 
> Leaving aside my request to drop that part of patch 3, you've kept
> declarations for VT-d in the common header there. Which I consider
> correct, knowing that VT-d was also used on IA-64 at the time. As
> a result I would suppose movement might better be done in the other
> direction here.

I moved it to the x86-specific header because acpi_dmar_init() was 
declared there.
I can move all of them to the common header.

> 
>> +#ifdef CONFIG_AMD_IOMMU
>>   int acpi_ivrs_init(void);
>> +#else
>> +static inline int acpi_ivrs_init(void) { return -ENODEV; }
>> +#endif
> 
> For AMD, otoh, without there being a 2nd architecture re-using
> their IOMMU, moving into the x86-specific header is certainly fine,
> no matter that there's a slim chance that this may need moving the
> other direction down the road.

-- 
Xenia

