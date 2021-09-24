Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6287E417BE1
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 21:42:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195626.348402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTr5P-0003OP-3R; Fri, 24 Sep 2021 19:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195626.348402; Fri, 24 Sep 2021 19:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTr5P-0003M8-0H; Fri, 24 Sep 2021 19:42:19 +0000
Received: by outflank-mailman (input) for mailman id 195626;
 Fri, 24 Sep 2021 19:42:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTr5N-0003M2-Ai
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 19:42:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8595dd97-1d6f-11ec-bb18-12813bfff9fa;
 Fri, 24 Sep 2021 19:42:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA0D961050;
 Fri, 24 Sep 2021 19:42:15 +0000 (UTC)
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
X-Inumbo-ID: 8595dd97-1d6f-11ec-bb18-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632512535;
	bh=E4zyvvlfShrWcO7DtJukosxn9xc084kCbr2MI8bzreI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ml1eqjyZqGrBv1twWNvzhVMjKJBGjSoLX6/sb/0iIUMCJmGtR1/1G5zqSYAMb/M9/
	 TMz5JxujUAF90EOJXMVB2OFIrK1DGj++LicU68wUwEWd4OF+jGOSSs+MfDcjJVapZX
	 hiw7jPCGA8oxJ1UfeBPIL1QuScU3ScrjVkigfu7/aiMEq0P3R8HXlsM3MMmy87l0GR
	 OeelQE+mC3cfsaEQuaQG4QPN3Qm/84OuBCiphw+qeh+ojCg5zvrvZrMlUba5YHKbOw
	 zcnUwJVdcIDQZmLWtWa+3d+R7TBEMq8v+aLz5CsSBnxLv6mSkBSK0gqCYx9Eid7BEr
	 i7uYag1scoKng==
Date: Fri, 24 Sep 2021 12:42:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <Wei.Chen@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 32/37] xen/arm: unified entry to parse all NUMA data from
 device tree
In-Reply-To: <DB9PR08MB6857E6B6BDE4D55F7D468DDF9EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2109241239450.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-33-wei.chen@arm.com> <alpine.DEB.2.21.2109232007160.17979@sstabellini-ThinkPad-T480s> <DB9PR08MB6857E6B6BDE4D55F7D468DDF9EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2011522536-1632512535=:17979"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2011522536-1632512535=:17979
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 24 Sep 2021, Wei Chen wrote:
> > -----Original Message-----
> > From: Stefano Stabellini <sstabellini@kernel.org>
> > Sent: 2021年9月24日 11:17
> > To: Wei Chen <Wei.Chen@arm.com>
> > Cc: xen-devel@lists.xenproject.org; sstabellini@kernel.org; julien@xen.org;
> > Bertrand Marquis <Bertrand.Marquis@arm.com>
> > Subject: Re: [PATCH 32/37] xen/arm: unified entry to parse all NUMA data
> > from device tree
> > 
> > On Thu, 23 Sep 2021, Wei Chen wrote:
> > > In this API, we scan whole device tree to parse CPU node id, memory
> >           ^ function   ^ the whole
> > 
> > > node id and distance-map. Though early_scan_node will invoke has a
> > > handler to process memory nodes. If we want to parse memory node id
> > > in this handler, we have to embeded NUMA parse code in this handler.
> >                               ^ embed
> > 
> > > But we still need to scan whole device tree to find CPU NUMA id and
> > > distance-map. In this case, we include memory NUMA id parse in this
> > > API too. Another benefit is that we have a unique entry for device
> >   ^ function
> > 
> > > tree NUMA data parse.
> > 
> > Ah, that's the explanation I was asking for earlier!
> > 
> 
> The question about device_tree_get_meminfo?

Yes, it would be nice to reuse process_memory_node if we can, but I
understand if we cannot.
--8323329-2011522536-1632512535=:17979--

