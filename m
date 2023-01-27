Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7391B67E38B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:35:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485485.752744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLN1A-0000tS-T6; Fri, 27 Jan 2023 11:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485485.752744; Fri, 27 Jan 2023 11:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLN1A-0000rl-Q3; Fri, 27 Jan 2023 11:35:40 +0000
Received: by outflank-mailman (input) for mailman id 485485;
 Fri, 27 Jan 2023 11:35:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pLN19-0000rd-FA
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 11:35:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLN19-0002Ac-2b; Fri, 27 Jan 2023 11:35:39 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[192.168.15.151]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLN18-0001FQ-Sy; Fri, 27 Jan 2023 11:35:39 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ONPcW5Rwkp1ZgIhf8zY8FmKLkRgXYF90Amoqzb6mXUw=; b=ViiRxEeY9GS0WQG5Dx1gjIrrTu
	d8QbVRErt9RtWyFuFxf72Y9YuU77jLrMNgax1j7vgtyFHe5hU5xAaZlTcgELoy8dB7ChLysg7qy6K
	kTRlVTB2c9sCUV08kPfpBFZHer8vG5drLZujaWCEhFRIFXAY9Z3Tc2trv8nL/BSGAyeI=;
Message-ID: <ed09cf44-cb7b-6713-6ea4-ac38e80b3549@xen.org>
Date: Fri, 27 Jan 2023 11:35:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] xen/arm: Defer GICv2 CPU interface mapping until the
 first access
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230116015820.1269387-1-Henry.Wang@arm.com>
 <20230116015820.1269387-3-Henry.Wang@arm.com>
 <b2822e36-0972-5c4b-90d9-aee6533824b2@amd.com>
 <AS8PR08MB79913487DBC6F434758EAE5A92CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <a729bf36-8c67-ccd4-c787-d62aaf7e24b2@xen.org>
 <AS8PR08MB799127D46D09BCFEF9A0392192CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB799127D46D09BCFEF9A0392192CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/01/2023 11:30, Henry Wang wrote:
> Hi Julien,
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH 2/3] xen/arm: Defer GICv2 CPU interface mapping until
>> the first access
>>
>> Hi,
>>
>>>>> @@ -153,6 +153,8 @@ struct vgic_dist {
>>>>>        /* Base address for guest GIC */
>>>>>        paddr_t dbase; /* Distributor base address */
>>>>>        paddr_t cbase; /* CPU interface base address */
>>>>> +    paddr_t csize; /* CPU interface size */
>>>>> +    paddr_t vbase; /* virtual CPU interface base address */
>>>> Could you swap them so that base address variables are grouped?
>>>
>>> Sure, my original thought was grouping the CPU interface related fields but
>>> since you prefer grouping the base address, I will follow your suggestion.
>>
>> I would actually prefer your approach because it is easier to associate
>> the size with the base.
>>
>> An alternative would be to use a structure to combine the base/size. So
>> it is even clearer the association.
>>
>> I don't have a strong opinion on either of the two approach I suggested.
> 
> Maybe we can do something like this:
> ```
> paddr_t dbase; /* Distributor base address */
> paddr_t vbase; /* virtual CPU interface base address */
> paddr_t cbase; /* CPU interface base address */
> paddr_t csize; /* CPU interface size */
> ```
> 
> So we can ensure both "base address variables are grouped" and
> "CPU interface variables are grouped".
> 
> If you don't like this, I would prefer the way I am currently doing, as
> personally I think an extra structure would slightly be an overkill :)

This is really a matter of taste here. My preference is your initial 
approach because I find strange to have virtual CPU interface 
information the physical one.

Cheers,

-- 
Julien Grall

