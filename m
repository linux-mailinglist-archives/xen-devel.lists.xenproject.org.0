Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA10D6488A6
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 19:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458179.716058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3iTc-0005QE-Ij; Fri, 09 Dec 2022 18:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458179.716058; Fri, 09 Dec 2022 18:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3iTc-0005Nc-Fb; Fri, 09 Dec 2022 18:52:04 +0000
Received: by outflank-mailman (input) for mailman id 458179;
 Fri, 09 Dec 2022 18:52:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p3iTb-0005NU-EG
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 18:52:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3iTY-0001is-UO; Fri, 09 Dec 2022 18:52:00 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.4.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3iTY-0001nm-OJ; Fri, 09 Dec 2022 18:52:00 +0000
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
	bh=7yGrikEqez9wuVD/KWGrdNfrWfr4196gXLPjgrXHoXc=; b=FruYKeC0pciD/fZtQ8w2zEielv
	5KghadJ+5gVLsXzzpd7wtsjsQgcLh+OOSv3yk6Mb+CgaX4+aT5duipM+NRxWFS0sSg04fwcqfAa+E
	wb3BnECdCCWFyJ7pWyfxAfD3Qm/ONatW8JQY848MHF8RSAJbcLyHzNqpLWTexugKv7fM=;
Message-ID: <e6643bfc-5bdf-f685-1b68-b28d341071c1@xen.org>
Date: Fri, 9 Dec 2022 18:51:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org>
 <AS8PR08MB7991FD5994497D812FE3AE2E92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9d5ab09e-650f-118d-0233-d7988f1504f1@xen.org>
 <AS8PR08MB799170627B34BD2627CE3092921D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB799170627B34BD2627CE3092921D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 08/12/2022 03:06, Henry Wang wrote:
> I am trying to work on the follow-up improvements about the Arm P2M code,
> and while trying to address the comment below, I noticed there was an unfinished
> discussion between me and Julien which I would like to continue and here
> opinions from all of you (if possible).
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
>> arch_domain_create()
>>>> I also noticed that relinquish_p2m_mapping() is not called. This should
>>>> be fine for us because arch_domain_create() should never create a
>>>> mapping that requires p2m_put_l3_page() to be called.
> 
> For the background of the discussion, this was about the failure path of
> arch_domain_create(), where we only call p2m_final_teardown() which does
> not call relinquish_p2m_mapping()...
So all this mess with the P2M is necessary because we are mapping the 
GICv2 CPU interface in arch_domain_create(). I think we should consider 
to defer the mapping to later.

Other than it makes the code simpler, it also means we could also the 
P2M root on the same numa node the domain is going to run (those 
information are passed later on).

There is a couple of options:
  1. Introduce a new hypercall to finish the initialization of a domain 
(e.g. allocating the P2M and map the GICv2 CPU interface). This option 
was briefly discussed with Jan (see [2])./
  2. Allocate the P2M when populate the P2M pool and defer the GICv2 CPU 
interface mapping until the first access (similar to how with deal with 
MMIO access for ACPI).

I find the second option is neater but it has the drawback that it 
requires on more trap to the hypervisor and we can't report any mapping 
failure (which should not happen if the P2M was correctly sized). So I 
am leaning towards option 2.

Any opinions?

Cheers,

[1] 
https://lore.kernel.org/xen-devel/6c07cdfc-888a-45bb-2077-528a809a62f4@suse.com/

-- 
Julien Grall

