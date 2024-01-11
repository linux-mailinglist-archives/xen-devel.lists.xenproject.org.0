Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2984A82B752
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 23:57:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666543.1037245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO3yB-00030w-Bk; Thu, 11 Jan 2024 22:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666543.1037245; Thu, 11 Jan 2024 22:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO3yB-0002xz-97; Thu, 11 Jan 2024 22:56:15 +0000
Received: by outflank-mailman (input) for mailman id 666543;
 Thu, 11 Jan 2024 22:56:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ifVr=IV=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rO3yA-0002xt-0m
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 22:56:14 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b55bc54-b0d4-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 23:56:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2650082857D9;
 Thu, 11 Jan 2024 16:56:07 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4gadJ3juCJxD; Thu, 11 Jan 2024 16:56:03 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A92EE8285879;
 Thu, 11 Jan 2024 16:56:03 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Wp50BoSZIf6W; Thu, 11 Jan 2024 16:56:03 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 3F14082857D9;
 Thu, 11 Jan 2024 16:56:03 -0600 (CST)
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
X-Inumbo-ID: 9b55bc54-b0d4-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com A92EE8285879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1705013763; bh=yQrLwSRp3Jn8EqGGK25xe2gLoRkg6NW2vk+gCSEZ93c=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=dg4CJV9FMPKHk1oM2GVs7Z1q4suuDreX91CdJcKGYAywOQVgmKEe8/EIVJZvcY7Zb
	 wLobt1auWKBJsp7l6VxcVQnw6RafwZCxVkhz1qe+n3u1a9KqFKRQegVdbdY5xP0M8O
	 snlvzr4Mfnve7Y1We34Mzu/WMq4pFVpgsaxqFQtU=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <767ef1bb-03fa-4c3f-8eb0-e8997d3da6f8@raptorengineering.com>
Date: Thu, 11 Jan 2024 16:56:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] xen/device-tree: Fix bootfdt.c to tolerate 0
 reserved regions
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <1c6f0f94f4ea2b773f960d88bd02e2168ac28abb.1702607884.git.sanastasio@raptorengineering.com>
 <c1c6ee29-7fa1-4b39-aa7a-1b8f750cd893@xen.org>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <c1c6ee29-7fa1-4b39-aa7a-1b8f750cd893@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien

On 1/9/24 12:14 PM, Julien Grall wrote:
> (+ Stefano)
> 
> Hi Shawn,
> 
> On 15/12/2023 02:43, Shawn Anastasio wrote:
>> The early_print_info routine in bootfdt.c incorrectly stores the result
>> of a call to fdt_num_mem_rsv() in an unsigned int, which results in the
>> negative error code being interpreted incorrectly in a subsequent loop
>> in the case where the device tree does not contain any memory reserve
>> map entries.
> 
> I have some trouble to reconciliate the code with your explanation.
> Looking at the implementation fdt_num_mem_rsv() should return 0 if there
> are no reserved regions. A negative value would only be returned if the
> device-tree is malformated.
> 
> Do you have a Device-Tree where the issue occurs?
> 
> That said, I agree that the code could be hardened.
>

After reading your comment, I looked into it again and it appears you're
right. It turns out that I was hitting this issue not because my device
tree had 0 entries or was corrupt, but because the function was being
called with an invalid device tree pointer to begin with!

Specifically, bootfdt.c:early_print_info calls fdt_num_mem_rsv using the
global `device_tree_flattened` variable which PPC's setup.c did not
properly initialize:

    nr_rsvd = fdt_num_mem_rsv(device_tree_flattened);

Thanks for the sanity check. I'll fix this in the next revision of the
patchset.

Despite my misunderstanding of how the bug was triggered in my case, it
definitely is still something that should be fixed. Following yours and
Michal's suggestion, I'll change the patch to panic() instead and submit
a follow-up (likely standalone and not as a part of this series).

> Cheers,

Thanks,
Shawn


