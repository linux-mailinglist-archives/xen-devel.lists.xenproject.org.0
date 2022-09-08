Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 352B05B1E51
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 15:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403358.645440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWHMZ-00056V-JP; Thu, 08 Sep 2022 13:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403358.645440; Thu, 08 Sep 2022 13:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWHMZ-00054i-GY; Thu, 08 Sep 2022 13:14:35 +0000
Received: by outflank-mailman (input) for mailman id 403358;
 Thu, 08 Sep 2022 13:14:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWHMY-00054c-0r
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 13:14:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWHMT-00086k-SG; Thu, 08 Sep 2022 13:14:29 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.18.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWHMT-0002C8-JR; Thu, 08 Sep 2022 13:14:29 +0000
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
	bh=yF6/yeeIE81nNRAhGJCD0a0Uor+iQU65ICW6+rpB1VA=; b=VFIeL9YGaFbOmvVxGnGgx0ksdG
	uqbfuOsyIFzU5ZSmL8sNOtpMnOysFpUfuEdn3eLxEisFgPxTcJPJ+wLFcX57JccEmuR9KhGZlWYkr
	GyPv/me5CyHkRsoSWHFm9kabAfozdiMeDUqaleZlqQqWtTeIr3DGw8ZHIkhB0VBiNRNI=;
Message-ID: <44571dff-bb8a-b0f5-8913-c35b9aa4544a@xen.org>
Date: Thu, 8 Sep 2022 14:14:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v5 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1662637415.git.rahul.singh@arm.com>
 <63a0010c1e0f6ffb86fce35e188d66bf4c0d57e7.1662637415.git.rahul.singh@arm.com>
 <5db80611-c968-34c7-7181-41071636efca@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5db80611-c968-34c7-7181-41071636efca@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 08/09/2022 13:03, Jan Beulich wrote:
> On 08.09.2022 13:49, Rahul Singh wrote:
>> is_memory_hole was implemented for x86 and not for ARM when introduced.
>> Replace is_memory_hole call to pci_check_bar as function should check
>> if device BAR is in defined memory range. Also, add an implementation
>> for ARM which is required for PCI passthrough.
>>
>> On x86, pci_check_bar will call is_memory_hole which will check if BAR
>> is not overlapping with any memory region defined in the memory map.
>>
>> On ARM, pci_check_bar will go through the host bridge ranges and check
>> if the BAR is in the range of defined ranges.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com> # x86, common
> 
> FTAOD: I object to this tagging, and I did not provide the ack with
> such tags. Quoting docs/process/sending-patches.pandoc: "The
> `Acked-by:` tag can only be given by a **maintainer** of the modified
> code, and it only covers the code the maintainer is responsible for."

You are part of the REST. So technically, one could assume that your 
acked-by would also cover the Arm. I agree this would be uncommon but 
this has been used before when the more specialized maintainer was 
unresponsive.

At least with # x86, common it is clear what you are happy with.

> The doc provides for tagging here, yes, but such should only be used
> for the unusual case of an ack restricted to less than what a
> person's maintainership covers. Otherwise we'd end up seeing overly
> many tagged acks. 

I appreciate you may not like them but it helps while committing because 
you can cross-check easily whether all the files have been covered with 
the tags.

Cheers,

-- 
Julien Grall

