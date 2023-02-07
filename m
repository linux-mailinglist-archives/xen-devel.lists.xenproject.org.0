Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE4268D4B9
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 11:47:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491007.759936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPLUp-0001SW-P4; Tue, 07 Feb 2023 10:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491007.759936; Tue, 07 Feb 2023 10:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPLUp-0001QA-ME; Tue, 07 Feb 2023 10:46:43 +0000
Received: by outflank-mailman (input) for mailman id 491007;
 Tue, 07 Feb 2023 10:46:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z1AP=6D=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pPLUn-0001Q4-O5
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 10:46:41 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b402a13c-a6d4-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 11:46:40 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id x9so6843511eds.12
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 02:46:40 -0800 (PST)
Received: from [192.168.1.93] (adsl-89.109.242.139.tellas.gr. [109.242.139.89])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a50d645000000b004aaa656887esm3594711edj.96.2023.02.07.02.46.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 02:46:39 -0800 (PST)
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
X-Inumbo-ID: b402a13c-a6d4-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gVA0XKgYBCLmgUb385TaY1m2lRq/DLaicO0rFFkDgcY=;
        b=PO791oPowLN0A7cmhxIWvDhH1FXkF83uaX9GUfcyRtylzezFpYIJir0vJESwcTG+pI
         LFpSmAeuEFA/ptM7kn46EDfMCE4ISq9koqqQ6+jDfwsKRd/MkLsEdiMXEJCdTU56Zumj
         Nrj+nyiQHYhd48Y10EG6qyvYgXdYUgdRd5NexpQ/nvEtuUc6hZ/NTu9vHDOVwtyEz8Iw
         p13Xtxcme+Xxbf/zWc62B4hRXASFxJ41xyaXVmcNb9vqft+TvyHZR/BtyYEfE86qQj/R
         y05LHWusjerEF5cpqBCPQDI/byxvtYHZMvLvntNvdrH7vVLckRHiyDOZhMh78ctAjok9
         R1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVA0XKgYBCLmgUb385TaY1m2lRq/DLaicO0rFFkDgcY=;
        b=vzTftTnttdbXVYqB7dkkBdMBzPOgwNDQYcjr9MV0AwJHKesKQCBtP1sXXJQsCkvfNb
         De88NNOprQOvDpB7b3D8AcDIHDJhjusucmx4u6N3bMxN0Q+5iXYzkMNTcPSMst+ekcZa
         B+PuNs6zdfsmgxNDuW7jCHKyaERvVd+vhB6P6XPtnPQ28HwEX+JbifD6Ibm2iH90CxnA
         11budRwLjquyUm49c0RHmqr6lshO4p6TNHCSOB/yMitIQZfsRrb+pup6J4XT9bTOuGH9
         3PzBPxNO8oOxJFMhhxDBirBQORjdlyzujD63n+EbZjZx+4Ef9Icj7g745uyGCvlOo/+X
         pehQ==
X-Gm-Message-State: AO0yUKUTa4nZA57+O0saJOGBeqUbBwQaCT+uZUuwMUQUcQhMfbGzIvX3
	8ZKwkquKFiletHbwaRrabac=
X-Google-Smtp-Source: AK7set/5snqA4X/+xkVyjFbtf27QGN0GoQzw6QZ4Uqa9h6Q0+g6v+F5b3ReFDzQtWUdkepVP6pG0dQ==
X-Received: by 2002:a50:d51d:0:b0:499:1ed2:6456 with SMTP id u29-20020a50d51d000000b004991ed26456mr2975513edi.22.1675766799797;
        Tue, 07 Feb 2023 02:46:39 -0800 (PST)
Message-ID: <a8056218-34d6-71b2-8034-42dcf6f37a1b@gmail.com>
Date: Tue, 7 Feb 2023 12:46:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/2] xen/device_tree: fix Eclair findings for MISRA C
 2012 Rule 20.7
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230203190908.211541-1-burzalodowa@gmail.com>
 <20230203190908.211541-2-burzalodowa@gmail.com>
 <F9BF9B83-7889-4D51-B0B3-09950071AB75@arm.com>
 <63d81215-fd4a-e2f2-e145-3ee115b7df14@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <63d81215-fd4a-e2f2-e145-3ee115b7df14@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/7/23 12:39, Julien Grall wrote:
> Hi,
> 
> On 07/02/2023 10:23, Luca Fancellu wrote:
>>
>>
>>> On 3 Feb 2023, at 19:09, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>>>
>>
>> I’m not really a supporter of empty commit message, but it’s up to the 
>> maintainer :)
> 
> +1. In this case a brief summary of the rule would be handy for those 
> that are not well-versed with MISRA.
> 
> This can be dealt on commit if you propose a new commit message.

I 'm refrained from stating the rule as is because it is strict and it 
is not applied as is.

"Add parentheses around macro parameters when the precedence and 
associativity of the performed operators can lead to unintended order of 
evaluation."

Is this ok?

> 
>>
>> For me the changes looks good
>>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> Cheers,
> 

-- 
Xenia

