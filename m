Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28850A8B22A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 09:32:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955152.1348972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4xFt-0003df-2j; Wed, 16 Apr 2025 07:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955152.1348972; Wed, 16 Apr 2025 07:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4xFs-0003c5-W8; Wed, 16 Apr 2025 07:32:20 +0000
Received: by outflank-mailman (input) for mailman id 955152;
 Wed, 16 Apr 2025 07:32:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2d3P=XC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4xFr-0003bz-P6
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 07:32:19 +0000
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecc8b155-1a94-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 09:32:18 +0200 (CEST)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-7376dd56f60so4386664b3a.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 00:32:18 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-73bd22f0f8esm10086194b3a.103.2025.04.16.00.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 00:32:16 -0700 (PDT)
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
X-Inumbo-ID: ecc8b155-1a94-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744788737; x=1745393537; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PlA8KkckCOfDq56Pwwpz2uub5VF2NM3lBAXY9b68JcE=;
        b=U2+dMVWMrzH7r/FLwW2LpRdFQ9yNcATzkJfRxj3tRtqxvjNafrFPU5q+O3npUWe+4/
         P1PfoZuUE1wvMAliUJ2NK4LmyCnA5xcnE9bSzXsfLc9df3wrdkfnvgYiNe1f/+ENM4QG
         ond7f0/Yv+lZFbP9hU0mnyi5Z4VjhbgTb+oFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788737; x=1745393537;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PlA8KkckCOfDq56Pwwpz2uub5VF2NM3lBAXY9b68JcE=;
        b=BakLnuwmO6tD4i1GSCV1+DdOMWmUZyOcCPs/VHHjiOGuqg8vDDihTV2QVJ/FMM5vlZ
         2TJnmDL7cICiEy6PlBBRnqhCrYQ/0d+VFap+1TsZRRBwq4rgvtOYEhOKA5JNFLTmunXD
         RIgCdGX856IBIGHGQSl2n1zD0lK4r+fBqCJJnoRfsBf1gX7fPQ4wUBcEE7jM8ZYPqHoV
         KcQN5iSqBUTKw5lC/L/xWulx1OG0N7KRCwCUL28NACdFF38Xa7So+8u4HT7w5bGGQPRe
         jTXOkUXOntBNESohLAasYd7+hWVGlLN0saoiNM37EpVBr9OyBfcdbbQ/oksh3rGvCC+S
         F1wA==
X-Gm-Message-State: AOJu0YxBEeoWp6Qi1I6NTDo8hgJqEcITTZTzpWBrWj+LF/0SFey0+yS7
	eXJU+m+SpVnEqZYO2PNPQjnsMoCKrQFc8ZVx1NdyAzkCBRYoIomPNGN+iRDKsupeCOiyxHcUpHk
	b
X-Gm-Gg: ASbGncsTuVsPdImft1oY+v6aTT0C05p//xle4BJPQqxL2SX7xeu7PI3+Nfs1khQyaft
	vtlOYymo1Ai2jGY/z6ArSuQIEXB9L9CR2nosYTvBLNToLOmLp9lHKrKywPeGDMcx5U/dx7MNwfN
	GtmaDaCSOBaUKRBfWpHlQr3jtSOI249VF2HkctF+EY9PBZvwsyzSX/NaB0elqVY2A3RbY4J//G8
	7mq21gTJvk2LKr1dFnL+Ai8Mp7BoHzA5ufHWsGcwXipvpeWmZwszu433yBSmnvhlw1vFkYyEXLN
	Etnxre/lSYLF4O6zJtjCkz2XwQxz815BNdH9ukciogr89g==
X-Google-Smtp-Source: AGHT+IFQ6ucizTyQavkuaAJdg0RS0Lmr9efxrLGAh8qkOCpjZ6Qixq151E5b286OVukDZavICMAAEw==
X-Received: by 2002:a05:6a00:aca:b0:736:b9f5:47c6 with SMTP id d2e1a72fcca58-73c267d36b2mr1082309b3a.16.1744788737053;
        Wed, 16 Apr 2025 00:32:17 -0700 (PDT)
Date: Wed, 16 Apr 2025 09:32:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v2 2/8] vpci/header: Emulate legacy capability list for
 host
Message-ID: <Z_9c-8V1OwhnWVSW@macbook.lan>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-3-Jiqian.Chen@amd.com>
 <Z_4wkFn1VvBe_6Eh@macbook.lan>
 <BL1PR12MB58493D18F9F533FE3D928607E7BD2@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB58493D18F9F533FE3D928607E7BD2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, Apr 16, 2025 at 02:51:18AM +0000, Chen, Jiqian wrote:
> On 2025/4/15 18:10, Roger Pau Monné wrote:
> > On Wed, Apr 09, 2025 at 02:45:22PM +0800, Jiqian Chen wrote:
> >> +        while ( next && ttl )
> >> +        {
> >> +            unsigned int pos = next;
> >> +
> >> +            next = pci_find_next_cap_ttl(pdev->sbdf, pos + PCI_CAP_LIST_NEXT,
> >> +                                         caps, n, &ttl);
> >> +
> >> +            rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
> >> +                                   pos + PCI_CAP_LIST_ID, 1, NULL);
> >> +            if ( rc )
> >> +                return rc;
> >> +
> >> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> >> +                                   pos + PCI_CAP_LIST_NEXT, 1,
> >> +                                   (void *)(uintptr_t)next);
> >> +            if ( rc )
> >> +                return rc;
> >> +
> >> +            next &= ~3;
> >> +        }
> >> +    }
> >> +
> >> +    /* Utilize rsvdp_mask to hide PCI_STATUS_CAP_LIST from the guest. */
> >> +    rc = vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
> >> +                                PCI_STATUS, 2, NULL,
> >> +                                PCI_STATUS_RO_MASK &
> >> +                                    ~(mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
> >> +                                PCI_STATUS_RW1C_MASK,
> >> +                                mask_cap_list ? PCI_STATUS_CAP_LIST : 0,
> >> +                                PCI_STATUS_RSVDZ_MASK);
> > 
> > One further remark I've forgot to make on the previous reply: I'm
> > unsure we want to do this for dom0, as we in general allow dom0
> > unfiltered write access (unless it's for accesses mediated by Xen).
> This part is the original implementation before my patches.
> If you want to restrict this only for domUs, not for dom0.

Oh, indeed.  I was confused thinking it was inside the
!is_hardware_domain() conditional.  Leave it like that, your series is
already long enough.

Thanks, Roger.

