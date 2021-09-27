Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8904419278
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 12:48:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196699.349637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUoBD-00032r-Qf; Mon, 27 Sep 2021 10:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196699.349637; Mon, 27 Sep 2021 10:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUoBD-000312-NW; Mon, 27 Sep 2021 10:48:15 +0000
Received: by outflank-mailman (input) for mailman id 196699;
 Mon, 27 Sep 2021 10:48:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUoBB-00030v-R5
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 10:48:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUoBB-0005qB-PF
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 10:48:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUoBB-0006eq-OI
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 10:48:13 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mUoB6-0005b9-Vi; Mon, 27 Sep 2021 11:48:09 +0100
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
	bh=/w8eoH0CeKNEKy0FozyUDDGo5ckoS7P2jALjS6lX9BU=; b=i59kD1bBsMHHTMoLTsV4NrY3Qo
	91bEhzn2i3gxpm3zvGGYoCdCIrzK+g4ekJsTZO5nyoyFL2+/3prbyOmQCjlv51Okv0clMcCOHDybI
	9oAycTII0+HfiBMOY1PaAbrWN9ZIJVgRIlxOLuddjoHoXCol9/v/3epYQCarGVLOleMY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24913.41320.660005.549137@mariner.uk.xensource.com>
Date: Mon, 27 Sep 2021 11:48:08 +0100
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>,
    xen-devel@lists.xenproject.org,
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
    Ian Jackson <iwj@xenproject.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Julien Grall <julien@xen.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V3 3/3] libxl/arm: Add handling of extended regions for
 DomU
In-Reply-To: <alpine.DEB.2.21.2109241614300.17979@sstabellini-ThinkPad-T480s>
References: <1632437334-12015-1-git-send-email-olekstysh@gmail.com>
	<1632437334-12015-4-git-send-email-olekstysh@gmail.com>
	<alpine.DEB.2.21.2109241614300.17979@sstabellini-ThinkPad-T480s>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Stefano Stabellini writes ("Re: [PATCH V3 3/3] libxl/arm: Add handling of extended regions for DomU"):
> On Fri, 24 Sep 2021, Oleksandr Tyshchenko wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
...
> > Suggested-by: Julien Grall <jgrall@amazon.com>
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Ian Jackson <iwj@xenproject.org>

