Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C748123BD95
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 17:53:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2zFJ-0004xQ-S8; Tue, 04 Aug 2020 15:52:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWh=BO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k2zFI-0004xL-H9
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 15:52:56 +0000
X-Inumbo-ID: be60f59d-d5b7-44c7-bc9e-de44d9d9656c
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be60f59d-d5b7-44c7-bc9e-de44d9d9656c;
 Tue, 04 Aug 2020 15:52:55 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D16492177B;
 Tue,  4 Aug 2020 15:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596556375;
 bh=tDpIkWuSdpodqGPQDWIFOE7o7/wTSGZ0oJmR6Sz9Ia0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=OI3MDkvGqDpsgTM5w7jN/tiL+atoldmOEjEfCWS7pHTnC2Uy1MY0J813NPeuSI6rz
 xhvQyEAAalWPyUsZx6E0SeXw3RI4fmv3s0L+a9GjazjECiPEKRU1BLI8ztJSblepe0
 uakSz5POYLuNJqFDfji1qYcISOWDiO6oPuAcHGYI=
Date: Tue, 4 Aug 2020 08:52:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
Subject: Re: [PATCH v3 00/11] fix swiotlb-xen for RPi4
In-Reply-To: <8413f3e2-0bbf-efa3-1a8a-2ae05b1d07c8@suse.com>
Message-ID: <alpine.DEB.2.21.2008040852460.5748@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2007101521290.4124@sstabellini-ThinkPad-T480s>
 <8413f3e2-0bbf-efa3-1a8a-2ae05b1d07c8@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1376642103-1596556375=:5748"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, konrad.wilk@oracle.com,
 roman@zededa.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 tamas@tklengyel.com, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1376642103-1596556375=:5748
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 4 Aug 2020, Jürgen Groß wrote:
> On 11.07.20 00:34, Stefano Stabellini wrote:
> > Hi all,
> > 
> > This series is a collection of fixes to get Linux running on the RPi4 as
> > dom0. Conceptually there are only two significant changes:
> > 
> > - make sure not to call virt_to_page on vmalloc virt addresses (patch
> >    #1)
> > - use phys_to_dma and dma_to_phys to translate phys to/from dma
> >    addresses (all other patches)
> > 
> > 
> > I addressed all comments by Christoph to v2 of the series except from
> > the one about merging the precursor "add struct device *" patches. I can
> > always merge them together at any time as needed.
> > 
> > 
> > Boris gave his Reviewed-by to the whole series v2. I added his
> > Reviewed-by to all patches, including the ones with small cosmetic
> > fixes, except for patch #8 #9 #10 because they are either new or changed
> > significantly in this version of the series.
> > 
> > I retained Roman and Corey's Tested-by.
> 
> Series pushed to: xen/tip.git for-linus-5.9

Fantastic, thank you!
--8323329-1376642103-1596556375=:5748--

