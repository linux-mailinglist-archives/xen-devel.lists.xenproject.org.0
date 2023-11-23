Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FD27F59D6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 09:14:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639414.996754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64rD-0007vG-Fm; Thu, 23 Nov 2023 08:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639414.996754; Thu, 23 Nov 2023 08:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64rD-0007sU-Cz; Thu, 23 Nov 2023 08:14:43 +0000
Received: by outflank-mailman (input) for mailman id 639414;
 Thu, 23 Nov 2023 08:14:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r64rC-0007sO-Ck
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 08:14:42 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5824fbce-89d8-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 09:14:38 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40b31232bf0so4387665e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 00:14:38 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 i18-20020a5d5592000000b003316a2aedadsm915460wrv.36.2023.11.23.00.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 00:14:37 -0800 (PST)
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
X-Inumbo-ID: 5824fbce-89d8-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700727277; x=1701332077; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eGikuQEnMU1wbY+Kds9GFhjxhXhIU7I3GXsmCFEGcZs=;
        b=m+RhVegeG74f7mLlDlErGQFBhEZ28SHiIUitwplxJDbCCa4ncUpuMV3tAmIUhJcK3o
         2qKqf8uIGsjDnDrA8gYr8EEZQ+gi7WO7m5x/hRE5XWCU+EjsxAsmc2ZZ5Yw/dShIWU3b
         iW9ujdz9M6w92RbYs+OHMCxdSs1ndtwjq9v4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700727277; x=1701332077;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGikuQEnMU1wbY+Kds9GFhjxhXhIU7I3GXsmCFEGcZs=;
        b=pUoYw+bhI2tcGj4mBYiT925eA6YlGmShcFHRP6JptMz47tXeZE0/fi0qlMssscnwCw
         0P9SUP9QwKcN4OLCqXqcgu5+HSSLDbpFqLEfNJeFrCor3M7Qnpy3wuh2xeG2c4jCIrec
         owUQTKCZ+ybntdMSH6bzjmrBgIFRKLI/cK9Dej3Fm4Er6Xkn+qmMqApaqDfoZwCZixvm
         l3OsT81pVceSsZiUUjPHiScnQyaaPy4TZZyBRnLh7he1YS5n+/jJknRJgIIUB6O//cgi
         Ny8CqxK/tEl+TKWX2qqIuMC+jpT2O3rovNqDx6Uqc2JHHlX3IgmfWJh0xAV7lthlkQvG
         O8kw==
X-Gm-Message-State: AOJu0YysGUllkWyRPNld7mAO7BkMUlD6/25x/laKMv54oUWq6nGBExeI
	wxRsh2ReWwa0yeWVBF3oBlnhEA==
X-Google-Smtp-Source: AGHT+IEyBuFD3hOsqB8bH0VBjvglexof08H1lbuunClqQziuXyTvQnav15pKhgIf7kQmoHgthN4Ykg==
X-Received: by 2002:a05:6000:1446:b0:32f:8248:e00 with SMTP id v6-20020a056000144600b0032f82480e00mr2246564wrx.51.1700727277570;
        Thu, 23 Nov 2023 00:14:37 -0800 (PST)
Date: Thu, 23 Nov 2023 09:14:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v7 1/2] xen/vpci: header: status register handler
Message-ID: <ZV8J7CoFJyN9a5GO@macbook>
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
 <20230913143550.14565-2-stewart.hildebrand@amd.com>
 <ZVdfRQpGFSU1OIkh@macbook.local>
 <a28239cd-e94e-4e0e-b415-a7ae32befd40@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a28239cd-e94e-4e0e-b415-a7ae32befd40@amd.com>

On Wed, Nov 22, 2023 at 03:16:29PM -0500, Stewart Hildebrand wrote:
> On 11/17/23 07:40, Roger Pau Monné wrote:
> > On Wed, Sep 13, 2023 at 10:35:46AM -0400, Stewart Hildebrand wrote:
> >>      r->write(pdev, r->offset, data & (0xffffffffU >> (32 - 8 * r->size)),
> >>               r->private);
> >>  }
> >> diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
> >> index 84b18736a85d..b72131729db6 100644
> >> --- a/xen/include/xen/pci_regs.h
> >> +++ b/xen/include/xen/pci_regs.h
> >> @@ -66,6 +66,15 @@
> >>  #define  PCI_STATUS_REC_MASTER_ABORT	0x2000 /* Set on master abort */
> >>  #define  PCI_STATUS_SIG_SYSTEM_ERROR	0x4000 /* Set when we drive SERR */
> >>  #define  PCI_STATUS_DETECTED_PARITY	0x8000 /* Set on parity error */
> >> +#define  PCI_STATUS_RSVDZ_MASK		0x0006
> > 
> > In my copy of the PCIe 6 spec bit 6 is also RsvdZ, so the mask should
> > be 0x46.
> 
> Right, mine too. It's probably safer to follow the newer version of the spec, so I'll make the change. For completeness / archaeology purposes, I just want to document some relevant data points here.
> 
> In PCIe 4 spec, it says this about bit 6:
> "These bits were used in previous versions of the programming model. Careful consideration should be given to any attempt to repurpose them."
> 
> Going further back, PCI (old school PCI, not Express) spec 3.0 says this about bit 6:
> "This bit is reserved. *"
> "* In Revision 2.1 of this specification, this bit was used to indicate whether or not a device supported User Definable Features."
> 
> Just above in our pci_regs.h (and equally in Linux include/uapi/linux/pci_regs.h) we have this definition for bit 6:
> #define  PCI_STATUS_UDF         0x40    /* Support User Definable Features [obsolete] */
> 
> Qemu hw/xen/xen_pt_config_init.c treats bit 6 as RO:
>         .ro_mask    = 0x06F8,

Right, given the implementation of ro_mask that would likely be fine.
Reading unconditionally as 0 while preserving the value on writes
seems the safest option.

Thanks, Roger.

