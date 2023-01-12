Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9286679BB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 16:44:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476290.738391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFzkA-0007rH-Gd; Thu, 12 Jan 2023 15:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476290.738391; Thu, 12 Jan 2023 15:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFzkA-0007p8-Cq; Thu, 12 Jan 2023 15:43:54 +0000
Received: by outflank-mailman (input) for mailman id 476290;
 Thu, 12 Jan 2023 15:43:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QgwW=5J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pFzk8-0007p2-Io
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 15:43:52 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e922c277-928f-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 16:43:51 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id tz12so45760565ejc.9
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jan 2023 07:43:50 -0800 (PST)
Received: from [192.168.1.93] (adsl-67.109.242.138.tellas.gr. [109.242.138.67])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a17090623f200b007e57d6e3724sm7580527ejg.116.2023.01.12.07.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 07:43:49 -0800 (PST)
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
X-Inumbo-ID: e922c277-928f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o9NtSevycsjj3do/s9tO6Gqq4uhlTyGcoWM/DnHLgUU=;
        b=UtVeQSyPLsjiHMFMnXBIya5S7d2ZSbJ4NG3qwCqILLfAbLbgJbHCXnNlpGz/OLTNFE
         Mdt51sr140T6cSpVFfZJif08HRem9DTkFZz0uGGm15GvANKgCAuUcJ8/jcgKy061VWfd
         0vu2XI5VdDKlFaVzXNoKRsEaqnoIMZLnszhLhXPAe7eVsZHvublFqeEXbte8JsrfFcDP
         ZbH3EMFl4ZLdVfPwwsKJzvFZ6/xPjBScCGrDL5Y82q7PkYHAfO1lXfU92nfJEfQa9m4q
         BWxf4jOvhYctDEXiN83mrKb8ELT8ii0nxtwUOSw8JOTz6A0J89i5/H6pLNNCriX4spl7
         qGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o9NtSevycsjj3do/s9tO6Gqq4uhlTyGcoWM/DnHLgUU=;
        b=YHJxKs8lucdE7ziG/t3amQ81VDWobbzpwroqoRObMOXhGLQEXs9AJCrb7jhSEBjV1u
         /gmBe3j59AJr96bUL5XqMZQpdW0PzOxI8r77rhRVAzBldCwYMyUV4pJ5frjw78QoC7fC
         zm1HKf0kBy4ui6TlMvwinBg917cVRvYC6MK65kgtC3DNgOaG5cITBtOx/ejpwiPqiAtb
         eVH8q8esfevw+j1DIXxkgzpScT6MKt7IbDjvUnRJM29YCTEK+TzxPrwExeLkxnz/9//Q
         ECQ99MKFcBv2subvsYY8Xci4WEnkMiKf5peOQtMuojgO/DNMyIyt1Qyq1sP80IxtcQ1y
         ilbw==
X-Gm-Message-State: AFqh2krIPBxzLOkJSP/+CcXUY885jZSex9p6sPYHr5D/pG/lbYAV8dma
	rhl1Kf1NWK0FlCLKmIdQas4=
X-Google-Smtp-Source: AMrXdXsPNYwUyi85rQM/lyEaj2aDJORIlGX5NvJehzCeNpnyEwkWbCwuzVeDx07ha8qnOcReK2Wb2Q==
X-Received: by 2002:a17:907:2587:b0:7c0:ac4b:8b9 with SMTP id ad7-20020a170907258700b007c0ac4b08b9mr55048171ejc.14.1673538230393;
        Thu, 12 Jan 2023 07:43:50 -0800 (PST)
Message-ID: <4bc3f2f6-9bf4-5810-89e3-526470e72d85@gmail.com>
Date: Thu, 12 Jan 2023 17:43:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/8] x86/iommu: iommu_igfx, iommu_qinval and
 iommu_snoop are VT-d specific
Content-Language: en-US
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-4-burzalodowa@gmail.com>
 <f2d68a4d-b9b3-7700-961d-f6888edfb858@suse.com>
 <f4771b3d-63e8-a44b-bdaf-4e2823f43fb8@gmail.com>
In-Reply-To: <f4771b3d-63e8-a44b-bdaf-4e2823f43fb8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/12/23 13:49, Xenia Ragiadakou wrote:
> 
> On 1/12/23 13:31, Jan Beulich wrote:
>> On 04.01.2023 09:44, Xenia Ragiadakou wrote:
>>> --- a/xen/drivers/passthrough/iommu.c
>>> +++ b/xen/drivers/passthrough/iommu.c
>>> @@ -82,11 +82,13 @@ static int __init cf_check 
>>> parse_iommu_param(const char *s)
>>>           else if ( ss == s + 23 && !strncmp(s, 
>>> "quarantine=scratch-page", 23) )
>>>               iommu_quarantine = IOMMU_quarantine_scratch_page;
>>>   #endif
>>> -#ifdef CONFIG_X86
>>> +#ifdef CONFIG_INTEL_IOMMU
>>>           else if ( (val = parse_boolean("igfx", s, ss)) >= 0 )
>>>               iommu_igfx = val;
>>>           else if ( (val = parse_boolean("qinval", s, ss)) >= 0 )
>>>               iommu_qinval = val;
>>> +#endif
>>
>> You want to use no_config_param() here as well then.
> 
> Yes. I will fix it.
> 
>>
>>> --- a/xen/include/xen/iommu.h
>>> +++ b/xen/include/xen/iommu.h
>>> @@ -74,9 +74,13 @@ extern enum __packed iommu_intremap {
>>>      iommu_intremap_restricted,
>>>      iommu_intremap_full,
>>>   } iommu_intremap;
>>> -extern bool iommu_igfx, iommu_qinval, iommu_snoop;
>>>   #else
>>>   # define iommu_intremap false
>>> +#endif
>>> +
>>> +#ifdef CONFIG_INTEL_IOMMU
>>> +extern bool iommu_igfx, iommu_qinval, iommu_snoop;
>>> +#else
>>>   # define iommu_snoop false
>>>   #endif
>>
>> Do these declarations really need touching? In patch 2 you didn't move
>> amd_iommu_perdev_intremap's either.
> 
> Ok, I will revert this change (as I did in v2 of patch 2) since it is 
> not needed.

Actually, my patch was altering the current behavior by defining 
iommu_snoop as false when !INTEL_IOMMU.

IIUC, there is no control over snoop behavior when using the AMD iommu. 
Hence, iommu_snoop should evaluate to true for AMD iommu.
However, when using the INTEL iommu the user can disable it via the 
"iommu" param, right?

If that's the case then iommu_snoop needs to be moved from vtd/iommu.c 
to x86/iommu.c and iommu_snoop assignment via iommu param needs to be 
guarded by CONFIG_INTEL_IOMMU.

-- 
Xenia

