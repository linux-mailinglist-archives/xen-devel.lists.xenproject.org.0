Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D34A762A0
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 10:43:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932206.1334397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzAjx-00012t-Bt; Mon, 31 Mar 2025 08:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932206.1334397; Mon, 31 Mar 2025 08:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzAjx-0000zm-8F; Mon, 31 Mar 2025 08:43:29 +0000
Received: by outflank-mailman (input) for mailman id 932206;
 Mon, 31 Mar 2025 08:43:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FpTe=WS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzAjv-0000zg-O8
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 08:43:27 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 365a76a6-0e0c-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 10:43:26 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5e6167d0536so4004970a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 01:43:26 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac719278259sm594205666b.38.2025.03.31.01.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 01:43:25 -0700 (PDT)
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
X-Inumbo-ID: 365a76a6-0e0c-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743410606; x=1744015406; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XwAYMTJMPesHRYb6A/nzQjXqrgdTACJtc+bMwHYaBdo=;
        b=XEoWk9XE3vdnjceeZwD5sOWKb3p+5ocx5yI/67Y1gWtNX4H3qUF+5w8DBCNWh3Eb9r
         ea+cL2nowZxaWqWCXKCsY/t3PH+tybyDNY946C1j9oEfxr5vsPCGY6RZEAy2/Srs3l0V
         FKbBLI5T2cSNIxC+VjPOrbl2T2qSJSXySOnig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743410606; x=1744015406;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwAYMTJMPesHRYb6A/nzQjXqrgdTACJtc+bMwHYaBdo=;
        b=vmJlacpZtcRoyGM+EzG4vnp1tqd/bnu/p5v8NN/RpUE++ccW3UfgTjxpfBUCWQCdTQ
         x+TAqnDUvDnumuW83KAKCse4VheOx+GEq79uwf0t42jdptyij1CFC0Zfzss5gH7xYQ7w
         Ku9fuCqodG6F7czhJyKpG6IMX55rm3J1GPMAESddOHNZE5ZMWAWCHNCj2ztjbkQruDsC
         6N5sskrK6UaQuU7XrGuqK3EVd0La3FF6an8Ghj+RnqgAA9t0QSD01SrutIiGG8OUDpp6
         ryMWSiYnp/dCejeeEZPz324gN2YEO6SVm7L2xiiEWajT1gemRdEnL8Xcf6CjHZ8Az6zc
         a53Q==
X-Gm-Message-State: AOJu0YzX0dH7MiPAvQpC7fN69FBoInkaSwcZDqoH90FwqZajCmzbzdTk
	cDD7nAY2kr5iMONzml7YsH4TpF0vUhDXTBm7NUb5tYWnbuY8P9ohuF3ZEphoB2M=
X-Gm-Gg: ASbGncuJFwmx8j/6VWVLwsuPi0REl0Pxu9rzQvGX+gou2GKpVo8Z8612smA+lxAssOt
	+T5N1EHFRotXmDrQ4+d4O02IhggVufY7edd67Wd+pCrPBxS86DJIYFTOZ2l+kcFR6pAnKB9nmX4
	mhIRpBIwdJPquUvbAHgHx3tPL2lIMk+IrTlYnhhXbl8MwsNMAfRwbq6hlBYUIioy1q01hdJHsmA
	s/CLrKhbzMWS0UGMHFQppMwqECuhH2i8D0G+fRoNomu0TIvPqEKVmAC9NGbSDe2Z9QezpXsPDP1
	5juHnJM0FcN3QrJY4s5mWDw+PMPdvAOYS0gyAfyGOMQgempvUA==
X-Google-Smtp-Source: AGHT+IGDLQMXaWQDd+CvtW6jw8eldymYxRJghYiPsEfyUyFJ4hyCtIWDMt5uD+NjT5k/fHC+yGP4jg==
X-Received: by 2002:a17:907:a089:b0:abc:b8c:7b2d with SMTP id a640c23a62f3a-ac738b517f8mr679924366b.32.1743410605684;
        Mon, 31 Mar 2025 01:43:25 -0700 (PDT)
Date: Mon, 31 Mar 2025 10:43:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v1 1/3] vpci: Hide capability when it fails to initialize
Message-ID: <Z-pVrGLZTCk1ZXb1@macbook.local>
References: <20250327073214.158210-1-Jiqian.Chen@amd.com>
 <Z-UZm5sTIz4nOt4-@macbook.local>
 <BL1PR12MB5849F1134D9E51E6A0F7B4A7E7AD2@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849F1134D9E51E6A0F7B4A7E7AD2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Mon, Mar 31, 2025 at 07:26:20AM +0000, Chen, Jiqian wrote:
> On 2025/3/27 17:25, Roger Pau Monné wrote:
> > On Thu, Mar 27, 2025 at 03:32:12PM +0800, Jiqian Chen wrote:
> >> When vpci fails to initialize a capability of a device, it just
> >> return error instead of catching and processing exception. That
> >> makes the entire device unusable.
> >>
> >> So, refactor REGISTER_VPCI_INIT to contain more capability specific
> >> information, and try to hide capability when initialization fails
> >> in vpci_assign_device().
> >>
> >> What's more, change the definition of init_header() since it is
> >> not a capability and it is needed for all devices' PCI config space.
> >>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> ---
> >> Hi all,
> >>
> >> This patch aims to hide a capability when its initialization fails.
> >> That causes we can't rely on vpci_deassign_device() to clean up assigned
> >> resources, so, following two patches clean up resources in the failure
> >> path of init function.
> >>
> >> Best regards,
> >> Jiqian Chen.
> >> ---
> >>  xen/drivers/vpci/header.c |  3 +-
> >>  xen/drivers/vpci/msi.c    |  2 +-
> >>  xen/drivers/vpci/msix.c   |  2 +-
> >>  xen/drivers/vpci/rebar.c  |  2 +-
> >>  xen/drivers/vpci/vpci.c   | 65 +++++++++++++++++++++++++++++++++------
> >>  xen/include/xen/vpci.h    | 27 ++++++++++++----
> >>  6 files changed, 81 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> >> index ef6c965c081c..8c8e4ac5698a 100644
> >> --- a/xen/drivers/vpci/header.c
> >> +++ b/xen/drivers/vpci/header.c
> >> @@ -745,7 +745,7 @@ static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
> >>      return !bar->mem ? -ENOMEM : 0;
> >>  }
> >>  
> >> -static int cf_check init_header(struct pci_dev *pdev)
> >> +int vpci_init_header(struct pci_dev *pdev)
> >>  {
> >>      uint16_t cmd;
> >>      uint64_t addr, size;
> >> @@ -1007,7 +1007,6 @@ static int cf_check init_header(struct pci_dev *pdev)
> >>      pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> >>      return rc;
> >>  }
> >> -REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
> >>  
> >>  /*
> >>   * Local variables:
> >> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> >> index 66e5a8a116be..9d7a9fd8dba1 100644
> >> --- a/xen/drivers/vpci/msi.c
> >> +++ b/xen/drivers/vpci/msi.c
> >> @@ -270,7 +270,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
> >>  
> >>      return 0;
> >>  }
> >> -REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
> >> +REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSI, init_msi, VPCI_PRIORITY_LOW);
> >>  
> >>  void vpci_dump_msi(void)
> >>  {
> >> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> >> index 6bd8c55bb48e..50e5f38c1e09 100644
> >> --- a/xen/drivers/vpci/msix.c
> >> +++ b/xen/drivers/vpci/msix.c
> >> @@ -753,7 +753,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
> >>  
> >>      return 0;
> >>  }
> >> -REGISTER_VPCI_INIT(init_msix, VPCI_PRIORITY_HIGH);
> >> +REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSIX, init_msix, VPCI_PRIORITY_HIGH);
> >>  
> >>  /*
> >>   * Local variables:
> >> diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
> >> index 793937449af7..7c53ee031887 100644
> >> --- a/xen/drivers/vpci/rebar.c
> >> +++ b/xen/drivers/vpci/rebar.c
> >> @@ -118,7 +118,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
> >>  
> >>      return 0;
> >>  }
> >> -REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
> >> +REGISTER_VPCI_EXTEND_CAP(PCI_EXT_CAP_ID_REBAR, init_rebar, VPCI_PRIORITY_LOW);
> >>  
> >>  /*
> >>   * Local variables:
> >> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> >> index 1e6aa5d799b9..a8362e46e097 100644
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
> >> @@ -83,6 +83,47 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
> >>  
> >>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
> >>  
> >> +static int vpci_init_cap_with_priority(struct pci_dev *pdev,
> >> +                                       const char *priority)
> >> +{
> >> +    for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
> >> +    {
> >> +        const vpci_capability_t *capability = __start_vpci_array[i];
> >> +        const unsigned int cap_id = capability->id;
> >> +        unsigned int pos;
> >> +        int rc;
> >> +
> >> +        if ( *(capability->priority) != *priority )
> >> +            continue;
> >> +
> >> +        if ( !capability->is_ext )
> >> +            pos = pci_find_cap_offset(pdev->sbdf, cap_id);
> >> +        else
> >> +            pos = pci_find_ext_capability(pdev->sbdf, cap_id);
> >> +
> >> +        if ( !pos )
> >> +            continue;
> >> +
> >> +        rc = capability->init(pdev);
> >> +
> >> +        if ( rc )
> >> +        {
> >> +            printk(XENLOG_WARNING "%pd %pp: cap init fail rc=%d, try to hide\n",
> >> +                   pdev->domain, &pdev->sbdf, rc);
> >> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> >> +                                   pos, capability->is_ext ? 4 : 1, NULL);
> > 
> > Are you sure this works as intended? 
> Yes, I used failure test cases of init_msi/rebar.
> From the "lspci" result, they were hided from the dom0.
> But I forgot to test for domUs.

I assume that's only tested with Linux?  See my comment below about
capability ID 0 being reserved, and hence I think we should not keep
capabilities with ID 0 on the list, as it might cause malfunctions to
OSes.

> > The capability ID 0 is marked as "reserved" in the spec, so it's unclear to me how OSes would handle
> > finding such capability on the list - I won't be surprised if some
> > implementations decide to terminate the walk.  It's fine to mask the
> > capability ID for the ones that we don't want to expose, but there's
> > further work to do IMO.
> > 
> > The usual way to deal with masking capabilities is to short circuit
> > the capability from the linked list, by making the previous capability
> > "Next Capability Offset" point to the next capability in the list,
> > thus skipping the current one. So:
> > 
> > capability[n - 1].next_cap = capability[n].next_cap
> > 
> > IOW: you will need to add the handler to the previous capability on
> > the list.  That's how it's already done in init_header().
> Oh, I got your opinion.
> But we may need to discuss this more.
> In my opinion, there should be two situations:
> First, if device belongs to hardware domain, there is no emulation of legacy or extended capabilities linked list if I understand codes right.

Yes, but that needs to be fixed, we need to have this kind of
emulation uniformly.

> So, for this situation, I think current implementation of my patch is enough for hiding legacy or extended capabilities.

It works given the current code in Linux.  As said above, I don't
think this is fully correct according to the PCI spec.

> Second, if device belongs to common domain, we just need to consider legacy capabilities since all extended capabilities are hided in init_header().
> So, for this situation, I need to what you said " capability[n - 1].next_cap = capability[n].next_cap "

I'm not sure why would want to handle the hardware domain vs
unprivileged domains differently here.  The way to hide the
capabilities should always be the same, like it's currently done for
domUs.

> I am not sure if above are right.
> > 
> >> +            if ( rc )
> >> +            {
> >> +                printk(XENLOG_ERR "%pd %pp: fail to hide cap rc=%d\n",
> >> +                       pdev->domain, &pdev->sbdf, rc);
> >> +                return rc;
> >> +            }
> >> +        }
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +
> >>  void vpci_deassign_device(struct pci_dev *pdev)
> >>  {
> >>      unsigned int i;
> >> @@ -128,7 +169,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
> >>  
> >>  int vpci_assign_device(struct pci_dev *pdev)
> >>  {
> >> -    unsigned int i;
> >>      const unsigned long *ro_map;
> >>      int rc = 0;
> >>  
> >> @@ -159,12 +199,19 @@ int vpci_assign_device(struct pci_dev *pdev)
> >>          goto out;
> >>  #endif
> >>  
> >> -    for ( i = 0; i < NUM_VPCI_INIT; i++ )
> >> -    {
> >> -        rc = __start_vpci_array[i](pdev);
> >> -        if ( rc )
> >> -            break;
> >> -    }
> >> +    /*
> >> +     * Capabilities with high priority like MSI-X need to
> >> +     * be initialized before header
> >> +     */
> >> +    rc = vpci_init_cap_with_priority(pdev, VPCI_PRIORITY_HIGH);
> >> +    if ( rc )
> >> +        goto out;
> > 
> > I understand this is not introduced by this change, but I wonder if
> > there could be a way to ditch the priority stuff for capabilities,
> > specially now that we only have two "priorities": before or after PCI
> > header initialization.
> I have an idea, but it seems like a hake.
> Can we add a flag(maybe name it "msix_initialized") to struct vpci{}?
> Then in vpci_make_msix_hole(), we can first check that flag, if it is false, we return an error to let modify_decoding() directly return in the process of init_header.
> And in the start of init_msix(), to set msix_initialized=true, in the end of init_msix(), to call modify_decoding() to setup p2m.
> Then we can remove the priorities.

Maybe the initialization of the MSI-X capability could be done after
the header, and call vpci_make_msix_hole()?  There's a bit of
redundancy here in that the BAR is first fully mapped, and then a hole
is punched in place of the MSI-X related tables.  Seems like the
easier option to break the depedency of init_msix() in being called
ahead of init_header().

Completely unrelated: looking at vpci_make_msix_hole() I see the call
in modify_decoding() is redundant, as modify_bars() already craves the
MSI-X regions out of the BARs.

Thanks, Roger.

