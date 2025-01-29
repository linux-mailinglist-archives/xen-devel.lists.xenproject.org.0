Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C20CA21962
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 09:50:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878971.1289185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td3lr-0006QK-9r; Wed, 29 Jan 2025 08:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878971.1289185; Wed, 29 Jan 2025 08:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td3lr-0006Lb-5H; Wed, 29 Jan 2025 08:50:03 +0000
Received: by outflank-mailman (input) for mailman id 878971;
 Wed, 29 Jan 2025 08:50:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=StUP=UV=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1td3lp-0005XQ-UN
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 08:50:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0559ed26-de1e-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 09:50:00 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CAE685C42ED;
 Wed, 29 Jan 2025 08:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D271C4CED3;
 Wed, 29 Jan 2025 08:49:57 +0000 (UTC)
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
X-Inumbo-ID: 0559ed26-de1e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738140598;
	bh=GhtbiGXAup2zSnK0rTNOp5a0088ODKNAXoLr5CdWgrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QZgZiXRb8ap7vkF6yA3fGyQ+a/CORYegw0QExaxrp3QikHRLBEFtCRYB4a3SwePop
	 nWbU5xcupYn/XEUHd7N67uhsd58DvR6ngNJ/RJJZuRGJSoAdqUT8vFzsZxA8mkHGnq
	 HJ1tu7EgMVeJwWwF8qYF/7LqnjjzJ+toAcKVtnIw=
Date: Wed, 29 Jan 2025 09:48:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
Cc: Konrad Wilk <konrad.wilk@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"jgross@suse.com" <jgross@suse.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	stable@vger.kernel.org
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
Message-ID: <2025012936-finalize-ducktail-c524@gregkh>
References: <7dc143fa-4a48-440b-b624-ac57a361ac74@oracle.com>
 <9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com>
 <2025012919-series-chaps-856e@gregkh>
 <8eb33b38-23e1-4e43-8952-3f2b05660236@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8eb33b38-23e1-4e43-8952-3f2b05660236@oracle.com>

On Wed, Jan 29, 2025 at 02:13:34PM +0530, Harshvardhan Jha wrote:
> Hi there,
> 
> On 29/01/25 2:05 PM, Greg KH wrote:
> > On Wed, Jan 29, 2025 at 02:03:51PM +0530, Harshvardhan Jha wrote:
> >> Hi All,
> >>
> >> +stable
> >>
> >> There seems to be some formatting issues in my log output. I have
> >> attached it as a file.
> > Confused, what are you wanting us to do here in the stable tree?
> >
> > thanks,
> >
> > greg k-h
> 
> Since, this is reproducible on 5.4.y I have added stable. The culprit
> commit which upon getting reverted fixes this issue is also present in
> 5.4.y stable.

What culprit commit?  I see no information here :(

Remember, top-posting is evil...

