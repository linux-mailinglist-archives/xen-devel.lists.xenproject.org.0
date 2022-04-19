Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E271D506467
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 08:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307772.523052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nghLQ-0005VA-IQ; Tue, 19 Apr 2022 06:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307772.523052; Tue, 19 Apr 2022 06:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nghLQ-0005SC-FJ; Tue, 19 Apr 2022 06:28:12 +0000
Received: by outflank-mailman (input) for mailman id 307772;
 Tue, 19 Apr 2022 06:28:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uEip=U5=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nghLO-0005S6-Rh
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 06:28:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e0ee5fd5-bfa9-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 08:28:09 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 358C51042;
 Mon, 18 Apr 2022 23:28:08 -0700 (PDT)
Received: from [10.57.11.171] (unknown [10.57.11.171])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D64D13F766;
 Mon, 18 Apr 2022 23:28:06 -0700 (PDT)
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
X-Inumbo-ID: e0ee5fd5-bfa9-11ec-a405-831a346695d4
Message-ID: <c2030fd0-8aed-6a68-e275-77d22f972dfc@arm.com>
Date: Tue, 19 Apr 2022 08:28:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] xen/arm: Make use of DT_MATCH_TIMER in make_timer_node
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220414095843.102305-1-michal.orzel@arm.com>
 <alpine.DEB.2.22.394.2204151609140.915916@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <alpine.DEB.2.22.394.2204151609140.915916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 16.04.2022 01:10, Stefano Stabellini wrote:
> On Thu, 14 Apr 2022, Michal Orzel wrote:
>> DT_MATCH_TIMER stores the compatible timer ids and as such should be
>> used in all the places where we need to refer to them. make_timer_node
>> explicitly lists the same ids as the ones defined in DT_MATCH_TIMER so
>> make use of this macro instead.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> 
> This is a good cleanup, thanks! time.h is not currently included by
> domain_build.c, I think we should add:
> 
> #include <asm/time.h>
> 
> to domain_build.c 
> 
asm/time.h is included by xen/time.h which is included by xen/irq.h.
That is why there is no build failure and the patch itself is correct.

Furthermore DT_MATCH_TIMER is already used in domain_build.c (handle_node)
together with other constructs like TIMER_PHYS_SECURE_PPI defined in asm/time.h.

Cheers,
Michal

