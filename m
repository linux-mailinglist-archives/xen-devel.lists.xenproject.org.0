Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FDC53FDA3
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 13:38:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343160.568328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyXWw-0002Z7-QF; Tue, 07 Jun 2022 11:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343160.568328; Tue, 07 Jun 2022 11:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyXWw-0002WP-Me; Tue, 07 Jun 2022 11:37:50 +0000
Received: by outflank-mailman (input) for mailman id 343160;
 Tue, 07 Jun 2022 11:37:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nyXWv-0002WJ-Qo
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 11:37:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nyXWr-0003Kj-90; Tue, 07 Jun 2022 11:37:45 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.23.140]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nyXWr-0006lN-1P; Tue, 07 Jun 2022 11:37:45 +0000
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
	bh=2DTmA/fVDPnd+03QzqdhfZ9OgzBy9cn82PZPGPcz5og=; b=tq7vdxoAZo7388JuVC8qNQcQUE
	vuSvy2nlYUqYvGxzJsbuyY5eIyDezguLpyBtfh0uC1/SoQYDOgtZ1Zt9Kocj7V878bzpWp5SvVr5H
	+U8ZuAYEiMSMi2MyfauplNPN/WC5SJBDIsxEbr9k0K3FQiZefazOjZtDE0A+Je819e+Y=;
Message-ID: <76399014-f256-6be4-299a-9d46742abd8a@xen.org>
Date: Tue, 7 Jun 2022 12:37:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 1/4] kconfig: allow configuration of maximum modules
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
 <20220531024127.23669-2-dpsmith@apertussolutions.com>
 <ab531f8b-a602-22e0-dabf-c7d073c88236@xen.org>
 <be06db4d-43c4-7d24-db0d-349c0a1e4999@apertussolutions.com>
 <337d6dbf-e8ee-5de7-a75e-97be815f4467@xen.org>
 <de93f0f5-374e-6fc8-22c3-70023a7d2f9b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <de93f0f5-374e-6fc8-22c3-70023a7d2f9b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 02/06/2022 09:49, Jan Beulich wrote:
> On 01.06.2022 19:35, Julien Grall wrote:
>>
>>
>> On 31/05/2022 11:53, Daniel P. Smith wrote:
>>> On 5/31/22 05:25, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 31/05/2022 03:41, Daniel P. Smith wrote:
>>>>> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
>>>>> index f16eb0df43..57b14e22c9 100644
>>>>> --- a/xen/arch/Kconfig
>>>>> +++ b/xen/arch/Kconfig
>>>>> @@ -17,3 +17,15 @@ config NR_CPUS
>>>>>           For CPU cores which support Simultaneous Multi-Threading or
>>>>> similar
>>>>>           technologies, this the number of logical threads which Xen will
>>>>>           support.
>>>>> +
>>>>> +config NR_BOOTMODS
>>>>> +    int "Maximum number of boot modules that a loader can pass"
>>>>> +    range 1 64
>>>>
>>>> OOI, any reason to limit the size?
>>>
>>> I modelled this entirely after NR_CPUS, which applied a limit
>>
>> The limit for NR_CPUS makes sense because there are scalability issues
>> after that (although 4095 seems quite high) and/or the HW impose a limit.
> 
> The 4095 is actually a software limit (due to how spinlocks are
> implemented).
> 
>>> , and it
>>> seemed reasonable to me at the time. I choose 64 since it was double
>>> currently what Arm had set for MAX_MODULES. As such, I have no hard
>>> reason for there to be a limit. It can easily be removed or adjusted to
>>> whatever the reviewers feel would be appropriate.
>>
>> Ok. In which case I would drop the limit beause it also prevent a users
>> to create more 64 dom0less domUs (actually a bit less because some
>> modules are used by Xen). I don't think there are a strong reason to
>> prevent that, right?
> 
> At least as per the kconfig language doc the upper bound is not
> optional, so if a range is specified (which I think it should be,
> to enforce the lower limit of 1) and upper bound is needed. To
> address your concern with dom0less - 32768 maybe?

I am fine with that.

Cheers,

-- 
Julien Grall

