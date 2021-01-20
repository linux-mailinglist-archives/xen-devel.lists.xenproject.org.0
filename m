Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C0B2FD6E0
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 18:29:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71669.128524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2HIA-0003RA-LW; Wed, 20 Jan 2021 17:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71669.128524; Wed, 20 Jan 2021 17:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2HIA-0003Qo-IA; Wed, 20 Jan 2021 17:29:14 +0000
Received: by outflank-mailman (input) for mailman id 71669;
 Wed, 20 Jan 2021 17:29:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2HI9-0003Qj-4j
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:29:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2HI9-0005wc-2d
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:29:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2HI9-0006v6-1m
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:29:13 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2HI2-0006YY-IE; Wed, 20 Jan 2021 17:29:06 +0000
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
	bh=ocrTX36kUCskrlBjlSQ7bOji86LrSSrtWvshfCVW5mQ=; b=JoxnD2BucVMJvfkjn2cux2CX0K
	PNJD8jThh3CmbBF16/vrEBoHGVxvkKfAOixQ+eiPG6EtoN9xaptZDXz359kN3SO8fK8172ET43Xhy
	stwcyK5ASDZJavggLbT/+sljBovY2Q8sMgYltBQVqJgdKZBZ0VY0wgRmLPGrze3o5W9Q=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24584.26722.347244.50758@mariner.uk.xensource.com>
Date: Wed, 20 Jan 2021 17:29:06 +0000
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: make it build without setresuid()
In-Reply-To: <20210120172046.GA5772@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
	<20210112181242.1570-16-bouyer@antioche.eu.org>
	<20210118181656.2abblbjg2jvhlad7@Air-de-Roger>
	<24584.17302.958286.788145@mariner.uk.xensource.com>
	<20210120151321.GB4175@antioche.eu.org>
	<24584.19725.745755.464840@mariner.uk.xensource.com>
	<20210120165615.GB5035@antioche.eu.org>
	<24584.25612.523093.188718@mariner.uk.xensource.com>
	<20210120172046.GA5772@antioche.eu.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("Re: [PATCH] libs/light: make it build without setresuid()"):
> On Wed, Jan 20, 2021 at 05:10:36PM +0000, Ian Jackson wrote:
> > My last mail had in it a thing that claims to be a proof that this is
> > not possible.
> 
> This code:
>         if (setreuid(375,0) < 0) {
>                 err(1, "setreuid");
>         }
>         if (seteuid(374) < 0) {
>                 err(1, "seteuid");
>         }
>         if (kill(-1, 9)) {
>                 err(1, "kill");
>         }
>         printf("kill done\n");
>         if (seteuid(0) < 0) {
>                 err(1, "setreuid2");
>         }
>         exit(0);
> 
> actually works on NetBSD. processes from 375 are killed, and the
> seteuid(0) call succeeds (showing that the saved used id is still 0).

I guess I must have been wrong.

> > What do you think ?
> 
> As this is supported by Xen, I hope I can make at last run qemu with a
> non-zero uid.

The logic for deciding what user to run qemu as, and whether to kill
by uid or by pid, is in libxl_dm.c, in the function
libxl__domain_get_device_model_uid.

The dm_restrict flag turns on various other things too.

Ian.

