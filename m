Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B62A0B3FC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 11:05:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870480.1281660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXHIj-0003ps-91; Mon, 13 Jan 2025 10:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870480.1281660; Mon, 13 Jan 2025 10:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXHIj-0003nH-5S; Mon, 13 Jan 2025 10:04:05 +0000
Received: by outflank-mailman (input) for mailman id 870480;
 Mon, 13 Jan 2025 10:04:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3HK6=UF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXHIh-0003nB-Dg
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 10:04:03 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6b4a684-d195-11ef-a0e1-8be0dac302b0;
 Mon, 13 Jan 2025 11:04:01 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fc01so8263774a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2025 02:04:01 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c90d9b19sm474988566b.73.2025.01.13.02.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 02:03:59 -0800 (PST)
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
X-Inumbo-ID: b6b4a684-d195-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736762641; x=1737367441; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NAozgVCwe5MTkDq2tRs81RaOUpNYbkuEcwNQ118VObQ=;
        b=BgfHzj7HyluC0vOZGvybgOYkvYCvvWYhX5rFlkzSq/P0QmMDjFm22DnPfIC2keJb57
         Z3WvBSAPj2tNDMk33PxFaIUaR8xjOYuR179UWL1+oCVSwyebwQiKf7ktghSlpgQjvTMY
         rCewtd27S6eKqVefRi57wU09PUqKoD3paQT3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736762641; x=1737367441;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NAozgVCwe5MTkDq2tRs81RaOUpNYbkuEcwNQ118VObQ=;
        b=p4nhHqF3xeKIt7oBh6VV41MLw3JAH1FwAy+6kXShKd9aaOzSvn067Bvxuck5Rxov1S
         rp1sKH6um7nGPcrdSTfZc/peUDkIYjmPSoJdTJWVN7sN/QY4JcuoLO5sGXYnBaxpuhlv
         8k6ATSr37GRkzw2GJMYesTnMNunJVrl5bPxcka4fS5yIHFMdWulV93+8U55NQME/rEgi
         gM5ciHt55/jKa1i7pXbKwYnTcPIw/j5mpgwZ5pEmA/8oTtSJ2RhhPH2v9Dzf0FINFREL
         CSdcmaRj69Z0ziO/R0wmMOfAUmmBORAobr2VMdOJGrUcNn9+xA90BMUm3WZMyd4/zwPV
         rqMA==
X-Forwarded-Encrypted: i=1; AJvYcCWIdZ0rU087rEGNFJoj6rNYEEDRxUTpgWxXWs3K8+X9ET7dnJ4V+FfDEQ+DZ2zhizh2euMejZAJicc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxEX5SbieEGj3fJTNz2xlZz1sWZCuGKFgVCZqPlm4PuDgVr0Of
	e5QbsFex2VGcFEvf59Xq4MXRFQNE7XesQggQeCWxzxaf3W/pbbbh3yukWasBjfg=
X-Gm-Gg: ASbGncu8szGXDO1Yv+B2WtvgraYK9PW/WwL7KtMXSUplWYhoBe5bk192Q/D9lX+YEFG
	2DU21if5YGzWGILQpJnJ2D6z0KBuiFgNvGknoDCo/WIWiejjX/UxUrj2nnGIPkolKp7+YBT5qFe
	+snHrfIyYLrT6rHNDtwL6tFlD8QXx1HoYALjNG3rocn0IhZjsSG4ITrfrnwC6C2gwy1cgL/WjLq
	tE5eO3kQY4T9Wc4bYFTqF4uMssBTQg6rLfc9IiOUYRpschTfiO4bPY+wJP1XQ==
X-Google-Smtp-Source: AGHT+IHN6cLAzIHvJBapqtn9TCnnP24m5RjiZPdKHg1bO2RsIgvurTxekJiYNBk5q8SmCTsIwdMt3A==
X-Received: by 2002:a17:907:60cf:b0:aa6:88f5:5fef with SMTP id a640c23a62f3a-ab2ab6fb426mr1905306566b.32.1736762641198;
        Mon, 13 Jan 2025 02:04:01 -0800 (PST)
Date: Mon, 13 Jan 2025 11:03:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 2/3] vmd: disable MSI remapping bypass under Xen
Message-ID: <Z4TlDhBNn8TMipdB@macbook.local>
References: <20250110140152.27624-3-roger.pau@citrix.com>
 <20250110222525.GA318386@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250110222525.GA318386@bhelgaas>

On Fri, Jan 10, 2025 at 04:25:25PM -0600, Bjorn Helgaas wrote:
> Match historical subject line style for prefix and capitalization:
> 
>   PCI: vmd: Set devices to D0 before enabling PM L1 Substates
>   PCI: vmd: Add DID 8086:B06F and 8086:B60B for Intel client SKUs
>   PCI: vmd: Fix indentation issue in vmd_shutdown()
> 
> On Fri, Jan 10, 2025 at 03:01:49PM +0100, Roger Pau Monne wrote:
> > MSI remapping bypass (directly configuring MSI entries for devices on the VMD
> > bus) won't work under Xen, as Xen is not aware of devices in such bus, and
> > hence cannot configure the entries using the pIRQ interface in the PV case, and
> > in the PVH case traps won't be setup for MSI entries for such devices.
> > 
> > Until Xen is aware of devices in the VMD bus prevent the
> > VMD_FEAT_CAN_BYPASS_MSI_REMAP capability from being used when running as any
> > kind of Xen guest.
> 
> Wrap to fit in 75 columns.

Hm, OK, but isn't the limit 80 columns according to the kernel coding
style (Documentation/process/coding-style.rst)?

I don't mind adjusting, but if you are going to ask every submitter to
limit to 75 columns then the coding style document should be updated
to reflect that.

> Can you include a hint about *why* Xen is not aware of devices below
> VMD?  That will help to know whether it's a permanent unfixable
> situation or something that could be done eventually.

Xen would need to be made aware of the devices exposed behind the VMD
bridge, so it can manage them.  For example Xen is the entity that
controls the local APICs, and hence interrupts must be configured by
Xen.  Xen needs knowledge about the devices behind the VMD bridge,
and how to access those devices PCI config space to at least configure
MSI or MSI-X capabilities.  It could possibly be exposed similarly to
how Xen currently deals with ECAM areas.

None of this is present at the moment, could always be added later and
Linux be made aware that the limitation no longer applies.  That would
require changes in both Xen and Linux to propagate the VMD information
into Xen.

> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  drivers/pci/controller/vmd.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
> > index 264a180403a0..d9b7510ace29 100644
> > --- a/drivers/pci/controller/vmd.c
> > +++ b/drivers/pci/controller/vmd.c
> > @@ -965,6 +965,15 @@ static int vmd_probe(struct pci_dev *dev, const struct pci_device_id *id)
> >  	struct vmd_dev *vmd;
> >  	int err;
> >  
> > +	if (xen_domain())
> > +		/*
> > +		 * Xen doesn't have knowledge about devices in the VMD bus.
> 
> Also here.

Would you be OK with something like:

"Xen doesn't have knowledge about devices in the VMD bus because the
config space of devices behind the VMD bridge is not known to Xen, and
hence Xen cannot discover or configure them in any way.

Bypass of MSI remapping won't work in that case as direct write by
Linux to the MSI entries won't result in functional interrupts, as
it's Xen the entity that manages the local APIC and must configure
interrupts."

Thanks, Roger.

