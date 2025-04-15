Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2A7A89B00
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 12:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952677.1348061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dsM-0004TY-DV; Tue, 15 Apr 2025 10:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952677.1348061; Tue, 15 Apr 2025 10:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dsM-0004S3-AN; Tue, 15 Apr 2025 10:50:46 +0000
Received: by outflank-mailman (input) for mailman id 952677;
 Tue, 15 Apr 2025 10:50:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGoX=XB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4dsK-0004Mu-Tu
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 10:50:44 +0000
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [2607:f8b0:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79d40cb1-19e7-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 12:50:43 +0200 (CEST)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-af519c159a8so4870362a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 03:50:42 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-306df082446sm12750012a91.12.2025.04.15.03.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 03:50:40 -0700 (PDT)
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
X-Inumbo-ID: 79d40cb1-19e7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744714241; x=1745319041; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=orUiddAWGqqJ2jqhlpE4dvAvEpegBbvAGNvKefmkx54=;
        b=DkLQFTeSGggPshUbHY5+J3GFsp0UIl7UcQgScPuAwuHSOpek/hYos07otin5cKAIp9
         qfZvtvBwIAfQDw2eMeJi3J7k8E3IHVJJR1O/Yn6a2Kv4l1p73BzcnfF/Ecdr6q57E8aX
         DbpE1gVRpPD27MIOGmMps05vbCT3WCLhAJqPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714241; x=1745319041;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orUiddAWGqqJ2jqhlpE4dvAvEpegBbvAGNvKefmkx54=;
        b=oR9p063lU8dO4/ChTTHhXqzP/P0Sk/OH0mwf8pHiB4iTr7L1L2eUZfD+5azyKEue/p
         P8iHxHldT51WvANicqyksew+cTU9gKAn53N46p+39aQgGDN+Q/rkIKDqH2RgeUazvnSh
         mJG3Ebnkp5su+avlKNzqLO2yJmFf8U59TTiMYnvrJYboOhx1N3r+VbEaBdtZwUOHQiZM
         ax9SRlaOhq5aisrZcfNPJjX1Z6QyLViEsP4aGsnBz1Wp5tXE1kdEYYFAx3Hbzmco0o6f
         YHDfSNf3lB2en4tLNeeEh1p8ojKgg4p3uC/kEHe7r27mAHjkNLjlxSYh21vzGu06ypVD
         eRTw==
X-Gm-Message-State: AOJu0Yx0Z9iJC8GC2+3nkrPsbDW4A3AkXbrOZ/OORMpBU5vm2WQuDRTX
	p35OouE2Sqt6p3R2Oa8pP0TfVNny2s/LMhvzr/RSZ7iQlIehH0MZz13kO4UMnfA=
X-Gm-Gg: ASbGncvw7wMJHvDAisz4etzA1OJBs+UROLOL4U032/QpgbNbxWYgWKm68LR9Ck2+GsX
	QKNTXKzxglsuLUtlhT+oA/hjsq6/RhPJT3BEikIDtfux5KQ032Lax5Avw64HlSNmMQNAsE5yk1D
	FshIVh0b8zYiCt2RD7CR7gP7m0BxFTOQ4OiPvjsR2mYE7Rqq7nOCbJYkCcfJTR1pWSbMRy+vc1/
	kMGdkTzm38P8aWRl9kAO1j5LWeRYNM6bUV0udDuMHhvu54bdm97qzg/myNw20HHAgrlbzdyP6Qw
	kH6q8YJkTHA6b3K0Iuw80kYNbTyxxYFCwfZYWCkeQwC6hQ==
X-Google-Smtp-Source: AGHT+IHcJ1lFSqbxYG7dXud6aFx4GIknsscn1yJH/n6gIrPrI55scyz3Flapd9t+JuzBB01pfmDwgg==
X-Received: by 2002:a17:90b:3d45:b0:2fe:a545:4c85 with SMTP id 98e67ed59e1d1-3082367f641mr20706532a91.27.1744714241418;
        Tue, 15 Apr 2025 03:50:41 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:50:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v2 2/8] vpci/header: Emulate legacy capability list for
 host
Message-ID: <Z_45_Jcz4ZxQHsG2@macbook.lan>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-3-Jiqian.Chen@amd.com>
 <Z_4mAAm-gCmZTJub@macbook.lan>
 <PH7PR12MB58546CF210C99C8B835FFC4AE7B22@PH7PR12MB5854.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7PR12MB58546CF210C99C8B835FFC4AE7B22@PH7PR12MB5854.namprd12.prod.outlook.com>

On Tue, Apr 15, 2025 at 10:07:14AM +0000, Chen, Jiqian wrote:
> On 2025/4/15 17:25, Roger Pau Monné wrote:
> > On Wed, Apr 09, 2025 at 02:45:22PM +0800, Jiqian Chen wrote:
> >> +static int vpci_init_capability_list(struct pci_dev *pdev)
> >> +{
> >> +    int rc;
> >> +    bool mask_cap_list = false;
> >> +    bool is_hwdom = is_hardware_domain(pdev->domain);
> >> +    const unsigned int *caps = is_hwdom ? NULL : guest_supported_caps;
> >> +    const unsigned int n = is_hwdom ? 0 : ARRAY_SIZE(guest_supported_caps);
> >> +
> >> +    if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
> >> +    {
> >> +        unsigned int next, ttl = 48;
> >> +
> >> +        next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
> >> +                                     caps, n, &ttl);
> >> +
> >> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> >> +                               PCI_CAPABILITY_LIST, 1,
> >> +                               (void *)(uintptr_t)next);
> >> +        if ( rc )
> >> +            return rc;
> >> +
> >> +        next &= ~3;
> >> +
> >> +        if ( !next && !is_hwdom )
> >> +            /*
> >> +             * If we don't have any supported capabilities to expose to the
> >> +             * guest, mask the PCI_STATUS_CAP_LIST bit in the status register.
> >> +             */
> >> +            mask_cap_list = true;
> >> +
> >> +        while ( next && ttl )
> >> +        {
> >> +            unsigned int pos = next;
> >> +
> >> +            next = pci_find_next_cap_ttl(pdev->sbdf, pos + PCI_CAP_LIST_NEXT,
> >> +                                         caps, n, &ttl);
> >> +
> >> +            rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
> >> +                                   pos + PCI_CAP_LIST_ID, 1, NULL);
> > 
> > There's no need to add this handler for the hardware domain, that's
> > already the default behavior in that case.
> But if not, I have no handler to remove from capability list in next patch's hiding function vpci_capability_mask(),
> then I can't success to hide it.

Oh, I see, I have further comments on that approach, see the comments
on the followup patches.

Thanks, Roger.

