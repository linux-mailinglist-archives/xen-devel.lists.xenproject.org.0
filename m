Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B50CA640FD9
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 22:18:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452281.710104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1DPL-0004Kc-HA; Fri, 02 Dec 2022 21:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452281.710104; Fri, 02 Dec 2022 21:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1DPL-0004HC-DK; Fri, 02 Dec 2022 21:17:19 +0000
Received: by outflank-mailman (input) for mailman id 452281;
 Fri, 02 Dec 2022 21:17:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=myKJ=4A=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p1DPK-0004H6-78
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 21:17:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b11911a1-7286-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 22:17:15 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4ED7623E8;
 Fri,  2 Dec 2022 21:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEB5C433C1;
 Fri,  2 Dec 2022 21:17:11 +0000 (UTC)
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
X-Inumbo-ID: b11911a1-7286-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670015833;
	bh=Daxnn9PxSBnQ8obySBdXs/Ovh5ZwL9UWPHAxJS63sKY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RSCYRwi9hysgKOyVwJQDTH8mRGQd59YQETBzp9rlNcmhbbpM5BjBVs7V3nf7cHBDV
	 lxSNpuM1uOPDKeJyikEj0ZPezdXfdDSymlre2rM+OPkf1E58KcH2vyk5b3EDZroWDZ
	 rfl3xq2GUjdkDQnucuLWg5jainrPDIboIQKHJVL0wJ3S0r3xv7LJhKqy8I9y7BpeVW
	 OLqywA30xZ04b2Zi3lc3xRpu82rGFQ4vm69Xr3v44jbdc2kUvvGAdE1EPmjQmZ538v
	 Q5ikTHz+INkccLYZLvWDrPHIjP8+bnFEC3z6AJsDtM7MtguaGUNHrvVg0DxSg8vnRX
	 YB0W+7A3HSI9w==
Date: Fri, 2 Dec 2022 13:17:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
cc: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-dev@xilinx.com, 
    Paolo Bonzini <pbonzini@redhat.com>, stefano.stabellini@amd.com, 
    alex.bennee@linaro.org, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    "open list:All patches CC here" <qemu-devel@nongnu.org>, 
    =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
    Thomas Huth <thuth@redhat.com>
Subject: Re: [QEMU][PATCH v2 05/11] include/hw/xen/xen_common: return error
 from xen_create_ioreq_server
In-Reply-To: <4b143736-d5a4-ac75-3671-9566a00707af@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2212021316530.4039@ubuntu-linux-20-04-desktop>
References: <20221202030003.11441-1-vikram.garhwal@amd.com> <20221202030003.11441-6-vikram.garhwal@amd.com> <a45c902a-043d-5256-7961-40c8aabd89b4@linaro.org> <4b143736-d5a4-ac75-3671-9566a00707af@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-181244257-1670015833=:4039"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-181244257-1670015833=:4039
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 1 Dec 2022, Philippe Mathieu-Daudé wrote:
> On 2/12/22 08:19, Philippe Mathieu-Daudé wrote:
> > Hi Stefano and Vikram,
> > 
> > On 2/12/22 03:59, Vikram Garhwal wrote:
> > > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > > 
> > > This is done to prepare for enabling xenpv support for ARM architecture.
> > > On ARM it is possible to have a functioning xenpv machine with only the
> > > PV backends and no IOREQ server. If the IOREQ server creation fails,
> > > continue to the PV backends initialization.
> > > 
> > > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > > ---
> > >   include/hw/xen/xen_common.h | 13 ++++++++-----
> > >   1 file changed, 8 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
> > > index 77ce17d8a4..6510ac15e0 100644
> > > --- a/include/hw/xen/xen_common.h
> > > +++ b/include/hw/xen/xen_common.h
> > > @@ -467,9 +467,10 @@ static inline void xen_unmap_pcidev(domid_t dom,
> > >   {
> > >   }
> > > -static inline void xen_create_ioreq_server(domid_t dom,
> > > -                                           ioservid_t *ioservid)
> > 
> > How long are we supposed to maintain this code? Per [*]:
> > 
> >    In general XenProject.org supports stable branches for 18 months full
> >    support plus 18 months security fixes. When a new X.Y.0 release is
> >    made there is usually one more release on the to-be-retired stable
> >    branch to mop up any loose patches sitting in the repository at which
> >    point the branch is retired.
> > 
> > 4.17 was just released. 4.5 was 7 years ago. IIUC EOL'ed 4 years ago.

Hi Philippe,

So far we have not removed any of the old compatibility code in the xen
headers like xen_common.h. However, you have a point and I think we
could do so going forward. Like you wrote, 4.5 was 7 years ago, I would
be happy to remove the old compatibility code to support ancient
releases and that would simplify the code in the QEMU xen headers quite
a bit.

That said, the change in this patch is orthogonal. This is needed anyway
because we can have very modern Xen builds without IOREQ server
capabilities (it is a kconfig option). So we would still need this patch.

Cheers,

Stefano



> > [*]
> > https://wiki.xenproject.org/wiki/Xen_Project_Maintenance_Releases#Stable_Maintenance_Branches
> 
> +Paolo for commit 14efd8d3b5 ("meson, configure: move Xen detection to
> meson"):
> 
>     xen_libs = {
>       '4.11.0': [ 'xenstore', 'xenctrl', 'xendevicemodel', 'xenforeignmemory',
> 'xengnttab', 'xenevtchn', 'xentoolcore' ],
>       '4.10.0': [ 'xenstore', 'xenctrl', 'xendevicemodel', 'xenforeignmemory',
> 'xengnttab', 'xenevtchn', 'xentoolcore' ],
>       '4.9.0': [ 'xenstore', 'xenctrl', 'xendevicemodel', 'xenforeignmemory',
> 'xengnttab', 'xenevtchn' ],
>       '4.8.0': [ 'xenstore', 'xenctrl', 'xenforeignmemory', 'xengnttab',
> 'xenevtchn' ],
>       '4.7.1': [ 'xenstore', 'xenctrl', 'xenforeignmemory', 'xengnttab',
> 'xenevtchn' ],
>       '4.6.0': [ 'xenstore', 'xenctrl' ],
>       '4.5.0': [ 'xenstore', 'xenctrl' ],
>       '4.2.0': [ 'xenstore', 'xenctrl' ],
>     }
> 
> According to repology for the 'xen' package:
> 
>    FreeBSD (ports):    4.16
>    Debian 11:          4.14.5
>    Fedora 35:          4.16.2
>    Ubuntu 20.04:       4.11.3
>    OpenSUSE Leap 15.3: 4.14.1
>    RHEL 8:             ?
> 
--8323329-181244257-1670015833=:4039--

