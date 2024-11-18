Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF799D158A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 17:42:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839417.1255221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD4p7-0003pH-OJ; Mon, 18 Nov 2024 16:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839417.1255221; Mon, 18 Nov 2024 16:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD4p7-0003mb-LF; Mon, 18 Nov 2024 16:42:01 +0000
Received: by outflank-mailman (input) for mailman id 839417;
 Mon, 18 Nov 2024 16:41:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5+n=SN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tD4p5-0003mV-J7
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 16:41:59 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 038560ee-a5cc-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 17:41:53 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 181C1A414B1;
 Mon, 18 Nov 2024 16:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50643C4CECC;
 Mon, 18 Nov 2024 16:41:50 +0000 (UTC)
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
X-Inumbo-ID: 038560ee-a5cc-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjAzODU2MGVlLWE1Y2MtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTQ4MTEzLjE2Nzk2OCwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731948111;
	bh=bCf7fiRI6lW2g8Sk5Ve5Qf35LSQ1B+VdS63ry7RdOkg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o042xmr3NU7PimitbnLVDzDr+EqO9eww6sTIAraDfAQI5ejtyIgqjFEo/7B/k5HyP
	 j0x5DMWTZUdNyHcdeB+GLrc2qLiFrie2QcuGzzMbYqRAqymkdRGYzYXP/y1GWHbnxl
	 3vOHMIQaE3yPQXR9nWGnM4AXUenw2IP/Unp+DFuU+I1vacX7S4ll252d5R07V8lYdq
	 vo/RxKfeuFzF+VGd76peYJokSrSXEWSTu3/RzW1ODrrwPYMrzKGavMPfRuO1lBsuAH
	 mpJladfgVBHXd5a2clfJSJfY9UPwuhHrPW4j6japIGkB2xeMX22fAYszzGMbhMI9df
	 c8LRSJV58KrvQ==
Date: Mon, 18 Nov 2024 08:41:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Jiqian Chen <Jiqian.Chen@amd.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
In-Reply-To: <ZzsUL3dnjl5x0-si@macbook>
Message-ID: <alpine.DEB.2.22.394.2411180841120.1160299@ubuntu-linux-20-04-desktop>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com> <ZzsUL3dnjl5x0-si@macbook>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-892777895-1731948111=:1160299"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-892777895-1731948111=:1160299
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 18 Nov 2024, Roger Pau Monné wrote:
> On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
> > Some devices, like discrete GPU of amd, support resizable bar capability,
> > but vpci of Xen doesn't support this feature, so they fail to resize bars
> > and then cause probing failure.
> > 
> > According to PCIe spec, each bar that support resizing has two registers,
> > PCI_REBAR_CAP and PCI_REBAR_CTRL, so add these two registers and their
> > corresponding handler into vpci.
> > 
> > PCI_REBAR_CAP is RO, only provide reading.
> > 
> > PCI_REBAR_CTRL only has bar size is RW, so add write function to support
> > setting the new size.
> > 
> > Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> > ---
> >  xen/drivers/vpci/Makefile  |  2 +-
> >  xen/drivers/vpci/rebar.c   | 89 ++++++++++++++++++++++++++++++++++++++
> >  xen/include/xen/pci_regs.h | 11 +++++
> >  3 files changed, 101 insertions(+), 1 deletion(-)
> >  create mode 100644 xen/drivers/vpci/rebar.c
> > 
> > diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
> > index 1a1413b93e76..a7c8a30a8956 100644
> > --- a/xen/drivers/vpci/Makefile
> > +++ b/xen/drivers/vpci/Makefile
> > @@ -1,2 +1,2 @@
> > -obj-y += vpci.o header.o
> > +obj-y += vpci.o header.o rebar.o
> >  obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
> > diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
> > new file mode 100644
> > index 000000000000..84dbd84b0745
> > --- /dev/null
> > +++ b/xen/drivers/vpci/rebar.c
> > @@ -0,0 +1,89 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> 
> The GPL-2.0 identifier is deprecated, either use GPL-2.0-or-later or
> GPL-2.0-only.

GPL-2.0 is meant to be GPL-2.0-only
--8323329-892777895-1731948111=:1160299--

