Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED78AB0F1D1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 14:02:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053878.1422667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueYB6-0001H3-7L; Wed, 23 Jul 2025 12:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053878.1422667; Wed, 23 Jul 2025 12:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueYB6-0001Fc-4G; Wed, 23 Jul 2025 12:02:32 +0000
Received: by outflank-mailman (input) for mailman id 1053878;
 Wed, 23 Jul 2025 12:02:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ueYB5-0001FW-Ky
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 12:02:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ueYB4-00EsfR-1x;
 Wed, 23 Jul 2025 12:02:30 +0000
Received: from [15.248.2.234] (helo=[10.24.67.34])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ueYB4-009RvH-0r;
 Wed, 23 Jul 2025 12:02:30 +0000
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
	bh=3YRiS053T+S8PQj31pQDRgF0vdmdDg9DTwjWARfUqn4=; b=DJm2hMN+1Tc/1wt2U9DZlZoEjg
	mVbbmEA/Wwm/GRVhHoydAK2Ro82yaBDt0mPbZqK3Q592nKO5DaqRSx6qHFBx4NJjiGv9plWHcfVVR
	THq3Xt/CMDoXINhoF3RED+WvJu/MkErqVuNKWyYGbtBbSiLJzbNQDd8PNPp5uJ5L9LNs=;
Message-ID: <71fa14e0-83d7-48ec-8bd9-258ec8f6cedf@xen.org>
Date: Wed, 23 Jul 2025 13:02:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 0/8] xen/arm64: make aarch32 support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "Orzel, Michal" <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
 <b968715b-20e5-4a63-8ad3-d4250e796c5d@xen.org>
 <e35822cc-d8a0-49c1-a4b1-2765e0e6cb6c@amd.com>
 <add27fd8-aaa2-453a-b502-fd505ec77f94@epam.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <add27fd8-aaa2-453a-b502-fd505ec77f94@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/07/2025 12:48, Grygorii Strashko wrote:
> 
> 
> On 23.07.25 13:54, Orzel, Michal wrote:
>>
>>
>> On 23/07/2025 10:06, Julien Grall wrote:
>>>
>>>
>>> On 23/07/2025 08:58, Grygorii Strashko wrote:
>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>
>>>> Hi,
>>>
>>> Hi Grygorii,
>>>
>>>> Now Arm64 AArch32 guest support is always enabled and built-in while 
>>>> not
>>>> all Arm64 platforms supports AArch32 or this support might not be 
>>>> needed.
>>>
>>> I am not entirely sure I like the proliferation of using CONFIG_* for
>>> every single feature. This makes the testing a bit more complicated.
>>>
>>> Can you clarify what the goal with this patch?
>> AArch32 is used quite rarely in embedded systems. Also, in Armv9A it 
>> might only
>> be implemented at EL0 if at all. When focusing on safety 
>> certification, AArch32
>> related code in Xen leaves a gap in terms of coverage that cannot 
>> really be
>> justified in words. This leaves us with two options: either support it 
>> (lots of
>> additional testing, requirements and documents would be needed) or 
>> compile it out.
> 
> FYI. bloat-o-meter report for this series with CONFIG_ARM64_AARCH32=n, 
> CONFIG_EXPERT=y

Thanks for sharing the bloat-o-meter. But I don't think the result below 
warrant a new config. The reason provided by Michal is a better reason 
as the impact on safety certification is more significant.

Cheers,

-- 
Julien Grall


