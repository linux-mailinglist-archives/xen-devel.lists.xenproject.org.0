Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2964831EAAE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 15:01:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86653.162810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCjrQ-0006Wq-1M; Thu, 18 Feb 2021 14:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86653.162810; Thu, 18 Feb 2021 14:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCjrP-0006WR-Sw; Thu, 18 Feb 2021 14:00:51 +0000
Received: by outflank-mailman (input) for mailman id 86653;
 Thu, 18 Feb 2021 14:00:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YzyM=HU=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lCjrO-0006WM-3y
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 14:00:50 +0000
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a014e25-a244-4342-9352-03043f5e257b;
 Thu, 18 Feb 2021 14:00:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t15so3033697wrx.13
 for <xen-devel@lists.xenproject.org>; Thu, 18 Feb 2021 06:00:48 -0800 (PST)
Received: from ?IPv6:2a00:23c5:5785:9a01:a970:d87c:bd19:86c1?
 ([2a00:23c5:5785:9a01:a970:d87c:bd19:86c1])
 by smtp.gmail.com with ESMTPSA id q140sm10141888wme.0.2021.02.18.06.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 06:00:47 -0800 (PST)
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
X-Inumbo-ID: 8a014e25-a244-4342-9352-03043f5e257b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BY4qrM6o2zEMu6zv5MXmimY1AG6/hvex7B7y3DLJ5nQ=;
        b=D5NUjmuVo6WGLe9JMEk1PEDc23kq+DnE8YXguyeLFIwQ+OCg7I5B9RMgOgrWm5RUDz
         ErLrotxhCvl/0Mmglo/kMK2li4EAJ7tKuCUAlymOsihu+ghLTblwwN7zF/Nb6zsLNLtI
         ZV3vHQP97w3UoBEYKRhWPcHNQdQk4noT0cVUxGwA2kKyzCn6QfRbhOoQWCRvDS4o34a1
         4i9SKX1/mTMMmO2qT1aoRez3Wjw/sjL2qEMoECJfHj+xYW2IILnMg5SoRuGxsT5MSUW1
         PflzK6ZNy2WejJUV3pN0kgJ8Mem9tXfeirRfZeJN5i3qxCOjch5pdpdZPrOg0ngS2Vo2
         Q84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=BY4qrM6o2zEMu6zv5MXmimY1AG6/hvex7B7y3DLJ5nQ=;
        b=bK1DCU6X4QSciHbVc6baah0yi0ia95oK2iRaJqsTjSRxSGNnm1QEW6VS84s/vYeNB4
         qp8sIS5JTB69QQLpzJ4DNIWMJ87C/RmCYbd+pbJ9+3bI9qz+JpTlnA3rotQxd0KXqdN4
         W6jm1WYekKJoLKdEI3FQYz7I6XKAlZ+cV1/va79PuGyNhbP/SwbZWugLsRDecMUJogwA
         Mv4EiSnxLKnEF2tzJy0WZQD/Y6q57azMOX8b2SKzO0K6dlRKfz4RxRAUU2QjxzVSt5Fn
         2bGff7pNvOfSIMPfCrghBNKoGI5+IGBXzN7x+309w+g00CuL4AcxaVq77bLI1uCfLa7s
         TJag==
X-Gm-Message-State: AOAM533RN268dKI1wSLppmqt7F6eGncl1791g5QIHw4Bp0nuZI+bvaIc
	YQ+eiQ35pN1q436zRRaGLjX1h+7PsSw=
X-Google-Smtp-Source: ABdhPJzG5daJBGPloKEMMggcE1pS7AE5OpbDhT+VvuKEGdkVYB8cMOm+j1vW+JVwvQz1M6tndZ6+jQ==
X-Received: by 2002:adf:97d3:: with SMTP id t19mr4622560wrb.164.1613656847766;
        Thu, 18 Feb 2021 06:00:47 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [for-4.15][PATCH v3 2/3] xen/x86: iommu: Ignore IOMMU mapping
 requests when a domain is dying
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20210217142458.3769-1-julien@xen.org>
 <20210217142458.3769-3-julien@xen.org>
 <20f68b12-a767-b1d3-a3dd-9f92172def5f@suse.com>
 <d1116875-dd98-8f51-9113-314c1a62b4bf@xen.org>
 <268f1991-bacb-c888-04c0-0e4cf670b6b5@suse.com>
Message-ID: <14f21eac-7d5d-9dda-18d2-206614e91339@xen.org>
Date: Thu, 18 Feb 2021 14:00:46 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <268f1991-bacb-c888-04c0-0e4cf670b6b5@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18/02/2021 13:05, Jan Beulich wrote:
> On 17.02.2021 17:07, Julien Grall wrote:
>> On 17/02/2021 15:01, Jan Beulich wrote:
>>> On 17.02.2021 15:24, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> The new x86 IOMMU page-tables allocator will release the pages when
>>>> relinquishing the domain resources. However, this is not sufficient
>>>> when the domain is dying because nothing prevents page-table to be
>>>> allocated.
>>>>
>>>> Currently page-table allocations can only happen from iommu_map(). As
>>>> the domain is dying, there is no good reason to continue to modify the
>>>> IOMMU page-tables.
>>>
>>> While I agree this to be the case right now, I'm not sure it is a
>>> good idea to build on it (in that you leave the unmap paths
>>> untouched).
>>
>> I don't build on that assumption. See next patch.
> 
> Yet as said there that patch makes unmapping perhaps more fragile,
> by introducing a latent error source into the path.
> 
>>> Imo there's a fair chance this would be overlooked at
>>> the point super page mappings get introduced (which has been long
>>> overdue), and I thought prior discussion had lead to a possible
>>> approach without risking use-after-free due to squashed unmap
>>> requests.
>>
>> I know you suggested to zap the root page-tables... However, I don't
>> think this is 4.15 material and you agree with this (you were the one
>> pointed out that out).
> 
> Paul - do you have any thoughts here? Outright zapping isn't
> going to work, we'd need to switch to quarantine page tables at
> the very least to prevent the issue with babbling devices. But
> that still seems better to me than the introduction of a latent
> issue on the unmap paths.
> 

I've not really been following this. AFAICT clear_root_pgtable() does 
not actually mess with any context entries so the device view of the 
tables won't change, will it?

   Paul

