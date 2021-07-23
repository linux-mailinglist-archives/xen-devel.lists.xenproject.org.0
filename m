Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBD13D3DC3
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 18:43:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160178.294510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6yG4-0002sq-IC; Fri, 23 Jul 2021 16:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160178.294510; Fri, 23 Jul 2021 16:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6yG4-0002qy-Ez; Fri, 23 Jul 2021 16:42:44 +0000
Received: by outflank-mailman (input) for mailman id 160178;
 Fri, 23 Jul 2021 16:42:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvTO=MP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m6yG3-0002qs-I8
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 16:42:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ffc919e2-ebd4-11eb-944c-12813bfff9fa;
 Fri, 23 Jul 2021 16:42:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A895660E78;
 Fri, 23 Jul 2021 16:42:41 +0000 (UTC)
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
X-Inumbo-ID: ffc919e2-ebd4-11eb-944c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627058561;
	bh=FTtuzLjdnKJ4jksYbV/tiwauRxeq6647XH+dU1SV8ss=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QjK5N98oCByX2zBbA3Gj+skaAngUn6G1QhZeh1p678oejIjqKLg8lXxMkOJxdp0Zh
	 xAk+D6Ao4OqvUFzx+o5b/Rgixj0uecamfUYxuIrfWaBtSQusdBQAEN8ZlUiXgIuzqM
	 +wIqRd/Ck41Y4sn5ktzn4fu/i3ya6KWJ/9cJrQ7mSenDu9CHWsFu6yvztxYGnkFyIV
	 W2mvQAEZNiaOM2W3dviyp3VCUNts66i1bSzXVc8fMBGsdi+wAyqBPawy8/t1NyNL0c
	 WYioaFp5AEcpKuOoIJ95wjJgmMhY+8ixDBGh4/Y4xgq/2P16Vve7SstDpS82obNbzY
	 MQ9D6QSrgFWkg==
Date: Fri, 23 Jul 2021 09:42:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrii Anisov <Andrii_Anisov@epam.com>
Subject: Re: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVENTS
 in kernel config
In-Reply-To: <88c43f6c-9d76-1cab-93f5-ddecc76b487f@xen.org>
Message-ID: <alpine.DEB.2.21.2107230928460.10122@sstabellini-ThinkPad-T480s>
References: <PA4PR03MB7136DEB7183936907DFE145AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com> <PA4PR03MB713685E6A8004ED13814B05AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com> <PA4PR03MB71367B7662A1D3E4E234F6C0E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <a02d4291-e48e-28cc-52da-6b9c998b2d0a@xen.org> <PA4PR03MB7136452DF9961BC283718F4BE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com> <8ce6f5fe-ccb6-d463-a39e-50fd82816b86@xen.org> <PA4PR03MB7136D3B811F820FC8A5AFF95E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <alpine.DEB.2.21.2107211850540.14204@sstabellini-ThinkPad-T480s> <7c3453ed-181f-a166-f16c-43a33bcc529c@xen.org> <alpine.DEB.2.21.2107221437120.10122@sstabellini-ThinkPad-T480s> <88c43f6c-9d76-1cab-93f5-ddecc76b487f@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Jul 2021, Julien Grall wrote:
> On 22/07/2021 22:39, Stefano Stabellini wrote:
> > On Thu, 22 Jul 2021, Julien Grall wrote:
> > > > You can go and edit 76085aff29f585139a37a10ea0a7daa63f70872c to change
> > > > from 4K to any multiple of 4K, e.g. 8K, 12K, 16K, 20K. They should all
> > > > work the same.
> > > > 
> > > > Looking at the boot logs on pastebin I noticed that Xen is not loaded at
> > > > a 2MB aligned address. I recommend you change Xen loading address to
> > > > 0x500200000. And the kernel loading address to 0x500400000.
> > > 
> > > I am curious to know why you recommend to load at 2MB aligned address. The
> > > Image protocol doesn't require to load a 2MB aligned address. In fact, we
> > > add
> > > issue on Juno because the bootloader would load Xen at a 4KB address. UEFI
> > > will also load at a 4KB align address.
> > 
> > It is from empirical evidence :-)
> 
> Right...
> 
> > I cannot tell you the exact reason but I saw "strange" problems in the
> > past that went away after choosing a 2MB alignment. So we settled for
> > using 2MB in ImageBuilder and we haven't seen any more issues.
> 
> It would have been good to report such issue back then so it could have been
> analyzed and possibly fixed.
> 
> > However, it could have been anything: a bug in U-Boot not relevant
> > anymore, a bug in Linux, etc. I don't know for sure.
> 
> This is the worrying part. We have a potential bug that no one knows why it
> happened. Can this be reproduced?

I managed to reproduce the problem. I switched ImageBuilder to use 4K
alignment (just by changing the variable "offset" at the top of
scripts/uboot-script-gen). It generated a boot.source file like this:

tftpb 0xC01000 2021.1/xen
tftpb 0xCEA000 2021.1/xen-Image-5.10
tftpb 0x18D1000 2021.1/initrd.cpio
tftpb 0x1A55000 2021.1/xen.dtb
[trimmed because the rest is not too relevant]


These are the sizes:

12479370 Jul  21 19:02 xen-Image-5.10
40577    Jul  21 18:25 xen.dtb
950280   Jul  19 16:58 xen
1586176  Jun  4  17:14 initrd.cpio


I did the calculations by hand and there are no overlaps. This is the
output from u-boot and boot log failure: https://pastebin.com/rbTBPn5g

Using 2MB works. I tried 1MB for curiosity and got a different
error: https://pastebin.com/UHFUHyxN

Do you think it is worth investigating further?

- Stefano

