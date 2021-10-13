Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B14642C11E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 15:14:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208458.364589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mae4x-0002bo-Rn; Wed, 13 Oct 2021 13:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208458.364589; Wed, 13 Oct 2021 13:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mae4x-0002Yy-Nu; Wed, 13 Oct 2021 13:13:55 +0000
Received: by outflank-mailman (input) for mailman id 208458;
 Wed, 13 Oct 2021 13:13:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K823=PB=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mae4w-0002Yq-D1
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 13:13:54 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c125cf3a-97b4-4e29-823c-120e8613e152;
 Wed, 13 Oct 2021 13:13:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 947361FB;
 Wed, 13 Oct 2021 06:13:52 -0700 (PDT)
Received: from [10.57.25.166] (unknown [10.57.25.166])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16F6E3F66F;
 Wed, 13 Oct 2021 06:13:49 -0700 (PDT)
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
X-Inumbo-ID: c125cf3a-97b4-4e29-823c-120e8613e152
Subject: Re: [PATCH v7] xen: Expose the PMU to the guests
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 bertrand.marquis@arm.com
References: <20211013123352.6625-1-michal.orzel@arm.com>
 <24934.54743.853232.853726@mariner.uk.xensource.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <3d414cd9-2cb7-3a26-eada-e75fa0fe05a2@arm.com>
Date: Wed, 13 Oct 2021 15:13:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24934.54743.853232.853726@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Ian,

On 13.10.2021 14:49, Ian Jackson wrote:
> Michal Orzel writes ("[PATCH v7] xen: Expose the PMU to the guests"):
>> Add parameter vpmu to xl domain configuration syntax
>> to enable the access to PMU registers by disabling
>> the PMU traps(currently only for ARM).
>>
>> The current status is that the PMU registers are not
>> virtualized and the physical registers are directly
>> accessible when this parameter is enabled. There is no
>> interrupt support and Xen will not save/restore the
>> register values on context switches.
>>
>> According to Arm Arm, section D7.1:
>> "The Performance Monitors Extension is common
>> to AArch64 operation and AArch32 operation."
>> That means we have an ensurance that if PMU is
>> present in one exception state, it must also be
>> present in the other.
>>
>> Please note that this feature is experimental.
> ...
>> Changes since v6:
>> -fix missing "HVM" for vPMU entry in SUPPORT.md
> 
> The SUPPORT.md changes LGTM, thanks.
> 
>> -Virtual Performance Management Unit for HVM guests
>> +Virtual Performance Management Unit
>>  
>> -    Status, x86: Supported, Not security supported
>> +    Status, x86 HVM: Supported, Not security supported
>> +    Status, ARM: Experimental
>> +
>> +On ARM, support for accessing PMU registers from the guests.
>> +There is no interrupt support and Xen will not save/restore
>> +the register values on context switches.
> 
> FTAOD ISTM that this limitation makes the feature very hard to use
> successfully on ARM.  You would need to pin vcpus to dedicated
> pcpus ?
> 
Yes, there are some limitations but even with them it is really useful.
We are making use of vPMU in our tests successfuly.
FWIK Stefano also had to provide a patch enabling pmu in the past.
It was agreed that we will expose only part of vPMU.
The rest needs to be done in the future.
PMU interrupt is only used to signal overflow which would occur
in a very long tests.

> I think this is fine for an experimental feature.
> 
> I think this patch needs a ARM/hypervisor acks still.
>
Agree. Probably Stefano will do this today.

> Ian.
> Cheers,
Michal

