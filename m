Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90906B0819C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 02:46:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045980.1416218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucCkv-0005TO-Je; Thu, 17 Jul 2025 00:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045980.1416218; Thu, 17 Jul 2025 00:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucCkv-0005R5-GP; Thu, 17 Jul 2025 00:45:49 +0000
Received: by outflank-mailman (input) for mailman id 1045980;
 Thu, 17 Jul 2025 00:45:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R98P=Z6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ucCku-0005Qz-Np
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 00:45:48 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60751ef5-62a7-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 02:45:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 07F95A574A7;
 Thu, 17 Jul 2025 00:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12298C4CEE7;
 Thu, 17 Jul 2025 00:45:44 +0000 (UTC)
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
X-Inumbo-ID: 60751ef5-62a7-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752713145;
	bh=WySon4yYU6xJt9lUQgvZ2R8ymmduXdeFW7DBHREbX+M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=U4S6YrvrZigbYLlAx3fHaCx/UolBI6MW/3fdPV/RBoVgi/Q2wUFgeXFdxr85BltFs
	 Og6IAZ/5ayyNGIMi82n1dADbahlHW2HTrezcJeJZd6cosyI6DT10ERQFJBcyJyCw8N
	 4RorwIoCjkFApq+NERs1YDjwipteOCrl/g9pwbuyqkJfxbNNLYcG/j+M0LjRKQ8Vk0
	 GABjXfDRwocIm2L9YkMyr7swNcDdycxvzpbUogZ7D5YuGace+VGtmt4OTH0fZ4VTjV
	 DZDh331oZjLvOwhT9CVqmvx5ccffAl8h7vp2P6djcvMF0AVvz16NC6mWUBKuoKBkE7
	 04fPJTOYDQ0Tg==
Date: Wed, 16 Jul 2025 17:45:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Subject: Re: [ImageBuilder][PATCH] Fix DOM0_CMD options for early console
In-Reply-To: <6248C012-DDC1-4E70-B697-CF04CD22B19C@arm.com>
Message-ID: <alpine.DEB.2.22.394.2507161745370.15546@ubuntu-linux-20-04-desktop>
References: <20250716092613.13954-1-michal.orzel@amd.com> <6248C012-DDC1-4E70-B697-CF04CD22B19C@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2116864826-1752713145=:15546"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2116864826-1752713145=:15546
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 16 Jul 2025, Luca Fancellu wrote:
> Hi Michal,
> 
> > On 16 Jul 2025, at 10:26, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > Fix incorrect earlycon option that should be xenboot instead of xen.
> > Refer:
> > https://elixir.bootlin.com/linux/v6.15.6/source/drivers/tty/hvc/hvc_xen.c#L772
> > 
> > Fix incorrect earlyprintk option. On Arm32 (Arm64 does not have
> > earlyprintk), it should be just earlyprintk which will enable compiled
> > in (if at all) debug printk code.
> > 
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> 
> I’m not an ImageBuilder expert, but the change looks sensible to me:
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-2116864826-1752713145=:15546--

