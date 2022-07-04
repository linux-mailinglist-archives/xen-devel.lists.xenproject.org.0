Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD743565093
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 11:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360037.589395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8IEI-0006LL-Aj; Mon, 04 Jul 2022 09:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360037.589395; Mon, 04 Jul 2022 09:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8IEI-0006JL-7G; Mon, 04 Jul 2022 09:18:54 +0000
Received: by outflank-mailman (input) for mailman id 360037;
 Mon, 04 Jul 2022 09:18:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/4n6=XJ=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o8IEG-0006JF-N4
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 09:18:52 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51a5974c-fb7a-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 11:18:51 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id r18so10869090edb.9
 for <xen-devel@lists.xenproject.org>; Mon, 04 Jul 2022 02:18:51 -0700 (PDT)
Received: from [192.168.1.10] (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.gmail.com with ESMTPSA id
 k14-20020aa7c04e000000b00431962fe5d4sm20568737edo.77.2022.07.04.02.18.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 02:18:50 -0700 (PDT)
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
X-Inumbo-ID: 51a5974c-fb7a-11ec-a8e4-439420d8e422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XvzplkcfBHntAkieXQE7nElZFawH9G9iX+6lNWNqK9g=;
        b=BAJ3QaQedBKus2e1VJ0SMC3a1daLIbx5hKDdWEFBiuK2h83LDoN3n6dwTVfYv1H6ke
         hRCsjUQSacUP4utxGuOasYgkV86panhXpoBx9KFf86cf7SSvHim2O58XHoRj48DRwBWn
         fP8FeiL5TlSSkAHciww3+/fSpnlB3ORJyFHsNuHeKnUMv7p0DG6BIJPVpTfk37LwVfZu
         k7PREi+1lSfZZhLt/v5PxqmeQZg08v6PuSqrDTpMHuZBLmrx3+AN4igeLGbK/QIr/ZQY
         WKy8Udy8xuDXAK+GzQ19+LFs3RH0fNzXYy8nY1L04YrecusxXNtUNbTcvbAYqzIdoOT1
         le6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XvzplkcfBHntAkieXQE7nElZFawH9G9iX+6lNWNqK9g=;
        b=Qg2mXDmHbWtLzDTNNvLPdXP1oiX6EK0N9DmbTFGlnuY1RsmB3t9yUwI8peGSKPNDoC
         eFTAsrJydC4VoBr9++W4h4IpbXaQGvK6cXNId24S/e4LUB7RugswdvIdFFDOnM4NGL9r
         Yhi4fJg5rFOf6B8na8fySwve1PQejNWM88TtJAI7v2dY8vfxUh3tifelvg11Kvj/gR5s
         dO66sUAca0R8I1/VpORia2fM77iVxN+Z03SFzqPLsgwSk60Aqpu3hAoxub+xPtyGtJHP
         Z/q8OCXO06uB7Vvv43Hg6EhFZQWRrIremlHfQyy+RUp0NxIgeXlQYcP8y0Mw0VjWEX81
         G44g==
X-Gm-Message-State: AJIora8FSgkcvDMWLbZoGxi4tCgko60KQ8pXWlZGhP6ZLdFrfdfIp71a
	WqeP9acldi7npVKVjPpqDgA=
X-Google-Smtp-Source: AGRyM1uUxFBIj19KLIMvVlufXMuwUk7QbK8/J8AAMhRzajRiT/RWyOaLiIfRaLH/Yqw+P82qm+BgWw==
X-Received: by 2002:a05:6402:1459:b0:437:9282:2076 with SMTP id d25-20020a056402145900b0043792822076mr36844486edx.6.1656926331263;
        Mon, 04 Jul 2022 02:18:51 -0700 (PDT)
Message-ID: <6933ed4d-3e30-c11c-845e-8aaffc618cc8@gmail.com>
Date: Mon, 4 Jul 2022 12:18:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] xen/arm: traps: fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220704072232.117517-1-burzalodowa@gmail.com>
 <EB360E93-8353-48D0-844F-CB529B94B9C1@arm.com>
 <BB492376-6171-4ECB-8F24-6F419E9A5926@arm.com>
 <e623d9c9-0f61-144b-61ea-51367c938b03@gmail.com>
 <E77F6E48-80EE-4874-B560-D57ACFF0C264@arm.com>
 <E56D7BDD-8DA6-4131-A60F-26239A9BBEA2@arm.com>
 <8970b2a7-d754-7db3-7f43-f2d30c626dc4@xen.org>
 <7C0683EE-4D8C-490E-997F-D54514312022@arm.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <7C0683EE-4D8C-490E-997F-D54514312022@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/4/22 11:54, Luca Fancellu wrote:
>>>>>>>
>>>>>>> As said I would vote for external linkage here but would be nice to have other
>>>>>>> developers view on this.
>>>>>>>
>>>>>> In addition to this, if we don’t want to provide a justification for those, since they seems to me
>>>>>> code related to debugging they can be removed from “production” code in some way.
>>>>>
>>>>> Rule 8.7 is advisory, so I think that formal justification of deviations is not necessary.
>>>>
>>>> Yes that is true, in that case we would only need to document it without a formal justification, however
>>>> if the codebase doesn’t include them (because not in production code) I guess the problem doesn’t exist.
>>> Having the production code using static and the non production using external linkage would be kind of weird here.
>>> I think having them always with external linkage with a justification is the cleanest way.
>>
>> +1 this is what I was going to answer :).
>>
> 
> Yes probably I didn’t explained very well, I’m in favour for external linkage, hence we are going to have an advisory to
> document.
> 
> I was just thinking if we need to document that *if* the codebase doesn’t include them, which is a comment not related
> to this patch so apologies for the noise on that.
> 
>> Cheers,
>>
>> -- 
>> Julien Grall
> 

I would like to mention that show_execution_state() is also available 
for dumping the state but probably you need them for more fine grained 
debugging.
I will wait until tomorrow in case there is further input on this and I 
will send another patch, if necessary.

-- 
Xenia

