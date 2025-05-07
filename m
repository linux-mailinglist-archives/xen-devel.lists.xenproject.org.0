Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B461EAAD91F
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 09:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978285.1365108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCZcU-0001hX-9s; Wed, 07 May 2025 07:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978285.1365108; Wed, 07 May 2025 07:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCZcU-0001g5-77; Wed, 07 May 2025 07:55:10 +0000
Received: by outflank-mailman (input) for mailman id 978285;
 Wed, 07 May 2025 07:55:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zuHe=XX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCZcS-0001fs-VG
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 07:55:08 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95759938-2b18-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 09:55:03 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so3197765e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 00:55:03 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441d433e9b7sm22385345e9.8.2025.05.07.00.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 00:55:02 -0700 (PDT)
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
X-Inumbo-ID: 95759938-2b18-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746604503; x=1747209303; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FGw7I+VwKRsIFghYHwgaG95hNdLHH6DjWwurVpWzM3w=;
        b=Q5DUM0joy2I3wkHqA0BsJu/IDbX7Ixbg6x0dei7OmBQPV6LtkDVkOwDxcRii5iVUUB
         DvKrG95cv7OAPvomx/m94w3UqWXTuUPnfX9h6VWe57ifXeeCQAmIuwzUSvK3+45VcTx4
         kmnP0DMFkRI08kcGtl5A10ZQ1Yfni3g88VPNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604503; x=1747209303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FGw7I+VwKRsIFghYHwgaG95hNdLHH6DjWwurVpWzM3w=;
        b=gswek/NQAC6GvZ+yVV8oMKodhHnSqvFUn8F2QbM20qLhK4JOluEIRqH814KQldotTB
         v9+sV4o/dHSYvkOhfXDCYy3Za7aeGAjh/nDzUYwdC2byGPylEhtgIfAkEoUZ2+14kGYB
         GC9GRmYLQRNni0krJX+L16ObaIYz2CVb5YN8V3u+uQ9HkyJpS21jbcCnwj+g0xBHFbuJ
         x/YxiatsC56mudxuqJV6XI4ktQ2oTGnHAfpyrF5u5lV2Xm//CtZJwabofztKUKKvL9uj
         3aW6x83z40729pnqKWcRLzt0LcRlJDC1rGl3vW29G+pPZ0Erh73v6A1kc4LYnLsIh0Ko
         bvag==
X-Gm-Message-State: AOJu0YxGq/sJD4cBxPCigrpWdk7UwjyDVHo7dKz4uXho6n0lmflTntQ/
	n84nBCPNdTwbDCznorGmU7MR9szOfEuRrOPs66+U1WU7SSn4ioGpenInAuZ3Lv4=
X-Gm-Gg: ASbGncs/aHZWNVjxWUvMR84hhJTJ9cYCADLfDw1OlVwHI2PgtkFi+w0QxrTg6FaP85A
	qq5RjS57lSpTvmwYxX4amewQvTb/FimcVwM8/fN5YKyoGGF4yrFdG/B2kzfOuA1EFzC8U0tJrjO
	5Sn0G+GarTcZwhZOolKICClqib7L0M/ilsE6jH6wldOjoMo2b1Cqu9klJMUmgFDo3CH5F5UcmQs
	ZFFRgdaMD8Omkfhe6G1XAYmqzJgcxiLgggdcrAhrj4icGXFjaN6mSQ2VxORc3YN0DcMkkg7taXB
	na6O5x5S175OmxJCDfwWGNTp4AY3YBruVT9uyT50RgCAfemsRGU=
X-Google-Smtp-Source: AGHT+IGQR/eBXXKhPbK/ScevO6R78t55OPQUdi0VlhCL96a6Iya/PgH3FUPjn/Nwl0t5QmKldKXG8A==
X-Received: by 2002:a05:6000:2403:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-3a0b443e083mr1925035f8f.24.1746604503073;
        Wed, 07 May 2025 00:55:03 -0700 (PDT)
Date: Wed, 7 May 2025 09:55:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v3 04/11] vpci/header: Emulate extended capability list
 for dom0
Message-ID: <aBsR1gpMnTJ2X58t@macbook.lan>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-5-Jiqian.Chen@amd.com>
 <aBoZRicr20a4eCNV@macbook.lan>
 <BL1PR12MB584924E0BBAFBE214699BCE3E788A@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB584924E0BBAFBE214699BCE3E788A@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, May 07, 2025 at 03:32:47AM +0000, Chen, Jiqian wrote:
> On 2025/5/6 22:14, Roger Pau Monné wrote:
> > On Mon, Apr 21, 2025 at 02:18:56PM +0800, Jiqian Chen wrote:
> >> Add a new function to emulate extended capability list for dom0,
> >> and call it in init_header(). So that it will be easy to hide a
> >> extended capability whose initialization fails.
> >>
> >> As for the extended capability list of domU, just move the logic
> >> into above function and keep hiding it for domU.
> >>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> ---
> >> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> >> ---
> >> v2->v3 changes:
> >> * In vpci_init_ext_capability_list(), when domain is domU, directly return after adding a handler(hiding all extended capability for domU).
> >> * In vpci_init_ext_capability_list(), change condition to be "while ( pos >= 0x100U && ttl-- )" instead of "while ( pos && ttl-- )".
> >> * Add new function vpci_hw_write32, and pass it to extended capability handler for dom0.
> >>
> >> v1->v2 changes:
> >> new patch
> >>
> >> Best regards,
> >> Jiqian Chen.
> >> ---
> >>  xen/drivers/vpci/header.c | 36 ++++++++++++++++++++++++++++--------
> >>  xen/drivers/vpci/vpci.c   |  6 ++++++
> >>  xen/include/xen/vpci.h    |  2 ++
> >>  3 files changed, 36 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> >> index c98cd211d9d7..ee94ad8e5037 100644
> >> --- a/xen/drivers/vpci/header.c
> >> +++ b/xen/drivers/vpci/header.c
> >> @@ -817,6 +817,31 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
> >>                                    PCI_STATUS_RSVDZ_MASK);
> >>  }
> >>  
> >> +static int vpci_init_ext_capability_list(struct pci_dev *pdev)
> >> +{
> >> +    unsigned int pos = PCI_CFG_SPACE_SIZE, ttl = 480;
> >> +
> >> +    if ( !is_hardware_domain(pdev->domain) )
> >> +        /* Extended capabilities read as zero, write ignore for guest */
> >> +        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> >> +                                 pos, 4, (void *)0);
> >> +
> >> +    while ( pos >= PCI_CFG_SPACE_SIZE && ttl-- )
> >> +    {
> >> +        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
> >> +        int rc;
> > 
> > I'm thinking it might be helpful to avoid setting the handler for the
> > last capability on the list, or simply for devices that have no
> > extended capabilities at all:
> > 
> > if ( PCI_EXT_CAP_NEXT(header) >= PCI_CFG_SPACE_SIZE )
> > {
> >     int rc = vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write32,
> >                                pos, 4, (void *)(uintptr_t)header);
> > 
> >     if ( rc )
> >         return rc;
> > }
> But if adding this check, there is a problem, think about this situation:
> a device only has one extended capability, then under your check, it does not add handler for it,
> if the initialization of that extended capability fails, we can't hide it by removing handler from vpci.
> If you want to avoid adding handler for devices that have no extended capabilities.
> I think adding check
> If ( header == 0 )
>     return 0;
> is enough.

Hm, yes, extended PCI capabilities don't have a start pointer like
legacy ones, so masking the initial capability (as you have discovered)
is not easy.  I agree with checking whether the initial header == 0
and then not adding any handler at all.

Thanks, Roger.

