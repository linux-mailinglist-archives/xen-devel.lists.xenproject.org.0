Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5B3608DEF
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 17:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428349.678414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGBd-0003nA-A6; Sat, 22 Oct 2022 15:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428349.678414; Sat, 22 Oct 2022 15:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGBd-0003kd-74; Sat, 22 Oct 2022 15:13:21 +0000
Received: by outflank-mailman (input) for mailman id 428349;
 Sat, 22 Oct 2022 15:13:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omGBb-0003kX-Oa
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 15:13:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omGBb-0005Rg-2a; Sat, 22 Oct 2022 15:13:19 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.29.245]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omGBa-0002Xn-RD; Sat, 22 Oct 2022 15:13:18 +0000
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
	bh=PV8B+E1FVx9nndajCYva9nue8rk5+yNytWjbDo84q0c=; b=DVpMcAwF1aoRIWyl8u0cLaSwSt
	ctBnPxETgiPgLcQZWlJoRG/r/Sexc3S6Jhqyyzkvugs6gX0Ffr9bcpY5wItDW7m4SMk2ekcYnyQBL
	CRdkK1/am+WZWIoH+cIqsNk/038uAliQF/a4P0rqWFAkY85hJ9pU2TIAJfuho91o763g=;
Message-ID: <e1b35ac1-d413-6a08-d5c0-9b2ce43aea17@xen.org>
Date: Sat, 22 Oct 2022 16:13:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH 00/12] Arm cache coloring
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

On 26/08/2022 13:50, Carlo Nonato wrote:
> - The way xl passes user space memory to Xen it's adapted from various
>    points of the xl code itself (e.g. xc_domain_node_setaffinity) and it
>    works, but it really needs attention from expert maintainers since
>    I'm not completely sure this is the correct way of doing things.
> - We still need to bring back the relocation feature (part of) in order
>    to move Xen memory to a colored space where the hypervisor could be
>    isolated from VMs interference (see the revert commit #10 and the
>    get_xen_paddr function in #12).
> - Revert commits #8 and #9 are needed because coloring has the command
>    line parsing as a prerequisite for its initialization and
>    setup_pagetables must be called after it in order to color the Xen
>    mapping. The DTB mapping is then added to the boot page tables instead
>    of the Xen ones. Probably the way this is done is a bit simplistic.
>    Looking forward for comments on the subject.
> - A temporary mapping of the old Xen code (old here means non-colored)
>    is used to reach variables in the old physical space so that secondary
>    CPUs can boot. There were some comments in the previous version on that
>    because the mapping is available for all the CPUs while only CPU0 is
>    the one supposed to access it. I'm not sure how to temporarily mapping
>    things only for the master CPU.

On Arm64, Xen will only use one set of page-tables for all the CPUs. So 
it will not be possible to have a temporary mapping for a single CPU. 
But what you can do is mapping the region and unmapping it when you are 
done.

That said, I would rather prefer if we can get rid of the old copy of 
Xen. This would means secondary CPUs will directly jump to the new Xen.

> - A lot of #ifdef for cache coloring are introduced because I prefer to
>    define functions only if they are actually needed. Let me know if you
>    prefer a different approach.

The preferred approach in Xen is to provide stub helpers in the #else part.

> - Julien posted an RFC to address a problem with the switch_ttbr function.
>    For the moment I haven't considered it since it's still a work in progress.

I have posted a new version for this:

https://lore.kernel.org/xen-devel/20221022150422.17707-1-julien@xen.org/

There are a couple of open questions about the interaction with cache 
coloring. Please have a look there.

Cheers,

-- 
Julien Grall

