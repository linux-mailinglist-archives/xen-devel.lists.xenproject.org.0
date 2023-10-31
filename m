Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 892CC7DC37E
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 01:20:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625448.974731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxcTw-0000Po-F8; Tue, 31 Oct 2023 00:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625448.974731; Tue, 31 Oct 2023 00:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxcTw-0000O2-CS; Tue, 31 Oct 2023 00:19:44 +0000
Received: by outflank-mailman (input) for mailman id 625448;
 Tue, 31 Oct 2023 00:19:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YC+N=GN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qxcTu-0000Nu-QE
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 00:19:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e051fb9-7783-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 01:19:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B44B660C41;
 Tue, 31 Oct 2023 00:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9325EC433C8;
 Tue, 31 Oct 2023 00:19:37 +0000 (UTC)
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
X-Inumbo-ID: 2e051fb9-7783-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698711578;
	bh=KqntrI6yWULYOqoFYjP2QovNdDJFLeRx3oez/l6mcTI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mObPa0r3sINbGo40LsSc7nvHUNR3hXs+ZjXhViF1YCKoPuxBTiEZSVviCUHutX4d5
	 CJsTyR2gHbHVBhH+cFfWuKteME8CgZY37/s1sqDWtSns9uPJEX6iKd++/QHzuCS44K
	 vGOesldheWZUdadPb8Ti2z8WfupkrRH2dCWfZdVijuklRAXvrFPmVuljx6eHkEL1NU
	 uViFD8uqf+VZPbfWxtkod6niVIJ8d5m7FyTRp8zdBC6YQPXiLWCNWNc3DR7JsvbW5P
	 hhVL579HWUOoP+I2a60Mm1vhfuP3WVAZ9gbzoNIerRCxBHqDk4j/TL4W8zTt3cJD2t
	 lrN8t12dY0fcg==
Date: Mon, 30 Oct 2023 17:19:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: linux-kernel@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH] xen/events: avoid using info_for_irq() in
 xen_send_IPI_one()
In-Reply-To: <20231030142732.1702-1-jgross@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310301719300.1625118@ubuntu-linux-20-04-desktop>
References: <20231030142732.1702-1-jgross@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Oct 2023, Juergen Gross wrote:
> xen_send_IPI_one() is being used by cpuhp_report_idle_dead() after
> it calls rcu_report_dead(), meaning that any RCU usage by
> xen_send_IPI_one() is a bad idea.
> 
> Unfortunately xen_send_IPI_one() is using notify_remote_via_irq()
> today, which is using irq_get_chip_data() via info_for_irq(). And
> irq_get_chip_data() in turn is using a maple-tree lookup requiring
> RCU.
> 
> Avoid this problem by caching the ipi event channels in another
> percpu variable, allowing the use notify_remote_via_evtchn() in
> xen_send_IPI_one().
> 
> Fixes: 721255b9826b ("genirq: Use a maple tree for interrupt descriptor management")
> Reported-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Tested-by: David Woodhouse <dwmw@amazon.co.uk>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

