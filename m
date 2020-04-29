Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C27A91BE84A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 22:18:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTt8N-0001Bh-03; Wed, 29 Apr 2020 20:16:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWzR=6N=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jTt8L-0001Ba-30
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 20:16:41 +0000
X-Inumbo-ID: 55f0f178-8a56-11ea-b9cf-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55f0f178-8a56-11ea-b9cf-bc764e2007e4;
 Wed, 29 Apr 2020 20:16:40 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 854E92083B;
 Wed, 29 Apr 2020 20:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588191399;
 bh=+WwQinBy5HLz5vqGNTrSlYo5fEFhi7mlHNUQ/AiAnDA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=FpcIkNXDMLpFoA+lgnm212TXYbj5FppIknp/xXdVA2xSRm8unHppnQHB5ccvCg0ey
 7Eus42oLMPnGkMor9mL96VC75uhMjwYNgB4/s7HuZqwq5Z84H4MEd66Zxf1s1eBs9b
 D0j3WerYOE3Fkow14YZR+VDHfTldbyYIBNTn9Bnk=
Date: Wed, 29 Apr 2020 13:16:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 0/12] direct-map DomUs
In-Reply-To: <4a62c7c1-710f-21a9-a6cc-03aa290e18b1@xen.org>
Message-ID: <alpine.DEB.2.21.2004291313030.28941@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <4a62c7c1-710f-21a9-a6cc-03aa290e18b1@xen.org>
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
Cc: Artem_Mygaiev@epam.com, peng.fan@nxp.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com,
 George.Dunlap@citrix.com, Bertrand.Marquis@arm.com, jbeulich@suse.com,
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 16 Apr 2020, Julien Grall wrote:
> > Stefano Stabellini (12):
> >        xen: introduce xen_dom_flags
> >        xen/arm: introduce arch_xen_dom_flags and direct_map
> >        xen/arm: introduce 1:1 mapping for domUs
> >        xen: split alloc_heap_pages in two halves for reusability
> >        xen: introduce reserve_heap_pages
> >        xen/arm: reserve 1:1 memory for direct_map domUs
> >        xen/arm: new vgic: rename vgic_cpu/dist_base to c/dbase
> >        xen/arm: if is_domain_direct_mapped use native addresses for GICv2
> >        xen/arm: if is_domain_direct_mapped use native addresses for GICv3
> >        xen/arm: if is_domain_direct_mapped use native UART address for vPL011
> 
> The 3 patches above cover addresses but not interrupts. Why?

Hi Julien,

I take that you are referring to GUEST_VPL011_SPI, right?

