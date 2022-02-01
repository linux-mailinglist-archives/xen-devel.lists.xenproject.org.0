Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A45F94A64BE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 20:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263764.456612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEyb5-0005Yl-Sd; Tue, 01 Feb 2022 19:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263764.456612; Tue, 01 Feb 2022 19:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEyb5-0005WP-PZ; Tue, 01 Feb 2022 19:13:47 +0000
Received: by outflank-mailman (input) for mailman id 263764;
 Tue, 01 Feb 2022 19:13:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nEyb3-0005WJ-OE
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 19:13:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nEyb3-0002N1-9H; Tue, 01 Feb 2022 19:13:45 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=[10.95.141.48])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nEyb3-00073v-3F; Tue, 01 Feb 2022 19:13:45 +0000
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
	bh=NjJkq9wLlhYxpB/gsVbbyWQ5Brt4xDzzbjoROOJzpgw=; b=i+QqQmW9b/skl1VJ6/aMaFIOrM
	tWbTo7QBFFoWBmJr1YZLaAXmxa0g3y1gCvMR9ldXuho9YvzFZ2ieZL+1bTXTypFzWrSNOhAqlxEza
	BB6Q1im5mXgSePJfALuvXfE7VMxD17Bp6FVmABd1/UJ5amcvEam1JKpAJA6Id/FWXFfE=;
Message-ID: <4551a66f-7de6-6230-d5f9-460d5d62ccdc@xen.org>
Date: Tue, 1 Feb 2022 19:13:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v5] xen/arm64: io: Decode ldr/str post-indexing instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org, stefanos@xilinx.com
Cc: sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20220131193728.2980-1-ayankuma@xilinx.com>
 <e07068aa-91b8-ebdf-db17-7173f417ad33@xen.org>
 <33bda050-9b9f-5840-282b-6f591988a09f@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <33bda050-9b9f-5840-282b-6f591988a09f@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 01/02/2022 19:06, Ayan Kumar Halder wrote:
>> As you pointed out previously, the field SAS (Syndrome Access Size) is 
>> invalid when the ISV=0. So the decoding needs to be done *before* we 
>> select the IOREQ server.
>>
>> But as I said, this would result to decode the instruciton when this 
>> is not necessary. This is where Stefano's suggestion in [1] is useful.
>>
>> For ISV=0, it will be a lot more common to trap because of a P2M 
>> translation fault (of the MMIO is not mapped). So we should call that 
>> first and then, if it still not resolved, try to decode the instruction.
>>
>> With that in place, you are avoiding the issue in try_fwd_ioserv().
>>
>> Can you please coordinate with Stefano?
> 
> Can you let me know which suggestion Julien is referring here ?
> 
> [1] does not point to a valid url.

This is a message-id. They are unique, so you can easily find the 
message on public archives (e.g. lore.kernel.org) or in your inbox.

I tend to use lore.kernel.org for the archives. The URL looks like:

https://lore.kernel.org/<ml>/<message-id>

In your case, <ml> would be xen-devel (they also archives may other MLs) 
and the <message-id> would be the one I put in [1].

The message-id can be really useful if you use it in combination of 
tools like b4 [1]. With a single ID, it allows you to pull a series, 
fetch tags and then you can apply with 'git am'.

Cheers,

[1] 
https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestation

-- 
Julien Grall

