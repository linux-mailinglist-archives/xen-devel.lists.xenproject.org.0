Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82863564F48
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 10:06:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359902.589173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8H60-0007RX-9R; Mon, 04 Jul 2022 08:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359902.589173; Mon, 04 Jul 2022 08:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8H60-0007PK-6f; Mon, 04 Jul 2022 08:06:16 +0000
Received: by outflank-mailman (input) for mailman id 359902;
 Mon, 04 Jul 2022 08:06:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/4n6=XJ=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o8H5z-0007PE-7c
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 08:06:15 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c5701a3-fb70-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 10:06:14 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id e40so10681863eda.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Jul 2022 01:06:14 -0700 (PDT)
Received: from [192.168.1.10] (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.gmail.com with ESMTPSA id
 el3-20020a056402360300b0043585bb803fsm19840182edb.25.2022.07.04.01.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 01:06:13 -0700 (PDT)
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
X-Inumbo-ID: 2c5701a3-fb70-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=W9HfTjn15UAvBfHrZ5oBi9kQQHqbkPOKt0RssB9FyEg=;
        b=emALJNTv4bWX2oGsiofVsRRFB8Jtt1xVzqkFjU/eX7rLFG8wbnXkMkYDao1HnwFbI5
         hNM0NY3ZWmapLG0nhq8vR9SRI8MN+Zb1pjQUKh12Bnpo11GUktb1bD4vXZouaf9/5gy7
         kJMOlJAfe8q26w3CQ7pstB9y57Sepii0HXOzGa/k6Zg/F/NarqhOv/jHqdM/5yQWgAY8
         d+50IB1x91ZzF8Y8LdOjTqWgm7SeWXXDxuOo/1Qu3wS0R/XP3D2iO4aembxF9Tv2OJ0T
         HwKUDNnXJrhBSDSZgb4pNGbryG57IYYaXwJdT/wDXMvMiqAGlO+J4ok8LlO3osxcfGDc
         EPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=W9HfTjn15UAvBfHrZ5oBi9kQQHqbkPOKt0RssB9FyEg=;
        b=XLaf+XQE7b4cU+ck4tgbHH3r6qpZ0JInGnCjsTCOHXRBHARctiJIF5yOArstDH4pOb
         qE74u5z6U/V5yKP8bZzRnoMWKVt9ue/qB2t4SHD7zF4DWOfgYdht2ITrzgmFXTTbXZrz
         f/mXfnRVKLNLK3HdqrbOJPI8D8XjEJqUh7rSUYuY8sjXH6+oo+fJumdYi5/svw96sSqD
         Tn/9lugk6e95A7XHNpthDrt+wdYH9d2+pkECfUySviZkzwXmFXcIwoponusmUxEP1xc3
         dgcUt8QeeIbpmZL7I9v1AI39iqfYGau0q/MROWDAclHshqyv6GpmO9M6Vh3RFQjpiO2I
         GTRQ==
X-Gm-Message-State: AJIora+Ymm/ym/JY73s5HABoatQpjdHxaLKaQQLoL31qaPOwnQzxlEz+
	j8XkdcTfyIQ2+b26NkaJsm8=
X-Google-Smtp-Source: AGRyM1sLD+m81KLD2Pm07f1LUE15x951diP0E3vpI7V7hlK5woNu2iCDx6MUkRygO3vBZJBLXl0DoQ==
X-Received: by 2002:a05:6402:2687:b0:43a:6025:1658 with SMTP id w7-20020a056402268700b0043a60251658mr3706140edd.271.1656921973727;
        Mon, 04 Jul 2022 01:06:13 -0700 (PDT)
Message-ID: <e623d9c9-0f61-144b-61ea-51367c938b03@gmail.com>
Date: Mon, 4 Jul 2022 11:06:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] xen/arm: traps: fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220704072232.117517-1-burzalodowa@gmail.com>
 <EB360E93-8353-48D0-844F-CB529B94B9C1@arm.com>
 <BB492376-6171-4ECB-8F24-6F419E9A5926@arm.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <BB492376-6171-4ECB-8F24-6F419E9A5926@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/4/22 10:58, Luca Fancellu wrote:
> 
>>> I am not 100% sure about this patch.
>>> I think show_stack() should be declared the same way as show_registers().
>>> So either both of them will be declared with external linkage or both of them
>>> will be declared with internal linkage.
>>
>> I think that those 2 should be declared with external linkage with a comment
>> explaining why they are. For me those are useful when developing or debugging
>> and I sometime call those to force dumping the status.
>> So I would vote to keep the external linkage.
>>
>>> I decided to declare both of them static because they are referenced only in
>>> traps.c but I could have, also, add the declaration of show_stack() in
>>> asm/processor.h header instead. Rule 8.7 is advisory.
>>
>> As said I would vote for external linkage here but would be nice to have other
>> developers view on this.
>>
> 
> In addition to this, if we don’t want to provide a justification for those, since they seems to me
> code related to debugging they can be removed from “production” code in some way.

Rule 8.7 is advisory, so I think that formal justification of deviations 
is not necessary.

> 
>> Cheers
>> Bertrand
> 

-- 
Xenia

