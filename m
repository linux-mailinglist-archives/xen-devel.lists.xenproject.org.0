Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F991EE891
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 18:28:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgsiC-0002kx-80; Thu, 04 Jun 2020 16:27:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m3HA=7R=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jgsiB-0002ks-2d
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 16:27:23 +0000
X-Inumbo-ID: 447f7158-a680-11ea-8993-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 447f7158-a680-11ea-8993-bc764e2007e4;
 Thu, 04 Jun 2020 16:27:22 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D6B9E206DC;
 Thu,  4 Jun 2020 16:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591288042;
 bh=n+z53JuTQBr7A6TWR+WcVKvp5mm7k/fZNd4gEOeQgdE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Qzzv4gofa7uoTMFNqYBbKReANB5dy5FBWlb2U754TKIplg4Krn91GZR80gWjeiWEp
 hc5R+dJTIaFOOTma9WaAbpZemnHdSZP2JPMr5UljTKF271tXp+Yi6ireXSlKoPqDPF
 TR0PIx8Iv2mit6Fcnev7PPipImhRdlW1vQjt6yaY=
Date: Thu, 4 Jun 2020 09:27:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: UEFI support in ARM DomUs
In-Reply-To: <dc3998f3-5fa1-9b97-12cd-a1e3bb29eee5@xen.org>
Message-ID: <alpine.DEB.2.21.2006040925350.6774@sstabellini-ThinkPad-T480s>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <dc3998f3-5fa1-9b97-12cd-a1e3bb29eee5@xen.org>
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
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 4 Jun 2020, Julien Grall wrote:
> On 04/06/2020 16:26, Oleksandr Andrushchenko wrote:
> > On 6/4/20 4:57 AM, Peng Fan wrote:
> > > Grall <julien@xen.org>;
> > > > Nataliya Korovkina <malus.brandywine@gmail.com>
> > > > Subject: UEFI support in ARM DomUs
> > > We have made U-Boot run inside XEN DomU, but just only PV console part,
> > > not implement other frontend drivers currently. Would this help for your
> > > case if enable EFI in U-Boot?
> > 
> > Well, we have a working PV block implementation on top of that on iMX8
> 
> That's a nice work and will be a good addition. However...
> 
> > 
> > platform, mostly ported from mini-os. Currently we are finalizing the work
> 
> ... AFAICT mini-os is licensed using BSD-2 while U-boot is using GPLv2. So I
> would be careful with the licensing here.
> 
> It might be better to consider to port Linux PV driver instead or rewrite them
> completely.

Julien, I might be misunderstanding what you wrote. MiniOS is BSD-2 so
MiniOS code can be integrated into a GPLv2 project without issues
(becoming GPLv2.)  So it should be OK to take MiniOS code and add it to
Uboot?

The other way around would be an issue: you cannot take GPLv2 code and
add it to a BSD-2 project.

