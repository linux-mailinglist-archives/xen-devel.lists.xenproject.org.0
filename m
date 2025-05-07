Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 014B2AAD983
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 10:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978298.1365121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCZlo-0004BZ-8s; Wed, 07 May 2025 08:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978298.1365121; Wed, 07 May 2025 08:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCZlo-00048l-64; Wed, 07 May 2025 08:04:48 +0000
Received: by outflank-mailman (input) for mailman id 978298;
 Wed, 07 May 2025 08:04:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zuHe=XX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCZlm-00048d-7T
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 08:04:46 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efba24f0-2b19-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 10:04:44 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39ee57c0b8cso5906632f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 01:04:44 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a099b0f16fsm16052173f8f.77.2025.05.07.01.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 01:04:43 -0700 (PDT)
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
X-Inumbo-ID: efba24f0-2b19-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746605084; x=1747209884; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cxzprP6gkGIbezDhaJj0alDNN4WQ8wE/+kfvmmzcHkg=;
        b=OFEIVk5Ry3aZ0Wk+r2uQB9WSY/EIt42ALjkc+rA9i8aSHOM9IizW6b2RaumRCZ1xxP
         JK9YxSkQrrtCOahOuwOzye5huXdE/SCzZNz+dpAjVI9MOpZdqJGSYljVdMRFUWUgWy5c
         pluzEHuglR5FZOg2lQqobb5WPFq/HvMh3isjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746605084; x=1747209884;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxzprP6gkGIbezDhaJj0alDNN4WQ8wE/+kfvmmzcHkg=;
        b=FPtjMMBvINb2BY4LleK6Dpj5SvuXa5QXz1obqYitr1nlc/DDAlmw1aylkn1DpbiLlE
         vAaVksEVxV06egQUsHSE4URMKG5UHAtc9QcTutx/DGoCUyP6doHhspLWGQkClY0+7pU3
         0rmETiXs0EMDbU0PDAj2TbCtDBOTBTRRL9YT+2J76gWLF3GtfbAzLMh965UTaOVwftH1
         rNCQ2Ynf5mobHPAy0FUsmZObJZE+OCKNg2LyS9cJvRmehfBMYKu0DiN0K7vSIEEWRQGs
         hdEDs0tg0TN1KfebnyWW0bqgPr1VyycHnzVNlp2TzTZ8XY+8Pa023sqsSDLAggCx9EIK
         nxLg==
X-Gm-Message-State: AOJu0YwRcA57jzHW9pYVuvoWof5gTBjc8EfNxeKvYoGKS1KxbTMxB0C0
	nK8MR6Fl2lfWx/SKBJVaWHh4bwjNozRAPj70EUfy8JWz2rdQ84V4kJFf2dnrTg0=
X-Gm-Gg: ASbGnctON32OIAwlmt4FQLp59g+VxtfvtlINCQqyUR4Kx7pTknq46+1qoLLkjL0MZKJ
	M2XXMG24zjzuN4NFMJ+vczGP7on0WF3eBxce8011GVb/06gQn95XXjfNjX2k8d/EjtNz1toI0mg
	0HsHSrxBRafkqSUpgig/OT5W9HeNJ/3LmKemKB1CRVXYskF9jYdf3q8SJRl9MehOpnXaK5cngF0
	DXf7dM0R7wNGYS7Z6cZEGjuRKYr9uVz+O8+JTMEjMZ6ANsLqihpnww95y5yiLxQcuGNu5YQ2oPB
	DvWCWC6NMOomA0fb1SbXqOYvMHm9xiRwbdiHbuXUF9AsxYHlSJeyl1LB
X-Google-Smtp-Source: AGHT+IGwooqK4kcOIomOvV6m2CAwLcH6DN9PvpG+QX8TLRCoYxg8mCP5nNeGs1RE9vjg6Bo4nbVX2Q==
X-Received: by 2002:a05:6000:1447:b0:39c:1f0e:95af with SMTP id ffacd0b85a97d-3a0b4997fd0mr1833768f8f.3.1746605083880;
        Wed, 07 May 2025 01:04:43 -0700 (PDT)
Date: Wed, 7 May 2025 10:04:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 05/11] vpci: Refactor REGISTER_VPCI_INIT
Message-ID: <aBsUGizTh8FCW_KH@macbook.lan>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-6-Jiqian.Chen@amd.com>
 <aBoelpSu4xmJH2Eo@macbook.lan>
 <BL1PR12MB5849A46E40F2933464294732E788A@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849A46E40F2933464294732E788A@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, May 07, 2025 at 05:59:52AM +0000, Chen, Jiqian wrote:
> On 2025/5/6 22:37, Roger Pau Monné wrote:
> > On Mon, Apr 21, 2025 at 02:18:57PM +0800, Jiqian Chen wrote:
> >> Refactor REGISTER_VPCI_INIT to contain more capability specific
> >> information, this is benifit for follow-on changes to hide capability
> >> which initialization fails.
> >>
> >> What's more, change the definition of init_header() since it is
> >> not a capability and it is needed for all devices' PCI config space.
> >>
> >> Note:
> >> Call vpci_make_msix_hole() in the end of init_msix() since the
> >> change of sequence of init_header() and init_msix().
> >> The fini hook will be implemented in follow-on changes.
> > 
> > I would maybe add that the cleanup hook is also added in this change,
> > even if it's still unused.  Further changes will make use of it.
> Do you mean I need to add empty fini_x() function for MSI, MSIx, Rebar in this patch?
> Or just need to add this sentence to the commit message?

Oh, no, sorry if it wasn't clear, I meant just adding the sentence to
the commit message.

> > 
> >>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> ---
> >> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> >> cc: Andrew Cooper <andrew.cooper3@citrix.com>
> >> cc: Anthony PERARD <anthony.perard@vates.tech>
> >> cc: Michal Orzel <michal.orzel@amd.com>
> >> cc: Jan Beulich <jbeulich@suse.com>
> >> cc: Julien Grall <julien@xen.org>
> >> cc: Stefano Stabellini <sstabellini@kernel.org>
> >> ---
> >> v2->v3 changes:
> >> * This is separated from patch "vpci: Hide capability when it fails to initialize" of v2.
> >> * Delete __maybe_unused attribute of "out" in function vpci_assign_devic().
> >> * Rename REGISTER_VPCI_EXTEND_CAP to REGISTER_VPCI_EXTENDED_CAP.
> >>
> >> v1->v2 changes:
> >> * Removed the "priorities" of initializing capabilities since it isn't used anymore.
> >> * Added new function vpci_capability_mask() and vpci_ext_capability_mask() to remove failed capability from list.
> >> * Called vpci_make_msix_hole() in the end of init_msix().
> >>
> >> Best regards,
> >> Jiqian Chen.
> >> ---
> >>  xen/drivers/vpci/header.c |  3 +--
> >>  xen/drivers/vpci/msi.c    |  2 +-
> >>  xen/drivers/vpci/msix.c   |  8 +++++--
> >>  xen/drivers/vpci/rebar.c  |  2 +-
> >>  xen/drivers/vpci/vpci.c   | 48 +++++++++++++++++++++++++++++++--------
> >>  xen/include/xen/vpci.h    | 28 ++++++++++++++++-------
> >>  xen/include/xen/xen.lds.h |  2 +-
> >>  7 files changed, 68 insertions(+), 25 deletions(-)
> >>
> >> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> >> index ee94ad8e5037..afe4bcdfcb30 100644
> >> --- a/xen/drivers/vpci/header.c
> >> +++ b/xen/drivers/vpci/header.c
> >> @@ -842,7 +842,7 @@ static int vpci_init_ext_capability_list(struct pci_dev *pdev)
> >>      return 0;
> >>  }
> >>  
> >> -static int cf_check init_header(struct pci_dev *pdev)
> >> +int vpci_init_header(struct pci_dev *pdev)
> >>  {
> >>      uint16_t cmd;
> >>      uint64_t addr, size;
> >> @@ -1038,7 +1038,6 @@ static int cf_check init_header(struct pci_dev *pdev)
> >>      pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> >>      return rc;
> >>  }
> >> -REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
> >>  
> >>  /*
> >>   * Local variables:
> >> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> >> index 66e5a8a116be..ea7dc0c060ea 100644
> >> --- a/xen/drivers/vpci/msi.c
> >> +++ b/xen/drivers/vpci/msi.c
> >> @@ -270,7 +270,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
> >>  
> >>      return 0;
> >>  }
> >> -REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
> >> +REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSI, init_msi, NULL);
> >>  
> >>  void vpci_dump_msi(void)
> >>  {
> >> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> >> index 6bd8c55bb48e..0228ffd9fda9 100644
> >> --- a/xen/drivers/vpci/msix.c
> >> +++ b/xen/drivers/vpci/msix.c
> >> @@ -751,9 +751,13 @@ static int cf_check init_msix(struct pci_dev *pdev)
> >>      pdev->vpci->msix = msix;
> >>      list_add(&msix->next, &d->arch.hvm.msix_tables);
> >>  
> >> -    return 0;
> >> +    spin_lock(&pdev->vpci->lock);
> >> +    rc = vpci_make_msix_hole(pdev);
> >> +    spin_unlock(&pdev->vpci->lock);
> >> +
> >> +    return rc;
> >>  }
> >> -REGISTER_VPCI_INIT(init_msix, VPCI_PRIORITY_HIGH);
> >> +REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSIX, init_msix, NULL);
> >>  
> >>  /*
> >>   * Local variables:
> >> diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
> >> index 793937449af7..026f8f7972d9 100644
> >> --- a/xen/drivers/vpci/rebar.c
> >> +++ b/xen/drivers/vpci/rebar.c
> >> @@ -118,7 +118,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
> >>  
> >>      return 0;
> >>  }
> >> -REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
> >> +REGISTER_VPCI_EXTENDED_CAP(PCI_EXT_CAP_ID_REBAR, init_rebar, NULL);
> >>  
> >>  /*
> >>   * Local variables:
> >> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> >> index 3349b98389b8..5474b66668c1 100644
> >> --- a/xen/drivers/vpci/vpci.c
> >> +++ b/xen/drivers/vpci/vpci.c
> >> @@ -36,8 +36,8 @@ struct vpci_register {
> >>  };
> >>  
> >>  #ifdef __XEN__
> >> -extern vpci_register_init_t *const __start_vpci_array[];
> >> -extern vpci_register_init_t *const __end_vpci_array[];
> >> +extern vpci_capability_t *const __start_vpci_array[];
> >> +extern vpci_capability_t *const __end_vpci_array[];
> >>  #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
> >>  
> >>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> >> @@ -83,6 +83,36 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
> >>  
> >>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
> >>  
> >> +static int vpci_init_capabilities(struct pci_dev *pdev)
> >> +{
> >> +    for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
> >> +    {
> >> +        const vpci_capability_t *capability = __start_vpci_array[i];
> >> +        const unsigned int cap = capability->id;
> >> +        const bool is_ext = capability->is_ext;
> >> +        unsigned int pos;
> >> +        int rc;
> >> +
> >> +        if ( !is_hardware_domain(pdev->domain) && is_ext )
> >> +            continue;
> >> +
> >> +        if ( !is_ext )
> >> +            pos = pci_find_cap_offset(pdev->sbdf, cap);
> >> +        else
> >> +            pos = pci_find_ext_capability(pdev->sbdf, cap);
> >> +
> >> +        if ( !pos || !capability->init )
> > 
> > Isn't it bogus to have a vpci_capability_t entry with a NULL init
> > function?
> Since I don't add fini_x() function for capabilities and also add check "if ( capability->fini )" below,
> so I add this NULL check here.
> I will remove it if you think it is unnecessary.
> Should I also remove the NULL check for fini?

I think `fini` is fine to be NULL, but I don't see a case for `init`
being NULL?

Maybe I'm missing some use-case, but I expect capabilities will always
need some kind of initialization (iow: setting up handlers) otherwise
it's just a no-op.

> >> +        if ( rc )
> >> +            return rc;
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +
> >>  void vpci_deassign_device(struct pci_dev *pdev)
> >>  {
> >>      unsigned int i;
> >> @@ -128,7 +158,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
> >>  
> >>  int vpci_assign_device(struct pci_dev *pdev)
> >>  {
> >> -    unsigned int i;
> >>      const unsigned long *ro_map;
> >>      int rc = 0;
> >>  
> >> @@ -159,14 +188,13 @@ int vpci_assign_device(struct pci_dev *pdev)
> >>          goto out;
> >>  #endif
> >>  
> >> -    for ( i = 0; i < NUM_VPCI_INIT; i++ )
> >> -    {
> >> -        rc = __start_vpci_array[i](pdev);
> >> -        if ( rc )
> >> -            break;
> >> -    }
> >> +    rc = vpci_init_header(pdev);
> >> +    if ( rc )
> >> +        goto out;
> >> +
> >> +    rc = vpci_init_capabilities(pdev);
> >>  
> >> - out: __maybe_unused;
> >> + out:
> >>      if ( rc )
> >>          vpci_deassign_device(pdev);
> >>  
> >> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> >> index 9d47b8c1a50e..8e815b418b7d 100644
> >> --- a/xen/include/xen/vpci.h
> >> +++ b/xen/include/xen/vpci.h
> >> @@ -13,11 +13,12 @@ typedef uint32_t vpci_read_t(const struct pci_dev *pdev, unsigned int reg,
> >>  typedef void vpci_write_t(const struct pci_dev *pdev, unsigned int reg,
> >>                            uint32_t val, void *data);
> >>  
> >> -typedef int vpci_register_init_t(struct pci_dev *dev);
> >> -
> >> -#define VPCI_PRIORITY_HIGH      "1"
> >> -#define VPCI_PRIORITY_MIDDLE    "5"
> >> -#define VPCI_PRIORITY_LOW       "9"
> >> +typedef struct {
> >> +    unsigned int id;
> >> +    bool is_ext;
> >> +    int (*init)(struct pci_dev *pdev);
> >> +    void (*fini)(struct pci_dev *pdev);
> >> +} vpci_capability_t;
> >>  
> >>  #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
> >>  
> >> @@ -29,9 +30,20 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
> >>   */
> >>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
> >>  
> >> -#define REGISTER_VPCI_INIT(x, p)                \
> >> -  static vpci_register_init_t *const x##_entry  \
> >> -               __used_section(".data.vpci." p) = (x)
> >> +#define REGISTER_VPCI_CAP(cap, x, y, ext) \
> > 
> > x and y are not very helpful identifier names, better use some more
> > descriptive naming, init and fini?  Same below.
> init and fini seems not good. They are conflict with the hook name of below vpci_capability_t.
> Maybe init_func and fini_func ?

Oh, I see.  Can I recommend to name fields init and destroy or cleanup
(instead of fini), and then use finit and fdestroy/fclean as macro
parameters?

I don't think it's common in Xen to name cleanup functions 'fini'.  I
understand this is a question of taste, it's mostly for coherence with
the rest of the code base.

Thanks, Roger.

