Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEA9A764B9
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 13:06:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932393.1334530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzCww-0003WK-PP; Mon, 31 Mar 2025 11:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932393.1334530; Mon, 31 Mar 2025 11:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzCww-0003U9-Mj; Mon, 31 Mar 2025 11:05:02 +0000
Received: by outflank-mailman (input) for mailman id 932393;
 Mon, 31 Mar 2025 11:05:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FpTe=WS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzCwu-0003QG-Cg
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 11:05:00 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f86b5e0f-0e1f-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 13:04:53 +0200 (CEST)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2254e0b4b79so112097445ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 04:04:53 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-2291eeca374sm66916975ad.29.2025.03.31.04.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 04:04:51 -0700 (PDT)
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
X-Inumbo-ID: f86b5e0f-0e1f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743419092; x=1744023892; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2k0ZjEg3h/Fziwi/zWlfY/9ChqbyZOoBgTTWlD6T+Mo=;
        b=vShynzDtduwDru62V8OcAp4xwxEgktBrWNKi6iedDDDKZLNNGb2afK45Xmi3UmxPer
         UT6V1qjPwhC2l0lUwQOX5VdWnTC4cGPqqIm5PNnW83jdrTOsCFhRkXy5NvOr6QLHWBhf
         lE4XYALU3yTumfhMXw2S9RzFdRm45iWtKv7oQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743419092; x=1744023892;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2k0ZjEg3h/Fziwi/zWlfY/9ChqbyZOoBgTTWlD6T+Mo=;
        b=ThjWymlo2M8t3c0YSWkvvxF0qF+uPlbtMdROhuBTvnAzM6m6zz4Zkp5fiSzpkmUO73
         uabQB6tnBLp2Z2JLysqCwbmaDk0DbJkyYeAYt0Fjf9jtA6wMJ+WlYew5Bhk1PDjvFd3/
         qSIv0Kah04HYTx9inBh6N4PL8u3ibrtz22XOUuSPECwVQdYtkPGgpUyPXlAGsJAJ8ST1
         Ls6GThgvJTTdCKYQ2RMFEMyuhFCjvb+r/3ySu8+7YfXFvqv9yRX3LITgin5/yNg/Y311
         xxC5H6HhaVGpDHc4u86EOPXGKKEn1cUB95sZ5zhkDg/31Y07sN7NiLs9YeC1AGH9hoYm
         hVKQ==
X-Gm-Message-State: AOJu0YzAgDbn47+urBUXtXNWfvLQ86FmMXPUzfhHq7hQ66sKYZhHBbay
	xufwPHc3UwxvIJYXXjpq/I4GT+4oK7fztQwQ0S4AoKDdKdnEXYD4GsI6BJRRa7E=
X-Gm-Gg: ASbGncvn/Z456ArO1HM+XX69isBM0/IVCLVYWXslHmF6m2vTpeMs84o2LR4BZ4jksCC
	FbsOaECPz7Kv3fw1q8Q3NLNe3ybAK946m2xVWjT47GdDhilot6epd6RriUzJbQsWtWXMBG0oejg
	SmmQoABf1ooosE3cAPWD1iiowjYX7j8+rBnGKYIzhXnkt5pG31aD5/whXUb3J9NoLrIresW3tHJ
	YsgW1qkb/ovWITD9L8A5XPtsb5ghPzkWmh9ijI/00L1RjGPkntUOwv3yzbHExgW+lhAm36vRBZG
	L/5/q4TU0H/F+4Gatrrv7/K5iW1KtkOuyoWhCTB2GSXmCqwoFA==
X-Google-Smtp-Source: AGHT+IF5rZoYQyvbPDQM+7qCLjb5MZub/o4hV5WoPfVF1e6FtZIiAk5Cwx0QN62UqoJB7B1R0jxGvg==
X-Received: by 2002:a17:902:f552:b0:224:f12:3734 with SMTP id d9443c01a7336-2292f9e298bmr136002625ad.30.1743419091559;
        Mon, 31 Mar 2025 04:04:51 -0700 (PDT)
Date: Mon, 31 Mar 2025 13:04:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v1 1/3] vpci: Hide capability when it fails to initialize
Message-ID: <Z-p2zgB2tUtVd7hP@macbook.local>
References: <20250327073214.158210-1-Jiqian.Chen@amd.com>
 <Z-UZm5sTIz4nOt4-@macbook.local>
 <BL1PR12MB5849F1134D9E51E6A0F7B4A7E7AD2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Z-pVrGLZTCk1ZXb1@macbook.local>
 <BL1PR12MB5849783E854628DC49F9A609E7AD2@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849783E854628DC49F9A609E7AD2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Mon, Mar 31, 2025 at 09:32:02AM +0000, Chen, Jiqian wrote:
> On 2025/3/31 16:43, Roger Pau Monné wrote:
> > On Mon, Mar 31, 2025 at 07:26:20AM +0000, Chen, Jiqian wrote:
> >> On 2025/3/27 17:25, Roger Pau Monné wrote:
> >>> On Thu, Mar 27, 2025 at 03:32:12PM +0800, Jiqian Chen wrote: 
> >>>>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
> >>>>  
> >>>> +static int vpci_init_cap_with_priority(struct pci_dev *pdev,
> >>>> +                                       const char *priority)
> >>>> +{
> >>>> +    for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
> >>>> +    {
> >>>> +        const vpci_capability_t *capability = __start_vpci_array[i];
> >>>> +        const unsigned int cap_id = capability->id;
> >>>> +        unsigned int pos;
> >>>> +        int rc;
> >>>> +
> >>>> +        if ( *(capability->priority) != *priority )
> >>>> +            continue;
> >>>> +
> >>>> +        if ( !capability->is_ext )
> >>>> +            pos = pci_find_cap_offset(pdev->sbdf, cap_id);
> >>>> +        else
> >>>> +            pos = pci_find_ext_capability(pdev->sbdf, cap_id);
> >>>> +
> >>>> +        if ( !pos )
> >>>> +            continue;
> >>>> +
> >>>> +        rc = capability->init(pdev);
> >>>> +
> >>>> +        if ( rc )
> >>>> +        {
> >>>> +            printk(XENLOG_WARNING "%pd %pp: cap init fail rc=%d, try to hide\n",
> >>>> +                   pdev->domain, &pdev->sbdf, rc);
> >>>> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> >>>> +                                   pos, capability->is_ext ? 4 : 1, NULL);
> >>>
> >>> Are you sure this works as intended? 
> >> Yes, I used failure test cases of init_msi/rebar.
> >> From the "lspci" result, they were hided from the dom0.
> >> But I forgot to test for domUs.
> > 
> > I assume that's only tested with Linux?  See my comment below about
> > capability ID 0 being reserved, and hence I think we should not keep
> > capabilities with ID 0 on the list, as it might cause malfunctions to
> > OSes.
> > 
> >>> The capability ID 0 is marked as "reserved" in the spec, so it's unclear to me how OSes would handle
> >>> finding such capability on the list - I won't be surprised if some
> >>> implementations decide to terminate the walk.  It's fine to mask the
> >>> capability ID for the ones that we don't want to expose, but there's
> >>> further work to do IMO.
> >>>
> >>> The usual way to deal with masking capabilities is to short circuit
> >>> the capability from the linked list, by making the previous capability
> >>> "Next Capability Offset" point to the next capability in the list,
> >>> thus skipping the current one. So:
> >>>
> >>> capability[n - 1].next_cap = capability[n].next_cap
> >>>
> >>> IOW: you will need to add the handler to the previous capability on
> >>> the list.  That's how it's already done in init_header().
> >> Oh, I got your opinion.
> >> But we may need to discuss this more.
> >> In my opinion, there should be two situations:
> >> First, if device belongs to hardware domain, there is no emulation of legacy or extended capabilities linked list if I understand codes right.
> > 
> > Yes, but that needs to be fixed, we need to have this kind of
> > emulation uniformly.
> > 
> >> So, for this situation, I think current implementation of my patch is enough for hiding legacy or extended capabilities.
> > 
> > It works given the current code in Linux.  As said above, I don't
> > think this is fully correct according to the PCI spec.
> > 
> >> Second, if device belongs to common domain, we just need to consider legacy capabilities since all extended capabilities are hided in init_header().
> >> So, for this situation, I need to what you said " capability[n - 1].next_cap = capability[n].next_cap "
> > 
> > I'm not sure why would want to handle the hardware domain vs
> > unprivileged domains differently here.  The way to hide the
> > capabilities should always be the same, like it's currently done for
> > domUs.
> So, I need to refactor the emulating PCI capability list codes of init_header() to serve
> for all domain(dom0+domUs) firstly, since current codes only emulate PCI capability list for domUs, right?

Yes, that would be my understanding.  The current logic in
init_header() needs to be expanded/generalized so it can be used for
masking random PCI capabilities, plus adapted to work with PCIe
capabilities also.

> > 
> >> I am not sure if above are right.
> >>>
> >>>> +            if ( rc )
> >>>> +            {
> >>>> +                printk(XENLOG_ERR "%pd %pp: fail to hide cap rc=%d\n",
> >>>> +                       pdev->domain, &pdev->sbdf, rc);
> >>>> +                return rc;
> >>>> +            }
> >>>> +        }
> >>>> +    }
> >>>> +
> >>>> +    return 0;
> >>>> +}
> >>>> +
> >>>>  void vpci_deassign_device(struct pci_dev *pdev)
> >>>>  {
> >>>>      unsigned int i;
> >>>> @@ -128,7 +169,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
> >>>>  
> >>>>  int vpci_assign_device(struct pci_dev *pdev)
> >>>>  {
> >>>> -    unsigned int i;
> >>>>      const unsigned long *ro_map;
> >>>>      int rc = 0;
> >>>>  
> >>>> @@ -159,12 +199,19 @@ int vpci_assign_device(struct pci_dev *pdev)
> >>>>          goto out;
> >>>>  #endif
> >>>>  
> >>>> -    for ( i = 0; i < NUM_VPCI_INIT; i++ )
> >>>> -    {
> >>>> -        rc = __start_vpci_array[i](pdev);
> >>>> -        if ( rc )
> >>>> -            break;
> >>>> -    }
> >>>> +    /*
> >>>> +     * Capabilities with high priority like MSI-X need to
> >>>> +     * be initialized before header
> >>>> +     */
> >>>> +    rc = vpci_init_cap_with_priority(pdev, VPCI_PRIORITY_HIGH);
> >>>> +    if ( rc )
> >>>> +        goto out;
> >>>
> >>> I understand this is not introduced by this change, but I wonder if
> >>> there could be a way to ditch the priority stuff for capabilities,
> >>> specially now that we only have two "priorities": before or after PCI
> >>> header initialization.
> >> I have an idea, but it seems like a hake.
> >> Can we add a flag(maybe name it "msix_initialized") to struct vpci{}?
> >> Then in vpci_make_msix_hole(), we can first check that flag, if it is false, we return an error to let modify_decoding() directly return in the process of init_header.
> >> And in the start of init_msix(), to set msix_initialized=true, in the end of init_msix(), to call modify_decoding() to setup p2m.
> >> Then we can remove the priorities.
> > 
> > Maybe the initialization of the MSI-X capability could be done after
> > the header, and call vpci_make_msix_hole()?  There's a bit of
> > redundancy here in that the BAR is first fully mapped, and then a hole
> > is punched in place of the MSI-X related tables.  Seems like the
> > easier option to break the depedency of init_msix() in being called
> > ahead of init_header().
> You mean the sequence should be:
> vpci_init_header()
> vpci_init_capability() // all capabilities
> vpci_make_msix_hole()
> 
> Right?

Yes, I think that would be my preference.  The call to
vpci_make_msix_hole() should be inside of init_msix().

Thanks, Roger.

