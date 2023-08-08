Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 437DC774BAB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 22:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580446.908651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTThS-0000ZE-7e; Tue, 08 Aug 2023 20:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580446.908651; Tue, 08 Aug 2023 20:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTThS-0000Vy-4p; Tue, 08 Aug 2023 20:53:06 +0000
Received: by outflank-mailman (input) for mailman id 580446;
 Tue, 08 Aug 2023 20:53:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiCO=DZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTThQ-0000Vs-N4
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 20:53:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 902b6581-362d-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 22:53:02 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4D3E62CCB;
 Tue,  8 Aug 2023 20:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3EDC433C8;
 Tue,  8 Aug 2023 20:52:59 +0000 (UTC)
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
X-Inumbo-ID: 902b6581-362d-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691527980;
	bh=s7MCFjn0aQjiYEMHaJP2WcHXORAVkz3Wx2uB9R7Ygyk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tFLGQoCXHQ5swCVhIkHOhrUesIEsGMRbsLZhlAlnLTV8LWRqj3RSUrD6DNCbQ4q56
	 JLT/M5NIoNfg2r3uZ75OgkCb8hQRqmFI1uL2U0fEidfFq3/EOhPXbgBpc3Ai8hbFyK
	 yoREamgbnmIwenOiKoTcCliAeafSAZhdRYvrWsMyu1ea9NeyuwZ49cKnqcsrvHf7qR
	 fYYlkXvWcvzA6E8F+gQle+AWibFI49bQXEbJVbYOjcytrwxOmjYvJxxgfn2W9eLS4l
	 W/GyauP12E82MEWGOxrCA2h4HFAxRxl5G8W3EAsDBt5j6DXK1giSyyO9cp1zXQVrMy
	 V+Adlzyid+skA==
Date: Tue, 8 Aug 2023 13:52:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm64: head: Introduce a helper to flush local
 TLBs
In-Reply-To: <416EFCDE-063D-416D-AEC4-8EA15BE0396C@arm.com>
Message-ID: <alpine.DEB.2.22.394.2308081352510.2127516@ubuntu-linux-20-04-desktop>
References: <20230808110739.1296-1-michal.orzel@amd.com> <416EFCDE-063D-416D-AEC4-8EA15BE0396C@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Aug 2023, Luca Fancellu wrote:
> > On 8 Aug 2023, at 12:07, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > Instead of repeating the same sequence of instructions to flush the TLBs
> > in various places, introduce a macro flush_xen_tlb_local and make use of
> > it. This is similar to what was done for arm32 by the commit:
> > dea9dddeceec8a1d68da24b14d5b2396effe555f
> > 
> > This is also making the flush sequence in enable_mmu more clear and
> > consistent.
> > 
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> 
> Hi Michal,
> 
> Looks good to me
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

