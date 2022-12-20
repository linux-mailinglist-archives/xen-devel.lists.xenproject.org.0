Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FCE65282C
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 22:01:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467405.726486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7jjo-0000Im-PK; Tue, 20 Dec 2022 21:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467405.726486; Tue, 20 Dec 2022 21:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7jjo-0000Fi-LZ; Tue, 20 Dec 2022 21:01:24 +0000
Received: by outflank-mailman (input) for mailman id 467405;
 Tue, 20 Dec 2022 21:01:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LdMQ=4S=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p7jjn-0008Gy-Ib
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 21:01:23 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75684413-80a9-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 22:01:22 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id fc4so32098766ejc.12
 for <xen-devel@lists.xenproject.org>; Tue, 20 Dec 2022 13:01:22 -0800 (PST)
Received: from [192.168.1.93] (adsl-211.109.242.226.tellas.gr.
 [109.242.226.211]) by smtp.gmail.com with ESMTPSA id
 et8-20020a170907294800b007ae10525550sm6082306ejc.47.2022.12.20.13.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 13:01:22 -0800 (PST)
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
X-Inumbo-ID: 75684413-80a9-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+UUsYz7VuCytGkcJs6pGMYhLhP/E8MM3+N26XUw/Pf4=;
        b=aE8CtSHQTvHME8SdV5kRFXNhYyCt8Ec2l2nIt77T09Ms1ldZw9jU1VKCOqHf4ukMmF
         0BSornBWpredDeX9p75upvUILoD+8GvTndYKhRTTh+YFNBkczEFE9yIXQPlIxKnf00dZ
         nM9+9WhbC8DYCzcSuuatx6CBUpOPxWW6Ir3WKSnmMdnWAGGWEGRMGOMHDZwP0mt5JWuv
         aUHjxp0o1rvAVWXCCdL6NXvieYfTGKlJ4M0qhMOmqiIaFQc5S+h5K7xJwpHhFS/f9aUh
         RD0A3Ogk7+pmiRV1FMNCCsKMNmoOaycyujW29j6/U5fwzrhi+U3ggLa3W0vlnfiKd0pl
         LcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+UUsYz7VuCytGkcJs6pGMYhLhP/E8MM3+N26XUw/Pf4=;
        b=amUrsrOtIydF2+CmmwpxvlwWjPMRcTJQBBIAvhv3qAKy9SQGTOhgnOQmRqV56C/jQI
         7HTBCNrOpusjZkYpk9P1Y/NGnR32xttplqtEzLlcEDzQ1tDNx9jdMbNJRAQzhGbiCWQR
         oWKMTQbzPKPtfdcY9IiIaosKO36scEYxREgnYvPWWmR9FjWEe7AMkUqn0owbqX0cde9v
         cCHhiGcL5ewCn76vgWpYOzKP1jR6wBkTgDIyOds+kiY1XJjrn8C9TvywYjA404P+pSuB
         A6fx+XHLNn5igGkk1OPM2FLfNqLj3WqcsJbKrbtE2swM4xSNs3eYuMTa8RqQ/znh1305
         xmeQ==
X-Gm-Message-State: ANoB5pmUvcvtjRVL6u+e5FThRBNj9rddqKeACKrnYUPPxBrdymN3CPAo
	Y5Q5F29Fi4JjuwyRDAjQOTY=
X-Google-Smtp-Source: AA0mqf7LlSASWE2oND7994lxpb5B8eq7u8jXSRaxsVt5lF5nJkTLP8Qdkm2eLPeH93+MIFTJgDdo9w==
X-Received: by 2002:a17:906:f10b:b0:7c1:727c:5f70 with SMTP id gv11-20020a170906f10b00b007c1727c5f70mr27593178ejb.46.1671570082387;
        Tue, 20 Dec 2022 13:01:22 -0800 (PST)
Message-ID: <723652e1-ddee-e411-83c4-0837e9947591@gmail.com>
Date: Tue, 20 Dec 2022 23:01:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC 2/7] x86/iommu: amd_iommu_perdev_intremap is AMD-Vi specific
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-3-burzalodowa@gmail.com>
 <4a2e34e9-32e7-1fac-0ecb-7cf084a06a3c@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <4a2e34e9-32e7-1fac-0ecb-7cf084a06a3c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/20/22 19:04, Jan Beulich wrote:
> On 19.12.2022 07:34, Xenia Ragiadakou wrote:
>> Move its definition to the AMD-Vi driver and use CONFIG_AMD_IOMMU
>> to guard its usage in common code.
>>
>> Take the opportunity to replace bool_t with bool and 1 with true.
> 
> Please further take the opportunity and use ...
> 
>> --- a/xen/drivers/passthrough/amd/iommu_init.c
>> +++ b/xen/drivers/passthrough/amd/iommu_init.c
>> @@ -36,6 +36,8 @@ static struct radix_tree_root ivrs_maps;
>>   LIST_HEAD_READ_MOSTLY(amd_iommu_head);
>>   bool_t iommuv2_enabled;
>>   
>> +bool __read_mostly amd_iommu_perdev_intremap = true;
> 
> ... __ro_after_init here.
> 
>> --- a/xen/include/xen/iommu.h
>> +++ b/xen/include/xen/iommu.h
>> @@ -104,7 +104,9 @@ static inline void clear_iommu_hap_pt_share(void)
>>   }
>>   
>>   extern bool_t iommu_debug;
>> -extern bool_t amd_iommu_perdev_intremap;
>> +#ifdef CONFIG_AMD_IOMMU
>> +extern bool amd_iommu_perdev_intremap;
>> +#endif
> 
> We try to avoid such #ifdef-ary: There's no real harm from the declaration
> being in scope; in the worst case the build will fail not at the compile,
> but at the linking stage.

That's true. I will leave it as it is.

> 
> Jan

-- 
Xenia

