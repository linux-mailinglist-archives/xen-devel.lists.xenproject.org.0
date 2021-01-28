Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF7030789A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 15:51:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77132.139538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58dr-000111-E1; Thu, 28 Jan 2021 14:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77132.139538; Thu, 28 Jan 2021 14:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58dr-00010c-At; Thu, 28 Jan 2021 14:51:27 +0000
Received: by outflank-mailman (input) for mailman id 77132;
 Thu, 28 Jan 2021 14:51:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l58dp-00010S-MR
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:51:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l58dp-0007q1-Lc
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:51:25 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l58dp-0000sE-Ko
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:51:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l58dV-0004bS-Tl; Thu, 28 Jan 2021 14:51:05 +0000
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
	bh=g0E/jXTMv6YSok1wq8x9jlyy0XIo64jxN1b3MZY0NDA=; b=tolGS/bQ9w5Toplnp8aOhyFAbG
	trYiYGos7mfX0g00gR8SMm+gomdjNGZt39cz3p7fy6OVCpKRzv4Xx3UKaRB0g806ptuakL4efVwWL
	Mq5z/M63ZUdUSr+NefVkogvgiPnc+e2ZB5CCnX+Tdy3pHzmnyfmdC71h5v+bknssUq5w=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24594.53081.646632.583737@mariner.uk.xensource.com>
Date: Thu, 28 Jan 2021 14:51:05 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
    Paul Durrant <paul@xen.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu  <wl@xen.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini  <sstabellini@kernel.org>,
    Jun Nakajima <jun.nakajima@intel.com>,
    Kevin Tian <kevin.tian@intel.com>,
    Julien Grall <julien.grall@arm.com>,
    xen-devel@lists.xenproject.org,
    Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [PATCH V5 10/22] xen/ioreq: Move x86's io_completion/io_req
 fields to struct vcpu
In-Reply-To: <1330ae92-d2ac-fca2-e149-fb7c39b3a66f@suse.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
	<1611601709-28361-11-git-send-email-olekstysh@gmail.com>
	<2a048ca9-2767-a4d8-c864-21392bb65fdc@xen.org>
	<f4a4cbe6-89a1-3f80-2d03-fd62c5d7eda6@suse.com>
	<61c10e68-d3fe-af16-b22f-bac804a0a70a@xen.org>
	<1330ae92-d2ac-fca2-e149-fb7c39b3a66f@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH V5 10/22] xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu"):
> On 28.01.2021 15:21, Julien Grall wrote:
> > It seems that this is a build issue as if I clean the repo the error 
> > disappear.
> > 
> > The error happens when I move from staging to a batch with this series 
> > applied without a cleaning the tree. It also happens the other way 
> > around as well.

How vexing.

> > Removing entry.o or asm-offsets.h before building doesn't help. Any 
> > other idea?
> 
> No, I'd need to know how exactly to repro and then try to debug.

IMO this problem is not a blocker for pushing this today or tomorrow.
Unless someone disagrees ?

Ian.

