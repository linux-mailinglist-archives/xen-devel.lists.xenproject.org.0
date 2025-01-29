Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74360A21DE5
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 14:33:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879159.1289379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td8Bf-0006HE-Ry; Wed, 29 Jan 2025 13:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879159.1289379; Wed, 29 Jan 2025 13:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td8Bf-0006Eb-Og; Wed, 29 Jan 2025 13:32:59 +0000
Received: by outflank-mailman (input) for mailman id 879159;
 Wed, 29 Jan 2025 13:32:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CGF7=UV=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1td8Bd-0006EV-JD
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 13:32:57 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bcd1b84-de45-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 14:32:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0BFBEA4199A;
 Wed, 29 Jan 2025 13:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D71C4CED3;
 Wed, 29 Jan 2025 13:32:54 +0000 (UTC)
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
X-Inumbo-ID: 8bcd1b84-de45-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738157574;
	bh=Oj1ZVJfnXAYooWc8hOhsJbc/6YWDuBpD07JCgUIgQDI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ER6EE5lEstGLOFLOhrOEHtH6rntIFrgDIMN1DNORpww68H/ycR4TEz1rI7+79XuIo
	 aHC+ivPaam3BB+Jvaan3QqFydC9knTEJmIUqUbNaHSVvmwe2sdaJ8ySeTyGoWCSsKr
	 SY2LA5gghaI61hwBPoxbHbLbYl1L05Azl+6gom1EZO5+fkinCspr2cO0MR6r3LspIX
	 Q/3e1uqmM1P4t82Og8dij20d3qLF7dEaTSyrxN9B5ql5cuOS22SJvLUR4wsjoMKBhW
	 EqJU97GBj9KeW4UUo6yPiEahGWtwkL2P5/L9fkMwE1/ph2nSooJKL8NMHJbTcUI5Kf
	 V2g2Cc46V6YVg==
Date: Wed, 29 Jan 2025 07:32:52 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
Message-ID: <20250129133252.GA451735@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5mk0K5xltK6iZXN@mail-itl>

On Wed, Jan 29, 2025 at 04:47:28AM +0100, Marek Marczykowski-Górecki wrote:
> On Tue, Jan 28, 2025 at 09:40:18PM -0600, Bjorn Helgaas wrote:
> > I guess the code at [2] is running in user mode and uses Linux
> > syscalls for config access?  Is it straceable?
> 
> Nope, it's running as the hypervisor and mediates Linux's access to the
> hardware. In fact, Linux PV kernel (which dom0 is by default under Xen)
> is running in ring 3...
> 
> But I can add some more logging there.

So I guess the hypervisor performs the config access on behalf of the
Linux PV kernel?  Obviously Linux thinks CRS/RRS SV is enabled, but I
suppose all the lspci output is similarly based on whatever the
hypervisor does, so how do we know the actual hardware config?

> > > [2] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/x86/pv/emul-priv-op.c;h=70150c27227661baa253af8693ff00f2ab640a98;hb=HEAD#l295

