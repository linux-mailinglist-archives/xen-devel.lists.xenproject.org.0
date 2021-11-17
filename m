Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B18B4544F4
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 11:26:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226717.391880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnI8t-0002V7-QV; Wed, 17 Nov 2021 10:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226717.391880; Wed, 17 Nov 2021 10:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnI8t-0002Sw-Mc; Wed, 17 Nov 2021 10:26:15 +0000
Received: by outflank-mailman (input) for mailman id 226717;
 Wed, 17 Nov 2021 10:26:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mnI8s-0002Sq-7F
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 10:26:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnI8r-0005LU-5s; Wed, 17 Nov 2021 10:26:13 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.21.213]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnI8q-00075C-Vc; Wed, 17 Nov 2021 10:26:13 +0000
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
	bh=/DgogtAJFgjgI5KYerRuNrL4UfdBHJ9arKaEz4qvZ80=; b=iK3IXPENOAKikBSDPleTG9eNp5
	amJS91ej33l202DSXJC+Q2Fkrm4iAIayFfdmIh4OT/s0ycLTdXC4do/q/7q6m/UBFqTzjCjBXzmYQ
	KR+s9ckyRQelzIXBudVJ3/0GMi34E1iOnQjmfatj8g9tze6bb5mwdGl4CnzwNIjwwqCc=;
Message-ID: <26c01edc-46a9-47eb-0c9d-986b92e02158@xen.org>
Date: Wed, 17 Nov 2021 10:26:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [RFC PATCH 0/2] Boot time cpupools
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20211117095711.26596-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211117095711.26596-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 17/11/2021 09:57, Luca Fancellu wrote:
> Currently Xen creates a default cpupool0 that contains all the cpu brought up
> during boot and it assumes that the platform has only one kind of CPU.
> This assumption does not hold on big.LITTLE platform, but putting different
> type of CPU in the same cpupool can result in instability and security issues
> for the domains running on the pool.

I agree that you can't move a LITTLE vCPU to a big pCPU. However...

> 
> For this reason this serie introduces an architecture specific way to create
> different cpupool at boot time, this is particularly useful on ARM big.LITTLE
> platform where there might be the need to have different cpupools for each type
> of core, but also systems using NUMA can have different cpu pool for each node.

... from my understanding, all the vCPUs of a domain have to be in the 
same cpupool. So with this approach it is not possible:
    1) to have a mix of LITTLE and big vCPUs in the domain
    2) to create a domain spanning across two NUMA nodes

So I think we need to make sure that any solutions we go through will 
not prevent us to implement those setups.

I can see two options here:
   1) Allowing a domain vCPUs to be on a different cpupool
   2) Introducing CPU class (see [1])

I can't remember why Dario suggested 2) rather than 1) in the past. 
@Dario, do you remember it?

Cheers,

[1] https://lore.kernel.org/xen-devel/1481135379.3445.142.camel@citrix.com/

> 
> To test this serie, the hmp_unsafe Xen boot argument is passed to allow Xen
> starting different CPUs from the boot core.
> 
> Luca Fancellu (2):
>    xen/cpupool: Create different cpupools at boot time
>    tools/cpupools: Give a name to unnamed cpupools
> 
>   tools/libs/light/libxl_utils.c | 13 ++++--
>   xen/arch/arm/Kconfig           | 15 ++++++
>   xen/arch/arm/Makefile          |  1 +
>   xen/arch/arm/cpupool.c         | 84 ++++++++++++++++++++++++++++++++++
>   xen/common/sched/cpupool.c     |  5 +-
>   xen/include/xen/cpupool.h      | 30 ++++++++++++
>   6 files changed, 142 insertions(+), 6 deletions(-)
>   create mode 100644 xen/arch/arm/cpupool.c
>   create mode 100644 xen/include/xen/cpupool.h
> 

-- 
Julien Grall

