Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE1D42A805
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 17:16:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207384.363196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJVY-0004PK-79; Tue, 12 Oct 2021 15:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207384.363196; Tue, 12 Oct 2021 15:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJVY-0004NT-44; Tue, 12 Oct 2021 15:16:00 +0000
Received: by outflank-mailman (input) for mailman id 207384;
 Tue, 12 Oct 2021 15:15:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maJVX-0004NN-HZ
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:15:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maJVX-0003d0-Gm
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:15:59 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maJVX-0003f1-Fv
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:15:59 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1maJVT-0004iL-Qt; Tue, 12 Oct 2021 16:15:55 +0100
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
	bh=gpnKHEwhE36/gKdPrnfxsCdAsb/wChRC4J3Zp7caD2Q=; b=rKAppI7GxS0sV3q7a3nd0phffp
	kg5MArs/lNDhSJMaZ+QPJRo/yv7DhmB/wWGPNFtVjpebR8SImKjdwewqkVAYkC8iX9bp9wCVfTeD2
	YwSO2TQr2m/XD+8Y1IVbdBEd8sA4Bx5cJfADlEZo5CeKMOeYm9mx71wUlzRY4AVNhHyQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24933.42667.311553.565032@mariner.uk.xensource.com>
Date: Tue, 12 Oct 2021 16:15:55 +0100
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
    Ian Jackson <iwj@xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Juergen Gross <jgross@suse.com>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct xen_domctl_getdomaininfo
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <1633974539-7380-2-git-send-email-olekstysh@gmail.com>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
	<1633974539-7380-2-git-send-email-olekstysh@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Oleksandr Tyshchenko writes ("[PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct xen_domctl_getdomaininfo"):
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> We need to pass info about maximum supported guest physical
> address space size to the toolstack on Arm in order to properly
> calculate the base and size of the extended region (safe range)
> for the guest. The extended region is unused address space which
> could be safely used by domain for foreign/grant mappings on Arm.
> The extended region itself will be handled by the subsequent
> patch.

You say "to the toolstack", but you are exposing this information up
to callers of libxl.  Do you mean some higher-layer toolstack that
uses libxl ?  What does it use this information for ?

FTAOD I am not opposed to exposing this in this way; indeed it seems
likely to be useful.  I just want to fully understand before I give
this my tools ack.

> +        info->gpaddr_bits = domctl.u.getdomaininfo.gpaddr_bits;

I'm pleased to find that this is not arch-specific.

Thanks,
Ian.

