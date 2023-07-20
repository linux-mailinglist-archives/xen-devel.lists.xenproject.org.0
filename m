Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA8F75A362
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:22:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566247.884811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHQv-0007S8-LG; Thu, 20 Jul 2023 00:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566247.884811; Thu, 20 Jul 2023 00:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHQv-0007PO-IA; Thu, 20 Jul 2023 00:22:17 +0000
Received: by outflank-mailman (input) for mailman id 566247;
 Thu, 20 Jul 2023 00:22:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1UDO=DG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMHQt-0007PI-W5
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:22:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79762029-2693-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 02:22:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B519617DB;
 Thu, 20 Jul 2023 00:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B817C433C7;
 Thu, 20 Jul 2023 00:22:11 +0000 (UTC)
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
X-Inumbo-ID: 79762029-2693-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689812532;
	bh=iOhtG18Xjx35RfOoBf0pJWVGi8TqQirc725rJUlwmzk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lDAkS2y/rn4oqw1FHxQLNGIklfDbgrJoCMbXTU7b//CGZq15PX6F/Y6htgT7/H+0B
	 4gM9BVSeU4xNQ3Knbc52XgNboDZKrKSKIPZY+p+WRmBK2izjDflj4Yu6dwmRITciQ6
	 03Fb4GjlVMplSqJJpeXni/KCvfD1WRWFe4owrQuSnS7efq/xgUGniAgAX5adsRMYWG
	 LY+4V1vgN4kd6imrz9r20g5h78H+dIf04xQaG+898vINATyKh18QK3rSizEEtR5N8X
	 OwPURvG25OOCPlt6AfYt7kOieFSkynrOlWygY5ESJl3ZD66LF4l59TXtL7UvMC6Av8
	 nlVq06NNKB5OA==
Date: Wed, 19 Jul 2023 17:22:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
cc: Rahul Singh <rahul.singh@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    David Woodhouse <dwmw@amazon.co.uk>, 
    Jane Malalane <jane.malalane@citrix.com>
Subject: Re: [PATCH v3] xen/evtchn: Introduce new IOCTL to bind static
 evtchn
In-Reply-To: <9a917f42-1a22-0c75-459e-db30c17dbe78@epam.com>
Message-ID: <alpine.DEB.2.22.394.2307191722010.3118466@ubuntu-linux-20-04-desktop>
References: <ae7329bf1713f83e4aad4f3fa0f316258c40a3e9.1689677042.git.rahul.singh@arm.com> <9a917f42-1a22-0c75-459e-db30c17dbe78@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-27211591-1689812531=:3118466"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-27211591-1689812531=:3118466
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 18 Jul 2023, Oleksandr Tyshchenko wrote:
> On 18.07.23 14:31, Rahul Singh wrote:
> 
> 
> Hello Rahul
> 
> 
> > Xen 4.17 supports the creation of static evtchns. To allow user space
> > application to bind static evtchns introduce new ioctl
> > "IOCTL_EVTCHN_BIND_STATIC". Existing IOCTL doing more than binding
> > that’s why we need to introduce the new IOCTL to only bind the static
> > event channels.
> > 
> > Static evtchns to be available for use during the lifetime of the
> > guest. When the application exits, __unbind_from_irq() ends up being
> > called from release() file operations because of that static evtchns
> > are getting closed. To avoid closing the static event channel, add the
> > new bool variable "is_static" in "struct irq_info" to mark the event
> > channel static when creating the event channel to avoid closing the
> > static evtchn.
> > 
> > Also, take this opportunity to remove the open-coded version of the
> > evtchn close in drivers/xen/evtchn.c file and use xen_evtchn_close().
> > 
> > Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> > ---
> > v3:
> >   * Remove the open-coded version of the evtchn close in drivers/xen/evtchn.c
> 
> Thanks!
> 
> Looks like there is one unmentioned change in change-log since v2:
> * Make sure that evtchn hasn't been added yet before binding it in 
> evtchn_ioctl():case IOCTL_EVTCHN_BIND_STATIC
> 
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-27211591-1689812531=:3118466--

