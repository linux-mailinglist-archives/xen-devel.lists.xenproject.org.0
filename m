Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8E5547440
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jun 2022 13:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347207.573444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzzKH-0007iL-8J; Sat, 11 Jun 2022 11:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347207.573444; Sat, 11 Jun 2022 11:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzzKH-0007fy-49; Sat, 11 Jun 2022 11:30:45 +0000
Received: by outflank-mailman (input) for mailman id 347207;
 Sat, 11 Jun 2022 11:30:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nzzKF-0007fs-Rn
 for xen-devel@lists.xenproject.org; Sat, 11 Jun 2022 11:30:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzzKF-0007Sr-BE; Sat, 11 Jun 2022 11:30:43 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzzKF-0008Hx-38; Sat, 11 Jun 2022 11:30:43 +0000
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
	bh=FkwsPuoMcgaQ4ZKoqYdKp5NtlaahcWnaU77d8O+qBEM=; b=fzteqHrUne4DbkbeFl1fXkSAXP
	uD+p2k7EKd/YCbshjZmnjZa30PYO9zhhTDZCh4r2Tk1k2QqZLIpv9mDs5kfHkGVj0mkc0okWJHiHf
	Ad2+nf9NjkDK+JBx50e/THiuSgRHLbbt0Kthw/bvTAvyFZBHROSZxBvEN+xdBC7KrcRY=;
Message-ID: <4f9a6d8b-7613-5030-2653-e7da6f69618d@xen.org>
Date: Sat, 11 Jun 2022 12:30:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 00/16] xen/arm: mm: Remove open-coding mappings
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220520120937.28925-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220520120937.28925-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/05/2022 13:09, Julien Grall wrote:
> Julien Grall (15):
>    xen/arm: mm: Allow other mapping size in xen_pt_update_entry()
>    xen/arm: mm: Add support for the contiguous bit
>    xen/arm: mm: Avoid flushing the TLBs when mapping are inserted
>    xen/arm: mm: Don't open-code Xen PT update in remove_early_mappings()
>    xen/arm: mm: Re-implement early_fdt_map() using map_pages_to_xen()
>    xen/arm32: mm: Re-implement setup_xenheap_mappings() using
>      map_pages_to_xen()
>    xen/arm: mm: Allocate xen page tables in domheap rather than xenheap
>    xen/arm: mm: Allow page-table allocation from the boot allocator
>    xen/arm: Move fixmap definitions in a separate header
>    xen/arm: mm: Clean-up the includes and order them
>    xen/arm: mm: Use the PMAP helpers in xen_{,un}map_table()
>    xen/arm32: setup: Move out the code to populate the boot allocator
>    xen/arm64: mm: Add memory to the boot allocator first
>    xen/arm: mm: Rework setup_xenheap_mappings()
>    xen/arm: mm: Re-implement setup_frame_table_mappings() with
>      map_pages_to_xen()
> 
> Wei Liu (1):
>    xen/arm: add Persistent Map (PMAP) infrastructure

I have now committed the full series.

Cheers,

-- 
Julien Grall

