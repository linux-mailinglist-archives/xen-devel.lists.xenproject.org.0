Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FB0987B12
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 00:14:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805904.1217150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stwkb-0007td-M2; Thu, 26 Sep 2024 22:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805904.1217150; Thu, 26 Sep 2024 22:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stwkb-0007s7-IP; Thu, 26 Sep 2024 22:14:17 +0000
Received: by outflank-mailman (input) for mailman id 805904;
 Thu, 26 Sep 2024 22:14:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ruc3=QY=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1stwkZ-0007s1-Qo
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 22:14:15 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a824f202-7c54-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 00:14:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id ACB4F8286CD6;
 Thu, 26 Sep 2024 17:14:10 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id W72KuatgOI0X; Thu, 26 Sep 2024 17:14:09 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B99AE8287A33;
 Thu, 26 Sep 2024 17:14:09 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Sp27k-y6O2OQ; Thu, 26 Sep 2024 17:14:09 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 42EE982878CA;
 Thu, 26 Sep 2024 17:14:09 -0500 (CDT)
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
X-Inumbo-ID: a824f202-7c54-11ef-99a2-01e77a169b0f
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com B99AE8287A33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1727388849; bh=bCC2fBnFSDvI8Cu7wp7IhWG5+LR8J8XqVXa11HgOkSg=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=LnHq0op0G0IU/GJ9f9frVmlxXi4ZkDr8f8tTTQo/2ysWnSJ7e1PI6/udpPoc2g/mm
	 ojxugQsnypJX6KVASWDiSmLejjkZayozzZ0kt7C1FT4IVvCNI8Om4NaZB8Rn6lmjJ8
	 i6+WmXc/ytaaLCVklvH5An8+0MipcZVQZpwC52nM=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <82383c10-9724-4729-afe6-81fd08805879@raptorengineering.com>
Date: Thu, 26 Sep 2024 17:14:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] xen/ppc: mm-radix: Allocate all paging structures
 at runtime
To: Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com, xen-devel@lists.xenproject.org
References: <cover.1712893887.git.sanastasio@raptorengineering.com>
 <d7263aaef3bd59255a84bd78c4ea4c09c78a5902.1712893887.git.sanastasio@raptorengineering.com>
 <742d3499-208a-4650-bc95-fa59e334bd25@suse.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <742d3499-208a-4650-bc95-fa59e334bd25@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

I'm revisiting this series and wanted to follow up on your comments.

On 4/24/24 9:46 AM, Jan Beulich wrote:
> On 12.04.2024 05:55, Shawn Anastasio wrote:
>> +/*
>> + * A thin wrapper for alloc_boot_pages that keeps track of the maximum and
>> + * minimum mfns that have been allocated. This information is used by
>> + * setup_initial_mapping to include the allocated pages in the initial
>> + * page mapping.
> 
> Plus everything in between. Together with the further comment below I'm
> afraid I still think that the constraints (and the justification for them
> being tolerable at least for the time being) aren't made sufficiently
> clear (perhaps in another code comment next to the respective two
> variables' definitions).
> 

Sure, I'll elaborate a bit further in a new comment above those two
variables.

>> +    /*
>> +     * Identity map all pages we've allocated for paging structures. This act
>> +     * itself will allocate more pages, so continue until we've mapped from
>> +     * `max_alloc_mfn` down to `min_alloc_mfn`. This assumes that the heap grows
>> +     * downwards, which matches the behavior of alloc_boot_pages.
> 
> ... as long as you only ever allocate individual pages (which looks
> to be the case for such incremental allocations, but that imo doesn't
> go without saying).
> 

I'm not sure I'm following you. `initial_page_alloc` as well as its
underlying `alloc_boot_pages` can only ever allocate individual pages
(or contiguous ranges of pages). If the assumption about growing
downwards is not met, the code catches it and panics.

> Jan

Thanks,
Shawn

