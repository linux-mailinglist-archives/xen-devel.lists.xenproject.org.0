Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D84669025
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 09:10:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476829.739203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGF8m-0007PR-KA; Fri, 13 Jan 2023 08:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476829.739203; Fri, 13 Jan 2023 08:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGF8m-0007MG-FO; Fri, 13 Jan 2023 08:10:20 +0000
Received: by outflank-mailman (input) for mailman id 476829;
 Fri, 13 Jan 2023 08:10:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3K7w=5K=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pGF8k-0007M6-GO
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 08:10:18 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b70e21f8-9319-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 09:10:17 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id vm8so50474685ejc.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jan 2023 00:10:17 -0800 (PST)
Received: from [192.168.1.93] (adsl-139.109.242.225.tellas.gr.
 [109.242.225.139]) by smtp.gmail.com with ESMTPSA id
 g2-20020a170906538200b0085c3f08081esm3431892ejo.13.2023.01.13.00.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:10:16 -0800 (PST)
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
X-Inumbo-ID: b70e21f8-9319-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jLVRvKluyxNeRdZUwXoZTpFf6e3KVsHC6MuFrshYUQ0=;
        b=G6jZ6mSMyAArHIk9Tdtxxg+YG704AD1UGfK5U0JGphQYJM76y2WwU8nc5m4BspUsF6
         97+f6kArUNV7v1pKh9SIbqSCE6oOxtWgqO0ZXtRbDnpTdu21IHdv2TJ6or/UszF/YmnK
         JFaK7tkm0D6FJbsBlNPdf/ct+7He99JsXXgewxt29E8na7m4XGTC1CpWI5dkGWR6XewO
         JFfM6hK4EBCTFEpqahq30L23PEMbEggmft19pd33MWLWSKtQH/bAsXilz5knCkib6o5R
         RyMkeo0YICUPx/JRwwcHGRWhBWEuIL0S9zP14JNOGEU+Kt6rpZjhqb3gKzJ3FDdMRDtr
         Gv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jLVRvKluyxNeRdZUwXoZTpFf6e3KVsHC6MuFrshYUQ0=;
        b=P/sbUcdV08FVME/8/pr9f2m5V7JEOQvYJdGaIQ6X9CtgBuofkYbtQ/DME6odKKD8KL
         qkxvjUUfoN/IhMUYYbPia5y1flar+fspP7EcC6zeO0kDUVvsDLjfmBaJsvsU1Zwxm2S1
         ESufJihYwZRTMiL0uNTZzeVtFPf42xz+nYdtDhb1VIzviPDoHcIwOlD0E8Kf3HENO8XX
         s690L1Zp8o4PM7vm/9XwAEKSyQRQPc+VyifRIEqpsPWRHpFQR88YQ5pwX/N/d7t3bYw8
         KZaejpKYivtnqATG94g2HEthcvfeNe2hQUn/0zkUhhVK2sRXXdg8nh6V34MD75s2nQt0
         +ioA==
X-Gm-Message-State: AFqh2kqS1glJTg1JQ+292TrfqFN9OllFUchpgRsnoY94AHKnMGRHg2na
	0Rp7qVqi4w50+evE1bpPmqA=
X-Google-Smtp-Source: AMrXdXttuK5yqRd+vPPA3pxoKjyWE0YytZTEfIF+frYYOQiH1tDMfrHNDZrJ2I7iiGeJEqMlqzLwYQ==
X-Received: by 2002:a17:906:86cc:b0:869:3b49:35c2 with SMTP id j12-20020a17090686cc00b008693b4935c2mr2134775ejy.61.1673597417044;
        Fri, 13 Jan 2023 00:10:17 -0800 (PST)
Message-ID: <cf9a8caa-1ebd-b6cb-a1f8-c43fbe5ee381@gmail.com>
Date: Fri, 13 Jan 2023 10:10:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/8] x86/iommu: iommu_igfx, iommu_qinval and
 iommu_snoop are VT-d specific
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-4-burzalodowa@gmail.com>
 <f2d68a4d-b9b3-7700-961d-f6888edfb858@suse.com>
 <f4771b3d-63e8-a44b-bdaf-4e2823f43fb8@gmail.com>
 <4bc3f2f6-9bf4-5810-89e3-526470e72d85@gmail.com>
 <d4105a37-e24f-96b6-f0f3-5990768fa8f5@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <d4105a37-e24f-96b6-f0f3-5990768fa8f5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/12/23 17:53, Jan Beulich wrote:
> On 12.01.2023 16:43, Xenia Ragiadakou wrote:
>> On 1/12/23 13:49, Xenia Ragiadakou wrote:
>>> On 1/12/23 13:31, Jan Beulich wrote:
>>>> On 04.01.2023 09:44, Xenia Ragiadakou wrote:
>>>>> --- a/xen/include/xen/iommu.h
>>>>> +++ b/xen/include/xen/iommu.h
>>>>> @@ -74,9 +74,13 @@ extern enum __packed iommu_intremap {
>>>>>       iommu_intremap_restricted,
>>>>>       iommu_intremap_full,
>>>>>    } iommu_intremap;
>>>>> -extern bool iommu_igfx, iommu_qinval, iommu_snoop;
>>>>>    #else
>>>>>    # define iommu_intremap false
>>>>> +#endif
>>>>> +
>>>>> +#ifdef CONFIG_INTEL_IOMMU
>>>>> +extern bool iommu_igfx, iommu_qinval, iommu_snoop;
>>>>> +#else
>>>>>    # define iommu_snoop false
>>>>>    #endif
>>>>
>>>> Do these declarations really need touching? In patch 2 you didn't move
>>>> amd_iommu_perdev_intremap's either.
>>>
>>> Ok, I will revert this change (as I did in v2 of patch 2) since it is
>>> not needed.
>>
>> Actually, my patch was altering the current behavior by defining
>> iommu_snoop as false when !INTEL_IOMMU.
>>
>> IIUC, there is no control over snoop behavior when using the AMD iommu.
>> Hence, iommu_snoop should evaluate to true for AMD iommu.
>> However, when using the INTEL iommu the user can disable it via the
>> "iommu" param, right?
> 
> That's the intended behavior, yes, but right now we allow the option
> to also affect behavior on AMD - perhaps wrongly so, as there's one
> use outside of VT-x and VT-d code. But of course the option is
> documented to be there for VT-d only, so one can view it as user
> error if it's used on a non-VT-d system.
> 
>> If that's the case then iommu_snoop needs to be moved from vtd/iommu.c
>> to x86/iommu.c and iommu_snoop assignment via iommu param needs to be
>> guarded by CONFIG_INTEL_IOMMU.
> 
> Or #define to true when !INTEL_IOMMU and keep the variable where it
> is.

Given the current implementation, if defined to true, it will be true 
even when !iommu_enabled.

-- 
Xenia

