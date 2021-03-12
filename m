Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F648338F56
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 15:03:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97140.184365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKiNz-0006na-Rj; Fri, 12 Mar 2021 14:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97140.184365; Fri, 12 Mar 2021 14:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKiNz-0006nB-OD; Fri, 12 Mar 2021 14:03:27 +0000
Received: by outflank-mailman (input) for mailman id 97140;
 Fri, 12 Mar 2021 14:03:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKiNx-0006n6-P4
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 14:03:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKiNx-0000uT-Nt
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 14:03:25 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKiNx-0000Dc-N1
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 14:03:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lKiNu-00043K-Fi; Fri, 12 Mar 2021 14:03:22 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=2zhvpBnhL1HJMl89jtyuK2Jr2cs+XEO0bTq/GRFPND8=; b=d6rwFYWeTX9GAsTSnceLWJ/IYN
	QVmk7BGoBXyws2VJaklZ0dO4Pi9o6Nv1EBVakqNWxjIbMx6OMSSk2H2zyvtvJsjSsyNbtGtzGlte/
	6s0HtPxnL+7jZX1aRmDSilC+icHMMupjrPPR8vZV4HOmwxgKYoyh29sR/5jIiAXcUn1E=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24651.29866.263648.422601@mariner.uk.xensource.com>
Date: Fri, 12 Mar 2021 14:03:22 +0000
To: Dario Faggioli <dfaggioli@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen: fix for_each_cpu when NR_CPUS=1
In-Reply-To: <161545564302.24868.14477928469038686899.stgit@Wayrath>
References: <161545564302.24868.14477928469038686899.stgit@Wayrath>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Dario Faggioli writes ("[PATCH] xen: fix for_each_cpu when NR_CPUS=1"):
> When running an hypervisor build with NR_CPUS=1 for_each_cpu does not
> take into account whether the bit of the CPU is set or not in the
> provided mask.
> 
> This means that whatever we have in the bodies of these loops is always
> done once, even if the mask was empty and it should never be done. This
> is clearly a bug and was in fact causing an assert to trigger in credit2
> code.
> 
> Removing the special casing of NR_CPUS == 1 makes things work again.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

> I'm not really sure whether this should be 4.15 material.
> 
> It's definitely a bug, IMO. The risk is also pretty low, considering
> that no one should really run Xen in this configuration (NR_CPUS=1, I
> mean). Which is also the reason why it's probably not really important
> that we fix it at this point of the release cycle.

Given that it clearly only affects NR_CPUS==1, I think the risk/reward
tradeoff is unambiguously positive.

> -#if NR_CPUS > 1
>  #define for_each_cpu(cpu, mask)			\
>  	for ((cpu) = cpumask_first(mask);	\

Just a thought: does cpumask_first work on an empty mask ?

Ian.

