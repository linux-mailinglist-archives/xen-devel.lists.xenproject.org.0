Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E387FE7B6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 04:38:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644386.1005296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Xsu-0001Xr-1J; Thu, 30 Nov 2023 03:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644386.1005296; Thu, 30 Nov 2023 03:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Xst-0001VM-Ur; Thu, 30 Nov 2023 03:38:39 +0000
Received: by outflank-mailman (input) for mailman id 644386;
 Thu, 30 Nov 2023 03:38:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8Xss-0001VG-Hg
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 03:38:38 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f120a32f-8f31-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 04:38:37 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EB4F7CE1F29;
 Thu, 30 Nov 2023 03:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60389C433C7;
 Thu, 30 Nov 2023 03:38:30 +0000 (UTC)
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
X-Inumbo-ID: f120a32f-8f31-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701315512;
	bh=GWXNKCoRnBbU4oQqwsz5WdqR6hMVIH5wCFVkS26DkZE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pKXnezyHy99g0xmIMvjtuA/yM8N9+EYg1tCznTIRMa2J0Yt4Fbxo0XOwzheNLdyDQ
	 9a52mji0Or5DjQH2SrBZwT/vQiGZegUOgfHnqQJqjomgCkzIlWDl5Dm1eOUauBR3HZ
	 XPlrOr2B/9MY2BLF2cqRkZyVYwcrgt7IgeHe1r+X7i+lMRvXwkQb1U1kGapPhnHjuX
	 A5w/r6RoRXddvs25BIHKCD9yhW1ibuKzGGoE4Anm5czs2RMAIyWAR7K5FdyyJC4+l6
	 uPNbR1AhERAVByh9ria3l5KRWLO62uFON2qgprTh8QiHQGESYLDTNGPb79xx9P+IR5
	 aahp6Xlo7m5bg==
Date: Wed, 29 Nov 2023 19:38:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Jiqian Chen <Jiqian.Chen@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Alex Deucher <Alexander.Deucher@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Huang Rui <Ray.Huang@amd.com>, Honglei Huang <Honglei1.Huang@amd.com>, 
    Julia Zhang <Julia.Zhang@amd.com>
Subject: Re: [RFC XEN PATCH v2 3/3] tools: Add new function to get gsi from
 irq
In-Reply-To: <ZWX4R9UEE6oXiqaz@macbook>
Message-ID: <alpine.DEB.2.22.394.2311291937170.3533093@ubuntu-linux-20-04-desktop>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com> <20231124104136.3263722-4-Jiqian.Chen@amd.com> <ZWX4R9UEE6oXiqaz@macbook>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1534059129-1701315511=:3533093"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1534059129-1701315511=:3533093
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 28 Nov 2023, Roger Pau Monné wrote:
> On Fri, Nov 24, 2023 at 06:41:36PM +0800, Jiqian Chen wrote:
> > In PVH dom0, it uses the linux local interrupt mechanism,
> > when it allocs irq for a gsi, it is dynamic, and follow
> > the principle of applying first, distributing first. And
> > if you debug the kernel codes, you will find the irq
> > number is alloced from small to large, but the applying
> > gsi number is not, may gsi 38 comes before gsi 28, that
> > causes the irq number is not equal with the gsi number.
> > And when we passthrough a device, QEMU will use its gsi
> > number to do mapping actions, see xen_pt_realize->
> > xc_physdev_map_pirq, but the gsi number is got from file
> > /sys/bus/pci/devices/xxxx:xx:xx.x/irq in current code,
> > so it will fail when mapping.
> > And in current codes, there is no method to translate
> > irq to gsi for userspace.
> 
> I think it would be cleaner to just introduce a new sysfs node that
> contains the gsi if a device is using one (much like the irq sysfs
> node)?
> 
> Such ioctl to translate from IRQ to GSI has nothing to do with Xen, so
> placing it in privcmd does seem quite strange to me.  I understand
> that for passthrough we need the GSI, but such translation layer from
> IRQ to GSI is all Linux internal, and it would be much simpler to just
> expose the GSI in sysfs IMO.

Maybe something to add to drivers/xen/sys-hypervisor.c in Linux.
Juergen what do you think?
--8323329-1534059129-1701315511=:3533093--

