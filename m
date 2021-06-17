Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F893AACB6
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 08:49:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143711.264742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltlpo-0003fH-JG; Thu, 17 Jun 2021 06:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143711.264742; Thu, 17 Jun 2021 06:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltlpo-0003d3-Fq; Thu, 17 Jun 2021 06:49:04 +0000
Received: by outflank-mailman (input) for mailman id 143711;
 Thu, 17 Jun 2021 06:49:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3wh=LL=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1ltlpn-0003cx-9t
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 06:49:03 +0000
Received: from mail-pl1-x634.google.com (unknown [2607:f8b0:4864:20::634])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32eff0be-56c6-4a8a-936c-0ce81a5f744b;
 Thu, 17 Jun 2021 06:49:02 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id x10so2413863plg.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jun 2021 23:49:02 -0700 (PDT)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com.
 [209.85.215.169])
 by smtp.gmail.com with ESMTPSA id o34sm759154pgm.6.2021.06.16.23.49.01
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 23:49:01 -0700 (PDT)
Received: by mail-pg1-f169.google.com with SMTP id e22so4125998pgv.10
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jun 2021 23:49:01 -0700 (PDT)
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
X-Inumbo-ID: 32eff0be-56c6-4a8a-936c-0ce81a5f744b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IqsCA/yjikDS1aCYzllqiH9HoLVcQQhYIn5qSeonABE=;
        b=GiFPgetacPTJVsGZ3MFWgSvQPnCdoTJhc4FxcdhnTR1mIKLWNYkC5qsclOh1Nu4T0t
         2JBHLcEHEvZiTaAAwPJzRshEva/oe1afpxIyCNXuS6Yc5SEiWBAid4ULBNFnG08bi+4b
         5Y3w62S7YQM/biDmcuEcWF0r86zBUuRahetbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IqsCA/yjikDS1aCYzllqiH9HoLVcQQhYIn5qSeonABE=;
        b=mPWP1Kc2tL77A8f7hWt5yRVzjRAMHN689evo9lxfp8Mjyne7cPNWGC7lgxauIGLB5Y
         X+otdIYTnEMjD88glFo9JHmaxt36LaL6IJK1TCxuAWjsmMqvyNuH82+MzOc9i4/tb/2v
         6P26uQI/3fvMVKFyG3sOEwW/ZmIzgai05eaH3fhL1P2PAzqNbxiT9tApK+akp7wnD8bo
         sL0E9g9Iz54qUmuzeQgxD/GjgH90tXtjvFKhsFixzow9ePU7NIPILgOS0WaKP+//RHAG
         YdDwhQvZhuyuz8mgNUihSQ3CFRIHAo3p98R6Y/qtoSzx5IYaAD3+TUFEqC9vY+Qy8/4b
         2Nqg==
X-Gm-Message-State: AOAM533vRMOEhYFlOZFFiHSUGHricsW4ZEsRWJMK6gvfKyux7d/YdYdl
	mKckziAImTfsg+SuXuD2jzrxWp+VB7Fung==
X-Google-Smtp-Source: ABdhPJxJXQ84cUseu++86IpuRVDPr4p/6SI3aPiykIMrIlz8fLyXTyibCL6Gcu8XdqmmrDvw5SfHhQ==
X-Received: by 2002:a17:90a:6e4d:: with SMTP id s13mr3944782pjm.29.1623912541680;
        Wed, 16 Jun 2021 23:49:01 -0700 (PDT)
X-Received: by 2002:a05:6602:2344:: with SMTP id r4mr2559955iot.69.1623912068770;
 Wed, 16 Jun 2021 23:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210616062157.953777-1-tientzu@chromium.org> <20210616120837.GA22783@willie-the-truck>
In-Reply-To: <20210616120837.GA22783@willie-the-truck>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 17 Jun 2021 14:40:57 +0800
X-Gmail-Original-Message-ID: <CALiNf28SSxhs_+9Oq=pyOc7OWWDyWrtZLUqXKQKin6dRyXwo=w@mail.gmail.com>
Message-ID: <CALiNf28SSxhs_+9Oq=pyOc7OWWDyWrtZLUqXKQKin6dRyXwo=w@mail.gmail.com>
Subject: Re: [PATCH v12 00/12] Restricted DMA
To: Will Deacon <will@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>, 
	Frank Rowand <frowand.list@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	boris.ostrovsky@oracle.com, jgross@suse.com, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, benh@kernel.crashing.org, paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, sstabellini@kernel.org, 
	Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com, xypron.glpk@gmx.de, 
	Thierry Reding <treding@nvidia.com>, mingo@kernel.org, bauerman@linux.ibm.com, 
	peterz@infradead.org, Greg KH <gregkh@linuxfoundation.org>, 
	Saravana Kannan <saravanak@google.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
	heikki.krogerus@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Dan Williams <dan.j.williams@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	linux-devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org, 
	Nicolas Boichat <drinkcat@chromium.org>, Jim Quinlan <james.quinlan@broadcom.com>, 
	Tomasz Figa <tfiga@chromium.org>, bskeggs@redhat.com, 
	Bjorn Helgaas <bhelgaas@google.com>, chris@chris-wilson.co.uk, 
	Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, 
	Jianxiong Gao <jxgao@google.com>, joonas.lahtinen@linux.intel.com, 
	linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	matthew.auld@intel.com, rodrigo.vivi@intel.com, 
	thomas.hellstrom@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

v13: https://lore.kernel.org/patchwork/cover/1448001/

