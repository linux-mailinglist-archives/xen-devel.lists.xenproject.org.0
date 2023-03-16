Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE286BD12F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 14:45:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510610.788587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcnv7-0001nX-C1; Thu, 16 Mar 2023 13:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510610.788587; Thu, 16 Mar 2023 13:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcnv7-0001kA-8w; Thu, 16 Mar 2023 13:45:29 +0000
Received: by outflank-mailman (input) for mailman id 510610;
 Thu, 16 Mar 2023 13:45:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hcJX=7I=gmail.com=alexdeucher@srs-se1.protection.inumbo.net>)
 id 1pcnv5-0001k4-UR
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 13:45:28 +0000
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce6f3073-c400-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 14:45:26 +0100 (CET)
Received: by mail-ot1-x331.google.com with SMTP id
 f17-20020a9d7b51000000b00697349ab7e7so978924oto.9
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 06:45:27 -0700 (PDT)
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
X-Inumbo-ID: ce6f3073-c400-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678974326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWCKbtplZJ+ZPgiQ+llRwn6vMzQlR6RfveV/kyzoYt0=;
        b=Fa5TBJOICTZGaAxV8ye5x/ZGojNIPknDBs5bvwl/jjueeLJVcAM9u1WFzuXQI7xZCR
         n7Kg/cy4BRgB25po6d/b/l6zWT4zDdvL2TmjSvcTB6aaPSDjYx0DTg7J/Ef3bJ1vHrfP
         oc3iTg8aJ+duikjB3ZL0qXYVMXCAAwGrg+YD3g82Cdkt6m3gdjfq+00C3MOagRFgOfPO
         8gPjTi+3DqW8ZvZ1o+KlDr+O1RGQYuO6L99FTGyc/GY1iALewM4OETUp5E3miX4XFIFp
         eYrGZtgMHqU4iH1Yk3QGWbiUWd99Q6qZxWmwmN3GvrpCWRJrOrbOR4SzR863ePdEPcBC
         C/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678974326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWCKbtplZJ+ZPgiQ+llRwn6vMzQlR6RfveV/kyzoYt0=;
        b=ZitmvwW59x7ZP6/NKqIdaX6A0S5CClT38ko4mKvEBdA3BPgkwnXRR8jjxbzdoZP7V0
         /UBkI6L+PpuRQbGyiheZExPVANE5pNToYSB9W/s1Ox01Bu9ujHzHm32wm2YVt+0rv905
         LBwaDJNxC3xkZj+6V0Ubq6pZurdowJg6ptW2KmoP7NKxdEJHpxH8GT4kCFuu9acp5y7/
         Bzk8mHdrrxE0AzxsNS5LMlrnexktytG1qHpqaA8YuUc7gXnciy2dVxNUCrgZSWl8kkrl
         yUjBda3iVLPOMGneF1z6CS/WiFy6ZiUpCeK0QXyF0J35ALah0NcxiCKs4xzHYGY4dPQn
         0urQ==
X-Gm-Message-State: AO0yUKXE5In6vd+lk2xpAyRX50V4/7lTGPp5j7Hk8VZZaswO4FaSK47q
	WN4PdRS6/il05bu9rgX/2ilXgyT3inNAT+/2iKg=
X-Google-Smtp-Source: AK7set+3qR+KxTZtbczZDS3CGBW6F0/GCDOIJw7w85TfFDZI7hjqtUvXWb4ZF1iNyyygRY1zoh1WOtxULP5svQP6l+0=
X-Received: by 2002:a05:6830:3345:b0:698:d198:fe9a with SMTP id
 l5-20020a056830334500b00698d198fe9amr2702720ott.3.1678974325749; Thu, 16 Mar
 2023 06:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230312120157.452859-1-ray.huang@amd.com> <20230312120157.452859-2-ray.huang@amd.com>
 <ea0e3852-87ba-984b-4010-5eeac3d6c507@suse.com> <alpine.DEB.2.22.394.2303141747350.863724@ubuntu-linux-20-04-desktop>
 <f5e03f2a-8176-528f-e885-9a97940367c0@suse.com> <alpine.DEB.2.22.394.2303151616200.3462@ubuntu-linux-20-04-desktop>
 <5e22a45d-6f12-da9b-94f6-3112a30e8574@suse.com>
In-Reply-To: <5e22a45d-6f12-da9b-94f6-3112a30e8574@suse.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Mar 2023 09:45:14 -0400
Message-ID: <CADnq5_PH9ZqDqpPES74V3fB3NVpaexDoGTyu_+-zoux5vgagyg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Honglei Huang <honglei1.huang@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Huang Rui <ray.huang@amd.com>, 
	Chen Jiqian <Jiqian.Chen@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>, 
	Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Julia Zhang <julia.zhang@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 16, 2023 at 3:50=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 16.03.2023 00:25, Stefano Stabellini wrote:
> > On Wed, 15 Mar 2023, Jan Beulich wrote:
> >> On 15.03.2023 01:52, Stefano Stabellini wrote:
> >>> On Mon, 13 Mar 2023, Jan Beulich wrote:
> >>>> On 12.03.2023 13:01, Huang Rui wrote:
> >>>>> Xen PVH is the paravirtualized mode and takes advantage of hardware
> >>>>> virtualization support when possible. It will using the hardware IO=
MMU
> >>>>> support instead of xen-swiotlb, so disable swiotlb if current domai=
n is
> >>>>> Xen PVH.
> >>>>
> >>>> But the kernel has no way (yet) to drive the IOMMU, so how can it ge=
t
> >>>> away without resorting to swiotlb in certain cases (like I/O to an
> >>>> address-restricted device)?
> >>>
> >>> I think Ray meant that, thanks to the IOMMU setup by Xen, there is no
> >>> need for swiotlb-xen in Dom0. Address translations are done by the IO=
MMU
> >>> so we can use guest physical addresses instead of machine addresses f=
or
> >>> DMA. This is a similar case to Dom0 on ARM when the IOMMU is availabl=
e
> >>> (see include/xen/arm/swiotlb-xen.h:xen_swiotlb_detect, the correspond=
ing
> >>> case is XENFEAT_not_direct_mapped).
> >>
> >> But how does Xen using an IOMMU help with, as said, address-restricted
> >> devices? They may still need e.g. a 32-bit address to be programmed in=
,
> >> and if the kernel has memory beyond the 4G boundary not all I/O buffer=
s
> >> may fulfill this requirement.
> >
> > In short, it is going to work as long as Linux has guest physical
> > addresses (not machine addresses, those could be anything) lower than
> > 4GB.
> >
> > If the address-restricted device does DMA via an IOMMU, then the device
> > gets programmed by Linux using its guest physical addresses (not machin=
e
> > addresses).
> >
> > The 32-bit restriction would be applied by Linux to its choice of guest
> > physical address to use to program the device, the same way it does on
> > native. The device would be fine as it always uses Linux-provided <4GB
> > addresses. After the IOMMU translation (pagetable setup by Xen), we
> > could get any address, including >4GB addresses, and that is expected t=
o
> > work.
>
> I understand that's the "normal" way of working. But whatever the swiotlb
> is used for in baremetal Linux, that would similarly require its use in
> PVH (or HVM) aiui. So unconditionally disabling it in PVH would look to
> me like an incomplete attempt to disable its use altogether on x86. What
> difference of PVH vs baremetal am I missing here?

swiotlb is not usable for GPUs even on bare metal.  They often have
hundreds or megs or even gigs of memory mapped on the device at any
given time.  Also, AMD GPUs support 44-48 bit DMA masks (depending on
the chip family).

Alex

