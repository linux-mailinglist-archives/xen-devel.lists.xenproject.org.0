Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0D5801A26
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 03:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645916.1008474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9GBS-0006DJ-VU; Sat, 02 Dec 2023 02:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645916.1008474; Sat, 02 Dec 2023 02:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9GBS-000680-Su; Sat, 02 Dec 2023 02:56:46 +0000
Received: by outflank-mailman (input) for mailman id 645916;
 Sat, 02 Dec 2023 02:56:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fhqb=HN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r9GBR-00066A-H6
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 02:56:45 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6af153a7-90be-11ee-9b0f-b553b5be7939;
 Sat, 02 Dec 2023 03:56:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EA20DCE26D5;
 Sat,  2 Dec 2023 02:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 348A3C433C8;
 Sat,  2 Dec 2023 02:56:34 +0000 (UTC)
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
X-Inumbo-ID: 6af153a7-90be-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701485795;
	bh=Q6Nf8w414NhuF1hO6lzOGvFdUsDc+phR9HS3+o5Wchc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rnkHTFpxtFjxeiUJf2ozyjFRI+fRUlzJy1AvMr1Xiq1ZmwbXnwRA+v61dkWDtSizN
	 e8P/4u1lKrr3ApFzsC3sWoA2W1SxnNzVG2yzhtzKuP8fS1EcJoBd/0hznAI7lnynaR
	 uSju4Z30VLrkqMbEBCebei/zoMaFONRDJ7Qmbz7G+622CnIylgr8A2mOR6QadpkNKQ
	 63sbSUVZc9u8Lv970Chkv6FBLWe4EXpOVN4gR2w21uV5GBKx4N83s4cgGXjy5dyB/6
	 DO9lGFyA1w+0Mm8faZ6HablajnakSzm4UpMTJ1zOmpBZp3NVg6TeZmhPmkJmJTEonB
	 Pctc3283DUR/w==
Date: Fri, 1 Dec 2023 18:56:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v6 4/5] [FUTURE] xen/arm: enable vPCI for domUs
In-Reply-To: <ZWmkh0Xeaynh43N7@macbook>
Message-ID: <alpine.DEB.2.22.394.2312011847520.110490@ubuntu-linux-20-04-desktop>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com> <20231113222118.825758-5-stewart.hildebrand@amd.com> <ZWmkh0Xeaynh43N7@macbook>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-6006464-1701485324=:110490"
Content-ID: <alpine.DEB.2.22.394.2312011849100.110490@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-6006464-1701485324=:110490
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2312011849101.110490@ubuntu-linux-20-04-desktop>

On Fri, 1 Dec 2023, Roger Pau Monné wrote:
> On Mon, Nov 13, 2023 at 05:21:13PM -0500, Stewart Hildebrand wrote:
> > @@ -1618,6 +1630,14 @@ int iommu_do_pci_domctl(
> >          bus = PCI_BUS(machine_sbdf);
> >          devfn = PCI_DEVFN(machine_sbdf);
> >  
> > +        if ( needs_vpci(d) && !has_vpci(d) )
> > +        {
> > +            printk(XENLOG_G_WARNING "Cannot assign %pp to %pd: vPCI support not enabled\n",
> > +                   &PCI_SBDF(seg, bus, devfn), d);
> > +            ret = -EPERM;
> > +            break;
> 
> I think this is likely too restrictive going forward.  The current
> approach is indeed to enable vPCI on a per-domain basis because that's
> how PVH dom0 uses it, due to being unable to use ioreq servers.
> 
> If we start to expose vPCI suport to guests the interface should be on
> a per-device basis, so that vPCI could be enabled for some devices,
> while others could still be handled by ioreq servers.
> 
> We might want to add a new flag to xen_domctl_assign_device (used by
> XEN_DOMCTL_assign_device) in order to signal whether the device will
> use vPCI.

Actually I don't think this is a good idea. I am all for flexibility but
supporting multiple different configurations comes at an extra cost for
both maintainers and contributors. I think we should try to reduce the
amount of configurations we support rather than increasing them
(especially on x86 where we have PV, PVH, HVM).

I don't think we should enable IOREQ servers to handle PCI passthrough
for PVH guests and/or guests with vPCI. If the domain has vPCI, PCI
Passthrough can be handled by vPCI just fine. I think this should be a
good anti-feature to have (a goal to explicitly not add this feature) to
reduce complexity. Unless you see a specific usecase to add support for
it?
--8323329-6006464-1701485324=:110490--

