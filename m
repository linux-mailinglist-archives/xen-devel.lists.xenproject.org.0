Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CCE44E410
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 10:40:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225017.388606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlT2J-0001vm-FE; Fri, 12 Nov 2021 09:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225017.388606; Fri, 12 Nov 2021 09:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlT2J-0001sx-BF; Fri, 12 Nov 2021 09:39:55 +0000
Received: by outflank-mailman (input) for mailman id 225017;
 Fri, 12 Nov 2021 09:39:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mlT2H-0001sp-SB
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 09:39:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mlT2H-0004zL-Az; Fri, 12 Nov 2021 09:39:53 +0000
Received: from [54.239.6.189] (helo=[192.168.1.222])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mlT2H-0003Wq-5G; Fri, 12 Nov 2021 09:39:53 +0000
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
	bh=scJ9PGRohDCZKYYbRM9vwQqDO5r0BInvIiR2CDcLW50=; b=fRwmIxS0fHZyTbAQz+P+4oDJb7
	vqEZJKi9zcqW87VZLI5dtKFbhEMfFSYG7dg2hsAai7Twt/l3IV1qjMQ1OxT1pyiQkV2IzKJdSPfTm
	kOIRssfrFNZzsTm3RZVwLquStEvC20A50jyVNudP/oF0rVQDvjifclYnTDVXAAHJshzM=;
Message-ID: <b3dd2e88-6b32-f066-1f6e-d638ade23826@xen.org>
Date: Fri, 12 Nov 2021 09:39:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH 3/5] xen/sort: Switch to an extern inline implementation
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-4-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211111175740.23480-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 11/11/2021 17:57, Andrew Cooper wrote:
> There are exactly 3 callers of sort() in the hypervisor.
> 
> Both arm callers pass in NULL for the swap function.  While this might seem
> like an attractive option at first, it causes generic_swap() to be used which
> forced a byte-wise copy.  Provide real swap functions which the compiler can
> optimise sensibly.
> 
> Furthermore, use of function pointers in tight loops like that can be very bad
> for performance.  Implement sort() as extern inline, so the optimiser can
> judge whether to inline things or not.
> 
> On x86, the diffstat shows how much of a better job the compiler can do when
> it is able to see the cmp/swap implementations.

For completness, here the Arm bloat-o-meter:

add/remove: 0/5 grow/shrink: 2/0 up/down: 928/-660 (268)
Function                                     old     new   delta
boot_fdt_info                                640    1132    +492
register_mmio_handler                        292     728    +436
u32_swap                                      20       -     -20
generic_swap                                  40       -     -40
cmp_mmio_handler                              44       -     -44
cmp_memory_node                               44       -     -44
sort                                         512       -    -512
Total: Before=966915, After=967183, chg +0.03%

Cheers,

-- 
Julien Grall

