Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1FC542CFE
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 12:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343773.569277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nysks-0007BP-O7; Wed, 08 Jun 2022 10:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343773.569277; Wed, 08 Jun 2022 10:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nysks-00078e-LN; Wed, 08 Jun 2022 10:17:38 +0000
Received: by outflank-mailman (input) for mailman id 343773;
 Wed, 08 Jun 2022 10:17:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nyskr-00078Y-5Z
 for xen-devel@lists.xenproject.org; Wed, 08 Jun 2022 10:17:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nyskp-0002I3-Vz; Wed, 08 Jun 2022 10:17:35 +0000
Received: from [54.239.6.189] (helo=[192.168.10.106])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nyskp-0001J5-J4; Wed, 08 Jun 2022 10:17:35 +0000
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
	bh=IoMv2n41yEwpZh6S8L3Tl/wbkXKn28BjTOqLofJm3/s=; b=rDZc7qeZZLknBhTCLY7apulSTi
	h+8AZ+9sOuKeWcV063q8Mt8vdo9kXivt0tqmf+9JxWbf40MU7gN0W0mfY2GkXh+43HxQg7qKH/fHO
	q/4KQQ8AVJUrV7WlRAwcBO/m82VRYmVdgPhf4V65pQ3Eyif120yjiIopUmgSHNFEMlmk=;
Message-ID: <ab4d4425-400b-2745-589f-d643d67a4f59@xen.org>
Date: Wed, 8 Jun 2022 11:17:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] xen/arm: Allow setting the number of CPUs to activate at
 runtime
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220523091324.137350-1-michal.orzel@arm.com>
 <A1DC403E-3BAF-4BED-AFF1-68313005669F@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <A1DC403E-3BAF-4BED-AFF1-68313005669F@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/05/2022 10:09, Bertrand Marquis wrote:
>> On 23 May 2022, at 10:13, Michal Orzel <Michal.Orzel@arm.com> wrote:
>>
>> Introduce a command line parameter "maxcpus" on Arm to allow adjusting
>> the number of CPUs to activate. Currently the limit is defined by the
>> config option CONFIG_NR_CPUS. Such parameter already exists on x86.
>>
>> Define a parameter "maxcpus" and a corresponding static variable
>> max_cpus in Arm smpboot.c. Modify function smp_get_max_cpus to take
>> max_cpus as a limit and to return proper unsigned int instead of int.
>>
>> Take the opportunity to remove redundant variable cpus from start_xen
>> function and to directly assign the return value from smp_get_max_cpus
>> to nr_cpu_ids (global variable in Xen used to store the number of CPUs
>> actually activated).
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> 
> With the warning added in the documentation (which is ok to do on commit):
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I have committed it with the update in the documentation.

Cheers,

-- 
Julien Grall

