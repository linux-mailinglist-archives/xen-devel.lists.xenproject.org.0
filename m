Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 772A642F52F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 16:24:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210721.367700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbO8E-0002Z6-4J; Fri, 15 Oct 2021 14:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210721.367700; Fri, 15 Oct 2021 14:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbO8D-0002XF-W1; Fri, 15 Oct 2021 14:24:21 +0000
Received: by outflank-mailman (input) for mailman id 210721;
 Fri, 15 Oct 2021 14:24:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbO8C-0002Wu-BC
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 14:24:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbO8C-000668-AT
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 14:24:20 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbO8C-0002Kk-9T
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 14:24:20 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mbO88-0005zX-Ur; Fri, 15 Oct 2021 15:24:16 +0100
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
	bh=VkbAhtOJmjXzxQaBvElNv6fF0jwKgNywHiUd5hmNz0c=; b=toruvAnkIcof9pJVico6r4Y/TK
	j/bzUt5YisUx2LKIIyrj7zIN5F3h5Txj2TNRcjqWldeNhuvBFBZr/9jwUWe9lkvJo+2Kuv/n74Lz/
	sfCeN4DzxacZhgfkL83ZN/V10MIXdyppfkixr2NZpsGmLixA33453DGw9SyVMcBE5wvI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24937.36624.694770.174303@mariner.uk.xensource.com>
Date: Fri, 15 Oct 2021 15:24:16 +0100
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org,
    Rahul Singh <rahul.singh@arm.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Julien Grall <julien@xen.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Michal Orzel <michal.orzel@arm.com>
Subject: Re: [PATCH v7 5/5] arm/libxl: Emulated PCI device tree node in libxl
In-Reply-To: <4a22121e6474adfb1c5166e0fdaddff47c6dae46.1634305870.git.bertrand.marquis@arm.com>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
	<4a22121e6474adfb1c5166e0fdaddff47c6dae46.1634305870.git.bertrand.marquis@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Bertrand Marquis writes ("[PATCH v7 5/5] arm/libxl: Emulated PCI device tree node in libxl"):
> From: Rahul Singh <rahul.singh@arm.com>
> 
> libxl will create an emulated PCI device tree node in the device tree to
> enable the guest OS to discover the virtual PCI during guest boot.
> Emulated PCI device tree node will only be created when there is any
> device assigned to guest.
> 
> A new area has been reserved in the arm guest physical map at
> which the VPCI bus is declared in the device tree (reg and ranges
> parameters of the node).
> 
> Note that currently we are using num_pcidevs instead of
> c_info->passthrough to decide whether to create a vPCI DT node.
> This will be insufficient if and when ARM does PCI hotplug.
> Add this note inside libxl_create.c where c_info->passthrough
> is set.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

This looks good to me.  I will ack it when it has an ARM R-b.

Thanks,
Ian.

