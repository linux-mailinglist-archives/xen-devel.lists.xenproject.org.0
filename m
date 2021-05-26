Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD119391CDE
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 18:19:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132637.247334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llwFL-0006RG-G1; Wed, 26 May 2021 16:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132637.247334; Wed, 26 May 2021 16:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llwFL-0006Oe-Ct; Wed, 26 May 2021 16:19:03 +0000
Received: by outflank-mailman (input) for mailman id 132637;
 Wed, 26 May 2021 16:19:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1llwFJ-0006OS-SA
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 16:19:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1llwFI-0004mr-V4; Wed, 26 May 2021 16:19:00 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1llwFI-0003YL-PY; Wed, 26 May 2021 16:19:00 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=qOH8JQ+l9ePPzjcF+2tQRoy8AMjHGYyfSRfbRnD6RJU=; b=3c9xuQQu8iqUR9BPr0oiOTFPlE
	RGr6w9yPzSCGIibw+0+WneLhQ9/IYQApKG5kjPxh4IKZvWSLRloOuJtZIyF0abvtRvp0BGWYFk1PW
	LW1nt78eYsKwHn4RdFGCDWJgMhqRLZLByqGs7P+rXOm152NCmslqxoPY7YPlrPLYibhg=;
Subject: Re: [XEN PATCH v1] libxl/arm: provide guests with random seed
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
References: <20210524080057.1773-1-Sergiy_Kibrik@epam.com>
 <a3c51dea-80e5-df92-3757-72809ad96434@xen.org>
 <AM9PR03MB6836B02970F4F1CAEEAEAD78F0249@AM9PR03MB6836.eurprd03.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d85d9c25-aff7-43ff-6ae5-04ab394dcd0d@xen.org>
Date: Wed, 26 May 2021 17:18:58 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <AM9PR03MB6836B02970F4F1CAEEAEAD78F0249@AM9PR03MB6836.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 26/05/2021 10:28, Sergiy Kibrik wrote:
> Hi Julien,

Hi Sergiy,

>>> diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c index
>>> 34f8a29056..05c58a428c 100644
>>> --- a/tools/libxl/libxl_arm.c
>>> +++ b/tools/libxl/libxl_arm.c
>>> @@ -342,6 +342,12 @@ static int make_chosen_node(libxl__gc *gc, void
>> *fdt, bool ramdisk,
>>>            if (res) return res;
>>>        }
>>>
>>> +    uint8_t seed[128];
>>
>> I couldn't find any documentation for the property (although, I have found
>> code in Linux). Can you explain where the 128 come from?
>   
> I didn't find documentation either, probably that part is un-documented yet.
> This is kind of tradeoff between ChaCha20 key size of 32 (which is used in guest Linux CRNG), and data size that host is expected to provide w/o being blocked or delayed
> (which is 256 according to getrandom() man page). In case of 128-bytes seed each byte of CRNG state will be mixed 4 times using bytes from this seed.

Ok. Can the reasoning be documented in the commit message (with a short 
summary in the code)? This would be helpful if in the future one decide 
to change the size of the seed.

Cheers,

-- 
Julien Grall

