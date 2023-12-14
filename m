Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB8A812AA1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 09:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654323.1021111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDhMv-0004AI-GZ; Thu, 14 Dec 2023 08:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654323.1021111; Thu, 14 Dec 2023 08:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDhMv-00048N-Dl; Thu, 14 Dec 2023 08:46:57 +0000
Received: by outflank-mailman (input) for mailman id 654323;
 Thu, 14 Dec 2023 08:46:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5bz=HZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rDhMu-00048H-T5
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 08:46:56 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54d9fe68-9a5d-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 09:46:55 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-336445a2749so617819f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 00:46:54 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 h12-20020a5d504c000000b003333521a1cesm3283381wrt.57.2023.12.14.00.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 00:46:53 -0800 (PST)
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
X-Inumbo-ID: 54d9fe68-9a5d-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702543614; x=1703148414; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VRbI5kjcIRPl4oUV94OH4S0caT5wjSRkLPGI8s4DA/k=;
        b=NOS/gkojgOMTcITGkJEFJQHkH1Bv6QCp/kMTk9PHWA2UqIGvbPshXZuCEdCXxovMxI
         D4V9BEQmrP0Eq7gjmgVhi6gJByMg5cIDyIQEARZiY0dftktTHabYvM8p6dnIJljOuozq
         M4aIO+Zxf1T+fHGhiwPpO9g4H2wXYUVKYhTxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702543614; x=1703148414;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VRbI5kjcIRPl4oUV94OH4S0caT5wjSRkLPGI8s4DA/k=;
        b=kRW3lrMlo+dMVQgCY6kGoeTs4Yaq9b+GdgsVSLqIYBICXpIaanOwyUdfFkqvKO5l6N
         oajyV6ZUl3eYvquDvC88eR2O89pZb69ZdAXPtQo/7+phlyyHLlnHUntjMNteC6ylrlWh
         mduQuEl6VkJfpxULo6njVtCwgLPkEaX5MdBU45l45Qk3RyaHBdJDvzwZqv2T6xFRYd4u
         vGmkF9UIjEmjat6rmeGC1lnMv1zMFVmM1hwohNZL7nap4eHpJaU2Rm0anNd/RDjbT5JD
         cn9Vwt0bqb3w5rQqBxhP+FkSC4ummHIE1IWGGqI8cJZuC7aBsnvJCW3E2BFluLyaGoKH
         hJ4w==
X-Gm-Message-State: AOJu0YwRhiut018HoOqDyvrC4nxjre6RGY/VQZmbrTVj9ltCNIekto04
	ui8dqppde39uRmSwWOLfzuATFg==
X-Google-Smtp-Source: AGHT+IFs1KY+zsQXwuAqC03LiFJwO3hRSTw+6+YdEzAfW15eHnWqW0A0/g+qvKOg7kFPUNaNrf5hAQ==
X-Received: by 2002:a5d:6aca:0:b0:336:9ec:d613 with SMTP id u10-20020a5d6aca000000b0033609ecd613mr6133406wrw.90.1702543613756;
        Thu, 14 Dec 2023 00:46:53 -0800 (PST)
Date: Thu, 14 Dec 2023 09:46:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v3 3/3] PCI/sysfs: Add gsi sysfs for pci_dev
Message-ID: <ZXrA_OocbBkFAkM-@macbook>
References: <20231210161519.1550860-1-Jiqian.Chen@amd.com>
 <20231210161519.1550860-4-Jiqian.Chen@amd.com>
 <ZXdNf0HWs4nAVPeF@macbook>
 <BL1PR12MB584910C2E370BBCC8A312733E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXglU0EtBrRNiWVp@macbook>
 <BL1PR12MB584973D751EB57C3DE766AEEE78DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXmfmbb4S8Iuy7si@macbook>
 <BL1PR12MB584911B4DFF4D9ED65CF92F0E78CA@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB584911B4DFF4D9ED65CF92F0E78CA@BL1PR12MB5849.namprd12.prod.outlook.com>

On Thu, Dec 14, 2023 at 07:08:32AM +0000, Chen, Jiqian wrote:
> On 2023/12/13 20:12, Roger Pau Monné wrote:
> > On Wed, Dec 13, 2023 at 03:31:21AM +0000, Chen, Jiqian wrote:
> >> On 2023/12/12 17:18, Roger Pau Monné wrote:
> >>> On Tue, Dec 12, 2023 at 06:34:27AM +0000, Chen, Jiqian wrote:
> >>>>
> >>>> On 2023/12/12 01:57, Roger Pau Monné wrote:
> >>>>> On Mon, Dec 11, 2023 at 12:15:19AM +0800, Jiqian Chen wrote:
> >>>>>> There is a need for some scenarios to use gsi sysfs.
> >>>>>> For example, when xen passthrough a device to dumU, it will
> >>>>>> use gsi to map pirq, but currently userspace can't get gsi
> >>>>>> number.
> >>>>>> So, add gsi sysfs for that and for other potential scenarios.
> >>>>>>
> >>>>>> Co-developed-by: Huang Rui <ray.huang@amd.com>
> >>>>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >>>>>> ---
> >>>>>>  drivers/acpi/pci_irq.c  |  1 +
> >>>>>>  drivers/pci/pci-sysfs.c | 11 +++++++++++
> >>>>>>  include/linux/pci.h     |  2 ++
> >>>>>>  3 files changed, 14 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
> >>>>>> index 630fe0a34bc6..739a58755df2 100644
> >>>>>> --- a/drivers/acpi/pci_irq.c
> >>>>>> +++ b/drivers/acpi/pci_irq.c
> >>>>>> @@ -449,6 +449,7 @@ int acpi_pci_irq_enable(struct pci_dev *dev)
> >>>>>>  		kfree(entry);
> >>>>>>  		return 0;
> >>>>>>  	}
> >>>>>> +	dev->gsi = gsi;
> >>>>>
> >>>>> It would be better if the gsi if fetched without requiring calling
> >>>>> acpi_pci_irq_enable(), as the gsi doesn't require the interrupt to be
> >>>>> enabled.  The gsi is known at boot time and won't change for the
> >>>>> lifetime of the device.
> >>>> Do you have any suggest places to do this?
> >>>
> >>> I'm not an expert on this, but drivers/pci/pci-sysfs.c would seem like
> >>> a better place, together with the rest of the resources.
> >> I'm not familiar with this too. But it seems pci-sysfs.c only creates sysfs node and supports the read/write method without initializing the values.
> >> If want to initialize the value of gsi here. An approach to initialize it is to call acpi_pci_irq_lookup to get gsi number when the first time it is read?
> > 
> > Hm, maybe, I don't really have much experience with sysfs, so don't
> > know how nodes are usually initialized.
> Maybe the maintainers of sysfs can give some suggest places to initialize the value of gsi.
> 
> > 
> >>>
> >>> Maybe my understanding is incorrect, but given the suggested placement
> >>> in acpi_pci_irq_enable() I think the device would need to bind the
> >>> interrupt in order for the gsi node to appear on sysfs?
> >> No, gsi sysfs has existed there, in acpi_pci_irq_enable is to initialize the value of gsi.
> >>
> >>>
> >>> Would the current approach work if the device is assigned to pciback
> >>> on the kernel command line, and thus never owned by any driver in
> >>> dom0?
> >> If assigned to pciback, I think pciback will enable the device, and then acpi_pci_irq_enable will be called, and then the gsi will be initialized. So, current can work.
> > 
> > This needs checking to be sure, I'm certainly not that familiar.  You
> > would need to at least test that it works properly when the device is
> > hidden using xen-pciback.hide=(SBDF) in the Linux kernel command line.
> Sure, I have validated it on my side. Both the "Static assignment for built-in xen-pciback(xen-pciback.hide=(SBDF))" and the "Dynamic assignment with xl(sudo modprobe xen-pciback & sudo xl pci-assignable-add SBDF)" can work fine with current implementation.

Oh, OK, if that's the case I don't have much objection in doing the
initialization in acpi_pci_irq_enable(), that's an internal Linux
detail.  I mostly care about the GSI being exposed in sysfs in a
non-Xen specific way.

Thanks, Roger.

