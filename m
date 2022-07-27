Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9CF582E08
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 19:06:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376380.609106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGkUH-000427-Ls; Wed, 27 Jul 2022 17:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376380.609106; Wed, 27 Jul 2022 17:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGkUH-0003yd-Ij; Wed, 27 Jul 2022 17:06:21 +0000
Received: by outflank-mailman (input) for mailman id 376380;
 Wed, 27 Jul 2022 17:06:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0cJb=YA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oGkUG-0003yX-4j
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 17:06:20 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6eab4ed7-0dce-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 19:06:19 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id t22so21622690lfg.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jul 2022 10:06:19 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a19790e000000b0048a7e6ed48esm1569458lfc.40.2022.07.27.10.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 10:06:18 -0700 (PDT)
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
X-Inumbo-ID: 6eab4ed7-0dce-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=A3BFnm6quA5PZHzhF6DcYZSnvXb4YsoaToHYvHfSHd4=;
        b=GYnRJ5zgTT5cQFueHn9+27vDGkbgM0bGsk30nd+IuDfEpTtMfjvTDVomPNvUHQ+ujB
         j5sj9aK/4OQsxQso92hXPmzCbNa8LK31CiWyiVIIuo/5oK3zGcv8QWAQeQjV4DtVMzjf
         uEO5D3G0pbhWiGxEVTHaeJnTvtl53cs2xgWcZW2hj3B1RIas+bhysRBsBzvdk0pkYNLo
         iqD4XwUUC/8ACMfbW1NK6GNnIz7RvhMsgnYFGY+83lZSTzD2EvDFxaX9eSN/7AVBrN2v
         K3FzhywKVi8NT3006wjEsbBIkvyAefrYyA++wnBVQMyH+HcfrX0C9XhOQZmDCyNieogT
         qUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=A3BFnm6quA5PZHzhF6DcYZSnvXb4YsoaToHYvHfSHd4=;
        b=kOrtbMf43cnZu8uER0qOEJD02ESP1yrVEbRuciRpWbrvAHDDlUeFoxPpPbCYDOON+J
         J+WDrQHKR4YSRuKWeqZRhqWjEq+wnKGUGA3qg9Xtd21mSu3AvfOtMXF1KmHhpulwObve
         B8SfUedhiwQGBKLibw/CnIvKaJ++RVg+kv5gm29ymoRWups5rIS0J0lVuJK7q8nAwQcu
         uifpEQ+TTHjcTiQelpm4puf0Lr2sNLroSHeTjB7O3TLHdjU4Bdv6dKUQdGRJ6GB3Pp5v
         W3Up1AGnzp93FrUCCjiU9o/B9psv5F8c5tXmPpqGCVzwMEcTBYY2tlRTCjl+AwhXNlAe
         tZQw==
X-Gm-Message-State: AJIora/ck94wFJth7NHxaVY0eCutokeMvCo0Nzy5b6vkbs2/s3W8+fSJ
	xPE2Osf6EjJ1FEYO3RQFKmI=
X-Google-Smtp-Source: AGRyM1vjHWvXg2f/9ghvsBJA4UuHZ7ZgUBwde/SkI9p/MywwdpCPx9uo8dpwJtnhED6QQ9WgUfEcJA==
X-Received: by 2002:a05:6512:23a6:b0:48a:8844:3f61 with SMTP id c38-20020a05651223a600b0048a88443f61mr6044588lfv.652.1658941578522;
        Wed, 27 Jul 2022 10:06:18 -0700 (PDT)
Message-ID: <6a687fa9-aae0-2257-5d95-91b00db1613a@gmail.com>
Date: Wed, 27 Jul 2022 20:06:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 06/11] vpci/header: program p2m with guest BAR view
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-7-olekstysh@gmail.com>
 <85853c9f-5706-22dc-4798-48c775a17d12@suse.com>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <85853c9f-5706-22dc-4798-48c775a17d12@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 27.07.22 13:19, Jan Beulich wrote:

Hello Jan


> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> Take into account guest's BAR view and program its p2m accordingly:
>> gfn is guest's view of the BAR and mfn is the physical BAR value as set
>> up by the PCI bus driver in the hardware domain.
>> This way hardware domain sees physical BAR values and guest sees
>> emulated ones.
>>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> If taking the previous patch as given, the patch here looks okay to me.

This is a good news, thank you.


> But since I'm still not really agreeing with what the previous patch
> does,

Previous? Sorry, I didn't see any comments given for "[PATCH V7 05/11] 
vpci/header: handle p2m range sets per BAR".

Or do you perhaps mean "[PATCH V7 03/11] vpci/header: implement guest 
BAR register handlers" where you explicitly mentioned concerns?


> both that and this one will need to be judged on by Roger once
> he's back.


Let's wait for Roger's input here as well.


> I'm sorry for the therefore resulting further delay.

no problem


>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


