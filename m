Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F27AAD9AE
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 10:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978319.1365142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCZq5-0005FP-0b; Wed, 07 May 2025 08:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978319.1365142; Wed, 07 May 2025 08:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCZq4-0005Di-TJ; Wed, 07 May 2025 08:09:12 +0000
Received: by outflank-mailman (input) for mailman id 978319;
 Wed, 07 May 2025 08:09:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zuHe=XX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCZq3-0005Dc-4y
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 08:09:11 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d130a8d-2b1a-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 10:09:09 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso5303232f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 01:09:08 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a0b25159c9sm3557976f8f.50.2025.05.07.01.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 01:09:07 -0700 (PDT)
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
X-Inumbo-ID: 8d130a8d-2b1a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746605348; x=1747210148; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mr9cHPpBeOVrRjWEx9eh5wDObTB+wWqTvL3lB1Z2C2Q=;
        b=ERNLRr+xjt2cFrspjclYDE5Y/2RQbx5ohUfJKU/RX3hZrYw26vCInrmmzpx7aqhlDn
         jNBxuBYVxL28Ef5WkA6Q44fEeLJ5aAnBhkd+VuxoWXO3F3X+HG29zZtH/s3Lae6C+0f1
         XB6z07Wd95qQobnMmnYK04LXDmpbgDiINJDsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746605348; x=1747210148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mr9cHPpBeOVrRjWEx9eh5wDObTB+wWqTvL3lB1Z2C2Q=;
        b=FpHB2fXofAUnI1i4QnqEkyChgohK9mHSv4tnr/MU1mLBnXqMnkwz3MdTWze1VloMas
         SFh6llbwaQSgYafJDKbidtw20qP04Hu02zMwAxCGjKipE6Kmwu/x3Yfd3FfYRgS9hArN
         d0zEq+SRdBYL7gJZQWO9b7i+MfUESc4GrTSLSP7c3YMu29F2KjoIzUh7irMizBWaVeF7
         BZutYVb7WzO7T0Y+TRTWvVF8HtrhFNFBqkKThHb4biCYWnZZmcQ4SlRbCORHYN9Eb8zG
         0Tf6byN3bHPZaBV4ljHCE7vfNfxaYiwB+gO2YlByujZSJnL1Lp1ern7fPWRs2kmfRDqV
         lI9g==
X-Gm-Message-State: AOJu0YwtrQP8J7+rGRyG6qpJrY6wmQcIdx3/PWuLCR+hzXlZHkRy0lq0
	+i8NjB8o3Mvu1N63jfOzqmEG7N5XaBhkMO5rHogVsW5Ml6p/1RB+rz9UY/lcXyQ=
X-Gm-Gg: ASbGncu6wjinVthBc48a76nEHmzSktJGvZhJG1lldfo15zks5EhjhWAE/EPnhlv1I6x
	InCDmftLg2/9hyGMyrjZZCMrDihN5RpxJa+8jxXBdmdvUq07dqb2AA68J+6u2wegAIVjwn91i5h
	qTaUCCGl+gbRd/yI6ovIMe3FjooTV17pvgSIlqctL5sGCy2frBcnl85v/weTJ9mAeGvUcb8qaBn
	FB+LQe/SWae+nQO44btdSqxGYK6y/hnj8oCx5GBKYqqDoYtUjewgXLeoftyvIo5VP6hGMuF0p/M
	Fhzkb5EvXnzccjWV3wJ8eIOwca2ZECiVBxGmoWKtUuP1yQ==
X-Google-Smtp-Source: AGHT+IGNHjWo9lPh2tqYGivfR+Mw/nKyQz4tam4WzmDq+jhhwO7bOV65qrdqsGGqUbld0QcVIztBag==
X-Received: by 2002:a05:6000:144d:b0:39e:cc5e:147 with SMTP id ffacd0b85a97d-3a0b4a102edmr2037574f8f.55.1746605348031;
        Wed, 07 May 2025 01:09:08 -0700 (PDT)
Date: Wed, 7 May 2025 10:09:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v3 07/11] vpci: Hide extended capability when it fails to
 initialize
Message-ID: <aBsVI5ftmUteTaPE@macbook.lan>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-8-Jiqian.Chen@amd.com>
 <aBo3EfiWJUyWnl_a@macbook.lan>
 <BL1PR12MB58495E4592CA4E80DA34AE04E788A@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB58495E4592CA4E80DA34AE04E788A@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, May 07, 2025 at 07:26:21AM +0000, Chen, Jiqian wrote:
> On 2025/5/7 00:21, Roger Pau Monné wrote:
> > On Mon, Apr 21, 2025 at 02:18:59PM +0800, Jiqian Chen wrote:
> >> When vpci fails to initialize a extended capability of device for dom0,
> >> it just return error instead of catching and processing exception. That
> >> makes the entire device unusable.
> >>
> >> So, add new a function to hide extended capability when initialization
> >> fails. And remove the failed extended capability handler from vpci
> >> extended capability list.
> >>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> ---
> >> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> >> ---
> >> v2->v3 changes:
> >> * Separated from the last version patch "vpci: Hide capability when it fails to initialize".
> >> * Whole implementation changed because last version is wrong.
> >>   This version gets target handler and previous handler from vpci->handlers, then remove the target.
> >> * Note: a case in function vpci_ext_capability_mask() needs to be discussed,
> >>   because it may change the offset of next capability when the offset of target
> >>   capability is 0x100U(the first extended capability), my implementation is just to
> >>   ignore and let hardware to handle the target capability.
> >>
> >> v1->v2 changes:
> >> * Removed the "priorities" of initializing capabilities since it isn't used anymore.
> >> * Added new function vpci_capability_mask() and vpci_ext_capability_mask() to
> >>   remove failed capability from list.
> >> * Called vpci_make_msix_hole() in the end of init_msix().
> >>
> >> Best regards,
> >> Jiqian Chen.
> >> ---
> >>  xen/drivers/vpci/vpci.c    | 79 ++++++++++++++++++++++++++++++++++++++
> >>  xen/include/xen/pci_regs.h |  1 +
> >>  2 files changed, 80 insertions(+)
> >>
> >> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> >> index f97c7cc460a0..8ff5169bdd18 100644
> >> --- a/xen/drivers/vpci/vpci.c
> >> +++ b/xen/drivers/vpci/vpci.c
> >> @@ -183,6 +183,83 @@ static void vpci_capability_mask(struct pci_dev *pdev,
> >>      xfree(next_r);
> >>  }
> >>  
> >> +static struct vpci_register *vpci_get_previous_ext_cap_register
> >> +                (struct vpci *vpci, const unsigned int offset)
> >> +{
> >> +    uint32_t header;
> >> +    unsigned int pos = PCI_CFG_SPACE_SIZE;
> >> +    struct vpci_register *r;
> >> +
> >> +    if ( offset <= PCI_CFG_SPACE_SIZE )
> >> +        return NULL;
> >> +
> >> +    r = vpci_get_register(vpci, pos, 4);
> >> +    ASSERT(r);
> >> +
> >> +    header = (uint32_t)(uintptr_t)r->private;
> >> +    pos = PCI_EXT_CAP_NEXT(header);
> >> +    while ( pos > PCI_CFG_SPACE_SIZE && pos != offset )
> >> +    {
> >> +        r = vpci_get_register(vpci, pos, 4);
> >> +        ASSERT(r);
> >> +        header = (uint32_t)(uintptr_t)r->private;
> >> +        pos = PCI_EXT_CAP_NEXT(header);
> >> +    }
> >> +
> >> +    if ( pos <= PCI_CFG_SPACE_SIZE )
> >> +        return NULL;
> >> +
> >> +    return r;
> >> +}
> >> +
> >> +static void vpci_ext_capability_mask(struct pci_dev *pdev,
> >> +                                     const unsigned int cap)
> >> +{
> >> +    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, cap);
> >> +    struct vpci_register *rm, *prev_r;
> >> +    struct vpci *vpci = pdev->vpci;
> >> +    uint32_t header, pre_header;
> > 
> > Maybe sanity check that offset is correct?
> What do you mean sanity check?
> Do I need to add something?

I would probably do something like:

if ( !offset )
{
    ASSERT_UNREACHABLE();
    return;
}

Thanks, Roger.

