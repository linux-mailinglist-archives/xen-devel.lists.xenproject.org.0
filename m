Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D90FC694CF4
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 17:32:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494743.764887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRbiu-0004K4-NE; Mon, 13 Feb 2023 16:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494743.764887; Mon, 13 Feb 2023 16:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRbiu-0004IC-Im; Mon, 13 Feb 2023 16:30:36 +0000
Received: by outflank-mailman (input) for mailman id 494743;
 Mon, 13 Feb 2023 16:30:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHlb=6J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pRbit-0004I6-6s
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 16:30:35 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcfe357f-abbb-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 17:30:34 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id hx15so33221978ejc.11
 for <xen-devel@lists.xenproject.org>; Mon, 13 Feb 2023 08:30:33 -0800 (PST)
Received: from [192.168.1.93] ([188.73.238.161])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a170906038c00b0088f464ac276sm6922391eja.30.2023.02.13.08.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 08:30:32 -0800 (PST)
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
X-Inumbo-ID: bcfe357f-abbb-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pq3kexPu3NO3Jn2uKU7l+y+vB3Qu09wzUeg4RbrxHzM=;
        b=Nj1q6t5D0obFUPqgr921+fLAA8+oKjgtVYkG0+tzYh4uBnLS0CVOrMMLuGgUcZF4Nt
         hylnbFF6+q/lazJIrGID48q0uDXMVojPrVmsT3axzylyc1tq/v5arzlSO+kUGgvQwwLY
         vJovz2CHiNUbf6BrepLNb7f00weoeL2atAMFbXJIW+o4qipMh2ESpW8T2J+t+ufaKUs+
         gqPTNja3FUuqABKeE9la7itYdv6tf7OTv/eNWfsfKx3g/lNaF/jm8/QsHd+gGP5Wgv9y
         oo3JgPFL6QrY7O1nVf/NnzWgNi/kdp2u0ulhesNwNGWZzd45w8GvdELWNwx3ueH/aGHC
         Rl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pq3kexPu3NO3Jn2uKU7l+y+vB3Qu09wzUeg4RbrxHzM=;
        b=EW9arSvNHojsnn65y/NOCLrK3hfn4GcwWmSqQVxc4VLDvp5hQOu88nTM2DyuDx0zMF
         4gL40PMcaKROKnv91w07u5SxqiFggRBzg9lmh+dgE673cE/fpawBm1KyUroZyk/e+z0Q
         HaZOcXiFPxYY96FZD08Q67zYGSmHO4H7AfRn+zC3TMTt8JnK61wMInpyiCIntiwXrV80
         nS1CjbFDUnjhj4sgAfSQvNiOuvjxnPR4JPRgY1kXsRIXoFvDbdnakgoMCPezm3Lnnrm2
         Ir5WQXaL/1tqsunmyiMl6VkozP8VN+mxz+jggEXBqGIWAM/zD8qoPLFxTuO3CofvzYZ3
         yn/A==
X-Gm-Message-State: AO0yUKUCkjbN+cw4tzfKhS+qtcLCvghRVZwkhcEqgcJGM++C+ps2qMm1
	OduKGuw68rQRRA1pXaCAxBRA2RrAiQg=
X-Google-Smtp-Source: AK7set91fB45fUPSHDQrbmUL8Bt6fh0f3bYkHBojCnFse661xEm5/Hjc2NLhFI+n21fY0m/n4N5aqg==
X-Received: by 2002:a17:907:d19:b0:884:26ec:388b with SMTP id gn25-20020a1709070d1900b0088426ec388bmr31480131ejc.39.1676305833212;
        Mon, 13 Feb 2023 08:30:33 -0800 (PST)
Message-ID: <5c3eb593-b63f-303f-dcd8-f5c319152635@gmail.com>
Date: Mon, 13 Feb 2023 18:30:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC 01/10] x86: introduce AMD-V and Intel VT-x Kconfig options
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
 <20230213145751.1047236-2-burzalodowa@gmail.com>
 <e29e375f-3d30-0eb1-7e28-b93f2d831b43@suse.com>
Content-Language: en-US
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <e29e375f-3d30-0eb1-7e28-b93f2d831b43@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/13/23 17:11, Jan Beulich wrote:
> On 13.02.2023 15:57, Xenia Ragiadakou wrote:
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -117,6 +117,12 @@ config HVM
>>   
>>   	  If unsure, say Y.
>>   
>> +config AMD_SVM
>> +	def_bool y if HVM
>> +
>> +config INTEL_VMX
>> +	def_bool y if HVM
> 
> I'm not convinced we want vendor names here - I'd prefer to go with
> just SVM and VMX.

Ok, personally I have not strong preferences.

> 
>> --- a/xen/arch/x86/cpu/Makefile
>> +++ b/xen/arch/x86/cpu/Makefile
>> @@ -10,4 +10,6 @@ obj-y += intel.o
>>   obj-y += intel_cacheinfo.o
>>   obj-y += mwait-idle.o
>>   obj-y += shanghai.o
>> -obj-y += vpmu.o vpmu_amd.o vpmu_intel.o
>> +obj-y += vpmu.o
>> +obj-$(CONFIG_AMD_SVM) += vpmu_amd.o
>> +obj-$(CONFIG_INTEL_VMX) += vpmu_intel.o
> 
> This code was moved from hvm/ to cpu/ for the specific reason of also
> being used by PV guests. (Sadly the comments at the top weren't
> corrected at that time.)

Hmm, the init functions are prefixed with svm/vmx.
Does vpmu depend on svm/vmx support?

> 
>> --- a/xen/drivers/passthrough/Kconfig
>> +++ b/xen/drivers/passthrough/Kconfig
>> @@ -51,7 +51,7 @@ config AMD_IOMMU
>>   
>>   config INTEL_IOMMU
>>   	bool "Intel VT-d" if EXPERT
>> -	depends on X86
>> +	depends on X86 && INTEL_VMX
>>   	default y
>>   	help
>>   	  Enables I/O virtualization on platforms that implement the
> 
> This is odd in three ways: For one PV domains (i.e. incl Dom0) also use
> the IOMMU. And then earlier on there was a change of yours specifically
> relaxing the connection between I/O and CPU virtualization. Plus
> finally you make no similar change for AMD.

I am planning to relax it as it is relevant only to posted interrupts 
(that's why there is no such a dependency for AMD).

> 
> Jan

-- 
Xenia

