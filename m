Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6816AA36E1D
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 13:35:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889409.1298533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjHN7-0002ew-Bd; Sat, 15 Feb 2025 12:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889409.1298533; Sat, 15 Feb 2025 12:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjHN7-0002by-8B; Sat, 15 Feb 2025 12:34:13 +0000
Received: by outflank-mailman (input) for mailman id 889409;
 Sat, 15 Feb 2025 12:34:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWEE=VG=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1tjHN5-0002bs-8x
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2025 12:34:11 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 267149e4-eb99-11ef-9aa5-95dc52dad729;
 Sat, 15 Feb 2025 13:34:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 56D34A40109;
 Sat, 15 Feb 2025 12:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1C5C4CEDF;
 Sat, 15 Feb 2025 12:34:06 +0000 (UTC)
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
X-Inumbo-ID: 267149e4-eb99-11ef-9aa5-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739622847;
	bh=NnRZ74pVR86hV7lGrabOr8uvrPWBnexcNXQ4+Gj4un4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jsdH3dqjBgyKQpZGu4eSmCTyOBbV6n8HhRO0RfAx8xWtu5cGcojyLCZorzTZ5xrum
	 UKk62Mff7INTEpuU6Asje8FMeb7vnW+XPxfdX78zfHZFdKZ6ds6ICucd3SQuIvphSj
	 8ae1NXoaqGGn6vLbyOIdHRjh3qWttl5Xw7AB16mk=
Date: Sat, 15 Feb 2025 13:34:03 +0100
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
Message-ID: <2025021548-amiss-duffel-9dcf@gregkh>
References: <Z6d-l2nCO1mB4_wx@eldamar.lan>
 <fd650c88-9888-46bc-a448-9c1ddcf2b066@oracle.com>
 <Z6ukbNnyQVdw4kh0@eldamar.lan>
 <716f186d-924a-4f2c-828a-2080729abfe9@oracle.com>
 <6d7ed6bf-f8ad-438a-a368-724055b4f04c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d7ed6bf-f8ad-438a-a368-724055b4f04c@suse.com>

On Sat, Feb 15, 2025 at 12:47:57PM +0100, Jürgen Groß wrote:
> On 12.02.25 16:12, Harshit Mogalapalli wrote:
> > Hi Salvatore,
> > 
> > On 12/02/25 00:56, Salvatore Bonaccorso wrote:
> > > Hi Harshit,
> > > 
> > > On Sun, Feb 09, 2025 at 01:45:38AM +0530, Harshit Mogalapalli wrote:
> > > > Hi Salvatore,
> > > > 
> > > > On 08/02/25 21:26, Salvatore Bonaccorso wrote:
> > > > > Hi Juergen, hi all,
> > > > > 
> > > > > Radoslav Bodó reported in Debian an issue after updating our kernel
> > > > > from 6.1.112 to 6.1.115. His report in full is at:
> > > > > 
> > > > > https://bugs.debian.org/1088159
> > > > > 
> > > > 
> > > > Note:
> > > > We have seen this on 5.4.y kernel: More details here:
> > > > https://lore.kernel.org/all/9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com/
> > > 
> > > Thanks for the pointer, so looking at that thread I suspect the three
> > > referenced bugs in Debian are in the end all releated. We have one as
> > > well relating to the megasas_sas driver, this one for the mpt3sas
> > > driver and one for the i40e driver).
> > > 
> > > AFAICS, there is not yet a patch which has landed upstream which I can
> > > redirect to a affected user to test?
> > > 
> > 
> > Konrad pointed me at this thread: https://lore.kernel.org/
> > all/20250211120432.29493-1-jgross@suse.com/
> > 
> > This has some fixes, but not landed upstream yet.
> 
> Patches are upstream now. In case you still experience any problems, please
> speak up.

What specific commits should be backported here?

thanks,

greg k-h

