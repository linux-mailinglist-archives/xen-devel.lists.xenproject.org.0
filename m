Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0C4724BA8
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 20:46:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544154.849713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6bgB-0001jn-9b; Tue, 06 Jun 2023 18:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544154.849713; Tue, 06 Jun 2023 18:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6bgB-0001h0-6m; Tue, 06 Jun 2023 18:45:15 +0000
Received: by outflank-mailman (input) for mailman id 544154;
 Tue, 06 Jun 2023 18:45:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6bg9-0001gu-TU
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 18:45:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6bg5-0003Vo-O4; Tue, 06 Jun 2023 18:45:09 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6bg5-00052v-He; Tue, 06 Jun 2023 18:45:09 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=JRtzs4xRN7pNQ5uEXaJQN4ZGwHmvbzKwJpEF6DaqgRw=; b=Xq7jHwEN+r6Yn9R5fnqfFmBtUx
	UbLbElgtbSPrK1x4KOXvoSNy2OHkfi7ZbTK8K3VqKG3OHksMmzjtsjCkZIDJkk2a+3FIWx7+hsRsf
	vg7a5OAX+L5bUhLG7sXV2u6QhQck9U1ec5mtV73c7wOHbalA6RFKsYkZzubXJVeUxJPs=;
Message-ID: <b31a9f06-1ad8-b882-2fb0-84a84a1accb8@xen.org>
Date: Tue, 6 Jun 2023 19:45:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
To: Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601085001.1782-1-michal.orzel@amd.com>
 <7C760D1D-DAAE-48AC-8B2B-E6140452BE4A@arm.com>
 <73a143ee-8301-e0c0-a3fc-83ec10441c4c@amd.com>
 <CAJ=z9a3iZHwXPwWiJykeSJbi0YvfD-L6SO3LxxRom=DPAqPuVg@mail.gmail.com>
 <703ccd1b-1908-4f5b-3b48-e02d317a2090@amd.com>
 <CAJ=z9a1V2XNKyc9gQjxhqRmTjpfamQfC5DfZfXZ15VoNqp2wNQ@mail.gmail.com>
 <bf9e8ba1-5ca9-d958-8e09-3f74710fd830@amd.com>
 <bec29c53-cade-9686-6ade-0f61f4bde27d@xen.org>
 <bb0c409e-7d92-cb5e-a34e-56993aad2121@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: debug-pl011: Use 32-bit accessors for broader
 compatibility
In-Reply-To: <bb0c409e-7d92-cb5e-a34e-56993aad2121@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/06/2023 08:04, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 05/06/2023 20:34, Julien Grall wrote:
> I can think of the following patches:
> 1) Use correct accessors for early pl011 on arm32 and arm64
> - this would use the accessors depending on the given register size (ldrh, strh, strb)
> - this would switch arm32 from 32-bit only to the same behavior as arm64
> 
> 2) Support for 32-bit only PL011 in early pl011 on arm32 and arm64:
> - this would result in overwriting the changes done in patch 1 (but I'd prefer not to do all in one patch for better history/backporting)
> as I'd have to introduce some macros e.g. PL011_STRH that would be defined as strh in normal case and str in mmio32 case, etc. I could also
> just duplicate all the early functions and use ifdefery if that's what would be preferred.

I would be fine with introduce PL011_STRH & co.

> 
> 3) Use correct accessors for runtime pl011:
> I would prefer to do what Linux does meaning using the largest-common accessor in normal-case (i.e. readw/writew) so that we can have a generic helpers
> (i.e. use readl/writel in mmio32 case or readw/writew in normal case). Otherwise we would have to use the accessors depending on the given register size
> (like in early printk) which destroys the idea of generic helpers. Linux for earlycon also uses per-register size accessor and in runtime - largest-common.

Make senses.

Cheers,

-- 
Julien Grall

