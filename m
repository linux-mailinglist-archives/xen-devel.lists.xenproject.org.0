Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E818110C9
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 13:13:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653983.1020608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDO63-0004gb-3Z; Wed, 13 Dec 2023 12:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653983.1020608; Wed, 13 Dec 2023 12:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDO63-0004dl-0a; Wed, 13 Dec 2023 12:12:15 +0000
Received: by outflank-mailman (input) for mailman id 653983;
 Wed, 13 Dec 2023 12:12:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IrFR=HY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rDO60-0004cb-UP
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 12:12:12 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7a491d6-99b0-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 13:12:10 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33635d11d92so855171f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 04:12:10 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 k2-20020a5d6282000000b003363432c0ffsm3429132wru.113.2023.12.13.04.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 04:12:09 -0800 (PST)
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
X-Inumbo-ID: d7a491d6-99b0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702469530; x=1703074330; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1+N4toHCJ10eN7beh/9j8TkfnPseGcXj+HseAP1tdBY=;
        b=kqyL0jRTgtuQ9KRBmOtY5TwO7YKc9qVBq+v28E/7kDHa2oh37xIvjWi99J7gk7eWi1
         paYQdLTFJVXkass0EZ0DkJCcVQXnWEBNbzaLOsZhtS2jsPHQ9Pxoo38uxi6nDk8miY5u
         IY2r3GDwtmILUUZchmCn9w01NLh9CAEDi/S7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702469530; x=1703074330;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+N4toHCJ10eN7beh/9j8TkfnPseGcXj+HseAP1tdBY=;
        b=bzPZ+borgUfwWbJ4Fr9CL86KWCybB3Wsu291h6U0EUgc2iTB/EP7MlsC41+Pc4boLr
         YhTC71sbeoxXeSq7pPiIUjVhVR4ycvmxXMK4RBxTSbkAqPKfOU2YUp+fKCDL7B/H0iJi
         cbt4yW0h4LASy+kln8bzZ/KO1YLiUSIJGZU0oZZrkFET/iNQ4DgrI652HkDOJ1T2Z07d
         TUZnggpcpwYqDoV5la7xK70Lh4fY1lmQsLLbRbR00GCPBtbBPw5RqcnBSycbgmyUv74C
         4a7BRkhwQc0tPZicZLINqWp1Bl0ssPrQW05D7a+iYWp5DubOdiXhpUZNQ918wcaKDITR
         CFDg==
X-Gm-Message-State: AOJu0Yyv6Q2d5Io76bsUOUfl+1XAAK9cEzh4i9ZZhr7NXsu5cyAgmYoh
	dYz80O+xHbjGUX3lhAeXbfPzig==
X-Google-Smtp-Source: AGHT+IEXQImdxtidsySE8Dvo4Qp275qPuasc4MbJLcUoaLv3rryHkHfFfLlFqk21Zhh1xtU9nWcpFQ==
X-Received: by 2002:adf:fd08:0:b0:333:43a2:2caf with SMTP id e8-20020adffd08000000b0033343a22cafmr4973429wrr.14.1702469530209;
        Wed, 13 Dec 2023 04:12:10 -0800 (PST)
Date: Wed, 13 Dec 2023 13:12:09 +0100
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
Message-ID: <ZXmfmbb4S8Iuy7si@macbook>
References: <20231210161519.1550860-1-Jiqian.Chen@amd.com>
 <20231210161519.1550860-4-Jiqian.Chen@amd.com>
 <ZXdNf0HWs4nAVPeF@macbook>
 <BL1PR12MB584910C2E370BBCC8A312733E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXglU0EtBrRNiWVp@macbook>
 <BL1PR12MB584973D751EB57C3DE766AEEE78DA@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB584973D751EB57C3DE766AEEE78DA@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, Dec 13, 2023 at 03:31:21AM +0000, Chen, Jiqian wrote:
> On 2023/12/12 17:18, Roger Pau Monné wrote:
> > On Tue, Dec 12, 2023 at 06:34:27AM +0000, Chen, Jiqian wrote:
> >>
> >> On 2023/12/12 01:57, Roger Pau Monné wrote:
> >>> On Mon, Dec 11, 2023 at 12:15:19AM +0800, Jiqian Chen wrote:
> >>>> There is a need for some scenarios to use gsi sysfs.
> >>>> For example, when xen passthrough a device to dumU, it will
> >>>> use gsi to map pirq, but currently userspace can't get gsi
> >>>> number.
> >>>> So, add gsi sysfs for that and for other potential scenarios.
> >>>>
> >>>> Co-developed-by: Huang Rui <ray.huang@amd.com>
> >>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >>>> ---
> >>>>  drivers/acpi/pci_irq.c  |  1 +
> >>>>  drivers/pci/pci-sysfs.c | 11 +++++++++++
> >>>>  include/linux/pci.h     |  2 ++
> >>>>  3 files changed, 14 insertions(+)
> >>>>
> >>>> diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
> >>>> index 630fe0a34bc6..739a58755df2 100644
> >>>> --- a/drivers/acpi/pci_irq.c
> >>>> +++ b/drivers/acpi/pci_irq.c
> >>>> @@ -449,6 +449,7 @@ int acpi_pci_irq_enable(struct pci_dev *dev)
> >>>>  		kfree(entry);
> >>>>  		return 0;
> >>>>  	}
> >>>> +	dev->gsi = gsi;
> >>>
> >>> It would be better if the gsi if fetched without requiring calling
> >>> acpi_pci_irq_enable(), as the gsi doesn't require the interrupt to be
> >>> enabled.  The gsi is known at boot time and won't change for the
> >>> lifetime of the device.
> >> Do you have any suggest places to do this?
> > 
> > I'm not an expert on this, but drivers/pci/pci-sysfs.c would seem like
> > a better place, together with the rest of the resources.
> I'm not familiar with this too. But it seems pci-sysfs.c only creates sysfs node and supports the read/write method without initializing the values.
> If want to initialize the value of gsi here. An approach to initialize it is to call acpi_pci_irq_lookup to get gsi number when the first time it is read?

Hm, maybe, I don't really have much experience with sysfs, so don't
know how nodes are usually initialized.

> > 
> > Maybe my understanding is incorrect, but given the suggested placement
> > in acpi_pci_irq_enable() I think the device would need to bind the
> > interrupt in order for the gsi node to appear on sysfs?
> No, gsi sysfs has existed there, in acpi_pci_irq_enable is to initialize the value of gsi.
> 
> > 
> > Would the current approach work if the device is assigned to pciback
> > on the kernel command line, and thus never owned by any driver in
> > dom0?
> If assigned to pciback, I think pciback will enable the device, and then acpi_pci_irq_enable will be called, and then the gsi will be initialized. So, current can work.

This needs checking to be sure, I'm certainly not that familiar.  You
would need to at least test that it works properly when the device is
hidden using xen-pciback.hide=(SBDF) in the Linux kernel command line.

Thanks, Roger.

