Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9473AD76E
	for <lists+xen-devel@lfdr.de>; Sat, 19 Jun 2021 05:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145054.266922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luRto-0004a1-2G; Sat, 19 Jun 2021 03:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145054.266922; Sat, 19 Jun 2021 03:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luRtn-0004YB-Ta; Sat, 19 Jun 2021 03:43:59 +0000
Received: by outflank-mailman (input) for mailman id 145054;
 Sat, 19 Jun 2021 03:43:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oaj8=LN=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1luRtm-0004Xt-Az
 for xen-devel@lists.xenproject.org; Sat, 19 Jun 2021 03:43:58 +0000
Received: from mail-pg1-x529.google.com (unknown [2607:f8b0:4864:20::529])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26e4112f-df9f-4006-ad8f-b7d2ab53ecef;
 Sat, 19 Jun 2021 03:43:57 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id t9so9439410pgn.4
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jun 2021 20:43:57 -0700 (PDT)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com.
 [209.85.215.180])
 by smtp.gmail.com with ESMTPSA id j79sm52780pfd.172.2021.06.18.20.43.55
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 20:43:56 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id e20so9482427pgg.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jun 2021 20:43:55 -0700 (PDT)
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
X-Inumbo-ID: 26e4112f-df9f-4006-ad8f-b7d2ab53ecef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zO5LL7Owrsk50u85z5NQdq/+aN2FoxcpBADlxiwbwtc=;
        b=GoMVApQGRvRIO7blwwZSLVX7KnEaLUsgQiZnYGnQ8mp+79muo9lTEuES+H8kLhS8xC
         djxEq6nvfo+uAAf09DzdZIJgtSBquVbHx1Yy7Zj9ycZDtCn5PRIixQGHzFvC0S0QErMk
         dzuQb1UZyozHrgC7e811z9kAB0L/tg8WkvJDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zO5LL7Owrsk50u85z5NQdq/+aN2FoxcpBADlxiwbwtc=;
        b=XrbtClHVJOUB549XSeUBsyIs+uQznKlW3gRLKT5T0fhkXVMD9TVq6PX4ZR1AL9j1rR
         2pTGe4xOpMfN1VnUW8Q+YfMbSl/VILx0KQQn/MPRxT5U0QRpZY1MOijH99mWvcgeyU8e
         TcNd17PrcyPQOZ6d4hV4vy6ip9sS6SQLY02aRgObFXBfDs3ik6QzhD8sitbeflIi1qV+
         gwnTISxe5SjGQ/A+kny9W3SsmtYrwJxFOQ+RIp0s3Y5wS4nxZt7cxk23V5L/3qTeW/68
         JWdIKIzmiw4oSb5JRNsdOE1C+cWIiYGQJ6ViWDI/VY/oWZvHNJGZaDipVrX2C6+vOEa0
         sW0g==
X-Gm-Message-State: AOAM532HJN7Xugjx1VQUnT/m0pZlZITJVv0c7HqfyL6/C3yIQbLGE8af
	ktI0SfptlVQYCEYUX87qSD8kylEQuRYrIQ==
X-Google-Smtp-Source: ABdhPJwyjQuHqdCFbb/37uFSKWTZPN3jb0/AjmQtlyH/x8QlRWaFaOM4u7arFkyUE6gq0MVTdZ2RWw==
X-Received: by 2002:aa7:9578:0:b029:2e9:dec0:bef4 with SMTP id x24-20020aa795780000b02902e9dec0bef4mr8262908pfq.29.1624074236736;
        Fri, 18 Jun 2021 20:43:56 -0700 (PDT)
X-Received: by 2002:a05:6602:50:: with SMTP id z16mr10626949ioz.155.1624074224014;
 Fri, 18 Jun 2021 20:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210617062635.1660944-1-tientzu@chromium.org> <CALiNf2_qF7OY0LHToNYx0E79BWMt2n7=nepPPLf+7YV3=KFEyw@mail.gmail.com>
In-Reply-To: <CALiNf2_qF7OY0LHToNYx0E79BWMt2n7=nepPPLf+7YV3=KFEyw@mail.gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Sat, 19 Jun 2021 11:43:33 +0800
X-Gmail-Original-Message-ID: <CALiNf289bo1WzEWWapzeQ8xYiH8s1qgDkpHVgy=PgAmv6rvGnQ@mail.gmail.com>
Message-ID: <CALiNf289bo1WzEWWapzeQ8xYiH8s1qgDkpHVgy=PgAmv6rvGnQ@mail.gmail.com>
Subject: Re: [PATCH v13 00/12] Restricted DMA
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com, jgross@suse.com, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org, paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com, 
	xypron.glpk@gmx.de, Thierry Reding <treding@nvidia.com>, mingo@kernel.org, 
	bauerman@linux.ibm.com, peterz@infradead.org, 
	Greg KH <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, heikki.krogerus@linux.intel.com, 
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

v14: https://lore.kernel.org/patchwork/cover/1448954/

