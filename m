Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAC0665EF7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 16:20:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475592.737334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFctY-0005jj-Qn; Wed, 11 Jan 2023 15:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475592.737334; Wed, 11 Jan 2023 15:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFctY-0005eL-Mt; Wed, 11 Jan 2023 15:20:04 +0000
Received: by outflank-mailman (input) for mailman id 475592;
 Wed, 11 Jan 2023 15:20:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uwfa=5I=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pFctX-0005Pg-OV
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 15:20:03 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ac0335c-91c3-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 16:20:01 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id u9so37726917ejo.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jan 2023 07:20:01 -0800 (PST)
Received: from [192.168.1.93] (adsl-139.109.242.137.tellas.gr.
 [109.242.137.139]) by smtp.gmail.com with ESMTPSA id
 4-20020a170906300400b007b4bc423b41sm6310902ejz.190.2023.01.11.07.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 07:20:00 -0800 (PST)
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
X-Inumbo-ID: 6ac0335c-91c3-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6d3Rm4gSZWrkj+xvHGYHayuc1OKGY/sZHKxHJwdXIIk=;
        b=SgZSElsCSwvUXv5klue32nTPdvZ5NGHMGHqqi0k8IGfxXoJN7ehr6vZSWT4peBt2Lx
         n0SGoTiviqGvu9f9qsL0ePa+sa3r/KDXNw9w9fSXRKvuEwCWMWUMFA/Q7gJdto0KJhem
         Pfm/RvBlI4YWcFCYM2J9Ci68rNDSZISrUCK2MoS3/aF8ZLL430iDnpf67re5HebEztDY
         voTiUPCage/hCR0uJoQXW7iMu9U3MMH8fvDct7d1f4XMcypAmDebNrJXdCj/hXZh3Xw1
         fC/9tCNFEtaUb5rBtcUPwjiEo2OqbiDA+4dAZr1i3l0kGkwHvpSuAc2cLua1mlu/lehV
         EkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6d3Rm4gSZWrkj+xvHGYHayuc1OKGY/sZHKxHJwdXIIk=;
        b=3gptv2IyGKMM4/VRX01JjzBnj3demfBmf8UDmVK+mEaSuJrdXbGhUSS510bZqTLv4D
         LLXvz8wa3yd8co5Kvoqi5pCAeqXsJrI3Ql71mmzcBpcvl9lMRhO7I94KD7Ej+VPIyjiy
         XBLBxH3IiWrFHNWnZyuYSs10BjHCIr/mqPtAFHwahtsmzglWcUuYpEYq1Kgpu8FQVd57
         8egc5DbDfeTrdhMqN9qkBP2i+GGROTQMJ2zGdZ2+4/jYSdKGHJJis+tQ2Z6bmEM8V/SP
         AlcxHlocOOjcCyRm3Z71XY9aqacCgGn1vxL3SySs4Dlgg2rTLlKqEueCNUelqYHy8yUl
         FDFA==
X-Gm-Message-State: AFqh2kqarTFbTqnBTWOdmEOtz585THYpxudq3dtBFDleYz2Ie1GcC2hn
	TuDSLXHN8Z57DJekK+iYjPTXrTFFA1U=
X-Google-Smtp-Source: AMrXdXu5pqUwZLrcRUNsu3uAbY+6t77DOkzBSBRMNM2P/IRed6PF/rekItGgxt8NXX/JvpvVqPLJew==
X-Received: by 2002:a17:906:279a:b0:7c1:10b4:4742 with SMTP id j26-20020a170906279a00b007c110b44742mr58538232ejc.55.1673450401063;
        Wed, 11 Jan 2023 07:20:01 -0800 (PST)
Message-ID: <57631dd0-0811-75af-12cc-9091228d2a6c@gmail.com>
Date: Wed, 11 Jan 2023 17:19:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/8] x86/iommu: amd_iommu_perdev_intremap is AMD-Vi
 specific
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-3-burzalodowa@gmail.com>
 <bbb9b0c5-886a-0fa1-d44d-9144fb86efb0@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <bbb9b0c5-886a-0fa1-d44d-9144fb86efb0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/11/23 17:03, Jan Beulich wrote:
> On 04.01.2023 09:44, Xenia Ragiadakou wrote:
>> @@ -116,7 +115,11 @@ static int __init cf_check parse_iommu_param(const char *s)
>>                   iommu_verbose = 1;
>>           }
>>           else if ( (val = parse_boolean("amd-iommu-perdev-intremap", s, ss)) >= 0 )
>> +#ifdef CONFIG_AMD_IOMMU
>>               amd_iommu_perdev_intremap = val;
>> +#else
>> +            no_config_param("AMD_IOMMU", "amd-iommu-perdev-intremap", s, ss);
> 
> The string literal wants to be "iommu", I think. Please see other uses of
> no_config_param().

Thanks for reviewing this. You are right. I will fix it.

-- 
Xenia

