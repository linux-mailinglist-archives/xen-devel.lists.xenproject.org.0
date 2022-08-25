Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ED45A0F97
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 13:51:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393331.632210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRBNq-0005wt-AN; Thu, 25 Aug 2022 11:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393331.632210; Thu, 25 Aug 2022 11:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRBNq-0005v8-6R; Thu, 25 Aug 2022 11:50:50 +0000
Received: by outflank-mailman (input) for mailman id 393331;
 Thu, 25 Aug 2022 11:50:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azg/=Y5=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oRBNo-0005v2-VW
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 11:50:49 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28388815-246c-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 13:50:47 +0200 (CEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso4650606pjj.4
 for <xen-devel@lists.xenproject.org>; Thu, 25 Aug 2022 04:50:47 -0700 (PDT)
Received: from leoy-huanghe
 (ec2-54-176-161-147.us-west-1.compute.amazonaws.com. [54.176.161.147])
 by smtp.gmail.com with ESMTPSA id
 o15-20020aa7978f000000b00536aa488062sm8463597pfp.163.2022.08.25.04.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 04:50:45 -0700 (PDT)
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
X-Inumbo-ID: 28388815-246c-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=f6U4ammSmk7a8LknE/FKPUrZWZSZeyaoY6LMD8M2AuQ=;
        b=sTxS4aJAs5ZbNygSe/5NCyx8Os9LZZeBBaIe4iGFVyt7xlFGdOt9yrim8PBPZsQQQq
         S2dY4D7WLcnRrAd2dOs1NmgrpLeQGkpBgHVNnEz3XelIsA/Ed+H8Y81p/0ZuhoWN/+By
         NhlEcbQ4nCthLhL9w4P0/5neKkl1QDxqysg5KVwX5H7p+FnKhR3xLTHr9Gz/klXRMLVJ
         32ov/FxMWoO1FFvWnU2hjrIiH261HqR0fx+VAfkY4NLGCxYAuLgP5kTdoKWDZq9Yxznc
         z3KQl8xPzKOsSQRhRyunBrhFVbaHnKCFoiljAzLfDGsGRGCIL0jH2h+uXPIuiyL5lqnv
         b1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=f6U4ammSmk7a8LknE/FKPUrZWZSZeyaoY6LMD8M2AuQ=;
        b=hNIvSJwPJvnRo7XeWwj6a/aydcyFnEFmegvCeOqwvY8lKuVltN7890JFN5hPwWV8hi
         WtpM98mXBeh46Qmhet3a/JBQwTkOlZyQ+x+fpsNfF2XrSqJFCxLaiMimX5QGq03l2PXx
         bZIkG7He7Iblft83I4NtwTKxYUh0hnDXiOro89O6XypW7fgqLSER14QsfZs7hKMRr4Xh
         HFKbMix4/idQFYuTy8PY9tkb40qzpg1Jpa+Sxoev1p1i/Pl6Q4dFIvvUvv2273YrAjAr
         AOCv2eWJrdATA5EtRUafWZMpTIP1g7aetYdY8J0DnhGIJxPnfxG9McaNvvEYWC7gwMSu
         FPMw==
X-Gm-Message-State: ACgBeo14G+dxqUgDiNTmmXufFBdJgpNdfN8YCD7wIkUIodX5e0mS7BCc
	xMtO6XL8p8jZW2+Ce2oP2fCrpQ==
X-Google-Smtp-Source: AA6agR4ZvRRlyiaivdt6hGkSvLwVGJPP+UGM9W2sbJ2wtHEPVdD8BRdB6kQZPAUzMWDFZ0Hs4WGcyw==
X-Received: by 2002:a17:902:d4c9:b0:172:f480:bdd with SMTP id o9-20020a170902d4c900b00172f4800bddmr3402683plg.170.1661428246047;
        Thu, 25 Aug 2022 04:50:46 -0700 (PDT)
Date: Thu, 25 Aug 2022 19:50:38 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Julien Grall <jgrall@amazon.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Message-ID: <YwdiDr2uLXGEl2TC@leoy-huanghe>
References: <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
 <CAMj1kXEDxHC6RgKfcmpXGDxwQ0mTKG146D8dJnrwJ1cWWXZ=3g@mail.gmail.com>
 <Yv4DMuQHbGNhqAP4@leoy-yangtze.lan>
 <CAMj1kXHkWH7tkpuPLLjWszOVTQ-Cr3Zcbj8w0bogSd0Y_hso0g@mail.gmail.com>
 <99e460f1-ca5f-b520-69e0-b250915fd591@xen.org>
 <Yv5fii2GvIeHEHZX@leoy-yangtze.lan>
 <CAMj1kXGZ0ThmPT2FU4M07waB=Q9tXxs81TGTysV5dG5fm0D0Gw@mail.gmail.com>
 <871qtcsacd.wl-maz@kernel.org>
 <Ywcr1849LiEHezd3@leoy-huanghe>
 <12a8c169-55aa-5e9f-19f8-acd77ea2a8fe@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12a8c169-55aa-5e9f-19f8-acd77ea2a8fe@xen.org>

On Thu, Aug 25, 2022 at 10:07:18AM +0100, Julien Grall wrote:

[...]

> > Xen directly passes ACPI MADT table from UEFI to Linux kernel to Dom0,
> > (see functions acpi_create_madt() and gic_make_hwdom_madt()), which
> > means the Linux kernel Dom0 uses the same ACPI table to initialize GICv3
> > driver, but since Linux kernel Dom0 accesses GIC memory region as IPA,
> > it still trap to Xen in EL2 for stage 2 translation, so finally Xen
> > can emulate the GICv3 device for Dom0.
> 
> In the default setup, dom0 is also the hardware domain. So it owns all of
> the devices but the ones used by Xen (e.g. interrupt controller, SMMU).
> 
> Therefore, dom0 will use the same memory layout as the host. At which point,
> it is a lot more convenient to re-use the host ACPI tables and rewrite only
> what's necessary.

We cannot purely talk about interrupt handling without connecting with
device driver model.

Seems to me, to support para virtualization driver model (like virtio),
Dom0 needs to provide the device driver backend, and DomUs enables
the forend device drivers.  In this case, the most hardware interrupts
(SPIs) are routed to Dom0.

To support passthrough driver model (VFIO), Xen needs to configure the
hardware GICv3 to directly route hardware interrupt to the virtual CPU
interface.

But here I still cannot create the concept that how GIC RD tables play
roles to support the para virtualization or passthrough mode.

Thanks,
Leo

