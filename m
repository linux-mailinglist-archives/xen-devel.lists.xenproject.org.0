Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FFAA764C6
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 13:12:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932411.1334540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzD4N-0007Yk-H8; Mon, 31 Mar 2025 11:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932411.1334540; Mon, 31 Mar 2025 11:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzD4N-0007WL-EU; Mon, 31 Mar 2025 11:12:43 +0000
Received: by outflank-mailman (input) for mailman id 932411;
 Mon, 31 Mar 2025 11:12:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FpTe=WS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzD4M-0007WF-1y
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 11:12:42 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f38305d-0e21-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 13:12:40 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac3b12e8518so834835666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 04:12:40 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac72fbab01fsm469096066b.180.2025.03.31.04.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 04:12:39 -0700 (PDT)
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
X-Inumbo-ID: 0f38305d-0e21-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743419559; x=1744024359; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8OGZkv4VKbS5EAY3Zv/PCRtGeHuPnWGXcZb3hpZ3vX8=;
        b=HOMhWdNNU63/YkIor2KrNosxLNyWbEUiL5Dig7MkTVIdVpIHYluDKAxehRXDQptKxy
         Lznw01776+jda3fUlOVYwIERFoTdI8h6rkO8c9vJd6Cxgmdg70NHkkj+0NZEKz5MDzj/
         /y8RDpwpkIa0aOJlfeJWKR7StvD2qGZEAZltM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743419559; x=1744024359;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8OGZkv4VKbS5EAY3Zv/PCRtGeHuPnWGXcZb3hpZ3vX8=;
        b=w5J3jtGQNcSYuc4lK8e4nexg2NlxrvRJ6x1Z7KivdiB2R3Sk7Z89jCMu2/6CNQTR+C
         0CiWybmvi151rosZkCnXQFYIPS1s0d31CvMsxnlHoGIQZ8Mjbs0yJ5KaUBUPtLBSBnrk
         6Zja9bjrz/nzFO1A9KG916A9i+OC67APDyJPO5xPrAT8e4J1S3B9e0FI/RvbaTiAhXBs
         WGMdzTWUZUjo0Smfh4x2qF1v5n5EZHBKzDIKNSh6ywXudaCjLfETtVvZdwn/9SJDw6DS
         NiP3W1DVnGoJn4k4rj21gCF0lbhymMZhYlPpbItJv0civ0jmYhyzacVmik2mcM/oyvj/
         XrQw==
X-Gm-Message-State: AOJu0YxTGa75Ua7zs0BQaVd5eLEU6rBuAjU5VwH7ypYFqR4lEScQ0LBO
	92XjkmqBhCiBF45boU8mZ3APbn6N82rJMdxnR2zVkKyoT4K8cKxUQkk+Yf8Ic2M=
X-Gm-Gg: ASbGncvro4onnGj/9OVEgntKZy/kmwIcYLionLCQo6AdALUcst1Sm+PBFA10Ui9hiu2
	nZrhQn306YXxn+BGThIDEdeXnmrUqgX51+EzRMploEIU6Ds/l0V2oK+AKaUOtbQ1AdnjQI+5IPv
	g7vsIXljJOCb3uV1lbMSihoIlkavB7Guf99xYEk6AAX3IxS0GJB4m0EtB9cXWHrOWATjkLr/O+i
	5qY7hYHYv+mUFTL/j88MI/xAD2tvQLOyjO/rfVqUBJzGKbiAkFWEj+88DxQEYndVWyostkYavh6
	dfnothNI6wNwi3W6nFtnOxzESDQCtMdNMyIwtmPe4AJXUqdQPQ==
X-Google-Smtp-Source: AGHT+IGUJW/CiPl9IgVZ8Bar7GaXEt/lzWeIiRbbPqk49XjnDR5WCxbyBdZw6syGkKP3RtE71GrhmQ==
X-Received: by 2002:a17:907:97c9:b0:ac4:3d0:8bc6 with SMTP id a640c23a62f3a-ac7389e1864mr752576266b.13.1743419559515;
        Mon, 31 Mar 2025 04:12:39 -0700 (PDT)
Date: Mon, 31 Mar 2025 13:12:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v1 3/3] vpci/msi: Remove registers when init_msi() fails
Message-ID: <Z-p4NhVD0p7WW23S@macbook.local>
References: <20250327073214.158210-1-Jiqian.Chen@amd.com>
 <20250327073214.158210-3-Jiqian.Chen@amd.com>
 <Z-VIFo7q7-UNsLCt@macbook.local>
 <BL1PR12MB584905BC9966EF9742FF4472E7AD2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Z-pYJNyGieUqkVvl@macbook.local>
 <BL1PR12MB58497148061E1287CF9E24CDE7AD2@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB58497148061E1287CF9E24CDE7AD2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Mon, Mar 31, 2025 at 09:43:11AM +0000, Chen, Jiqian wrote:
> On 2025/3/31 16:53, Roger Pau Monné wrote:
> > On Mon, Mar 31, 2025 at 08:13:50AM +0000, Chen, Jiqian wrote:
> >> On 2025/3/27 20:44, Roger Pau Monné wrote:
> >>> On Thu, Mar 27, 2025 at 03:32:14PM +0800, Jiqian Chen wrote:
> >>>> When init_msi() fails, the new codes will try to hide MSI
> >>>> capability, so it can't rely on vpci_deassign_device() to
> >>>> remove all MSI related registers anymore, those registers
> >>>> must be cleaned up in failure path of init_msi.
> >>>>
> >>>> To do that, use a vpci_register array to record all MSI
> >>>> registers and call vpci_remove_register() to remove registers.
> >>>
> >>> As I'm just seeing 3 patches on the series, isn't there one missing
> >>> for MSI-X at least?
> >> No, because init_msix only call vpci_add_register once, there is no need to remove registers when it fails.
> > 
> > Seems a bit fragile, what about if there's further code added to
> > init_msix() that could return an error after the vpci_add_register()
> > call?  It would be safer to have a cleanup function that removes the
> > config space handlers, plus the MMIO one (see the call to
> > register_mmio_handler()), and the addition to the
> > d->arch.hvm.msix_tables list.
> I am only talking about the current implementation of init_msix(), which does not need a cleanup function.
> But if you want such a function, even if it is not needed now, I will add it in the next version.

I think it would be cleaner, so that we could remove the MSI-X
specific logic from vpci_deassign_device().

> > 
> >>>
> >>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >>>>  
> >>>>      if ( pdev->vpci->msi->masking )
> >>>>      {
> >>>> +        offset = msi_mask_bits_reg(pos, pdev->vpci->msi->address64);
> >>>>          ret = vpci_add_register(pdev->vpci, mask_read, mask_write,
> >>>> -                                msi_mask_bits_reg(pos,
> >>>> -                                                  pdev->vpci->msi->address64),
> >>>> -                                4, pdev->vpci->msi);
> >>>> +                                offset, 4, pdev->vpci->msi);
> >>>>          if ( ret )
> >>>> -            return ret;
> >>>> +            goto fail;
> >>>> +        registers[reg_index].offset = offset;
> >>>> +        registers[reg_index++].size = 4;
> >>>
> >>> As commented on the previous patch, I don't like much the usage of
> >>> this registers array to store which handlers have been added.  It
> >>> would be best if you just removed every possible handler that could be
> >>> added, without keeping track of them.
> >> Make sense, it will indeed be simpler if it is fine to remove all possible registers.
> >>
> >>>
> >>> Thinking about it, do we maybe need a helper vcpi function that wipes
> >>> all handlers from a specific range?  I think it could be helpful here,
> >>> as the size of the capabilities is well-known, so on error it would be
> >>> easier to just call such a generic handler to wipe all hooks added to
> >>> the region covered by the failing capability.
> >> But I am not sure if that helper function is suitable for all capabilities.
> >> Like Rebar, its structure can range from 12 bytes long(for a single BAR) to 52 bytes long(for all six BARs).
> >> If a device supports Rebar and only has a single resizable BAR, does hardware still reserved the range from 13 bytes to 52 bytes for that device?
> > 
> > No, we would need to fetch the size of the capability in the cleanup
> > function, or figure it otherwise.  Note the same applies to MSI
> > capability, which has a variable size depending on whether 64bit
> > addresses and masking is supported.
> Got it, I originally thought you wanted a general helper function.
> But it seems the case is each capability would have its own separate cleanup function instead.

Sorry, maybe that wasn't clear.  The generic function would be a
helper to zap all handlers from a given PCI config space range, ie:

vpci_remove_registers(struct vpci *vpci, unsigned int offset,
                      unsigned int size);

Maybe it's even worth to just convert vpci_remove_register() into
vpci_remove_registers() and allow it to zap multiple registers at
once?  As vpci_remove_register() is just used for the tests harness.

That function would be used by each capability cleanup routine to
clean it's PCI config space.

Thanks, Roger.

