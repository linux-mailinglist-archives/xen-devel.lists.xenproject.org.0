Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B7C37F442
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 10:38:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126775.238218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh6qk-0002GQ-Ts; Thu, 13 May 2021 08:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126775.238218; Thu, 13 May 2021 08:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh6qk-0002Dn-Qo; Thu, 13 May 2021 08:37:42 +0000
Received: by outflank-mailman (input) for mailman id 126775;
 Thu, 13 May 2021 08:37:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lh6qj-0002Dh-Ai
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 08:37:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lh6qj-0005ru-3w; Thu, 13 May 2021 08:37:41 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lh6qi-0007yw-UX; Thu, 13 May 2021 08:37:41 +0000
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
	bh=O2gvYYb/3C0IdyLNznjXgp8Pvq10Z0J69WVg2v08H54=; b=YVqQbb7vjtLG6wUHlg0Mb/0wWV
	tz6MDPV6daVqeRDoU1O2LQ0ol5+IOqt6nAunSd090lGfRvgXy8iiEfz+Gu3yR9GXfuX7cKOT82l/8
	bSM+aXV3FShfU/ckEwQNTf/c8uq48K6xTYlnBSjeov46dBO0y8MmAma40XPVYzyaX4tE=;
Subject: Re: Hand over of the Xen shared info page
To: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrii Chepurnyi <Andrii_Chepurnyi@epam.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
References: <64bc6ab6ec387acebb40c1b4786dfda1050f9d50.camel@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8ff05bdf-a6c4-6b14-b39c-7d9b3bb9d279@xen.org>
Date: Thu, 13 May 2021 09:37:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <64bc6ab6ec387acebb40c1b4786dfda1050f9d50.camel@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 13/05/2021 09:03, Anastasiia Lukianenko wrote:
> Hi all,

Hi,

> The problem described below concerns cases when a shared info page
> needs to be handed over from one entity in the system to another, for
> example, there is a bootloader or any other code that may run before
> the guest OS' kernel.
> Normally, to map the shared info page guests allocate a memory page
> from their RAM and map the shared info on top of it. Specifically we
> use XENMAPSPACE_shared_info memory space in  XENMEM_add_to_physmap
> hypercall.  As the info page exists throughout the guest existence this
> doesn't hurt the guest, but when the page gets out of accounting, e.g.
> after bootloader jumps to Linux and the page is not handed over to it,
> the mapped page becomes a problem.
> Consider the case with U-boot bootloader which already has Xen support.
> The U-boot’s Xen guest implementation allocates a shared info page
> between Xen and the guest domain and U-boot uses domain's RAM address
> space to create and map the shared info page by using
> XENMEM_add_to_physmap hypercall [1].
> 
> After U-boot transfers control to the operating system (Linux, Android,
> etc), the shared info page is still mapped in domain’s address space,
> e.g. its RAM. So, after we leave U-boot, this page becomes just an
> ordinary memory page from Linux POV while it is still a shared info
> page from Xen POV. This can lead to undefined behavior, errors etc as
> Xen can write something to the shared info page and when Linux tries to
> use it - data corruption may happen.
> This happens because there is no unmap function in Xen API to remove an
> existing shared info page mapping. We could use only hypercall
> XENMEM_remove_from_physmap which eventually will create a hole in the
> domain's RAM address space which may also lead to guest’s crash while
> accessing that memory.

The hypercall XENMEM_remove_from_physmap is the correct hypercall here 
and work as intented. It is not Xen business to keep track what was the 
original page (it may have been RAM, device...).

The problem here is the hypercall XENMEM_add_to_physmap is misused in 
U-boot. When you give an address for the mapping you are telling Xen 
"Here a free region to map the share paged". IOW, Xen will throw away 
whatever was before because that was you asked.

If you want to map in place of the RAM page, then the correct approach 
is to:
   1) Request Xen to remove the RAM page from the P2M
   2) Map the shared page
   /* Use it */
   3) Unmap the shared page
   4) Allocate the memory

You can avoid 1) and 4) by finding free region in the address space.

> 
> We noticed this problem and the workaround was implemented using the
> special GUEST_MAGIC memory region [2].
> 
> Now we want to make a proper solution based on GUEST_MAGIC_BASE, which
> does not belong to the guest’s RAM address space [3]. Using the example
> of how offsets for the console and xenstore are implemented, we can add
> a new shared_info offset and increase the number of magic pages [4] and
> implement related functionality, so there is a similar API to query
> that magic page location as it is done for console PFN and others.

They are not the same type. The console PFN points memory already 
populated in the guest address space.

For the domain shared page, this is memory belonging to Xen that you 
will map in your address space. A domain can map it anywhere it wants.

> This approach would allow the use of the XENMEM_remove_from_physmap
> hypercall without creating gaps in the RAM address space for Xen guest
> OS [5].

See above to prevent the gap. I appreciate this means a superpage may 
get shattered.

The alternative is for U-boot to go through the DT and infer which 
regions are free (IOW any region not described).

Cheers,

-- 
Julien Grall

