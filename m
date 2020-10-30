Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4D12A0C50
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 18:19:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16080.39365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYY3K-0000wz-0b; Fri, 30 Oct 2020 17:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16080.39365; Fri, 30 Oct 2020 17:19:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYY3J-0000wa-Tc; Fri, 30 Oct 2020 17:19:01 +0000
Received: by outflank-mailman (input) for mailman id 16080;
 Fri, 30 Oct 2020 17:19:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kYY3I-0000wS-3C
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 17:19:00 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2aa8fcd0-177f-414e-8ecd-b505d8cd9a3e;
 Fri, 30 Oct 2020 17:18:58 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYY3F-0006JC-3U; Fri, 30 Oct 2020 17:18:57 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYY3E-0002zs-RT; Fri, 30 Oct 2020 17:18:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kYY3I-0000wS-3C
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 17:19:00 +0000
X-Inumbo-ID: 2aa8fcd0-177f-414e-8ecd-b505d8cd9a3e
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2aa8fcd0-177f-414e-8ecd-b505d8cd9a3e;
	Fri, 30 Oct 2020 17:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=vv4qDEHAvxSnK2RpQGc3twd2Vr4OyqTc61RY7eNV17M=; b=gSfNXVI5IbHQbi4y3oIM3Z+9gQ
	c8UN7rwwcW4UZEUA0swi4Nea54TV9wnzoPrnM9+bZYakadfzanXmmolObTlXrQSBH8qRCIkdDzm/O
	2aoHN1To2g2Sme4DJiFg+yntw7fS9umxGZ0mqvhqchRioXl/lI1Leep7fJOM6UFHzaqg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYY3F-0006JC-3U; Fri, 30 Oct 2020 17:18:57 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYY3E-0002zs-RT; Fri, 30 Oct 2020 17:18:56 +0000
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <09cfc160-3490-0aeb-f872-04fb4ce04364@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <76593217-c7e2-2963-9cbe-d6cc38830710@xen.org>
Date: Fri, 30 Oct 2020 17:18:54 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <09cfc160-3490-0aeb-f872-04fb4ce04364@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 30/10/2020 10:44, Oleksandr Andrushchenko wrote:
> On 10/20/20 6:25 PM, Rahul Singh wrote:
>> Add support for ARM architected SMMUv3 implementations. It is based on
>> the Linux SMMUv3 driver.
>>
>> Major differences between the Linux driver are as follows:
>> 1. Only Stage-2 translation is supported as compared to the Linux driver
>>      that supports both Stage-1 and Stage-2 translations.
> 
> First of all thank you for the efforts!
> 
> I tried the patch with QEMU and would like to know if my understanding correct
> 
> that this combination will not work as of now:
> 
> (XEN) SMMUv3: /smmuv3@9050000: SMMUv3: DT value = eventq
> (XEN) Data Abort Trap. Syndrome=0x1940010
> (XEN) Walking Hypervisor VA 0x40031000 on CPU0 via TTBR 0x00000000b8469000
> (XEN) 0TH[0x0] = 0x00000000b8468f7f
> 
> [snip]
> 
> If this is expected then is there any plan to make QEMU work as well?
> 
> I see [1] says that "Only stage 1 and AArch64 PTW are supported." on QEMU side.

Just for clarication, you are trying to boot Xen on QEMU, right?

You might be able to use the stage-1 page-tables to isolate each device 
in Xen. However, I don't think you will be able to share the P2M because 
the page-tables layout between stage-1 and stage-2 is different.

> 
> 
> We are interested in QEMU/SMMUv3 as a flexible platform for PCI passthrough
> 
> implementation, so it could allow testing different setups and configurations with QEMU.

I would recommend to get the SMMU supporting supporting stage-2 page-tables.

Regardless that, I think Xen should be able to say the SMMU is not 
supported rather than crashing.

Cheers,

-- 
Julien Grall

