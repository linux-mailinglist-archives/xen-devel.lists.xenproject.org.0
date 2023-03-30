Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BB86D10FD
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 23:46:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516901.801778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pi05I-0006mf-5E; Thu, 30 Mar 2023 21:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516901.801778; Thu, 30 Mar 2023 21:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pi05I-0006jO-1q; Thu, 30 Mar 2023 21:45:28 +0000
Received: by outflank-mailman (input) for mailman id 516901;
 Thu, 30 Mar 2023 21:45:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pi05F-0006jF-PN
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 21:45:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pi05F-0003rV-5p; Thu, 30 Mar 2023 21:45:25 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pi05E-0004ey-W6; Thu, 30 Mar 2023 21:45:25 +0000
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
	bh=E7RTxC8u2YBM+KkLz9rVVyHulWD1jNs+F06vVX2aM8k=; b=xwq/sVnJpFLjP3w8291NjFf+6E
	B5SNr+lmnjCWZSgDOqFNawhdkBVLNo2Vs3nIPkauYX8QwVRf5oLN7QHJDedkx4FqfSQ+4sEBS5V78
	10T6la2wgsO7jOXMhlj26y9hyKUWikUyxXT3/XCuZZ0PF57+2ddMiOYSlveMNMK5+ePM=;
Message-ID: <22ce7663-e63c-a3b8-9444-8f43cc4620c4@xen.org>
Date: Thu, 30 Mar 2023 22:45:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-12-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN v4 11/11] xen/arm: p2m: Enable support for 32bit IPA for
 ARM_32
In-Reply-To: <20230321140357.24094-12-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 21/03/2023 14:03, Ayan Kumar Halder wrote:
> The pabits, t0sz, root_order and sl0 values are the same as those for
> ARM_64.

To me this read as the line should be common. But you still duplicate it.

In any case, you should justify this change with a pointer to the Arm 
Arm. Not just saying they are common.

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from -
> 
> v1 - New patch.
> 
> v2 - 1. Added Ack.
> 
> v3 - 1. Dropped Ack.
> 2. Rebased the patch based on the previous change.
> 
>   xen/arch/arm/p2m.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index f34b6e6f11..20beecc6e8 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -2272,8 +2272,9 @@ void __init setup_virt_paging(void)
>           unsigned int sl0;    /* Desired SL0, maximum in comment */
>       } pa_range_info[] __initconst = {
>   #ifdef CONFIG_ARM_32
> -        [0] = { 40,      24/*24*/,  1,          1 },
> -        [1] = { 0 } /* Invalid */
> +        [0] = { 32,      32/*32*/,  0,          1 },

As I pointed out in one of the previous version, the root order is 
different than ...

> +        [1] = { 40,      24/*24*/,  1,          1 },

... here. Yet, you still keep P2M_ROOT_ORDER and P2M_ROOT_LEVEL 
hardcoded. Your previous patch wants to define p2M_root_order and 
p2m_root_level (lower-case intended). IOW making more code common 
between arm64 and arm32.

Cheers,

-- 
Julien Grall

