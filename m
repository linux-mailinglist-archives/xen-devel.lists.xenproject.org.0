Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF46336371E
	for <lists+xen-devel@lfdr.de>; Sun, 18 Apr 2021 20:16:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112535.214707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYBxu-000781-0e; Sun, 18 Apr 2021 18:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112535.214707; Sun, 18 Apr 2021 18:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYBxt-00077c-Ti; Sun, 18 Apr 2021 18:16:13 +0000
Received: by outflank-mailman (input) for mailman id 112535;
 Sun, 18 Apr 2021 18:16:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lYBxs-00077X-3B
 for xen-devel@lists.xenproject.org; Sun, 18 Apr 2021 18:16:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYBxq-0007lQ-Cy; Sun, 18 Apr 2021 18:16:10 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYBxq-0003L9-48; Sun, 18 Apr 2021 18:16:10 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=d1xI2QBGA8TUkJqsn9+3Kgp2Knm72XkvGHgR70xZ9Bw=; b=PRFP1ESe7pGzL36dRsn9ZTkqcM
	I3kfS3HNiYzk+tdXmGJ0ydsHlN1scMDoXTdodmau8UXtmuXxBH31hi/uyDVy9L7VzW+W74tD/uGCl
	93k3zUQoL9mpR/941mQKE0Y2m0H73CodC1kD+6mgcHYs2UdZIXUx3DvM/1LZR4L/dCsk=;
Subject: Re: [PATCH] xen/arm: guest_walk: Only generate necessary
 offsets/masks
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien@amazon.com>
References: <20210405162046.9353-1-julien@xen.org>
 <964513D8-D6CD-4419-9804-CF77363B81FD@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <87889996-0dc8-f8d8-0b0f-ea68dd82e3f5@xen.org>
Date: Sun, 18 Apr 2021 19:16:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <964513D8-D6CD-4419-9804-CF77363B81FD@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 16/04/2021 17:04, Bertrand Marquis wrote:
>> On 5 Apr 2021, at 17:20, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, we are computing offsets/masks for each level and
>> granularity. This is a bit of waste given that we only need to
>> know the offsets/masks for the granularity used by the guest.
>>
>> All the LPAE information can easily be inferred with just the
>> page shift for a given granularity and the level.
>>
>> So rather than providing a set of helpers per granularity, we can
>> provide a single set that takes the granularity and the level in
>> parameters.
>>
>> With the new helpers in place, we can rework guest_walk_ld() to
>> only compute necessary information.
>>
>> Signed-off-by: Julien Grall <julien@amazon.com>
> 
> Very nice cleanup.

I have a couple of more cleanup in that area to send. So far, we are 
using a completely different set of macros for Xen page-tables. I would 
like to introduce a new set that will just pass PAGE_SHIFT to the 
existing helper.

The nice part is this means it will be easier to support other page 
granularity if we wanted :).

> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks! I have committed the patch.

Cheers,

-- 
Julien Grall

