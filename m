Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC5555A1C5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 21:25:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355853.583786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4ovx-00061z-V4; Fri, 24 Jun 2022 19:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355853.583786; Fri, 24 Jun 2022 19:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4ovx-0005zu-Rq; Fri, 24 Jun 2022 19:25:37 +0000
Received: by outflank-mailman (input) for mailman id 355853;
 Fri, 24 Jun 2022 19:25:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4ovw-0005zo-92
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 19:25:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4ovv-00065i-Tt; Fri, 24 Jun 2022 19:25:35 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4ovv-0000Xr-La; Fri, 24 Jun 2022 19:25:35 +0000
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
	bh=rPiSki+h44CFmX+VOegY1CamI283Ny0AJ7r0k2dZW5c=; b=6KNGtnpZtljpOp5AvZiWZfH9w9
	GS9WW2IPfpXTUNEi3Raz8kqtyqkFyzofLjJQb3vww2xapTT744dvNcOpOWOvWnfroQdbn1SGjG6Xc
	ZAeiPEcGxc5PIja9i9Ost2tj1Z3LIQUvfT3VgNemzDFQ6ZXNqEgu5tGUeIIJRMpsIewc=;
Message-ID: <f87c00c5-8253-0c51-4f05-e137d98fc149@xen.org>
Date: Fri, 24 Jun 2022 20:25:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v5 1/8] xen/arm: introduce static shared memory
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-2-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220620051114.210118-2-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

I have looked at the code and I have further questions about the binding.

On 20/06/2022 06:11, Penny Zheng wrote:
> ---
>   docs/misc/arm/device-tree/booting.txt | 120 ++++++++++++++++++++++++++
>   xen/arch/arm/Kconfig                  |   6 ++
>   xen/arch/arm/bootfdt.c                |  68 +++++++++++++++
>   xen/arch/arm/include/asm/setup.h      |   3 +
>   4 files changed, 197 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 98253414b8..6467bc5a28 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -378,3 +378,123 @@ device-tree:
>   
>   This will reserve a 512MB region starting at the host physical address
>   0x30000000 to be exclusively used by DomU1.
> +
> +Static Shared Memory
> +====================
> +
> +The static shared memory device tree nodes allow users to statically set up
> +shared memory on dom0less system, enabling domains to do shm-based
> +communication.
> +
> +- compatible
> +
> +    "xen,domain-shared-memory-v1"
> +
> +- xen,shm-id
> +
> +    An 8-bit integer that represents the unique identifier of the shared memory
> +    region. The maximum identifier shall be "xen,shm-id = <0xff>".

There is nothing in Xen that will ensure that xen,shm-id will match for 
all the nodes using the same region.

I see you write it to the guest device-tree. However there is a mismatch 
of the type: here you use an integer whereas the guest binding is using 
a string.

Cheers,

-- 
Julien Grall

