Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D994C4E30CB
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 20:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293178.497948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWNiS-0002Q6-Fc; Mon, 21 Mar 2022 19:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293178.497948; Mon, 21 Mar 2022 19:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWNiS-0002OO-Cj; Mon, 21 Mar 2022 19:29:20 +0000
Received: by outflank-mailman (input) for mailman id 293178;
 Mon, 21 Mar 2022 19:29:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/V3S=UA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nWNiR-0002OI-0p
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 19:29:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32241420-a94d-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 20:29:17 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 662C56090B;
 Mon, 21 Mar 2022 19:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC8FC340E8;
 Mon, 21 Mar 2022 19:29:14 +0000 (UTC)
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
X-Inumbo-ID: 32241420-a94d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647890954;
	bh=YmRk3pcKDcwiiwsrZMi5xSQuySKVN0dhJnDyoyA4Qqs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=e/0chRDKdEHDM6N2rHX0oezLXx0WU9k1UiBWmAbSTCPuF8nqIu/XBPYy3cImsNMLL
	 X9pzEKOi/T2/9KYx21OA2o2nqBBUyilqiNBAXO/gJBh1h5kWvioXJdJC88imTro2QV
	 /uNLIeRuuTli+M5ocao13fEqMLohkwGY/cZ0S6MfYYneEs7VcW6bWOhWyqp5+lzzsv
	 avTJRKvoL+qMGEq+pbSrRskmFpi3Np0sOP85jXJCRliEoz2t0ZxXU6BmsRiP59C8Gu
	 vdIEI7PTCEPABfp+Z+Cw7G2McHSNmGJKYAqrGvKglCPIFQshFVd9Tu9YJyFEuq0fSm
	 IuNiDnbLhMm+g==
Date: Mon, 21 Mar 2022 12:29:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, bertrand.marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: skip first 32 bytes of zimage32
In-Reply-To: <1a8ed108-7485-1ed5-3819-fd921164662b@xen.org>
Message-ID: <alpine.DEB.2.22.394.2203211214030.2910984@ubuntu-linux-20-04-desktop>
References: <20220320010509.3605525-1-sstabellini@kernel.org> <33f1ea14-4486-be3d-ca9f-a82274078dba@xen.org> <1a8ed108-7485-1ed5-3819-fd921164662b@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1810709212-1647890955=:2910984"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1810709212-1647890955=:2910984
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sun, 20 Mar 2022, Julien Grall wrote:
> On 20/03/2022 07:47, Julien Grall wrote:
> > On 20/03/2022 01:05, Stefano Stabellini wrote:
> > > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > > 
> > > The first 32 bytes of zImage32 are NOPs, not useful just there for
> > > compatibility. The reason is that some bootloaders skip the first 32
> > > bytes when starting the kernel. See the comment in Linux
> > > arch/arm/boot/compressed/head.S.
> > 
> > Please mention the Linux verson.
> >
> > > Since the introduction of CONFIG_EFI in Linux arm32, those NOPs
> > > operations have changed implementation from:
> > > 
> > >      mov r0, r0
> > > 
> > > to:
> > >      .inst   MZ_MAGIC | (0x1310 << 16)   @ tstne r0, #0x4d000
> > 
> > I have duplicated the comment and the instructions below:
> > 
> >                  @ This is a two-instruction NOP, which happens to bear the
> >                  @ PE/COFF signature "MZ" in the first two bytes, so the
> > kernel
> >                  @ is accepted as an EFI binary. Booting via the UEFI stub
> >                  @ will not execute those instructions, but the ARM/Linux
> >                  @ boot protocol does, so we need some NOPs here.
> >                  .inst   MZ_MAGIC | (0xe225 << 16)       @ eor r5, r5,
> > 0x4d000
> >                  eor     r5, r5, 0x4d000                 @ undo previous
> > insn
> > 
> > 
> > I read this as they are NOPs and this change should not break the ARM/Linux
> > boot protocol (we are using it in Xen).
> > 
> > BTW, the instruction decoding is different compare to me. Which version of
> > Linux are you using?
> > 
> > > 
> > > See arch/arm/boot/compressed/efi-header.S.
> > > 
> > > The new implementation doesn't work on Xen (at least on all versions of
> > > QEMU I tried).
> > 
> > As I wrote above, they are NOPs. So why is this breaking?
> 
> I have tried to boot the latest Linux (commit 14702b3b2438) with CONFIG_EFI=y
> on QEMU (commit fa435db8ce1d). This booted for me.
>
> As I wrote earlier today, the instruction used as NOPs is slightly different.
> So I had a look at the git history and found the following commit:
> 
> commit a92882a4d270
> Author: Andre Przywara <andre.przywara@arm.com>
> Date:   Mon Nov 22 16:28:43 2021 +0100
> 
>     ARM: 9159/1: decompressor: Avoid UNPREDICTABLE NOP encoding
> 
>     In the decompressor's head.S we need to start with an instruction that
>     is some kind of NOP, but also mimics as the PE/COFF header, when the
>     kernel is linked as an UEFI application. The clever solution here is
>     "tstne r0, #0x4d000", which in the worst case just clobbers the
>     condition flags, and bears the magic "MZ" signature in the lowest 16 bits.
> 
>     However the encoding used (0x13105a4d) is actually not valid, since bits
>     [15:12] are supposed to be 0 (written as "(0)" in the ARM ARM).
>     Violating this is UNPREDICTABLE, and *can* trigger an UNDEFINED
>     exception. Common Cortex cores seem to ignore those bits, but QEMU
>     chooses to trap, so the code goes fishing because of a missing exception
>     handler at this point. We are just saved by the fact that commonly (with
>     -kernel or when running from U-Boot) the "Z" bit is set, so the
>     instruction is never executed. See [0] for more details.
> 
>     To make things more robust and avoid UNPREDICTABLE behaviour in the
>     kernel code, lets replace this with a "two-instruction NOP":
>     The first instruction is an exclusive OR, the effect of which the second
>     instruction reverts. This does not leave any trace, neither in a
>     register nor in the condition flags. Also it's a perfectly valid
>     encoding. Kudos to Peter Maydell for coming up with this gem.
> 
>     [0]
> https://lore.kernel.org/qemu-devel/YTPIdbUCmwagL5%2FD@os.inf.tu-dresden.de/T/
> 
>     Link:
> https://lore.kernel.org/linux-arm-kernel/20210908162617.104962-1-andre.przywara@arm.com/T/
> 
> So this is a bug in the kernel that has nothing to do with Xen.
> 
> Therefore, I am not in favor to workaround it in Xen. Where did you get your
> kernel from? If this from a distro, then please work with them to ingest the
> above patch.

Unfortunately all the kernels I tried failed without the Xen fix.

This is the list of kernels that I tried and failed:

- Debian Buster
- Debian Bullseye
- vanilla 4.9
- vanilla 4.10

The latest Alpine Linux kernel also doesn't boot, but that one doesn't
boot even with the fix for other reason. (More in the other email.)


From a Xen gitlab-ci perspective, we just need a kernel that works.
Ideally, we wouldn't rebuild our own but reuse an existing kernel
because that is one less things to maintain in the gitlab-ci build.

We have a couple of options to make progress on the QEMU32 gitlab-ci
test:

1) use Debian Jessie in gitlab-ci and do not commit the Xen-side fix,
   file a Debian bug and revisit the situation in a couple of months
   (Debian might get the fix in the meantime)

2) commit the Xen fix and use Debian Bullseye right now

3) do not commit the Xen fix and build our own kernel now


All of these options work. My preference is 1) or 2).

Between 1) and 2) I have a slight preference for 2) for this reason: I
know that in Open Source we try to fix bugs wherever they are (kernel
project, QEMU project, Debian project) rather than working around them,
but in this case it looks like there is a significant amount of binaries
out there that require an update before they can boot on Xen. I think it
is one of those times where it is worth considering the Xen fix, or
should I say workaround, if it is considered harmless.
--8323329-1810709212-1647890955=:2910984--

