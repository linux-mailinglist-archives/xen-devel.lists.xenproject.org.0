Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A796A7010C0
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 23:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533959.831121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxa4d-0000DB-BG; Fri, 12 May 2023 21:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533959.831121; Fri, 12 May 2023 21:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxa4d-0000B0-8Z; Fri, 12 May 2023 21:13:11 +0000
Received: by outflank-mailman (input) for mailman id 533959;
 Fri, 12 May 2023 21:13:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0kdp=BB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pxa4b-0000At-KC
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 21:13:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca245d49-f109-11ed-8611-37d641c3527e;
 Fri, 12 May 2023 23:13:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2367863658;
 Fri, 12 May 2023 21:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B580C433D2;
 Fri, 12 May 2023 21:13:04 +0000 (UTC)
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
X-Inumbo-ID: ca245d49-f109-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683925985;
	bh=Sj34y1UnMe+RdJ+d2LBaBf2d2ip7dGtT1ZKiNppIFOQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=n56X88njBufIX+d33OvAnz9LtQYd8cDaGAHCoscM3uoEmY1Ndn53CKeW8g6nt+DJP
	 DgvdodSZw9Paasj2pow+TxQ05txCX5hhy9rVNs2usgOfrhe+mRBy/nw9hW53UVM+m6
	 zLPgBAKe3vbivnJT5dC2ebwE7bJpSqd7qAQyjYQi5lxQp6n+bAQJEJ4SfTsvWIMisw
	 pZlz8c9VVw4uZRrOUX07QFB2fcmtPiH4HScrQdB50jcwG52YAILNoxGq5IshiV6kiA
	 gOKmwOGSzMhQk/8XtU4QYaODo9gcHCMgqw+6FxJGjsOYyEv1oYGjch1FJPHVomjI42
	 WWqdXucwQYsaw==
Date: Fri, 12 May 2023 14:12:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Olaf Hering <olaf@aepfle.de>
cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, qemu-devel@nongnu.org, 
    qemu-block@nongnu.org, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
In-Reply-To: <20230510094719.26fb79e5.olaf@aepfle.de>
Message-ID: <alpine.DEB.2.22.394.2305121411310.3748626@ubuntu-linux-20-04-desktop>
References: <20210317070046.17860-1-olaf@aepfle.de> <4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com> <20210325121219.7b5daf76.olaf@aepfle.de> <dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com> <20230509225818.GA16290@aepfle.de>
 <20230510094719.26fb79e5.olaf@aepfle.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 May 2023, Olaf Hering wrote:
> Wed, 10 May 2023 00:58:27 +0200 Olaf Hering <olaf@aepfle.de>:
> 
> > In my debugging (with v8.0.0) it turned out the three pci_set_word
> > causes the domU to hang. In fact, it is just the last one:
> > 
> >    pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
> > 
> > It changes the value from 0xc121 to 0x1.
> 
> If I disable just "pci_set_word(pci_conf + PCI_COMMAND, 0x0000);" it works as well.
> It changes the value from 0x5 to 0.
> 
> In general I feel it is wrong to fiddle with PCI from the host side.
> This is most likely not the intention of the Xen unplug protocol.
> I'm sure the guest does not expect such changes under the hood.
> It happens to work by luck with pvops kernels because their PCI discovery
> is done after the unplug.
> 
> So, what do we do here to get this off the table?

I don't have a concrete suggestion because I don't understand the root
cause of the issue. Looking back at Paolo's reply from 2021

https://marc.info/?l=xen-devel&m=161669099305992&w=2

I think he was right. We can either fix the root cause of the issue or
avoid calling qdev_reset_all on unplug. I am OK with either one.

