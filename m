Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7EA756ED8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 23:16:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564857.882591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLVZS-00048r-0u; Mon, 17 Jul 2023 21:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564857.882591; Mon, 17 Jul 2023 21:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLVZR-00046R-UO; Mon, 17 Jul 2023 21:15:53 +0000
Received: by outflank-mailman (input) for mailman id 564857;
 Mon, 17 Jul 2023 21:15:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qLVZP-00046L-IU
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 21:15:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLVZO-0003Ss-9t; Mon, 17 Jul 2023 21:15:50 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLVZN-0008BH-Tq; Mon, 17 Jul 2023 21:15:50 +0000
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
	bh=85Uyqi5kwNoieffVkJ30q7XMYNGiQtJVzRIuY8pl29E=; b=o0JftoQRe35emosbUM/tVL0TbQ
	oMEjPUhRZEfqX6vieXZZuh/FAq97kCAXZyTE/HRF754i2tQxoprvP/Euvs3kEEa/4q0EL6PEb2x3k
	NkG3ZUWsDJmmGc2W+8XMaWFmBwsLm0lQU9B06sS3toQwT+zabloaR+n5GiKB/tZ1LJzk=;
Message-ID: <f38ecc34-4e4d-8142-50a1-a54097a909a0@xen.org>
Date: Mon, 17 Jul 2023 22:15:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <1ad20473a031eca75db4007bdc169616b512ef44.1689329728.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 1/4] xen/arm: justify or initialize conditionally
 uninitialized variables
In-Reply-To: <1ad20473a031eca75db4007bdc169616b512ef44.1689329728.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

I am currently looking at the code to check if we can avoid some SAF-*. 
But I need some clarification on the usage.

On 14/07/2023 12:49, Nicola Vetrini wrote:
> @@ -2914,6 +2924,7 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
>       void *fdt = kinfo->fdt;
>       int res;
>       gic_interrupt_t intr;

This value will be passed to set_interrupt() which contains the 
following code:

__be32 *cells = interrupt;
[...]
dt_set_cells(&cells, ....);

Where  gic_interrupt_t is:

typedef __be32 gic_interrupt[3];

This is very similar to the pattern in ...

> +    /* SAF-1-safe MC3R1.R9.1*/
>       __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
>       __be32 *cells;
>       struct domain *d = kinfo->d;
> @@ -3435,6 +3446,7 @@ static void __init initrd_load(struct kernel_info *kinfo)
>       paddr_t paddr, len;
>       int node;
>       int res;
> +    /* SAF-1-safe MC3R1.R9.1 */
>       __be32 val[2];

... here.

cellp = (__be32 *)val;
dt_set_cell(&cellp, ..., load_addr);

Would you be able to explain why Eclair is complaining for this one but 
not the previous one?

Cheers,

-- 
Julien Grall

