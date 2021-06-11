Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 909763A459D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 17:41:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140537.259639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrjHN-0002uw-1Z; Fri, 11 Jun 2021 15:41:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140537.259639; Fri, 11 Jun 2021 15:41:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrjHM-0002sA-U4; Fri, 11 Jun 2021 15:41:04 +0000
Received: by outflank-mailman (input) for mailman id 140537;
 Fri, 11 Jun 2021 15:41:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9xgm=LF=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lrjHL-0002s4-V5
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 15:41:04 +0000
Received: from mail-qt1-x836.google.com (unknown [2607:f8b0:4864:20::836])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cdbc737-169c-45cb-99a1-c07902716ef5;
 Fri, 11 Jun 2021 15:41:03 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id z4so2899814qts.4
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jun 2021 08:41:03 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176])
 by smtp.gmail.com with ESMTPSA id f19sm4870665qkg.70.2021.06.11.08.41.02
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 08:41:02 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id z4so2899768qts.4
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jun 2021 08:41:02 -0700 (PDT)
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
X-Inumbo-ID: 3cdbc737-169c-45cb-99a1-c07902716ef5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AzuwWZVb0hvYDmhYzyjXOdcnRd7gmJwLqOExosCeDwM=;
        b=IRqkW7akj902Qmh2dpTJs35MbbbyYdNh845FqGa90ZgwGlX/fY4AEM0E2Tq/OkUGrx
         VVpf/9sUsDrF+Qmi4N27tWzf7jckOIK7UvGuS34GnQEYg0G4BU1Idcj7Q7ryrjHTdpBh
         ql1llzJVDf1YUXhBMlreUDeIOuUDsqa6G9X1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AzuwWZVb0hvYDmhYzyjXOdcnRd7gmJwLqOExosCeDwM=;
        b=aMO1oY8LNC4KJQD42BQ5HzKnJI6lhnRbzdDnHBDw33Km9a6tM6+Ghqq3F00f3vNtTJ
         2CFIxm6w6YpMKSHrhwJQfbqRyXLSZ0kmBV3ci8LDNXVfjFewpSapC+tPks1Cp2I+4FS2
         FEjnC/Xqz+6Rabf5lyHllFlYAkLX5n7DEPZ51Ehtd7B2Aq0MPSRD6fd4c8SpyPMh2Bar
         TMkZ23V97yVSzZvDYSFP/tDjeSOyDvtkijJqJBPAql+5jIsxgJazfdhEWLR90bV5AtH3
         PRskLDCDofo3QlvAkR0QPeocmltXYYhYJql/mC+hR/DsEKe08SdGCoV+HRufwKfzDcen
         H+uw==
X-Gm-Message-State: AOAM531tQDQ/36RdzYS5yV6WsURygEURYW8Fl4JhAa+JpBT9zb2kqQxc
	e71YBquflgUlNoJ4riBtneMZmFX9sQzKAg==
X-Google-Smtp-Source: ABdhPJy+K/e9SZ+PNHtiIxoPlJOyjvO1tUHXGgRmgFdTtjZn0JZczckspo7kuHeWZa797rdjjJuS1A==
X-Received: by 2002:ac8:7699:: with SMTP id g25mr4327188qtr.309.1623426062931;
        Fri, 11 Jun 2021 08:41:02 -0700 (PDT)
X-Received: by 2002:a05:6638:e81:: with SMTP id p1mr4464281jas.84.1623425710461;
 Fri, 11 Jun 2021 08:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210611152659.2142983-1-tientzu@chromium.org> <20210611152659.2142983-7-tientzu@chromium.org>
In-Reply-To: <20210611152659.2142983-7-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 11 Jun 2021 23:34:59 +0800
X-Gmail-Original-Message-ID: <CALiNf28OT2L1qcH4dKK8mb0=uCyaKDHW7r=LrC9MTJw0PSzSbw@mail.gmail.com>
Message-ID: <CALiNf28OT2L1qcH4dKK8mb0=uCyaKDHW7r=LrC9MTJw0PSzSbw@mail.gmail.com>
Subject: Re: [PATCH v9 06/14] swiotlb: Update is_swiotlb_active to add a
 struct device argument
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com, jgross@suse.com, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org, paulus@samba.org, 
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

I don't have the HW to verify the change. Hopefully I use the right
device struct for is_swiotlb_active.

