Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC71C3FF1B1
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 18:41:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177572.323088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpll-0003Bu-NP; Thu, 02 Sep 2021 16:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177572.323088; Thu, 02 Sep 2021 16:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpll-000398-Jm; Thu, 02 Sep 2021 16:40:53 +0000
Received: by outflank-mailman (input) for mailman id 177572;
 Thu, 02 Sep 2021 16:40:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLplk-000392-M4
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:40:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLplk-0000fj-LF
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:40:52 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLplk-00019p-KT
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:40:52 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mLplf-0003Tl-VM; Thu, 02 Sep 2021 17:40:47 +0100
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
	bh=GYDi4db046fx5JmmXElXDDtxBBBEsA4Th0cEYvzm6zg=; b=2LvnozFAb3yNbpSa4d5bY76QSt
	aKwgZG8n3+bo1Pb0Pusn2VsSSFiPRSTHekGmznA6JKDKyd9z9KlRCFdmoAZh6yc+YghF9/0kc61tc
	uF+RjQOXzouELYRA9waRq5MPmpqFVYl3tnyU8W7y6jh38UREyGtev43sF0Steb7HyYpw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24880.65167.715236.551394@mariner.uk.xensource.com>
Date: Thu, 2 Sep 2021 17:40:47 +0100
To: Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools: ROUNDUP() related adjustments
In-Reply-To: <c1b59a02-cce2-b18d-6c2a-4e7057b0a0ed@suse.com>
References: <c5d84f5a-0350-f197-b98a-07512ac0dd91@suse.com>
	<c1b59a02-cce2-b18d-6c2a-4e7057b0a0ed@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH] tools: ROUNDUP() related adjustments"):
> On 10.08.21 12:03, Jan Beulich wrote:
> > For one xc_private.h needlessly repeats xen-tools/libs.h's definition.
> > 
> > And then there are two suspicious uses (resulting from the inconsistency
> > with the respective 2nd parameter of DIV_ROUNDUP()): While the one in
> > tools/console/daemon/io.c - as per the code comment - intentionally uses
> > 8 as the second argument (meaning to align to a multiple of 256), the
> > one in alloc_magic_pages_hvm() pretty certainly does not: There the goal
> > is to align to a uint64_t boundary, for the following module struct to
> > end up aligned.

This is really quite unpleasnt, to my mind.  ROUNDUP taking a bit
length is bad enough, but the magic knowledge about alignment is
really poor too.  It may not be right on all future architectures,
although I think your changae is correct on all the ones we support
(or which people are working on).

So IOW I think your change is correct and warranted, but I really
dislike the code here.

Therefore:

Acked-by: Ian Jackson <iwj@xenproject.org>

> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks for the review!

Ian.

