Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDA285C054
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 16:51:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683612.1063206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcSON-0000JF-D4; Tue, 20 Feb 2024 15:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683612.1063206; Tue, 20 Feb 2024 15:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcSON-0000HR-AL; Tue, 20 Feb 2024 15:50:47 +0000
Received: by outflank-mailman (input) for mailman id 683612;
 Tue, 20 Feb 2024 15:50:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vPn8=J5=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1rcSOL-0000Fw-HE
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 15:50:45 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce701a5a-d007-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 16:50:44 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C66C968D07; Tue, 20 Feb 2024 16:50:41 +0100 (CET)
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
X-Inumbo-ID: ce701a5a-d007-11ee-8a52-1f161083a0e0
Date: Tue, 20 Feb 2024 16:50:41 +0100
From: Christoph Hellwig <hch@lst.de>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Christoph Hellwig <hch@lst.de>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: Re: [PATCH 1/4] xen-blkfront: set max_discard/secure erase limits
 to UINT_MAX
Message-ID: <20240220155041.GA17393@lst.de>
References: <20240220084935.3282351-1-hch@lst.de> <20240220084935.3282351-2-hch@lst.de> <ZdSPj32Ww80nKQhM@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZdSPj32Ww80nKQhM@macbook>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Feb 20, 2024 at 12:39:59PM +0100, Roger Pau Monné wrote:
> On Tue, Feb 20, 2024 at 09:49:32AM +0100, Christoph Hellwig wrote:
> > Currently xen-blkfront set the max discard limit to the capacity of
> > the device, which is suboptimal when the capacity changes.  Just set
> > it to UINT_MAX, which has the same effect except and is simpler.
> 
> Extra 'except' in the line above?

Yes, thanks.

