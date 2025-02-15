Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF6CA36EE9
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 15:56:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889443.1298562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjJZr-0005cb-Fl; Sat, 15 Feb 2025 14:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889443.1298562; Sat, 15 Feb 2025 14:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjJZr-0005b8-Bu; Sat, 15 Feb 2025 14:55:31 +0000
Received: by outflank-mailman (input) for mailman id 889443;
 Sat, 15 Feb 2025 14:55:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWEE=VG=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1tjJZp-0005aj-Kn
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2025 14:55:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e321eeef-ebac-11ef-9aa5-95dc52dad729;
 Sat, 15 Feb 2025 15:55:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B35315C4965;
 Sat, 15 Feb 2025 14:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4494DC4CEDF;
 Sat, 15 Feb 2025 14:55:23 +0000 (UTC)
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
X-Inumbo-ID: e321eeef-ebac-11ef-9aa5-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739631323;
	bh=Bw2PVlbFNQbJcZ8QOpOgMBPK5kD45wXQ0FsdYVTIFGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XcGnmlky6ERWwyUKReVNNNd2TN2OA/kvUNytC2324tammtTVK0xSrkvoK7Rcl41Qj
	 QEVll+Pot1jER0PRjHoigOuIe8gXB/c5I6jQL795cRnL894PUtE/LqpoFomzAz1x6E
	 g26ERaVP9ifA4cVpbvwGvwmnNZpVxi9Dyv7Ry2bk=
Date: Sat, 15 Feb 2025 15:55:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Salvatore Bonaccorso <carnil@debian.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
	Radoslav =?iso-8859-1?Q?Bod=F3?= <radoslav.bodo@igalileo.cz>,
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Harshvardhan Jha <harshvardhan.j.jha@oracle.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [6.1.y] Regression from b1e6e80a1b42 ("xen/swiotlb: add
 alignment check for dma buffers") when booting with Xen and mpt3sas_cm0
 _scsih_probe failures
Message-ID: <2025021533-grime-luminous-d598@gregkh>
References: <Z6d-l2nCO1mB4_wx@eldamar.lan>
 <fd650c88-9888-46bc-a448-9c1ddcf2b066@oracle.com>
 <Z6ukbNnyQVdw4kh0@eldamar.lan>
 <716f186d-924a-4f2c-828a-2080729abfe9@oracle.com>
 <6d7ed6bf-f8ad-438a-a368-724055b4f04c@suse.com>
 <2025021548-amiss-duffel-9dcf@gregkh>
 <74e74dde-0703-4709-96b8-e1615d40f19c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74e74dde-0703-4709-96b8-e1615d40f19c@suse.com>

On Sat, Feb 15, 2025 at 02:39:46PM +0100, Jürgen Groß wrote:
> On 15.02.25 13:34, Greg KH wrote:
> > On Sat, Feb 15, 2025 at 12:47:57PM +0100, Jürgen Groß wrote:
> > > On 12.02.25 16:12, Harshit Mogalapalli wrote:
> > > > Hi Salvatore,
> > > > 
> > > > On 12/02/25 00:56, Salvatore Bonaccorso wrote:
> > > > > Hi Harshit,
> > > > > 
> > > > > On Sun, Feb 09, 2025 at 01:45:38AM +0530, Harshit Mogalapalli wrote:
> > > > > > Hi Salvatore,
> > > > > > 
> > > > > > On 08/02/25 21:26, Salvatore Bonaccorso wrote:
> > > > > > > Hi Juergen, hi all,
> > > > > > > 
> > > > > > > Radoslav Bodó reported in Debian an issue after updating our kernel
> > > > > > > from 6.1.112 to 6.1.115. His report in full is at:
> > > > > > > 
> > > > > > > https://bugs.debian.org/1088159
> > > > > > > 
> > > > > > 
> > > > > > Note:
> > > > > > We have seen this on 5.4.y kernel: More details here:
> > > > > > https://lore.kernel.org/all/9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com/
> > > > > 
> > > > > Thanks for the pointer, so looking at that thread I suspect the three
> > > > > referenced bugs in Debian are in the end all releated. We have one as
> > > > > well relating to the megasas_sas driver, this one for the mpt3sas
> > > > > driver and one for the i40e driver).
> > > > > 
> > > > > AFAICS, there is not yet a patch which has landed upstream which I can
> > > > > redirect to a affected user to test?
> > > > > 
> > > > 
> > > > Konrad pointed me at this thread: https://lore.kernel.org/
> > > > all/20250211120432.29493-1-jgross@suse.com/
> > > > 
> > > > This has some fixes, but not landed upstream yet.
> > > 
> > > Patches are upstream now. In case you still experience any problems, please
> > > speak up.
> > 
> > What specific commits should be backported here?
> 
> Those are:
> 
> e93ec87286bd1fd30b7389e7a387cfb259f297e3
> 85fcb57c983f423180ba6ec5d0034242da05cc54

Ugh, neither of them were marked for stable inclusion, why not?  Anyway,
I'll go queue them up after this round of kernels is released hopefully
tomorrow, but next time, please follow the stable kernel rules if you
know you want a patch included in a tree.

thanks,

greg k-h

