Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E7A7AF2E5
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 20:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608477.946961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlCma-0002R6-Qs; Tue, 26 Sep 2023 18:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608477.946961; Tue, 26 Sep 2023 18:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlCma-0002PC-Nn; Tue, 26 Sep 2023 18:27:40 +0000
Received: by outflank-mailman (input) for mailman id 608477;
 Tue, 26 Sep 2023 18:27:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IkXO=FK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qlCmZ-0002P6-5z
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 18:27:39 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e46a7d4-5c9a-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 20:27:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id AA28D8285939;
 Tue, 26 Sep 2023 13:27:36 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id lfzENBVBczYH; Tue, 26 Sep 2023 13:27:36 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E88358286870;
 Tue, 26 Sep 2023 13:27:35 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id D0QUL_gaQ5Tr; Tue, 26 Sep 2023 13:27:35 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 54A338285A06;
 Tue, 26 Sep 2023 13:27:35 -0500 (CDT)
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
X-Inumbo-ID: 5e46a7d4-5c9a-11ee-878a-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com E88358286870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695752856; bh=o7aLie3p3On1sImTZQZMz05FqTAaKHHv02HjObuAiRM=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=tdkbQBYvhuHOfx0PJd8E8MKP9/sDGvAZUnF0rzB5RwRPFg8wxIbEKC7sKUS08sELP
	 LGu/tT9Vf7+11AExbpSuldzeoF3P7bMmD6Ad8WwPFhJvftF+RBYSGHoozRL2AMs7Mp
	 Bifl55OcQCPszUM1DJvu/LJO5QOaJcZxav44ihj4=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <11bf1197-6e02-a459-9fb2-d7a3fa284d4c@raptorengineering.com>
Date: Tue, 26 Sep 2023 13:27:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/3] xen/common: Add NUMA node id bounds check to
 page_alloc.c/node_to_scrub
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1695681330.git.sanastasio@raptorengineering.com>
 <a47962a573eab38991a8aa3e09ca6b8bd3193b6c.1695681330.git.sanastasio@raptorengineering.com>
 <1e74d0b4-c2bf-46c2-b3df-515f6934cda1@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <1e74d0b4-c2bf-46c2-b3df-515f6934cda1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/26/23 2:32 AM, Jan Beulich wrote:
> On 26.09.2023 00:42, Shawn Anastasio wrote:
>> When building for Power with CONFIG_DEBUG unset, a compiler error gets
>> raised inside page_alloc.c's node_to_scrub function, likely due to the
>> increased optimization level:
>>
>> common/page_alloc.c: In function 'node_to_scrub.part.0':
>> common/page_alloc.c:1217:29: error: array subscript 1 is above array
>>             bounds of 'long unsigned int[1]' [-Werror=array-bounds]
>>  1217 |         if ( node_need_scrub[node] )
> 
> That's gcc13?
> 

Gcc 10.2.1, actually.

>> It appears that this is a false positive, given that in practice
>> cycle_node should never return a node ID >= MAX_NUMNODES as long as the
>> architecture's node_online_map is properly defined and initialized, so
>> this additional bounds check is only to satisfy GCC.
> 
> Looks very similar to the situation that c890499871cc ("timer: fix
> NR_CPUS=1 build with gcc13") was dealing with, just that here it's
> MAX_NUMNODES. I'd therefore prefer a solution similar to the one
> taken there, i.e. make code conditional rather than add yet more
> code.
> 

Looking at that commit, it doesn't look like conditionalizing this code
in the same way would be as clean -- it'd likely require separate
conditional blocks around the initial variable declarations and the
function body.

> Otherwise, ...
> 
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -1211,6 +1211,9 @@ static unsigned int node_to_scrub(bool get_node)
>>          } while ( !cpumask_empty(&node_to_cpumask(node)) &&
>>                    (node != local_node) );
>>
>> +        if ( node >= MAX_NUMNODES )
>> +            break;
> 
> ... this clearly redundant check would need to gain a comment.
>

This isn't a problem. I'll submit a v2 with a commit.

> What I'm puzzled by is that on Arm we had no reports of a similar
> problem, despite NUMA also not getting selected there (yet).
>

As you pointed out in your follow-up email, it might be due to
CONFIG_DEBUG. It might also be because on ppc, our implementation of
find_next_bit (which is used by cycle_node) is declared static inline,
so the compiler has access to its definition when doing this sort of
static analysis. On Arm I believe the function lives in its own
compilation unit which might preclude GCC from making any assumptions
about its return value.

> Jan

Thanks,
Shawn

