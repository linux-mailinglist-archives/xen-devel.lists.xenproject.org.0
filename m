Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E32801676
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 23:36:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645785.1008129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9C75-0007L5-1A; Fri, 01 Dec 2023 22:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645785.1008129; Fri, 01 Dec 2023 22:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9C74-0007I5-Tx; Fri, 01 Dec 2023 22:35:58 +0000
Received: by outflank-mailman (input) for mailman id 645785;
 Fri, 01 Dec 2023 22:35:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r9C73-0007Hr-Sh
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 22:35:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r9C73-0002AH-EA; Fri, 01 Dec 2023 22:35:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r9C73-0002nL-5L; Fri, 01 Dec 2023 22:35:57 +0000
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
	bh=oXiayIAEPdSKjSozKprMBupV43WPfTMCHeOOFKKLhp4=; b=U2hc7NTVaB/A7/XzmZ1a14l0sx
	uP6N6dl/H+2A839NJO2TAw7laldOvfjIgzg5kTIs2JeIsxELsWO5h9wxXU8m7z1AZXCbnMsvUgWK5
	DalVNuZUXukU+xVNRE+ygtMYSaBZL8rsqiVGTMoMLkd/Mxj5lDncuFo19LkrJk3z/8eA=;
Message-ID: <1981531f-a919-4569-9b6b-8f962f9d7cfb@xen.org>
Date: Fri, 1 Dec 2023 22:35:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/ppc: Enable Boot Allocator
Content-Language: en-GB
To: tpearson@raptorengineering.com
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Oleksii <oleksii.kurochko@gmail.com>
References: <cover.1701384928.git.sanastasio@raptorengineering.com>
 <5ed3351f7824a5d0a1ff29c17cb55b2608f28109.1701384928.git.sanastasio@raptorengineering.com>
 <938b9bfe-fba0-4c77-b2e5-fb79fb316ab4@xen.org>
 <7e0ea8d9ca0a3a90550eb7b9e65fe86c.squirrel@vali.starlink.edu>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7e0ea8d9ca0a3a90550eb7b9e65fe86c.squirrel@vali.starlink.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 01/12/2023 22:10, tpearson@raptorengineering.com wrote:
>> (+ Arm and RISC-V folks)
>>
>> Hi Shawn,
>>
>> On 01/12/2023 20:59, Shawn Anastasio wrote:
>>> Adapt arm's earlyfdt parsing code to ppc64 and enable Xen's early boot
>>> allocator. Routines for parsing arm-specific devicetree nodes (e.g.
>>> multiboot) were excluded, reducing the overall footprint of code that
>>> was copied.
>>
>> I expect RISC-V to want similar code. I am not really thrilled in the
>> idea of having 3 similar copy of the parsing. So can we extract the
>> common bits (or harmonize it) so it can be shared?
>>
>> Maybe Oleksii has already a version doing that.
> 
> Just my $0.02, but wouldn't it make more sense to have the RISC-V port
> handle the deduplication, seeing as the POWER support came first here?  We
> don't know if/when the RISC-V port will be ready for submission, so I'm
> not sure why we should be on the hook for this particular work.

That would have been a valid point if you were writing a brand new 
implementation. But this was *copied* from Arm.

Looking at the diff between arm/bootfdt.c and ppc/bootfdt.c, you seem to 
have:
    - As well copied some code from arm/setup.c
    - Re-order some statement (not clear why)
    - Remove some code which you say are Arm specific. Yet some is part 
of the Device-Tree spec and I would expect to be used in the future.

So my question here stands. Why are you mainly copying verbatimly the 
Arm code rather than consolidating in one place?

Cheers,

-- 
Julien Grall

