Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E42315466
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 17:53:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83340.154828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WGF-0000r6-Ki; Tue, 09 Feb 2021 16:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83340.154828; Tue, 09 Feb 2021 16:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WGF-0000qh-HV; Tue, 09 Feb 2021 16:53:11 +0000
Received: by outflank-mailman (input) for mailman id 83340;
 Tue, 09 Feb 2021 16:53:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9WGE-0000qc-06
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 16:53:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9WGD-0002rP-Rn
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 16:53:09 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9WGD-0007Dy-PE
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 16:53:09 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l9WGA-0005uj-IC; Tue, 09 Feb 2021 16:53:06 +0000
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
	bh=1FGfhXqvsB0s8U10Z+v7BjWMeRka/NXyo7WUojyJH3U=; b=EO/ZW17Xw4r09SlFKBvqYLwUwG
	miuAYjpdKQz+m5EG8nsicUPeECGMeneb85DWD/l2WgdYpvDUFfmB0JQXswMVMOX60PwTTfVL1UP7b
	yR4wvReoKBsew59APPyVLL4PSTAvC1n1oD1/fzNSrqpyEPGUPaR4UW/zt7wdHTGpb7fc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24610.48626.319165.973767@mariner.uk.xensource.com>
Date: Tue, 9 Feb 2021 16:53:06 +0000
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210209 3/4] xl: optionally print timestamps when running xl commands
In-Reply-To: <20210209154536.10851-4-olaf@aepfle.de>
References: <20210209154536.10851-1-olaf@aepfle.de>
	<20210209154536.10851-4-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("[PATCH v20210209 3/4] xl: optionally print timestamps when running xl commands"):
> Add a global option "-T" to xl to enable timestamps in the output from
> libxl and libxc. This is most useful with long running commands such
> as "migrate".
> 
> During 'xl -v.. migrate domU host' a large amount of debug is generated.
> It is difficult to map each line to the sending and receiving side.
> Also the time spent for migration is not reported.
> 
> With 'xl -T migrate domU host' both sides will print timestamps and
> also the pid of the invoked xl process to make it more obvious which
> side produced a given log line.
> 
> Note: depending on the command, xl itself also produces other output
> which does not go through libxentoollog. As a result such output will
> not have timestamps prepended.

Reviewed-by: Ian Jackson <iwj@xenproject.org>

This is a new feature so it needs a release risk analysis.

The changes are entirely to xl command line handling.  The worst /
most likely bug would probably be something to do with the way the
logger is created.  Such a bug would be easy to fix.  Or, this patch
could easily be reverted.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

> This change adds also the missing "-t" flag to "xl help" output.

This part of the commit message talks about -t rather than -T.  I will
fix that on commit.

I'm going to commit the first three now.

Ian.

