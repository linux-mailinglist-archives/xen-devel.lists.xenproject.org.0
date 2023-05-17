Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55653707288
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 21:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536027.834172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzN8l-0000M5-IM; Wed, 17 May 2023 19:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536027.834172; Wed, 17 May 2023 19:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzN8l-0000KR-FP; Wed, 17 May 2023 19:48:51 +0000
Received: by outflank-mailman (input) for mailman id 536027;
 Wed, 17 May 2023 19:48:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VO9T=BG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pzN8k-0000KA-4G
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 19:48:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6f0189f-f4eb-11ed-b22a-6b7b168915f2;
 Wed, 17 May 2023 21:48:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 77BC662C1F;
 Wed, 17 May 2023 19:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0380AC433EF;
 Wed, 17 May 2023 19:48:44 +0000 (UTC)
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
X-Inumbo-ID: d6f0189f-f4eb-11ed-b22a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684352926;
	bh=YPn6gNnZP/Y9kFaYu3q520M3Lj15uk9Hs9CIbaEEMYs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T6Dn1ynk7hBxe2VOsJpElfPC2UMuZceV+JJGEhKZp+dppAWHp4m2tFYHdWOKubsta
	 v7A6ZQis69vbs6xGOY8iCjXSY24wiJk6Git2XI13tZvGqy8g2Ls1uTEL7sBRkedW3k
	 v3DEb7JiYLk33qJrwBCxoF9zt8PSLbdBmx5ZjqqGXt8Kjcae5OnXMpKRWXHx3CN+rC
	 uByZ+cA0Bt6sA9O+xV66QL72JHAkjs/30Wb0uXxMRogkftAieHgyWwDGAg8q408xSR
	 hA0Sofb/0iFqjMXlqOVjAbgVl0OMIgw4j7l8/HrGzCO4PAGdiSBcePL54ka9YEdYcD
	 kduzVO233J8vg==
Date: Wed, 17 May 2023 12:48:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michael Tokarev <mjt@tls.msk.ru>
cc: Chuck Zmudzinski <brchuckz@aol.com>, qemu-devel@nongnu.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Eduardo Habkost <eduardo@habkost.net>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    Igor Mammedov <imammedo@redhat.com>, xen-devel@lists.xenproject.org, 
    qemu-stable@nongnu.org
Subject: Re: [PATCH] xen/pt: fix igd passthrough for pc machine with xen
 accelerator
In-Reply-To: <2b07603f-6623-9fbf-15df-a86849d9aca3@msgid.tls.msk.ru>
Message-ID: <alpine.DEB.2.22.394.2305171246020.128889@ubuntu-linux-20-04-desktop>
References: <a304213d26506b066021f803c39b87f6a262ed86.1675820085.git.brchuckz.ref@aol.com> <a304213d26506b066021f803c39b87f6a262ed86.1675820085.git.brchuckz@aol.com> <986d9eca-5fab-cacb-05c7-b85e4d58665b@msgid.tls.msk.ru> <47ed3568-2127-a865-4e4f-ff5902484231@aol.com>
 <2b07603f-6623-9fbf-15df-a86849d9aca3@msgid.tls.msk.ru>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 17 May 2023, Michael Tokarev wrote:
> 17.05.2023 12:47, Chuck Zmudzinski wrote:
> > On 5/17/2023 2:39 AM, Michael Tokarev wrote:
> > > 08.02.2023 05:03, Chuck Zmudzinski wrote:...
> > > > Fixes: 998250e97661 ("xen, gfx passthrough: register host bridge
> > > > specific to passthrough")
> > > > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> > > 
> > > Has this change been forgotten?  Is it not needed anymore?
> > 
> > Short answer:
> > 
> > After 4f67543b ("xen/pt: reserve PCI slot 2 for Intel igd-passthru ") was
> > applied, I was inclined to think this change is not needed anymore, but
> > it would not hurt to add this change also, and now I think it might be
> > more correct to also add this change.
> ...
> 
> Well, there were two machines with broken IDG passthrough in xen, now
> there's one machine with broken IDG passthrough. Let's fix them all :)
> Note this patch is tagged -stable as well.
> 
> > If you want to add this change also, let's make sure recent changes to the
> > xen header files do not require the patch to be rebased before committing
> > it.
> 
> It doesn't require rebasing, it looks like, - just built 8.0 and current
> master
> qemu with it applied.  I haven't tried the actual IDG passthrough, though.
> 
> It just neeeds to be picked up the usual way as all other qemu changes goes
> in.

Hi Michal,

I am OK with this patch and acked it. However, I think it also needs an
ack from one if the i386 maintainers, Michal T or Marcel.

