Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8839C516B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 10:03:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834243.1249859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAmnG-0000sN-Aw; Tue, 12 Nov 2024 09:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834243.1249859; Tue, 12 Nov 2024 09:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAmnG-0000pH-8F; Tue, 12 Nov 2024 09:02:38 +0000
Received: by outflank-mailman (input) for mailman id 834243;
 Tue, 12 Nov 2024 09:02:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yVpr=SH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tAmnE-0000oo-OL
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 09:02:36 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da263b82-a0d4-11ef-a0c6-8be0dac302b0;
 Tue, 12 Nov 2024 10:02:32 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9a850270e2so985095966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 01:02:32 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0e2f731sm699363766b.189.2024.11.12.01.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 01:02:31 -0800 (PST)
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
X-Inumbo-ID: da263b82-a0d4-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MjkiLCJoZWxvIjoibWFpbC1lajEteDYyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImRhMjYzYjgyLWEwZDQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDAyMTUyLjc0OTgzNywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731402152; x=1732006952; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zfy5GCQpL7A1GMHosyPm4UUsKkMSgQopCUzLanqVz1Y=;
        b=fZM20EmtJNaePU0NVlCCiKm4RsOyLT2/1pKpdF8a2jzzr31NnEdYs3EATzwxC97f9k
         AjRo7Y/Z/2OzVg84H8VhmBSK84Kd9FzAYKW7vIuLTjU1eXG2Pea991YqoBOajLDpeI7U
         z0h19O7yIS/vUxTkas9Ar2ax7ahRXucmbpBBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731402152; x=1732006952;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zfy5GCQpL7A1GMHosyPm4UUsKkMSgQopCUzLanqVz1Y=;
        b=hJkc5xh4wat3Q1ZNSOsjT27hiT2gX1jIe31lB4wLtYsgE+AoVXdzeCQ8aAc4cbs5WX
         UVuG5OuMSboaFWOytfYQBEMM8e6G5NKjadxldNMBfESwkmytNE1C1QJPzpirJHXMr1+F
         YgNDsE3kgvOE509Nr8tMq/7/ahFAJxQAXfsVyzehXEzFQ1nyn8hsKxMv+7VfhNv8AGe0
         yYydAL9Us6SEVZCmzl7hnS+ok6cpHjuLeoe1cDL4WLCg6Ed3wbm9t5BBShy1ouIwdVWk
         aQy0maaen6ekyXVh07khGJDA35b8WhDCSkV8nohgED8oKNs8gjbcUB1BMI9jxUKcvaEG
         ZxRg==
X-Gm-Message-State: AOJu0YyJqACo6jdUB1Ip6Pjgjf2RsavlGuRgVwWM1BSuy/fYd3KMiZa8
	UWXGd3lkb0NDFhvlxa6OK6moU180FbfIzWDlCoMpLFNXQ60fvq7MP09CSafbzQI=
X-Google-Smtp-Source: AGHT+IGtps191cWNcNQ+rX8aWqRGISb5S18YbHN7DbmFwrmVXVLdPA/x5AX9s4x9Dwvn+IAayylTMw==
X-Received: by 2002:a17:907:961f:b0:a9a:82e2:e8ce with SMTP id a640c23a62f3a-a9eeffeda48mr1383691566b.40.1731402151978;
        Tue, 12 Nov 2024 01:02:31 -0800 (PST)
Date: Tue, 12 Nov 2024 10:02:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
Message-ID: <ZzMZpg3FCyc4SW4z@macbook>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <Zx_a57npsdRhLgYr@macbook>
 <b3f9a4a4-112b-4d58-afca-bc88ea2b1e11@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3f9a4a4-112b-4d58-afca-bc88ea2b1e11@amd.com>

On Mon, Nov 11, 2024 at 03:07:28PM -0500, Stewart Hildebrand wrote:
> On 10/28/24 14:41, Roger Pau Monné wrote:
> > On Fri, Oct 18, 2024 at 04:39:09PM -0400, Stewart Hildebrand wrote:
> > IOW: shouldn't the PF
> > always be added first, so that SR-IOV can be enabled and the VFs added
> > afterwards?
> 
> Yes, I think you're right.
> 
> > I see previous code also catered for VFs being added without the PF
> > being present, so I assume there was some need for this.
> 
> This is exactly the source of the confusion on my part. In the removal
> path, the consensus seems to be that removing a PF with VFs still
> present indicates an error. Then shouldn't the opposite also be true?
> Adding a VF without a PF should also indicate an error.
> 
> I see the PF-adding logic was added in 942a6f1376d8 ("x86/PCI-MSI:
> properly determine VF BAR values"). Searching the mailing list archives
> didn't reveal much about it [0].
> 
> [0] https://lore.kernel.org/xen-devel/4E3FC6E102000078000501CA@nat28.tlf.novell.com/
> 
> The only time I've observed this path being taken is by manually
> calling PHYSDEVOP_pci_device_add. I've resorted to calling
> PHYSDEVOP_pci_device_{remove,add} from userspace in order to test this,
> because the Linux kernel doesn't behave this way.
> 
> I can't think of a good rationale for catering to VFs being added
> without a PF, so I'll turn it into an error for the next rev.

Maybe there's a case for a device to be discovered with SR-IOV already
enabled (ie: when booting in kexec like environments), but then I
would still expect the OS to first add the PF and afterwards the VFs.
Otherwise I'm not even sure whether the OS would be capable of
identifying the VFs as such.

> >> +                    ASSERT_UNREACHABLE();
> >> +                    free_pdev(pseg, pdev);
> >> +                    ret = -EILSEQ;
> >> +                    goto out;
> >> +                }
> >> +            }
> >> +
> >> +            pdev->info.is_extfn = pf_pdev->info.is_extfn;
> >> +            pdev->virtfn.pf_pdev = pf_pdev;
> >> +            list_add(&pdev->vf_list, &pf_pdev->vf_list);
> >> +        }
> >>      }
> >>  
> >>      if ( !pdev->info.is_virtfn && !pdev->vf_rlen[0] )
> >> @@ -821,6 +851,24 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
> >>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> >>          if ( pdev->bus == bus && pdev->devfn == devfn )
> >>          {
> >> +            if ( !pdev->info.is_virtfn )
> > 
> > Given we have no field to mark a device as a PF, we could check that
> > pdev->vf_list is not empty, and by doing so the warn_stale_vfs
> > variable could be dropped?
> > 
> > if ( !pdev->info.is_virtfn && !list_empty(&pdev->vf_list) )
> > {
> >     struct pci_dev *vf_pdev;
> > 
> >     while ( (vf_pdev = list_first_entry_or_null(&pdev->vf_list,
> >                                                 struct pci_dev,
> > 						vf_list)) != NULL )
> >     {
> >         list_del(&vf_pdev->vf_list);
> >         vf_pdev->virtfn.pf_pdev = NULL;
> >         vf_pdev->broken = true;
> >     }
> > 
> >     printk(XENLOG_WARNING "PCI SR-IOV PF %pp removed with VFs still present\n",
> >            &pdev->sbdf);
> > }
> 
> Yeah. Given that the consensus is leaning toward keeping the PF and
> returning an error, here's my suggestion:
> 
>     if ( !pdev->info.is_virtfn && !list_empty(&pdev->vf_list) )
>     {
>         struct pci_dev *vf_pdev;
> 
>         list_for_each_entry(vf_pdev, &pdev->vf_list, vf_list)
>             vf_pdev->broken = true;
> 
>         pdev->broken = true;

Do you need to mark the devices as broken?  My expectation would be
that returning -EBUSY here should prevent the device from being
removed, and hence there would be no breakage, just failure to fulfill
the (possible) hot-unplug request.

Thanks, Roger.

