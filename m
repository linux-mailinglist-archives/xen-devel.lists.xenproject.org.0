Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 663641EC49B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 23:51:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgEoK-0002tr-ST; Tue, 02 Jun 2020 21:51:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FM/C=7P=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jgEoJ-0002tm-QY
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 21:51:03 +0000
X-Inumbo-ID: 275e99fc-a51b-11ea-9dbe-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 275e99fc-a51b-11ea-9dbe-bc764e2007e4;
 Tue, 02 Jun 2020 21:51:03 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8AA68206E2;
 Tue,  2 Jun 2020 21:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591134662;
 bh=OG5HRGyKV3zEjimah4a0c6gJZ7mOncwrp6JlgmZTJXU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=mDaApVbv13sLSvUPxDLg7qf18jrKrHmMzTnkjukv5eL/Ku5u0trpjQZW8FgRBbpE7
 uBfuTN+v5BZDdxYgO2H6sOcDNFN74Qf468AoUzW3+fytW0qRePC2BAmt9zbt8oMYoD
 zmqTdVRF9X0/E+gGvz8I7eQlQC2c74oIBtYkeX9k=
Date: Tue, 2 Jun 2020 14:51:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: jgross@suse.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH 00/10] fix swiotlb-xen for RPi4
In-Reply-To: <alpine.DEB.2.21.2005201628330.27502@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2006021447340.6774@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2005201628330.27502@sstabellini-ThinkPad-T480s>
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
Cc: xen-devel@lists.xenproject.org, tamas@tklengyel.com, sstabellini@kernel.org,
 linux-kernel@vger.kernel.org, roman@zededa.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I would like to ask the maintainers, Juergen, Boris, Konrad, whether you
have any more feedback before I send v2 of the series.

Cheers,

Stefano


On Wed, 20 May 2020, Stefano Stabellini wrote:
> Hi all,
> 
> This series is a collection of fixes to get Linux running on the RPi4 as
> dom0.
> 
> Conceptually there are only two significant changes:
> 
> - make sure not to call virt_to_page on vmalloc virt addresses (patch
>   #1)
> - use phys_to_dma and dma_to_phys to translate phys to/from dma
>   addresses (all other patches)
> 
> In particular in regards to the second part, the RPi4 is the first
> board where Xen can run that has the property that dma addresses are
> different from physical addresses, and swiotlb-xen was written with the
> assumption that phys addr == dma addr.
> 
> This series adds the phys_to_dma and dma_to_phys calls to make it work.
> 
> 
> Cheers,
> 
> Stefano
> 

