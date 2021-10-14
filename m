Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7231342DAE8
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 15:55:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209361.365794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb1C4-0003uT-30; Thu, 14 Oct 2021 13:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209361.365794; Thu, 14 Oct 2021 13:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb1C3-0003s5-WB; Thu, 14 Oct 2021 13:54:48 +0000
Received: by outflank-mailman (input) for mailman id 209361;
 Thu, 14 Oct 2021 13:54:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mb1C3-0003rz-Aj
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 13:54:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mb1C3-0001Jl-8F
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 13:54:47 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mb1C3-00021V-79
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 13:54:47 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mb1By-0002bt-8V; Thu, 14 Oct 2021 14:54:42 +0100
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
	bh=c7P4q8TpdljOv2xbOLZyvFln737ck8V3V/O4SKHnCis=; b=Hc72Cioq3oRpROe4oejq5xT1rL
	qsshwSJJjNH1Sna7kN5Q629tjXkOIB/Nm7rZSNfecdAQYjmJDfUC40B1juKLWggjdmtcw6Wsf//8L
	5YahT3EbQH1os16JAG8F7y9RG/rY71CUQlN1O3eoD7AnjMY0X6VfByE+ox2vk9oQxfuA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24936.13986.18506.868837@mariner.uk.xensource.com>
Date: Thu, 14 Oct 2021 14:54:42 +0100
To: Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>,
    xen-devel@lists.xenproject.org,
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V7 2/2] libxl/arm: Add handling of extended regions for
 DomU
In-Reply-To: <321a7bc4-f39e-bead-3837-c2ec640741b6@xen.org>
References: <1634211645-26912-1-git-send-email-olekstysh@gmail.com>
	<1634211645-26912-3-git-send-email-olekstysh@gmail.com>
	<321a7bc4-f39e-bead-3837-c2ec640741b6@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH V7 2/2] libxl/arm: Add handling of extended regions for DomU"):
> On 14/10/2021 12:40, Oleksandr Tyshchenko wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
...
> > Suggested-by: Julien Grall <jgrall@amazon.com>
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Again, on that basis,

Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks all.

Ian.

