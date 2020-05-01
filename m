Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FC61C0BAA
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 03:26:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUKRL-0000MN-9M; Fri, 01 May 2020 01:26:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7As=6P=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jUKRJ-0000ME-6a
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 01:26:05 +0000
X-Inumbo-ID: b9833e36-8b4a-11ea-ae69-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9833e36-8b4a-11ea-ae69-bc764e2007e4;
 Fri, 01 May 2020 01:26:04 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0CD8D2073E;
 Fri,  1 May 2020 01:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588296364;
 bh=pWv/QX33ZOXmq/5MgHQqFH1A2mUcgj7dyYWuh8k13zU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ytKGFG1bNFJAwu24PrnUAYhKZPQtyRtZTq9BEp1FXsgeez4RvdVSmG+Hra1s8vMcq
 3+J2d9cWh4DZ6LZwgKqbfB94Fb5KmDTKs8tK5h1MUGv0Rj8qiDmNlccszUvY5e+Ovd
 mJS0jO/c0oGBWG5rB7NoXsUA+Vaih5W3GePu/qZ8=
Date: Thu, 30 Apr 2020 18:26:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 10/12] xen/arm: if is_domain_direct_mapped use native
 UART address for vPL011
In-Reply-To: <05b46414-12c3-5f79-f4b1-46cf8750d28c@xen.org>
Message-ID: <alpine.DEB.2.21.2004301319380.28941@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-10-sstabellini@kernel.org>
 <05b46414-12c3-5f79-f4b1-46cf8750d28c@xen.org>
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr_Babchuk@epam.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 15 Apr 2020, Julien Grall wrote:
> Hi Stefano,
> 
> On 15/04/2020 02:02, Stefano Stabellini wrote:
> > We always use a fix address to map the vPL011 to domains. The address
> > could be a problem for domains that are directly mapped.
> > 
> > Instead, for domains that are directly mapped, reuse the address of the
> > physical UART on the platform to avoid potential clashes.
> 
> How do you know the physical UART MMIO region is big enough to fit the PL011?

That cannot be because the vPL011 MMIO size is 1 page, which is the
minimum right?


> What if the user want to assign the physical UART to the domain + the vpl011?

A user can assign a UART to the domain, but it cannot assign the UART
used by Xen (DTUART), which is the one we are using here to get the
physical information.


(If there is no UART used by Xen then we'll fall back to the virtual
addresses. If they conflict we return error and let the user fix the
configuration.)

