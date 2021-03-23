Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8135C345FF7
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 14:42:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100699.192024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOhIL-00085s-28; Tue, 23 Mar 2021 13:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100699.192024; Tue, 23 Mar 2021 13:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOhIK-00085T-VB; Tue, 23 Mar 2021 13:42:04 +0000
Received: by outflank-mailman (input) for mailman id 100699;
 Tue, 23 Mar 2021 13:42:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOhIJ-00085O-HH
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 13:42:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOhIJ-0007LZ-FP
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 13:42:03 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOhIJ-0002CZ-EY
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 13:42:03 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lOhI7-00028Y-A6; Tue, 23 Mar 2021 13:41:51 +0000
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
	bh=NO72eAd1wZE8QUl/eBJ159N9S5LAV6H0N4zYhyOoNpQ=; b=QZ7AgGt5lXuK2lzpU83ImyTXm3
	hrULImo6pFLbsZ4VuWc/OXZa9vSQtHrZ6v5z73nVpmrIHjKfhQGQmF0eX3se0sRZscRPjoPvHEg0O
	F8tRmrwqrl+CRWikkCVRnOyWCcEMxurRuTGIyXqJt7xOf+UjK21QU4ZrRoavyOqKEz4Y=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24665.61470.964721.635678@mariner.uk.xensource.com>
Date: Tue, 23 Mar 2021 13:41:50 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen: Create EFI_VENDOR directory
In-Reply-To: <4b0ac6fa-cbe2-5b3c-fa61-52d743e07390@suse.com>
References: <20210322133301.11308-1-jandryuk@gmail.com>
	<c5736ca0-de24-bac7-f1d9-3f90df997454@suse.com>
	<d410d743-5479-bbf6-676b-c8749ab07c06@citrix.com>
	<f53db67e-8344-8da7-6658-c521d2e3c527@suse.com>
	<09b5e7ee-b44b-a8ab-f29d-6617b6af93a0@citrix.com>
	<9b071192-a443-4bdc-8dac-107bbd4a0481@suse.com>
	<CAKf6xpvGit4YiuTfGuX2iZ1qPi-a+oNK2bassUxGd8qJADEXyQ@mail.gmail.com>
	<4b0ac6fa-cbe2-5b3c-fa61-52d743e07390@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH] xen: Create EFI_VENDOR directory"):
> On 23.03.2021 13:34, Jason Andryuk wrote:
...
> > On Fedora, RPMs drop EFI binaries directly into /boot/efi/EFI/fedora/.
> > grub, shim, fwupdate and xen are all packaged that way.  It seems
> > reasonable to have those important binaries tracked by the package
> > manager.
> > 
> > Does SuSE populate EFI_VENDOR from EFI_DIR when some boot loader
> > script is called?
> 
> Yes. And back at the time, when I consulted our EFI person, I was left
> with the impression that this is the only reasonable approach. The
> primary reason, as said, was that the EFI partition as a whole may get
> rebuilt perhaps even from scratch at any point. Hence it's not
> reasonable to expect package-managed files to live there.

I agree with this analysis but it is for people like Fedora to decide
how they want to build their packages.

There is also the case of ad-hoc packages (eg our "make debball")
which the user might reasonably choose to have dump things in the EFI
system partition.

Conversely, I see no downside to the mkdir.  Jan, is there some actual
harm in it ?  If not, we should be accomodating to people's build and
packaging strategies even if we don't entirely approve of them.

Thanks,
Ian.

