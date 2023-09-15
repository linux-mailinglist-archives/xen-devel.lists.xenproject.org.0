Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8577F7A2931
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 23:16:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603424.940415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhGAW-0005m4-36; Fri, 15 Sep 2023 21:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603424.940415; Fri, 15 Sep 2023 21:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhGAW-0005iv-0B; Fri, 15 Sep 2023 21:16:04 +0000
Received: by outflank-mailman (input) for mailman id 603424;
 Fri, 15 Sep 2023 21:16:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qhGAU-0005io-6B
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 21:16:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qhGAS-0008G4-Vw; Fri, 15 Sep 2023 21:16:00 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qhGAS-00019x-PA; Fri, 15 Sep 2023 21:16:00 +0000
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
	bh=QFfaz8pAnCI+7CW1ilThzm/w4MQ86iMpfdgGhZgvfgY=; b=xzKR672s42jqiT/ym7mwfGnq6O
	vG365iuv376jljOcXDr76amKNUEQFL7XbQlqH56XB9Z1DHSrwyzndcptyDLunOw0oeeua6Z+Qqi8f
	rvNR2bAFIMe2YcCCGG7XLoRD9PmC7S2yJ25O+peYfTaCxUd9U5pWiyYmBdNpUchagx3c=;
Message-ID: <41ff8d44-43fc-ac22-73d0-5608b6f0b80d@xen.org>
Date: Fri, 15 Sep 2023 22:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2] xen/arm: Skip Xen specific nodes/properties from hwdom
 /chosen node
To: Henry Wang <Henry.Wang@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230912105341.16687-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2309121045570.2080229@ubuntu-linux-20-04-desktop>
 <F80F50C1-4880-4776-8AE1-9552397624F2@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <F80F50C1-4880-4776-8AE1-9552397624F2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 13/09/2023 01:49, Henry Wang wrote:
> Hi Stefano,
> 
>> On Sep 13, 2023, at 01:46, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Tue, 12 Sep 2023, Michal Orzel wrote:
>>> Skip the following Xen specific host device tree nodes/properties
>>> from being included into hardware domain /chosen node:
>>> - xen,static-heap: this property informs Xen about memory regions
>>>    reserved exclusively as static heap,
>>> - xen,domain-shared-memory-v1: node with this compatible informs Xen
>>>    about static shared memory region for a domain. Xen exposes a different
>>>    node (under /reserved-memory with compatible "xen,shared-memory-v1") to
>>>    let domain know about the shared region,
>>> - xen,evtchn-v1: node with this compatible informs Xen about static
>>>    event channel configuration for a domain. Xen does not expose
>>>    information about static event channels to domUs and dom0 case was
>>>    overlooked (by default nodes from host dt are copied to dom0 fdt unless
>>>    explicitly marked to be skipped), since the author's idea was not to
>>>    expose it (refer docs/misc/arm/device-tree/booting.txt, "Static Event
>>>    Channel"). Even if we wanted to expose the static event channel
>>>    information, the current node is in the wrong format (i.e. contains
>>>    phandle to domU node not visible by dom0). Lastly, this feature is
>>>    marked as tech-preview and there is no Linux dt binding in place.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> Do we need Henry's explicit approval on bug fixes at this point?
> 
> I think it is a bit too early, we can wait for the code freeze for the release-ack.
> Before code freeze, maintainers/committers can push the patch as usual.
> 
> Anyway, I agree this patch is definitely qualified to be included in 4.18 so feel
> free to add below tag if you want.
> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Thanks. It is now committed.

Cheers,

-- 
Julien Grall

