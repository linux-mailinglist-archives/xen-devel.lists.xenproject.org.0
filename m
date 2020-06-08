Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4321F2200
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 00:55:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiQgB-00027c-II; Mon, 08 Jun 2020 22:55:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yn46=7V=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jiQg9-00027Q-DH
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 22:55:41 +0000
X-Inumbo-ID: 2cf23418-a9db-11ea-b2c4-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cf23418-a9db-11ea-b2c4-12813bfff9fa;
 Mon, 08 Jun 2020 22:55:40 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE7B8206D5;
 Mon,  8 Jun 2020 22:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591656940;
 bh=lmj78NsywzOH58ADrFq/+/zw3NLJPj16X1Kl9wTzZlA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=vxd2TBISH8H0Cfr4Y2boYussvZELUi1dGQYCN0391gCqf+M+zEHTxMJ3eiBCXwo/m
 Qcaay/hGXQIgfxgQfJp6K0fsW1H0JquhtId6jMP4h7XA9wKQlvbZd8pIDvL8CaAR+0
 VU9uq18isLanuFMVY8NzMiP+1IEas3OaCgSqXiUI=
Date: Mon, 8 Jun 2020 15:55:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 03/11] swiotlb-xen: add struct device* parameter to
 xen_phys_to_bus
In-Reply-To: <20200608070507.GB15742@infradead.org>
Message-ID: <alpine.DEB.2.21.2006081539550.2815@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2006031506590.6774@sstabellini-ThinkPad-T480s>
 <20200603222247.11681-3-sstabellini@kernel.org>
 <20200608070507.GB15742@infradead.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 konrad.wilk@oracle.com, roman@zededa.com, linux-kernel@vger.kernel.org,
 tamas@tklengyel.com, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 8 Jun 2020, Christoph Hellwig wrote:
> On Wed, Jun 03, 2020 at 03:22:39PM -0700, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > The parameter is unused in this patch.
> > No functional changes.
> 
> This looks weird.  I'm pretty sure you are going to use it later, but
> why not just add the argument when it actually is used?

It is just a matter of taste. Xen reviewers tend to ask for splitting
patches into small chunks, especially large verbose non-functional
changes like renaming or adding parameters. It is supposed to make it
easier to review, to make it easier not to get distracted by
renaming/non-functional changes while looking at the important changes.
As a contributor, I am happy either way.

