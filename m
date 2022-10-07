Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D8E5F723C
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 02:24:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417307.661959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogb9T-0005J9-W4; Fri, 07 Oct 2022 00:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417307.661959; Fri, 07 Oct 2022 00:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogb9T-0005Gv-Rp; Fri, 07 Oct 2022 00:23:43 +0000
Received: by outflank-mailman (input) for mailman id 417307;
 Fri, 07 Oct 2022 00:23:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FwH6=2I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ogb9R-0005Gp-Vt
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 00:23:41 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a28da7f-45d6-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 02:23:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 43350B821ED;
 Fri,  7 Oct 2022 00:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5011DC433C1;
 Fri,  7 Oct 2022 00:23:36 +0000 (UTC)
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
X-Inumbo-ID: 4a28da7f-45d6-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665102217;
	bh=Et26OS3EyRmy77qPfsgsF4rcn/zFt1wMAuvka68v87U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HqwJ3XEQ4nYbxIa9HgoA/a7H7BKi8YZZgdoGyWU0p1t3yobUxFminM/Nmzhx7DtWE
	 g4/UdyCL2b9YXIq1ufshqRbgzCmpCujqe7CRjCh91WSJLx7henkuE10iQE7vtgo6dY
	 zXDO45zb0YclllssCxvKoeyufx+tocHyVs+cx5lHeQDZFeRQQemgF3IhCiEVamV9eb
	 30YVr2Fmf1Z5khqxrznRy+C9swz/2Uk6a+pB/9IU/kZEA5U0wrm3KfX3vE/FqKy2dN
	 m4Wu2Qgb5t2q7Loz10eQPfMmSYbNs4gVT67zOGi6UmnKvwcr1VkpAQAojRkD2jRt1o
	 qzNf6xBnqQqUg==
Date: Thu, 6 Oct 2022 17:23:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
cc: Juergen Gross <jgross@suse.com>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] xen/virtio: restructure xen grant dma setup
In-Reply-To: <a8482a7b-0d89-861d-bc87-632d3230c173@epam.com>
Message-ID: <alpine.DEB.2.22.394.2210061723240.3690179@ubuntu-linux-20-04-desktop>
References: <20221006071500.15689-1-jgross@suse.com> <20221006071500.15689-2-jgross@suse.com> <a8482a7b-0d89-861d-bc87-632d3230c173@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Oct 2022, Oleksandr Tyshchenko wrote:
> On 06.10.22 10:14, Juergen Gross wrote:
> 
> Hello Juergen
> 
> > In order to prepare supporting other means than device tree for
> > setting up virtio devices under Xen, restructure the functions
> > xen_is_grant_dma_device() and xen_grant_setup_dma_ops() a little bit.
> >
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> 
> Patch looks good,
> 
> one NIT, xen_dt_grant_setup_dma_ops() down the code doesn't actually 
> setup DMA OPS, it retrieves the backend domid via device-tree means and 
> stores it,
> 
> so I would rename to it, maybe something like 
> xen_dt_grant_setup_backend_domid() or xen_dt_grant_init_backend_domid(), 
> but I am not sure it would be good alternative.
> 
> 
> So, w/ or w/o renaming:
> 
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> also
> 
> Tested-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com> # Arm64 
> only

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

