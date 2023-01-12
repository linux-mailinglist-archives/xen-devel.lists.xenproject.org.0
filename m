Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 830C366713A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 12:49:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476055.738025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFw4w-0006Zv-JL; Thu, 12 Jan 2023 11:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476055.738025; Thu, 12 Jan 2023 11:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFw4w-0006XF-G8; Thu, 12 Jan 2023 11:49:06 +0000
Received: by outflank-mailman (input) for mailman id 476055;
 Thu, 12 Jan 2023 11:49:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QgwW=5J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pFw4v-0006X7-12
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 11:49:05 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1be0c42f-926f-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 12:49:02 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id u9so44174752ejo.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jan 2023 03:49:02 -0800 (PST)
Received: from [192.168.1.93] (adsl-139.109.242.225.tellas.gr.
 [109.242.225.139]) by smtp.gmail.com with ESMTPSA id
 ky17-20020a170907779100b0084d3d6500b1sm5683416ejc.101.2023.01.12.03.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 03:49:01 -0800 (PST)
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
X-Inumbo-ID: 1be0c42f-926f-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yHN027+HQ+YTwz5jGusmp+H/3j6JCwBH17SmyR9HxS0=;
        b=joh2i586bruj09jicjFptGD3d2tNKQX3ELplLZB2ZSLCG65EqSuc7+2UrUy7DNjrJJ
         Rd0ogYNseRGIYlC+NwO7HNd7G88nlZ5yfcwNuSeb83o+V6ZD4FKEJp+bp3qoofJVbXO9
         x6H/y+G36GVMbirjEfSrhpjQuwaHw6wy6QTYu2QIWG5vZTcydj1kqvH3a3RkKRAsH/PF
         rjUdqzJWRs64lX1rzAbJviLJBIbh/6+aMCF6qHLjfMUhQVXbEJEK/OBI8gCDDiAQcu69
         +DXXUhMDfLC2cpI6F3eQkE4w1YRfiK82zzJ8p6ZFr0c75Da+lTYZd9Y0A4sTzNm1FBO9
         GzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yHN027+HQ+YTwz5jGusmp+H/3j6JCwBH17SmyR9HxS0=;
        b=FJdTzeypAfMJxJUgGIt40++CvLAnQZsAKnsD3z/bxHXA7FQkFgp9/GEnYN+vsOvKsU
         XJk0hkhkltSDrn/dQ3rCVlDUG3hFJtwsksvoIEUFUyX0HK35jubuLbXNR8dWWaxwGR3c
         J6BgCaTxesBMpb3+z0cDCENpOAyyXkII5eCKHQPvCP3ZGrQaSQWddPSOBdnliyfFNry3
         207T2Mgt8ZQYdtLX3kYqnNe3LuDD2GoNtBbnWOHev5q1hCO3onE2fpl/Mc1CD2S6xx4t
         hyk9llsI77eOPsWU2CShFyhrd9o9pYwSU2WsSIdDsCb3TljqPkAAPdtk/7fbtonzUDt1
         mlkQ==
X-Gm-Message-State: AFqh2kpQ6b4qKI4j1kbQRpGa1Mu3yDsexnyWDMEiknNkPw9aGMfxI67T
	F8XJQfBgW+0hM2ctCD/DKWg=
X-Google-Smtp-Source: AMrXdXsXi+a3DZ8lS0Bvkc3s3sbFvbp9G9Ee13eFDPEpFxGXD/rlR04WD1NhvqrIVT8frxb8qOB1RQ==
X-Received: by 2002:a17:906:bc47:b0:78d:f455:3110 with SMTP id s7-20020a170906bc4700b0078df4553110mr58672489ejv.56.1673524142226;
        Thu, 12 Jan 2023 03:49:02 -0800 (PST)
Message-ID: <f4771b3d-63e8-a44b-bdaf-4e2823f43fb8@gmail.com>
Date: Thu, 12 Jan 2023 13:49:00 +0200
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
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <f2d68a4d-b9b3-7700-961d-f6888edfb858@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/12/23 13:31, Jan Beulich wrote:
> On 04.01.2023 09:44, Xenia Ragiadakou wrote:
>> --- a/xen/drivers/passthrough/iommu.c
>> +++ b/xen/drivers/passthrough/iommu.c
>> @@ -82,11 +82,13 @@ static int __init cf_check parse_iommu_param(const char *s)
>>           else if ( ss == s + 23 && !strncmp(s, "quarantine=scratch-page", 23) )
>>               iommu_quarantine = IOMMU_quarantine_scratch_page;
>>   #endif
>> -#ifdef CONFIG_X86
>> +#ifdef CONFIG_INTEL_IOMMU
>>           else if ( (val = parse_boolean("igfx", s, ss)) >= 0 )
>>               iommu_igfx = val;
>>           else if ( (val = parse_boolean("qinval", s, ss)) >= 0 )
>>               iommu_qinval = val;
>> +#endif
> 
> You want to use no_config_param() here as well then.

Yes. I will fix it.

> 
>> --- a/xen/include/xen/iommu.h
>> +++ b/xen/include/xen/iommu.h
>> @@ -74,9 +74,13 @@ extern enum __packed iommu_intremap {
>>      iommu_intremap_restricted,
>>      iommu_intremap_full,
>>   } iommu_intremap;
>> -extern bool iommu_igfx, iommu_qinval, iommu_snoop;
>>   #else
>>   # define iommu_intremap false
>> +#endif
>> +
>> +#ifdef CONFIG_INTEL_IOMMU
>> +extern bool iommu_igfx, iommu_qinval, iommu_snoop;
>> +#else
>>   # define iommu_snoop false
>>   #endif
> 
> Do these declarations really need touching? In patch 2 you didn't move
> amd_iommu_perdev_intremap's either.

Ok, I will revert this change (as I did in v2 of patch 2) since it is 
not needed.

-- 
Xenia

