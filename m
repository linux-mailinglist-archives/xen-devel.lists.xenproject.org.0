Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA37661672
	for <lists+xen-devel@lfdr.de>; Sun,  8 Jan 2023 17:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473190.733690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEYKM-0007u7-Il; Sun, 08 Jan 2023 16:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473190.733690; Sun, 08 Jan 2023 16:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEYKM-0007s3-Fz; Sun, 08 Jan 2023 16:15:18 +0000
Received: by outflank-mailman (input) for mailman id 473190;
 Sun, 08 Jan 2023 16:15:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pEYKK-0007rx-Li
 for xen-devel@lists.xenproject.org; Sun, 08 Jan 2023 16:15:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEYKI-0002wD-B7; Sun, 08 Jan 2023 16:15:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEYKI-00048z-4P; Sun, 08 Jan 2023 16:15:14 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=GmJ/zyeoEhIUHgdbR+I4UZJePj+rfIrAL48WhbxkeSM=; b=YC8sprd7xd+Z8RbQAxqCRoy4Xq
	leyu1wzrZhxoUx8sEQ4sfJn2JH5cknpVxYb1+/BpTRcV2QzQsVf56mBo9C8+vgTEn0jEVe1PTq/KM
	Y1kE4w1pYiD/KVpLF5GFUb2o9QYLfSBmlqp0Aa9ixynOhxeN9qwAcz8/8nLxP9rovoNw=;
Message-ID: <611b0857-155a-a50b-5996-ce735ebce22d@xen.org>
Date: Sun, 8 Jan 2023 16:15:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Henry Wang <Henry.Wang@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org>
 <AS8PR08MB7991FD5994497D812FE3AE2E92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9d5ab09e-650f-118d-0233-d7988f1504f1@xen.org>
 <AS8PR08MB799170627B34BD2627CE3092921D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e6643bfc-5bdf-f685-1b68-b28d341071c1@xen.org>
 <alpine.DEB.2.22.394.2212091409020.3075842@ubuntu-linux-20-04-desktop>
 <A52E1C09-40F1-416C-A085-2F2320EE69EA@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
In-Reply-To: <A52E1C09-40F1-416C-A085-2F2320EE69EA@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 03/01/2023 12:34, Bertrand Marquis wrote:
> Hi,
> 
> Sorry for the delay but I have very limited access to my mails right now.
> 
>> On 9 Dec 2022, at 23:11, Stefano Stabellini <sstabellini@kernel.org 
>> <mailto:sstabellini@kernel.org>> wrote:
>>
>> On Fri, 9 Dec 2022, Julien Grall wrote:
>>> Hi Henry,
>>>
>>> On 08/12/2022 03:06, Henry Wang wrote:
>>>> I am trying to work on the follow-up improvements about the Arm P2M 
>>>> code,
>>>> and while trying to address the comment below, I noticed there was an
>>>> unfinished
>>>> discussion between me and Julien which I would like to continue and here
>>>> opinions from all of you (if possible).
>>>>
>>>>> -----Original Message-----
>>>>> From: Julien Grall <julien@xen.org <mailto:julien@xen.org>>
>>>>> Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 
>>>>> mapping in
>>>>> arch_domain_create()
>>>>>>> I also noticed that relinquish_p2m_mapping() is not called. This
>>>>>>> should
>>>>>>> be fine for us because arch_domain_create() should never create a
>>>>>>> mapping that requires p2m_put_l3_page() to be called.
>>>>
>>>> For the background of the discussion, this was about the failure path of
>>>> arch_domain_create(), where we only call p2m_final_teardown() which does
>>>> not call relinquish_p2m_mapping()...
>>> So all this mess with the P2M is necessary because we are mapping the 
>>> GICv2
>>> CPU interface in arch_domain_create(). I think we should consider to 
>>> defer the
>>> mapping to later.
>>>
>>> Other than it makes the code simpler, it also means we could also the 
>>> P2M root
>>> on the same numa node the domain is going to run (those information 
>>> are passed
>>> later on).
>>>
>>> There is a couple of options:
>>> 1. Introduce a new hypercall to finish the initialization of a domain 
>>> (e.g.
>>> allocating the P2M and map the GICv2 CPU interface). This option was 
>>> briefly
>>> discussed with Jan (see [2])./
>>> 2. Allocate the P2M when populate the P2M pool and defer the GICv2 CPU
>>> interface mapping until the first access (similar to how with deal 
>>> with MMIO
>>> access for ACPI).
>>>
>>> I find the second option is neater but it has the drawback that it 
>>> requires on
>>> more trap to the hypervisor and we can't report any mapping failure 
>>> (which
>>> should not happen if the P2M was correctly sized). So I am leaning 
>>> towards
>>> option 2.
>>>
>>> Any opinions?
>>
>> Option 1 is not great due to the extra hypercall. But I worry that
>> option 2 might make things harder for safety because the
>> mapping/initialization becomes "dynamic". I don't know if this is a
>> valid concern.
>>
>> I would love to hear Bertrand's thoughts about it. Putting him in To:
> 
> How option 1 would work for dom0less ?

Xen would call the function directly. Effectively, this would the same 
as all the other "hypercalls" we are using to build a dom0less domain.

> 
> Option 2 would make safety more challenging but not impossible (we have 
> a lot of other use cases where we cannot map everything on boot).
> 
> I would vote for option 2 as I think we will not certify gicv2 and it is 
> not adding an other hyper call.

It sounds like option 2 is the preferred way for now. Henry, can you 
have a look?

Cheers,

-- 
Julien Grall

