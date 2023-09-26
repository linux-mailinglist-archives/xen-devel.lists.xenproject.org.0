Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1A07AF654
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 00:33:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608547.947099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlGcN-0005Jj-09; Tue, 26 Sep 2023 22:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608547.947099; Tue, 26 Sep 2023 22:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlGcM-0005HF-TH; Tue, 26 Sep 2023 22:33:22 +0000
Received: by outflank-mailman (input) for mailman id 608547;
 Tue, 26 Sep 2023 22:33:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IkXO=FK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qlGcL-0005H9-V9
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 22:33:21 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1ad8089-5cbc-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 00:33:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A5C528285145;
 Tue, 26 Sep 2023 17:33:09 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id uUYJcjJa3QNr; Tue, 26 Sep 2023 17:33:08 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7B47C8285308;
 Tue, 26 Sep 2023 17:33:08 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CsQ4MKAfo0Gl; Tue, 26 Sep 2023 17:33:08 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id BDCEF8285145;
 Tue, 26 Sep 2023 17:33:07 -0500 (CDT)
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
X-Inumbo-ID: b1ad8089-5cbc-11ee-878a-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 7B47C8285308
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695767588; bh=1bRbx6RuJjF2RRCLrJcRg5o9MR5leYhK4i7MWNeLW7c=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=OCXDuj9dfFEs9g0ul0P4eJfckwvK4HqQDO7CH1uDPCmKgbr7iTbjI+qtVURU8smh8
	 EItxTuEB6Q+Faly+W4MmEKQ76EuGxLYMkxkTF580Eeh5p7Acd3R9W0vnuHXkxHgRev
	 b7mdd7oWIe7oswvp0SR2EAEwQ9u8QhqWg1BGRQ1o=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <cfb8ff76-7466-b8fc-73ab-7fb65358cde5@raptorengineering.com>
Date: Tue, 26 Sep 2023 17:33:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/2] xen/common: Add NUMA node id bounds check to
 page_alloc.c/node_to_scrub
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <cover.1695754185.git.sanastasio@raptorengineering.com>
 <cbecf35392441b03dc3ccd2a119b6fbdbf13b855.1695754185.git.sanastasio@raptorengineering.com>
 <2afa2ce7-ce22-ed47-07fe-0165e58302c6@citrix.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <2afa2ce7-ce22-ed47-07fe-0165e58302c6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/26/23 3:54 PM, Andrew Cooper wrote:
> On 26/09/2023 7:54 pm, Shawn Anastasio wrote:
>> When building for Power with CONFIG_DEBUG unset, a compiler error gets
>> raised inside page_alloc.c's node_to_scrub function:
>>
>> common/page_alloc.c: In function 'node_to_scrub.part.0':
>> common/page_alloc.c:1217:29: error: array subscript 1 is above array
>>             bounds of 'long unsigned int[1]' [-Werror=array-bounds]
>>  1217 |         if ( node_need_scrub[node] )
>>
>> It appears that this is a false positive, given that in practice
>> cycle_node should never return a node ID >= MAX_NUMNODES as long as the
>> architecture's node_online_map is properly defined and initialized, so
>> this additional bounds check is only to satisfy GCC.
> 
> If GCC thinks it's got an index of 1 here, then it thinks it's proved
> that a 1 gets passed.  But the fact that cycle_node() really can return
> 1 if one variable gets tweaked in memory means that logic derived on
> this property is broken.
> 
> But we've got even more basic problems to fix first.
> 
> xen$ git grep -B1 '__read_mostly node_online_map'
> arch/arm/smpboot.c-45-/* Fake one node for now. See also asm/numa.h */
> arch/arm/smpboot.c:46:nodemask_t __read_mostly node_online_map = { { [0]
> = 1UL } };
> arch/ppc/stubs.c-25-
> arch/ppc/stubs.c:26:nodemask_t __read_mostly node_online_map = { { [0] =
> 1UL } };
> common/numa.c-44-
> common/numa.c:45:nodemask_t __read_mostly node_online_map = { { [0] =
> 1UL } };
> 
> There are 3 identical definitions of node_online_map, one for the
> architecture which really supports NUMA, and two for the stubs which don't.
> 
> And the bug here is that code outside of CONFIG_NUMA assumes NUMA is
> valid, including several places in page_alloc.c,
> domain_set_node_affinity(), credit1 and sysctl.  XEN_SYSCTL_numainfo
> even has a bigger sin of using a static MAX_NUMNODES array when it
> doesn't need an array in the first place.
> 

Agreed. It seems like the current state of affairs resulted from hacks
in Arm to work around NUMA assumptions in common instead of properly
making common support !CONFIG_NUMA. And now ppc is inheriting some of
that baggage.

> It's rude for xen/nodemask.h to short circuit some of the operations on
> node_online_map based on MAX_NUMNODES but not others.
> 
> If nothing else, the fallback for "not really NUMA" needs providing by
> the common code and not by the arch stubs.  When that is sorted, we
> might have more consistent behaviour to investigate.
>

I'll leave these more sweeping changes up to someone with a bit more
familiarity with this code for now. In the meantime, this patch at
should introduce no functional change to the status quo and allows ppc
to build in the interim.

> ~Andrew

Thanks,
Shawn

