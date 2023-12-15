Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6BB814FE1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 19:52:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655340.1023072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEDIG-00067Y-BH; Fri, 15 Dec 2023 18:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655340.1023072; Fri, 15 Dec 2023 18:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEDIG-00064O-8Y; Fri, 15 Dec 2023 18:52:16 +0000
Received: by outflank-mailman (input) for mailman id 655340;
 Fri, 15 Dec 2023 18:52:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rEDIE-00064I-L3
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 18:52:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rEDID-00051b-Vs; Fri, 15 Dec 2023 18:52:13 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.3.206]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rEDID-0002Z6-PM; Fri, 15 Dec 2023 18:52:13 +0000
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
	bh=os94DVtBRmD3Y+NDIOdjLVu25UbLznToBDj1ha1Gmfs=; b=fZ2TwGJqq91XJkyqtQcRD0AjdS
	laDJbgrbj7gb5H+5FkImdsfXGbqRYjgt7VeJneAYn+aGHyDMVvEdU+cWTZFDJ7hPs7SJhnKLRfhEH
	Bq0N9mUJNuyYI7/AV0Y77qxXq4aS1jL4mhVvburuitYY1FA9q+RBxLq24oS5UElOQSz8=;
Message-ID: <ad47ae1c-79b7-4698-bf3b-36a7c71540aa@xen.org>
Date: Fri, 15 Dec 2023 18:52:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/ppc: Enable Boot Allocator
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Oleksii <oleksii.kurochko@gmail.com>
References: <cover.1701384928.git.sanastasio@raptorengineering.com>
 <5ed3351f7824a5d0a1ff29c17cb55b2608f28109.1701384928.git.sanastasio@raptorengineering.com>
 <938b9bfe-fba0-4c77-b2e5-fb79fb316ab4@xen.org>
 <7e0ea8d9ca0a3a90550eb7b9e65fe86c.squirrel@vali.starlink.edu>
 <1981531f-a919-4569-9b6b-8f962f9d7cfb@xen.org>
 <536439989.51518893.1701471704571.JavaMail.zimbra@raptorengineeringinc.com>
 <4ce0f52f-8a63-4d10-8cea-5c3b905477ec@xen.org>
 <bd465581-601e-4d7d-a345-6d88740c9e64@raptorengineering.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bd465581-601e-4d7d-a345-6d88740c9e64@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Shawn,

On 15/12/2023 02:50, Shawn Anastasio wrote:
> Hi Julien,
> 
> Thank you for the feedback. Most of your points will be addressed by
> following your suggestion of moving ARM's bootfdt.c to common, but I
> wanted to respond with a few points of clarification.
> 
> On 12/1/23 5:23 PM, Julien Grall wrote:
>> * fdt_get_mem_rsv_paddr(), this is part of the DT is used to reserve
>> memory. This was superseed to /reserved-memory, but I wonder how
>> widespread this is on PPC?
> 
> As far as I can tell, the DT reserve memory map is not used on
> PPC/PowerNV. This information is instead communicated through
> `reserved-memory` nodes in the DT itself, which the existing code
> handles.

On Arm, there is a mix between using /memreserve (found by Xen via 
fdt_get_mem_rsv_paddr() and reserved-memory.

Looking at Linux, it seems that it will try to parse /memreserve in PPC 
and I have found a few DT using it:

42sh> ack memreserve
boot/dts/currituck.dts
13:/memreserve/ 0x01f00000 0x00100000;	// spin table

boot/dts/akebono.dts
14:/memreserve/ 0x01f00000 0x00100000;	// spin table

boot/dts/iss4xx-mpic.dts
17:/memreserve/ 0x01f00000 0x00100000;

boot/dts/mpc836x_mds.dts
10:/memreserve/	00000000 1000000;

boot/dts/wii.dts
17: * contiguous RAM range and will BUG() if the memreserve is outside
20:/*/memreserve/ 0x10000000 0x0004000;*/	/* DSP RAM */

I guess we are not targetting any of those hardwares. Even if this is 
the case, I don't think we can simply ignore the node. If you don't want 
to handle them, then I would at least suggest to add a check in Xen to 
confirm the /memreserve/ is empty.

Better to catch such DT early rather than debugging a memory corruption 
later on :).

Cheers,

-- 
Julien Grall

