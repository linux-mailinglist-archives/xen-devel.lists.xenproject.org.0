Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538DA374F44
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 08:15:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123347.232638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leXGR-0000if-Oa; Thu, 06 May 2021 06:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123347.232638; Thu, 06 May 2021 06:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leXGR-0000g3-K5; Thu, 06 May 2021 06:13:35 +0000
Received: by outflank-mailman (input) for mailman id 123347;
 Thu, 06 May 2021 06:13:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cpQT=KB=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1leXGQ-0000fx-9j
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 06:13:34 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b32e68c9-72d0-4190-a103-88f350fca7ca;
 Thu, 06 May 2021 06:13:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95F8E31B;
 Wed,  5 May 2021 23:13:32 -0700 (PDT)
Received: from [10.57.27.152] (unknown [10.57.27.152])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 631B13F70D;
 Wed,  5 May 2021 23:13:31 -0700 (PDT)
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
X-Inumbo-ID: b32e68c9-72d0-4190-a103-88f350fca7ca
Subject: Re: [PATCH v3 02/10] arm/domain: Get rid of READ/WRITE_SYSREG32
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com
References: <20210505074308.11016-1-michal.orzel@arm.com>
 <20210505074308.11016-3-michal.orzel@arm.com>
 <fd49021f-c437-fd0c-b3a8-e3a237e633be@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <795c63a5-76fc-0de4-d3be-ac3b9d90fa58@arm.com>
Date: Thu, 6 May 2021 08:13:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fd49021f-c437-fd0c-b3a8-e3a237e633be@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Julien,

On 05.05.2021 20:03, Julien Grall wrote:
> Hi Michal,
> 
> On 05/05/2021 08:43, Michal Orzel wrote:
>> AArch64 registers are 64bit whereas AArch32 registers
>> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
>> we should get rid of helpers READ/WRITE_SYSREG32
>> in favour of using READ/WRITE_SYSREG.
>> We should also use register_t type when reading sysregs
>> which can correspond to uint64_t or uint32_t.
>> Even though many AArch64 registers have upper 32bit reserved
>> it does not mean that they can't be widen in the future.
>>
>> Modify type of register cntkctl to register_t.
>>
>> Modify accesses to thumbee registers to use READ/WRITE_SYSREG.
>> Thumbee registers are only usable by a 32bit domain and in fact
>> should be only accessed on ARMv7 as they were retrospectively dropped
>> on ARMv8.
> 
> Sorry for not replying on v2. How about:
> 
> "
> Thumbee registers are only usable by a 32-bit domain and therefore we can just store the bottom 32-bit (IOW there is no type change). In fact, this could technically be restricted to Armv7 HW (the support was dropped retrospectively in Armv8) but leave it as-is for now.
> "
> 
> If you are happy with it, I will do it on commit.
> 
I am happy with it. Please ack and change it on commit.
Thanks.
> Cheers,
> 

Cheers,
Michal

