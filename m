Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A03D5BC4C9
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 10:53:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408434.651317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCWY-0004tx-1M; Mon, 19 Sep 2022 08:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408434.651317; Mon, 19 Sep 2022 08:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCWX-0004qe-UM; Mon, 19 Sep 2022 08:53:05 +0000
Received: by outflank-mailman (input) for mailman id 408434;
 Sun, 18 Sep 2022 19:18:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=udh/=ZV=stew.dk=stewart@srs-se1.protection.inumbo.net>)
 id 1oZzoc-0007t5-3e
 for xen-devel@lists.xenproject.org; Sun, 18 Sep 2022 19:18:54 +0000
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [2607:f8b0:4864:20::d2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba8e3432-3786-11ed-9761-273f2230c3a0;
 Sun, 18 Sep 2022 21:18:52 +0200 (CEST)
Received: by mail-io1-xd2e.google.com with SMTP id p3so11547573iof.13
 for <xen-devel@lists.xenproject.org>; Sun, 18 Sep 2022 12:18:52 -0700 (PDT)
Received: from ?IPV6:2001:db8::165a:5551:20c6:ecaf?
 ([2607:fb91:1108:ae0:6e73:b13c:9e3e:3750])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a92b00c000000b002f5d9f49852sm46044ilh.14.2022.09.18.12.18.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 12:18:50 -0700 (PDT)
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
X-Inumbo-ID: ba8e3432-3786-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stew.dk; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=lexXoQKidOKdhRihDMwjma87tp56OUQpeUHq174CHio=;
        b=XefqwD8UH088hbVFvga6zGD4KEDEtR3H81gXPkB0J5j7n9nKzmYRso2oqzLzWqu0dU
         oVCf7E4YuqH+gSF+nJiGRH1Tg8zhimQMnSCHtasSQTT0C8fyDP7vEFYP42ZXCXZky0Bt
         1opcODbn2li/8fOVr5VRG9EOQG2pq1YXOLUMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lexXoQKidOKdhRihDMwjma87tp56OUQpeUHq174CHio=;
        b=aF60ae14gDg2pEsYluGAIfONmfrzwSFqHkRWgkkbxnw3Ka0v7mLotSgyLm/dNZltG3
         yj4oPoRIp/DPbBQoS96f266fLq1BL4TKwYh8EiobNASKJv7vzPPE8iyse3cEPSdjIoaH
         Sae38ezrhJ+fxZvnwFmmP21/U/h3KSSR4z63Rxf+GMx8fOO7uVZGSf3AoUmHdRJAZocc
         cvD1nvd3D5swBZ9pecv2I7CjRIAbbxRUevs3DUUFrOG9rXDNnhvxqGwaAzc5mNToiN10
         hg9o5qNHZAw8xKdaP+psLqhT9M2L7DptG/JZ5Dy2QQcUn0mOJ/CqI2bOxAEjhbifmBuv
         NWVQ==
X-Gm-Message-State: ACrzQf10WSJOHuczp6314ffDKqUpcWqz8GTz5fSnO05HYuzKUFxcV7Bj
	hwm+h/aBX6I3QmEgszHC/aoRmA==
X-Google-Smtp-Source: AMsMyM5AkVMZzQA+6h69sO2EOknGNQt0Ip6n8W9jIZ9/YvEQdIXyAQbSbV22hrjqVaxuIl9ar0TluQ==
X-Received: by 2002:a05:6602:1609:b0:6a1:899e:bf36 with SMTP id x9-20020a056602160900b006a1899ebf36mr5473711iow.121.1663528730811;
        Sun, 18 Sep 2022 12:18:50 -0700 (PDT)
Message-ID: <f7471c99-1e64-5549-b6f4-d3b14457a024@stew.dk>
Date: Sun, 18 Sep 2022 15:18:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] MAINTAINERS: change my email
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Henry Wang <Henry.Wang@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Robbie VanVossen <robert.vanvossen@dornerworks.com>,
 xen-devel@dornerworks.com, xen-devel@lists.xenproject.org
References: <20220915193027.3166-1-stewart.hildebrand@dornerworks.com>
 <a83ac46b-3db8-7770-6f24-041de84a3392@suse.com>
From: Stewart Hildebrand <stewart@stew.dk>
In-Reply-To: <a83ac46b-3db8-7770-6f24-041de84a3392@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/22 02:08, Jan Beulich wrote:
> On 15.09.2022 21:30, Stewart Hildebrand wrote:
>> I am departing DornerWorks. I will still be working with Xen in my next
>> role, and I still have an interest in maintaining the ARINC 653
>> scheduler, so change to my personal email address. Also change status to
>> Maintained.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
>> ---
>>   MAINTAINERS | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e12c499a28..f674b5f7ba 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -221,8 +221,8 @@ F:	xen/include/xen/argo.h
>>   F:	xen/common/argo.c
>>   
>>   ARINC653 SCHEDULER
>> -M:	Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
>> -S:	Supported
>> +M:	Stewart Hildebrand <stewart@stew.dk>
>> +S:	Maintained
>>   L:	xen-devel@dornerworks.com
>>   F:	xen/common/sched/arinc653.c
>>   F:	tools/libs/ctrl/xc_arinc653.c
> 
> If it was just for the email change, I would have said it can go in without
> release manager approval. But the support level change I think wants a
> release ack at this point. Just to not leave the question unasked: There's
> no interest within DornerWorks to have someone else be (co)maintainer of
> this code?

Yes, there is interest. Nathan Studer has expressed interest. I will 
send out a v2.

Stewart

