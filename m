Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 601A2584034
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 15:42:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376790.609788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH3lp-0003CF-F0; Thu, 28 Jul 2022 13:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376790.609788; Thu, 28 Jul 2022 13:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH3lp-00039M-BQ; Thu, 28 Jul 2022 13:41:45 +0000
Received: by outflank-mailman (input) for mailman id 376790;
 Thu, 28 Jul 2022 13:41:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfiA=YB=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oH3ln-00039G-SZ
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 13:41:43 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 038ea223-0e7b-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 15:41:42 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id l23so3230694ejr.5
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jul 2022 06:41:42 -0700 (PDT)
Received: from [192.168.1.93] (adsl-93.176.58.224.tellas.gr. [176.58.224.93])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a170906315a00b0072b16a57cdcsm432024eje.118.2022.07.28.06.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 06:41:41 -0700 (PDT)
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
X-Inumbo-ID: 038ea223-0e7b-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hz8YQr4+g0Y9Ik+45wwXLUukS9ICs1DRPl41cz+x0kY=;
        b=IJNCHwpBA3KvaD70ce/XE0T6zrZHuge7M7cjX77ef8mdTzhtvNC0b2SWYS3czm10RX
         b4ZnlzWW2zwod6eC35czBI9KRFviPbVwI5IqyGvfZbK8N28V6s32q8AUVj9jskH9y9NE
         gKuzWBc7+OEAJ98xAVfZJRiRaMEr9860VoMeqondhWoECB60Xj6b7g6PP3VgQ7eTXWON
         rGVC2TFp/VSFeW+GKDB2bHHv/PhPsJGFAiAuSWDoMHQfdYM/gYKMgrRPF8HiQplTS6EI
         X30B6H6AS5byc2+1T2BEbL6PO4sg4NK+ZmWM9NRjLedVl4RJt/w1kr8k4/cBK21CnysF
         kLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hz8YQr4+g0Y9Ik+45wwXLUukS9ICs1DRPl41cz+x0kY=;
        b=seOV5/kv4UWdUg6Pay/eOmmx4abImQ+LdfbMPByVP0C6WOx2vFZJN0I0AWOkag8Smo
         Ms3Xm2DhoFDm63c06qlp3LEtjL5I4kGgiAs1fsTZDrjpy/clKDXtug6JFbkd67u3+9CO
         zzzM9lmMygvVIEYM8tA8PNm9UlORS5WNXnjFVr+9ezrjF9fps6VtwPhq5kwcdMrZim8z
         mPBAtsQTYVGhDOz8jtEOtfyeNiIS1TyGNAxqhQbgUEhvAYXf0z1D0WPjumFFO8Un2/qR
         8RLfrUFQGBMRgW5/QV4ErivvZmEca9OjFsZQanABd+EcQ3s7H2Xi9NNSEuQixJ305PrK
         dg6Q==
X-Gm-Message-State: AJIora91VdGvN6LBjUUGK2L3FPPD/6l00CwsRGTfmcTIMqFa4ZCeG95P
	tUjPldmFsWAWcTMdWiPB9Ug=
X-Google-Smtp-Source: AGRyM1vphgCd7zYw4krmLNHu2KaGYkJNk9iV2aaDzE8oh6XRXjscc8Bn4QVWliSxtTrKnzCVi6C2Aw==
X-Received: by 2002:a17:907:724c:b0:72e:e6fe:5ea4 with SMTP id ds12-20020a170907724c00b0072ee6fe5ea4mr21672530ejc.421.1659015701970;
        Thu, 28 Jul 2022 06:41:41 -0700 (PDT)
Message-ID: <96788863-8fd3-97c0-2c7b-8f1fc5a1e8f3@gmail.com>
Date: Thu, 28 Jul 2022 16:41:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220728075709.1175445-1-burzalodowa@gmail.com>
 <8d2bbddf-f871-5c64-6f95-f6f34edfb730@suse.com>
 <4ba6b639-61c2-12e4-8210-07115d7e50ba@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <4ba6b639-61c2-12e4-8210-07115d7e50ba@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/28/22 16:05, Julien Grall wrote:
> Hi,
> 
> On 28/07/2022 10:26, Jan Beulich wrote:
>> On 28.07.2022 09:57, Xenia Ragiadakou wrote:
>>> --- a/xen/arch/arm/include/asm/current.h
>>> +++ b/xen/arch/arm/include/asm/current.h
>>> @@ -44,8 +44,11 @@ static inline struct cpu_info *get_cpu_info(void)
>>>   #define guest_cpu_user_regs() (&get_cpu_info()->guest_cpu_user_regs)
>>> +extern void return_to_new_vcpu32(void);
>>> +extern void return_to_new_vcpu64(void);
>>
>> While ultimately it's the Arm maintainers to judge, may I suggest that
>> these be put in arm/domain.c to limit visibility?
> 
> In general, I am not in favor of declaring prototype outside of headers. 
> That said, I would be okay with it for the two prototypes because:
>    1) they are prototypes for assembly functions
>    2) declaring in current.h sounds wrong. A better place would be 
> domain.h but this would not reduce the visibility too much
>    3) this is unlikely to be used by other part of Xen

What I will ask is irrelevant to the placement but relevant to the 
declaration itself. I should also have declared them noreturn, right?

-- 
Xenia

