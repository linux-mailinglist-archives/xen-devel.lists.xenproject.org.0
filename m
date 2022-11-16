Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA30362CF24
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 00:54:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444430.699633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovSEi-0001K9-Mt; Wed, 16 Nov 2022 23:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444430.699633; Wed, 16 Nov 2022 23:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovSEi-0001HS-K9; Wed, 16 Nov 2022 23:54:32 +0000
Received: by outflank-mailman (input) for mailman id 444430;
 Wed, 16 Nov 2022 23:54:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CGj7=3Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ovSEh-0001HM-3h
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 23:54:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 016fdd3a-660a-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 00:54:28 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 51BCE62045;
 Wed, 16 Nov 2022 23:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB28C4314A;
 Wed, 16 Nov 2022 23:54:26 +0000 (UTC)
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
X-Inumbo-ID: 016fdd3a-660a-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668642867;
	bh=wWhTRD1qe9L8lizifxAIYwdgPyfG4JQYzGwz3JubiLk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=I0FxVmS92pr3ogC68NqJESacdqRuMTSkKorFOrmnGsudjbmVRR0hry0v+cK82/FAw
	 vzNItCGDPIWkMVRMB/gBYr/tDbTFdWLUwe4mc9YjRS+hJ1N0dEc5ot/gUnqzHJYWwt
	 tKzz/Dm7mA314+7RVLxJonJVEAnoWwy9IsGnD3xYgFQNGm18TzP99RwrLRQHlMMM9v
	 T1xMJYB/401HB1PlMbwKmuvqiEeHf8nWUYE8dk8Ws5yOVdrP49+P3xTuChx0Tkuwca
	 XnwmvySmTCDKMG1UkPuXHFPlUXZqDanXGNbVnNV64eKsdiPDCLock5ZcPudbVCXVXx
	 o5VVD/lKp1g3Q==
Date: Wed, 16 Nov 2022 15:54:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andre Przywara <andre.przywara@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Jiamei Xie <Jiamei.Xie@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "julien@xen.org" <julien@xen.org>
Subject: Re: Xen Arm vpl011 UART will cause segmentation fault in Linux
 guest
In-Reply-To: <20221116110942.3faf952f@donnerap.cambridge.arm.com>
Message-ID: <alpine.DEB.2.22.394.2211161552420.4020@ubuntu-linux-20-04-desktop>
References: <AS8PR08MB76960AFEAA767A12368E83D9923E9@AS8PR08MB7696.eurprd08.prod.outlook.com> <00764fe2-f78a-e5db-cb16-903ad1a5ec03@amd.com> <AS8PR08MB7696950216E688E67644CBDB923E9@AS8PR08MB7696.eurprd08.prod.outlook.com> <f650683a-c2e6-e282-b32c-52151341ecfb@amd.com>
 <alpine.DEB.2.22.394.2211101231210.50442@ubuntu-linux-20-04-desktop> <20221116110942.3faf952f@donnerap.cambridge.arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-564832753-1668642867=:4020"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-564832753-1668642867=:4020
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 16 Nov 2022, Andre Przywara wrote:
> On Thu, 10 Nov 2022 12:32:49 -0800 (PST)
> Stefano Stabellini <sstabellini@kernel.org> wrote:
> > On Wed, 9 Nov 2022, Michal Orzel wrote:
> > > Hi Jiamei,
> > > 
> > > On 09/11/2022 09:25, Jiamei Xie wrote:  
> > > > 
> > > > 
> > > > Hi Michal，
> > > > 
> > > > Below log can be got when stating the linux guest. It says 9c09 is sbsa. And 9c09 is also output
> > > >  in bootlogd error message:
> > > > Serial: AMBA PL011 UART driver
> > > > 9c0b0000.uart: ttyAMA0 at MMIO 0x9c0b0000 (irq = 12, base_baud = 0) is a PL011 rev2
> > > > printk: console [ttyAMA0] enabled
> > > > 9c090000.sbsa-uart: ttyAMA1 at MMIO 0x9c090000 (irq = 15, base_baud = 0) is a SBSA
> > > >   
> > > 
> > > Xen behavior is correct and this would be Linux fault to try to write to DMACR for SBSA UART device.
> > > DMACR is just an example. If you try to program e.g. the baudrate (through LCR) for VPL011 it will
> > > also result in injecting abort into the guest. Should Xen support it? No. The reason why is that
> > > it is not spec compliant operation. SBSA specification directly specifies what registers are exposed.
> > > If Linux tries to write to some of the none-spec compliant registers - it is its fault.  
> > 
> > Yeah, we need to fix Linux.
> 
> Yes, it's a bug in Linux, and nobody noticed because most SBSA UARTs are
> actual PL011s, just not with everything wired up and the clocks fixed.
> 
> But while you can take pride all day in Xen having a perfect
> spec-compliant implementation - and you would be right - you have to face
> the reality that existing Linux kernels will crash.
> So we will add the one-liner in Linux that fixes that issue, and this will
> probably be backported to stable kernels, but you will still encounter
> kernels without the fix in the wild.
> So I wonder if you should consider to just implement the other PL011
> registers as RAZ/WI? That would be spec compliant as well (since an actual
> PL011 is also a spec-compliant SBSA-UART), but would work either way. Of
> course you don't need to implement the DMA or baudrate functionality, but
> at least not be nasty and trap on those register accesses.

I think this is one of those cases where we should do both:
- we should fix Linux, because that is a bug in Linux
- we should improve Xen to make this class of issues less likely to show
  up in the future

So I think implementing the other PL011 registers as RAZ/WI is a good
improvement we could have in Xen.
--8323329-564832753-1668642867=:4020--

