Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5823A2A333
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 09:33:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882559.1292705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKK-0001jU-Vi; Thu, 06 Feb 2025 08:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882559.1292705; Thu, 06 Feb 2025 08:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKK-0001bd-P8; Thu, 06 Feb 2025 08:33:36 +0000
Received: by outflank-mailman (input) for mailman id 882559;
 Thu, 06 Feb 2025 08:33:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEyC=U5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tfxKJ-0001Q7-1n
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 08:33:35 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cdbfde0-e465-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 09:33:34 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-21f2339dcfdso9201875ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 00:33:33 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f368da60bsm7040865ad.258.2025.02.06.00.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 00:33:31 -0800 (PST)
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
X-Inumbo-ID: 0cdbfde0-e465-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738830812; x=1739435612; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zFa4VDutdaAqwxVE7IcEmL8yhkUm6WYSGjjVCCVP30o=;
        b=CK8/lc8Efv/GqLfY+XS/c5ntDhDIG0uIOdwOb59NLZT4h2kBgeAaT7o3QNqH6HiL2h
         h1M+O8z9N3fwULRDYt2snSZcx8AvydZnPVHAJyPRv8eFRL/XM05TYcGGa1ZiY/XQI/vF
         sr7vf1B8RhEKChEfP7WXKwjzDnto89i/YNJlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738830812; x=1739435612;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFa4VDutdaAqwxVE7IcEmL8yhkUm6WYSGjjVCCVP30o=;
        b=BqodOtlm9vIlimWDbaCM6zRYjhRkiNN9fooMOxA67imhflz7T2eJCGAF+Cts/mLJ6d
         uT0TLWbiMY4OtgNszeBdoU4rWrRq8377gzKntIEhoTFCABuGndsGWmuOpLm+L4st9rlA
         7qXmCTXbEF/5aETIaXlkAoSn8mf3DcSW7rNdlkGS31QXzj0s4xIpsZemBCngTXbfNN4a
         P2MhdygiJqERwSzc3pVRiqJNI0hQ0Gf3fetBBTrwRYxOV2/JTsucud5S4rFl2InxMHoj
         BJbvnSRg+sKTiBbJtUjnMENuoN6qCGfboRaXzyN/BtXx0HFJkMUIZ99JC+S28Cc69pxp
         g8Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXU5mm59UZj81crODCfyrd5B0p1E5uBMVR1L5wpnrU7BgxYWYihO5qeCtnvcIkBJwdBwBMZ0Vrp+5Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjoP5mh1uSSKu3w8lFplkGmAmKYRlEry/9NftxY1YocQANaQxh
	ZkxXcmelkbh63rcKPb8bjb24lg0oRwkjlD0nx+upXkWNrX/9ltVu9uLmYjL9Q7o=
X-Gm-Gg: ASbGnct9JjKjBt/hrO5nPtRSkuW7mfMW9TaMPpRaTaZ3JEvj1mb10BK5aiwZrNBAxW3
	zWiWJzgG5vOEMYXxKyv+jGlwwpoacg/Jr+IbsVFKMJ2WgSRt/Tvd+YOW5iLRggZyczap21rAhjL
	ZM+OhGcq8kX8Y3cxmEB5KUozLLrSQzFxHexnfIPUfFz96oCeOE12/X0v1z+ds+Z1qDvPkteeydO
	xy3417cWk74E2FPHqSSNxOW9OBJh8BIf+4Yfg0l562pCyKNqq3XnYdTEuq7WrZwejFjBXbFkHWB
	N3ivtEChLbN2PA9D+3AC
X-Google-Smtp-Source: AGHT+IF+K06oAWXkF0s7xGk9CXHkZ3d4umQ124gCDvUWBbfXf2qnmgVpjF06/0gYCP3LpXrycYtCTg==
X-Received: by 2002:a17:902:e80a:b0:215:6c5f:d142 with SMTP id d9443c01a7336-21f2f1b4759mr41887255ad.20.1738830812389;
        Thu, 06 Feb 2025 00:33:32 -0800 (PST)
Date: Thu, 6 Feb 2025 09:33:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bjorn Helgaas <helgaas@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 3/3] pci/msi: remove pci_msi_ignore_mask
Message-ID: <Z6Rz1o3CnnuUiaoI@macbook.local>
References: <20250114103315.51328-4-roger.pau@citrix.com>
 <20250205151731.GA915292@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250205151731.GA915292@bhelgaas>

On Wed, Feb 05, 2025 at 09:17:31AM -0600, Bjorn Helgaas wrote:
> Please run git log --oneline and match the subject line capitalization
> style, i.e.,
> 
>   PCI/MSI: Remove ...
> 
> But it doesn't look like this actually *removes* the functionality, it
> just implements it differently so it can be applied more selectively.
> 
> So maybe the subject should say something like "control use of MSI
> masking per IRQ domain, not globally"

What about:

PCI/MSI: convert pci_msi_ignore_mask to per MSI domain flag

Which is slightly shorter?

> 
> On Tue, Jan 14, 2025 at 11:33:13AM +0100, Roger Pau Monne wrote:
> > Setting pci_msi_ignore_mask inhibits the toggling of the mask bit for both
> > MSI and MSI-X entries globally, regardless of the IRQ chip they are using.
> > Only Xen sets the pci_msi_ignore_mask when routing physical interrupts over
> > event channels, to prevent PCI code from attempting to toggle the maskbit,
> > as it's Xen that controls the bit.
> > 
> > However, the pci_msi_ignore_mask being global will affect devices that use
> > MSI interrupts but are not routing those interrupts over event channels
> > (not using the Xen pIRQ chip).  One example is devices behind a VMD PCI
> > bridge.  In that scenario the VMD bridge configures MSI(-X) using the
> > normal IRQ chip (the pIRQ one in the Xen case), and devices behind the
> > bridge configure the MSI entries using indexes into the VMD bridge MSI
> > table.  The VMD bridge then demultiplexes such interrupts and delivers to
> > the destination device(s).  Having pci_msi_ignore_mask set in that scenario
> > prevents (un)masking of MSI entries for devices behind the VMD bridge.
> > 
> > Move the signaling of no entry masking into the MSI domain flags, as that
> > allows setting it on a per-domain basis.  Set it for the Xen MSI domain
> > that uses the pIRQ chip, while leaving it unset for the rest of the
> > cases.
> > 
> > Remove pci_msi_ignore_mask at once, since it was only used by Xen code, and
> > with Xen dropping usage the variable is unneeded.
> > 
> > This fixes using devices behind a VMD bridge on Xen PV hardware domains.
> > 
> > Albeit Devices behind a VMD bridge are not known to Xen, that doesn't mean
> > Linux cannot use them.  By inhibiting the usage of
> > VMD_FEAT_CAN_BYPASS_MSI_REMAP and the removal of the pci_msi_ignore_mask
> > bodge devices behind a VMD bridge do work fine when use from a Linux Xen
> > hardware domain.  That's the whole point of the series.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Needs an ack from Thomas.

Thanks, moved him to the 'To:' field.

Regards, Roger.

