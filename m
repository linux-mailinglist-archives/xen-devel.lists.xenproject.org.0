Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3629C3D944F
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 19:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161765.296875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8nLP-0005tD-PT; Wed, 28 Jul 2021 17:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161765.296875; Wed, 28 Jul 2021 17:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8nLP-0005rO-Le; Wed, 28 Jul 2021 17:27:47 +0000
Received: by outflank-mailman (input) for mailman id 161765;
 Wed, 28 Jul 2021 17:27:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m8nLN-0005rI-Vc
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 17:27:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m8nLF-0006O5-Ha; Wed, 28 Jul 2021 17:27:37 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m8nLF-0007i3-8I; Wed, 28 Jul 2021 17:27:37 +0000
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
	bh=sDbvP2mLM3ulZ1sM90PgwW4tFd0zKztZrvHZYlqKx0Q=; b=4jhFBFcAThr36mL8ipNFc19hsD
	kWB/eXL99jUgK7qFvH5xBUn+XuSvsqntuKD4h3p4pofHceCYd34R6g/8kHB6IwYXX6iLfFgly7djk
	oRGyQw7Zn3n1Clh+7ADBXTFzYQjJZCALEhkBSWhfwlECds7w8pr+axbKCLsC98SnmRYQ=;
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
Date: Wed, 28 Jul 2021 18:27:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 28/07/2021 18:19, Andrew Cooper wrote:
> On 28/07/2021 17:18, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Add XENMEM_get_unallocated_space hypercall which purpose is to
>> query hypervisor to find regions of guest physical address space
>> which are unused and can be used to create grant/foreign mappings
>> instead of wasting real pages from the domain memory for
>> establishing these mappings. The problem with the current Linux
>> on Xen on Arm behaviour is if we want to map some guest memory
>> regions in advance or to perform cache mappings in the backend
>> we might run out of memory in the host (see XSA-300).
>> This of course, depends on the both host and guest memory sizes.
>>
>> The "unallocated space" can't be figured out precisely by
>> the domain on Arm without hypervisor involvement:
>> - not all device I/O regions are known by the time domain starts
>>    creating grant/foreign mappings
>> - the Dom0 is not aware of memory regions used for the identity
>>    mappings needed for the PV drivers to work
>> In both cases we might end up re-using these regions by
>> a mistake. So, the hypervisor which maintains the P2M for the domain
>> is in the best position to provide "unallocated space".
> 
> I'm afraid this does not improve the situation.
> 
> If a guest follows the advice from XENMEM_get_unallocated_space, and
> subsequently a new IO or identity region appears, everything will
> explode, because the "safe area" wasn't actually safe.
> 
> The safe range *must* be chosen by the toolstack, because nothing else
> can do it safely or correctly.

The problem is how do you size it? In particular, a backend may map 
multiple time the same page (for instance if the page is granted twice).

> 
> Once a safe range (or ranges) has been chosen, any subsequent action
> which overlaps with the ranges must be rejected, as it will violate the
> guarantees provided.
> 
> Furthermore, the ranges should be made available to the guest via normal
> memory map means.  On x86, this is via the E820 table, and on ARM I
> presume the DTB.  There is no need for a new hypercall.

Device-Tree only works if you have a guest using it. How about ACPI?

To me the hypercall solution at least:
   1) Avoid to have to define the region on every single firmware table
   2) Allow to easily extend after the guest run

Cheers,

-- 
Julien Grall

