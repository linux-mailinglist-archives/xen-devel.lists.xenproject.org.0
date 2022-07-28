Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DD25842BF
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 17:15:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376910.609949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH5EC-0004iz-M0; Thu, 28 Jul 2022 15:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376910.609949; Thu, 28 Jul 2022 15:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH5EC-0004gJ-JE; Thu, 28 Jul 2022 15:15:08 +0000
Received: by outflank-mailman (input) for mailman id 376910;
 Thu, 28 Jul 2022 15:15:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfiA=YB=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oH5EB-0004gD-JU
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 15:15:07 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fc597a5-0e88-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 17:15:06 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id j22so3724693ejs.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jul 2022 08:15:06 -0700 (PDT)
Received: from [192.168.1.93] (adsl-237.176.58.138.tellas.gr. [176.58.138.237])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a170906075300b0071c6dc728b2sm510541ejb.86.2022.07.28.08.15.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 08:15:04 -0700 (PDT)
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
X-Inumbo-ID: 0fc597a5-0e88-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+bDXLM/gyGC9wqVQYDzf3ehUIgXmb8Ntv7fGLNNxN74=;
        b=puKhKrFVrFDCJFQfXNm/H9+TBioKRmycKN0KxyzKSuT2KM91MBdC5CBIg7tDtKCfSM
         EIZ7DxnIklLuKPkfTb1DMFZaSDM3TmGuftGb522IaRYaHtZ+MKjrgkRH2Ahlx518egjC
         OoulS8sp/IM9ix9Jiwzn1ZzajVyWJmpa/gm7nofEGMDW69FQrrHE872T+MB2G+JoF4GX
         TJNeJNnHEYWXh7S8cXE5iLDzO+rCij8xnQF4IXllpvlVu5/hi8nzq0YqfeUlZyPdd0eo
         +WfY7g6R0L2oXrLoihtDMthSkau1yihxe3Of/k+S5gyzT7JZiocDPvp4Foedg2YeW7A0
         MUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+bDXLM/gyGC9wqVQYDzf3ehUIgXmb8Ntv7fGLNNxN74=;
        b=6QIrOzyGll4GEFWS//7QvIJ2igzy2IxDQOL77EDm/KNxkwOm8REWR0sQ+LJtx74idD
         Q72BYPVwJSWFML754wzVAW8QId/D6Dzjbn+TT2+JNrSW22Vy6LZZI9A5yynpxf/DXlPo
         Zf2xbZlCut5ofrY0QdT8K6YK14YTJnGhcO+gzhbqoUoOwyO2hUVRcwVCMTpagt4if8lO
         32QiJLD1Ux3eanKDvhZldzGaEzGxG+nGrLPWoCMu0s1uZJuzFNVP5IZJyebvsXDcm8Ot
         1JKgONdoSPKf7JwRtywyxm16cu1hcrHTnTflM/GvGNt8IwD1aobakhE9HLi3JwAFwYSE
         T+Zg==
X-Gm-Message-State: AJIora9KhQQhCuHY0dCGJ45GrjUyxebmBHqRloBYufo/zOP6EXJKMcpt
	ubwZKR7eF3BgMiHQmZbm5V8=
X-Google-Smtp-Source: AGRyM1uPSv5ukhWossIxUO7jh66r750jRUMLDa1dA2panHIS8cwLnQ2Smf8Jue6GGYtL1Wev0XXYEw==
X-Received: by 2002:a17:906:cc12:b0:72b:67bb:80c3 with SMTP id ml18-20020a170906cc1200b0072b67bb80c3mr20748678ejb.668.1659021305532;
        Thu, 28 Jul 2022 08:15:05 -0700 (PDT)
Message-ID: <deec9152-3ca8-829e-23d0-2390f1981666@gmail.com>
Date: Thu, 28 Jul 2022 18:15:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220728134943.1185621-1-burzalodowa@gmail.com>
 <0a8ff178-280d-717f-dacb-4eb9f57a24eb@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <0a8ff178-280d-717f-dacb-4eb9f57a24eb@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Julien,

On 7/28/22 16:56, Julien Grall wrote:
> Hi,
> 
> On 28/07/2022 14:49, Xenia Ragiadakou wrote:
>> The macro parameter 'v' is used as an expression and needs to be 
>> enclosed in
>> parentheses.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> ---
>>   xen/arch/arm/include/asm/arm64/sysregs.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h 
>> b/xen/arch/arm/include/asm/arm64/sysregs.h
>> index 54670084c3..f5a7269a27 100644
>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>> @@ -461,7 +461,7 @@
>>   /* Access to system registers */
>>   #define WRITE_SYSREG64(v, name) do {                    \
>> -    uint64_t _r = v;                                    \
>> +    uint64_t _r = (v);                                              \
> 
> I am failing to see why the parentheses are necessary here. Could you 
> give an example where the lack of them would end up to different code?

Here v is supposed to be used as an expression. So maybe the rule wants 
to enforce that in the macro we will pass an expression and not multiple 
statements (?) ... not sure.

> 
>>       asm volatile("msr "__stringify(name)", %0" : : "r" (_r));       \
>>   } while (0)
>>   #define READ_SYSREG64(name) ({                          \
> 
> Cheers,
> 

-- 
Xenia

