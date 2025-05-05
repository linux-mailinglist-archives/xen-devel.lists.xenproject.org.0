Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2636AA9B74
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 20:22:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976316.1363505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC0RX-00046j-QL; Mon, 05 May 2025 18:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976316.1363505; Mon, 05 May 2025 18:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC0RX-00043a-NU; Mon, 05 May 2025 18:21:31 +0000
Received: by outflank-mailman (input) for mailman id 976316;
 Mon, 05 May 2025 18:21:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/1y=XV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uC0Hj-000675-80
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 18:11:23 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5496bc62-29dc-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 20:11:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 68D5E43B7A;
 Mon,  5 May 2025 18:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C01C4CEE4;
 Mon,  5 May 2025 18:11:11 +0000 (UTC)
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
X-Inumbo-ID: 5496bc62-29dc-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746468673;
	bh=Jw+kt6fAdtv0LkN9dBikD9J6ZjCDDIgHaCp38BMu5T0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FkEQgd5wogulWqxd6k18heqjn0JTj+TLAU+/2LVSgfB6EajNAvaD5cR280OkqbiaP
	 j8tLBnLMxYpr/4ZCBEej5aPqbS6bv04fm1H0xzi1FIQRPdyWWoF3bok+72kpzhHd5q
	 Zck2vjSWZREBbd2si4fJN1KQcRATQOmhKmr+UzfcACPXTmn0WDKzE59tJhd6Gnq2fL
	 iP3GZJ/LUFYpFlPW82Jd/bef/RgJOjVJO7pexRCRE72r7f27JTCls8QVXj+k9Zc1oP
	 y9xCWsjyEAbSmzz5PqD8U4Bsi8mGiPae34ASI/Aysah3z3zBvsq0/IZW8RCY74ouvH
	 snyPtdWAVvS7w==
Date: Mon, 5 May 2025 11:11:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com, 
    agarciav@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
In-Reply-To: <aBjLoM_ttxqftzlp@macbook.lan>
Message-ID: <alpine.DEB.2.22.394.2505051100050.3879245@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop> <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com> <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop> <aBiVkw2SXJHxpieh@mail-itl>
 <aBjLoM_ttxqftzlp@macbook.lan>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-798408408-1746468672=:3879245"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-798408408-1746468672=:3879245
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 5 May 2025, Roger Pau Monné wrote:
> On Mon, May 05, 2025 at 12:40:18PM +0200, Marek Marczykowski-Górecki wrote:
> > On Mon, Apr 28, 2025 at 01:00:01PM -0700, Stefano Stabellini wrote:
> > > On Mon, 28 Apr 2025, Jan Beulich wrote:
> > > > On 25.04.2025 22:19, Stefano Stabellini wrote:
> > > > > From: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
> > > > > 
> > > > > Dom0 PVH might need XENMEM_exchange when passing contiguous memory
> > > > > addresses to firmware or co-processors not behind an IOMMU.
> > > > 
> > > > I definitely don't understand the firmware part: It's subject to the
> > > > same transparent P2M translations as the rest of the VM; it's just
> > > > another piece of software running there.
> > > > 
> > > > "Co-processors not behind an IOMMU" is also interesting; a more
> > > > concrete scenario might be nice, yet I realize you may be limited in
> > > > what you're allowed to say.
> > > 
> > > Sure. On AMD x86 platforms there is a co-processor called PSP running
> > > TEE firmware. The PSP is not behind an IOMMU. Dom0 needs occasionally to
> > > pass addresses to it.  See drivers/tee/amdtee/ and
> > > include/linux/psp-tee.h in Linux.
> > 
> > We had (have?) similar issue with amdgpu (for integrated graphics) - it
> > uses PSP for loading its firmware. With PV dom0 there is a workaround as
> > dom0 kinda knows MFN. I haven't tried PVH dom0 on such system yet, but I
> > expect troubles (BTW, hw1 aka zen2 gitlab runner has amdgpu, and it's
> > the one I used for debugging this issue).
> 
> That's ugly, and problematic when used in conjunction with AMD-SEV.
> 
> I wonder if Xen could emulate/mediate some parts of the PSP for dom0
> to use, while allowing Xen to be the sole owner of the device.  Having
> both Xen and dom0 use it (for different purposes) seems like asking
> for trouble.  But I also have no idea how complex the PSP interface
> is, neither whether it would be feasible to emulate the
> interfaces/registers needed for firmware loading.

Let me take a step back from the PSP for a moment. I am not opposed to a
PSP mediator in Xen, but I want to emphasize that the issue is more
general and extends well beyond the PSP.

In my years working in embedded systems, I have consistently seen cases
where Dom0 needs to communicate with something that does not go through
the IOMMU. This could be due to special firmware on a co-processor, a
hardware erratum that prevents proper IOMMU usage, or a high-bandwidth
device that technically supports the IOMMU but performs poorly unless
the IOMMU is disabled. All of these are real-world examples that I have
seen personally.

In my opinion, we definitely need a solution like this patch for Dom0
PVH to function correctly in all scenarios.

Additionally, we could add a PSP mediator in Xen to provide best PSP
support, and also for cases where both Xen and Dom0 need access, but I
cannot fully assess the complexity involved, as I am not very familiar
with the API. Probably it is not going to be simple.

Even with the PSP mediator in place, I would still recommend this patch.
--8323329-798408408-1746468672=:3879245--

