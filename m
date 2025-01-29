Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42246A22606
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 23:02:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879341.1289559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdG88-0000wW-GD; Wed, 29 Jan 2025 22:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879341.1289559; Wed, 29 Jan 2025 22:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdG88-0000u9-Cp; Wed, 29 Jan 2025 22:01:52 +0000
Received: by outflank-mailman (input) for mailman id 879341;
 Wed, 29 Jan 2025 22:01:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oGWA=UV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tdG87-0000ty-9R
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 22:01:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a209abf0-de8c-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 23:01:47 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 144185C6172;
 Wed, 29 Jan 2025 22:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC67C4CED1;
 Wed, 29 Jan 2025 22:01:44 +0000 (UTC)
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
X-Inumbo-ID: a209abf0-de8c-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738188105;
	bh=2Fp+uQjCLRYwrOD0BSfZrFoIEtJ6UcOoCawTUl51tD4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M1Bibcts0FNJcnusFPjMrEJ5gQxIzgQPHrO+EUT7BpuoxONsXjElEICLQqUPo9xNV
	 ckUoU2CvH+RQ3ejer5U4meHn2AnViAnLmEq122K8wOr3tCiV+j/zpjpF2rrPbmQS0w
	 BCtA0EUiG3vorW1tvp2czdQcAPFIPLZLeUI5HMX9W6/gUoVFmaHHxSh8WR+2Pd91Tg
	 CHdtqgqxB5xDmWGnqi1Dm9RO4FbztV2U5SogwdAJd+gvcu3sY5rVfcjM7dmxNxagza
	 Fr1H9/FqUGSkUTNf37YktvvkxJFEF0MlodCAFmHt1li22/uMA4mGzkTsbl47J4Crsv
	 nhX/Ziy5oujlg==
Date: Wed, 29 Jan 2025 14:01:35 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
cc: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>, 
    Greg KH <gregkh@linuxfoundation.org>, Konrad Wilk <konrad.wilk@oracle.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, 
    stable@vger.kernel.org
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
In-Reply-To: <de6912ad-3dba-4d66-8ca2-71a0aa09172c@suse.com>
Message-ID: <alpine.DEB.2.22.394.2501291401290.11632@ubuntu-linux-20-04-desktop>
References: <7dc143fa-4a48-440b-b624-ac57a361ac74@oracle.com> <9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com> <2025012919-series-chaps-856e@gregkh> <8eb33b38-23e1-4e43-8952-3f2b05660236@oracle.com> <2025012936-finalize-ducktail-c524@gregkh>
 <1f017284-1a29-49d8-b0d9-92409561990e@oracle.com> <2025012956-jiffy-condone-3137@gregkh> <1f225b8d-d958-4304-829e-8798884d9b6b@oracle.com> <83bd90c7-8879-4462-9548-bb5b69cac39e@suse.com> <b4ab0246-3846-41d1-8e84-64bd7fefc089@oracle.com>
 <de6912ad-3dba-4d66-8ca2-71a0aa09172c@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-408514709-1738188105=:11632"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-408514709-1738188105=:11632
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 29 Jan 2025, Jürgen Groß wrote:
> On 29.01.25 19:35, Harshvardhan Jha wrote:
> > 
> > On 29/01/25 4:52 PM, Juergen Gross wrote:
> > > On 29.01.25 10:15, Harshvardhan Jha wrote:
> > > > 
> > > > On 29/01/25 2:34 PM, Greg KH wrote:
> > > > > On Wed, Jan 29, 2025 at 02:29:48PM +0530, Harshvardhan Jha wrote:
> > > > > > Hi Greg,
> > > > > > 
> > > > > > On 29/01/25 2:18 PM, Greg KH wrote:
> > > > > > > On Wed, Jan 29, 2025 at 02:13:34PM +0530, Harshvardhan Jha wrote:
> > > > > > > > Hi there,
> > > > > > > > 
> > > > > > > > On 29/01/25 2:05 PM, Greg KH wrote:
> > > > > > > > > On Wed, Jan 29, 2025 at 02:03:51PM +0530, Harshvardhan Jha
> > > > > > > > > wrote:
> > > > > > > > > > Hi All,
> > > > > > > > > > 
> > > > > > > > > > +stable
> > > > > > > > > > 
> > > > > > > > > > There seems to be some formatting issues in my log output. I
> > > > > > > > > > have
> > > > > > > > > > attached it as a file.
> > > > > > > > > Confused, what are you wanting us to do here in the stable
> > > > > > > > > tree?
> > > > > > > > > 
> > > > > > > > > thanks,
> > > > > > > > > 
> > > > > > > > > greg k-h
> > > > > > > > Since, this is reproducible on 5.4.y I have added stable. The
> > > > > > > > culprit
> > > > > > > > commit which upon getting reverted fixes this issue is also
> > > > > > > > present in
> > > > > > > > 5.4.y stable.
> > > > > > > What culprit commit?  I see no information here :(
> > > > > > > 
> > > > > > > Remember, top-posting is evil...
> > > > > > My apologies,
> > > > > > 
> > > > > > The stable tag v5.4.289 seems to fail to boot with the following
> > > > > > prompt in an infinite loop:
> > > > > > [   24.427217] megaraid_sas 0000:65:00.0: megasas_build_io_fusion
> > > > > > 3273 sge_count (-12) is out of range. Range is:  0-256
> > > > > > 
> > > > > > Reverting the following patch seems to fix the issue:
> > > > > > 
> > > > > > stable-5.4      : v5.4.285             - 5df29a445f3a xen/swiotlb:
> > > > > > add
> > > > > > alignment check for dma buffers
> > > > > > 
> > > > > > I tried changing swiotlb grub command line arguments but that didn't
> > > > > > seem to help much unfortunately and the error was seen again.
> > > > > > 
> > > > > Ok, can you submit this revert with the information about why it
> > > > > should
> > > > > not be included in the 5.4.y tree and cc: everyone involved and then
> > > > > we
> > > > > will be glad to queue it up.
> > > > > 
> > > > > thanks,
> > > > > 
> > > > > greg k-h
> > > > 
> > > > This might be reproducible on other stable trees and mainline as well so
> > > > we will get it fixed there and I will submit the necessary fix to stable
> > > > when everything is sorted out on mainline.
> > > 
> > > Right. Just reverting my patch will trade one error with another one (the
> > > one which triggered me to write the patch).
> > > 
> > > There are two possible ways to fix the issue:
> > > 
> > > - allow larger DMA buffers in xen/swiotlb (today 2MB are the max.
> > > supported
> > >    size, the megaraid_sas driver seems to effectively request 4MB)
> > 
> > This seems relatively simpler to implement but I'm not sure whether it's
> > the most optimal approach
> 
> Just making the static array larger used to hold the frame numbers for the
> buffer seems to be a waste of memory for most configurations.
> 
> I'm thinking of an allocated array using the max needed size (replace a
> former buffer with a larger one if needed).

You are referring to discontig_frames and MAX_CONTIG_ORDER in
arch/x86/xen/mmu_pv.c, right? I am not super familiar with that code but
it looks like a good way to go.
--8323329-408514709-1738188105=:11632--

