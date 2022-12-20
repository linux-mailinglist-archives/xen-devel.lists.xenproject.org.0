Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC6E652804
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 21:42:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467376.726442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7jQt-0004UC-Br; Tue, 20 Dec 2022 20:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467376.726442; Tue, 20 Dec 2022 20:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7jQt-0004SH-8y; Tue, 20 Dec 2022 20:41:51 +0000
Received: by outflank-mailman (input) for mailman id 467376;
 Tue, 20 Dec 2022 20:41:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LdMQ=4S=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p7jQr-0004S9-LG
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 20:41:49 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9ae4e37-80a6-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 21:41:48 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id jo4so23161572ejb.7
 for <xen-devel@lists.xenproject.org>; Tue, 20 Dec 2022 12:41:48 -0800 (PST)
Received: from [192.168.1.93] (adsl-139.109.242.138.tellas.gr.
 [109.242.138.139]) by smtp.gmail.com with ESMTPSA id
 r17-20020a17090609d100b007c176597b55sm6161164eje.37.2022.12.20.12.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 12:41:47 -0800 (PST)
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
X-Inumbo-ID: b9ae4e37-80a6-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mNgIsnx/3JccC7f3FRku2CicvaIKFEIC1glYus0Jek0=;
        b=JQBwS77fEEFA3+1YzaU9pcFtmLIQF3wbfCiG/Yr3Yjky2lAkwsRY48D5DaQUJm1Fyj
         ACUX8JfMiSx0YlC322c52+U6MQbtyq/PzGCOSdCRKSM70QYefND/n3hcjIpRoUMfLmeD
         jAYtKl5TityHgbPB48UnXBVrDTIt+qBm+kXgVb8gRL0wm9sJtYisVW44hdhNABPGiFTj
         yj5VOlTTe36Z4Xv4xRA8xnJPrxmfhlom4bsM/y81Et+yCrqWKXCTueJrIxHz74qU0PZp
         9yiK6uUkWFmvtzwiUanLYfylw7WBw8EjFOPWRisp6KbHpoMW2VJ0TgLP0UYxtepw5OS9
         J02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mNgIsnx/3JccC7f3FRku2CicvaIKFEIC1glYus0Jek0=;
        b=JYy6d47CWljNBcJUIdEWw5H3pSAyLU+BpkZpCvsfJzKNLGsiC9vtfrCBmrXFlB4YGl
         GqjE2WuacpC6YcWyokEcGcaBXnOslFcdW2mz4pyrtRR3OUvP4ZtQWDxiR+kQUjENxkVi
         F9LIvHRbIxhrv+oyPfSbghvd8l57PkqwfG3a0h+cJSGisiYsbNepbJVw5laTwVUBj77I
         NdixpLEfzS0jZGHjvQWPEsOL22L01B0nvGW0Idx5A3DZKnF1KY4GlXMuV7L4NtCG0wfR
         IGv/2M/L47wPCJO1Htd/3WZdPkbYyMladIrs8w4mY+FERwcMt8f08pkI4385tHFQ5/1F
         INDA==
X-Gm-Message-State: ANoB5plUlA4leumlhDxznQ8GY/n8LJdHrzSf76DRfn1/fY2glIBBxygp
	BfWj1jLfGxgbLYjeYiIWADZ98m9Ybew=
X-Google-Smtp-Source: AA0mqf5RiyTAyTDleTCKIdKN8nMU4OehbpNywcY80LGM0zpjvvGVKs142vQWLGQ+gP44chjB7HtrXw==
X-Received: by 2002:a17:906:eda7:b0:7c1:5248:4f3a with SMTP id sa7-20020a170906eda700b007c152484f3amr36376804ejb.56.1671568908301;
        Tue, 20 Dec 2022 12:41:48 -0800 (PST)
Message-ID: <83c80c85-0843-2bf7-e831-3920bacf8381@gmail.com>
Date: Tue, 20 Dec 2022 22:41:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC 2/7] x86/iommu: amd_iommu_perdev_intremap is AMD-Vi specific
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-3-burzalodowa@gmail.com>
 <8cc983ec-e28d-bd56-994e-39def18a511f@citrix.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <8cc983ec-e28d-bd56-994e-39def18a511f@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/20/22 12:31, Andrew Cooper wrote:
> On 19/12/2022 6:34 am, Xenia Ragiadakou wrote:
>> diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
>> index 5e2a720d29..1a02fdc453 100644
>> --- a/xen/drivers/passthrough/iommu.c
>> +++ b/xen/drivers/passthrough/iommu.c
>> @@ -58,7 +58,6 @@ bool __read_mostly iommu_hap_pt_share = true;
>>   #endif
>>   
>>   bool_t __read_mostly iommu_debug;
>> -bool_t __read_mostly amd_iommu_perdev_intremap = 1;
>>   
>>   DEFINE_PER_CPU(bool_t, iommu_dont_flush_iotlb);
>>   
>> @@ -115,8 +114,10 @@ static int __init cf_check parse_iommu_param(const char *s)
>>               if ( val )
>>                   iommu_verbose = 1;
>>           }
>> +#ifdef CONFIG_AMD_IOMMU
>>           else if ( (val = parse_boolean("amd-iommu-perdev-intremap", s, ss)) >= 0 )
>>               amd_iommu_perdev_intremap = val;
>> +#endif
> 
> See parse_cet() and the use of no_config_param() so users get a bit of a
> hint as to why the option they specified is getting ignored.

Ah, ok I see. Thx for pointing that out.

> 
> ~Andrew

-- 
Xenia

