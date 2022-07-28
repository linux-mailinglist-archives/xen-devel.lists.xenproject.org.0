Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E366584316
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 17:30:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376916.609961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH5S8-0006bm-TR; Thu, 28 Jul 2022 15:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376916.609961; Thu, 28 Jul 2022 15:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH5S8-0006Zl-Qb; Thu, 28 Jul 2022 15:29:32 +0000
Received: by outflank-mailman (input) for mailman id 376916;
 Thu, 28 Jul 2022 15:29:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfiA=YB=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oH5S7-0006Zf-F9
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 15:29:31 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12be1ddd-0e8a-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 17:29:30 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id z15so2620666edc.7
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jul 2022 08:29:30 -0700 (PDT)
Received: from [192.168.1.93] (adsl-69.109.242.233.tellas.gr. [109.242.233.69])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a1709064a9800b0072af843c794sm529337eju.43.2022.07.28.08.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 08:29:28 -0700 (PDT)
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
X-Inumbo-ID: 12be1ddd-0e8a-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=C2IFZRbn4+lRX2JFiR8wcrCL9rpAB0PQiWf6KhpHpC8=;
        b=FrrlO1wDH9AMrH29n05Qod74j7qx6xXUoszyWEdXt8mCw5U99Qv8lN3tvJzSwg76K0
         vTaVB22KZ3v6JIuSxGEgI2mhLzuPe3biAtGNAOg8IwdjaXjXQ/+M4RNhdL8hwqf4XkUK
         /BJdYnrsfJxs4HfUp2vaMqEMyaj7HzINvYoV51uZyYjH0JZDtpq41bTSh85wxOsoBpFK
         aJRzmyc5UFtDbWy19yg1/fmk3wu+NoX+Ry/s/ASN3W34JEwTL/rFEXriEoj+cR54xLBK
         Henu8vKFuFK+T8HggEkTUAMwWclqNyUxNhJwFKHpWYaaL+OIn8OntM4udizD99mkwmr/
         Hfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=C2IFZRbn4+lRX2JFiR8wcrCL9rpAB0PQiWf6KhpHpC8=;
        b=MmvGxeTTdal2gkPL1NEfoXgttrNyz92ncjRxw8B85bwM+9NMzF9lbAMtJ1mrlotvu5
         M3tiFNdBBAk9bk7dx88zbh9/zgniWBx08/Ru2JW4H/iyBM+rcozS9newgOob0b03ScsA
         ptK0y6eKN9/vRoL8h/QP+V1WDbE93JbXRTf9wwIhh5VgeuvwOGwoyDrJyIKxb+n80zfe
         h+z1BERD/02+rRSGWu0d2JAItMF/PAmChhLmHKqOzDWk94FR2WGRPI1KNSyeoOGL/c/m
         3GFwrgrDdv4PlbmfR4O48yLXtCiP+4geVrPpNPcu2a6jEUhdWML9d2jxNjEJOzlpkRej
         0Uzw==
X-Gm-Message-State: AJIora8vfMl7wugT281Mv0T30Zg9V9u1tTpeNjphQkw5wpY9E/WKp4IL
	idssTj6QxI1oj2/Qi1R8tSg=
X-Google-Smtp-Source: AGRyM1vfVvfsac+onx7pCovofLNABb7X5tk0aUc6n+WxSCoSmRzzRjyQ6X4nJwXUOULfMuMwNghR0A==
X-Received: by 2002:a05:6402:501d:b0:437:e000:a898 with SMTP id p29-20020a056402501d00b00437e000a898mr28375701eda.265.1659022169670;
        Thu, 28 Jul 2022 08:29:29 -0700 (PDT)
Message-ID: <e987ce30-45a3-a7d5-40a4-2936e3d793a5@gmail.com>
Date: Thu, 28 Jul 2022 18:29:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220728134943.1185621-1-burzalodowa@gmail.com>
 <0a8ff178-280d-717f-dacb-4eb9f57a24eb@xen.org>
 <83c17bf6-b9b2-a297-6f7f-dd08231d0f90@suse.com>
 <c71c9522-2df5-35a3-d39c-706d5c9d5263@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <c71c9522-2df5-35a3-d39c-706d5c9d5263@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/28/22 17:34, Julien Grall wrote:
> Hi,
> 
> On 28/07/2022 15:20, Jan Beulich wrote:
>> On 28.07.2022 15:56, Julien Grall wrote:
>>> On 28/07/2022 14:49, Xenia Ragiadakou wrote:
>>>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>>>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>>>> @@ -461,7 +461,7 @@
>>>>    /* Access to system registers */
>>>>    #define WRITE_SYSREG64(v, name) do {                    \
>>>> -    uint64_t _r = v;                                    \
>>>> +    uint64_t _r = (v);                                              \
>>>
>>> I am failing to see why the parentheses are necessary here. Could you
>>> give an example where the lack of them would end up to different code?
>>
>> I think it is merely good practice to parenthesize the right sides of =.
>> Indeed with assignment operators having second to lowest precedence, and
>> with comma (the lowest precedence one) requiring parenthesization at the
>> macro invocation site, there should be no real need for parentheses here.
> 
> I am not really happy with adding those parentheses because they are 
> pointless. But if there are a consensus to use it, then the commit 
> message should be updated to clarify this is just here to please MISRA 
> (to me "need" implies it would be bug).

The parentheses are not pointless if the intention is v to be used as an 
expression to the assignment. If this is not the intended usage for v, 
then the rule does not apply anyway.

-- 
Xenia

