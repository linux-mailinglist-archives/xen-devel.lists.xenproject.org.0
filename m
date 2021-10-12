Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A08EC42A7D3
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 17:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207345.363141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJJc-0000TF-0E; Tue, 12 Oct 2021 15:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207345.363141; Tue, 12 Oct 2021 15:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJJb-0000R6-T9; Tue, 12 Oct 2021 15:03:39 +0000
Received: by outflank-mailman (input) for mailman id 207345;
 Tue, 12 Oct 2021 15:03:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maJJa-0000R0-1Y
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:03:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maJJZ-0003O0-Vx
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:03:37 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maJJZ-0002VP-Uq
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:03:37 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1maJJW-0004eJ-Ir; Tue, 12 Oct 2021 16:03:34 +0100
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
	bh=FOYoEW8KI7o4uzQlqUDJZjWTqq3iruwDf0kf/sUVJRw=; b=UuEQirFJ8k3Q5ZR5n2ne+qz5/C
	bzjd0xLE92nDIHRMwdZtl4Juk8tnKkJVDJzwgAxnXuFkvgERn+bog2FPVLXN8hfunUxP2v0ZagTvE
	R4JiwX/ABWJGyHxYGnW2brjI3z6TQ0yF6yRixfH1kxq6o5M9GxD+4LWpSNZ+tgOASSOY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24933.41926.168289.698356@mariner.uk.xensource.com>
Date: Tue, 12 Oct 2021 16:03:34 +0100
To: Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org,
    bertrand.marquis@arm.com,
    Andre.Przywara@arm.com,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Julien Grall <julien@xen.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 10/11] arm/libxl: Emulated PCI device tree node in libxl
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <b81b5dea800c8fe47071f3dbd20588b1e472fb99.1633540842.git.rahul.singh@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
	<b81b5dea800c8fe47071f3dbd20588b1e472fb99.1633540842.git.rahul.singh@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Rahul Singh writes ("[PATCH v5 10/11] arm/libxl: Emulated PCI device tree node in libxl"):
> libxl will create an emulated PCI device tree node in the device tree to
> enable the guest OS to discover the virtual PCI during guest boot.
> Emulated PCI device tree node will only be created when there is any
> device assigned to guest.
> 
> A new area has been reserved in the arm guest physical map at
> which the VPCI bus is declared in the device tree (reg and ranges
> parameters of the node).

I think this series is targeted for 4.16.  Stefano drew this patch to
my attention.  I have read the thread on this patch and it is not
clear to me that it has converged.  Code freeze is imminent.

Is there some way I can help here ?

Ian.

