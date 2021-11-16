Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8CD45361B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 16:42:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226407.391270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn0ah-0003YA-Se; Tue, 16 Nov 2021 15:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226407.391270; Tue, 16 Nov 2021 15:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn0ah-0003VU-Or; Tue, 16 Nov 2021 15:41:47 +0000
Received: by outflank-mailman (input) for mailman id 226407;
 Tue, 16 Nov 2021 15:41:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn0ag-0003VL-G0
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:41:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn0ag-0006fU-DX
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:41:46 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn0ag-0005pJ-CP
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:41:46 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mn0aT-0000SD-6p; Tue, 16 Nov 2021 15:41:33 +0000
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
	bh=nGas+BMduZ+0DfWpuZ/emTsggD2YpKd3f//TX0e5ojU=; b=WRuMFlFdyGmJG8AM/zqT3i3/nd
	R4wl+JlHnnuivEZq4Zdo36ToHB9wH7slBMp9IYcyJ1Cml7ytNvbBLPRIULp+65kgmlXn8cQsfi101
	RiBnQylE25XobSXzEFFIWqwh9EwX0B9nlZ2bXNcWRGocIqtmOQlBfb/QOc+uN0ThIXqQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24979.53538.946229.336332@mariner.uk.xensource.com>
Date: Tue, 16 Nov 2021 15:41:22 +0000
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org,
    bertrand.marquis@arm.com,
    wei.chen@arm.com,
    Stefano Stabellini <sstabellini@kernel.org>,
    Julien Grall <julien@xen.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH-4.16] arm/efi: Improve performance requesting filesystem handle
In-Reply-To: <20211116150624.7720-1-luca.fancellu@arm.com>
References: <20211116150624.7720-1-luca.fancellu@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Luca Fancellu writes ("[PATCH-4.16] arm/efi: Improve performance requesting filesystem handle"):
> Currently, the code used to handle and possibly load from the filesystem
> modules defined in the DT is allocating and closing the filesystem handle
> for each module to be loaded.
> 
> To improve the performance, the filesystem handle pointer is passed
> through the call stack, requested when it's needed only once and closed
> if it was allocated.

Thsnks for submitting this formally.  The clarity is very helpful.

> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Justification for integration in 4.16:
> Upside:   Fixes a performance issue only on arm that would be really useful
>           for ARM users using the release, no functional changes.

The size of this perf issue is not discussed here.  At this stage of
the release I will usually give release acks for fixes to serious
problems.  Does this meet that test ?  I think probably not.

Thanks to Bertrand who, when I asked on IRC, confirmed that this perf
issue only affects users of the new feature in a1743fc3a9 (so is not a
regression), and the perf issue is only a consquenceof 9bc9fff04ba0
which was itself a fix to something wrong with a1743fc3a9.  It seems
that one interpretation is that the problem here is simply a
less-than-optimal new feature.

> Downside: It's affecting the EFI boot path (only on ARM).
> Risk:     Risk is low given the small changes.

I did find this risk analysis at all convincing, I'm afraid.

So I'm afraid I'm saying "no".

Ian.

