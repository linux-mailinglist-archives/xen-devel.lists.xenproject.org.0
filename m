Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EF47FF2EF
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:52:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644919.1006631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iP5-0002y8-EC; Thu, 30 Nov 2023 14:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644919.1006631; Thu, 30 Nov 2023 14:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iP5-0002vB-BF; Thu, 30 Nov 2023 14:52:35 +0000
Received: by outflank-mailman (input) for mailman id 644919;
 Thu, 30 Nov 2023 14:52:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Jom=HL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8iP4-0002v5-7M
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:52:34 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16e19bdb-8f90-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 15:52:31 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40b552deba0so9739525e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 06:52:31 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c310e00b0040b481222e3sm5978469wmo.41.2023.11.30.06.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 06:52:30 -0800 (PST)
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
X-Inumbo-ID: 16e19bdb-8f90-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701355951; x=1701960751; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dylb9GtPZfUUsFcjIq/QYTzqyPgTEh2O7rbe0XEYzNA=;
        b=sTVG+GKjECZVWxCbJNZo0WuXKSG13RbpRgPGXs/kGo6eWrP6odNWlrHlx7CxR8sxN1
         Io/UBtiCLHpM7vNe6SfoHIyY+zLarcA7TZRYz1Iz0dMWuXnld/Rz3jUQPvEIU/OuPvfX
         hv1/6QaVawSLtpYcpWiYh6R3QZKp1zWErVW04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701355951; x=1701960751;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dylb9GtPZfUUsFcjIq/QYTzqyPgTEh2O7rbe0XEYzNA=;
        b=iyNtu0ABTTilT+vGvJhmuzp73DxyrUaKgONKbSVYKUIpKYqP2KjC9Pe6jD9fLC5UsB
         UX/3sB+lIFV8dONR41ZtkSGW8NdsHuVoZ/o1QzU4GfOphXKSWPJ/NwcrWIgSCo6pzRyI
         5WslwumYiBDemd2hcuK3dCcI1IKXwVd523KX/o2qWx4tHFALYGraZ92RqZ6MvSopTbiv
         JVLRLLy1U3AqTO9Wt9hqpUJ5DNmMUGG37OZhjd0lEgMmlcjcKkEl+62LWk6craf4B1mE
         u+Wdhgq0uSPierOohDrVVnss6Jacp/rjDxgJD+eYv8jV6+fvOFFtFGjaHaHgMIKEL/ZK
         rCvw==
X-Gm-Message-State: AOJu0YzX9x1vscNOmfjPK7cGxOCJJPrsWz91jA/QtjF2Ekdbwpgigl8i
	BESOJlBmzODXmaHsyUSu6gtRkw==
X-Google-Smtp-Source: AGHT+IELK2lkjIDqTqnI/AsoJHdM7By6uJrffUpYfI5y842mXyqUl3S0BQ+j1H7uBiZTmCazCbCfVg==
X-Received: by 2002:a05:600c:1909:b0:40b:4aa9:91a9 with SMTP id j9-20020a05600c190900b0040b4aa991a9mr6295680wmq.8.1701355951203;
        Thu, 30 Nov 2023 06:52:31 -0800 (PST)
Date: Thu, 30 Nov 2023 15:52:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>
Subject: Re: [RFC XEN PATCH v2 1/3] xen/vpci: Clear all vpci status of device
Message-ID: <ZWihrmHpIrI_ccX4@macbook>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-2-Jiqian.Chen@amd.com>
 <ZWX0U1tYooY70UJo@macbook>
 <BL1PR12MB58493CC28A32E3C9B3A1767FE782A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <14d2dd16-be21-4e9a-97eb-bb477af49e73@apertussolutions.com>
 <930da43f-0395-40cb-a79d-012c4e1acbcb@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <930da43f-0395-40cb-a79d-012c4e1acbcb@apertussolutions.com>

On Thu, Nov 30, 2023 at 07:39:38AM -0500, Daniel P. Smith wrote:
> On 11/30/23 07:25, Daniel P. Smith wrote:
> > On 11/30/23 01:22, Chen, Jiqian wrote:
> > > Hi Roger and Daniel P. Smith,
> > > 
> > > On 2023/11/28 22:08, Roger Pau Monné wrote:
> > > > On Fri, Nov 24, 2023 at 06:41:34PM +0800, Jiqian Chen wrote:
> > > > > When a device has been reset on dom0 side, the vpci on Xen
> > > > > side won't get notification, so the cached state in vpci is
> > > > > all out of date compare with the real device state.
> > > > > To solve that problem, this patch add new hypercall to clear
> > > > > all vpci device state. And when reset device happens on dom0
> > > > > side, dom0 can call this hypercall to notify vpci.
> > > > > 
> > > > > Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> > > > > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > > > > ---
> > > > >   xen/arch/x86/hvm/hypercall.c  |  1 +
> > > > >   xen/drivers/passthrough/pci.c | 21 +++++++++++++++++++++
> > > > >   xen/drivers/pci/physdev.c     | 14 ++++++++++++++
> > > > >   xen/drivers/vpci/vpci.c       |  9 +++++++++
> > > > >   xen/include/public/physdev.h  |  2 ++
> > > > >   xen/include/xen/pci.h         |  1 +
> > > > >   xen/include/xen/vpci.h        |  6 ++++++
> > > > >   7 files changed, 54 insertions(+)
> > > > > 
> > > > > diff --git a/xen/arch/x86/hvm/hypercall.c
> > > > > b/xen/arch/x86/hvm/hypercall.c
> > > > > index eeb73e1aa5..6ad5b4d5f1 100644
> > > > > --- a/xen/arch/x86/hvm/hypercall.c
> > > > > +++ b/xen/arch/x86/hvm/hypercall.c
> > > > > @@ -84,6 +84,7 @@ long hvm_physdev_op(int cmd,
> > > > > XEN_GUEST_HANDLE_PARAM(void) arg)
> > > > >       case PHYSDEVOP_pci_mmcfg_reserved:
> > > > >       case PHYSDEVOP_pci_device_add:
> > > > >       case PHYSDEVOP_pci_device_remove:
> > > > > +    case PHYSDEVOP_pci_device_state_reset:
> > > > >       case PHYSDEVOP_dbgp_op:
> > > > >           if ( !is_hardware_domain(currd) )
> > > > >               return -ENOSYS;
> > > > > diff --git a/xen/drivers/passthrough/pci.c
> > > > > b/xen/drivers/passthrough/pci.c
> > > > > index 04d00c7c37..f871715585 100644
> > > > > --- a/xen/drivers/passthrough/pci.c
> > > > > +++ b/xen/drivers/passthrough/pci.c
> > > > > @@ -824,6 +824,27 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
> > > > >       return ret;
> > > > >   }
> > > > > +int pci_reset_device_state(u16 seg, u8 bus, u8 devfn)
> > > > 
> > > > You could use pci_sbdf_t here instead of 3 parameters.
> > > Will change in next version, thank you.
> > > 
> > > > 
> > > > I'm however unsure whether we really need this helper just to fetch
> > > > the pdev and call vpci_reset_device_state(), I think you could place
> > > > this logic directly in pci_physdev_op().  Unless there are plans to
> > > > use such logic outside of pci_physdev_op().
> > > If I place the logic of pci_reset_device_state directly in
> > > pci_physdev_op. I think I need to declare vpci_reset_device_state in
> > > pci.h? If it is suitable, I will change in next version.
> > > 
> > > > 
> > > > > +{
> > > > > +    struct pci_dev *pdev;
> > > > > +    int ret = -ENODEV;
> > > > 
> > > > Some XSM check should be introduced fro this operation, as none of the
> > > > existing ones is suitable.  See xsm_resource_unplug_pci() for example.
> > > > 
> > > > xsm_resource_reset_state_pci() or some such I would assume.
> > > I don't know what I should do in XSM function(assume it is
> > > xsm_resource_reset_state_pci).
> > > Hi Daniel P. Smith, could you please give me some suggestions?
> > > Just to check the XSM_PRIV action?
> > > 
> > 
> > Roger, thank you for seeing this and adding me in!
> > 
> > Jiqian, I just wanted to let you know I have seen your post but I have
> > been a little tied up this week. Just with the cursory look, I think
> > Roger is suggesting a new XSM check/hook is warranted.
> > 
> > If you would like to attempt at writing the dummy policy side, mimic
> > xsm_resource_plug_pci in xen/include/xsm/dummy.h and
> > xen/include/xsm/xsm.h, then I can look at handling the FLASK portion
> > next week and provide it to you for inclusion into the series. If you
> > are not comfortable with it, I can look at the whole thing next week.
> > Just let me know what you would be comfortable with.
> 
> Apologies, thinking about for a moment and was thinking the hook should be
> called xsm_resource_config_pci. I would reset as a config operation and
> there might be new ones in the future. I do not believe there is a need to
> have fine grain access control down to individual config operation, thus
> they could all be captured under this one hook. Roger, what are your
> thoughts about this, in particular how you see vpci evolving?

So the configuration space reset should only be done by the domain
that's also capable of triggering the physical device reset, usually
the hardware domain.  I don't think it's possible ATM to allow a
domain different than the hardware domain to perform a PCI reset, as
doing it requires unmediated access to the PCI config space.

So resetting the vPCI state should either be limited to the hardware
domain, or to a pci reset capability explicitly
(xsm_resource_reset_pci or some such?).  Or maybe
xsm_resource_config_pci if that denotes unmediated access to the PCI
config space.

Thanks, Roger.

