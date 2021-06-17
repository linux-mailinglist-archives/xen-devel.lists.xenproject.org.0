Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FE83AAC67
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 08:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143695.264731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltlZn-0001yK-4r; Thu, 17 Jun 2021 06:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143695.264731; Thu, 17 Jun 2021 06:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltlZn-0001vV-1W; Thu, 17 Jun 2021 06:32:31 +0000
Received: by outflank-mailman (input) for mailman id 143695;
 Thu, 17 Jun 2021 06:32:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3wh=LL=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1ltlZl-0000uz-UN
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 06:32:30 +0000
Received: from mail-il1-x130.google.com (unknown [2607:f8b0:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb68ce8f-68ba-47f5-88f7-095c4c4af3f3;
 Thu, 17 Jun 2021 06:32:24 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id b9so4482162ilr.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jun 2021 23:32:24 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id r11sm2295272ilm.23.2021.06.16.23.32.22
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 23:32:22 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id s19so1916544ioc.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jun 2021 23:32:22 -0700 (PDT)
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
X-Inumbo-ID: eb68ce8f-68ba-47f5-88f7-095c4c4af3f3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IqsCA/yjikDS1aCYzllqiH9HoLVcQQhYIn5qSeonABE=;
        b=kDczImboY2eVAJ3+sYnRR25HrludaTlIxUHPV26t7zvADYlkn+EAot8vmNZFxS6ckk
         NyqXP6vgSOkhkXMigW38BKTSHGkozev95CT8sd0RyYFWHSEXQf1vzK9yA5xbK5UPbuEq
         Bn0NNhaz+a2zeBhstpYyx1baPQ8VKdD07y9nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IqsCA/yjikDS1aCYzllqiH9HoLVcQQhYIn5qSeonABE=;
        b=IhmNtFX1tIwU9tbSPxClx+seC0UWS8Jlll/Eu/2WdAwKArfgEjFety40FZZwZZuVzM
         4+q6C1sLow3SarBekhxnGj89u6b4uBGnNNzRvCtgbLfKEE/zeoFbtCCjY3NbAdt0OUCm
         lGQ/OHfdPzlwJyL7eLl/z869DYGdCLfKph6KK4GocHzhYxrDbPTSw1bK3Z2ktou0t03n
         bYWjHymvY7RD+BNG2AcOPqQ2s2f135fRPclxfbbfMY+KsbLGqyPI8HUVTBbWGKD5T7uQ
         C23T+iw8hhhouVofX37ABH2FgZfHVNKrJs2h1UqAT3I+ILz7zZzqAe9hQ1j0t4+tSZwh
         +jTw==
X-Gm-Message-State: AOAM532/nbPIbBZEJtptneu6uaJwsv+f4R85M9N60d8nUC0RE0o6YE89
	551uXtkFAzo98ubqAcV8MwsTCdwQ1wNCgQ==
X-Google-Smtp-Source: ABdhPJy+Ylvb07m6VZSwygcUX6MU05B4tTk3aXHsBN0R3Jdor4+k4Db742QIvSVsg7bzEzOuXW9mSg==
X-Received: by 2002:a05:6e02:1e0d:: with SMTP id g13mr2504706ila.178.1623911544015;
        Wed, 16 Jun 2021 23:32:24 -0700 (PDT)
X-Received: by 2002:a92:c852:: with SMTP id b18mr352877ilq.18.1623911531698;
 Wed, 16 Jun 2021 23:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210617062635.1660944-1-tientzu@chromium.org>
In-Reply-To: <20210617062635.1660944-1-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 17 Jun 2021 14:32:00 +0800
X-Gmail-Original-Message-ID: <CALiNf2_qF7OY0LHToNYx0E79BWMt2n7=nepPPLf+7YV3=KFEyw@mail.gmail.com>
Message-ID: <CALiNf2_qF7OY0LHToNYx0E79BWMt2n7=nepPPLf+7YV3=KFEyw@mail.gmail.com>
Subject: Re: [PATCH v13 00/12] Restricted DMA
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

v13: https://lore.kernel.org/patchwork/cover/1448001/

