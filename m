Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C814C5A0ADC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 09:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393117.631865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7m0-0006lR-S4; Thu, 25 Aug 2022 07:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393117.631865; Thu, 25 Aug 2022 07:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7m0-0006jY-OX; Thu, 25 Aug 2022 07:59:32 +0000
Received: by outflank-mailman (input) for mailman id 393117;
 Thu, 25 Aug 2022 07:59:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azg/=Y5=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oR7m0-0006QW-1T
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 07:59:32 +0000
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8e550ac-244b-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 09:59:30 +0200 (CEST)
Received: by mail-pf1-x42b.google.com with SMTP id y141so18939587pfb.7
 for <xen-devel@lists.xenproject.org>; Thu, 25 Aug 2022 00:59:30 -0700 (PDT)
Received: from leoy-huanghe
 (ec2-54-219-84-159.us-west-1.compute.amazonaws.com. [54.219.84.159])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a62520f000000b00537a6c78ef1sm8237pfb.190.2022.08.25.00.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 00:59:28 -0700 (PDT)
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
X-Inumbo-ID: d8e550ac-244b-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=8cPd58fdF3BRGtoM3aKoXRGgpUDR5p/UVDEMSS73694=;
        b=AhrdBJA6WLLXtz7SNL9Qkn+F3+h3ZHu9KpeCjQm0QimcBxOr0nRgPRdPJVK4zwxvBZ
         fj6PszZfx5IlNLKMtezUUuVfCVLY1Bs9u/BcKTOsXVysNeWokBNwcUChSrPSvqexIiVC
         NnmTjVVeulKa4rS0BK7ELIjpEo0QSpbhEQynClGildiZgjIlglaJVDARZEawhHRzgwgO
         BG5Lm2sNk7qXDfwz/jJ8JAA8BsvmcXGeX/Oczbhi1g8edk/lnTvoWIRSjWwl8A325MbY
         eUXpV7l7Kg+yG4q6NV6FzXXMxAR6YX8/gWy/Tm6hLVTbtcyiBc5kaHlZ/TFwUPIc6O/b
         R64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=8cPd58fdF3BRGtoM3aKoXRGgpUDR5p/UVDEMSS73694=;
        b=7s/aTwzHD0GV6eygmYrWTbVNW8XoTQKyBbhPwL0zg/e8HRHOqYxHjx8jP0GFgfFepq
         nozHhWYfIXsE6O8m/J/zrpCFEOFA9jHrnVn8EkZHS68Mxuewq8jsXeV+zYw/ayI0HDsw
         OBiUAuZz91qWcgQmXyWBc+n+0Q5UwYiw97ILnC9587nxwElFK5ASo12w3G90KWQw1MT3
         nppCPCl/ruwqvU1VAths1UB/4Tq5DNrOf0+R8Lu3tLf+1R+5ZM4y3c3fpJVX/ls8dVVq
         ZZmkHqX52tFUqR6Y+eqszjCMT7E7wbEjgcQCAhtOFj1VWauu6fKKqaWiHkikXtdqvVtw
         hqqA==
X-Gm-Message-State: ACgBeo2biWYWOvlJtA0Jbqs4j+XPpKWcP6O5L986b+TN+21ZeHFc6Kbp
	GO1F5CqQvaOdPDkIZZtJffG6bw==
X-Google-Smtp-Source: AA6agR4hoFzYMfOwaaYdkJKDUHUdrlJ89qSeX86OSkaM1lPS65DCjMhywDBo3x2Se6E7RhqrReYI2A==
X-Received: by 2002:a63:e011:0:b0:42a:1c12:17a9 with SMTP id e17-20020a63e011000000b0042a1c1217a9mr2232450pgh.557.1661414369130;
        Thu, 25 Aug 2022 00:59:29 -0700 (PDT)
Date: Thu, 25 Aug 2022 15:59:19 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Julien Grall <jgrall@amazon.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Message-ID: <Ywcr1849LiEHezd3@leoy-huanghe>
References: <20220817105720.111618-1-leo.yan@linaro.org>
 <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
 <CAMj1kXEDxHC6RgKfcmpXGDxwQ0mTKG146D8dJnrwJ1cWWXZ=3g@mail.gmail.com>
 <Yv4DMuQHbGNhqAP4@leoy-yangtze.lan>
 <CAMj1kXHkWH7tkpuPLLjWszOVTQ-Cr3Zcbj8w0bogSd0Y_hso0g@mail.gmail.com>
 <99e460f1-ca5f-b520-69e0-b250915fd591@xen.org>
 <Yv5fii2GvIeHEHZX@leoy-yangtze.lan>
 <CAMj1kXGZ0ThmPT2FU4M07waB=Q9tXxs81TGTysV5dG5fm0D0Gw@mail.gmail.com>
 <871qtcsacd.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871qtcsacd.wl-maz@kernel.org>

On Fri, Aug 19, 2022 at 01:10:10PM +0100, Marc Zyngier wrote:

[...]

> > > > In the context of Xen, dom0 doesn't have direct access to the host ITS
> > > > because we are emulating it. So I think it doesn't matter for us because we
> > > > can fix our implementation if it is affected.
> > > >
> > > > That said, kexec-ing dom0 (or any other domain) on Xen on Arm would require
> > > > some work to be supported. OOI, @leo is it something you are investigating?
> > >
> > >
> > > Now I am working on automative reference platform; the first thing for
> > > me is to resolve the kernel oops.
> > >
> > > For long term, I think the kexec/kdump would be important to be
> > > supported, to be clear, so far supporting kexec/kdump for Xen/Linux is
> > > not priority for my work.
> > >
> > > Also thanks a lot for Ard and Mark's replying. To be honest, I missed
> > > many prerequisites (e.g. redistributor configurations for GIC in
> > > hypervisor) and seems Xen uses a different way by emulating GICv3
> > > controller for guest OS.  So now I am bit puzzle what's for next step
> > > or just keep as it is?
> > >
> > 
> > If i understand Julien's remark correctly, the dom0 GICv3 is emulated,
> > and so it should not suffer from the issue that we are working around
> > here.

Before proceeding discussion, I would like step back to get clear for
the GIC implementation in Xen, otherwise, it's really hard for me to
catch up the dicussion :)

For me it's clear that Xen emulates GICv3 for DomU, but I am still
confused how GICv3 works for Dom0.

Xen directly passes ACPI MADT table from UEFI to Linux kernel to Dom0,
(see functions acpi_create_madt() and gic_make_hwdom_madt()), which
means the Linux kernel Dom0 uses the same ACPI table to initialize GICv3
driver, but since Linux kernel Dom0 accesses GIC memory region as IPA,
it still trap to Xen in EL2 for stage 2 translation, so finally Xen
can emulate the GICv3 device for Dom0.

This is quite different from DomU.  Xen prepares a DT node for GICv3
rather than directly passing ACPI table, so DomU kernel initializes
GICv3 driver based on the DT binding.

Simply to say, no matter Dom0 using ACPI table or DomU using DT
binding, at the end Xen emulates GICv3 device for all of them.

Another thing is not clear for me is that I can see Xen allocates
redistributor pending page (see gicv3_lpi_set_pendtable()), after Dom0
or DomU kernel boots up, kernel allocates another RD pending page; so
the question is how these two different pending pages co-work
together.

In other words, let's assume the Dom0 kernel panic and its secondary
kernel is launched by kexec, is it necessarily for the secondary
kernel to reuse the primary kernel's RD pending page?  Or in this case
it's no matter for the RD pending page in Dom0 and it's safe for Xen
always maintains its own RD pending page in EL2?

> The problem is that there is no way to distinguish a system that
> suffers from GICR LPI tables being immutable from one that allows the
> LPI configuration being changed (either because the HW allows it or
> because the hypervisor plays other games).

Let me ask a stupid question.  Seems to me, GICR LPI tables can be
configured as below options

- The hypervisor pre-allocates GICR LPI tables and pass the memory
  region info to Dom0 kernel;

- The hypervisor doesn't allocate GICR LPI tables, and then Dom0
  kernel allocates GICR LPI tables for the virtual GICv3, and Dom0
  directly write data to the GICR LPI tables and the table is used by
  physical GICv3;

- The hypervisor pre-allocates GICR LPI tables for phycial GICv3 and
  Dom0 kernel allocates another GICR LPI tables for virtual GICv3,
  and Xen needs to sync between these two tables.

To be clear, all of above three options are hypothesis.  So please
correct me if anything is wrong (or even total are wrong?!).

Thanks a lot for suggestions!

Leo

P.s. sorry for truncating Marc's following comments, just want to
focus on above questions.

