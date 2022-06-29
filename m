Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B70560738
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 19:19:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358001.586944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6bLK-00060C-9p; Wed, 29 Jun 2022 17:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358001.586944; Wed, 29 Jun 2022 17:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6bLK-0005xH-72; Wed, 29 Jun 2022 17:19:10 +0000
Received: by outflank-mailman (input) for mailman id 358001;
 Wed, 29 Jun 2022 17:19:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6n86=XE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o6bLI-0004u0-HI
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 17:19:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 940fc1b4-f7cf-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 19:19:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4CCD961E66;
 Wed, 29 Jun 2022 17:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58995C34114;
 Wed, 29 Jun 2022 17:19:04 +0000 (UTC)
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
X-Inumbo-ID: 940fc1b4-f7cf-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656523144;
	bh=ZNfIjq9KinlkCHq9f5ckm9fc4RWVx0w9mg779R11+NQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IIBMIL86/VS45bdLqOXlLD02vNI+3H7dxPvshT9RcIC710ph5QkdAVd7/KVBtOeN6
	 MQTgwF/OUnl2bhJNJTFe8tWI4EOS8haLZq48ougAHY+7NBKIrtjTAuCd9Jqm3avtpW
	 nvSulNLWHYUisw44BBzQBmaO0axn9h361fZ9LhOx8Q5i+DOvWZg88l39nQRTVQFTHo
	 cb179YCLZSBV5zU5S/a87kJGyR5wmDPxQjj6Z9i2z/FM6DlXFeufDtpM4I7mo1WMUC
	 DIFuBwJAoFKsfcaVdh5YA3vC7cFJ1Fjb50UzUTRJelCnBOWhRm8f6IpnNL3rtT9oTx
	 0o5jnXMyZb2xA==
Date: Wed, 29 Jun 2022 10:19:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, dmitry.semenets@gmail.com, 
    xen-devel@lists.xenproject.org, Dmytro Semenets <dmytro_semenets@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen: arm: Don't use stop_cpu() in halt_this_cpu()
In-Reply-To: <26a1b208-7192-a64f-ca6d-c144de89ed2c@xen.org>
Message-ID: <alpine.DEB.2.22.394.2206291014000.4389@ubuntu-linux-20-04-desktop>
References: <20220623074428.226719-1-dmitry.semenets@gmail.com> <alpine.DEB.2.22.394.2206231457250.2410338@ubuntu-linux-20-04-desktop> <e60a4e68-ed00-6cc7-31ca-64bcfc4bbdc5@xen.org> <alpine.DEB.2.22.394.2206241414420.2410338@ubuntu-linux-20-04-desktop>
 <5c986703-c932-3c7d-3756-2b885bb96e42@xen.org> <alpine.DEB.2.22.394.2206281538320.4389@ubuntu-linux-20-04-desktop> <26a1b208-7192-a64f-ca6d-c144de89ed2c@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 29 Jun 2022, Julien Grall wrote:
> On 28/06/2022 23:56, Stefano Stabellini wrote:
> > > The advantage of the panic() is it will remind us that some needs to be
> > > fixed.
> > > With a warning (or WARN()) people will tend to ignore it.
> > 
> > I know that this specific code path (cpu off) is probably not super
> > relevant for what I am about to say, but as we move closer to safety
> > certifiability we need to get away from using "panic" and BUG_ON as a
> > reminder that more work is needed to have a fully correct implementation
> > of something.
> 
> I don't think we have many places at runtime using BUG_ON()/panic(). They are
> often used because we think Xen would not be able to recover if the condition
> is hit.
> 
> I am happy to remove them, but this should not be at the expense to introduce
> other potential weird bugs.
> 
> > 
> > I also see your point and agree that ASSERT is not acceptable for
> > external input but from my point of view panic is the same (slightly
> > worse because it doesn't go away in production builds).
> 
> I think it depends on your target. Would you be happy if Xen continue to run
> with potentially a fatal flaw?

Actually, this is an excellent question. I don't know what is the
expected behavior from a safety perspective in case of serious errors.
How the error should be reported and whether continuing or not is
recommended. I'll try to find out more information.

