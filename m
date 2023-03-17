Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 308FB6BDDE7
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 02:06:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510848.789318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcyX8-0004NZ-H2; Fri, 17 Mar 2023 01:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510848.789318; Fri, 17 Mar 2023 01:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcyX8-0004L3-EG; Fri, 17 Mar 2023 01:05:26 +0000
Received: by outflank-mailman (input) for mailman id 510848;
 Fri, 17 Mar 2023 01:05:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGfD=7J=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pcyX7-0004Kx-9p
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 01:05:25 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cac43cd0-c45f-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 02:05:23 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9DB02B819C2;
 Fri, 17 Mar 2023 01:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9122DC433EF;
 Fri, 17 Mar 2023 01:05:19 +0000 (UTC)
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
X-Inumbo-ID: cac43cd0-c45f-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679015120;
	bh=wXarWTQB5juKEoZnevct5mEUQxDsKZpOONGwotVBXOk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l9l93fzhuTjTV2LavV2CSJ7+BrI4BCCKDFt/50eOVTJtBVrePVEyx5qULd3IJAIv3
	 ckSzrc3z7Oxxr+GCgIaS5/CUhn0t1hWIwr4ggHyA1t6LBefKPMw3Pb0Vwh4v0rIxaU
	 aNRgt/iSrLU4OHgyC3Nll8L7A8n/3I9jjFFOjcWSvqx2wYBD82lSAdPUGc2UCkXiSO
	 io/G1biTwcc4nKCV8tSrDNzWiTuFmgGSrP2Z4wNr2babxNGFh0dMHRxWmyjTNIrAyT
	 H2kfcbdoBHaiHu12i0ARuwZ6C4lnfVl68TnHCVjhgfjrUgTiPLnkCWKqBf9M8n/jaS
	 bD27A8H15kT5g==
Date: Thu, 16 Mar 2023 18:05:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: "jiamei.xie" <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org, 
    wei.chen@arm.com, sstabellini@kernel.org
Subject: Re: [ImageBuilder][PATCH v2 1/2] uboot-script-gen: Add
 XEN_STATIC_HEAP
In-Reply-To: <63acdfc4-74a3-7db5-ddfe-04e7e20ea464@amd.com>
Message-ID: <alpine.DEB.2.22.394.2303161805080.3359@ubuntu-linux-20-04-desktop>
References: <20230316090921.338472-1-jiamei.xie@arm.com> <20230316090921.338472-2-jiamei.xie@arm.com> <63acdfc4-74a3-7db5-ddfe-04e7e20ea464@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Mar 2023, Michal Orzel wrote:
> On 16/03/2023 10:09, jiamei.xie wrote:
> > From: jiamei Xie <jiamei.xie@arm.com>
> > 
> > Add a new config parameter to configure Xen static heap.
> > XEN_STATIC_HEAP="baseaddr1 size1 ... baseaddrN sizeN"
> > if specified, indicates the host physical address regions
> > [baseaddr, baseaddr + size) to be reserved as Xen static heap.
> > 
> > For instance, XEN_STATIC_HEAP="0x50000000 0x30000000", if specified,
> > indicates the host memory region starting from paddr 0x50000000
> > with a size of 0x30000000 to be reserved as static heap.
> > 
> > Signed-off-by: jiamei Xie <jiamei.xie@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

