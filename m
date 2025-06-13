Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEBAAD960B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 22:15:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014908.1392938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQAn1-0000mx-62; Fri, 13 Jun 2025 20:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014908.1392938; Fri, 13 Jun 2025 20:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQAn1-0000kD-2f; Fri, 13 Jun 2025 20:14:15 +0000
Received: by outflank-mailman (input) for mailman id 1014908;
 Fri, 13 Jun 2025 20:14:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NROC=Y4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uQAmz-0000k7-Gq
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 20:14:13 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f45df033-4892-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 22:14:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5E05E62A07;
 Fri, 13 Jun 2025 20:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48881C4CEE3;
 Fri, 13 Jun 2025 20:14:02 +0000 (UTC)
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
X-Inumbo-ID: f45df033-4892-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749845644;
	bh=n1UkvtsKm2vJ/JKTBSMySqwzeAMiL/PPMSVvLGHEvDA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sCqTZmHgw2iZk8/sWeJtwhluGnjHi4JcYdSFJBrm7/0La/RCUXxim9bUC3nrWo3Nf
	 aGtvL4eXVGi1YmaOa0HQpAxswTj9/9TDVez2EUcgeombW07/qZ7YL6OpR/bGuJHP0V
	 VokAb7m0hwRp3/kkZdTimrdjqOUVbMULtl1hbn9JYxNiKUJ97+ndd6Z06CfzjQ/lif
	 SSwkBEQJ3yO41/wRky6GiSGPI3K0mH16jloYWIFZ8/JfXSVEh3ZmM6sGnGCgt3Lg5r
	 GPbcyduww+DOulNBNj7WpOFSOe5bqbF/soIN1SfFT4e13KCq6yM6Odgx6OroFA0eQp
	 kFA18izH3wvvg==
Date: Fri, 13 Jun 2025 13:14:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Juergen Gross <jgross@suse.com>, Trammell Hudson <hudson@trmm.net>, 
    Ross Lagerwall <ross.lagerwall@cloud.com>, 
    Frediano Ziglio <frediano.ziglio@cloud.com>, 
    Gerald Elder-Vass <gerald.elder-vass@cloud.com>, 
    Kevin Lampis <kevin.lampis@cloud.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy
In-Reply-To: <aEwjwqlmOvdp9G2H@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2506131313430.8480@ubuntu-linux-20-04-desktop>
References: <20250611235851.167385-1-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2506121426520.8480@ubuntu-linux-20-04-desktop> <608cf9c5-f057-4d3b-8833-8ef040064fec@suse.com> <aEwjwqlmOvdp9G2H@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-762728654-1749845644=:8480"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-762728654-1749845644=:8480
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 13 Jun 2025, Marek Marczykowski-Górecki wrote:
> On Fri, Jun 13, 2025 at 08:35:26AM +0200, Jan Beulich wrote:
> > On 12.06.2025 23:32, Stefano Stabellini wrote:
> > > On Thu, 12 Jun 2025, Andrew Cooper wrote:
> > >> +Support in Xen
> > >> +--------------
> > >> +
> > >> +There are multiple ways to achieve this security goal, with differing
> > >> +tradeoffs for the eventual system.
> > >> +
> > >> +On one end of the spectrum is the Unified Kernel Image.  e.g. Xen is bundled
> > >> +with the dom0 kernel and init-ramdisk, with an embedded command line, and with
> > >> +livepatching and kexec compiled out, and suitably signed.  The signature is
> > >> +checked by the bootloader and, as this covers all the privileged code, Xen
> > >> +doesn't need to perform further checks itself.
> > >> +
> > >> +On the other end of the spectrum is maintaining the features of existing
> > >> +deployments.  e.g. Xen needs signature checking capabilities for the dom0
> > >> +kernel, livepatches and kexec kernels, and needs to allow the use of safe
> > >> +command line options while disallowing unsafe ones.
> > > 
> > > I just wanted to mention that there is one more option which I used in
> > > the past: the firmware/bootloader loads Xen, the Dom0 kernel, and other
> > > binaries, check their signatures, then boot Xen.
> > > 
> > > This is similar to the "Unified Kernel Image" approach in the sense that
> > > Xen doesn't need to do any signature checking for the dom0 kernel, but
> > > it doesn't require all the binaries to be glued together.
> > > 
> > > Assuming that the firmware/bootloader is capable of loading multiple
> > > binaries and checking the signature of multiple binaries before booting
> > > the next element, it works fine.
> > 
> > How would an initrd, a ucode blob, or an XSM policy blob be signed?
> 
> At least grub supports gpg detached signatures, and can be configured to
> require them.

That's right. U-boot supports something similar as well.
--8323329-762728654-1749845644=:8480--

