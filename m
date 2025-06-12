Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1674AD782F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 18:28:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013295.1391789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPkmh-0005Zq-SL; Thu, 12 Jun 2025 16:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013295.1391789; Thu, 12 Jun 2025 16:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPkmh-0005Xl-PZ; Thu, 12 Jun 2025 16:28:11 +0000
Received: by outflank-mailman (input) for mailman id 1013295;
 Thu, 12 Jun 2025 16:28:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDy9=Y3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPkmg-0005XG-K1
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 16:28:10 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39e85d12-47aa-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 18:28:09 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so10054065e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 09:28:09 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4532e24b0c8sm24824605e9.24.2025.06.12.09.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 09:28:08 -0700 (PDT)
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
X-Inumbo-ID: 39e85d12-47aa-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749745688; x=1750350488; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yX+HGYhEj8oE3ckInotNgfcoJU6/NrmkhoSfnpgbDYw=;
        b=UfG9IzbfgJUaxBFOxpxlS0zbYjBMat6SQecA5GUx+90vszbS9UeoQyxYd+j/UK8JLg
         r5wSfO5Tkb3FPlteMXDS6SEDgvPxRyOCGf/2F1Jv46qEOgcfAMpU9VAp7l3Aaa9Iu07N
         P9ctQIIITb1vbEpH0/apzYp+5eEc0PBugpUYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749745688; x=1750350488;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yX+HGYhEj8oE3ckInotNgfcoJU6/NrmkhoSfnpgbDYw=;
        b=Ci9+tbzCC1ZTblAv4OUFbl8/gxVL+4MCLclfTF7yzHxvW4WJx28mWbzmebeH8ysj/d
         HIXiIpqV7pCa9HoyhlQBo42irxthm0E8TrlJUN+XWrXzuDZXew5Ek47MGF/SI4lChXbz
         yuineu2FV6K4620CJWPnK4r8Sbe5QpU98/geU+yLldNShX78mBjfwYwFymyf7BUJEQHh
         gt3fWC6wuaytPDum5ty+npKhoLq/VEN2HLJ7OsWKFtOVo2cBTyvWRJ7uIbPDW4wq8/oh
         NlsMAAlU14zKW74mezwTc+gecwWGuU/kuUicawfIc+jsaye8B6UVeM03qv/kDcqsn6oN
         u3Mw==
X-Gm-Message-State: AOJu0Ywwu+37eRfdGDOj7Ej7ypcm0Rf2DLAKoNu2NftCri0upsd/YvTd
	eDQVnerTedqFilc1Wzu4hkQN5sfE6P1dEa/5+Xc9P7hiRfwVJL9v32/8jy7aZDH7Xqw=
X-Gm-Gg: ASbGnct60mbUzuavij6KJoowQfZeESkFAZRZ1410S8rysP0cAo/g5xUXzSkWl/blXYZ
	G2fetDv1aNGgil7r+REGuIIr1L42xj7JQwAoqmunqZa+h15hcHX60h8c5x1jHHxINtokIBjXEnW
	mFGoYYXC1GZ7VK/lnpTi0QFDywCL6gXtQ3g4x/2NC0tbcfaDenjUwwwMZKRo/JgFCMdERS9b6lB
	Hb2l8b6liQW67EFFxdhCbUwm6QZy3g4L0HR1GBuzwVkUnzdHm6JGHjHYihJwl7t+sg2ITQuX1xs
	fQOlQ0LGpTXg94cXLsYsB6cakiv6bDIRi0XVqxdmWlplQErRWHV7Wa6XbdaQ5yk1KqvNM9PkxNj
	xSr5c1sFVjCRbxzgV4M/DZI/YTMQtrGjiBSs=
X-Google-Smtp-Source: AGHT+IHpsNkYetHTJNkoIyB2/3PbxcHS2hV+aDm+Fg0rnryfcSh8IFBRhMciAuh2W7NsGy5wIvzoug==
X-Received: by 2002:a05:600c:1c8c:b0:43c:fe90:1282 with SMTP id 5b1f17b1804b1-453248a1871mr71475375e9.7.1749745688426;
        Thu, 12 Jun 2025 09:28:08 -0700 (PDT)
Date: Thu, 12 Jun 2025 18:28:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Subject: Re: [PATCH v4] x86/hvmloader: select xenpci MMIO BAR UC or WB MTRR
 cache attribute
Message-ID: <aEsAF4LvzRZxv-rj@macbook.local>
References: <20250610162930.89055-1-roger.pau@citrix.com>
 <aEm8LuDrNBqjgaWF@l14>
 <aErqkcLYqTkykpp5@macbook.local>
 <aEr8vGYeEDmmm2B6@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEr8vGYeEDmmm2B6@l14>

On Thu, Jun 12, 2025 at 06:13:48PM +0200, Anthony PERARD wrote:
> On Thu, Jun 12, 2025 at 04:56:17PM +0200, Roger Pau Monné wrote:
> > On Wed, Jun 11, 2025 at 07:26:06PM +0200, Anthony PERARD wrote:
> > > On Tue, Jun 10, 2025 at 06:29:30PM +0200, Roger Pau Monne wrote:
> > > > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > > > index c388899306c2..ddbff6fffc16 100644
> > > > --- a/docs/man/xl.cfg.5.pod.in
> > > > +++ b/docs/man/xl.cfg.5.pod.in
> > > > @@ -2351,6 +2351,14 @@ Windows L<https://xenproject.org/windows-pv-drivers/>.
> > > >  Setting B<xen_platform_pci=0> with the default device_model "qemu-xen"
> > > >  requires at least QEMU 1.6.
> > > >  
> > > > +
> > > > +=item B<xenpci_bar_uc=BOOLEAN>
> > > > +
> > > > +B<x86 only:> Select whether the memory BAR of the Xen PCI device should have
> > > > +uncacheable (UC) cache attribute set in MTRR.
> > > 
> > > For information, here are different name used for this pci device:
> > > 
> > > - man xl.cfg:
> > >     xen_platform_pci=<bool>
> > >         Xen platform PCI device
> > > - QEMU:
> > >     -device xen-platform
> > >     in comments: XEN platform pci device
> > >     with pci device-id PCI_DEVICE_ID_XEN_PLATFORM
> > > - EDK2 / OVMF:
> > >     XenIoPci
> > >         described virtual Xen PCI device
> > >         But XenIo is a generic protocol in EDK2
> > >     Before XenIo, the pci device would be linked to XenBus, and
> > >     loaded with PCI_DEVICE_ID_XEN_PLATFORM
> > > - Linux:
> > >     Seems to be called "xen-platform-pci"
> > > 
> > > Overall, this PCI device is mostly referenced as the Xen Platform PCI
> > > device. So "xenpci" or "Xen PCI device" is surprising to me, and I'm not
> > > quite sure what it is.
> > 
> > I can do xen_platform_pci_bar_uc, but it seems a bit long.
> 
> I don't think it matter much how long it is, it is just a word that is
> surly copy-past from the man page. What I think matter more is that it's
> descriptive enough and match the existing option name for the same
> device, which is "xen_platform_pci".

I've already adjusted everything to xen_platform_pci_bar_uc, plus the
text to s/Xen PCI/Xen platform PCI/.

> > > > +    /* Select the MTRR cache attribute of the xenpci device BAR. */
> > > > +    bool xenpci_bar_uc = false;
> > > 
> > > This default value for `xenpci_bar_uc` mean that hvmloader changes
> > > behavior compared to previous version, right? Shouldn't we instead have
> > > hvmloader keep the same behavior unless the toolstack want to use the
> > > new behavior? (Like it's done for `allow_memory_relocate`,
> > > "platform/mmio_hole_size")
> > > 
> > > It would just mean that toolstack other than `xl` won't be surprised by
> > > a change of behavior.
> > 
> > My plan was that we didn't need changes to XAPI to implement this new
> > mode, but given the comment I will change to keep the previous
> > behavior in absence of a xenstore node.
> 
> Why would guests created with XAPI get the new behavior, but guest
> created with libxl have to stick with the old one?
> 
> I do like that there's an option for libxl to choose between the old and
> new behavior, and allow to revert in case someone got an issue for a
> particular guest, but otherwise, it is probably better to have the same
> default for both XAPI and libxl.
> 
> > > > @@ -271,6 +279,44 @@ void pci_setup(void)
> > > >              if ( bar_sz == 0 )
> > > >                  continue;
> > > >  
> > > > +            if ( !xenpci_bar_uc &&
> > > > +                 ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
> > > > +                   PCI_BASE_ADDRESS_SPACE_MEMORY) &&
> > > > +                 vendor_id == 0x5853 &&
> > > > +                 (device_id == 0x0001 || device_id == 0x0002) )
> > > 
> > > We don't have defines for 0x5853 in the tree (and those device_id)?
> > > Maybe introduce at least one for the vendor_id:
> > > 
> > > These two names are use by QEMU, OVMF, Linux, for example.
> > > 
> > > #define PCI_VENDOR_ID_XEN           0x5853
> > > #define PCI_DEVICE_ID_XEN_PLATFORM  0x0001
> > > 
> > > There's even PCI_DEVICE_ID_XEN_PLATFORM_XS61 in Linux
> > 
> > You mean in the public headers?
> > 
> > For Device IDs we have ranges allocated to downstream vendors, I'm not
> > sure we want to keep track of whatever IDs they use for their devices.
> > OTOH, not tracking those IDs here means OSes are likely to miss
> > additions of new Xen platform PCI devices?
> > 
> > I could introduce public/pci.h to contain those IDs, but I would like
> > consensus on what should be there, otherwise this patch will get
> > stuck.
> 
> I guess, just start with adding the vendor_id define in this same file
> (pci.c), that would be a good start, it would give a name to an
> otherwise magic number.

OK, I think I've misunderstood from your previous reply that you
wanted me to introduce a public pci.h header to contain those values.

> Reading `vendor_id == PCI_VENDOR_ID_XEN` is better than reading
> `vendor_id == 0x5853`.
> 
> If for some reason, we want to use the value in a different part of the
> repo, we could introduce or edit a common header and move the define
> there.
> 
> For the device ids, using a define is less of a need, we would at least
> know we have a condition on Xen specific PCI device.
> 
> This patch is only about a single device, isn't speaking about ID of
> other device a bit out of scope? And anyway, there's already a document
> about those, that is "xen-pci-device-reservations.7.pod".

Yes, but if I had to add a new header I got the feeling I would get
questions about which device IDs should be listed there.

Thanks, Roger.

