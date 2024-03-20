Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4560D88172C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 19:08:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696090.1086720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn0M2-0006dM-7C; Wed, 20 Mar 2024 18:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696090.1086720; Wed, 20 Mar 2024 18:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn0M2-0006aB-4W; Wed, 20 Mar 2024 18:07:58 +0000
Received: by outflank-mailman (input) for mailman id 696090;
 Wed, 20 Mar 2024 18:07:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Jnl=K2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rn0M0-0006a5-D9
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 18:07:56 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c59d1abd-e6e4-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 19:07:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4D88D82856C4;
 Wed, 20 Mar 2024 13:07:53 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 2APMJkIbHipL; Wed, 20 Mar 2024 13:07:52 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 95BBC82856C6;
 Wed, 20 Mar 2024 13:07:52 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id HyK9Or9_4KlZ; Wed, 20 Mar 2024 13:07:52 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id E7DDD82856C4;
 Wed, 20 Mar 2024 13:07:51 -0500 (CDT)
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
X-Inumbo-ID: c59d1abd-e6e4-11ee-a1ee-f123f15fe8a2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 95BBC82856C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1710958072; bh=8hb9YAP2Xv2V9yaKIZYyZZmiTCjjcLm/CL7DwGzDizk=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=YQKZyj1B7IHG9+F+GILLX0pmPRS4Oit33XcxF5AX4V5Tb4yYVBPCvvYq9U2FZ9M1h
	 1dLIz2sigiVAjhlErdHE613I7ouoIZkrccrxcFIg4zFYh3NeT3VzbBU49D+QTl3g0v
	 rlT1dANGx+NxuZ8K98NKx0RVt+AqCYOo8GwAu77M=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <8adb6bf8-9804-4313-b1e1-5cf96d643d5e@raptorengineering.com>
Date: Wed, 20 Mar 2024 13:07:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <039524d4157dddb2faf6887739a727f6e993b53f.1710443965.git.sanastasio@raptorengineering.com>
 <152e76ee-6e75-4881-aa88-313f0ae058be@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <152e76ee-6e75-4881-aa88-313f0ae058be@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/15/24 4:16 AM, Jan Beulich wrote:
> On 14.03.2024 23:15, Shawn Anastasio wrote:
>> Arm's setup.c contains a collection of functions for parsing memory map
>> and other boot information from a device tree. Since these routines are
>> generally useful on any architecture that supports device tree booting,
>> move them into xen/common/device-tree.
>>
>> Suggested-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>>  MAINTAINERS                       |   1 +
>>  xen/arch/arm/setup.c              | 419 --------------------------
>>  xen/common/Makefile               |   1 +
>>  xen/common/device-tree/Makefile   |   1 +
>>  xen/common/device-tree/bootinfo.c | 469 ++++++++++++++++++++++++++++++
>>  5 files changed, 472 insertions(+), 419 deletions(-)
>>  create mode 100644 xen/common/device-tree/Makefile
>>  create mode 100644 xen/common/device-tree/bootinfo.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 56a6932037..e85fbe6737 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -301,6 +301,7 @@ M:	Stefano Stabellini <sstabellini@kernel.org>
>>  M:	Julien Grall <julien@xen.org>
>>  S:	Supported
>>  F:	xen/common/libfdt/
>> +F:	xen/common/device-tree/setup.c
> 
> Perhaps more generally
> 
> F:	xen/common/device-tree/
> 
> ?
>

This was done to allow bootfdt.c (next patch) to remain under ARM's
maintainership, which I believe was your suggestion in v2.

Perhaps it would make sense to leave both setup.c and bootfdt.c under
ARM's maintainership, or would it be acceptable to move both to device
tree?

> Jan

Thanks,
Shawn

