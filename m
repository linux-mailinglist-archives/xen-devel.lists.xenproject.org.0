Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B52760206B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 03:27:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424678.672284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okbNc-0004sQ-CJ; Tue, 18 Oct 2022 01:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424678.672284; Tue, 18 Oct 2022 01:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okbNc-0004pU-99; Tue, 18 Oct 2022 01:26:52 +0000
Received: by outflank-mailman (input) for mailman id 424678;
 Tue, 18 Oct 2022 01:26:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9K0G=2T=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1okbNb-0004pN-2H
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 01:26:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efb23eae-4e83-11ed-8fd0-01056ac49cbb;
 Tue, 18 Oct 2022 03:26:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5E180612F4;
 Tue, 18 Oct 2022 01:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF227C433D6;
 Tue, 18 Oct 2022 01:26:45 +0000 (UTC)
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
X-Inumbo-ID: efb23eae-4e83-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666056407;
	bh=T68CN2SGOaBpQNuMZfn7mBL9Zq41PiKYwHxZzpuuZRQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fWMyBqNDPxEMfzKCer3hc8hnYg8Lk9xRepw33WRjRSobJS3ZkNy4j2M+ytM3AHPgO
	 8nZX2q7JSxnhFwjUi29UzhNw/w0Ezeu5OHNVTajm2KF26i3cvC6kbUBPQWX/FPvITg
	 cPLO+kkx5cQmScEmOd1SbvFJT+YJjYs1eri2HUQaKpnhdjniSUGPOAtGT0EBIlo9E1
	 nMXiMDKfwdXP2NJQNgVLbVPOzba119X1a+s0A1Mwl1T94WMaHJ3Sm06Ca7+2Dv5L7k
	 SN3dVcGoAT8e4MbCyFnz93pRYPWwA2ycmdgh5DuUwQyGmJ4z6w1iybe3J4woIuGQus
	 1RjqNpjcKcrzw==
Date: Mon, 17 Oct 2022 18:26:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org, 
    stefano.stabellini@amd.com, Peter Maydell <peter.maydell@linaro.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
    "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
In-Reply-To: <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
Message-ID: <alpine.DEB.2.22.394.2210171345450.2351079@ubuntu-linux-20-04-desktop>
References: <20221015050750.4185-1-vikram.garhwal@amd.com> <20221015050750.4185-11-vikram.garhwal@amd.com> <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 16 Oct 2022, Julien Grall wrote:
> Hi,
> 
> There seem to be some missing patches on xen-devel (including the cover
> letter). Is that expected?
> 
> On 15/10/2022 06:07, Vikram Garhwal wrote:
> > Add a new machine xenpv which creates a IOREQ server to register/connect
> > with
> > Xen Hypervisor.
> 
> I don't like the name 'xenpv' because it doesn't convey the fact that some of
> the HW may be emulated rather than para-virtualized. In fact one may only want
> to use for emulating devices.
> 
> Potential name would be 'xen-arm' or re-using 'virt' but with 'accel=xen' to
> select a Xen layout.

The benefit of 'xenpv' is that it doesn't require any changes to libxl.
It is even backward compatible so it could be used with an older version
of Xen/libxl. Backward compatibility aside, if we come up with a
different name then we'll need changes to libxl and to manage those
changes. For instance, if we use 'xen-arm' that would mean we would need
to handle per-arch QEMU machine names.

