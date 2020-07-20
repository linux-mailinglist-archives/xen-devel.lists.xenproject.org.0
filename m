Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBB62272C9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 01:24:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxf8u-0003f4-0w; Mon, 20 Jul 2020 23:24:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rt7f=A7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jxf8r-0003et-Si
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 23:24:17 +0000
X-Inumbo-ID: 213131c6-cae0-11ea-a02a-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 213131c6-cae0-11ea-a02a-12813bfff9fa;
 Mon, 20 Jul 2020 23:24:17 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1CCF02080D;
 Mon, 20 Jul 2020 23:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595287456;
 bh=0YsJbppGkM3gd7bUZeqoBkXatU7RgpDLOLd+twEps+c=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=KyUNF8UQgwouyySBcQZrl5bSgrsZHqXMZVWWuw0aQysGvgsbL8zKbmMlrkOqHlisp
 RYhBF04j+nvg+E4XiVti4il9h7L20nIbf8OjIG/Fdl0HOGotGxO0eS+QcsIDhJWANL
 oUTbS10CSkd8WuQp8YfUAomVEYuzHV03/8YUrGkU=
Date: Mon, 20 Jul 2020 16:24:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, robh@kernel.org
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
In-Reply-To: <8AF78FF1-C389-44D8-896B-B95C1A0560E2@arm.com>
Message-ID: <alpine.DEB.2.21.2007201520370.32544@sstabellini-ThinkPad-T480s>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <20200717111644.GS7191@Air-de-Roger>
 <3B8A1B9D-A101-4937-AC42-4F62BE7E677C@arm.com>
 <20200717143120.GT7191@Air-de-Roger>
 <8AF78FF1-C389-44D8-896B-B95C1A0560E2@arm.com>
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
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

+ Rob Herring

On Fri, 17 Jul 2020, Bertrand Marquis wrote:
> >> Regarding the DT entry, this is not coming from us and this is already
> >> defined this way in existing DTBs, we just reuse the existing entry. 
> > 
> > Is it possible to standardize the property and drop the linux prefix?
> 
> Honestly i do not know. This was there in the DT examples we checked so
> we planned to use that. But it might be possible to standardize this.

We could certainly start a discussion about it. It looks like
linux,pci-domain is used beyond purely the Linux kernel. I think that it
is worth getting Rob's advice on this.


Rob, for context we are trying to get Linux and Xen to agree on a
numbering scheme to identify PCI host bridges correctly. We already have
an existing hypercall from the old x86 days that passes a segment number
to Xen as a parameter, see drivers/xen/pci.c:xen_add_device.
(xen_add_device assumes that a Linux domain and a PCI segment are the
same thing which I understand is not the case.) 


There is an existing device tree property called "linux,pci-domain"
which would solve the problem (ignoring the difference in the definition
of domain and segment) but it is clearly marked as a Linux-specific
property. Is there anything more "standard" that we can use?

I can find PCI domains being mentioned a few times in the Device Tree
PCI specification but can't find any associated IDs, and I couldn't find
segments at all.

What's your take on this? In general, what's your suggestion on getting
Xen and Linux (and other OSes which could be used as dom0 one day like
Zephyr) to agree on a simple numbering scheme to identify PCI host
bridges?

Should we just use "linux,pci-domain" as-is because it is already the de
facto standard? It looks like the property appears in both QEMU and
UBoot already.

