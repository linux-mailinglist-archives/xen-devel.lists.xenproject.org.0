Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81177AAD8D9
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 09:49:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978269.1365094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCZXA-0008K1-KB; Wed, 07 May 2025 07:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978269.1365094; Wed, 07 May 2025 07:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCZXA-0008He-Gf; Wed, 07 May 2025 07:49:40 +0000
Received: by outflank-mailman (input) for mailman id 978269;
 Wed, 07 May 2025 07:49:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zuHe=XX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCZX9-0008HW-WC
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 07:49:40 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d40ef93d-2b17-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 09:49:39 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so4854890f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 00:49:39 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a099b0ff8esm16100973f8f.79.2025.05.07.00.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 00:49:38 -0700 (PDT)
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
X-Inumbo-ID: d40ef93d-2b17-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746604178; x=1747208978; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XWt0KM57gedTPq6s9IEoY1RbEhpPIPW/ujLv4pyJ5zo=;
        b=MT0TJXB8qChcioOhk8joCckJKIsegncFSXfmL5PLtFVQVKUh/wOL5F7KptVmQ7HIpN
         efbm3RSTVRULcIeQb9321Uzhqstk6NZdw8SanLCIPjJ8UPy5k2wWr4BIrOQms+qWZI9i
         U1q6V4jK5Q2usLTSGSptqbMLgJ3YlzE19ari8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604178; x=1747208978;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XWt0KM57gedTPq6s9IEoY1RbEhpPIPW/ujLv4pyJ5zo=;
        b=mZ0nm0UsDCbAvxpC06PwJeNDy6B2DQGxjYmdPNRYvhP9Nt9qkBNwBHmNfXPVN9lYMs
         9kftOyTETwxTgVJjWdPPQvKphJoIMQ98NPBlitgdH0vHchOZG4lJ5LOiCteylBl7Oz86
         1ASks28lErMIZRTda6luBQVb5pDwhD1Y2lqZOOArExIFuTKF2EXEL4FHteh0YuxQlmsx
         CO5DvM75kPYcY3LKVqeeVkFpaQrINsPQukA1WLZVfhnUF6B5NrW8eh+9YEpX/LTlLVvg
         xv2FxoreA2f3He3O7dQUyCfyRTiJC8G577OqgF4fMO0zjg+gm9CthnR3HvciQEdzmvcD
         slsA==
X-Gm-Message-State: AOJu0Yw7TVptgk7oQ1TbYJXnR0qJGLsMGIXQYt0NUroTheb5fc4Tg1DA
	DEAzVZoUa19+cOkb0ULuAwWitnMNgqK980yBNfCSdl3CbejLv+ynI6qO7vuzRJI=
X-Gm-Gg: ASbGnctOXuhNvUrejuzfsTDKaURn+bNSEcJMwNAgf+odu3/rN6/Ih1pfsfjnjl8fKgU
	GIbxRlaEJ8FraOftmXcEWM/ten/jn+0WBmj+cOtAYqYvk4kWWZuqiLRrRdN7PcRi1Rwa8Ny63Ut
	CsPuSEk05crY90iYc920jdD1Y3ic2C4O32XDTU37P5pRPRKN3CgNiQJm6HToXmGPlmeENm6A20I
	24iftme+o4T9FjuRH5tUH/uTQm8iF5WV5xtLpypaJ3dGRfQoROD4VeDEk/Oxct6ZznB62XfI4v+
	uFOUNO3J7MKHo+t8yv3Pnq2zIhxUNUCj+3c4Q2cQOLtRtVFOWiY=
X-Google-Smtp-Source: AGHT+IHdWbaJf3eoRn53CameljCGVIWiJk6+2ddXr0TJyOExc10S40/dMJhoQT54ArSbjO4ZiAV0Bw==
X-Received: by 2002:a05:6000:4387:b0:3a0:a19f:2f47 with SMTP id ffacd0b85a97d-3a0b4a1be6cmr1877491f8f.42.1746604178551;
        Wed, 07 May 2025 00:49:38 -0700 (PDT)
Date: Wed, 7 May 2025 09:49:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v3 03/11] vpci/header: Emulate legacy capability list for
 dom0
Message-ID: <aBsQkZLNAEEztXZC@macbook.lan>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-4-Jiqian.Chen@amd.com>
 <aBoTqCf5y_LXzZdb@macbook.lan>
 <BL1PR12MB5849A7D00734B43A38F14D10E788A@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849A7D00734B43A38F14D10E788A@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, May 07, 2025 at 02:46:52AM +0000, Chen, Jiqian wrote:
> On 2025/5/6 21:50, Roger Pau Monné wrote:
> > On Mon, Apr 21, 2025 at 02:18:55PM +0800, Jiqian Chen wrote:
> >> Current logic of emulating legacy capability list is only for domU.
> >> So, expand it to emulate for dom0 too. Then it will be easy to hide
> >> a capability whose initialization fails in a function.
> >>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> > 
> > Sorry, one nit I've noticed while looking at the next patch.
> > 
> >> @@ -786,13 +787,15 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
> >>  
> >>              next = pci_find_next_cap_ttl(pdev->sbdf,
> >>                                           pos + PCI_CAP_LIST_NEXT,
> >> -                                         supported_caps,
> >> -                                         ARRAY_SIZE(supported_caps), &ttl);
> >> +                                         caps, n, &ttl);
> >>  
> >> -            rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
> The same here, NULL -> vpci_hw_write8, I think.

No, not here, since the PCI_CAP_LIST_ID handler is only added for
non-hardware domains, and in that case we do want to ignore writes to
the register.

> >> -                                   pos + PCI_CAP_LIST_ID, 1, NULL);
> >> -            if ( rc )
> >> -                return rc;
> >> +            if ( !is_hwdom )
> >> +            {
> >> +                rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
> >> +                                       pos + PCI_CAP_LIST_ID, 1, NULL);
> >> +                if ( rc )
> >> +                    return rc;
> >> +            }
> >>  
> >>              rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> > 
> > For the hardware domain the write handler should be vpci_hw_write8
> > instead of NULL.
> OK, I think I need to add definition of vpci_hw_write8.
> But I have a question, if hardware domain write this register through vpci_hw_write8,
> then the "next address data" of hardware will be in consistent with vpci.
> Is it fine? Or should I update vpci's cache?

According to the spec this field is read-only, so writes should be
ignored.  We allow hardware domain full access because for hardware
domain we aim to trap as little as possible to not diverge behavior
from native, and to allow possible device quirks to work.

It could be conceivable that some vendor has a hidden specific
functionality that somehow triggered by a write to this field.

Regards, Roger.

