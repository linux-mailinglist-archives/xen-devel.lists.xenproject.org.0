Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6BD5BA7D0
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 10:08:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407845.650488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ6Ok-0001E4-FK; Fri, 16 Sep 2022 08:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407845.650488; Fri, 16 Sep 2022 08:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ6Ok-0001BQ-CU; Fri, 16 Sep 2022 08:08:30 +0000
Received: by outflank-mailman (input) for mailman id 407845;
 Fri, 16 Sep 2022 08:08:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oZ6Oi-0001BK-C1
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 08:08:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oZ6Oh-0001IV-U3; Fri, 16 Sep 2022 08:08:27 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[10.95.124.157]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oZ6Oh-0003QU-NE; Fri, 16 Sep 2022 08:08:27 +0000
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
	bh=QnhwE4lqNX67ACyIjdJQ4LLBo+ol2ALyF9rc7n2FJbE=; b=r6IUg4mGmT/6VOa5R/MTRKy84d
	jmm9IpIxxRSL28UThogh8LFULsJYQZUUwSbZ8IC4D7csw0ARh2wt8Ton4Ux7mMnQogP3ROGU1CezU
	6wb5Q7QSHAsf3ZwqiIe3vgIuSSStIZ+P6hQAwz1c4xc5IHTcL30wBgd1SmFaW2XZSZlM=;
Message-ID: <4f4e254a-6b54-cdf7-40bc-89c25172bebf@xen.org>
Date: Fri, 16 Sep 2022 09:08:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [for-4.17] xen/arm: domain_build: Do not use dprintk
 unconditionally
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220916071920.8287-1-michal.orzel@amd.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220916071920.8287-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/09/2022 08:19, Michal Orzel wrote:
> Using dprintk results in printing additionally file name and line
> number. This is something we do not want when printing regular
> information unconditionally as it looks like as if there was some issue.
I am OK if you want to switch to a printk() but I disagree with this 
argument. dprintk() is not about error, it is about anything that 
doesn't matter in release build.

I don't think we should just switch to printk() because dprintk() add 
the line/file. There are message we don't necessarily want to have in 
release build. So dprintk(XENLOG_INFO, ...) would be right for them.

Personally, I find them useful as there no grep required and/or 
confusion (but that's a matter of taste). If it were me, I would add the 
line/file everywhere. But I understand this takes space in the binary 
(hence why this is not present in release build).

A better argument to switch to printk() is this information is useful to 
the user even outside of the debug build.

> 
> Fix this by switching to printk because this information may also be
> helpful on the release builds (it would still require setting loglvl to
> "info" or lower level).

I think we should drop XENLOG_INFO to be consistent with the other 
printk() in domain_build.c (after all this is a domain information like 
the other) or use XENLOG_INFO everywhere.

My preference will be the former because otherwise most of the 
information will not printed in release build by default.

> 
> Fixes: 5597f32f409c ("xen/arm: assign static shared memory to the default owner dom_io")

Fixes should only be used for bugs. This is not one.

> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Rationale for taking this patch for 4.17:
> Current code results in an abnormal behavior [1] and was introduced by

It is not abnormal (see above). This is an expected behavior when you 
use dprintk().

> the 4.17 feature (static shared memory). Even though it can only be seen
> on a debug build, it should be fixed now so that we have a consistent
> behavior across all the logs.

As I wrote above, I agree this should be printed in release build. But I 
disagree with your arguments.

Cheers,

-- 
Julien Grall

