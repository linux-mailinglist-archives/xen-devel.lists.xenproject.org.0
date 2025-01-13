Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B99A0BE0E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 17:53:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870696.1281803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXNgu-0002qy-LT; Mon, 13 Jan 2025 16:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870696.1281803; Mon, 13 Jan 2025 16:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXNgu-0002pK-Iq; Mon, 13 Jan 2025 16:53:28 +0000
Received: by outflank-mailman (input) for mailman id 870696;
 Mon, 13 Jan 2025 16:53:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dy7G=UF=kernel.org=kbusch@srs-se1.protection.inumbo.net>)
 id 1tXNgt-0002oS-An
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 16:53:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e796bb56-d1ce-11ef-a0e1-8be0dac302b0;
 Mon, 13 Jan 2025 17:53:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 899D05C5455;
 Mon, 13 Jan 2025 16:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E09C4CED6;
 Mon, 13 Jan 2025 16:53:23 +0000 (UTC)
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
X-Inumbo-ID: e796bb56-d1ce-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736787204;
	bh=kkEPT9SH6eZSxMTtRu61LCsuirVhaWyNAb0QZt2aTH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ixZImuDhU4eqfLD1GOd+Zjv7VLJ7M/YVfr7gwJJHegOQeLRM933U4Vosc3YGea+4A
	 45gdLXXOqX5j1GsOYkQ3LdmYnLHuN6iuaUmB4QlFen3TbmizNgV2FdDbaKaHPxe6sd
	 NDcUsXQcn2G5RGFCC3sljs2Cj2js4Lh9o46OwU7uBkvmdR4TN6SzYp0WGhzuQF1P+8
	 A+Us5l3aw/CRsM5IOedIcUFk1AGYlx0ttQcuw8OPyVDlteDSP7X5DdpfqjsxUdiE5o
	 30+X5COU7WXCuaQKr8MgLEDIMIj6Zht56ZubuKHq/Agkb9dtaPNsx3ggXwHWXiichS
	 X/6HWeXngkBZQ==
Date: Mon, 13 Jan 2025 09:53:21 -0700
From: Keith Busch <kbusch@kernel.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?iso-8859-1?Q?Wilczy=B4nski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 2/3] vmd: disable MSI remapping bypass under Xen
Message-ID: <Z4VFAZnQ_09cdexm@kbusch-mbp>
References: <20250110140152.27624-3-roger.pau@citrix.com>
 <20250110222525.GA318386@bhelgaas>
 <Z4TlDhBNn8TMipdB@macbook.local>
 <Z4UtF737b3QFGnY0@kbusch-mbp>
 <Z4VDIPorOWD-FY-9@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4VDIPorOWD-FY-9@macbook.local>

On Mon, Jan 13, 2025 at 05:45:20PM +0100, Roger Pau Monné wrote:
> On Mon, Jan 13, 2025 at 08:11:19AM -0700, Keith Busch wrote:
> > On Mon, Jan 13, 2025 at 11:03:58AM +0100, Roger Pau Monné wrote:
> > > 
> > > Hm, OK, but isn't the limit 80 columns according to the kernel coding
> > > style (Documentation/process/coding-style.rst)?
> > 
> > That's the coding style. The commit message style is described in a
> > different doc:
> > 
> >   https://docs.kernel.org/process/submitting-patches.html#the-canonical-patch-format
> 
> It's quite confusing to have different line length for code vs commit
> messages, but my fault for not reading those. Will adjust to 75
> columns them.

The output of 'git log' prepends spaces to the subject and body of the
listed commits. The lower limit for commit messages vs. code makes the
change log look readable in an 80-char terminal.

