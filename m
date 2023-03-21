Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 611EF6C3BC1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 21:27:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513028.793449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peiYO-00043K-8l; Tue, 21 Mar 2023 20:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513028.793449; Tue, 21 Mar 2023 20:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peiYO-00041d-5H; Tue, 21 Mar 2023 20:25:56 +0000
Received: by outflank-mailman (input) for mailman id 513028;
 Tue, 21 Mar 2023 20:25:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FQx+=7N=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1peiYM-00041X-Nw
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 20:25:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91cb98be-c826-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 21:25:51 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4037D61E1C;
 Tue, 21 Mar 2023 20:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983ACC433D2;
 Tue, 21 Mar 2023 20:25:47 +0000 (UTC)
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
X-Inumbo-ID: 91cb98be-c826-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679430348;
	bh=Av15hlHZQ3088JRjrBhen0sRxP9ma23lTYkFxQa66v0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nFnvhbQyT9+4f0mwCnf83Wv4To8aXj+3bKfgdbEaMpmh0dsN6SwA+DX+YuyEnbbZv
	 fT4Dh0JhOZO4ZrnXBOJXrlbdAAdS1hgEJzcyBVVIkIgftosSHQowyAMMIvtfkgbpce
	 bD/PVC8RbVuMcCTQaEu7FcTvGvnOeu4CDeKcuYR7eP+W8a60WdasEu2Kz4FwwTnt+e
	 9zgH+bnF0SIFekWkvEFZHGaEddB9K2i88Qd4y1nsymm1kfBGp0WhZru4RQDTSGXKIB
	 8l9/fMvt8t2/GbcQ8n//c9wZUKpGNww5Ug3TCMERw9uXwDZiUDlTgB/OBYRDoMV2nB
	 729jjkU+m3oQA==
Date: Tue, 21 Mar 2023 13:25:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    andrei.cherechesu@oss.nxp.com, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: irq: Constify the first parameter of
 platform_get_irq_byname()
In-Reply-To: <73c0df32-844d-b2ba-f212-3e04c1753236@amd.com>
Message-ID: <alpine.DEB.2.22.394.2303211325400.3359@ubuntu-linux-20-04-desktop>
References: <20230321171721.2502-1-julien@xen.org> <73c0df32-844d-b2ba-f212-3e04c1753236@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Mar 2023, Michal Orzel wrote:
> Hi Julien,
> 
> On 21/03/2023 18:17, Julien Grall wrote:
> > 
> > 
> > From: Julien Grall <jgrall@amazon.com>
> > 
> > platform_get_irq_byname() is not meant to modify the parameter 'np'. So
> > constify it.
> > 
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
 
Acked-by: Stefano Stabellini <sstabellini@kernel.org>

