Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E29B7574C0A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 13:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367610.598679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBx00-0000mp-Vn; Thu, 14 Jul 2022 11:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367610.598679; Thu, 14 Jul 2022 11:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBx00-0000kD-Si; Thu, 14 Jul 2022 11:27:16 +0000
Received: by outflank-mailman (input) for mailman id 367610;
 Thu, 14 Jul 2022 11:27:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oBwzz-0000k5-4l
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 11:27:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oBwzv-0002Vs-2l; Thu, 14 Jul 2022 11:27:11 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.7.239.30])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oBwzu-0008EN-Sv; Thu, 14 Jul 2022 11:27:11 +0000
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
	bh=65AcNvDRfMlCqNJ2gUxekm50rS2E2CK6wUc8u4O4XfI=; b=ENcp8AoOiauClZ3zaEHvtokUYe
	A9bGal+mzmFg24KKWMMVIWYsiN+0bF83JspulLSFN8X7XFZq/VGJZN/ZoN/7CjThEv2x9a+AERLzS
	TtjDgnHPccOh1QmK3VDi5E40fO9H91lFW/ZlhWFfNoGrfHqpFfFXY8cCpFkmbhVQwbAk=;
Message-ID: <a9cd1e2f-fb49-ef68-41a9-58eb7c546266@xen.org>
Date: Thu, 14 Jul 2022 12:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2 9/9] xen: introduce a Kconfig option to configure NUMA
 nodes number
To: Jan Beulich <jbeulich@suse.com>, Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-10-wei.chen@arm.com>
 <b7d914bc-a2d7-d12e-15ac-ae7389d8bcd2@suse.com>
 <PAXPR08MB74200E2A75A2D755AC95BF519E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <a54d09a2-6629-16f1-8893-37d022c2dd5b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a54d09a2-6629-16f1-8893-37d022c2dd5b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 14/07/2022 12:10, Jan Beulich wrote:
> On 14.07.2022 12:14, Wei Chen wrote:
>> Hi Jan,
>>
>>> -----Original Message-----
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: 2022年7月12日 22:34
>>> To: Wei Chen <Wei.Chen@arm.com>
>>> Cc: nd <nd@arm.com>; Andrew Cooper <andrew.cooper3@citrix.com>; George
>>> Dunlap <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano
>>> Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Roger Pau Monné
>>> <roger.pau@citrix.com>; xen-devel@lists.xenproject.org
>>> Subject: Re: [PATCH v2 9/9] xen: introduce a Kconfig option to configure
>>> NUMA nodes number
>>>
>>> On 08.07.2022 16:54, Wei Chen wrote:
>>>> --- a/xen/arch/Kconfig
>>>> +++ b/xen/arch/Kconfig
>>>> @@ -17,3 +17,14 @@ config NR_CPUS
>>>>   	  For CPU cores which support Simultaneous Multi-Threading or
>>> similar
>>>>   	  technologies, this the number of logical threads which Xen will
>>>>   	  support.
>>>> +
>>>> +config NR_NUMA_NODES
>>>> +	int "Maximum number of NUMA nodes supported"
>>>> +	range 1 255
>>>> +	default "64"
>>>> +	depends on NUMA
>>>
>>> Does 1 make sense? That's not going to be NUMA then, I would say.
>>>
>>
>> Ok, we need at least 2 nodes to be a real NUMA.
>>
>>> Does the value being (perhaps far) larger than NR_CPUS make sense?
>>>
>>
>> Arm has 128 default NR_CPUS (except some platforms) and x86 has 256.
>> So I am not very clear about your comments about far larger? As my
>> Understanding, one node has 2 or 4 cores are very common in a NUMA
>> System.
> 
> The defaults are fine. But does it make sense to have 255 nodes when
> just 32 CPUs were selected? I'm afraid kconfig is going to get in the
> way, but I think I'd like the upper bound to be min(NR_CPUS, 255).
Looking around NUMA nodes with 0 CPUs exists. So I don't think we should 
tie the two.

Cheers,

-- 
Julien Grall

