Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC32D59336D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 18:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387702.624054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNdEF-0004fU-EZ; Mon, 15 Aug 2022 16:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387702.624054; Mon, 15 Aug 2022 16:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNdEF-0004cc-Bk; Mon, 15 Aug 2022 16:46:15 +0000
Received: by outflank-mailman (input) for mailman id 387702;
 Mon, 15 Aug 2022 16:46:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oNdEE-0004cU-2R
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 16:46:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oNdEA-0001Iw-5l; Mon, 15 Aug 2022 16:46:10 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[10.95.149.129]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oNdE9-0000R1-Uj; Mon, 15 Aug 2022 16:46:10 +0000
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
	bh=F9VyOrKpDtsCX0+ROqFeK4KujX0h3i2iD2RK7vKil9M=; b=2ZCifON7UesPziPVYSgO4+K9wB
	vHUcx1lj8WslY4C/MDPSVzU3bBiJvddNBHVQNd3Q7WsDQvodJv56G3wOvDda5I48o9DRtM3vLQUL1
	habIig42nrr9hNomAtjklllkBxOFW7Del95AatYsV6tuGtUZSkFbvzmWN4VV3KUW3hcw=;
Message-ID: <ca61e334-3b4e-de50-c993-9439fe4d1d4b@xen.org>
Date: Mon, 15 Aug 2022 17:46:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH 5/7] xen/arm32: head: Move earlyprintk messages to
 .rodata.str
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-6-julien@xen.org>
 <432ffaec-c537-0337-5812-18385ccbb534@suse.com>
 <94843cc5-919b-68cf-31d2-a8625d9342d7@xen.org>
 <ff329cf5-689e-89f1-c82a-7df6dbf11446@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ff329cf5-689e-89f1-c82a-7df6dbf11446@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 15/08/2022 09:21, Jan Beulich wrote:
> On 15.08.2022 10:17, Julien Grall wrote:
>> On 15/08/2022 07:43, Jan Beulich wrote:
>>> On 12.08.2022 21:24, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> At the moment, the strings are in text right after each use because
>>>> the instruction 'adr' has specific requirement on the location
>>>> and the compiler will forbid cross section label.
>>>>
>>>> The macro 'adr_l' was recently reworked so the caller doesn't need
>>>> to know whether the MMU is on. This makes it easier to use where
>>>> instructions can be run in both context.
>>>>
>>>> This also means that the strings don't need to be part of .text
>>>> anymore. So move them to .rodata.str.
>>>
>>> Wouldn't they better live somewhere in .init* ?
>>
>> PRINT() is also used in path for secondary bring-up. So this could be
>> used after .init (even though today CPU hotplug doesn't work on Arm).
> 
> Then the term "earlyprintk" looks to be misleading?
I can't think of a better name. "early" could also be interpreted as 
"early CPU bring-up".

Cheers,

-- 
Julien Grall

