Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B1A2C2A10
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 15:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36488.68407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khZbh-0007jk-SS; Tue, 24 Nov 2020 14:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36488.68407; Tue, 24 Nov 2020 14:47:49 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khZbh-0007jL-Oi; Tue, 24 Nov 2020 14:47:49 +0000
Received: by outflank-mailman (input) for mailman id 36488;
 Tue, 24 Nov 2020 14:47:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LHIe=E6=kernel.org=gustavoars@srs-us1.protection.inumbo.net>)
 id 1khZbg-0007jF-6n
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:47:48 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bccb16a-82ea-4b23-bf36-ab9ac33553d3;
 Tue, 24 Nov 2020 14:47:47 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A5073206F9;
 Tue, 24 Nov 2020 14:47:38 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=LHIe=E6=kernel.org=gustavoars@srs-us1.protection.inumbo.net>)
	id 1khZbg-0007jF-6n
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:47:48 +0000
X-Inumbo-ID: 8bccb16a-82ea-4b23-bf36-ab9ac33553d3
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8bccb16a-82ea-4b23-bf36-ab9ac33553d3;
	Tue, 24 Nov 2020 14:47:47 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A5073206F9;
	Tue, 24 Nov 2020 14:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606229266;
	bh=KHWIOvsVxIgxzJ3ANvrXr+IcifXvCH3d9eC+5p4MJwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWoPDQgvsKVPCfxibPNl9c0zBQ9NfBrnsDyv8UIAtPJxHLfF4o1CuP3vwUt19y/P8
	 Y66kkjj2Cim4kMyRQiiYzb1whNr+v/N+nMKfcHqv3RaX8mBnUDrFmNddDbw9/dIVnH
	 xirANyC4hb8bYXXRvxw8qG9eYp8JWf8UX9D38PQM=
Date: Tue, 24 Nov 2020 08:47:54 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-sctp@vger.kernel.org,
	Nathan Chancellor <natechancellor@gmail.com>,
	linux-hardening@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-block@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	bridge@lists.linux-foundation.org, GR-Linux-NIC-Dev@marvell.com,
	rds-devel@oss.oracle.com, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, wcn36xx@lists.infradead.org,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
	reiserfs-devel@vger.kernel.org, oss-drivers@netronome.com,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	virtualization@lists.linux-foundation.org,
	Joe Perches <joe@perches.com>, patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-cifs@vger.kernel.org, coreteam@netfilter.org,
	Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-scsi@vger.kernel.org, linux-afs@lists.infradead.org,
	netfilter-devel@vger.kernel.org, linux-geode@lists.infradead.org,
	drbd-dev@lists.linbit.com, linux-ext4@vger.kernel.org,
	linux-hams@vger.kernel.org, target-devel@vger.kernel.org,
	samba-technical@lists.samba.org,
	tipc-discussion@lists.sourceforge.net,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org, linux-input@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, linux-nfs@vger.kernel.org,
	devel@driverdev.osuosl.org, selinux@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net, linux-iio@vger.kernel.org,
	linux-i3c@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>,
	linux-can@vger.kernel.org, linux-integrity@vger.kernel.org,
	GR-everest-linux-l2@marvell.com, keyrings@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, linux-usb@vger.kernel.org,
	nouveau@lists.freedesktop.org, x86@kernel.org,
	xen-devel@lists.xenproject.org, linux-mm@kvack.org,
	cluster-devel@redhat.com, linux1394-devel@lists.sourceforge.net,
	linux-decnet-user@lists.sourceforge.net,
	op-tee@lists.trustedfirmware.org, linux-ide@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org,
	dm-devel@redhat.com, linux-watchdog@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-mtd@lists.infradead.org,
	ceph-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-fbdev@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
Message-ID: <20201124144754.GL16084@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <160616392671.21180.16517492185091399884.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160616392671.21180.16517492185091399884.b4-ty@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Mon, Nov 23, 2020 at 08:38:46PM +0000, Mark Brown wrote:
> On Fri, 20 Nov 2020 12:21:39 -0600, Gustavo A. R. Silva wrote:
> > This series aims to fix almost all remaining fall-through warnings in
> > order to enable -Wimplicit-fallthrough for Clang.
> > 
> > In preparation to enable -Wimplicit-fallthrough for Clang, explicitly
> > add multiple break/goto/return/fallthrough statements instead of just
> > letting the code fall through to the next case.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
> 
> Thanks!
> 
> [1/1] regulator: as3722: Fix fall-through warnings for Clang
>       commit: b52b417ccac4fae5b1f2ec4f1d46eb91e4493dc5

Thank you, Mark.
--
Gustavo

