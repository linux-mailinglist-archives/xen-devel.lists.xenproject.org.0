Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 745DE3D2F47
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jul 2021 23:41:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159864.293984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6gQA-0001K1-QH; Thu, 22 Jul 2021 21:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159864.293984; Thu, 22 Jul 2021 21:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6gQA-0001Ho-MS; Thu, 22 Jul 2021 21:39:58 +0000
Received: by outflank-mailman (input) for mailman id 159864;
 Thu, 22 Jul 2021 21:39:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ltuv=MO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m6gQ9-0001Hi-8o
 for xen-devel@lists.xenproject.org; Thu, 22 Jul 2021 21:39:57 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ad3c224-eb35-11eb-9122-12813bfff9fa;
 Thu, 22 Jul 2021 21:39:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5DAD60EBB;
 Thu, 22 Jul 2021 21:39:54 +0000 (UTC)
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
X-Inumbo-ID: 5ad3c224-eb35-11eb-9122-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626989995;
	bh=nCI/Aer+Ybf73Ymjpej/kcp8lz/wqAqsRR+CvgcdM9A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uZYDJuWuVAkBdI2ohadoR8SoPgHVpke9q/3t9xiX+uqXVoToH/vzZGjJ1oImS7b6T
	 e1MKxABNVuMejDNMshdgaIagn056E0pk7gplHdHyhKqb4j45u1us+P801qJZHnGuxc
	 5afCt0flpHMxBxZsXGFalBGBQsafNff2C9eMaG/LwCYpI2flO2zEKtvQ7tj2raD3Nz
	 +HN39SsmeAuns9uFYFeWmw+YEqiHUBf75sDrFEynIYQzEotjf++B51U5cm9XmS75Qd
	 pS6l5iRKr6z4b64PoHey+Vx4brWdgTehnQWCawWyvtiP/6DFUebWU12zeEQXY4lf8/
	 o4fTtRXlR3EyQ==
Date: Thu, 22 Jul 2021 14:39:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrii Anisov <Andrii_Anisov@epam.com>
Subject: Re: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVENTS
 in kernel config
In-Reply-To: <7c3453ed-181f-a166-f16c-43a33bcc529c@xen.org>
Message-ID: <alpine.DEB.2.21.2107221437120.10122@sstabellini-ThinkPad-T480s>
References: <PA4PR03MB7136DEB7183936907DFE145AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com> <PA4PR03MB713685E6A8004ED13814B05AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com> <PA4PR03MB71367B7662A1D3E4E234F6C0E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <a02d4291-e48e-28cc-52da-6b9c998b2d0a@xen.org> <PA4PR03MB7136452DF9961BC283718F4BE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com> <8ce6f5fe-ccb6-d463-a39e-50fd82816b86@xen.org> <PA4PR03MB7136D3B811F820FC8A5AFF95E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <alpine.DEB.2.21.2107211850540.14204@sstabellini-ThinkPad-T480s> <7c3453ed-181f-a166-f16c-43a33bcc529c@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Jul 2021, Julien Grall wrote:
> > You can go and edit 76085aff29f585139a37a10ea0a7daa63f70872c to change
> > from 4K to any multiple of 4K, e.g. 8K, 12K, 16K, 20K. They should all
> > work the same.
> > 
> > Looking at the boot logs on pastebin I noticed that Xen is not loaded at
> > a 2MB aligned address. I recommend you change Xen loading address to
> > 0x500200000. And the kernel loading address to 0x500400000.
> 
> I am curious to know why you recommend to load at 2MB aligned address. The
> Image protocol doesn't require to load a 2MB aligned address. In fact, we add
> issue on Juno because the bootloader would load Xen at a 4KB address. UEFI
> will also load at a 4KB align address.

It is from empirical evidence :-)

I cannot tell you the exact reason but I saw "strange" problems in the
past that went away after choosing a 2MB alignment. So we settled for
using 2MB in ImageBuilder and we haven't seen any more issues.

However, it could have been anything: a bug in U-Boot not relevant
anymore, a bug in Linux, etc. I don't know for sure.

