Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBD645354E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 16:09:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226354.391138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn04h-0001TD-IE; Tue, 16 Nov 2021 15:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226354.391138; Tue, 16 Nov 2021 15:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn04h-0001QO-F2; Tue, 16 Nov 2021 15:08:43 +0000
Received: by outflank-mailman (input) for mailman id 226354;
 Tue, 16 Nov 2021 15:08:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn04g-0001QG-74
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:08:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn04g-0005zv-5M
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:08:42 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn04g-0003aH-4C
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:08:42 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mn04Q-0000J3-PV; Tue, 16 Nov 2021 15:08:26 +0000
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
	bh=i3c9t2s+x+6crnjusMREvzyxuaKfalRRv2nS23Rzn7I=; b=D7MJtmnglrRDsQChebPC65AKgF
	4+H8vefqkbTyNb2uUL23T4UChrz8Eu/MtgOA9CFTFS7qH6kI/DMPbmN2yuvrzaWpiwwyX/xg8urfk
	0xkPDPWvfVxsjvU6eFZ/PMKhaNFXYn1Wc1R3EjPe7jT2qXKtUPopVHeFPtEuZ05PMZto=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24979.51557.253278.46402@mariner.uk.xensource.com>
Date: Tue, 16 Nov 2021 15:08:21 +0000
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
    Julien Grall <julien@xen.org>,
    Jan Beulich <jbeulich@suse.com>,
    Bertrand Marquis <bertrand.marquis@arm.com>,
    wei.chen@arm.com,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
In-Reply-To: <1606F25D-53BF-4350-B065-B1FAB525F6A1@arm.com>
References: <20211104141206.25153-1-luca.fancellu@arm.com>
	<81685961-501e-7a41-6f6f-bc4491645264@suse.com>
	<alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
	<97C884F7-0577-4996-AB79-0A07A8D48FD8@arm.com>
	<alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop>
	<9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com>
	<alpine.DEB.2.22.394.2111041449180.284830@ubuntu-linux-20-04-desktop>
	<e4b2e1be-0e41-0e6e-5ea8-3c12b4593724@suse.com>
	<alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop>
	<9bd58aa4-602b-4c64-e759-581513909457@suse.com>
	<alpine.DEB.2.22.394.2111081805530.3317@ubuntu-linux-20-04-desktop>
	<191dd1b2-8e2a-ee91-f401-dda4fabf4c7c@suse.com>
	<alpine.DEB.2.22.394.2111091350510.440530@ubuntu-linux-20-04-desktop>
	<3B8E0C6E-0522-4F73-B6C2-827FA45C87BA@arm.com>
	<010fa02f-e561-e7a8-9638-5246db9166b4@xen.org>
	<725F3F68-A1CE-42FB-9C8A-0700CDD02E8E@arm.com>
	<a07ff375-b910-0d73-e957-15ba9d2535fe@xen.org>
	<alpine.DEB.2.22.394.2111151359360.1412361@ubuntu-linux-20-04-desktop>
	<1606F25D-53BF-4350-B065-B1FAB525F6A1@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Luca Fancellu writes ("Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64"):
> > On 15 Nov 2021, at 22:00, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > On Mon, 15 Nov 2021, Julien Grall wrote:
> >> That would indeed be better. I'd like this patch to be merged in 4.16. Would
> >> you be able to send a new version in the next couple of days?
> > 
> > I'd love that too; adding Ian so that he is aware.
> 
> Hi, yes I will prepare it and push very soon.

Can someone explain to me what is going on here in management-level-speak ?
I have read the thread and, as far as I can tell:

There was an actual regression with Grub2 on ARM64.  This was fixed by
9bc9fff04ba0 "xen/efi: Fix Grub2 boot on arm64" (committed on the 5th
of Novwmber).

But there are some objections to parts of that patch, from Jan.  It is
not clear to me what the status of those objections is.

Was I wrong to think that Jan had given an R-b ?  Had it been
withdrawn ?  I apologise if I committed a patch I shouldn't have.
(I have a vague memory of some conversation about this on irc but
nothing about this seems to have made it into email.)

AIUI from the thread, most of this discussion is about a followup
patch.  I don't understand the nature of the problem the followup
patch fixes, or the risk of the followup patch.

Does the current state of staging have a regression or serious bug ?
Who is affected by this bug and what are the consequences ?

Thanks,
Ian.

