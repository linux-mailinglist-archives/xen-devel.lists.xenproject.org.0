Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA80F367C67
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 10:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115184.219646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZUZu-0004cr-DX; Thu, 22 Apr 2021 08:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115184.219646; Thu, 22 Apr 2021 08:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZUZu-0004cS-AE; Thu, 22 Apr 2021 08:20:50 +0000
Received: by outflank-mailman (input) for mailman id 115184;
 Thu, 22 Apr 2021 08:20:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PqrU=JT=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lZUZs-0004cI-IK
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 08:20:48 +0000
Received: from mail-qk1-x732.google.com (unknown [2607:f8b0:4864:20::732])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50fd9557-4f90-4ffb-8a04-f157f2f225b8;
 Thu, 22 Apr 2021 08:20:47 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id e13so35667318qkl.6
 for <xen-devel@lists.xenproject.org>; Thu, 22 Apr 2021 01:20:47 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com.
 [209.85.222.182])
 by smtp.gmail.com with ESMTPSA id r25sm1798154qtm.18.2021.04.22.01.20.46
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 01:20:46 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id s5so36729991qkj.5
 for <xen-devel@lists.xenproject.org>; Thu, 22 Apr 2021 01:20:46 -0700 (PDT)
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
X-Inumbo-ID: 50fd9557-4f90-4ffb-8a04-f157f2f225b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BktECYBH/xHVGxDXNo4Rc6r/8IEdgyWc2mDrQ18gIJM=;
        b=BC2Z7dWmz0+RdT/XQKgh1K4ZkXJWhtVP5f0aeqau16cKa9TxEulrDttNm/OJj6Mh7t
         UyOvttg8zei2cv/nltxGkE0p3bcuSz0WfMCJrDJbCm50bzbAxl15NHtEWBdONDfWW0Bm
         8ytbqnnr0G3b0l9nz1ILNC8uPEz+czqvEKbV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BktECYBH/xHVGxDXNo4Rc6r/8IEdgyWc2mDrQ18gIJM=;
        b=J5KA5OO33ajOwKgnVWyODa1KTuJRiM/L71+d85AWlMurGS+J7IKV2lXTtnYYfyT2ur
         ylpSrplEWl4YEIgmCvoEVTeGExbQDoAgP72T7tqXleirmsvWUa5hl3bpiC0VpzyZ99RI
         8VuqTAgohaTBk1dCUfrw9BoiTsAWtJY80cShyOXB4yICtCbtKaKItwtrGF7fCte9hfjx
         hAuB4eWiqHZwcIse1sGsqQFBVr+KduIr1EKiLfn+jYA0N8sMOOX0YttovNZrGHHygzEJ
         /8mfU4w5PUVkpNz8ZxqyBSv3m5HpPCJIOM1/CwfksnfkcZr8kE4dk0Io0906TSsWoFOt
         lJjA==
X-Gm-Message-State: AOAM533x2kIKrh9yL9tG7HTsPhblzwrEM3q5H2wCQQewVoeiAXkZB5fK
	2i7VbT0GTff4MMWw/KnccmSq+g4UTa+rNQ==
X-Google-Smtp-Source: ABdhPJwurdcPP2anxwqNwg/agoyPcjhbl8UGY/4kA3kmabbR6mtMBLDl7KbyCyDN9oTusIPhyazV/A==
X-Received: by 2002:a37:658a:: with SMTP id z132mr2456099qkb.28.1619079647064;
        Thu, 22 Apr 2021 01:20:47 -0700 (PDT)
X-Received: by 2002:a05:6638:34a0:: with SMTP id t32mr2134909jal.10.1619079635295;
 Thu, 22 Apr 2021 01:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210209062131.2300005-1-tientzu@chromium.org>
In-Reply-To: <20210209062131.2300005-1-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 22 Apr 2021 16:20:24 +0800
X-Gmail-Original-Message-ID: <CALiNf29cMK_j2NF3sbzMJLsss0v8fcvWMkQULHViQVebmdmTsQ@mail.gmail.com>
Message-ID: <CALiNf29cMK_j2NF3sbzMJLsss0v8fcvWMkQULHViQVebmdmTsQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] Restricted DMA
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
	Nicolas Boichat <drinkcat@chromium.org>, Jim Quinlan <james.quinlan@broadcom.com>
Content-Type: text/plain; charset="UTF-8"

v5 here: https://lore.kernel.org/patchwork/cover/1416899/ to rebase
onto Christoph's swiotlb cleanups.

