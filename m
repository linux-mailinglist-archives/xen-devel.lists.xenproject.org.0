Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A81A67FD7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 23:35:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919868.1324208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tufVs-0001B1-PR; Tue, 18 Mar 2025 22:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919868.1324208; Tue, 18 Mar 2025 22:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tufVs-00018l-MY; Tue, 18 Mar 2025 22:34:20 +0000
Received: by outflank-mailman (input) for mailman id 919868;
 Tue, 18 Mar 2025 22:34:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gc9A=WF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tufVr-00018f-7J
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 22:34:19 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 203261c9-0449-11f0-9abc-95dc52dad729;
 Tue, 18 Mar 2025 23:34:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 57B956159C;
 Tue, 18 Mar 2025 22:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87406C4CEDD;
 Tue, 18 Mar 2025 22:34:14 +0000 (UTC)
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
X-Inumbo-ID: 203261c9-0449-11f0-9abc-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742337256;
	bh=Dd9GoETCYGs+epNWIKK8O1R25a3y1klevYiElX3k6nA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G+HAgJencfwByo4dE7SsI6bq6vXTABjEf3oDsxNermHiSf2tc44bvuSOoRN+jrRG6
	 omL5jZ/XC1tcbjRM9fd226fg/B9G58+XZ6HAigDb6IkIydUIPffV7WutMbgZfApyk1
	 zjAN6prG0fGpFzIpuDVwHb2XuKgJzHgYoI3LHV8jMqPhVJWstMN4EOxPEig62Z45yx
	 U+rarsp/6Zar+S1VoXHXtgnXJHZzww/BhJtF1A4SPM1xw/lbIHj8cq7kaFTOELvT9V
	 0bp4f59LmmFb9HWLAm5AZViKyvhTBPL6N1eTyf3xRkgpaZccUNdjDzASdpGuDbYtSg
	 i7EoK4ouzd23Q==
Date: Tue, 18 Mar 2025 15:34:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 15/23] xen/xsm: Add XSM_HW_PRIV
In-Reply-To: <bc8505f5-0712-4661-b6af-8d8f96a1ea2b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2503181533590.3477110@ubuntu-linux-20-04-desktop>
References: <20250306220343.203047-1-jason.andryuk@amd.com> <20250306220343.203047-16-jason.andryuk@amd.com> <095042a0-94c1-4f86-b6df-836a7107efa2@suse.com> <a6bd6175-32fb-4da5-b70d-70e8dabadf66@amd.com> <alpine.DEB.2.22.394.2503171653220.3477110@ubuntu-linux-20-04-desktop>
 <bc8505f5-0712-4661-b6af-8d8f96a1ea2b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Mar 2025, Jan Beulich wrote:
> On 18.03.2025 00:55, Stefano Stabellini wrote:
> > On Mon, 17 Mar 2025, Jason Andryuk wrote:
> >> On 2025-03-17 10:22, Jan Beulich wrote:
> >>> On 06.03.2025 23:03, Jason Andryuk wrote:
> >>>> --- a/xen/include/xsm/dummy.h
> >>>> +++ b/xen/include/xsm/dummy.h
> >>>> @@ -95,7 +95,11 @@ static always_inline int xsm_default_action(
> >>>>               return 0;
> >>>>           fallthrough;
> >>>>       case XSM_PRIV:
> >>>> -        if ( is_control_domain(src) )
> >>>> +    case XSM_HW_PRIV:
> >>>> +        if ( is_control_domain(src) && action != XSM_HW_PRIV )
> >>>> +            return 0;
> >>>> +        if ( is_hardware_domain(src) &&
> >>>> +             (action == XSM_HW_PRIV || action == XSM_DM_PRIV) )
> >>>>               return 0;
> >>>>           return -EPERM;
> >>>
> >>> Hmm. Isn't DM_PRIV a property applying to the control domain (besides
> >>> any stub domains), but not the hardware one?
> >>
> >> I ran QEMU in hardware domain to provide devices to a domU.  I thought QEMU
> >> would better run in hardware domain than control domain.
> > 
> > Leaving stubdoms aside, QEMU has to run in the hardware domain because
> > the hardware domain is less privileged. QEMU can be attacked or affected
> > by the guest so it is undesirable to run QEMU in the control domain
> > which is highly privileged, and considered highly secure / safe.
> 
> Yet having access to the hardware, hwdom can likely also do about anything
> to the system. IOW I'd consider this "highly privileged" too, just not from
> a pure software perspective. If you want a secure / safe environment, I
> fear you won't get around using further (stub?) domain(s) to run qemu in.

Traditionally, from an upstream Xen Project perspective, it is important
to support as many hardware platforms as possible. The goal is to
provide the best possible out-of-the-box experience, including support
for devices like the Raspberry Pi 4 (RPi4), which has certain quirks and
limited IOMMU support.  

However, when considering safety (similar concepts also apply to
security) it is necessary to write down assumptions. One key assumption
is that the system includes an IOMMU and that all DMA-capable devices
are protected by it.  

There are boards, such as the RPi4, that do not meet these assumptions.
While Xen can and should run on such hardware, the level of flexibility
in configuring safe environments on these boards will be limited.  

For example, on the RPi4, I would not recommend to run QEMU in an unsafe
hardware domaini because the hardware domain will end up having control
over unprotected DMA-capable devices that can be used to harm the
system. However, it will be possible to run QEMU in an unsafe hardware
domains on platforms were all DMA-capable devices that can harm the
system are IOMMU protected, such as Xilinx MPSoC when configured
correctly.

