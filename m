Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 940CF7F614A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 15:21:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639760.997441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Aa7-0007Z2-98; Thu, 23 Nov 2023 14:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639760.997441; Thu, 23 Nov 2023 14:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Aa7-0007WW-6X; Thu, 23 Nov 2023 14:21:27 +0000
Received: by outflank-mailman (input) for mailman id 639760;
 Thu, 23 Nov 2023 14:21:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r6Aa6-0007WQ-0W
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 14:21:26 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 952e9b7e-8a0b-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 15:21:24 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32fdc5be26dso504426f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 06:21:24 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 t2-20020a5d4602000000b0032da4c98ab2sm1846428wrq.35.2023.11.23.06.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 06:21:23 -0800 (PST)
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
X-Inumbo-ID: 952e9b7e-8a0b-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700749284; x=1701354084; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+1DgVCIvaP4AaHYReC5cKmAtSWJTfarkK6VJra/tqM=;
        b=XnqMrxgvVAxJXJ4qKNcwtR/hXzjxfsVoBR83xWcI3pvcUwEefF8fRzbqeP21KOJ5e/
         wVnUyTyJl52q6PAI0OpXR84vZ+UvPLZAK/j8I464O7EmUdvcxXX0cgRQjxwv/1nVqi+Z
         nJ66rKsZxlMgOyyJpbGu4K81mdIEUgdW0ZbWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700749284; x=1701354084;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+1DgVCIvaP4AaHYReC5cKmAtSWJTfarkK6VJra/tqM=;
        b=JIklpTfmX3aYDuUhg/eOF8QzS0Mlst6PIYO0dyTmxEjXws8bw73B6WMbgVH18i3UEp
         3qfzdUpVnpyBvsK8junG12q+F0V+G4zjaQ9d8l14+q/ixYD6q+LrlFIjnJoK7F4uLDDu
         adwEZwIj0Fl5VYyQE9MSvri1VlQBREHIfgyL48P7/E4AkgFSORZBuawKqfD3KG272Mst
         6LfOmPGqgNfBA35gaEjffA6h1zAMzarUeTVd1VxR4dqoQjFMfegFqDy006CCZMMzvzYJ
         iRftRLratb6/o9Pz+2pIFR+XUj1hdFrcWp+x+izDKLVPrKX+9Y44oSPWy84P+KDb1jxh
         kIJQ==
X-Gm-Message-State: AOJu0Yy7TE4AMT/L3ef76yv586HsLWXWxVG7kbu6+cRoaXlEa0WwblQI
	9NQo0zhMSfudCRZh9cmYFso5dw==
X-Google-Smtp-Source: AGHT+IFwTQmP5vbApJWHTWbSdnRO4YrkOLy2xLhoG1kbFzsO6uuzjnfkGb4t18DJEAe8PN7L1PgvkQ==
X-Received: by 2002:a5d:558d:0:b0:32f:7b89:2675 with SMTP id i13-20020a5d558d000000b0032f7b892675mr2343314wrv.65.1700749284309;
        Thu, 23 Nov 2023 06:21:24 -0800 (PST)
Date: Thu, 23 Nov 2023 15:21:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v7 1/2] xen/vpci: header: status register handler
Message-ID: <ZV9f4wJvWw7d5gCA@macbook>
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
 <20230913143550.14565-2-stewart.hildebrand@amd.com>
 <ZVdfRQpGFSU1OIkh@macbook.local>
 <a28239cd-e94e-4e0e-b415-a7ae32befd40@amd.com>
 <ZV8J7CoFJyN9a5GO@macbook>
 <193af77c-9176-44e6-bc29-073a6a2d2b12@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <193af77c-9176-44e6-bc29-073a6a2d2b12@amd.com>

On Thu, Nov 23, 2023 at 07:57:21AM -0500, Stewart Hildebrand wrote:
> On 11/23/23 03:14, Roger Pau Monné wrote:
> > On Wed, Nov 22, 2023 at 03:16:29PM -0500, Stewart Hildebrand wrote:
> >> On 11/17/23 07:40, Roger Pau Monné wrote:
> >>> On Wed, Sep 13, 2023 at 10:35:46AM -0400, Stewart Hildebrand wrote:
> >>>>      r->write(pdev, r->offset, data & (0xffffffffU >> (32 - 8 * r->size)),
> >>>>               r->private);
> >>>>  }
> >>>> diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
> >>>> index 84b18736a85d..b72131729db6 100644
> >>>> --- a/xen/include/xen/pci_regs.h
> >>>> +++ b/xen/include/xen/pci_regs.h
> >>>> @@ -66,6 +66,15 @@
> >>>>  #define  PCI_STATUS_REC_MASTER_ABORT	0x2000 /* Set on master abort */
> >>>>  #define  PCI_STATUS_SIG_SYSTEM_ERROR	0x4000 /* Set when we drive SERR */
> >>>>  #define  PCI_STATUS_DETECTED_PARITY	0x8000 /* Set on parity error */
> >>>> +#define  PCI_STATUS_RSVDZ_MASK		0x0006
> >>>
> >>> In my copy of the PCIe 6 spec bit 6 is also RsvdZ, so the mask should
> >>> be 0x46.
> >>
> >> Right, mine too. It's probably safer to follow the newer version of the spec, so I'll make the change. For completeness / archaeology purposes, I just want to document some relevant data points here.
> >>
> >> In PCIe 4 spec, it says this about bit 6:
> >> "These bits were used in previous versions of the programming model. Careful consideration should be given to any attempt to repurpose them."
> >>
> >> Going further back, PCI (old school PCI, not Express) spec 3.0 says this about bit 6:
> >> "This bit is reserved. *"
> >> "* In Revision 2.1 of this specification, this bit was used to indicate whether or not a device supported User Definable Features."
> >>
> >> Just above in our pci_regs.h (and equally in Linux include/uapi/linux/pci_regs.h) we have this definition for bit 6:
> >> #define  PCI_STATUS_UDF         0x40    /* Support User Definable Features [obsolete] */
> >>
> >> Qemu hw/xen/xen_pt_config_init.c treats bit 6 as RO:
> >>         .ro_mask    = 0x06F8,
> > 
> > Right, given the implementation of ro_mask that would likely be fine.
> > Reading unconditionally as 0 while preserving the value on writes
> > seems the safest option.
> 
> That would mean treating bit 6 as RsvdP, even though the PCIe 6 spec
> says RsvdZ. I just want to confirm this is indeed the intent since
> we both said RsvdZ just a moment ago? If so, I would add a comment
> since it's deviating from spec. I would personally still vote in
> favor of following PCIe 6 spec (RsvdZ).

Hm, yes, lets go with the spec and use RsdvZ.  I very much doubt we
passthrough any device that actually uses the UDF bit.

Thanks, Roger.

