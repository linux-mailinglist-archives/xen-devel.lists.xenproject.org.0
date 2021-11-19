Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B383045709B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 15:26:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228059.394552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4px-0003oI-2Y; Fri, 19 Nov 2021 14:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228059.394552; Fri, 19 Nov 2021 14:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4pw-0003lb-VH; Fri, 19 Nov 2021 14:25:56 +0000
Received: by outflank-mailman (input) for mailman id 228059;
 Fri, 19 Nov 2021 14:25:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mo4pv-0003lR-EE
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 14:25:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mo4pv-0000xV-DW
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 14:25:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mo4pv-0000ut-Ca
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 14:25:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mo4pr-0005eV-RG; Fri, 19 Nov 2021 14:25:51 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=KHW3S0IHaNV919e5kFrVOklnNu0dgoO9Q2dd+EFUpDs=; b=5o/yO5/OuiP153Hbs0ovejMc7U
	dfcLuFM5NERyF5tDRoIYNT3BVEaTMLAO6AfZnxi0YQBe/UJK2AUEeAtixxfSO8PeI7My7R4zy6HVx
	KJ38i/z4QNf8XARC4r//70tRs3UOwosjOf1jKGgxeVFAcDiJex5TTNuFl5XcZMEdDS0s=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24983.46063.379168.151942@mariner.uk.xensource.com>
Date: Fri, 19 Nov 2021 14:25:51 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 0/7] (mainly) xz imports from Linux
In-Reply-To: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH 0/7] (mainly) xz imports from Linux"):
> While going through their 5.15.3 log I did notice two changes, which made
> me go check what else we might be missing. The series here is the result.
> Linux has also updated zstd, but that includes a pretty large change which
> I'm not ready to deal with right now. Them moving closer to the upstream
> zstd sources is certainly a good thing, so I suppose sooner or later we
> will want to follow them in doing so.
> 
> 1: xz: add fall-through comments to a switch statement
> 2: xz: fix XZ_DYNALLOC to avoid useless memory reallocations
> 3: decompressors: fix spelling mistakes
> 4: xz: avoid overlapping memcpy() with invalid input with in-place decompression
> 5: xz: fix spelling in comments
> 6: xz: move s->lzma.len = 0 initialization to lzma_reset()
> 7: xz: validate the value before assigning it to an enum variable

FTAOD I think none of these are critical bug fixes for 4.16.
Please let me know if I'm wrong.

In theory 4 is UB but in practice the result is presumably just wrong
answers.

Ian.

