Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB1E261208
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 15:36:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFdmM-0007Y7-Cx; Tue, 08 Sep 2020 13:35:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wd5i=CR=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1kFdmL-0007Y2-4C
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 13:35:21 +0000
X-Inumbo-ID: 4b3bbdcd-6bef-4c87-8582-59d838dcfa89
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b3bbdcd-6bef-4c87-8582-59d838dcfa89;
 Tue, 08 Sep 2020 13:35:20 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id l9so17208289wme.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 06:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=L+q7scp9xjjgch+ap+Le4uzp4lwNvS0O3pZwHfl5AC4=;
 b=Bvtktd7Kv2+Bf11PeOjHz22TO/DcDN/MK4ZtvXB1N9tgR7bpuwJhHuuz+zziah8Dly
 NT5gQQwvGII6qsklOAE0hM4tYLLBGxLVTDEOh9Blu5adUC1bC8MJq4CX4fZQ7i/NT+lO
 LRx4wsI36gzGWhC6pEFAVq9nX5nai+IBsuzkIyo7DaPMwddtaa6Kkn6tAoUvub5a+cRt
 J1G8W5Q6/KKZX2g2mVn7IWRXTF2RNp5Jg7JAZ+jWIQLbBoYzjzNLBLPHUHCxxlITf4ZT
 vk3gJgyxPd16CQInMy3EiwsrKddHF6L3k1Hz4uiLxtdQsuj4ZnOt6PA/vQZw8rBydHnx
 u/Dw==
X-Gm-Message-State: AOAM532Xjj0JPhPdz87id7PTPHSeiH3bnGYG+/7IbdTSoL1Vg7Aehn4I
 QrpNi+VP0dBTWqmjw3fJzEY=
X-Google-Smtp-Source: ABdhPJzYi9ehfaPBVSXymEhhuH1GTRlLQTD8B0hsU4d7EUccdQ6mwISG5Qg1ixAsK4hgy2OnnuC5uw==
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr4463133wmk.86.1599572119661; 
 Tue, 08 Sep 2020 06:35:19 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id p18sm14414596wrx.47.2020.09.08.06.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 06:35:18 -0700 (PDT)
Date: Tue, 8 Sep 2020 13:35:17 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Megha Dey <megha.dey@intel.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [patch V2 14/46] x86/ioapic: Consolidate IOAPIC allocation
Message-ID: <20200908133517.nrqweaycr2erqscd@liuwe-devbox-debian-v2>
References: <20200826111628.794979401@linutronix.de>
 <20200826112332.054367732@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826112332.054367732@linutronix.de>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Aug 26, 2020 at 01:16:42PM +0200, Thomas Gleixner wrote:
...
> --- a/drivers/iommu/hyperv-iommu.c
> +++ b/drivers/iommu/hyperv-iommu.c
> @@ -101,7 +101,7 @@ static int hyperv_irq_remapping_alloc(st
>  	 * in the chip_data and hyperv_irq_remapping_activate()/hyperv_ir_set_
>  	 * affinity() set vector and dest_apicid directly into IO-APIC entry.
>  	 */
> -	irq_data->chip_data = info->ioapic_entry;
> +	irq_data->chip_data = info->ioapic.entry;

Not sure if it is required for such a trivial change but here you go:

Acked-by: Wei Liu <wei.liu@kernel.org>

