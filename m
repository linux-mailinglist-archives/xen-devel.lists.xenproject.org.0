Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51C96BC2ED
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 01:44:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510282.787670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcbjA-0006OP-VM; Thu, 16 Mar 2023 00:44:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510282.787670; Thu, 16 Mar 2023 00:44:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcbjA-0006MI-SC; Thu, 16 Mar 2023 00:44:20 +0000
Received: by outflank-mailman (input) for mailman id 510282;
 Thu, 16 Mar 2023 00:44:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oCnM=7I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pcbjA-0006MC-3D
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 00:44:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae6a250d-c393-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 01:44:18 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A76F361ECC;
 Thu, 16 Mar 2023 00:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35909C433D2;
 Thu, 16 Mar 2023 00:44:14 +0000 (UTC)
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
X-Inumbo-ID: ae6a250d-c393-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678927456;
	bh=XTM4UddlIKsD1aJiVMuVl16OwUKw+GT8fnMZjNm0OYo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=b3kTDFZ6mLP6O2/7JrF7EZAlqjLBfRQZ2VevpUT/INbI15RDr5Mpt8SjzPv8afh6o
	 QZid2tOiGykioeBbOt5Mj4zn9SfzJe18A0UBMG7qC/fsem6zKga3vHrzstYqOGB0mn
	 U+3GXa3ZdUO4Y9KJrNkS91JOVuaO+0gGFN8skRS3V0dn+/XBR9oIpWQB+/BEi7FZ7b
	 ngCQQQAlu763ldOuHd+nDySfPURd/kKxzLbXoxVe5Jk52U4CYufe5eZokAGL1501aq
	 2kNz/61DI7ozd2BIZyOTgDd9TUS2bJRjyo6g2BF1qa+38KUAANxiZ2WwGIVLmGxpGG
	 M2+wIPGdM0wzA==
Date: Wed, 15 Mar 2023 17:44:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Huang Rui <ray.huang@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
    Alex Deucher <alexander.deucher@amd.com>, 
    =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Xenia Ragiadakou <burzalodowa@gmail.com>, 
    Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, 
    Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH 6/6] tools/libs/light: pci: translate irq to
 gsi
In-Reply-To: <ZBHz7PpUbKM69Xxe@Air-de-Roger>
Message-ID: <alpine.DEB.2.22.394.2303151729590.3462@ubuntu-linux-20-04-desktop>
References: <20230312075455.450187-1-ray.huang@amd.com> <20230312075455.450187-7-ray.huang@amd.com> <ZBHz7PpUbKM69Xxe@Air-de-Roger>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-986031305-1678926871=:3462"
Content-ID: <alpine.DEB.2.22.394.2303151735591.3462@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-986031305-1678926871=:3462
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2303151735592.3462@ubuntu-linux-20-04-desktop>

On Wed, 15 Mar 2023, Roger Pau Monné wrote:
> On Sun, Mar 12, 2023 at 03:54:55PM +0800, Huang Rui wrote:
> > From: Chen Jiqian <Jiqian.Chen@amd.com>
> > 
> > Use new xc_physdev_gsi_from_irq to get the GSI number
> > 
> > Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> >  tools/libs/light/libxl_pci.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> > index f4c4f17545..47cf2799bf 100644
> > --- a/tools/libs/light/libxl_pci.c
> > +++ b/tools/libs/light/libxl_pci.c
> > @@ -1486,6 +1486,7 @@ static void pci_add_dm_done(libxl__egc *egc,
> >          goto out_no_irq;
> >      }
> >      if ((fscanf(f, "%u", &irq) == 1) && irq) {
> > +        irq = xc_physdev_gsi_from_irq(ctx->xch, irq);
> 
> This is just a shot in the dark, because I don't really have enough
> context to understand what's going on here, but see below.
> 
> I've taken a look at this on my box, and it seems like on
> dom0 the value returned by /sys/bus/pci/devices/SBDF/irq is not
> very consistent.
> 
> If devices are in use by a driver the irq sysfs node reports either
> the GSI irq or the MSI IRQ (in case a single MSI interrupt is
> setup).
> 
> It seems like pciback in Linux does something to report the correct
> value:
> 
> root@lcy2-dt107:~# cat /sys/bus/pci/devices/0000\:00\:14.0/irq
> 74
> root@lcy2-dt107:~# xl pci-assignable-add 00:14.0
> root@lcy2-dt107:~# cat /sys/bus/pci/devices/0000\:00\:14.0/irq
> 16
> 
> As you can see, making the device assignable changed the value
> reported by the irq node to be the GSI instead of the MSI IRQ, I would
> think you are missing something similar in the PVH setup (some pciback
> magic)?
> 
> Albeit I have no idea why you would need to translate from IRQ to GSI
> in the way you do in this and related patches, because I'm missing the
> context.

As I mention in another email, also keep in mind that we need QEMU to
work and QEMU calls:
1) xc_physdev_map_pirq (this is also called from libxl)
2) xc_domain_bind_pt_pci_irq


In this case IRQ != GSI (IRQ == 112, GSI == 28). Sysfs returns the IRQ
in Linux (112), but actually xc_physdev_map_pirq expects the GSI, not
the IRQ. If you look at the implementation of xc_physdev_map_pirq,
you'll the type is "MAP_PIRQ_TYPE_GSI" and also see the check in Xen
xen/arch/x86/irq.c:allocate_and_map_gsi_pirq:

    if ( index < 0 || index >= nr_irqs_gsi )
    {
        dprintk(XENLOG_G_ERR, "dom%d: map invalid irq %d\n", d->domain_id,
                index);
        return -EINVAL;
    }

nr_irqs_gsi < 112, and the check will fail.

So we need to pass the GSI to xc_physdev_map_pirq. To do that, we need
to discover the GSI number corresponding to the IRQ number.
--8323329-986031305-1678926871=:3462--

