Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685504B29E1
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 17:14:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270602.464946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIYYo-0002NJ-VT; Fri, 11 Feb 2022 16:14:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270602.464946; Fri, 11 Feb 2022 16:14:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIYYo-0002Kx-SN; Fri, 11 Feb 2022 16:14:14 +0000
Received: by outflank-mailman (input) for mailman id 270602;
 Fri, 11 Feb 2022 16:14:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SRLR=S2=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1nIYYn-0002Kn-6L
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 16:14:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4e1d34f-8b55-11ec-8f75-fffcc8bd4f1a;
 Fri, 11 Feb 2022 17:14:10 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 375CF60F0B;
 Fri, 11 Feb 2022 16:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45745C340E9;
 Fri, 11 Feb 2022 16:14:08 +0000 (UTC)
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
X-Inumbo-ID: a4e1d34f-8b55-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644596048;
	bh=XREO/vHXAOv2lzh893fJ6xMwvKK3WUm+gggcHq0vKp0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=LXLOGAMvDQ33vZawEwa4mVqilZaLr10bwMntw+1iw3exUxZInn2n/T9lrXNvNwrrL
	 0zxjqbjSHBCvX5Qf/cjMnNasn7nEMRR6XIJlozJLOgdvuQwBY5faHSO0ChxR4eM8Y2
	 Zb6Oy7q//i9FNdhShP5ZSQz2qE8becZOH4isLfLfrKnILrOlYCAB2uBFl2KKgPeTgG
	 6EeD25WCeAFQxCoTM4QE4eEV+MDz/TmCDoH7jyJ+Avnl/WwyFcfKdWStIOKZwZODnS
	 V/r3Ep9MHnCnA9v5b6Gi912vRAnBdCEghvLpcTguoxK28EN7NWcraUkB1tW8BWyfEi
	 vH8CM9fS9dRlw==
Date: Fri, 11 Feb 2022 10:14:06 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Josef Johansson <josef@oderland.se>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	xen-devel <xen-devel@lists.xenproject.org>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH] PCI/MSI: msix_setup_msi_descs: Restore logic for
 msi_attrib.can_mask
Message-ID: <20220211161406.GA714343@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69d705f3-8e0d-31b7-9a80-4413b8dbe7a3@oderland.se>

On Fri, Feb 11, 2022 at 01:10:22AM +0100, Josef Johansson wrote:
> On 2/11/22 00:55, Bjorn Helgaas wrote:
> > On Sat, Jan 22, 2022 at 02:10:01AM +0100, Josef Johansson wrote:
> >> From: Josef Johansson <josef@oderland.se>
> >>
> >> PCI/MSI: msix_setup_msi_descs: Restore logic for msi_attrib.can_mask
> > Please match the form and style of previous subject lines (in
> > particular, omit "msix_setup_msi_descs:").
> Would this subject suffice?
> PCI/MSI: Correct use of can_mask in msi_add_msi_desc()

Looks good to me!

Bjorn

