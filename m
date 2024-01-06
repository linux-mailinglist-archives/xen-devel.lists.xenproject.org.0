Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2F6825D91
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jan 2024 02:11:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662414.1032525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLvDn-0006P5-SW; Sat, 06 Jan 2024 01:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662414.1032525; Sat, 06 Jan 2024 01:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLvDn-0006Ls-OX; Sat, 06 Jan 2024 01:11:31 +0000
Received: by outflank-mailman (input) for mailman id 662414;
 Sat, 06 Jan 2024 01:11:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2yR=IQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rLvDm-0006Lk-80
 for xen-devel@lists.xenproject.org; Sat, 06 Jan 2024 01:11:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84e60213-ac30-11ee-98ef-6d05b1d4d9a1;
 Sat, 06 Jan 2024 02:11:29 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8AE7260C01;
 Sat,  6 Jan 2024 01:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88499C433C7;
 Sat,  6 Jan 2024 01:11:25 +0000 (UTC)
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
X-Inumbo-ID: 84e60213-ac30-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704503487;
	bh=JwGt2Wm5YFZdbLLMrkFQvX2Vojl2NToPOmw5snNCmfc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ocK4xScL+LQUD4JL/CevIlGQXP3toi4OnS83jJ49mW12S8Mw4pkf84S9gb4OBiIT7
	 rQtBKI84m5Bp1klnjJWXFul9kcSfiedab0cmdEgXxeeriU1z3TEzdnvFcnV4wtOBcz
	 h7tt25WDvRZ3ycUKanpo8cg1e9ZG8YpmCZXg7Cei5YakwEWOdlNUzZjnsjgXn4pT2h
	 F1b/oiHJ1zOVsWDOf+nMrh2uqcA9k7MUbZfHcIGYEJM54G8697yRryZoODq8FTMGtr
	 bbhg8gmnlerqeN9bqHEP2C1IdlKReKFA3Ejy7PHH0hDs+AjyeOJzZKHHVRjMhrsSw/
	 cWkhsSVGyaB3Q==
Date: Fri, 5 Jan 2024 17:11:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiqian Chen <Jiqian.Chen@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Huang Rui <Ray.Huang@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC XEN PATCH v4 5/5] libxl: Use gsi instead of irq for mapping
 pirq
In-Reply-To: <20240105070920.350113-6-Jiqian.Chen@amd.com>
Message-ID: <alpine.DEB.2.22.394.2401051711160.3675@ubuntu-linux-20-04-desktop>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com> <20240105070920.350113-6-Jiqian.Chen@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Jan 2024, Jiqian Chen wrote:
> In PVH dom0, it uses the linux local interrupt mechanism,
> when it allocs irq for a gsi, it is dynamic, and follow
> the principle of applying first, distributing first. And
> the irq number is alloced from small to large, but the
> applying gsi number is not, may gsi 38 comes before gsi
> 28, that causes the irq number is not equal with the gsi
> number. And when passthrough a device, xl wants to use
> gsi to map pirq, see pci_add_dm_done->xc_physdev_map_pirq,
> but the gsi number is got from file
> /sys/bus/pci/devices/<sbdf>/irq in current code, so it
> will fail when mapping.
> 
> So, use real gsi number read from gsi sysfs.
> 
> Co-developed-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


